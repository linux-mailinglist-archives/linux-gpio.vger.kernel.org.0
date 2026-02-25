Return-Path: <linux-gpio+bounces-32191-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eO4+LThcn2lRagQAu9opvQ
	(envelope-from <linux-gpio+bounces-32191-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 21:31:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5489819D450
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 21:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B346301700F
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 20:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B66062DECA1;
	Wed, 25 Feb 2026 20:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="avXf1dXc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011030.outbound.protection.outlook.com [52.101.65.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB42C24DCF6;
	Wed, 25 Feb 2026 20:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772051498; cv=fail; b=M1WeAgKX8S+86xjAGk1LHON/8vVUB1ZfUhjUjy6AXoboSKztpn85o1kNmaCoQQRtfMKspVUncl7aeETw65ue6lDTIV3BrFyuWQOybb8cZcU+852DRogZjJTi1fz2Xe5NQxxysnJxUP0aQRbNr7e3sJ0OPOCsdtgYkYf6Ix7/F/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772051498; c=relaxed/simple;
	bh=0yJaDuYNkeFjvsKtew+ebE0E76Atiw9ssm39FZMNQ1M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZRYzXyA3CIj5W4f7I8kSm3OXdmHqMKIargBo3SI5LHx2Mkcqazbif+U+GuJLO/2GjQvWv+KglSdN4bsbWg+TMD9Smr8nZJ4vhxb6wqtL/F44eUXTLIsbYeVxZoBHY8v2V1vwIFcuxip3+V53dsezeeqACEz7mKHuM+YVV71BS0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=avXf1dXc; arc=fail smtp.client-ip=52.101.65.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGZXmsobGdbHDmU39jXg14kfDsK69LppXNCQozeFvBT0I0+Cr6ecZFo4tlU94ZVG4mwsP1RER59cxyu3eGMMS2AGj8Is6XV7XtD9FNCo/Q72TQ78CjNlfOTCqimmUTbEbDtESWOewcxa3xoiWxFZWSV8JXHsXraeodXStxda1bj1mkhvIHsbUe37QRToWnLBJwUN/00r34gghgncIZNR7Blu/mDvaxPourUoNNZMgUmr2p/YvUuMBeBRb9XB78fPhu7mQXjE2V1P3F/mnmh4PpkxQYXrueEVyFinp0Lpr5vXvDwhdkBC3GVMaxjGSBdkcqSg23hrQs+iZ9/ie8/PEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yJaDuYNkeFjvsKtew+ebE0E76Atiw9ssm39FZMNQ1M=;
 b=eJvfBJBy8wxfsfoN5i5BzNC5hG8qVODiC4afEhctZmiu0w57sAJvL0g2NGmot7jYgkSydi2MK637Q1+fiT9zTo8bgAnXq56N8lJTUp0wY3M/0LleztQUoP/Zc0g/Ak+7p4sohs5uUFg1+6UcazrHzypvKLpJEApVqbGYsP3B72dOV6YCvexU9z6R/lqAuVeV2FaVa8s1PMZtIEuixJsfoVw9pZ1YVOFIcyVhc3CzAgJrn+Lk0c6Yw3WY6cd/W4oH6USxelF+pjKJFnaXFcmILpupXeDwL+9HsuuGDSMX4Kk9acYy8IeYLU/dNJLCCjzrf+KT07SOowkAHs8xaAALvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yJaDuYNkeFjvsKtew+ebE0E76Atiw9ssm39FZMNQ1M=;
 b=avXf1dXc2ShlTBLV++s8zdAGHSO2u/IWq0vz0/doc/ztPBeQRRy0BXAzmgvBIzDh7Ep3GtgYA1BadFm728LITGr0kme4OUzzhl/yzDMS3IvfTvP4n80PD/puBJJt2PVdEn1oUZU1Q0qhZyaXYJjQGQeTdR43X//CRoH7xuG29/8aUlEVRVceWw8ERymwRJben/IOqPwAm0Tr56gJlqDSfnJqiTAxdYcZUloiAPbFbtGRp/ydIXaa3yyNlW6H+sgi3/DJS7OkhSq92dhFMOKkykteQ7g/GfvbnFR05t27QdZ4Qd7e7VdsyZiTFgyvpL9zD56k/X1x9m2g7Gp8rwwmrA==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS5PR04MB11466.eurprd04.prod.outlook.com (2603:10a6:20b:6c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 20:31:33 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9654.013; Wed, 25 Feb 2026
 20:31:33 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Arnaud POULIQUEN
	<arnaud.pouliquen@foss.st.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng
 Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHcppW7MgLlAvgTEUODUWmfUics2Q==
Date: Wed, 25 Feb 2026 20:31:33 +0000
Message-ID:
 <PAXPR04MB918508A39832000D786E8F938975A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <nbzdtngifwrx2kyu4tsiwwua5v4i5cjtaotemq5hubaets3bcn@fk25twf5rv6x>
 <PAXPR04MB9185588C1DB71B1FEFA1DEE38974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkxAwgG1WkMRr8EJZuSUnN_jKVnsWhWTakVqhvtMBO365A@mail.gmail.com>
 <PAXPR04MB91851D3DA6A92669CB5926A18974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkw-8ERXy3v8Sv55Cpq=+41Toez3EjLMbENAkavvr8STeQ@mail.gmail.com>
 <PAXPR04MB9185B68BC640D940534E44098974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <d4c8f7dd-c0a8-4721-9750-47429637d8c1@lunn.ch>
 <PAXPR04MB9185BB6443B9E1E407F409D68974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <ndozoc6qdrpv3xuktumsah56im5rbtg6iwerq3xi2xkcuyewpx@szswqvojleg3>
 <AS8PR04MB917652D63DB090D22129D3D78975A@AS8PR04MB9176.eurprd04.prod.outlook.com>
 <2b72kkgwe5hio4uwrxj5oi72llkxhx7egw442fugq6unv7unah@5bfve7k3mvky>
In-Reply-To: <2b72kkgwe5hio4uwrxj5oi72llkxhx7egw442fugq6unv7unah@5bfve7k3mvky>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AS5PR04MB11466:EE_
x-ms-office365-filtering-correlation-id: 8c4e1cfb-38fe-4669-e658-08de74acddba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 faUTbt0QHfbBa0IBWyAf/2OJ6nRq0q6C8ubZ9uN2TYYcSltkCC2kNx0SoBlu4nDo5P/GhzP44nh16bSBmK+tVHdFfKDmR1NV5dXfGb3v/yHSdXX04ilxT+edEiJV39Fn2uFbNkH3ZdIIDgA5W0WS5NLXOvLeTC7V+X6HJ1fl2wWQH/fzhzTzQ2i5JIzTrq46FxKIOzaczcPjOI0YL1nJijPvGHML8iRP1AQEs5u4huF+oyhg1x0+pdBsvRwyCLBr7tIQkS51ERFXaLNbgRVRnC9L2mfJlRzaKkMmk520R5xVU9TwH/1w4kQeM61CB5DShflNrZsWshM6T30pNf2JjA9SqDZKv9p7QDJl3QG8LwcKg9Dz/9KQA0SEKk3wfyPw4xLmUvedEWR2+GvZx6MGJZRYU32rDvHnr3iWwwyCs5Wc6pWTrgE8VQeXtF/npxAyabpIr1eFcnlgtRKgDrhPbBwL//ozXjhMt7QnKAszGzi9ctRv10iYtZHPhzfLrF3EXaLBnNxvFKkYX2LJAH9kigkAyZ2FI+EJ4Z1WsHNeo3fxX9Qa/mqXpJqL70U48F6XJfA57N1fA0SgsRA5qTXovtbOKV+U0yKkVMnGpuXqvW6WEFBNwJ0j91RYuQ+u356eaBbmo2nJIUeRR8VRLM48qKqQNcn9eXh2OAZvPcp8kV3fnXUJk9YueJmBi/MumBYlLefTPbbrUlzPDcffN33TVYzURwt1vz1ZTPRmEy+Gn/b+9RHZy9mxQIecV3dPNZFgEYg/ZL4J5rapKX6DCZG18S5w8ja0Kr6fblHJtowjeyo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L0FQQzRTODAycFlURW9vK2FUNCtSYVRLUGZxd01iYXozR1lYOGpjeGhXNDh4?=
 =?utf-8?B?Q3ZDemc1b2J6aGttTEZwZ3lVSDNIWUlYckF0Ynk0cUQzOXlteWFjZU9Oekc5?=
 =?utf-8?B?Z3hHK2tIRVZ5QWRjejAwWmZlTTJIM2lDaEtBYkNscEF0bCtBT0NhV294S1R2?=
 =?utf-8?B?N2t1Q0phWjJTb2RFb0NIbWFJMXFDZm1LNmlnMDU3Mkt6OWNvdnU0bmx1bGZa?=
 =?utf-8?B?aHc2WitKS3ZmRk5NU3ZMWmNHM0hsVVFqZGR0MGIwNm01NUFXSzRBdVYzbUVF?=
 =?utf-8?B?TEY2Q3ozMG5YaEMyWjRBRUdTdFQwZXpIR1REQWtkYXNWbnk2b3liQmFOdXAz?=
 =?utf-8?B?NjFiTWtXVU1VOVd5bHc0blRqeFhYNW9vNnNVZUtqSEV4V05MbFkrMVRjR005?=
 =?utf-8?B?bFNLbnlGZVFNR2llSXovVXBUdDViU0pUNkFaUmUvZ0U5YklDSS9LMEZ0YjJs?=
 =?utf-8?B?WHRyQmtxVWZ1bjdWU0tuR0E4QlJGVVNwSHgzdEllQUorL3FQNFIrSldoMllX?=
 =?utf-8?B?NDBDNWx3OGlyVDVIc0R0amRwS1FNdGtHTG1rNFMreENtbDJCUDlsdnhDcThs?=
 =?utf-8?B?SGlrMFpLRnBEcGNZNHAwWEN3RUJWTTRWQWJ5dDJvZGx5Z0hNODI4dGZYNUtQ?=
 =?utf-8?B?TWxjaXZWVUMzeWN0WjY0RzBGa2lCd3NkUko5a0lhaFVQL0tjWi9tRS9rZHNT?=
 =?utf-8?B?WmlidzlTbW9SY0tnSHRsNzEwZ05WclhFQ1oySGFjbzlpRk51K0J4NHYxRUhW?=
 =?utf-8?B?SHZsUzZJd0Rlb1M2b1ZuSEo2MlRKeWhFc0EwTTdjUVNaYjBVT1ppQ0twaUl0?=
 =?utf-8?B?Wnl5SWQwWlVteE5RaWUweCs2aHViWGpDZm5ZVWJHZUVuMm5SOVRIcWU3dnA5?=
 =?utf-8?B?d2N4OEtuWmVCaFpUY2JURUF1YTI5bFNyS3BKY1FhbDdVUHpQeFE3L29oWGM0?=
 =?utf-8?B?T3dhZjdnSUx2MjZLVG4xVURJVENhZmE5RUIwazVzTFArMmNTOHgrZkNYVmpy?=
 =?utf-8?B?d2dIczhhSDM3NG5rNG9ac0FxRFZIRStoUnNPUW5sVWQ2SUdrbWg2YmtxenR0?=
 =?utf-8?B?TTR5eXRIdTZtT1lSSENheFI5bWt2TVZQNml4Y1k4ZHdrSG5Id0cwVDFvem9h?=
 =?utf-8?B?N3hVNWJVVHQ5Zy9lMlM0R0dWZUgwNEJrSHFiV3oxd1RLY2ZVdXE5cjF5ZnIv?=
 =?utf-8?B?NUs5b05hMTkwQnNIZ0t4UmV6SHpLT3ZpMXhZVVVyVmxYVWE5R3ArdGVocm9J?=
 =?utf-8?B?YUVnTGRBTk5ocUpiNWtheEI3OVpML2JlbFc2OFVFcHRVYWRYdzd0NzBCRFlC?=
 =?utf-8?B?Ui9oT0JBRHFnOUVmNGpwRzFObS85WEVyVU5EdnlnNHRkcm1ua2pxVEQveWlo?=
 =?utf-8?B?c0dyQjRieUQ2enhmSmtDUElyN1NnV0pOd0RIY28xcUdlMDJ6cnovYm41Y0dq?=
 =?utf-8?B?aGRKc1loQ1FobWoyRDM4SWt2ZFBJR0l3bUV2Zkl4clI5dGRsaWJlTnFHWkVq?=
 =?utf-8?B?SmkwRi9iRW5UT1FOeDVyY1AzWFFqTEdQS2lNcCtRVE8yOXpwM1F2d3c0SGtw?=
 =?utf-8?B?MGVnbnpkaFAzcDB0WGFlNm4wQnhIeW5LUkZqZDVVN1VsbTd3OUJvVitXbkFI?=
 =?utf-8?B?MW8xYWFOMjdqNkpKNVdUYUtVNXRydUlYZkJSUTdMMU5jbUtnWnN6dXVoaGxY?=
 =?utf-8?B?d096bElVUXRCR295eXVYejJ5QWltZ2lHOERneFU0emtzTW9jM1VVWHZqa0hm?=
 =?utf-8?B?L3A4Z2pUemREd0M5aVBUVEtvRzVSV3Y2bjNkT0ZoYzNuS3BzZHlhclo4c2cx?=
 =?utf-8?B?VEdpdkN6QVQ1VDZlMUNnbFNUYk5oa2hRbi9HT3VhQnhPakxuVzhvcVlkWmJN?=
 =?utf-8?B?c1hzSDFsQ2E2aVpISnhKeHc4UEc3L0VEb2JYT2RwKzVEL1NMWnFMTk9LUmha?=
 =?utf-8?B?Nmo2YkozelpGNDl4Wlk5NzJsSU5aVjFUWXJHY2NUN3BoZXlZUFpURDdwSVY1?=
 =?utf-8?B?VHRBOVlDaEVOM3dhanJ6MkNwM2JkT1pOWjVRWUZHWGFVd3B4WXREMGwyVThC?=
 =?utf-8?B?U2JDTExzWWxMVHF5N21VOG0vSTdYbmZnZmxmL21CS0x3Rk9DR09MZDhpSEYr?=
 =?utf-8?B?ajN4V2xneXEvbW9JQlVxc0EvTEJ2VEtGZDRFdkZ5SFViTThSMjc0cTRDUUdZ?=
 =?utf-8?B?eFhmTHNteW1vSURWakZDaEZNMXh3SlN2ZDhTdWozSUIrQTVCYk5aN0RoQ0Ix?=
 =?utf-8?B?UmkrRStkRktWUkpYRzlSS3hlZ25ZWTh5QkNEL1k1VUV0Wk5xVSs2Q1ZXNDll?=
 =?utf-8?Q?tWRKoWzopTvV9kKOd7?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c4e1cfb-38fe-4669-e658-08de74acddba
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 20:31:33.6328
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VDN9wPB13YvGEBDBj23WggR61ekrxDycKM0prHvkj6/EOqSIwHg5Fen3YexHAz+aPqhbLsIoFuYd6n/Tlz4BsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11466
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32191-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,linaro.org,foss.st.com,kernel.org,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
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
	NEURAL_HAM(-0.00)[-0.968];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5489819D450
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmpvcm4gQW5kZXJzc29u
IDxhbmRlcnNzb25Aa2VybmVsLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSAyNSwg
MjAyNiAxOjQ0IFBNDQo+IFRvOiBTaGVud2VpIFdhbmcgPHNoZW53ZWkud2FuZ0BueHAuY29tPg0K
PiBDYzogQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPjsgTWF0aGlldSBQb2lyaWVyDQo+IDxt
YXRoaWV1LnBvaXJpZXJAbGluYXJvLm9yZz47IEFybmF1ZCBQT1VMSVFVRU4NCj4gPGFybmF1ZC5w
b3VsaXF1ZW5AZm9zcy5zdC5jb20+OyBMaW51cyBXYWxsZWlqIDxsaW51c3dAa2VybmVsLm9yZz47
IEJhcnRvc3oNCj4gR29sYXN6ZXdza2kgPGJyZ2xAa2VybmVsLm9yZz47IEpvbmF0aGFuIENvcmJl
dCA8Y29yYmV0QGx3bi5uZXQ+OyBSb2IgSGVycmluZw0KPiA8cm9iaEBrZXJuZWwub3JnPjsgS3J6
eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPjsgQ29ub3IgRG9vbGV5DQo+IDxj
b25vcitkdEBrZXJuZWwub3JnPjsgRnJhbmsgTGkgPGZyYW5rLmxpQG54cC5jb20+OyBTYXNjaGEg
SGF1ZXINCj4gPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+OyBTaHVhaCBLaGFuIDxza2hhbkBsaW51
eGZvdW5kYXRpb24ub3JnPjsgbGludXgtDQo+IGdwaW9Admdlci5rZXJuZWwub3JnOyBsaW51eC1k
b2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBQZW5n
dXRyb25peCBLZXJuZWwgVGVhbSA8a2VybmVsQHBlbmd1dHJvbml4LmRlPjsgRmFiaW8gRXN0ZXZh
bQ0KPiA8ZmVzdGV2YW1AZ21haWwuY29tPjsgUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+Ow0K
PiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtcmVtb3RlcHJvY0B2Z2VyLmtlcm5l
bC5vcmc7DQo+IGlteEBsaXN0cy5saW51eC5kZXY7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZzsgZGwtbGludXgtaW14IDxsaW51eC0NCj4gaW14QG54cC5jb20+OyBCYXJ0b3N6
IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPg0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENI
IHY4IDMvNF0gZ3BpbzogcnBtc2c6IGFkZCBnZW5lcmljIHJwbXNnIEdQSU8gZHJpdmVyDQo+IA0K
PiBDYXV0aW9uOiBUaGlzIGlzIGFuIGV4dGVybmFsIGVtYWlsLiBQbGVhc2UgdGFrZSBjYXJlIHdo
ZW4gY2xpY2tpbmcgbGlua3Mgb3Igb3BlbmluZw0KPiBhdHRhY2htZW50cy4gV2hlbiBpbiBkb3Vi
dCwgcmVwb3J0IHRoZSBtZXNzYWdlIHVzaW5nIHRoZSAnUmVwb3J0IHRoaXMgZW1haWwnDQo+IGJ1
dHRvbg0KPiANCj4gDQo+IE9uIFdlZCwgRmViIDI1LCAyMDI2IGF0IDA1OjU0OjAwUE0gKzAwMDAs
IFNoZW53ZWkgV2FuZyB3cm90ZToNCj4gPg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+ID4gRnJvbTogQmpvcm4gQW5kZXJzc29uIDxhbmRlcnNzb25Aa2VybmVsLm9y
Zz4NCj4gPiA+IFNlbnQ6IFdlZG5lc2RheSwgRmVicnVhcnkgMjUsIDIwMjYgOTo1MyBBTQ0KPiA+
ID4gVG86IFNoZW53ZWkgV2FuZyA8c2hlbndlaS53YW5nQG54cC5jb20+DQo+ID4gPiBDYzogQW5k
cmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPjsgTWF0aGlldSBQb2lyaWVyDQo+ID4gPiA8bWF0aGll
dS5wb2lyaWVyQGxpbmFyby5vcmc+OyBBcm5hdWQgUE9VTElRVUVODQo+ID4gPiA8YXJuYXVkLnBv
dWxpcXVlbkBmb3NzLnN0LmNvbT47IExpbnVzIFdhbGxlaWogPGxpbnVzd0BrZXJuZWwub3JnPjsN
Cj4gPiA+IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAa2VybmVsLm9yZz47IEpvbmF0aGFuIENv
cmJldA0KPiA+ID4gPGNvcmJldEBsd24ubmV0PjsgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz47IEtyenlzenRvZiBLb3psb3dza2kNCj4gPiA+IDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25v
ciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBGcmFuayBMaQ0KPiA+ID4gPGZyYW5rLmxp
QG54cC5jb20+OyBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+OyBTaHVhaA0K
PiA+ID4gS2hhbiA8c2toYW5AbGludXhmb3VuZGF0aW9uLm9yZz47IGxpbnV4LSBncGlvQHZnZXIu
a2VybmVsLm9yZzsNCj4gPiA+IGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IFBlbmd1dHJvbml4DQo+ID4gPiBLZXJuZWwgVGVhbSA8a2VybmVs
QHBlbmd1dHJvbml4LmRlPjsgRmFiaW8gRXN0ZXZhbQ0KPiA+ID4gPGZlc3RldmFtQGdtYWlsLmNv
bT47IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPjsNCj4gPiA+IGRldmljZXRyZWVAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZzsNCj4gPiA+IGlteEBs
aXN0cy5saW51eC5kZXY7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4g
PiA+IGRsLWxpbnV4LWlteCA8bGludXgtIGlteEBueHAuY29tPjsgQmFydG9zeiBHb2xhc3pld3Nr
aQ0KPiA+ID4gPGJyZ2xAYmdkZXYucGw+DQo+ID4gPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENI
IHY4IDMvNF0gZ3BpbzogcnBtc2c6IGFkZCBnZW5lcmljIHJwbXNnDQo+ID4gPiBHUElPIGRyaXZl
ciBPbiBUdWUsIEZlYiAyNCwgMjAyNiBhdCAxMDo0MzowNlBNICswMDAwLCBTaGVud2VpIFdhbmcN
Cj4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPiA+ID4gPiBGcm9tOiBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+DQo+
ID4gPiA+ID4gU2VudDogVHVlc2RheSwgRmVicnVhcnkgMjQsIDIwMjYgNDoxNSBQTQ0KPiA+ID4g
PiA+IFRvOiBTaGVud2VpIFdhbmcgPHNoZW53ZWkud2FuZ0BueHAuY29tPg0KPiA+ID4gPiA+IENj
OiBNYXRoaWV1IFBvaXJpZXIgPG1hdGhpZXUucG9pcmllckBsaW5hcm8ub3JnPjsgQmpvcm4NCj4g
PiA+ID4gPiBBbmRlcnNzb24gPGFuZGVyc3NvbkBrZXJuZWwub3JnPjsgQXJuYXVkIFBPVUxJUVVF
Tg0KPiA+ID4gPiA+IDxhcm5hdWQucG91bGlxdWVuQGZvc3Muc3QuY29tPjsgTGludXMgV2FsbGVp
ag0KPiA+ID4gPiA+IDxsaW51c3dAa2VybmVsLm9yZz47IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAa2VybmVsLm9yZz47DQo+ID4gPiA+ID4gSm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRAbHduLm5l
dD47IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ow0KPiA+ID4gPiA+IEtyenlzenRvZiBL
b3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9yIERvb2xleQ0KPiA+ID4gPiA+IDxj
b25vcitkdEBrZXJuZWwub3JnPjsgRnJhbmsgTGkgPGZyYW5rLmxpQG54cC5jb20+OyBTYXNjaGEg
SGF1ZXINCj4gPiA+ID4gPiA8cy5oYXVlckBwZW5ndXRyb25peC5kZT47IFNodWFoIEtoYW4NCj4g
PiA+ID4gPiA8c2toYW5AbGludXhmb3VuZGF0aW9uLm9yZz47IGxpbnV4LSBncGlvQHZnZXIua2Vy
bmVsLm9yZzsNCj4gPiA+ID4gPiBsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOw0KPiA+ID4gPiA+IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxr
ZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBGYWJpbyBFc3RldmFtDQo+ID4gPiA+ID4gPGZlc3RldmFt
QGdtYWlsLmNvbT47IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPjsNCj4gPiA+ID4gPiBkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtcmVtb3RlcHJvY0B2Z2VyLmtlcm5lbC5vcmc7
DQo+ID4gPiA+ID4gaW14QGxpc3RzLmxpbnV4LmRldjsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnOw0KPiA+ID4gPiA+IGRsLWxpbnV4LWlteCA8bGludXgtIGlteEBueHAuY29t
PjsgQmFydG9zeiBHb2xhc3pld3NraQ0KPiA+ID4gPiA+IDxicmdsQGJnZGV2LnBsPg0KPiA+ID4g
PiA+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0ggdjggMy80XSBncGlvOiBycG1zZzogYWRkIGdl
bmVyaWMgcnBtc2cNCj4gPiA+ID4gPiBHUElPIGRyaXZlcg0KPiA+ID4gPiA+ID4gUGxlYXNlIGV4
cGxhaW4gaG93IHlvdSB3b3VsZCBkZXNpZ24geW91ciBnZW5lcmljIHJwbXNnLWdwaW8NCj4gPiA+
ID4gPiA+IGRyaXZlciB3aGljaCBpcyBkZXJpdmVkIEZyb20gZ3Bpby12aXJ0aW8/DQo+ID4gPiA+
ID4NCj4gPiA+ID4gPiBXZSBoYXZlIGFscmVhZHkgc2VlbiB0aGUgdmlydGlvIGNvbW1hbmRzIGFy
ZSBwcmV0dHkgbXVjaA0KPiA+ID4gPiA+IGlkZW50aWNhbCB0byB3aGF0IGkgc3VnZ2VzdGVkLg0K
PiA+ID4gPiA+DQo+ID4gPiA+ID4gWW91IGNvdWxkIGp1c3QgcmVwbGFjZSB2aXJ0cXVldWVfYWRk
X3NncygpIHdpdGggcnBtc2dfc2VuZHRvKCkNCj4gPiA+ID4gPiBhbmQgcmVpbXBsZW1lbnQNCj4g
PiA+ID4gPiB2aXJ0aW9fZ3Bpb19yZXF1ZXN0X3ZxKCkgdG8gYmUgdGhlIGNhbGxiYWNrIHJlZ2lz
dGVyZWQgd2l0aA0KPiA+ID4gcnBtc2dfY3JlYXRlX2VwdCgpLg0KPiA+ID4gPiA+IFRoZSByZXN0
IG9mIGJhc2ljIEdQSU8gaGFuZGxpbmcgc2hvdWxkIG5vdCBuZWVkIGFueSBjaGFuZ2VzIGF0IGFs
bC4NCj4gPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBDcmVhdGluZyBlbmRwb2ludHMgYW5kIGNh
bGxpbmcgcnBtc2dfc2VuZHRvKCkgaXMgb25seSBhIHNtYWxsIHBhcnQNCj4gPiA+ID4gb2YgdGhl
IHBpY3R1cmUuIFlvdSBhbHNvIG5lZWQgdG8gbWFuYWdlIHRoZSBzZXJ2aWNlIGFubm91bmNlbWVu
dA0KPiA+ID4gPiBmcm9tIHRoZSByZW1vdGUgc2lkZSBhbmQgaGFuZGxlIGFzeW5jaHJvbm91cyBu
b3RpZmljYXRpb24NCj4gPiA+ID4gbWVzc2FnZXMuIFRoYXQgZW50aXJlIGZsb3cgaXMgYWxyZWFk
eSBpbXBsZW1lbnRlZCBpbiB0aGUgZXhpc3RpbmcNCj4gdmlydGlvX3JwbXNnX2J1cyBkcml2ZXIu
DQo+ID4gPiA+IFJl4oCRaW1wbGVtZW50aW5nIHRob3NlIHBpZWNlcyBqdXN0IHRvIG1pbWljIGdw
aW/igJF2aXJ0aW8gb3ZlciBSUE1TRw0KPiA+ID4gPiB3b3VsZA0KPiA+ID4gZXNzZW50aWFsbHkg
bWVhbiByZWludmVudGluZyB0aGUgd2hlZWwgd2l0aG91dCBhbnkgcmVhbCBiZW5lZml0Lg0KPiA+
ID4gPg0KPiA+ID4NCj4gPiA+IEkgY2FuIGFic29sdXRlbHkgc2VlIGEgYmVuZWZpdCB0byB0aGlz
LCB0aGVyZSBhcmUgbXVsdGlwbGUgZGlmZmVyZW50DQo+ID4gPiBycG1zZyBiYWNrZW5kcyBzdXBw
b3J0ZWQgaW4gTGludXgsIHNvIGEgZ3Bpby1ycG1zZyBkcml2ZXIgY291bGQgYmUgdXNlZCBieQ0K
PiBhbnkgb25lIG9mIHRoZW0uDQo+ID4gPg0KPiA+ID4gSSBkb24ndCBzZWUgdGhpcyB0byBiZSBh
IGNhc2Ugb2YgInJlaW52ZW50aW5nIHRoZSB3aGVlbCIuIEluc3RlYWQgd2UNCj4gPiA+IGNvcHkg
d2hhdCBsb29rcyB0byBiZSBhIHZlcnkgZnVuY3Rpb25hbCB3aGVlbCBhbmQgbWFrZSBpdCBmaXQg
cnBtc2cuDQo+ID4gPiBUaGlzIHdpbGwgcmVzdWx0IGluIHNvbWUgImR1cGxpY2F0aW9uIiwgYnV0
IHJwbXNnIGFscmVhZHkgcHJvdmlkZQ0KPiA+ID4gdGhlIGxpZmUgY3ljbGUgbWFuYWdlbWVudCBh
bmQgaGFzIGEgY2xlYW4gc2VuZC9jYWxsYmFjayBpbnRlcmZhY2UsDQo+ID4gPiBzbyB0aGVyZSBz
aG91bGRuJ3QgYmUgYW55IGludmVudGluZy4uLg0KPiA+ID4NCj4gPg0KPiA+IEludGVyZXN0aW5n
IOKAlCBjb3VsZCB5b3Ugd2FsayBtZSB0aHJvdWdoIGhvdyB5b3XigJlkIHN0cnVjdHVyZSB0aGUg
ZHJpdmVyDQo+ID4gd2l0aCB0aGUgbmV3IHByb3Bvc2FsPyBJ4oCZZCBsaWtlIHRvIHNlZSBob3cg
eW91IHdvdWxkIGxheWVyIGl0IGNvbmNlcHR1YWxseS4NCj4gPg0KPiA+IFRoZSBjdXJyZW50IFJQ
TVNHIHNvbHV0aW9uOg0KPiA+DQo+ID4gICAgICBPbiBSZW1vdGVwcmMgICAgICAgICAgICAgICAg
ICAgICAgT24gTGludXgNCj4gPiBHUElPcyAtPiBSUE1TRyAtPiBWSVJUSU8gPT0gVklSVElPIC0+
IFJQTVNHIC0+IEdQSU8tUlBNU0cgZHJpdmVycw0KPiA+DQo+ID4gVGhlIFZJUlRJTyBzb2x1dGlv
bjoNCj4gPg0KPiA+ICAgICAgT24gUmVtb3RlcHJjICAgICAgICAgICAgICAgICAgICAgT24gTGlu
dXgNCj4gPiAgICAgICAgICAgR1BJTyAtPiBWSVJUSU8gPT0gVklSVElPIC0+IEdQSU8tVklSVElP
IGRyaXZlcg0KPiA+DQo+ID4gWW91ciBwcm9wb3NhbDoNCj4gPg0KPiA+ICAgICAgT24gUmVtb3Rl
cHJjICAgICAgICAgICAgICAgICAgICAgT24gTGludXgNCj4gPiBHUElPcyAtPiBSUE1TRyAtPiBW
SVJUSU8gPT0gVklSVElPIC0+ID8/Pw0KPiANCj4gV2hhdCBJJ20gc3VnZ2VzdGluZyBpcyB0aGUg
Zm9sbG93aW5nOg0KPiANCj4gR1BJT3MgLT4gUlBNU0cgLT4gVklSVElPID09IFZJUlRJTyAtPiBS
UE1TRyAtPiBHUElPLVJQTVNHDQo+ICAgICAgICBeICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXg0KPiAgICAgICAgXC0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS8NCj4gICAgICAgICAgICAgIHwNCj4gICAgICAgICAgICAgIHwNCj4gV2l0aCB0aGlzIGludGVy
ZmFjZSBvbiBiZWluZyBkaXJlY3RseSBkZXJpdmVkIGZyb20gdGhlIGV4aXN0aW5nIHByb3RvY29s
IChhbmQgbGlrZWx5DQo+IHRoZSBpbXBsZW1lbnRhdGlvbiBhcyB3ZWxsKSB1c2luZyBncGlvLXZp
cnRpby4NCj4gDQo+IFlvdSBjYW4gaGF2ZSBtdWx0aXBsZSAiR1BJT3MiIChwcmVzdW1hYmx5IGEg
ImJhbmsiIGVhY2gpIGluc3RhbmNlcyBhbmQgdGhhdA0KPiB3aWxsIGJlIHJlZmxlY3RlZCBpbiBo
YXZpbmcgbXVsdGlwbGUgIkdQSU8tUlBNU0ciIGluc3RhbmNlcy4NCj4gDQo+IEkgaGF2ZW4ndCBt
YWRlIGFueSBhdHRlbXB0cyBhdCBpbXBsZW1lbnRpbmcgdGhpcywgYnV0IGl0IGxvb2tzIHZlcnkg
c2ltaWxhciB0bw0KPiBncGlvLXZpcnRpbyBpbiBjb25jZXB0IGFuZCBpdCBsb29rcyB2ZXJ5IHNp
bWlsYXIgdG8gdGhlIGV4aXRpbmcgUlBNU0cgdHR5IGluIHRoZQ0KPiBzZW5zZSBvZiBiZWluZyBh
IGdlbmVyaWMgaW1wbGVtZW50YXRpb24uDQo+IA0KPiBUbyByZWFjaCBzb21ldGhpbmcgZnVuY3Rp
b25hbCBvbiB0aGUgTGludXggc2lkZSBpdCBzZWVtcyB0byBiZSBhIG1hdHRlciBvZiB0YWtpbmcN
Cj4gdGhlIGdwaW8tdmlydGlvIGRyaXZlciwgcmVnaXN0ZXIgYSBycG1zZ19kcml2ZXIgaW5zdGVh
ZCwgY2hhbmdlIF92aXJ0aW9fZ3Bpb19yZXEoKQ0KPiB0byB1c2UgcnBtc2dfc2VuZCgpLCBhbmQg
cGVyZm9ybSB0aGUgYWN0aW9ucyBvZiB2aXJ0aW9fZ3Bpb19ldmVudF92cSgpIGluIHRoZQ0KPiBy
cG1zZ19kcml2ZXIgY2FsbGJhY2sgZnVuY3Rpb24uDQo+IA0KDQpUaGFua3MgZm9yIHRoZSBleHBs
YW5hdGlvbi4gSWYgSeKAmW0gdW5kZXJzdGFuZGluZyBjb3JyZWN0bHksIHdoYXQgeW914oCZcmUg
c3VnZ2VzdGluZyBpcyANCmVzc2VudGlhbGx5IGEgZHJpdmVyIHRoYXQgbWVyZ2VzIHRoZSByb2xl
cyBvZiBhIHZpcnRpb19kcml2ZXIgYW5kIGFuIHJwbXNnX2RyaXZlciBpbnRvIGEgDQpzaW5nbGUg
c291cmNlIGZpbGUuIFRoZXJlIG1heSBiZSBvcHBvcnR1bml0aWVzIGZvciBhIGZldyBmdW5jdGlv
biByZXVzZSwgYnV0IG92ZXJhbGwgaXQgDQp3b3VsZCBzdGlsbCByZXN1bHQgaW4gYSBmYWlybHkg
ZGlzdGluY3QgY29kZWJhc2UuDQoNClRoYW5rcywNClNoZW53ZWkNCg0KPiBSZWdhcmRzLA0KPiBC
am9ybg0KPiANCj4gPg0KPiA+IFRoYW5rcywNCj4gPiBTaGVud2VpDQo+ID4NCj4gPiA+IFNpbWls
YXJseSwgSSdtIGd1ZXNzaW5nIHRoYXQgdGhlcmUncyBhIGZpcm13YXJlLXNpZGUgaW1wbGVtZW50
YXRpb24NCj4gPiA+IG9mIHZpcnRpby1ncGlvIGluIFplcGh5ciwgaXQgc2hvdWxkIGJlIHN0cmFp
Z2h0Zm9yd2FyZCB0byB0cmFuc3BsYW50IHRoaXMgdG8gdGhlDQo+IHJwbXNnIGludGVyZmFjZS4N
Cj4gPiA+DQo+ID4gPiBSZWdhcmRzLA0KPiA+ID4gQmpvcm4NCj4gPiA+DQo+ID4gPiA+IFRoYW5r
cywNCj4gPiA+ID4gU2hlbndlaQ0KPiA+ID4gPg0KPiA+ID4gPiA+IEludGVycnVwdCBzdXBwb3J0
IGRvZXMgaG93ZXZlciBuZWVkIHNvbWUgY2hhbmdlcy4gVGhlDQo+ID4gPiA+ID4gdmlydGlvX2dw
aW9fcmVxdWVzdF92cSgpIHJlcGxhY2VtZW50IHdvdWxkIG5lZWQgdG8gc2VlIGlmIHRoZQ0KPiA+
ID4gPiA+IHJlY2VpdmVkIG1lc3NhZ2UgaW5kaWNhdGVzIGFuIGludGVycnVwdCBhbmQgY2FsbCB0
aGUgZXF1aXZhbGVudA0KPiA+ID4gPiA+IG9mIHZpcnRpb19ncGlvX2V2ZW50X3ZxKCksIHNpbmNl
IHJwbXNnIGRvZXMgbm90IGhhdmUgYSBzZXBhcmF0ZQ0KPiA+ID4gPiA+IG1lY2hhbmlzbSB0bw0K
PiA+ID4gZGVsaXZlciBpbnRlcnJ1cHRzLCB1bmxpa2UgcnBtc2cuDQo+ID4gPiA+ID4NCj4gPiA+
ID4gPiBBdCBhIGd1ZXNzLCA5MCUgb2YgdGhlIGNvZGUgd291bGQgc3RheSB0aGUgc2FtZT8NCj4g
PiA+ID4gPg0KPiA+ID4gPiA+ICAgIEFuZHJldw0K

