Return-Path: <linux-gpio+bounces-39529-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tEB6BmvPS2rKagEAu9opvQ
	(envelope-from <linux-gpio+bounces-39529-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 17:53:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AD4712D86
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 17:53:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=SLj7S0Sh;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39529-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39529-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DE1D232581A9
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 15:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD7F3AC0FE;
	Mon,  6 Jul 2026 15:40:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013019.outbound.protection.outlook.com [40.107.162.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D3D39934A;
	Mon,  6 Jul 2026 15:40:10 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352412; cv=fail; b=YuCOdWHoYiGla3ZAd9F0epQYd+3E4QkMY17IDa+i1//0zSM6ANWwVWFMZAbjDxvxNG3Yo2mBxclYcgp3kcgGnCmedrOt9SNQdFDUMt0vjqoukzEMIsuTjCyi5rJ4BowhDtzpBBJRu9SqzQJhERSvOa6FBd+ls7bo5CTQBSX70m8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352412; c=relaxed/simple;
	bh=hTWjwgCXxt6hTw08btnLGEppuERjf0VGtYBDsq6fShs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u9JVpkU/vE3PV+0BTWx/j8vRBm8x0h+aC4doq2XFdjLdS/GJD6Gtsfge4jgLIiLoA9j+feFLD/ow9q5TG+M4WFYeCo3plLgiEnGH73TKDOLyCcZ7ju/egythjzbVICE1wsZWzOXRo+UxgsY8keWpcqwQGhaM7zyKR6glt7BhXBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SLj7S0Sh; arc=fail smtp.client-ip=40.107.162.19
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AhgZEmCp/652AAAqUPntraD00QkfK8PitJRPIU2emUiTbnQd/MG2YOko8ChSwZU4bnPddLd3UTf9nOI0CnB/FEZF9trxzHr+5EVJpucuKsmb/RlWg+6GHxwF6T33uaDVnLTFdLqO6Y21jWgENe2Iz9eLjPNruaFj//PZ4VrDfcLRKRHQ6WXA95wIT/00w4C2WhCA70Mfrq+MkvHAFVV1U5d4LqkZJMPY7V9MKPF5QO39WXjsNKsp7vD+WuTDtFe8B6ssdg1t9jh2DdRuaq1Dgo6pHSaA4qXtSah5h4HwF39OctMKjk3udl2qqs+cVTdz/42h/hlwJRn+ken92c1udQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTWjwgCXxt6hTw08btnLGEppuERjf0VGtYBDsq6fShs=;
 b=wwSyzsJN0qYTNoPMkci/8PAsNR5VScTDh3DNq+LtCyAgpmLQsTvvTEjqMFhuF+1XwmE5t7FAXTP5//MsgKA4rhV4eDxjcm8WsYdiUiGiI/lD3UD+ar2kT8re91KQePiWCOAzoecMLlGErxdb9gaoecBwIaFNAWZkJkR6Lpp3OG71EbQaW6J7E8qjJfdtyDmmi+aWmonyu/w1Nbm/teXpjQ7U7T/TPmblADE5MDuH7PYWAVwNEPE9pgXXitjS1YUDtt+q0cd2rrPMy7tDiIMd8jrkLs4pf2C5v4W8wQNXzZvwZjJYiMqEFOLdgyRCWVe4JKt0xuk/bhcmJ8W4c1Yg2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTWjwgCXxt6hTw08btnLGEppuERjf0VGtYBDsq6fShs=;
 b=SLj7S0ShSaFSlQZ3cbAbEriaurpPNpl093S2VkMNZBvxJ0/1MjqPNWhaB9NcPiFgErH7Cpac5mmO0pohQ6riNTQZPF2JiJKk1JTT13z5YRynRBH9VYhbVHgv33BPoAsY26oeZHvF1uj/2nSZxPefK9WlBLYIqdMQKx4rhFTE6j0CxeyLX7WkjWm8YINdBRSDU5gCz4r8OUcMFiH9qDRgmfeFM6SeE1JZ25PZpgamYzJ8o9f7D/p2Vx+4qjCtG+F56L+H7FcM3wePuyR1GF2hcEpOY1aTJ2hjqXXMFymhjYAl2t/4RaSv7S+ku7cVpA1V44S2NFZLfhid24M+81NSFw==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GV2PR04MB11141.eurprd04.prod.outlook.com (2603:10a6:150:27c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 15:40:02 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%5]) with mapi id 15.21.0159.018; Mon, 6 Jul 2026
 15:40:02 +0000
From: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
To: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Frank
 Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
CC: Shuah Khan <skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Shenwei Wang
	<shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, "b-padhi@ti.com"
	<b-padhi@ti.com>, Andrew Lunn <andrew@lunn.ch>
Subject: RE: [PATCH v14 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Thread-Topic: [PATCH v14 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Thread-Index: AQHdBLru379VkC1WBkywqUjM2ZB4D7ZgsfEQ
Date: Mon, 6 Jul 2026 15:40:02 +0000
Message-ID:
 <PAXPR04MB91855056638F0028BCC5F9EF89F12@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
In-Reply-To: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|GV2PR04MB11141:EE_
x-ms-office365-filtering-correlation-id: f31e02ae-ef3b-4912-01cd-08dedb74d83e
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|7416014|376014|38070700021|921020|22082099003|56012099006|11063799006|18002099003;
x-microsoft-antispam-message-info:
 S7zmNnAmCKQEErbnl8zODtu8aDcXEvW5phtHdxD8HIxH3YuI7HgNu9dtYzb03GlPQ9i8jUc6Q+DqEB3M3xF49kBpImz+cAILH5W15pxPdIdd9k7Fs9NkJrZY+hmHd4ivERxQGvRENV7sxNqrzHxZRf/xazD0T9jP9flWLISIoEceBs92EK4uJq9BGmgyc+k3GD6sVIC6nxWbnCzCr2yJlQ7x2LUr3nfva0M/CXZcF1Pwpm9MocQIrGHB3HMHKM6OWcYMGpli7nfSfUzW9WBnV10eGTKYTlUvqm8O3I4yZxHxNM3JvUiQx+9YRh2+n+AiyFhzFP23GuO6XwlyLXM/rJE9SO9lnJu5WR/XqKjakOjjBrcGbwjD9HVI5yjcx7Kr8Qh2aHVrEdg4KZnBmB5LNahnmy9LLpqwxZo5SBoUlmQlyal7wtqIAIDwNrvIiFCM/ZPMqeQYTqaKM6Eci8eoa2QEGybyWDxWTSI+fbNNK6Dr3cxjoKgFWCO4YB4SgjVKS8QyZSjQoY0aKVdRaiCNXXZuFFwSQOxI9sWTsjgjfVUEqsYYV+vRMWJhgqB5ET4lt9oP5n0PSfeEVgDGIYXj5hCMxjUIp/LpPZXxkq9x8oF1QnuHmit0wFPcxPVT0SL6fJZjDnlRoSSMUcDfLQ5HglhDKg6kQIP69n9xJ2DV5ffG6kCJEduSMYyXhtsEFXJt4fgjsoqkupnHKENVgwKQho4PkVeKeTcYs7pqx7IBzpiM0xYnRc/j9DZ6NDsBim5R
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(7416014)(376014)(38070700021)(921020)(22082099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c2tXQzVMQVhOR0JobWxvUk1PMWkvS0xvZzhvdjJYNDFIelJzV3ZCOG4xaUhh?=
 =?utf-8?B?MkhGUmtQTWVtRXhlejZ5bGZSZ1Vvb3htQXYvYTNRUzE5NEJ2aGI4bWVNRHNY?=
 =?utf-8?B?eFpvbXFmQ0tSR0NDMVhhdnJqazI0NURjYTB1VnExL0tpRFJQL2ZyNndaM25m?=
 =?utf-8?B?QVF6M1pWQUhtRkRRaEpXeEtqdUIyQWlETXowbEVTQlZFV0w3SXZPM2ozK1FE?=
 =?utf-8?B?NXR2TWtFRkN6Q3JWK0dTVjduVFBBNDN0cUQ4SGtOUXFIVlZwY0paS0llNTZk?=
 =?utf-8?B?SGlLZVZDQTdsMmlWTDl5RTNIL2pRczF6UjRHcVFzRHlTUDFUM1gyT29VM0Vp?=
 =?utf-8?B?WDVsMGRYRUdaRVNVRHBNeXdONzlxSXZpSmkxY2p3Z1lGUllTRTlXTTM1NEpt?=
 =?utf-8?B?N013NjV1bXRuTmRSU2NvN0ZPQzR5QmZGd3Z0Z1QyT0hyVFl5MmlPa0JYblFP?=
 =?utf-8?B?UU1KcWZ2S0VHTmd6VWJRMHI0SVphWVpFeTRDankvZDJMZlgxT2h0RTRxZHJV?=
 =?utf-8?B?ZXdiVVhRMEhieDVSZHBwcVNmb1k1ei9RZzZVcWxoZnVCZ0VSeTlyNHp5amt0?=
 =?utf-8?B?cFVFZ1pNYUlMUlhSMHBBaThVcWwrZTRuU1VXOFV0QlYvejRlbmp0MjMxM0t2?=
 =?utf-8?B?SG1HZWFOMFpReGFhN3pqVmpDLzBwRStsV2JsdXBaRFJnKzZQUFZIUnpqK2l4?=
 =?utf-8?B?QVp3bnBtcWNMZzRpV0J2SXBuTGNqT2l0ck5QRktmcUEyK0paU0t4K0lFaDRR?=
 =?utf-8?B?bFdDVDlnNC9JU0t4RGtaZ1ZrWDkwdVdJS1lHaXljNDROemFnS3ozVkRSc0Iv?=
 =?utf-8?B?U0dZc2JHbVpLM09yUytpQ1J0em9TN0hRbWlvNUk4T3k2VXpONDA2MDdpT00v?=
 =?utf-8?B?NENUbFI5djlZdk1meVloSWVQenNMTTd1ekc2OVo3NW0xU2FVcS9FWXdhbDJn?=
 =?utf-8?B?ZVdYR0dqUU4wSm9NclJiajNkckwwS0pxRFJOS2Z2UmpRUm5SVXhSejhRYW11?=
 =?utf-8?B?Q1Njd3VMd0V1TkFURzQ3ZmgxL2lkVzhQWHZLTWUwcG1yTk9UQmUyS1BVbTlo?=
 =?utf-8?B?K1lGQ0ltZ3hXM282TWVEOURzdFB5K3Nmd2haenhwTHpLR0xHQTUrekVCYkpm?=
 =?utf-8?B?Zkd3REZVNlA5UGU0OFVCVG1vNHJ6RlMxSXo3TWZycTEvQitGdkpTUUJyRGtL?=
 =?utf-8?B?YjE5dGVuUWlOcmp1TFN5RTV5b2d0bVVkWDZVekRnWjV4KytRNHhCYzJWeFVS?=
 =?utf-8?B?Y201S1Y4MnlyWXk2Z0NNcms5UnphTTcvNXdzL3FhSGZ2TkxpTU9US2V4dGg1?=
 =?utf-8?B?K3NqakRqaHZaWFRLbXZXTWxydlA5OEtvb2JqTDNtSzhBRU9zcHVqL0U1Szhp?=
 =?utf-8?B?UUpUSEZaU0xVSzJxSHRkUUFNK29NM2xBTU5ndmRVcGhOVmpNMmgra3BnTm9u?=
 =?utf-8?B?a1hWR3ZRY1hwaW9sR3ArcXlMNDhDU3ZRYVRGbmlhNG1FMnBKNHllMnAwL3h1?=
 =?utf-8?B?L0dxQmtSKysvRlU3U1FpUVU2UXpGN1h0YS84OXp5TkpuSWE4bmRvUzZGTVFJ?=
 =?utf-8?B?YWNpa1NZdTg4MVRmZzUyWkJvczdwOEtiVG1DRHpPRGRlbXV2N3RkakRvUVVa?=
 =?utf-8?B?VFJCSC96djZGTmtFOTRFaGVpV1Q4cklFZkRoTGVucGpDVEdVSXVTRmFNdnpj?=
 =?utf-8?B?aUZockE2STlBelpkOFN2MEhacXpyVTRRV0VUVDY2MmpQVHo1OWMxTkd0ckY3?=
 =?utf-8?B?SXZDZ2lGY3R5a2pLRS9EZ3h1TjArS01ZOWh6S2UydGNCNkg5S0VURVJHL2g5?=
 =?utf-8?B?ZjlHWmpURU00NU1ESmllbXVicXpGem9kMm1HTG4ySmxlamRObXQzSmhwdWQ4?=
 =?utf-8?B?OUhyTEVkb2pFL1J0SFhIRktSYlhaWFdtcmRCT1MrYUZoWlQ2NmMxRkRGRERx?=
 =?utf-8?B?MFNralFPQmNhRXV1Q0JsZG43RGxIcmJKWXJBVWVVZzVrcEFZbXlJQlJVMnJh?=
 =?utf-8?B?V1R1dWVOSmNVeENFK3VZcDVXS0NWeDNpbTFQK0FTRitmRnNTc2c4NzF2SEht?=
 =?utf-8?B?djBwdGxMRWYyZm1zR0Rtek9PS3kvWHVmV004dUtEdi81a2t1SHo5S25rWlFn?=
 =?utf-8?B?VXNPVUx3dDdreXBHaVpKamM5R2dQdnpDL0ZiaFpUd1ZOQW9KdHVnN2VaY1RX?=
 =?utf-8?B?Z0N0TkdCamtSQnpLZExyQ3UvQ01hYTU1aVgzaWJ5djJlTzZWTmg1RldyZ2RQ?=
 =?utf-8?B?ak1XL0JWZ093eTEzS00yVWw0MUU3OWVtOFNYYmdxYnBLQ05BQllwQmxnSlhX?=
 =?utf-8?B?a0JkM3pSSGUwc2UyUzRBcW9HV0w0WEI5S1dMZ2pSRWdqcnFhdUk2dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f31e02ae-ef3b-4912-01cd-08dedb74d83e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2026 15:40:02.3497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UDMryE9elejx8Enkj5mAPlMXN00HApQecChHRUMdSppLgNnw7Hrg7e4Jk5OGAQMA4dwcpFvqY2L/ZF4IkAfICA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11141
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39529-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[shenwei.wang@oss.nxp.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shenwei.wang@oss.nxp.com,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:frank.li@nxp.com,m:s.hauer@pengutronix.de,m:skhan@linuxfoundation.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:shenwei.wang@nxp.com,m:peng.fan@nxp.com,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-imx@nxp.com,m:arnaud.pouliquen@foss.st.com,m:b-padhi@ti.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@oss.nxp.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,foss.st.com,ti.com,lunn.ch];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6AD4712D86

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2hlbndlaSBXYW5nIChP
U1MpDQo+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDI1LCAyMDI2IDEwOjU1IEFNDQo+IFRvOiBMaW51
cyBXYWxsZWlqIDxsaW51c3dAa2VybmVsLm9yZz47IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xA
a2VybmVsLm9yZz47DQo+IEpvbmF0aGFuIENvcmJldCA8Y29yYmV0QGx3bi5uZXQ+OyBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mDQo+IEtvemxvd3NraSA8a3J6aytkdEBr
ZXJuZWwub3JnPjsgQ29ub3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPjsgQmpvcm4NCj4g
QW5kZXJzc29uIDxhbmRlcnNzb25Aa2VybmVsLm9yZz47IE1hdGhpZXUgUG9pcmllcg0KPiA8bWF0
aGlldS5wb2lyaWVyQGxpbmFyby5vcmc+OyBGcmFuayBMaSA8ZnJhbmsubGlAbnhwLmNvbT47IFNh
c2NoYSBIYXVlcg0KPiA8cy5oYXVlckBwZW5ndXRyb25peC5kZT4NCj4gQ2M6IFNodWFoIEtoYW4g
PHNraGFuQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZzsg
bGludXgtDQo+IGRvY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtDQo+IDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBG
YWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+OyBTaGVud2VpDQo+IFdhbmcgPHNoZW53
ZWkud2FuZ0BueHAuY29tPjsgUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+Ow0KPiBkZXZpY2V0
cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtcmVtb3RlcHJvY0B2Z2VyLmtlcm5lbC5vcmc7DQo+
IGlteEBsaXN0cy5saW51eC5kZXY7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZzsgZGwtbGludXgtaW14IDxsaW51eC0NCj4gaW14QG54cC5jb20+OyBBcm5hdWQgUE9VTElRVUVO
IDxhcm5hdWQucG91bGlxdWVuQGZvc3Muc3QuY29tPjsgYi0NCj4gcGFkaGlAdGkuY29tOyBBbmRy
ZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+DQo+IFN1YmplY3Q6IFtQQVRDSCB2MTQgMC81XSBFbmFi
bGUgUmVtb3RlIEdQSU8gb3ZlciBSUE1TRyBvbiBpLk1YIFBsYXRmb3JtDQo+IA0KPiBGcm9tOiBT
aGVud2VpIFdhbmcgPHNoZW53ZWkud2FuZ0BueHAuY29tPg0KPiANCj4gU3VwcG9ydCB0aGUgcmVt
b3RlIGRldmljZXMgb24gdGhlIHJlbW90ZSBwcm9jZXNzb3IgdmlhIHRoZSBSUE1TRyBidXMgb24g
aS5NWA0KPiBwbGF0Zm9ybS4NCj4gDQo+IENoYW5nZXMgaW4gdjE0Og0KPiAgLSBVcGRhdGUgZ3Bp
by1ycG1zZy5yc3QgcGVyIE1hdGhpZXXigJlzIGZlZWRiYWNrLg0KDQpIaSBNYXRoaWV1LCANCg0K
Q291bGQgeW91IHBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3UgaGF2ZSBhbnkgZnVydGhlciBjb21t
ZW50cyBvbiB0aGlzIHZlcnNpb24/DQoNClRoYW5rcywNClNoZW53ZWkNCg0KPiAgLSBBbGlnbiB0
aGUgcnBtc2ctZ3BpbyBkcml2ZXIgd2l0aCB0aGUgcmV2aXNlZCBncGlvLXJwbXNnLnJzdC4NCj4g
IC0gTW9kaWZ5IHJwbXNnLWNvcmUgdG8gZW5hYmxlIHByZWZpeC1iYXNlZCBtYXRjaGluZyBvZiBS
UE1TRyBkZXZpY2UgSURzLg0KPiANCj4gQ2hhbmdlcyBpbiB2MTM6DQo+ICAtIGRyb3AgdGhlIHN1
cHBvcnQgZm9yIGxlZ2FjeSBOWFAgZmlybXdhcmUuDQo+ICAtIHJlbW92ZSB0aGUgZml4ZWRfdXAg
aG9va3MgZnJvbSB0aGUgcnBtc2cgZ3BpbyBkcml2ZXIuDQo+ICAtIGNvZGUgY2xlYW51cC4NCj4g
DQoNCg==

