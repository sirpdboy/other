'use strict';
'require baseclass';
'require fs';
'require rpc';

var callLuciDescription = rpc.declare({
	object: 'luci',
	method: 'getDescription'
});

var callSystemBoard = rpc.declare({
	object: 'system',
	method: 'board'
});

var callSystemInfo = rpc.declare({
	object: 'system',
	method: 'info'
});

var callCPUBench = rpc.declare({
	object: 'luci',
	method: 'getCPUBench'
});

var callCPUInfo = rpc.declare({
	object: 'luci',
	method: 'getCPUInfo'
});

var callPlatInfo = rpc.declare({
	object: 'luci',
	method: 'getPlatInfo'
});

var callTempInfo = rpc.declare({
	object: 'luci',
	method: 'getTempInfo'
});

return baseclass.extend({
	title: _('System'),

	load: function() {
		return Promise.all([
			L.resolveDefault(callSystemBoard(), {}),
			L.resolveDefault(callSystemInfo(), {}),
			L.resolveDefault(callCPUBench(), {}),
			L.resolveDefault(callCPUInfo(), {}),
			L.resolveDefault(callPlatInfo(), {}),
			L.resolveDefault(callTempInfo(), {}),
			L.resolveDefault(callLuciDescription(), {})
		]);
	},

	render: function(data) {
		var boardinfo   = data[0],
		    systeminfo  = data[1],
		    cpubench    = data[2],
		    cpuinfo     = data[3],
		    platinfo = data[4],
		    tempinfo    = data[5],
		    luciversion = data[6];
		var datestr = null;

		if (systeminfo.localtime) {
			var date = new Date(systeminfo.localtime * 1000);

			datestr = '%04d-%02d-%02d %02d:%02d:%02d'.format(
				date.getUTCFullYear(),
				date.getUTCMonth() + 1,
				date.getUTCDate(),
				date.getUTCHours(),
				date.getUTCMinutes(),
				date.getUTCSeconds()
			);
		}
		var fields = [
			_('Hostname'),         boardinfo.hostname,
			_('Model'),            boardinfo.model + (cpubench.cpubench || ''),
			_('Architecture'),     cpuinfo.cpuinfo || '',
			_('Target Platform'),  (L.isObject(boardinfo.release) ? boardinfo.release.target : '')  + (' - ' + (platinfo.platinfo || '')),
			_('Firmware Version'), luciversion.description || '',
			_('Kernel Version'),   boardinfo.kernel || '',
			_('Local Time'),       datestr,
			_('Uptime'),           systeminfo.uptime ? '%t'.format(systeminfo.uptime) : null,
			_('Load Average'),     Array.isArray(systeminfo.load) ? '%.2f, %.2f, %.2f'.format(
				systeminfo.load[0] / 65535.0,
				systeminfo.load[1] / 65535.0,
				systeminfo.load[2] / 65535.0
			) : null,
		];
		
		if (tempinfo.tempinfo) {
			fields.splice(6, 0, _('Temperature'), tempinfo.tempinfo);
		}


		var table = E('table', { 'class': 'table' });

		for (var i = 0; i < fields.length; i += 2) {
			table.appendChild(E('tr', { 'class': 'tr' }, [
				E('td', { 'class': 'td left', 'width': '33%' }, [ fields[i] ]),
				E('td', { 'class': 'td left' }, [ (fields[i + 1] != null) ? fields[i + 1] : '?' ])
			]));
		}
		return table;
	}
});
