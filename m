Return-Path: <linux-gpio+bounces-29745-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7A4CCC786
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 16:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCB2330C341B
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 15:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C43834886F;
	Thu, 18 Dec 2025 15:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YU2i/jC/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013049.outbound.protection.outlook.com [40.107.159.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E32347FC8;
	Thu, 18 Dec 2025 15:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070676; cv=fail; b=eD/I24nBciCnZRQSw8rNIswxa7wEg6qO5CGepkbiUvHGc0446aGUGy4WRWoifV14bIQy5NRxXWqKkhZBcdRp1mKfYK0ilXAmv5pVJv4VV5IeSw8on870vKIYmKcXm3chhC3iKjCfXQkAbJKp4aNn4+HkqpdS1qyAqxhKyD4DA90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070676; c=relaxed/simple;
	bh=F+SNzhALd0sgmbVrXMmJ2VqwwZmjrMe9qBqFAo0e1So=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Pb08lyrgns91sYuNkaQfr3ShNG5b0NL5iAF/8YFEuUtPHrwUHKuyI5CnPxerDQIfQH9NrVE3HQzFCTx0Izf6cSTNOCwNACc+pq44HRQ4zckyUAME4jVOb1RTn4+uBv+7UNjVuZw/kRM1rIKrcFBlYwwrWP5N59SB2hZ1+PYfrXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YU2i/jC/; arc=fail smtp.client-ip=40.107.159.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GyPFY85DE0CXZOUlNoUQcARfXjfH89FaEZ3L5H3/cHdgi3laYwcxQTEGdlBcgCwywx5m3QcqW9qPwxxsdpjAkRyMZy1e49xJ9+PLuI4OVJBIlfUIqVif8Z82PP4FymFueOUBpPQo4tOFi/te/bw5gb1LojuTZb2DWyjhcK5SRALdsu+J2k9tcvSwi1w8HAQ1s6ha80Brd9jB3gfVdGVzcu+4jl9/SRpcU6zBGBeJSuSksRO/P1mlHAVDdslunaZ1CFc99hhNol3/Pui439FBXaLHBeZXCDgWIrNM49fXxqdRXX/KvccK00WiS2RMMfSCJScBsJOwuwU3JA+gWvz3hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+SNzhALd0sgmbVrXMmJ2VqwwZmjrMe9qBqFAo0e1So=;
 b=HerDTuSS6zdoLLnq8Kpoj8Aoy7QqDbR73aI3dXux6KnVx5T7Tc+m/t2wJ/gd5BRYx6J8NhwonQv4b8ZYbkqqR0qRIr2Ka6B+CydDWA9tDrl9cj+x84MSQ6LPLV8smPSTLz7TpVnIMh4APZkB2LcsZOgHOxUk3UGooRMbYS5io6eZe0aqrchzdHqWdHwoHSTQ24pFHu7IZAsIpD+at5FtKMDOo8bVS26K+9Yx2r11hoSMWA18OwzALoU7mrcHCEa+ZbJV+m6bDR1i1lUKu4B8c8bitRqbDhKMq2oG8nPU1Xbi6SOEaQFLN7WLKyeGnTGTQhaJRR4FFlZ5r/nLIjL6zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+SNzhALd0sgmbVrXMmJ2VqwwZmjrMe9qBqFAo0e1So=;
 b=YU2i/jC/G4ONIQw4ShpOoC0hWE56LbUk/2txdoXcC8RdE/wXRUjHeM774DEWBYsqIITpZf/znWo0AIDl2W/rkJFryhq4Jp+3Rn+rSevJWA0GBb8OxQ+YlVKEPbn8Xnq431qk8c/ghNqPp6/a+cKTdJ+wFuA6lkXYXE0zhyfSGliytlPqruKoSuCqwQVYUmK792H5r9ng0B+rz08zoF3zKXloxp8HpMLDuP42puA6kGAHjQGsjWiFZraehjcssxWk2ks8NSq1c7qJw9rw1Wdd0TspImEDo5K+X5Mb3Ya0u5AWkJRHAZzcsr/pLQNk7Y2y7Zj8kBTcRkRE/SQT4ZpHgQ==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GVXPR04MB10520.eurprd04.prod.outlook.com (2603:10a6:150:1df::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 15:11:08 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 15:11:08 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v6 2/5] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
Thread-Topic: [PATCH v6 2/5] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
Thread-Index: AQHccDCJHcG0egnV0k+g5v+6Xq0Q2g==
Date: Thu, 18 Dec 2025 15:11:08 +0000
Message-ID:
 <PAXPR04MB91856F8FFE868B753A38326189A8A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20251212194341.966387-1-shenwei.wang@nxp.com>
 <20251212194341.966387-3-shenwei.wang@nxp.com>
 <805c9dd5-50ca-4e2f-8fe8-b8a601fe4428@foss.st.com>
In-Reply-To: <805c9dd5-50ca-4e2f-8fe8-b8a601fe4428@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|GVXPR04MB10520:EE_
x-ms-office365-filtering-correlation-id: b0fb131b-f2a5-4e3b-f894-08de3e47ac3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|19092799006|7416014|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?YjZjN3RKeFR5NldQalk5cjRnWEI3SkQ2Z1dUUTh2TG1Wb0tyZlNlQUw2NzNt?=
 =?utf-8?B?VFJ4aGNnOXFLWDBhWjNxMGloaEUrM2NmcElqbEc3Z09zVnFIeW1zWktLUkx3?=
 =?utf-8?B?Y3hHSllLWlBMOHk0dkczVWpuSThkTC94enVYRCtwVFN1NFFtSVJickVqREZi?=
 =?utf-8?B?TU1Yelp6MlIvL0NJcnkyYStXRTdVKzc1SEhmOEx1RGlVRkg0cHBUaG9LNERU?=
 =?utf-8?B?QXhpcnpmQ1FyR2tVbmloQVZ4dGZWQkJYVGdSNVVHUzZUMXdRdFlFODJieFdz?=
 =?utf-8?B?VWJQSDJTN2xFVkZGQjZGWks1SjZia05yb3krbGZOS0VIVGY5K2dwMHpzWVJN?=
 =?utf-8?B?WXdrRTNsSG95alJBbnVvanhpQlIvbTdtejVvTHU2b3lsQ1Y5MUl6RllYSzFh?=
 =?utf-8?B?RVZkMUpnSjlaNDgxcWpGMkVmSHlsR0ZvQmV6elVZMHJaTG5GVllQcmhHbEpI?=
 =?utf-8?B?a1hsUld0aElhWFZ0WWEzWndXWU96T1ZyNnNSQ1o2bDNzQStnaTRaUHg2SmRP?=
 =?utf-8?B?aWtGM1NOdjdFR1lNa1lzQVgzTEp4Y1V1V0s3bkpRYmlTWHh0eGpwcnFGSTJz?=
 =?utf-8?B?cDU4NXhkb2dRc1E2RzQzYVRrQUtQcFRlUWJKdktCbk9IcDZvcm8yQmVOeVVx?=
 =?utf-8?B?TFhBemZUdzZrMm9QR0dReGNWaVdsaVlsVkIyb3orZncza2tENjNoZkpPbU5R?=
 =?utf-8?B?T3diWjhqZFIxeU5aVFpHWXA0NnBlTHBOL0swbWxHTTg5ZHJCNVMvK0N0UkxG?=
 =?utf-8?B?WFRQQzhqRkNqaC9oMFRvOGJCNnJpM0t2VXZOcDFjNFd5UVNHVzh1WEhNTDlP?=
 =?utf-8?B?K09uZ3JnSmJ5WUYvUHBHTkdEdHRQa3lCZUN4TFpMbGYxVEJyVDlCZWlPQmwz?=
 =?utf-8?B?SzJwSTVEL0xVWFFya1RtNEpQMmJ6aHZBMjVzYjhzdEpwMDNnL2RQSUZ0TVlK?=
 =?utf-8?B?Rkt6aDQ0WHVXYUlGRlI4Z0hGQnBRUGFoa3BTNDFTLzJXcWlWQlNVRHBZbVZt?=
 =?utf-8?B?Q083bkQwR1R2MlViRTk3Q29kQzRXQ0srQm9LZGFCWTByZlc2bDFEbHpESVFE?=
 =?utf-8?B?cTFNVHJBSUhycVVBb3EyeHc1Wm5xajNXazVrdGFKdWxSU3Q0Q1pyaDM5YkJp?=
 =?utf-8?B?Sk41em5jTEhBbXlpa0RpT0JzQ1ZVbW1YclJKaFN1djNkQmZoSWdMOTFGZmRP?=
 =?utf-8?B?VFJmUmo5YmhHek1Ka1RSdDBzOSsybHZiZmZIRTUyYmxod2ZXSnR4c3RHOGRz?=
 =?utf-8?B?MW9OdUs0OUFqS1lSUFM0UjdHSDJ0VGREaStTUk9IYUpVMEVEZFA2TUR4Qmda?=
 =?utf-8?B?eHR0dW1SQzBNZ2NPT0o2TEZlK2lhWjFvSUl0UUV3TEhObmZkVW9XZkRGSXJJ?=
 =?utf-8?B?VTkrZzM3a3NVS0RKaE5zSC9KV1N0MWlCUUF5SXh3enFkWjFzejVtaUtWVHR2?=
 =?utf-8?B?SHgwV1lPR1ovY2RIbTIzOHphNjBKbXZDang3dFN5SG40UXJYR2paUEpvQU9Q?=
 =?utf-8?B?Q3ZjYk9acXFTRlFsd2ZQYmk4SjgvMzZMOVE2L0V5Q1JDQS9SVWhIcGxmWTNY?=
 =?utf-8?B?c1RjTmZNMmdIMVp0TWNWUWM3S25obnZRS2ZyMCtzRHlpNjdCZ3pualdhTHhs?=
 =?utf-8?B?UWQ5RjBlZ21qNkZLc3prODlteGRjQy8zdWQ4WVRMMzlwV2N4OGJTS0p2dXVC?=
 =?utf-8?B?RXRZOWdhR0tYUy85eXJRYVl3SWdrY2FmNEdjY1hFM1dzcS94dlo5ZnlVNUEx?=
 =?utf-8?B?N24zRE95V2ZmcXI0UFlVWTZvMUZBV1V2WEdwTFZ3RW0zUm1PbWhucTBjMEo1?=
 =?utf-8?B?ZTBNb1ZFdDlXUEF0K2ZVbHZsMWcyeTVhUlEwN2JadHIvN1JDazFlRDlKNE9t?=
 =?utf-8?B?VndtaVduZFIzSCtHYTAya0x3aXU1dFBhWWh3R2lUVEtsVlVzYU1ycDJ2NG1t?=
 =?utf-8?B?enBEUlNZNHVXbVFjNGNFZlpVTFhXenR5RGlCTWZJc041MEFZZjhzUEt6L0k2?=
 =?utf-8?B?aDN5UUYvTzdOS0d1UzJDSXZXN0dvZFRWVFpJd092cDZYQUd6SGF4L3NSVWlx?=
 =?utf-8?B?Y2hQV3lUUlpwRlFOZW95bStRTStEMkNXWWNDZz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dEtmVGZaSXRaL0ZXdHV1TkI2UWRURTJzOHg3OWFFSnh1ZTNDL09kRzF6dDJY?=
 =?utf-8?B?U3pTdHFzN21Za05KSVV1RWt2R3ZsZ2wzTnBBREpyZWUvdnRGcEpMUjJ4WTc2?=
 =?utf-8?B?blJWNGQvZzg3eitpV2QwRjdCdFpZMDk0cng2c0dlWVVMZG92aEpMaGpJQUVO?=
 =?utf-8?B?T0pqRzR4ZjdLcUc4ems2REowQjdwTUEvNlBDOFZ3YUVqTGRZbFFHV3RrdGdJ?=
 =?utf-8?B?OUJ3QUVHM2w5SzVsTnFzWEhUOUJodjJ6ZFJwcTdnUVJWV042SU1NVlkwcEIv?=
 =?utf-8?B?dTVTazBSUk5Tc2tLYWE2RnI0QkowenlkQzRJVmdJV2xYTjRJYU95QzJoYUxw?=
 =?utf-8?B?bmpveUh3ZkFLODI5MSsxZ0l0ZUpaNWxwNUM0SmlyTmc5T0ptYVFNRnNTOWhL?=
 =?utf-8?B?OGRnSlI4cWthK2FtS21PT3J6aTBYcVJiV3FrS1Rsc0pZdjl0ZzFzdUg3WlR1?=
 =?utf-8?B?MnIwcG94OUpyVHVTY2NLSHd4UmpDYnBvbkF5aGJ6aHg4dFJ3NzdBQlFWdWV3?=
 =?utf-8?B?Q1VuZHhvM01uWi9jNE5WZjdWVGY0NkVlTitGK3pwakxMd2hUZ0xmNVN5UUFr?=
 =?utf-8?B?cDJGOXgydmhZRGlFKzgyQ0NydnY4dS9zNXBSZUUxeVcxdHB5U1U1dnd1VVRE?=
 =?utf-8?B?b3VXWndXK2lRdllkQTY0b2ZHV2ZpdGdvdUtTQmd4QUtyOENtbHNmN1Z0WjJC?=
 =?utf-8?B?dXJYbU84VnI1UUgwWHpDNWRoZlN0bGN5QjEyaTBudk8reFlodjF0aXlTY2ZY?=
 =?utf-8?B?NnlPTTFlajMyUXRRNlpEVi9CYWQyaktlVExYRjJEVzFqSDlkYmVMSUtzcWE1?=
 =?utf-8?B?KzRBYjJXNGNxOWo3a0tqZVVsM3M1OEFsbUpUTExROE1EVVlTU1NYOWdzQUxr?=
 =?utf-8?B?cDB0NmkwMGEwbXVROEtseWEwcGJDOEVuZzZPaXA5Y29NUDZQd29xK3ZwVXIx?=
 =?utf-8?B?amxOYVVHMjd5OFl2bWxlbXlCOEVsa0svK2pRUGR1WEYyaElvdlFLdW5PNlox?=
 =?utf-8?B?QXhBQ0VqWjFZUXZEYmFSeGJKSG9JMlJya1VYOVErcmJFY2JoSHlKU1BvcTlt?=
 =?utf-8?B?NzFyZmQxWENkTHBaMnV1ZURvOVlLT1pzZHNUMGpzVWlZYy9LbjZhTFkvRFRh?=
 =?utf-8?B?dHVxZTNPOGJUTkhINzIwTDN4bmN2bExpd2plRkdVdHZFZE5iWXdrcUR5bGxV?=
 =?utf-8?B?UzRTa0V3Z1oyK2k2dVRQRzZyRmN4MUF4NFJQSHh5aGsyY2FNcC9jajdLU1hh?=
 =?utf-8?B?TGRkMkVhTm1iaFBna3QvMkJLREFpWnJtdEVPamJaMHRDd2UwY211K0p3RGND?=
 =?utf-8?B?b1RCenh6S2lTK24reW5jelJjNmZZYmFWRzkwQXNBL2J0bE5BajlRNWtxbjE5?=
 =?utf-8?B?TjhJejRWYXVZZi9lN2ZPVWRXeGFtTWJkSFhLK0NRV0VpRFhtSGdxcVBwa2RK?=
 =?utf-8?B?V1FGNVFjbGhFT3F4TXl4SGE2KzdjMWJRam42Wi9uQ3RWdnYyQkFZVlczc0sr?=
 =?utf-8?B?L3Jsb2QvR0IzZ0IyWG9NZjBVaUFjVjlxNUtlTUxMbnUvMFM3d3FnWGVjdGlx?=
 =?utf-8?B?MWsrZnVjbHh4dnkvdTk0YlducWdtMVpkUWtKaXl6U2NJYXBCSFJMZitPT1h5?=
 =?utf-8?B?dGh0MHQ0anZNUVdSOEJCZnBnZWI0M2JzcEJtVzRWS1hUcjQzZEp4WlY3Njdh?=
 =?utf-8?B?MklMQnRxdkM2WCtyQVhTZVhrdVNZR3J6Tk1WUXkybXdHNFhiMUVVR1ZvNG5k?=
 =?utf-8?B?TEhYOUw3ZUlPOFhCaG55OE01cnpWc1hZYkhrL1oxK1BwMHF4K2xoSmZPdDVI?=
 =?utf-8?B?ZVJNK3NHTkU0T0NoWWlRRzRpYmJJdWE0MWhMUXhvUzhRZWFSNTNkOFpIeDBH?=
 =?utf-8?B?SDZBRUk0RGhzZlhkL01IUllHUHAvQ3ZPanVTQ0ZoVG1ZOGVta2g0cnJIQ1Z0?=
 =?utf-8?B?NUw4dDNwR2hZTUF6a2dNNC9iR1JuTVUzNmtEMHpoV1JteVo4V0pTSXNISjBz?=
 =?utf-8?B?YkpnQklhL1lXSjJWWittci9Ia21TQ2Y4Y1M3dHNsNFZRTnJ2M1BrK3ZocWxG?=
 =?utf-8?B?ZnU1ZlA2dkNvSlpPK2sycmdXYWQ4TDM4MGtUOVFxUGVKZTRRUk1ER1ZNbVFI?=
 =?utf-8?Q?hq+G8ijmvuLNh6Qm+9eAcjIpA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0fb131b-f2a5-4e3b-f894-08de3e47ac3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 15:11:08.6387
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qrAFz0T+drNSCC5z8hmrBx0Jo4LdntbO0WZkjYOTRzx0nKVmYh1aUfzBlgRvbM+Qf1NBIn2AKp9L132fxV7G7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10520

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXJuYXVkIFBPVUxJUVVF
TiA8YXJuYXVkLnBvdWxpcXVlbkBmb3NzLnN0LmNvbT4NCj4gU2VudDogVGh1cnNkYXksIERlY2Vt
YmVyIDE4LCAyMDI1IDU6MDQgQU0NCj4gVG86IFNoZW53ZWkgV2FuZyA8c2hlbndlaS53YW5nQG54
cC5jb20+OyBMaW51cyBXYWxsZWlqDQo+IDxsaW51c3dAa2VybmVsLm9yZz47IEJhcnRvc3ogR29s
YXN6ZXdza2kgPGJyZ2xAa2VybmVsLm9yZz47IFJvYiBIZXJyaW5nDQo+IDxyb2JoQGtlcm5lbC5v
cmc+OyBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29s
ZXkNCj4gPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBCam9ybiBBbmRlcnNzb24gPGFuZGVyc3NvbkBr
ZXJuZWwub3JnPjsgTWF0aGlldQ0KPiBQb2lyaWVyIDxtYXRoaWV1LnBvaXJpZXJAbGluYXJvLm9y
Zz47IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz47DQo+IFNhc2NoYSBIYXVlciA8cy5o
YXVlckBwZW5ndXRyb25peC5kZT47IEpvbmF0aGFuIENvcmJldCA8Y29yYmV0QGx3bi5uZXQ+DQo+
IENjOiBQZW5ndXRyb25peCBLZXJuZWwgVGVhbSA8a2VybmVsQHBlbmd1dHJvbml4LmRlPjsgRmFi
aW8gRXN0ZXZhbQ0KPiA8ZmVzdGV2YW1AZ21haWwuY29tPjsgUGVuZyBGYW4gPHBlbmcuZmFuQG54
cC5jb20+OyBsaW51eC0NCj4gZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtcmVtb3Rl
cHJvY0B2Z2VyLmtlcm5lbC5vcmc7IGlteEBsaXN0cy5saW51eC5kZXY7DQo+IGxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtZG9jQHZnZXIua2VybmVsLm9yZzsgZGwt
bGludXgtaW14DQo+IDxsaW51eC1pbXhAbnhwLmNvbT4NCj4gU3ViamVjdDogW0VYVF0gUmU6IFtQ
QVRDSCB2NiAyLzVdIHJlbW90ZXByb2M6IGlteF9ycHJvYzogUG9wdWxhdGUgZGV2aWNlcw0KPiB1
bmRlciAicnBtc2ciIHN1Ym5vZGUNCj4gDQo+ID4gKyAgICAgcnBfZHJpdmVyLT5ycGRydi5kcnYu
bmFtZSA9IG5hbWU7DQo+ID4gKyAgICAgcnBfZHJpdmVyLT5ycGRydi5pZF90YWJsZSA9IHJwZGV2
X2lkOw0KPiA+ICsgICAgIHJwX2RyaXZlci0+cnBkcnYucHJvYmUgPSBpbXhfcnBtc2dfZW5kcG9p
bnRfcHJvYmU7DQo+ID4gKyAgICAgcnBfZHJpdmVyLT5ycGRydi5yZW1vdmUgPSBpbXhfcnBtc2df
ZW5kcG9pbnRfcmVtb3ZlOw0KPiA+ICsgICAgIHJwX2RyaXZlci0+cnBkcnYuY2FsbGJhY2sgPSBp
bXhfcnBtc2dfZW5kcG9pbnRfY2I7DQo+ID4gKyAgICAgcnBfZHJpdmVyLT5kcml2ZXJfZGF0YSA9
IGRyaXZlcl9kYXRhOw0KPiA+ICsgICAgIHJwX2RyaXZlci0+Y29tcGF0ID0gY29tcGF0Ow0KPiA+
ICsNCj4gPiArICAgICByZWdpc3Rlcl9ycG1zZ19kcml2ZXIoJnJwX2RyaXZlci0+cnBkcnYpOw0K
PiANCj4gDQo+IEkgc3RpbGwgYmVsaWV2ZSB0aGF0IGNyZWF0aW5nIGEgZGVwZW5kZW5jeSBiZXR3
ZWVuIHJlbW90ZXByb2MgYW5kIHJwbXNnIGlzIG5vdA0KPiBzdWl0YWJsZS4NCj4gDQo+IFBsZWFz
ZSBjb3JyZWN0IG1lIGlmIEnigJltIHdyb25nLCBidXQgc2luY2UgeW91IGRlZmluZSBncGlvQDAg
YW5kIGdwaW9AMSBpbiB5b3VyDQo+IGRldmljZSB0cmVlLCB5b3UgY2FsbCByZWdpc3Rlcl9ycG1z
Z19kcml2ZXIoKSB0d2ljZSwgY3JlYXRpbmcgdHdvIGluc3RhbmNlcyBvZiB0aGUNCj4gc2FtZSBk
cml2ZXIuIFRvIGRpZmZlcmVudGlhdGUgYm90aCwgeW91IGZpbGwgdGhlIHJwZHJ2LmlkX3RhYmxl
IHdpdGggdGhlIG5vZGUNCj4gbmFtZXMgImdwaW9AMCIgYW5kICJncGlvQDEiLg0KPiANCg0KTm9w
ZS4gVGhlIGZ1bmN0aW9uIG9mIHJlZ2lzdGVyX3JwbXNnX2RyaXZlciBpcyBpbnZva2VkIG9ubHkg
b25jZSBwZXIgY2hhbm5lbC4NCg0KPiBJbiBhIHRvcG9sb2d5IHdpdGggdHdvIHJlbW90ZSBwcm9j
ZXNzb3JzLCBlYWNoIG5lZWRpbmcgcnBtc2ctZ3BpbywgdGhlIHNhbWUNCj4gc2l0dWF0aW9uIHdv
dWxkIG5vdCB3b3JrIGJlY2F1c2UgeW91IHdvdWxkIGhhdmUgdHdvICJncGlvQDAiIGVudHJpZXMu
DQo+IA0KDQpObywgaXTigJlzIHdvcmtpbmcuIFRoZSBncGlvLXJwbXNnIGRyaXZlciBpcyBkZXNp
Z25lZCB0byBzdXBwb3J0IG11bHRpcGxlIGluc3RhbmNlcy4gSW4gZmFjdCwgdGhhdOKAmXMgdGhl
IHJlYXNvbiANCndlIGFkZGVkIHRoZSAicnBtc2ciIGJ1cyBub2RlIHVuZGVyIHRoZSBycHJvYyBu
b2RlLiANClBsZWFzZSBub3RlIHRoYXQgeW91IGNhbm5vdCB1c2UgZHVwbGljYXRlIGxhYmVscyB3
aXRoaW4gdGhlIHNhbWUgY2hhbm5lbC4gDQoNCj4gV2hhdCBhYm91dCB1c2luZyB0aGUgbnMtYW5u
b3VuY2VtZW50IG1lY2hhbmlzbSBvbiB0aGUgcmVtb3RlIHNpZGUgdG8NCj4gYWRkcmVzcyBHUElP
IHBvcnQvYmFuayBpbnN0YW5jZXM/DQo+IA0KPiBJbiB0aGUgcnBtc2ctZ3BpbyBkcml2ZXIsIHlv
dSBjb3VsZCBkZWZpbmU6DQo+IA0KPiBzdGF0aWMgc3RydWN0IHJwbXNnX2RldmljZV9pZCBycG1z
Z19ncGlvX2lkX3RhYmxlW10gPSB7DQo+ICAgICAgeyAubmFtZSA9ICJycG1zZy1ncGlvIiB9LA0K
PiAgICAgIHsgLm5hbWUgPSAicnBtc2dfZ3Bpby0wIiB9LA0KPiAgICAgIHsgLm5hbWUgPSAicnBt
c2dfZ3Bpby0xIiB9LA0KPiAgICAgIHsgLm5hbWUgPSAicnBtc2dfZ3Bpby0yIiB9LA0KPiAgICAg
IHsgLm5hbWUgPSAicnBtc2dfZ3Bpby0zIiB9LA0KPiAgICAgIHsgfSwNCj4gfTsNCj4gDQoNClRo
ZXNlIGRlZmluaXRpb25zIGFyZSByZWR1bmRhbnQuIA0KVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRp
b24gYWxyZWFkeSBzdXBwb3J0cyBtdWx0aXBsZSBpbnN0YW5jZXMgd2l0aG91dCByZXF1aXJpbmcg
dGhpcyANCmluZm9ybWF0aW9uIHRvIGJlIGhhcmRjb2RlZCBpbnRvIHRoZSBkcml2ZXIgc291cmNl
Lg0KDQpSZWdhcmRzLA0KU2hlbndlaQ0KDQo+IFRoZW4gdGhlIG1hdGNoIGJldHdlZW4gdGhlIGRl
dmljZSB0cmVlIGFuZCB0aGUgcnBtc2cgYnVzIGNvdWxkIGJlIGRvbmUgaW4gdGhlDQo+IHJwbXNn
LWdwaW8gZHJpdmVyIGJ5IG1hdGNoaW5nIHRoZSBycG1zZyBuYW1lIHdpdGggdGhlIGNvbXBhdGli
bGUgcHJvcGVydHkgcGx1cw0KPiB0aGUgcmVnIHZhbHVlLg0KPiANCj4gRXhhbXBsZSBkZXZpY2Ug
dHJlZSBzbmlwcGV0Og0KPiANCj4gY20zMzogcmVtb3RlcHJvYy1jbTMzIHsNCj4gICAgICBjb21w
YXRpYmxlID0gImZzbCxpbXg4dWxwLWNtMzMiOw0KPiANCj4gICAgICBycG1zZyB7DQo+ICAgICAg
ICAgIHJwbXNnLWlvLWNoYW5uZWwgew0KPiAgICAgICAgICAgICAgZ3Bpb0AwIHsNCj4gICAgICAg
ICAgICAgICAgICBjb21wYXRpYmxlID0gInJwbXNnX2dwaW8iOw0KPiAgICAgICAgICAgICAgICAg
IHJlZyA9IDwwPjsNCj4gICAgICAgICAgICAgIH07DQo+IA0KPiAgICAgICAgICAgICAgZ3Bpb0Ax
IHsNCj4gICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInJwbXNnX2dwaW8iOw0KPiAgICAg
ICAgICAgICAgICAgIHJlZyA9IDwxPjsNCj4gICAgICAgICAgICAgIH07DQo+IA0KPiAgICAgICAg
ICAgICAgLi4uDQo+ICAgICAgICAgIH07DQo+IA0KPiAgICAgICAgICAuLi4NCj4gICAgICB9Ow0K
PiB9Ow0KPiANCj4gV2l0aCB0aGlzIGFwcHJvYWNoLCBycG1zZyBtYW5hZ2VtZW50IGNvdWxkIGJl
IGhhbmRsZWQgZW50aXJlbHkgd2l0aGluIHRoZQ0KPiBycG1zZy1ncGlvIGRyaXZlciwgYXZvaWRp
bmcgdGhlIG5lZWQgdG8gcmVnaXN0ZXIgbXVsdGlwbGUgaW5zdGFuY2VzIG9mIHRoZQ0KPiBycG1z
Z19ncGlvIGRyaXZlci4NCj4gDQo+IFJlZ2FyZHMsDQo+IEFybmF1ZA0KPiANCj4gPiArDQo+ID4g
KyAgICAgcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgcnByb2Nfb2Zf
cnBtc2dfbm9kZV9pbml0KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpIHsNCj4gPiArICAg
ICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0KPiA+ICsgICAgIGNvbnN0IGNoYXIg
KmNvbXBhdDsNCj4gPiArICAgICBpbnQgcmV0Ow0KPiA+ICsNCj4gPiArICAgICBzdHJ1Y3QgZGV2
aWNlX25vZGUgKm5wIF9fZnJlZShkZXZpY2Vfbm9kZSkgPSBvZl9nZXRfY2hpbGRfYnlfbmFtZShk
ZXYtDQo+ID5vZl9ub2RlLCAicnBtc2ciKTsNCj4gPiArICAgICBpZiAoIW5wKQ0KPiA+ICsgICAg
ICAgICAgICAgcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICsgICAgIGZvcl9lYWNoX2NoaWxkX29mX25v
ZGVfc2NvcGVkKG5wLCBjaGlsZCkgew0KPiA+ICsgICAgICAgICAgICAgY29tcGF0ID0gaW14X29m
X3JwbXNnX2lzX2luX21hcChjaGlsZC0+bmFtZSk7DQo+ID4gKyAgICAgICAgICAgICBpZiAoIWNv
bXBhdCkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0ID0gb2ZfcGxhdGZvcm1fZGVmYXVs
dF9wb3B1bGF0ZShjaGlsZCwgTlVMTCwgZGV2KTsNCj4gPiArICAgICAgICAgICAgIGVsc2UNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgcmV0ID0gaW14X29mX3JwbXNnX3JlZ2lzdGVyX3JwZHJp
dmVyKGNoaWxkLCBkZXYsDQo+ID4gKyBjaGlsZC0+bmFtZSwgY29tcGF0KTsNCj4gPiArDQo+ID4g
KyAgICAgICAgICAgICBpZiAocmV0IDwgMCkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIHJldDsNCj4gPiArICAgICB9DQo+ID4gKw0KPiA+ICsgICAgIHJldHVybiAwOw0KPiA+ICt9
DQo+ID4gKw0KPiA+ICAgc3RhdGljIGludCBpbXhfcnByb2NfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikNCj4gPiAgIHsNCj4gPiAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAm
cGRldi0+ZGV2OyBAQCAtMTExNCw2ICsxMjUzLDEwIEBAIHN0YXRpYw0KPiA+IGludCBpbXhfcnBy
b2NfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgICAgICAgICAgICAg
IGdvdG8gZXJyX3B1dF9wbTsNCj4gPiAgICAgICB9DQo+ID4NCj4gPiArICAgICByZXQgPSBycHJv
Y19vZl9ycG1zZ19ub2RlX2luaXQocGRldik7DQo+ID4gKyAgICAgaWYgKHJldCA8IDApDQo+ID4g
KyAgICAgICAgICAgICBkZXZfaW5mbyhkZXYsICJwb3B1bGF0aW5nICdycG1zZycgbm9kZSBmYWls
ZWRcbiIpOw0KPiA+ICsNCj4gPiAgICAgICByZXR1cm4gMDsNCj4gPg0KPiA+ICAgZXJyX3B1dF9w
bToNCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9ycG1zZy9ycGRldl9pbmZvLmgNCj4g
PiBiL2luY2x1ZGUvbGludXgvcnBtc2cvcnBkZXZfaW5mby5oDQo+ID4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjEzZTAyMGNkMDI4Yg0KPiA+IC0tLSAvZGV2
L251bGwNCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L3JwbXNnL3JwZGV2X2luZm8uaA0KPiA+IEBA
IC0wLDAgKzEsMzMgQEANCj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAg
Ki8NCj4gPiArLyogQ29weXJpZ2h0IDIwMjUgTlhQICovDQo+ID4gKw0KPiA+ICsvKg0KPiA+ICsg
KiBAZmlsZSBsaW51eC9ycGRldl9pbmZvLmgNCj4gPiArICoNCj4gPiArICogQGJyaWVmIEdsb2Jh
bCBoZWFkZXIgZmlsZSBmb3IgUlBERVYgSW5mbw0KPiA+ICsgKg0KPiA+ICsgKiBAaW5ncm91cCBS
UE1TRw0KPiA+ICsgKi8NCj4gPiArI2lmbmRlZiBfX0xJTlVYX1JQREVWX0lORk9fSF9fDQo+ID4g
KyNkZWZpbmUgX19MSU5VWF9SUERFVl9JTkZPX0hfXw0KPiA+ICsNCj4gPiArI2RlZmluZSBNQVhf
REVWX1BFUl9DSEFOTkVMICAgIDEwDQo+ID4gKw0KPiA+ICsvKioNCj4gPiArICogcnBkZXZfcGxh
dGZvcm1faW5mbyAtIHN0b3JlIHRoZSBwbGF0Zm9ybSBpbmZvcm1hdGlvbiBvZiBycGRldg0KPiA+
ICsgKiBAcnByb2NfbmFtZTogdGhlIG5hbWUgb2YgdGhlIHJlbW90ZSBwcm9jLg0KPiA+ICsgKiBA
cnBkZXY6IHJwbXNnIGNoYW5uZWwgZGV2aWNlDQo+ID4gKyAqIEBkZXZpY2Vfbm9kZTogcG9pbnRl
ciB0byB0aGUgZGV2aWNlIG5vZGUgb2YgdGhlIHJwZGV2Lg0KPiA+ICsgKiBAcnhfY2FsbGJhY2s6
IHJ4IGNhbGxiYWNrIGhhbmRsZXIgb2YgdGhlIHJwZGV2Lg0KPiA+ICsgKiBAY2hhbm5lbF9kZXZp
Y2VzOiBhbiBhcnJheSBvZiB0aGUgZGV2aWNlcyByZWxhdGVkIHRvIHRoZSBycGRldi4NCj4gPiAr
ICovDQo+ID4gK3N0cnVjdCBycGRldl9wbGF0Zm9ybV9pbmZvIHsNCj4gPiArICAgICBjb25zdCBj
aGFyICpycHJvY19uYW1lOw0KPiA+ICsgICAgIHN0cnVjdCBycG1zZ19kZXZpY2UgKnJwZGV2Ow0K
PiA+ICsgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqY2hhbm5lbF9ub2RlOw0KPiA+ICsgICAgIGlu
dCAoKnJ4X2NhbGxiYWNrKShzdHJ1Y3QgcnBtc2dfZGV2aWNlICpycGRldiwgdm9pZCAqZGF0YSwN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgaW50IGxlbiwgdm9pZCAqcHJpdiwgdTMyIHNy
Yyk7DQo+ID4gKyAgICAgdm9pZCAqY2hhbm5lbF9kZXZpY2VzW01BWF9ERVZfUEVSX0NIQU5ORUxd
Ow0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArI2VuZGlmIC8qIF9fTElOVVhfUlBERVZfSU5GT19IX18g
Ki8NCg0K

