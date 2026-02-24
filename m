Return-Path: <linux-gpio+bounces-32136-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHLzI07KnWmxSAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32136-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 16:57:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F071896CE
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 16:57:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A39BB3004435
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 15:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C91A29D266;
	Tue, 24 Feb 2026 15:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mkILOyVk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011063.outbound.protection.outlook.com [52.101.65.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E973A6405;
	Tue, 24 Feb 2026 15:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771948611; cv=fail; b=ajXl88eLjM4cVJ9tGh13vcZqTgeSVzx3rwEWRDnbvm0CZZBUdzhEWGjRifnFClPktDgOonJRdL7rD3nBDrPGAWCYSj9DJPfDSrA+Qtgx+Qxwgcz5hFwqr8mHUQsNW8GcEuuVjJeZMA55ZvssY3Ndqe5810wNcmzA1BpUhHeeCmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771948611; c=relaxed/simple;
	bh=Jl/lajUcJ6P+Q1e1KyQrs4lV4SA4+E6Cl/azV1fsy0E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TmUj1E3AbdcE0A0PtoJ3RG57C6h9lC2X8wwGXGhP0kGtariHIPXbSEQZlJlLsp0Da30/fYlgk93Y/3mWkqeXD+UnzZf2dvSr8+M9xdyoX87k4w7IW3eNinbHtxAEDZcwbqrW0SVSk/bR3MPL9HqMsa9iK81lvXDWI2T2/i3BXws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mkILOyVk; arc=fail smtp.client-ip=52.101.65.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqf8Q1oqBbpwHBL3nZV+Wa7aIKrP87VrrzKJqYUs9P5gaZiPuoKBfOPBRIreoM4JSzbFfJyLVo0cYN5KrLqVgTfrzD44R0idYTG1eNHxB71Du+LRzPvyetnvC815uOKhVxfOBCsVuJsUtV6NpsApoOmgEkmYSA7ASsGaSWEAQVmCwcKPf7dJaDKVYJ4rWm17h664QC+4HCm7t+9o1pn5YFX3u3F+sMdB0sMGazExvoQNnBS8j74CUyBIGZUGnANkde4DeVSngxBboJETjMACEJ84NiQwJxiI0aJcnN0TPvBtE5vEmDF2Br1WXAsQzzFdyCGX0+k+Z4J9bTGtdT3G7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jl/lajUcJ6P+Q1e1KyQrs4lV4SA4+E6Cl/azV1fsy0E=;
 b=H9zV9cYUliAb0MPcSF3bnW8dKKWjfRtbyyB7a+1s2EK7x/lRRAo4JspXUmpmrKg3XFUbfVrSvx8A31Om8JToK3+kO7Lm5IDK/x3S4Bi1VRJvkh2HUhaEtNcbY58H3U03Rs43MCpO4J5sVNZM7Kt+y8V+Ge9TH9qzDwnlXV7Wz4fEzEHRZGJ0wDUhriKut8ffHNchXF7VJ43WUba/RU/nTpfPkDRGx2fla1CBMHEZXXRngO/9GiVDtBOi683HP/RtplxghPQgbnMwxUpqWhJ0Yx3EhMhex1/iSKwjWfCqk/CQHYSrkGi1ElROMSmsE2+KzSgy7rK3MXVrKkHrUIRRDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jl/lajUcJ6P+Q1e1KyQrs4lV4SA4+E6Cl/azV1fsy0E=;
 b=mkILOyVkv7YWkAd9rTRE/QOdUARypUjcKJF0BpAa0Z7rTdVH4xJBLdcfqlINqfhQZgJMgz7eNxovOZw83++evHrbl1jDTTJTgp4asR97XHnuXCE7qDM83qhZmnrwNqltWjLCMCPHjYZWkBlVr0/Rofz5p5rCPn8gsD+qBEi3HWq+bX5Kb7yD30yvz7CiwkaCd0etmnxAwzK2Lu/5J9BbwWHklTDSxKlfanoHW2q8KogZCW77+4DTAbFD1Zy1po+a2J1sdqjZ/H8mMjwusSMkiADToc/gn+t5Aywq29btz0NPVnS3LhtV5MFP6FCQzTVOdvJgK3hqp49+4lOAQ0sz9A==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by VI0PR04MB10462.eurprd04.prod.outlook.com (2603:10a6:800:231::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 15:56:46 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 15:56:45 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, Arnaud POULIQUEN
	<arnaud.pouliquen@foss.st.com>
CC: Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Bartosz
 Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Frank Li
	<frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan
	<skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHcpaYtdzi2pyWaOEmnCqo0H3Nutw==
Date: Tue, 24 Feb 2026 15:56:45 +0000
Message-ID:
 <PAXPR04MB9185588C1DB71B1FEFA1DEE38974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch>
 <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com>
 <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch>
 <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch>
 <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
 <nbzdtngifwrx2kyu4tsiwwua5v4i5cjtaotemq5hubaets3bcn@fk25twf5rv6x>
In-Reply-To: <nbzdtngifwrx2kyu4tsiwwua5v4i5cjtaotemq5hubaets3bcn@fk25twf5rv6x>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|VI0PR04MB10462:EE_
x-ms-office365-filtering-correlation-id: 2b667efd-630a-4edc-2723-08de73bd4fd8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?a3NJOHhQRmZScGt5Q1BZazdrK3liZnBYc1liS2J3WndodmtUK3hmYmwySHUx?=
 =?utf-8?B?NlJaZEs0MDFGbFgyM1g3RXdvejdtWWpTamV0SWZLWDNRakR6UXVNQzBvSmdJ?=
 =?utf-8?B?ZUFJQkxxT1VTT2FOOEVHOFJuZmhSeEM0V250dEx0RkQ4OUhXbDh6UVJvZWpU?=
 =?utf-8?B?Vkp6ZEFlSDEwSStUQVdaYzNKcjVmYUxHVmlDK1F5Y281VzEvUURzRHVuQmgy?=
 =?utf-8?B?VlUvbkpFOG1sZVNTMkMzRjdiZ2NHT2w0ekdBRXVXZ3Qyc2RvaXdyQW14MUFp?=
 =?utf-8?B?ZW5wemxFNWlFbE9LbEcva0hmSTZkU2ZUUzZUL2dnckQyYXo1SVhOQnI4UFRY?=
 =?utf-8?B?UlFvSHFYUE05Uzhmdm5oTTlXZ3c0dFBDVVg0S2M2cWNtRzMwdC9SOTB1V2N4?=
 =?utf-8?B?TTFYRnZYSXlUOFlEVWZRVmIxZTlNczlBSU1SRWdyYjFCZmdydlNpTkMxRGQr?=
 =?utf-8?B?OExPMERUTzNDYnZYTFZVUlo1Y3FzMU1HbkJZQWVqZS9nWEE1UkRxU2c5ZXEx?=
 =?utf-8?B?aWR0S2dNaHE3b1Iya3lzdWZaU1hIMHNKMnNDeWZCOG1wN29SMDNMZGk3Z3g1?=
 =?utf-8?B?QTE3bW1ha0F4SHcyaDdEMVVZTUVhME4zenBWclR0UHlBU1VLaFhQYXM2YVZr?=
 =?utf-8?B?SXNabWNzNDBCOEZSVTJLYkk2aml4bE1nNmt5NzZLY0hKU1pZVDhzMmNhOEtW?=
 =?utf-8?B?NDdyQWlXSVIyUDhNMWR1d29DbDE2MHZDN25ZaGpWTC9zRXZWK2prWERmaXVw?=
 =?utf-8?B?SXBHUlNVQWMwcGNib2lQcHhrdk9IeG8wY1JxTm1CNmVONmhYOW9vVWZXWFFq?=
 =?utf-8?B?eEFsZnF3NEV3TVM0cjh3dnlHNU5nZ0tRRkw5NFlPTmVYalp6dkg5aVZ0Vlg1?=
 =?utf-8?B?L0tGVjlHc2ZvOUZYQ0hERGRENTVnRk5BVU15cHh6Sy9JVDRKWTZNdUdDUUFs?=
 =?utf-8?B?V3ZCc1NJQlZ5L1FGT3JJdGtLN1djc2srbHZLNG9QZDBmVzVObFRJWkhJZDF0?=
 =?utf-8?B?R01UY3lDR1RUT21MVWdYcmVsQW5pcmxiUGp6VDdCby9sekZmRkVrRElKbldk?=
 =?utf-8?B?Z3BNMFdNOHRsRDg5Z2puVmcySGdEdDg0ZWRqWlJJdGFhbkJqa0Nvam1qQVNF?=
 =?utf-8?B?V1prcFcwWGJ0dFBHNjM1L3N2VG1rU0tJL3c5dmlFcjhyblQwZU1Wd08yREs3?=
 =?utf-8?B?ajdnejZrQ3ZIeXU0ZzhYT1BNZHF4OVRqSjJhd1diV2xhU2xPSExGSDNXYWhs?=
 =?utf-8?B?clhMOTdPcUhQZ05nWWRmZDhVcTFxWC9jaWlmMGtRODc3VUsySmtqbVhRV2Jk?=
 =?utf-8?B?bGJlREpvaEJiaDgraW5nSGF1S1dqaERsbGt4VkFvSVFtZGRxQy8yOUpkR2dt?=
 =?utf-8?B?Z1o2L3RKQmxDaFpDd1lBSHNsVHp1VElkYVJqY3paT3NUOFRGK00xNlZ3ajJo?=
 =?utf-8?B?N0I4bXV6YjZ3Q3RyL2lsRllYNDJFdzJDK2JSZWk5YWJsU3BaeXJOOXRTSXlv?=
 =?utf-8?B?SGhzeVVOUXFOUHNoM1QzaEVybi9kMkhpcEdnVDRyNThMWVowaDZUeFNzejBD?=
 =?utf-8?B?MGJCRWlORWJpZkhEVURzSm9xMWtmVXY1NExlWnBxUENqeTRYdXo1L3BvSngv?=
 =?utf-8?B?SWhDWFR0K2pNVmJkMjh1Qm9hdFZoSzk1Q3RYeVRtUWpuWi9JN25PMEVKdncw?=
 =?utf-8?B?RzBxL3J3Zi9adUxtSFR1dmlLYzg2aS9qZ3RjaHZqRE5CT0hmVVpSaXlrREJv?=
 =?utf-8?B?MUt4TmNmK09BbHNtOVZYQW1GdllxRjA4QWwwakxtOVdvR0FpOU1FU004cmp6?=
 =?utf-8?B?Wno0K0l2Y2EyN3F0QUR6RU9lVjFCMlN1NkErZXJBNHh5c3M2NlVrek03YjI0?=
 =?utf-8?B?WGVpTFVDQjRFOVZXK1Q0bDFncEtCTWFKNTRzeVVxRzE1YWxiN1J4c3VkMVZz?=
 =?utf-8?B?b0NiTS95Rzdzb3cvZ2tTQ3lLblM1S1B5TGQyMGJlRVpvaUZXYW5Md0dqam5x?=
 =?utf-8?B?d2RwNHBMZTR2dkJsOGxXUWpBelpBMlN3VGN6UTlIQ2J3L1JCcTFMRFNnZTA5?=
 =?utf-8?B?VVBmaU04VkQwNWVOZTBkNis2cjdLc05ydEhFTWY0U1MzMjk0ZVQ5UDl4MnRI?=
 =?utf-8?B?SVZNZU92dEtBSFgwY0FVVmRMRk5rU2VaZ2orRjVsd05WWUREZDI2L29qTjlI?=
 =?utf-8?Q?YIJukDhUQSTqwZHZqn/UHM4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cmlnNWxVMlkxdzNKNTAyQm5ZYmR3bFk0c3VUM3pXdUhHd0N3VTBOT2FzNXRr?=
 =?utf-8?B?clhLVkxZbVdKNW44YkluMmo5c2w0aGxvZmlBTDRXQTJ0SWVFWmZpQW5UKzFz?=
 =?utf-8?B?SHR1c0h3aEhDTlZwQUFWOE5kYjVzZy8xRDBObSs1NVZna2NpWXhNdUhScWpu?=
 =?utf-8?B?K2FsaGxoM2hWYk9qbmdMZVA0YVRmTHg4cmxMNlhxYnYxTnJrZmUzR0pwSzZt?=
 =?utf-8?B?dWhxVmlrQ0oyaWxyZEptZXNVdlhNYVl1MkpzTmJqSEcwODRwd0V1L1dUb1k0?=
 =?utf-8?B?MkRoY0tlWHNFSlpDY1VlTXY3Snp5bWtFMW4rckxFQmxjZE1GOFNaVTNMaHJv?=
 =?utf-8?B?Q3JPZHBxamd3dlF3QmhaN25XRmlBclZONktDdHU5YlBUalBCeW04WnpyTHlX?=
 =?utf-8?B?ZllEV2c3Kyt3bzNvM2VDS2lUTXAwZ0xTR3Qyd0JIU1JjUkh4NGVsRUpZMFVI?=
 =?utf-8?B?SGc5TFUvM1haUW5CK2FwaVRMc2h0OU5SNnFFMzVyZGh6LzBCWlJ6UWxoU0ls?=
 =?utf-8?B?U0RLSGVWZ2U5T2hWbTNZOVUvMzlLTE9MYXp2Z01RNlZJN3R2MHNaVE9UNVVO?=
 =?utf-8?B?ejI1djk3UTlQOUx6a0VKNmNNa0J0YUt3SlJKeWhQWWJnWVZ4dzZKZmcyS1RW?=
 =?utf-8?B?aVkxekl2VWY5WTBaRU1rcTVnTy9VRGI4SmhmVE1NWDAwd25BK2ROa1c5ZFA3?=
 =?utf-8?B?V0lsM0F4VlFnQ0ZNUUdxOGZHSEVYSUZqZFhNTUFMUmZJTzdYZjF6eDdXMXls?=
 =?utf-8?B?TS9MdHFnYXJaQXUrcXloOVg0TEs4QW1qKzBmcGtFQ2gwbnlvNlAyb0ZDZDNW?=
 =?utf-8?B?QU5UcE5kR3h4LzZiUWEreGN5NVBvRGFNN3pnOWNPUUptcXhDUTVodEdJR0xp?=
 =?utf-8?B?TzBTR201SWlCeDZHZm1pSWI0WlNYbkVBbnFBTFUrU1QwbS80cENDYVpuVzky?=
 =?utf-8?B?V0J0bTY4eXhPaGREamZmY082aXBJNDVjMllOdzhMcVRGLzFxSlJUQ1preFkz?=
 =?utf-8?B?d25GTGpBV0VBS2xQa0RMN2hrS2xyS0pXTTYyUjF4UTdCYThvcXN5bmhMVzIy?=
 =?utf-8?B?Mll0WlhhbzAvUExER09NMFpuMUFsZGRZQ2JDYUpjdHJxenZmVHpLUzRlTnlq?=
 =?utf-8?B?eXIwQWJROEdlbFBvUmFXblIwcE5sd1NkWHZZcDVycXdRa3pnZHVBNkpYYWpq?=
 =?utf-8?B?MnFVT1hkSzJsdWRURS81WVNGQ2djSEJ0RllxaE1SWWphZXJYKzVtd2pxTk1y?=
 =?utf-8?B?YWxGRW5ueG5vdDE2eTFyUm13dFd6ODdDaHI5Wk5BdXFFRVdnb2swTGF1RVlx?=
 =?utf-8?B?RllYaWJocFArVEh5aHhxd3p2M01NTTBUTE95bWh5VEgvT3dVWHhCR003VmN3?=
 =?utf-8?B?ZGdrNElHZVQrS0RhVzNEckdFNnlQMDBYQ0U5bDZ2RmorKzNydkllMGJuTG5V?=
 =?utf-8?B?ajFSZ2VrSEhVV21GS1JsTWFMUzVnWVdHeC9Mczg3aVcxK0VBOVJGRmxsWUlZ?=
 =?utf-8?B?Nkp1S2FXTW9IajdPaXhLNkltcmsreWc2MmVxTmErNk9GV3Yxbmo1MlcweDlX?=
 =?utf-8?B?dDhHdWF1VW52Z0VPR0ExZUpZb3FvdEVZa3JIZGR6cm5Ud0xIejhReXdqZ2xw?=
 =?utf-8?B?L1dXTGp4UU1ZSTJkMG5JcWtUcnlCV0JhVDNOK0Z3ZmJEOHFTMVlveEhhS2Jr?=
 =?utf-8?B?UUp2VWkrTGhoY0FsaGxLL2hRY3ZUMmtld1RXeENwN1Y0Y2FjVGo1WllXU1g2?=
 =?utf-8?B?NEo0U2xOSVo4bmJwMmphQnhtcTNtUWlRMzk4QVM0enlQRWtQd0FaOG84WU5I?=
 =?utf-8?B?ajJTV1J4WVozK1ZzakRBRUpYci92K2tVYmZlN3NjZXZJU1IvN0VINUViV2Zu?=
 =?utf-8?B?aGc4NElPcGNOenFmRnJCVHN6YUFWTU1QbmZrSTNrcmc4RUNNUy9vb1lBWFZJ?=
 =?utf-8?B?VHhudWszYVR4czhjcHJmQndlM0JvY2tkZHA4Z1YrbC9tMi85bnlHSlZ5Y1Vp?=
 =?utf-8?B?R09od1lENG1TUnYxUXhxWU5KYWMxVTVwZjg0ZzUwNk1UL3ovNGxWM0NycFJ6?=
 =?utf-8?B?OXVEeVRub054RDNaZWVuTUgzb2dNcUxQMlN2U3JGaWZrK1k5UGpjZzhPTFU1?=
 =?utf-8?B?NElIUU5JQlJ3c1BPK3VPSG9vdm9qSndrR010V3MvRUZYWDEwSVlBNkE0cXhp?=
 =?utf-8?B?S29KeGVndGZ5SHdLNHpmb21GNGJiZXorNWV0em1Sa3dFM2VOeFVDdGtUaHl4?=
 =?utf-8?B?c3B3bUpqNkNtSFFDOEVVM3ZPeFJIQ1kzMVFUNzlYb1NEN2s4b3lCdnBVdFNs?=
 =?utf-8?B?NHhWMTYvRk9BQXIwWjE1c3FEZVU5Vy83anhZTVNUdE0wYlBVamVVZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b667efd-630a-4edc-2723-08de73bd4fd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 15:56:45.8749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yRtdSQmrmmh5Fk3t5mbZlLIxgARgVAGLeW5g7mrziat5JZrMyBwFnhyhUvbNcday+GZ7ssjjWzT8gBDJ316s7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10462
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32136-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lunn.ch,lwn.net,linaro.org,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.969];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A5F071896CE
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmpvcm4gQW5kZXJzc29u
IDxhbmRlcnNzb25Aa2VybmVsLm9yZz4NCj4gU2VudDogTW9uZGF5LCBGZWJydWFyeSAyMywgMjAy
NiA4OjQzIEFNDQo+IFRvOiBBcm5hdWQgUE9VTElRVUVOIDxhcm5hdWQucG91bGlxdWVuQGZvc3Mu
c3QuY29tPg0KPiBDYzogTGludXMgV2FsbGVpaiA8bGludXN3QGtlcm5lbC5vcmc+OyBTaGVud2Vp
IFdhbmcNCj4gPHNoZW53ZWkud2FuZ0BueHAuY29tPjsgQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5u
LmNoPjsgQmFydG9zeg0KPiBHb2xhc3pld3NraSA8YnJnbEBrZXJuZWwub3JnPjsgSm9uYXRoYW4g
Q29yYmV0IDxjb3JiZXRAbHduLm5ldD47IFJvYiBIZXJyaW5nDQo+IDxyb2JoQGtlcm5lbC5vcmc+
OyBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkN
Cj4gPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBNYXRoaWV1IFBvaXJpZXIgPG1hdGhpZXUucG9pcmll
ckBsaW5hcm8ub3JnPjsgRnJhbmsgTGkNCj4gPGZyYW5rLmxpQG54cC5jb20+OyBTYXNjaGEgSGF1
ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+OyBTaHVhaCBLaGFuDQo+IDxza2hhbkBsaW51eGZv
dW5kYXRpb24ub3JnPjsgbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBkb2NA
dmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBQZW5ndXRyb25p
eCBLZXJuZWwgVGVhbQ0KPiA8a2VybmVsQHBlbmd1dHJvbml4LmRlPjsgRmFiaW8gRXN0ZXZhbSA8
ZmVzdGV2YW1AZ21haWwuY29tPjsgUGVuZyBGYW4NCj4gPHBlbmcuZmFuQG54cC5jb20+OyBkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IHJlbW90ZXByb2NAdmdlci5rZXJuZWwu
b3JnOyBpbXhAbGlzdHMubGludXguZGV2OyBsaW51eC1hcm0tDQo+IGtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnOyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPjsgQmFydG9zeg0KPiBH
b2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCB2
OCAzLzRdIGdwaW86IHJwbXNnOiBhZGQgZ2VuZXJpYyBycG1zZyBHUElPIGRyaXZlcg0KPiBPbiBN
b24sIEZlYiAyMywgMjAyNiBhdCAwMzoyNDo0M1BNICswMTAwLCBBcm5hdWQgUE9VTElRVUVOIHdy
b3RlOg0KPiA+IE9uIDIvMjIvMjYgMTU6NDgsIExpbnVzIFdhbGxlaWogd3JvdGU6DQo+ID4gPiBP
biBGcmksIEZlYiAyMCwgMjAyNiBhdCA3OjU34oCvUE0gU2hlbndlaSBXYW5nIDxzaGVud2VpLndh
bmdAbnhwLmNvbT4NCj4gd3JvdGU6DQo+IFsuLl0NCj4gPiA+DQo+ID4gPiBJcyBpdCBnZW5lcmlj
PyBJZiBpdCBpcyBub3QsIGxldCdzIGNhbGwgaXQgIk5YUCBycG1zZyBHUElPIGRyaXZlciINCj4g
PiA+IGFuZCByZW5hbWUgZmlsZXMgZXRjIGFjY29yZGluZ2x5LiBNYXliZSBpdCBjYW4gc2hhcmUg
Y29kZSB3aXRoIHRoZQ0KPiA+ID4gYWN0dWFsIGdlbmVyaWMgUlBNU0cgZHJpdmVyIG9uY2UgdGhh
dCBhcnJpdmVzLCB0aGF0IGlzIG1vcmUgb2YgYSBsaWJyYXJ5DQo+IHF1ZXN0aW9uLg0KPiA+DQo+
ID4gSSB3b3VsZCBsaWtlIHRvIChyZSlleHByZXNzIG15IGNvbmNlcm5zIHJlZ2FyZGluZyB0aGUg
Y3JlYXRpb24gb2YgYW4NCj4gPiBOWFAtc3BlY2lmaWMgZHJpdmVyLiBUbyBjbGFyaWZ5IG15IGNv
bmNlcm5zLCBTVCwgbGlrZSBwcm9iYWJseSBzb21lDQo+ID4gb3RoZXIgU29DIHZlbmRvcnMsIGhh
cyBycG1zZy1ncGlvIGFuZCBycG1zZy1pMmMgZHJpdmVycyBpbiBkb3duc3RyZWFtDQo+ID4gd2l0
aCBwbGFucyB0byB1cHN0cmVhbSB0aGVtLg0KPiA+DQo+ID4gSWYgd2UgcHJvY2VlZCBpbiB0aGlz
IGRpcmVjdGlvbjoNCj4gPg0KPiA+IC1BbnkgdmVuZG9yIHdpc2hpbmcgdG8gdXBzdHJlYW0gYW4g
cnBtc2ctZ3BpbyBkcml2ZXIgbWlnaHQgc3VibWl0DQo+ID4gdGhlaXIgb3duIHBsYXRmb3JtLXNw
ZWNpZmljIHZlcnNpb24uDQo+ID4NCj4gPiAtIElmIE5YUCB1cHN0cmVhbXMgb3RoZXIgcnBtc2cg
ZHJpdmVycywgdGhlc2Ugd2lsbCBsaWtlbHkgcmVtYWluDQo+ID4gTlhQLWNlbnRyaWMgdG8gbWFp
bnRhaW4gY29tcGF0aWJpbGl0eSB3aXRoIHRoZWlyIGxlZ2FjeSBmaXJtd2FyZSBhbmQNCj4gPiB0
aGUgbnhwLXJwbXNnLWdwaW8gZHJpdmVyLCBsZWFkaW5nIHRvIHBsYXRmb3JtLXNwZWNpZmljIHZl
cnNpb25zIGluIHNldmVyYWwNCj4gZnJhbWV3b3Jrcy4NCj4gPg0KPiA+IC0gVGhlIGltcGxlbWVu
dGF0aW9uIHdpbGwgaW1wYWN0IG5vdCBvbmx5IHRoZSBMaW51eCBzaWRlIGJ1dCBhbHNvIHRoZQ0K
PiA+IHJlbW90ZSBzaWRlLiBJbmRlZWQsIHNvbWUgb3BlcmF0aW5nIHN5c3RlbXMgbGlrZSBaZXBo
eXIgb3IgTnV0dFgNCj4gPiBpbXBsZW1lbnQgdGhlIHJwbXNnIGRldmljZSBzaWRlIChaZXBoeXIg
YWxyZWFkeSBpbXBsZW1lbnRzIHRoZQ0KPiA+IHJwbXNnLXR0eSkNCj4gPg0KPiA+IE1haW50YWlu
aW5nIGEgZ2VuZXJpYyBhcHByb2FjaCBmb3IgUlBNc2csIHNpbWlsYXIgdG8gd2hhdCBpcyBkb25l
IGZvcg0KPiA+IFZpcnRpbywgc2VlbXMgdG8gbWUgYSBtb3JlIHJlbGlhYmxlIHNvbHV0aW9uLCBl
dmVuIHRob3VnaCBpdCBtYXkNCj4gPiBpbmR1Y2Ugc29tZSBkb3duc3RyZWFtIGNvc3RzIChTVCB3
b3VsZCBhbHNvIG5lZWQgdG8gYnJlYWsNCj4gPiBjb21wYXRpYmlsaXR5IHdpdGggbGVnYWN5IFNU
IHJlbW90ZSBwcm9jIGZpcm13YXJlKS4NCj4gPg0KPiANCj4gQ291bGQgdGhlIHZpcnRpby1iYXNl
ZCBtZWNoYW5pc20gYmUgdXNlZCBkaXJlY3RseSAod2l0aG91dCBycG1zZyk/DQo+IA0KDQpUZWNo
bmljYWxseSwgeWVz4oCUaXQncyBwb3NzaWJsZSB0byB1c2UgdGhlIHZpcnRpbyBtZWNoYW5pc20g
ZGlyZWN0bHkgd2l0aG91dCBycG1zZy4NCkl04oCZcyBhIGJpdCBsaWtlIHRhbGtpbmcgc3RyYWln
aHQgdG8gdGhlIElQIGxheWVyIHdpdGhvdXQgaW52b2x2aW5nIFRDUCBvciBVRFA6IGRvYWJsZSwg
YnV0IA0KYXQgYSBsb3dlcuKAkWxldmVsIGFwcHJvYWNoLg0KDQpBcyBmb3IgdGhlIGlkZWEgb2Yg
Z3Bpb+KAkXZpcnRpbywgd2hpY2ggY291bGQgYmUgYW4gb3B0aW9uYWwgc29sdXRpb24gdGhhdCBj
ZXJ0YWluIGN1c3RvbWVycyANCm1pZ2h0IHByZWZlci4gSSByZWNhbGwgaGVhcmluZyB0aGlzIGlk
ZWEgZnJvbSBNYXRoaWV1IG9yaWdpbmFsbHksIHRob3VnaCBJ4oCZbSBub3Qgc3VyZSB3aGV0aGVy
IA0KaGUgcGxhbnMgdG8gaW1wbGVtZW50IGl0Lg0KDQpBcyB0aGUgY2hpcCB2ZW5kb3IsIE5YUOKA
mXMgcm9sZSBpcyB0byBwcm92aWRlIGFsbCBwb3NzaWJsZSBvcHRpb25zIGFuZCBsZXQgY3VzdG9t
ZXJzIGNob29zZSANCnRoZSBhcHByb2FjaCB0aGF0IGJlc3QgZml0cyB0aGVpciBuZWVkczsgd2Ug
ZG9u4oCZdCBtYWtlIHRoYXQgZGVjaXNpb24gZm9yIHRoZW0uDQoNClRoYW5rcywNClNoZW53ZWkN
Cg0KPiANCj4gSWYgbm90LCBpdCB3b3VsZCBiZSBnb29kIHRvIGRlcml2ZSBhIGdlbmVyaWMgcnBt
c2ctZ3BpbyBwcm90b2NvbCBmcm9tIHRoZSB2aXJ0aW8NCj4gcHJvdG9jb2wsIGFuZCBsYW5kIGlt
cGxlbWVudGF0aW9ucyBvZiB0aGlzIGluIGUuZy4gTGludXggYW5kIFplcGh5ciB0byBlc3RhYmxp
c2gNCj4gdGhhdCBvcHRpb24uDQo+IA0KPiBSZWdhcmRzLA0KPiBCam9ybg0KPiANCj4gPg0KPiA+
IEluIHRoZSBlbmQsIEkgYW0ganVzdCB0cnlpbmcgdG8gaW5mbHVlbmNlIHRoZSBkaXJlY3Rpb24g
Zm9yIFJQTXNnLCBidXQNCj4gPiBiYXNlZCBvbiB0aGUgZGlzY3Vzc2lvbnMgaW4gdGhpcyB0aHJl
YWQsIGl0IHNlZW1zIG90aGVycyBzaGFyZSBzaW1pbGFyDQo+ID4gZXhwZWN0YXRpb25zLCB3aGlj
aCBzaG91bGQgcHJvYmFibHkgYmUgdGFrZW4gaW50byBhY2NvdW50IGFzIHdlbGwuDQo+ID4NCj4g
PiBUaGFua3MgYW5kIFJlZ2FyZHMsDQo+ID4gQXJuYXVkDQo+ID4NCj4gPg0KPiA+IEkganVzdCB3
YW50IHRvDQo+ID4NCj4gPiA+DQo+ID4gPiBZb3VycywNCj4gPiA+IExpbnVzIFdhbGxlaWoNCj4g
Pg0K

