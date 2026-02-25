Return-Path: <linux-gpio+bounces-32177-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIPzKgYTn2nWYwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32177-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 16:19:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6595119973A
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 16:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC5DB30143E1
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 15:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7A63D3D0C;
	Wed, 25 Feb 2026 15:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Afviwg3x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013039.outbound.protection.outlook.com [52.101.83.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32ACA393DE3;
	Wed, 25 Feb 2026 15:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032739; cv=fail; b=uBvfCYZJdTQpVC84NU4GT2+oWyY5zfFFOxfJSDS6qdB/5msbT6f80TeOirNt5qGi6uL8eH00A3YFx/UvJomGivigAmsQYWujhPpsxiLFEmNTskp0NgjmhvKUrDn8f7svXHAOdfzG+qnIBIGNMyHv2To3iInvMq+KO5NnaZ0w//M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032739; c=relaxed/simple;
	bh=btXdXTRM70t1yv9PRVtqcoDcM36nq67BdtMJ7XI5Mv8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qfQngxijTL+hO9sup0y0GHIS3Bu3cwYf+Z3FXqh3hPjZI2qZZNQN5WKJGWELcwr66T+/Dv/kMSg43fXGWxJJX+aG3rlhoX40/hSOEBSmCg2bZYlBHJCxmZS8UdeI13rm+NzXd4M10MiLz9KP71DG4Gf6OII13B+c7m/A8r5lgiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Afviwg3x; arc=fail smtp.client-ip=52.101.83.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=esGzMRdGYRU6A60qS4V3e1KcOkBTX1Q/44sLToH09V04G4dQB3GFIC9FVWQbFSVCAJFFy7QoXN/C1gA9eu6vMaqlrYcbf1bTAg3geHWgdCr9SYen73swklb8vo7S4JMH0hfuTrMvSXXLfTiAKB4fENwjBv6VFXkRxeOPXxgYqYp/51Xu0Dyjr9csuhmIcYbSFJn+sWCEjo30Y5aS4TmItujnt1aDZy3pf5+kMCalcW70tGNVYQZ3b9Tt0eXQBoUa+UdEViUo2p7Ao5I4WESsuSsLexmsLOD8c9jEQIwLvkPyQxWdPU788kPqUnJG/AmPOAJebE63x4wS0POK/AJWZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btXdXTRM70t1yv9PRVtqcoDcM36nq67BdtMJ7XI5Mv8=;
 b=EJaDoY8Nl2Dunaog9pL5aHlGLFrWjUeA44smd8ZcpbYtCsouh8bRHFWhNccL4eBzItJoW3WiSySxUdBbGkxKpUiWYKONYOz5eZVo2qDaODbJKMSm1ZzWX9THzBzIG0VtUBYpzERRUEjQ1+ve8OBfKPFFxkeWqcM7VQTb9eW0h/OgLCeC7sENO/2emzl9le5LL0U+Fu1321eTgcpWMlgv8mglCdSavcfwDOqNcE6S7VdrV8n3+yVCwsBU9thQ7Q6YHvdopv5S/QVArpkflYDECZKklWWmjS0pkVnZ1TnWwhWImCWa2VqQZTHLi/QIBUDeQf/MmhJyMaD0gyyU0yrffQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btXdXTRM70t1yv9PRVtqcoDcM36nq67BdtMJ7XI5Mv8=;
 b=Afviwg3xuaIxA6xAuSSK9PM4EUkK+Q8ggWJUP7MWYVYrj/djw8LeY78JNMTOoizZvFyKmokr3aPaJmiWQ2cNd28izc6jyVv3XWdGPrIZ8zeerMZ893Z0AVuAJZMBQl8fizhEJdMfQ5ITnASStGf751pZnPdp/Y1Jq3WDCcVf3oPacqe7j325Qcr6YlMSkWBaWZ0+e1JoCklZ+F2LgLOEzntVtAyiEg4PFp3D1DI2BuePcqC3r4UKVWWRItfkHNQV6HEssVq3QlPmusB93lyoF7qsMYlOXA3kOBc8q0f0F3iMZJ6yf4SPaIBP1k4vW2P7IFGQPlnBAxVcBFbOWEzlqg==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by VI0PR04MB12133.eurprd04.prod.outlook.com (2603:10a6:800:313::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 15:18:53 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 15:18:53 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Andrew Lunn <andrew@lunn.ch>, Arnaud POULIQUEN
	<arnaud.pouliquen@foss.st.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Frank Li
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
Thread-Index: AQHcpmoNWPeK2qk9+E2mvSUZ/VEFwQ==
Date: Wed, 25 Feb 2026 15:18:53 +0000
Message-ID:
 <PAXPR04MB91858F4CFA8DC70253F02DC08975A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
 <PAXPR04MB91859B642802813F908B03DA8977A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <64ef5dbf-6264-4758-a5d8-d8c52c359fcc@foss.st.com>
 <PAXPR04MB9185934EB640E8B21905FF878974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <79eb8bb8-83cb-4b24-8e56-42a53c710055@lunn.ch>
 <PAXPR04MB9185F1A67384E4886282227A8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <91701822-df30-4feb-9e9a-4ee82e2a5d23@lunn.ch>
 <PAXPR04MB9185FD3EEC313CC2408E157F8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <0b42e303-a2ed-4983-bee5-a4eafd6c7f36@lunn.ch>
 <PAXPR04MB918509F265757E6028B45DDC8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <8fbb4ded-8914-4e11-aad6-038c78f2d31d@lunn.ch>
 <PAXPR04MB9185C388591EC3C9053C262D8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkzzkvSHVWt_DOw8q7DvD3mic12zcNR1wuxrG-_vG+H+JQ@mail.gmail.com>
In-Reply-To:
 <CANLsYkzzkvSHVWt_DOw8q7DvD3mic12zcNR1wuxrG-_vG+H+JQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|VI0PR04MB12133:EE_
x-ms-office365-filtering-correlation-id: 09171636-c79c-433d-815c-08de74812fcf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|38070700021;
x-microsoft-antispam-message-info:
 zqUO15kQj/mXlWM6WwjvrCyoUWHOIBTlIyoZZsESlDigQFfjfQGKlMTivyh/UxuPp6w1CA3k3JQuZgeIN+v2/yrlJW3AQ0iwO8gR0sAZVbKYXJFia9ZP1/0cz7NpTxBQJDzCXcMBdfifqiG1wLQKYAGZlrJlSdPG/+O+jlxlDKqZAcUUlkriTJyQRnNohttE+jKIx7+78tjizyMqSQk1ql4IpcyqKx+zgu8CukFA/T664aJbLNLjBs7O3oGbcLoE3eXWR0qx+tdbKMf5FuO2JQC0Cklp0Ocx7Fc110KF9Nf42zxAQ6etDfXPTYop+l6Ho6amAda5mSapzR3dgOPQaFuQkfvHMwWHVMWm6nWCvb3rTMLON3ujB241z6J82cDkwq99TF36R7ZPSe6d+3Un6ELgjoSQ0WEOCV4qsZQHufkrX6q4E0PVkQamqKEWvaK2rsRfs9hFCGrJ7vPLhzRV+AbbC3NSAMJC8kr7uWFMHXWPxgFwA9O1/+JcmqtDO9gh79SWgbFCTleu27sM/r8z/hTudBr+YMLfARb0Vxt+ENLp3Th3QIyw8jlHUSEm63seKh3QMEEBpERlvXHbBe8+YMCm1Pmls3+ogcNm3sc4DhbNLb3D1TpkxIx9z5ur/YunSY6YjJNJyOcY5DadwDxxSuCB1O9gHCSbjwS7yrii9O51rqBqhZCpZuslvH/dNZZ4XCC2n0dULrt5poPjFlg7rc/lkmKtVDky6JO2X+z2mfc+4R1p7s1JnMz+ojOwFCaRulbFwNyU6N6avpGgM24/nS6LnTWxF1ucHiXUU1V4lr0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q1o3UWVFdkVoR3hTMlMvbTBOUFZBU0drU1c3UDdYY2lrQ1Y1V21qTks5VHNN?=
 =?utf-8?B?V2VROHpUbHJ5N0ZGR2htMVFzTjNoOVRZcGg5QmFwZ0pVNXRtaktMWTFIS0Fw?=
 =?utf-8?B?UCtMMDlHS2o5RjZqMTBtd3I0NWcwR0wyN0ViRUcxYzdFaiszcHJRZnB5VnFa?=
 =?utf-8?B?L2hMYVhxNlVySUpPbDZOcGQ5M1BlY3Z6L0hjeU11a0hmcDI0ODVYajlaN0c4?=
 =?utf-8?B?NFU5TlVBV0wybC9qczA4T0pPNzdITVFoVllWWmhYcVhOaVJhamUwejJUcko0?=
 =?utf-8?B?R2xtUXpINHNudFp6Vi8vamEyQWRrTWtIc0s1SUpueXpSVk9SVDI0enh5WXV1?=
 =?utf-8?B?WnhiV3dlMWRvUmJ4UWRFUnBEY2JTc0d5NVZwd3lpWVA3SjFhQVFSNkpFK3A0?=
 =?utf-8?B?Um45ZnNwZGJ2U21pbGZ4a0w0YTJNTVpGSjF1NlVaZU5VcHIrNVRoWThFVWxR?=
 =?utf-8?B?aE5Va00yOHB4b3pxZnNQenRoMll2emloQTdRalNtY21TSHl6UWJ0SGZkaWVy?=
 =?utf-8?B?NDhoaU9RMGUvNURNRW4zd1RjdzMydU02ZTRpMTc2bnUwejYveEFQdFlIeWpl?=
 =?utf-8?B?UkF5a2tOK0VGcCtSdXVlNVlIMWZ6Ykhwdi9wZG1YZHpaL0RoNVovVThveHhM?=
 =?utf-8?B?U0E0MGFTSk8zT1lPYjEyZi9yWkowNUVLTkJqZkVqM1IxeU5uQm5kZFYyNU84?=
 =?utf-8?B?VmFVTktpeE9paWtOZHR5YmRsQjB5R21ob1VYTzF0ZjhtQWtyQzhPV1g2emJY?=
 =?utf-8?B?REhmUTAwL3dqQUZyczBhVTFWb3BTRkR3SDVjbEFrZjB0SWU5SzN2blZDd3M0?=
 =?utf-8?B?bTNWY2pqWjN3SnhXUFltTzJOM3Rxa1pZeFdsQWVoZ2FWbUNTekp3Wlo5bk1B?=
 =?utf-8?B?M3VUUE1OT3RiZWtKTlA1ZThaRnl3N1QrYk9MYjJPeTBVZXZwVlBDVm8wUkMv?=
 =?utf-8?B?Q1VqNUlONTJ6RTh1aDFoK3N6cks5SXlmeDZiQW1XcS9uZkV2dGMvQ0tYcHU5?=
 =?utf-8?B?bkdXclVzRTFJQk5FbnpPZmJ5VUF0b0xkbXpkc2NxdkFnNkpnVWZpVmxwdXJP?=
 =?utf-8?B?ZDgwVzNXM0t2TnNHSDROTit0MFJNY0M3eDF6bWxWTVZ2L2U0cE1EK2dvRU1F?=
 =?utf-8?B?cUlWMDhkL1gxSXNOZ2R5aHZSUUVVT0ZOeXJDSitzR1JGOTB3YW5penBZNElJ?=
 =?utf-8?B?em9Yd0QyTTJFTDlaUHVGL3RCZ1FqNUFueUlIa1Z3U3QrWU51V3hrUWZsK21H?=
 =?utf-8?B?SkJsNjR5R0d2eHViRGxjaHZFSTBobVpsekJ0aHJzcW9Bc3UwWjVpQVREQXE5?=
 =?utf-8?B?VzBnRmpxQVU3YVA0UFJ5bGRHaGwxRWVwZTduWWhKMC8zNmlyZnM0dUdRTG1S?=
 =?utf-8?B?cDllMmFySFlPRWRPaDNlaWFHdlhucXRnOEp5YWdvbHVpTlRjN2dJSTBBSFh3?=
 =?utf-8?B?VUlRYWNqelREUHlmbjZ1S2h0UlVEdzkrUkwwWVJJZ3JKYmlsQXVJTE5Yc09o?=
 =?utf-8?B?YUwyYTdvN1ZPVUFTdjNtSTJPcksvcjMrMVo2VjZTbHRLMHd1MGtuTkFSUzdY?=
 =?utf-8?B?WU5hbkdHQmU4N0NwUlF6OEI0ZE9GUWF0SU1BQlhWY1E5R3RMOGZjUnlCRkxQ?=
 =?utf-8?B?YjRORnpMMm9hc0hsR2NLeml5dUc3a2JsWC9PbmhrTnVCMCszdjZDY1JsM0xx?=
 =?utf-8?B?N0hwT2VKeDdVMUI3ZWl6c1FZSnExa1BNVkprQWxaQlloY2xZZldNVDR1R0Ni?=
 =?utf-8?B?aFVNVUlqdGo1NE51WG5YSkg5T1BDQThEcy9LaVlpaUE0N0tGNHc3ZCtFblJ4?=
 =?utf-8?B?NGJiK0w0Q0VhVmRkaXR6WmNZUU9xYVZNUWp5dkgzTlRPamFxaks3Z05JVy9W?=
 =?utf-8?B?WmdpRkx0NVNNUnE1eFZXdDZsNlIrNVo1Z2tpNHdhdzQ3UkN0QkVYK1l6T3pP?=
 =?utf-8?B?U3VJUkp4MXFWSE5DejV1Wmd0Z2R2NUtxZTE0SE11MWRaZWlEbkpTSEFuNnhw?=
 =?utf-8?B?ZVMzaFV0YzAvdnFsNGVNUVJNcE1MUFZEVkZ2RHR0NFNWVzAxSXg4YlByT1Ev?=
 =?utf-8?B?RnNvbVZXMnlmbkRUWlVCd3JBdHR2QXlpalVwdkVjWDFKZmludEZvcDdrTTl0?=
 =?utf-8?B?RnVMTnNFRE95d1hzcGlrQ3lqOHlpZ3d1OUFneG1wZUd3MEVsUHNjMitEVUV0?=
 =?utf-8?B?WG9wb2dUY01kd3F6K01qMDdNYnVBWXloWXpBUzByWTFsOW9BUm5iVlkyMlZI?=
 =?utf-8?B?VzNsZk9UcVIzU1NNRG5naS9abExLVy9GK2RDM1pOMkZsZnI4K2VYU3VhaExQ?=
 =?utf-8?Q?qKN2tY8WNtzzCJSptV?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 09171636-c79c-433d-815c-08de74812fcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 15:18:53.4644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pSkKxPujcwRb0f1hhk/CtSlRrXRhM/WgMEJatdm92BbFxxv19AMU/dkPzfmZoAfyxshEjxfcLjyaHBVv5oYUqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12133
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32177-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,foss.st.com,kernel.org,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
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
	NEURAL_HAM(-0.00)[-0.963];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6595119973A
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0aGlldSBQb2lyaWVy
IDxtYXRoaWV1LnBvaXJpZXJAbGluYXJvLm9yZz4NCj4gU2VudDogVHVlc2RheSwgRmVicnVhcnkg
MjQsIDIwMjYgNDo0NyBQTQ0KPiBUbzogU2hlbndlaSBXYW5nIDxzaGVud2VpLndhbmdAbnhwLmNv
bT4NCj4gQ2M6IEFuZHJldyBMdW5uIDxhbmRyZXdAbHVubi5jaD47IEFybmF1ZCBQT1VMSVFVRU4N
Cj4gPGFybmF1ZC5wb3VsaXF1ZW5AZm9zcy5zdC5jb20+OyBMaW51cyBXYWxsZWlqIDxsaW51c3dA
a2VybmVsLm9yZz47IEJhcnRvc3oNCj4gR29sYXN6ZXdza2kgPGJyZ2xAa2VybmVsLm9yZz47IEpv
bmF0aGFuIENvcmJldCA8Y29yYmV0QGx3bi5uZXQ+OyBSb2IgSGVycmluZw0KPiA8cm9iaEBrZXJu
ZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPjsgQ29ub3Ig
RG9vbGV5DQo+IDxjb25vcitkdEBrZXJuZWwub3JnPjsgQmpvcm4gQW5kZXJzc29uIDxhbmRlcnNz
b25Aa2VybmVsLm9yZz47IEZyYW5rIExpDQo+IDxmcmFuay5saUBueHAuY29tPjsgU2FzY2hhIEhh
dWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPjsgU2h1YWggS2hhbg0KPiA8c2toYW5AbGludXhm
b3VuZGF0aW9uLm9yZz47IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gZG9j
QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgUGVuZ3V0cm9u
aXggS2VybmVsIFRlYW0NCj4gPGtlcm5lbEBwZW5ndXRyb25peC5kZT47IEZhYmlvIEVzdGV2YW0g
PGZlc3RldmFtQGdtYWlsLmNvbT47IFBlbmcgRmFuDQo+IDxwZW5nLmZhbkBueHAuY29tPjsgZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiByZW1vdGVwcm9jQHZnZXIua2VybmVs
Lm9yZzsgaW14QGxpc3RzLmxpbnV4LmRldjsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZzsgZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT47IEJhcnRvc3oNCj4g
R29sYXN6ZXdza2kgPGJyZ2xAYmdkZXYucGw+DQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0gg
djggMy80XSBncGlvOiBycG1zZzogYWRkIGdlbmVyaWMgcnBtc2cgR1BJTyBkcml2ZXINCj4gPiA+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBBbmRyZXcgTHVubiA8YW5k
cmV3QGx1bm4uY2g+DQo+ID4gPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAyNCwgMjAyNiA0OjIz
IFBNDQo+ID4gPiBUbzogU2hlbndlaSBXYW5nIDxzaGVud2VpLndhbmdAbnhwLmNvbT4NCj4gPiA+
IENjOiBBcm5hdWQgUE9VTElRVUVOIDxhcm5hdWQucG91bGlxdWVuQGZvc3Muc3QuY29tPjsgTGlu
dXMgV2FsbGVpag0KPiA+ID4gPGxpbnVzd0BrZXJuZWwub3JnPjsgQmFydG9zeiBHb2xhc3pld3Nr
aSA8YnJnbEBrZXJuZWwub3JnPjsgSm9uYXRoYW4NCj4gPiA+IENvcmJldCA8Y29yYmV0QGx3bi5u
ZXQ+OyBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mDQo+ID4gPiBLb3ps
b3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVs
Lm9yZz47DQo+ID4gPiBCam9ybiBBbmRlcnNzb24gPGFuZGVyc3NvbkBrZXJuZWwub3JnPjsgTWF0
aGlldSBQb2lyaWVyDQo+ID4gPiA8bWF0aGlldS5wb2lyaWVyQGxpbmFyby5vcmc+OyBGcmFuayBM
aSA8ZnJhbmsubGlAbnhwLmNvbT47IFNhc2NoYQ0KPiA+ID4gSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0
cm9uaXguZGU+OyBTaHVhaCBLaGFuDQo+ID4gPiA8c2toYW5AbGludXhmb3VuZGF0aW9uLm9yZz47
IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gPiA+IGRvY0B2Z2VyLmtlcm5l
bC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IFBlbmd1dHJvbml4DQo+ID4gPiBL
ZXJuZWwgVGVhbSA8a2VybmVsQHBlbmd1dHJvbml4LmRlPjsgRmFiaW8gRXN0ZXZhbQ0KPiA+ID4g
PGZlc3RldmFtQGdtYWlsLmNvbT47IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPjsNCj4gPiA+
IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0gcmVtb3RlcHJvY0B2Z2VyLmtlcm5l
bC5vcmc7DQo+ID4gPiBpbXhAbGlzdHMubGludXguZGV2OyBsaW51eC1hcm0tIGtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnOw0KPiA+ID4gZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT47
IEJhcnRvc3ogR29sYXN6ZXdza2kNCj4gPiA+IDxicmdsQGJnZGV2LnBsPg0KPiA+ID4gU3ViamVj
dDogUmU6IFtFWFRdIFJlOiBbUEFUQ0ggdjggMy80XSBncGlvOiBycG1zZzogYWRkIGdlbmVyaWMg
cnBtc2cNCj4gPiA+IEdQSU8gZHJpdmVyDQo+ID4gPg0KPiA+ID4gQ2F1dGlvbjogVGhpcyBpcyBh
biBleHRlcm5hbCBlbWFpbC4gUGxlYXNlIHRha2UgY2FyZSB3aGVuIGNsaWNraW5nDQo+ID4gPiBs
aW5rcyBvciBvcGVuaW5nIGF0dGFjaG1lbnRzLiBXaGVuIGluIGRvdWJ0LCByZXBvcnQgdGhlIG1l
c3NhZ2UgdXNpbmcgdGhlDQo+ICdSZXBvcnQgdGhpcyBlbWFpbCcNCj4gPiA+IGJ1dHRvbg0KPiA+
ID4NCj4gPiA+DQo+ID4gPiA+ID4gPiArIHJlbW90ZV9jbTMzew0KPiA+ID4gPiA+ID4gKyAgICAg
cnBtc2cgew0KPiA+ID4gPiA+ID4gKyAgICAgICAgcnBtc2ctaW8tY2hhbm5lbCB7DQo+ID4gPiA+
ID4gPiArICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ID4gPiA+ID4gKyAgICAg
ICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICsgICAg
ICAgICAgZ3Bpb0AwIHsNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gInJw
bXNnLWdwaW8iOw0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgIHJlZyA9IDwwPjsNCj4gPiA+ID4g
PiA+ICsgICAgICAgICAgICBncGlvLWNvbnRyb2xsZXI7DQo+ID4gPiA+ID4gPiArICAgICAgICAg
ICAgI2dwaW8tY2VsbHMgPSA8Mj47DQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgI2ludGVycnVw
dC1jZWxscyA9IDwyPjsNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICBpbnRlcnJ1cHQtY29udHJv
bGxlcjsNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgfTsNCj4gPiA+ID4gPiA+ICsgICAgICAgICAg
Z3Bpb0AxIHsNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gInJwbXNnLWdw
aW8iOw0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgIHJlZyA9IDwxPjsNCj4gPiA+ID4gPiA+ICsg
ICAgICAgICAgICBncGlvLWNvbnRyb2xsZXI7DQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgI2dw
aW8tY2VsbHMgPSA8Mj47DQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgI2ludGVycnVwdC1jZWxs
cyA9IDwyPjsNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICBpbnRlcnJ1cHQtY29udHJvbGxlcjsN
Cj4gPiA+ID4gPiA+ICsgICAgICAgICAgfTsNCj4gPiA+DQo+ID4gPiA+IFRoZW4gaG93IHdvdWxk
IHlvdSBkaXN0aW5ndWlzaCBncGlvQDAgZnJvbSBncGlvQDEgb24gdGhlIENNMzMNCj4gPiA+ID4g
UlBNU0cgYnVzDQo+ID4gPiBpbiB0aGUgZXhhbXBsZSBhYm92ZT8NCj4gPiA+ID4gVGhleSBhcmUg
cnVubmluZyBvbiB0aGUgc2FtZSB0cmFuc3BvcnQuDQo+ID4gPg0KPiA+ID4gRG9lc24ndCByZWcg
aW5kaWNhdGUgdGhlIGNoYW5uZWwgbnVtYmVyPyBncGlvQDAgaXMgb24gcnBtc2cgY2hhbm5lbA0K
PiA+ID4gMC4gZ3Bpb0AxIGlzIG9uIGNoYW5uZWwgMT8gVGhlIHJlZyB2YWx1ZSBnZXRzIGZpbGxl
ZCBpbnRvIHN0cnVjdA0KPiA+ID4gcnBtc2dfY2hhbm5lbF9pbmZvIHdoZW4gdGhlIGVuZHBvaW50
cyBhcmUgY3JlYXRlZD8NCj4gPg0KPiA+IFRoZXJlIGlzIG9ubHkgYSBzaW5nbGUgUlBNU0cgY2hh
bm5lbCBmb3IgdGhlIENNMzMgcmVtb3RlcHJvYyBpbiB0aGlzDQo+ID4gZXhhbXBsZS1pdHMgbmFt
ZSBpcyAicnBtc2ctaW8tY2hhbm5lbCIuIEFzIEkgbWVudGlvbmVkIGFib3ZlLCBib3RoIGdwaW9A
MA0KPiBhbmQgZ3Bpb0AxIHJ1biBvdmVyIHRoaXMgc2FtZSB0cmFuc3BvcnQuDQo+ID4gVGhlIHRy
YW5zcG9ydCBoZXJlIGlzIHRoZSBSUE1TRyBjaGFubmVsLCBzbyBtdWx0aXBsZSBHUElPIGNvbnRy
b2xsZXJzIHNoYXJlDQo+IHRoYXQgY2hhbm5lbC4NCj4gPg0KPiANCj4gVGhhdCBpcyBvbmUgb2Yg
bXkgbWFpbiBwcm9ibGVtIHdpdGggdGhpcyBwcm9wb3NhbCAtIG11bHRpcGxleGluZyBzZXZlcmFs
IEdQSU8NCj4gY29udHJvbGxlcnMgb3ZlciB0aGUgc2FtZSBSUE1TRyBjaGFubmVsIGFkZHMgY29t
cGxleGl0eS4NCg0KTXVsdGlwbGV4aW5nIG11bHRpcGxlIEdQSU8gY29udHJvbGxlcnMgb3ZlciBh
IHNpbmdsZSBSUE1TRyBjaGFubmVsIGRvZXMgbm90IGluaGVyZW50bHkgDQphZGQgY29tcGxleGl0
eS4gRXZlbiBpZiB3ZSBpbXBsZW1lbnQgYSDigJxvbmUgR1BJTyBjb250cm9sbGVyIHBlciBSUE1T
RyBjaGFubmVs4oCdIG1vZGVsLCANCnRoZSBjb3JlIGxvZ2ljIGluIHRoZSBkcml2ZXIgcmVtYWlu
cyBlc3NlbnRpYWxseSB0aGUgc2FtZS4NCg0KSW4gZmFjdCwgdGhlIGN1cnJlbnQgaW1wbGVtZW50
YXRpb24gYWxyZWFkeSBzdXBwb3J0cyB5b3VyIHByZWZlcnJlZCDigJxvbmUgUlBNU0cgY2hhbm5l
bCANCnBlciBHUElPIGNvbnRyb2xsZXLigJ0gYXBwcm9hY2ggdGhyb3VnaCBzaW1wbGUgRFRTIGNv
bmZpZ3VyYXRpb24uIEZvciBleGFtcGxlOg0KDQorIHJlbW90ZV9jbTMzew0KKyAgICAgcnBtc2cg
ew0KKyAgICAgICAgY2hhbm5lbDAgeyAgICANCisgICAgICAgICAgZ3Bpb0AwIHsNCisgICAgICAg
ICAgICBjb21wYXRpYmxlID0gInJwbXNnLWdwaW8iOw0KKyAgICAgICAgICAgIHJlZyA9IDwwPjsN
CisgICAgICAgICAgICBncGlvLWNvbnRyb2xsZXI7DQorICAgICAgICAgICAgI2dwaW8tY2VsbHMg
PSA8Mj47DQorICAgICAgICAgICAgI2ludGVycnVwdC1jZWxscyA9IDwyPjsNCisgICAgICAgICAg
ICBpbnRlcnJ1cHQtY29udHJvbGxlcjsNCisgICAgICAgICAgfTsNCisgICAgICAgfTsNCisNCisg
ICAgICAgIGNoYW5uZWwxIHsNCisgICAgICAgICAgZ3Bpb0AxIHsNCisgICAgICAgICAgICBjb21w
YXRpYmxlID0gInJwbXNnLWdwaW8iOw0KKyAgICAgICAgICAgIHJlZyA9IDwxPjsNCisgICAgICAg
ICAgICBncGlvLWNvbnRyb2xsZXI7DQorICAgICAgICAgICAgI2dwaW8tY2VsbHMgPSA8Mj47DQor
ICAgICAgICAgICAgI2ludGVycnVwdC1jZWxscyA9IDwyPjsNCisgICAgICAgICAgICBpbnRlcnJ1
cHQtY29udHJvbGxlcjsNCisgICAgICAgICAgfTsNCisgICAgICAgIH07DQorICAgICAgfTsNCit9
Ow0KKw0KDQo+IFJQTVNHIGNhbiBhbHJlYWR5IGhhbmRsZSBtdWx0aXBsZXhpbmcgdmlhIGNoYW5u
ZWxzLCB1c2Ugb25lIFJQTVNHIGNoYW5uZWwNCj4gcGVyIEdQSU8gY29udHJvbGxlci4NCj4gDQo+
ID4gVGhhbmtzLA0KPiA+IFNoZW53ZWkNCj4gPg0KPiA+ID4NCj4gPiA+ICAgIEFuZHJldw0KPiA+
DQo=

