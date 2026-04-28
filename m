Return-Path: <linux-gpio+bounces-35708-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAzCLkna8GkLaQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35708-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 18:03:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0534886EB
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 18:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 38E3B301A2C3
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 14:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EDFB43CEF3;
	Tue, 28 Apr 2026 14:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MwiZWU8s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C1A427A1A;
	Tue, 28 Apr 2026 14:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777387411; cv=fail; b=lo2iBTVP2AvFadgtvQ72iaMrHMLWGQE7zxfDe1S/onS1p633ZuG8BR3TVDMml5M5iAq9KuP6ieJi7Z38gpDPAaU7ztU/XIlKiTgbMoYyuSb6IEfQIIDuLKLiZSvDxD8SatG/YsuLv+h6mUzjdbJHWTR27OUULY//al5rWqre97U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777387411; c=relaxed/simple;
	bh=0Y8/s8F/7KawlELTqTf1f5MQ5IuYg10k+4mtMAM/Y6c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CL2Ow2WQW60CWl9iZDeN2U6B8vZueyXDMz3MFCUSTJysBFMXU80ebNSc2klqLcLcB/UKttzjpLzKbL78CKfAtSjM3cLxmqZjhPyHep+szdaupOkqb3gxE5g+ioF7OIs8LTiz6IMs73uQ06xXysUIZHnzmiczGmavvrpZlu46rAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MwiZWU8s; arc=fail smtp.client-ip=40.107.159.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o9x1Ue+qHUXGVz8Qf3DO6skWdy79zT8ojlTndfYzIaU9uaRMrxbbgEtIv2EDUL+XajlYsYlERPqHvyZVISvhMr+Zot1hXqTeXfGM4RzE5VBvO0U8cILiNqUxfbvYVQ2JMgrID70UhcaUWNjwOea1iyRtjv98iXPM+jFBZdmyQRJXcmaXtU91O48VgvrWWSq7nRcvKwKfLWOzRk24nl7nk0j9aeBR0z/Q6c6dy0CLhWIpVeJVvWcInc6BmnSb9iiWasxlRMxrHx86UMYeDSzfogW+IEgqlPDQckEnUDyLuPqVoU46U2qPznXODFBaSD4tq8gh8xSiTXSIJkJOn8rUUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Y8/s8F/7KawlELTqTf1f5MQ5IuYg10k+4mtMAM/Y6c=;
 b=PqW2kes1tI3AiCfsmBAYCVo4ctDmIascemvU1nAOSEXGnQVdDYOBoZfjWzJvRJlZV3wkgNWY3ncHHxbyy8O1RsFwGLEVUZUsfb+fXTOahwRCtvNxqil+Q9z2bcCH0lXmDtvDWxRTt3DnHA05zsFFKroAQJM0a+1VwZhE9xMcMbXd7Ga5fSBrSMLGSpDFm1viHmD96SyEO9k48hicw9ycVLHOudpD573FUFmlyawb8CVvr3Zfha7rwgtfbMxE/Kd6Xta4R2Ph3QvCFWd0gslteHWsL5twKj+gbLwz3NXyfShDfcHgtspwHlT9YsySAxv/FKWEE8C7XETtkRXVLZ7vuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Y8/s8F/7KawlELTqTf1f5MQ5IuYg10k+4mtMAM/Y6c=;
 b=MwiZWU8sku8+HTNQBsmTTNeICz5YJBdW1oE2cSoe0VPR4YT2pWyPCU/5dqLZ9zOlcaSW7j50RCDJOTdda+TVEqBoMFDiwqhqOXr6jUmW1X4mwSgt+jNZ4ZDgryvv/3gmsqe2rGBQybxgdSyB8rvhVt54oy91J8+EF7ViE5r+OmWmYG/jnaau7wRlGENqtsOXZvVYA8d05ipSoO9hVc4ybfg2GDylRvdHTZd+1jiL3IH+i1Z+oInqTA2OlWXJP07AQhXKZfDhPfeOiZtJgo0Mj+oh+LLK1huu7bHJvCpzi6jVwRsDxXV0FbAVVsyaKegBFXlXJa6wUe+TzCXCOwxJxQ==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PA4PR04MB7502.eurprd04.prod.outlook.com (2603:10a6:102:ef::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 14:43:15 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 14:43:15 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Beleswar Prasad Padhi <b-padhi@ti.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>
CC: Shuah Khan <skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Andrew Lunn <andrew@lunn.ch>
Subject: RE: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO
 driver
Thread-Topic: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO
 driver
Thread-Index: AQHc1ntXO89lJmW4+kWgfPNMa95jj7X0E2kAgAB45KA=
Date: Tue, 28 Apr 2026 14:43:14 +0000
Message-ID:
 <PAXPR04MB918568939EC7DAEB4BB6C8F989372@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <29485742-6e49-482e-b73d-228295daaeec@ti.com>
In-Reply-To: <29485742-6e49-482e-b73d-228295daaeec@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|PA4PR04MB7502:EE_
x-ms-office365-filtering-correlation-id: a853bfd2-3fe6-4cfb-ae55-08dea5347aca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|56012099003|18002099003|22082099003|38070700021|921020;
x-microsoft-antispam-message-info:
 fgvrJPTMlUF9eZ2kN7NUcSFmZoVRREQZDgOS0E7XsLKMHGokhfH+s50+dZYZRS/p+H0xtsxiEVEaPufp3ibAGm95+r5t6pLFe3SS9W8pVu+COhqENVMXQHzOUjeqUrgrZt82t0FxzKumPYL7gFPThQtqLThngEarciVDOVhQWU0UYLNT73l6/uED67+RXG40g/mtO6uXh5Gl7tQeJ671oLPwT/wSkEIjrkqWQ4GkbAh9RcQhc95tN+7iAPI+Z+BqtqlXsnUH49q6bU/rl8yRPbDHaWMYV7kIPYclcfDCoWjCTIirVLzu1no1RUnxsTPO7rnjVmO6NBzfkr1i6VnVmMJfSw3eweGPhYLHWCBruXgRzAs0AaizR7k8Z3h2QmIGfF0OBphr8lsMAe8IH6GgWNIEBaSHsVoKp5nYiht5F9AFzLj3+MRWyGJd07N9xD6LkZUYgCkwh8TNqhV9+29dnBreXfTIsPdHlfx+fAtvnMNfzgcLcAtQyAr7Qsdxrl2dLQZgneeBQZusNRw4xPKupEKna4l2Odl8RgpepZxryf85UQmFRaoT3Q/10mJ1/rBxFDpx9nF9ey8XT60pmwAj3xNKqphjnJyzjXQWIflyIi0VDTxbyoCV4MX2UH/yY1YHrcwOQxo9Z/7RfPC7cJlRQcjxoXvMsfXdeYAb7eLuPYT5K7Z0JpqDQMXAdSD1ouTknjllThFtDNrMg/Q0GIIF7q1lBJ0Q1Ip18CbHYeyQz9Lgq1/jMKRLnBE/DX1WsaGwVzNELrF3offdwcX7IqRnBUWGh2SbveIl+yNFBSqCvwp7OQbEtrdPAFFml8UCFDwX
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(56012099003)(18002099003)(22082099003)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TUpzS0E5cFBWZDRhdkZCRFNRVzB4K0dMaU5LQ1ZVNWlxWnBvcUJ4ZFEzSitV?=
 =?utf-8?B?VTZqbllIUHZGV3h1L1k0YmEzT3hKUVMwNCt5bVhJcXB3VENjTHpYZ29GTXJK?=
 =?utf-8?B?ZVZ6K21VYUNIZWZ0aGVJSlNyendwZFY3czVSWEJESmhSNjlid0U4ZGJXTWhw?=
 =?utf-8?B?c1YrZ3pDdFd2RzlIbjRWK2xkYUgrZVQ1Z3ludzFLUURqYnVKMTc2amdaZDFp?=
 =?utf-8?B?WTZvdTMxaUJHQ3EvQWYrMjkxamJSVCt5YU9pS0oySGU4clB0SENRYUpINlJF?=
 =?utf-8?B?VE5sQml0SUs3aEVnU2pGZWc1UUN3MC83alF1NUF5RnlCQTMwd0NIVEdYZ2ZJ?=
 =?utf-8?B?N3JEaE1MT1BHSDY4c3BOU3N6bTZITUQ2cGUzK05QNFlLTzE3dFpOTnF2N1VK?=
 =?utf-8?B?QnkyNTUzRms5ZDAxTVZkQllkVkcrVlY0cThoaEE2eFZZVG1SMVIrYUNsRDdZ?=
 =?utf-8?B?NU96R05ySmthdlI3dmsrN1pTNG5HekZyWHZvYmdRbTFRd3FnOThOYVpBSWd2?=
 =?utf-8?B?NGl5enFQZE5rL3hPSjVxQk1keWNLWUQxN3gzNGVLYzdkYTVab0o2SDh5U3Nu?=
 =?utf-8?B?T2ZGU29yZzZ4VmxtZWRmdS9JNGg5WmV4US9DVjkvMExNWWh3SlN2RGxhVy9o?=
 =?utf-8?B?SWpOQnVuS1NxOHVYV2lFRVlmeUZ5czdWd3hZWmx3VUtIcnJvRGpjTHVncElU?=
 =?utf-8?B?NlJibzB0RVNIcEVqMXk4azZSb2ExK0tzdXIwSmcyQVA2QzE3dWQ3WkdHYitN?=
 =?utf-8?B?RExVNFNtSk9sL29zMHhNTG9RYUNVeXN3NFhMRmsyYTFNSnpVVzBqZ1lJS1ZU?=
 =?utf-8?B?S1lQSVVjQW1WR0tDU2FIaUFpODJySDdKSG1JQkIxU2l3eUpTVm54cktQZzhL?=
 =?utf-8?B?dXNZZDVjTzVta2JEWVgrVFdsWDNqNklxbHZzZDl2Yk84ak55NGQ0eFZFbGpM?=
 =?utf-8?B?OEozaWlnSWtiZCtjRVp4Z3FuSlBnNGt0MFpQdG9yaGxDNG5PdjRGNWlJUmJQ?=
 =?utf-8?B?Mi83SU5tWmYzUTJWcGhlWHBJOTJmK2ZrMTRSK29pUGVUNk9UUEQxVGk5bTJZ?=
 =?utf-8?B?TllBVG1YQkJzZUU0dDFKa0x2TVNycGJrRVlKWTZMRkNRNi94TVNWYVBJOFp0?=
 =?utf-8?B?MDdkTUltcjRkTXJlcDhWTEsrcDE5TkJ4bHFxRkpaNXRoS2ZlOEFlM3N0V05k?=
 =?utf-8?B?ekZlMkh2OTk1T1drcitXd1BhdGFwdldDaWQyL1FPQmhJUTlUeVkvZjZiSFdr?=
 =?utf-8?B?TkFhR25sQWJNZ2IwV0Qybm5UUnp5RmprSm1UNFZUZi8rMUlUQm9PZ25UcGgv?=
 =?utf-8?B?eWs3Snd4T1FjcGxKSEFBQjBlTGVNa20weHFmRVNJWlg3UXo1aFFWWXhXMVo4?=
 =?utf-8?B?N1ZZTjFoY3JkclloMTFtbkRkaDQraW8ycSswRkhRZUV2MUNJL1FscGZVS2xq?=
 =?utf-8?B?Q3JoN3BzYytkTmtKYkZsZjBRSHMwa2xhSHNydHhDKzd5eFJGbjVrWlpyOHpL?=
 =?utf-8?B?cUdmMnJhVlRoRFdYSkRGdHlydnlLK1Fvc0c0dDJZdjRoRStzYmw1enY1U3Uv?=
 =?utf-8?B?ZDBGZmFPeklSZkdsVU5qVFdOK2JZdUlGN2FMK1NEVWpsakpUVkYwZzhwTnBU?=
 =?utf-8?B?blZ4cnAvMm9qdWxqTXkzemZXS2ZidkI0WFE4UHVZVWxVSC8rRTUvbDlNdUhO?=
 =?utf-8?B?STJ2TEJ0V21LOGJ5YXlJMDVYdVBmYjIwZE9Qc3g1U2RjdER0NVg4SWwwdWdC?=
 =?utf-8?B?dWxtdEV2eTZvbnZ4S2NzWitSeHk3YitYZDVxeWp6QWthSDBZYzJTNCtUUnJF?=
 =?utf-8?B?SVVrR0xuazNqSXkycE9GcDgrTEpyRjRObGk5eXZDNjJjQitvd1pOVDE3WjJM?=
 =?utf-8?B?NWI2ekZFamNzcVMzNC9YOWVid2VpRU9pNHNzN2pNa3hTOGFqODZDVUkwcSs0?=
 =?utf-8?B?U09HeDZvUTJuWnZSbXUyRmhDeEtzeVN2emsrOU0ydGdvb3BQTHNqcEtqSlI1?=
 =?utf-8?B?aVltOUx1OEFxUC9DNEpRbThqQktkQVZzYU9jOXNQR0xqZFo0UFZ3cEMyVnZs?=
 =?utf-8?B?d2JJNkFYUFlBeW4zYWlSd016ZEtITVJpNGRFMlVuMHhUdFJxc2FVZVc1eG1x?=
 =?utf-8?B?NEJXQTUzYnlJMjZDdmhVbWllVEFGQjBQaERnMjFqODc4UE5HUng5S3VUYWs3?=
 =?utf-8?B?ZmZvdXpZZlh0VUdPbkxldXVFNHZpZmRFS1kvUVQ0eXRJSkVITjMxYTkycmVL?=
 =?utf-8?B?S2NycFZHNW1yY1N2cVRUeDZsT01LZjFoaDRwRHh3YzlHWG9zNTJRQ1I3eGN5?=
 =?utf-8?Q?Hde52BlC+YoAg1r1FY?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a853bfd2-3fe6-4cfb-ae55-08dea5347aca
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 14:43:15.0063
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8UaDhQLU+WymUuT/luOc7KeTVwOpAgNS2Vxni3TAy/NCEckBtQJk5z/QrcsQibvKDgXlz4goB9oF88LXLHuc7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7502
X-Rspamd-Queue-Id: 0D0534886EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35708-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,bgdev.pl,lunn.ch];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmVsZXN3YXIgUHJhc2Fk
IFBhZGhpIDxiLXBhZGhpQHRpLmNvbT4NCj4gU2VudDogVHVlc2RheSwgQXByaWwgMjgsIDIwMjYg
MjoyNSBBTQ0KPiBUbzogU2hlbndlaSBXYW5nIDxzaGVud2VpLndhbmdAbnhwLmNvbT47IExpbnVz
IFdhbGxlaWoNCj4gPGxpbnVzd0BrZXJuZWwub3JnPjsgQmFydG9zeiBHb2xhc3pld3NraSA8YnJn
bEBrZXJuZWwub3JnPjsgSm9uYXRoYW4gQ29yYmV0DQo+IDxjb3JiZXRAbHduLm5ldD47IFJvYiBI
ZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnprK2R0
QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBCam9ybiBB
bmRlcnNzb24NCj4gPGFuZGVyc3NvbkBrZXJuZWwub3JnPjsgTWF0aGlldSBQb2lyaWVyIDxtYXRo
aWV1LnBvaXJpZXJAbGluYXJvLm9yZz47IEZyYW5rIExpDQo+IDxmcmFuay5saUBueHAuY29tPjsg
U2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPg0KPiBDYzogU2h1YWggS2hhbiA8
c2toYW5AbGludXhmb3VuZGF0aW9uLm9yZz47IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBs
aW51eC0NCj4gZG9jQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
ZzsgUGVuZ3V0cm9uaXggS2VybmVsIFRlYW0NCj4gPGtlcm5lbEBwZW5ndXRyb25peC5kZT47IEZh
YmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT47IFBlbmcgRmFuDQo+IDxwZW5nLmZhbkBu
eHAuY29tPjsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiByZW1vdGVwcm9j
QHZnZXIua2VybmVsLm9yZzsgaW14QGxpc3RzLmxpbnV4LmRldjsgbGludXgtYXJtLQ0KPiBrZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT47
IEJhcnRvc3oNCj4gR29sYXN6ZXdza2kgPGJyZ2xAYmdkZXYucGw+OyBBbmRyZXcgTHVubiA8YW5k
cmV3QGx1bm4uY2g+DQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0ggdjEzIDMvNF0gZ3Bpbzog
cnBtc2c6IGFkZCBnZW5lcmljIHJwbXNnIEdQSU8gZHJpdmVyDQo+IE9uIDI4LzA0LzI2IDAwOjUz
LCBTaGVud2VpIFdhbmcgd3JvdGU6DQo+IFsuLi5dDQo+IA0KPiA+DQo+ID4+PiArICAgICB2b2lk
ICpjaGFubmVsX2RldmljZXNbTUFYX1BPUlRfUEVSX0NIQU5ORUxdOw0KPiA+Pg0KPiA+PiBTbyB0
aGlzIGlzIHRlY2huaWNhbGx5IGEgcnBtc2cgZW5kcG9pbnQgKHN0cnVjdCBycG1zZ19lbmRwb2lu
dCkNCj4gPj4gd2l0aG91dCBuYW1pbmcgaXQgImVuZHBvaW50Ii4gRXZlcnkgcnBtc2cgZW5kcG9p
bnQgaGFzIGEgcmVmZXJlbmNlIHRvDQo+ID4+IGl0cyBwYXJlbnQgcnBtc2cgY2hhbm5lbCAoc3Ry
dWN0IHJwbXNnX2RldmljZSkgd2hpY2ggcmVwcmVzZW50cyB0aGUNCj4gPj4gc2FtZSBpbmZvcm1h
dGlvbiBoZXJlLiBTbyB3ZSBzaG91bGQgdXNlIHRoZSBmcmFtZXdvcmsgc3RhbmRhcmQgaGVyZS4N
Cj4gPj4NCj4gPiBZZXMsIGFncmVlIHRvIHVzZSAiZW5kcG9pbnRfZGV2aWNlcyIuDQo+IA0KPiAN
Cj4gSSBkaWQgbm90IG1lYW4gdG8gc2F5IHRvIGp1c3QgY2hhbmdlIHRoZSB2YXJpYWJsZSBuYW1l
IGZyb20gImNoYW5uZWxfZGV2aWNlcyIgdG8NCj4gImVuZHBvaW50X2RldmljZXMiLiBJbmZhY3Qg
eW91IHdvdWxkIG5vdCBuZWVkIHRvIGhhdmUgdGhpcyBmaWVsZCAmIHN0cnVjdA0KPiBhbnltb3Jl
Lg0KPiANCj4gUHNldWRvLWNvZGU6DQo+IDEuIEFkZCBhICdzdHJ1Y3QgcnBtc2dfZW5kcG9pbnQg
KmVwdCcgZmllbGQgdG8gc3RydWN0IHJwbXNnX2dwaW9fcG9ydA0KPiAgICAgdG8gbWFpbnRhaW4g
dGhlIGVwdCB0byBwb3J0IGlkeCBtYXAuDQo+IA0KPiAyLiBDYWxsIHBvcnQtPmVwdCA9IHJwbXNn
X2NyZWF0ZV9lcHQocnBkZXYsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHJwbXNnX2dwaW9fY2hhbm5lbF9jYWxsYmFjaywNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcG9ydCwge3JwZGV2LmlkLm5hbWUsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFJQTVNHX0FERFJfQU5ZLA0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBSUE1T
R19BRERSX0FOWX0pDQo+ICAgICBmcm9tIHJwbXNnX2dwaW9jaGlwX3JlZ2lzdGVyKCkuDQo+IA0K
DQpPbiB0aGUgTGludXggc2lkZSwgd2UgaW52b2tlIHJwbXNnX2NyZWF0ZV9lcHQuIFdoYXQgaXMg
ZXhwZWN0ZWQgZnJvbSB0aGUgcmVtb3RlIHN5c3RlbSBpbiB0aGlzIGNhc2U/DQpJZiB0aGUgcmVt
b3RlIHNpZGUgZG9lcyBub3QgbmVlZCBhbnkgZXh0cmEgc3VwcG9ydCwgdGhpcyB3b3VsZCBiZSBh
biBleGNlbGxlbnQgc29sdXRpb24uDQoNClRoYW5rcywNClNoZW53ZWkNCg0KPiAzLiBTZW5kIG1z
Z3MgZnJvbSBsb2NhbCBlcHQgaW4gcnBtc2dfZ3Bpb19zZW5kX21lc3NhZ2UoKSBieToNCj4gICAg
IHJwbXNnX3NlbmQocG9ydC0+ZXB0LCBtc2csIHNpemVvZigqbXNnKSk7DQo+IA0KPiA0LiBHZXQg
dGhlIHBvcnQgaW5mbyBpbiBycG1zZ19ncGlvX2NoYW5uZWxfY2FsbGJhY2soKSBieToNCj4gICAg
IHN0cnVjdCBycG1zZ19ncGlvX3BvcnQgKnBvcnQgPSBwcml2Ow0KPiANCj4gV2hpY2ggYWxzbyBl
bGltaW5hdGVzIHRoZSBuZWVkIGZvciBzdHJ1Y3QgcnBkZXZfZHJ2ZGF0YSBhcyB5b3UgY2FuIGp1
c3QgZG8NCj4gcnBtc2dfZ2V0X3Jwcm9jX25vZGVfbmFtZShycGRldikgZnJvbSBycG1zZ19ncGlv
Y2hpcF9yZWdpc3RlcigpLg0KPiANCg==

