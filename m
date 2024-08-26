Return-Path: <linux-gpio+bounces-9169-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCA195EDE4
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 12:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77E351F22A4A
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 10:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FFA1474A9;
	Mon, 26 Aug 2024 09:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="GTkalBnh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2097.outbound.protection.outlook.com [40.107.215.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CD0146A86;
	Mon, 26 Aug 2024 09:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724666392; cv=fail; b=fBrUYhWWlphXSeZfddIo7QkBu/Gw70m41OZ3LqKfGWc+m0m24YArsK0TU4STMvCyQdTvgiTgZE+1SB3AxqZog/3dzZhA1NIJd9LEHsRw7f/q4Pp1R2XqmUMIHPEhUrMLAjsZXqQWZe9p5eVCxFyVl9aHnHrdtJsC9/m3uA7+uvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724666392; c=relaxed/simple;
	bh=d80iYMYovVg7fZSPY1JR8Gd4rBb0/wSBD3Kt50Kxpcg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=q8/1WzqNeu/Z26KPC2joEZ5ECz7Rt936v2lLdsZx7TEtdDZPJ5484MrWwQL9nzAPFbiD2TY7V1BZ958gmwhxLiCvzRe/IYOrWreAB6lSZngZOc6gMuqWo68+o17nXWIF0zOqqmuKsxtyznNaosbIKYd0msti0y1j+4W+V9JhIy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=GTkalBnh; arc=fail smtp.client-ip=40.107.215.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQ2zPt8/Hj5C017/jTAxekPioszvbK+QOzMLsCZBQLUdx7XtXpdsb4CgwdrVDfNPmA4mmseK07vRrHh+aIFT63kS0iMMTcD/0za+wtijfKv1JXWH7ldtQWVhy9bFMH+dohMFaPpNorCvfzR2qsvLUeLulzCQr5yROvDG6R/c+rnopSnn5tQef56/P2F+nwyObYOkj8780MfdnmXJ759tYZ+bRt09bsMaUgDYhe2P7iLOczqdYsav4XvtTAvM9Y2Fyo9QRmJiF9eNqjNFxq4idC1vuePtteTR2boSHkbpfZiqu8bl0gN+j7p2ke2cVxU1sj3wYE5ZcCfpxxk100gL4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8sS7QSIEhSsBRSEuXADt94OtjSH17hItMheIinOLTY=;
 b=ZGs/tQX+uxKVIxzVEYWtDp9ALX+ISFl5xJe0PBpQR4g1sRmLteezkGuhSgGCIzO8lIsjUS3xQDEQNL8hK1JNdZC3KduqHi/iv3VbJ8he/GPWcPlyIXc+wg5whyt/+yewu+56IJHxzIQqhBONdSnyD6+wHn1ZiWXjOqERK3xmi9s8Y9WfN4G3rCwpBTQTB7vQN53NNEjpiyv0zJRb50fJXmIw1t5Po+0FL+SQ5oan27Oai5dv5oHwfZrmDwlnlHHBtZLbcFgqRJyccUb0cKX9OiihGjA+xt+TJxf5kV6SgTTCFtqv83ziPvG0OnX9FL57WJYx7ks6eYmoaUp3BUo8Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8sS7QSIEhSsBRSEuXADt94OtjSH17hItMheIinOLTY=;
 b=GTkalBnh0N/JMceYwH+XKKWUajIDn3d22yHNDYyFjXXs8mXUFelFe46bN92Icc2H4rB0dAxhhStDFxReCQom+A6mW1vmNC/Dk6xf0lZC7/Uzq65YNHqRrI5ZeMxaiwQK2jJ3nL2EsmdPj7JRmfvJ0uU/VXcn7wBnZtvItlFcGNNptdgUVLpV2y2wf0Hd1OuRVum0QqZQkUpXPXJ1SrWLgvqX63uwQqvDSb8ynlna4t6D1Wle719fLHfxyhhlw4ckWbuA7R9AJA11r9tV1HGkLusB7LOqABjEA7r4rAXCJGjK1KMNewhJOtFjR7aKGtkwTvmsTqFDVgLUUsQKg1DLig==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by PUZPR06MB6268.apcprd06.prod.outlook.com (2603:1096:301:112::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 09:59:41 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%6]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 09:59:41 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH v1 2/2] gpio: Add G7 Aspeed gpio controller driver
Thread-Topic: [PATCH v1 2/2] gpio: Add G7 Aspeed gpio controller driver
Thread-Index: AQHa85jW3giFtrQL+EeXEX8rz+LNzbIxnxIAgAexdMw=
Date: Mon, 26 Aug 2024 09:59:41 +0000
Message-ID:
 <OSQPR06MB72520EF21B0C8B46AEDF96C18B8B2@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20240821070740.2378602-1-billy_tsai@aspeedtech.com>
 <20240821070740.2378602-3-billy_tsai@aspeedtech.com>
 <CAMRc=McaNo5hxEwJJhZSE8PWno5r7+9XLn-1iZoJkRfNHN8U0Q@mail.gmail.com>
In-Reply-To:
 <CAMRc=McaNo5hxEwJJhZSE8PWno5r7+9XLn-1iZoJkRfNHN8U0Q@mail.gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|PUZPR06MB6268:EE_
x-ms-office365-filtering-correlation-id: f9db4dd2-9308-40b5-7f8d-08dcc5b5ce14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?QrcqwK9t2dufz6fBn6B/053Wa8PmLXYT/deXq22ySWuC3u5Y+JBt61/4?=
 =?Windows-1252?Q?hNXtt17OvxdPkJC8cgDNhEHHsyAZYcHuZ0AU4Pw6Ijiik63bfN1Xf8jI?=
 =?Windows-1252?Q?Z5ZjQJDYZKICpxtLv6YId3nJuav6zq9ybq79K0XUb7he1S0YaJWNwDyB?=
 =?Windows-1252?Q?ybPNlsS6aXKheXP5hzj6YGSKWv1fMcF5L1sTC7WJOGOy5CbjUzBQL8s5?=
 =?Windows-1252?Q?aT/ktMds999ua1fhfTDl3Y4olHMzbinSQP+9MHo+MGy19f2awzaOJbGT?=
 =?Windows-1252?Q?2jR8fhq+hPg+2mnJySIjXZgrpPmnfTsLzZK6qwNby+8v8IczLXClRUbN?=
 =?Windows-1252?Q?Cby8eucw4bQtpB0FCDaAXH4DjwUWM+djkIb0T2ESgQ9rnZYvnyM3LUtc?=
 =?Windows-1252?Q?0cz/TSYSogDnpAnzgqCCGKcK7fB4MHf0kXTopq6cpupTP/gvfhkpt27n?=
 =?Windows-1252?Q?6Dux3gr1GSfnAg4sZbGm2Z37/KMbSdSAc8NeIjURPRR08xdSLbG7ABEM?=
 =?Windows-1252?Q?DT8LyktSFqOmqNNeTAOueMIFInYESoiD2+VA5Jp4mbRINXQztibYhoba?=
 =?Windows-1252?Q?iCT3D2zyTEUpPmi1iOL/ODPRVU/BZ0bFJ5bYMXY6eiAXHUPqAU+cEwX3?=
 =?Windows-1252?Q?NGD/JObGGzBpdOEsiOqueobfawGvltqBIu1/FMNAb2fQ5sHDS+a6gTui?=
 =?Windows-1252?Q?8W/MPosy4KxwxfzeMtUXtCPAKIhvCfyJ5OlHdUPpAR0WFw7qwympKu81?=
 =?Windows-1252?Q?FR1xIu2qmv51UBXE3ZH+dMqpGEepAc9vefH3XFmVsttkTFf92p70Pr4r?=
 =?Windows-1252?Q?QvhASs5Uo2/lMEls1ShQQ8mmdWt4xXh0+0NPALQikwn7fyPrFRw2geqw?=
 =?Windows-1252?Q?MN0GGa6C2aBtjhm6GnPyW1qrlYALzRstqmJ2v4ppNoSZwJHMAHfTdoEh?=
 =?Windows-1252?Q?THmfggY11ymwDxWLnw/aghotKUe4vmhj7mO6nACaPFcX6xm/RZBNeBbs?=
 =?Windows-1252?Q?DIqDXKsXubLZk+4dNqGqF0itGRzDHT7cSFRpY+HCh11Phx5NSM546R2g?=
 =?Windows-1252?Q?1wZnn/SMefw2nZWBslk0HcvdsXtdGS5HI3qeEZhrJOFeZ3CHqk6E/a6y?=
 =?Windows-1252?Q?rBbJsN24aOOruloykMJuEjBIRNlauYQCrll/25oVCZZVq2cxvAfk1e3U?=
 =?Windows-1252?Q?R7vsN8CzmtT7wF1j1yIqExxoWV8IQNfnvde3WRGmXQD33oGFpSQ2vg3K?=
 =?Windows-1252?Q?sFnfl/9zbcluioot0iyVo06T88dWaCsW5OIFT1HH0mW0FQWr+LCL1vgv?=
 =?Windows-1252?Q?MeHUGRJfLOhI5cSJbHEuxVwUIZ9I71ZP2CoI/L/pqjU8/7QI83YRsItc?=
 =?Windows-1252?Q?36NZbXpWSJZ8/48nIIyuLdTHH3b4BXdCaSUzElGG6aXfikpeKMh9fMSn?=
 =?Windows-1252?Q?YgPAfc2P/a6B5RD5tskFSydb2svtwBC6CR1Jrti0cnjDhj2eU0BEjSpB?=
 =?Windows-1252?Q?xH/BG7jaaWlZ8SfRaM5PNzDv9OU/8g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?iulvKWZYpN4HcvgMCox7j5leHFAvO7oVJvj5B3MLo5aXVvbzXgCUwDQc?=
 =?Windows-1252?Q?8/NfKHwYxGLZ3dC+GZ9YEERAGOuZ2AaQBW6Rx17jJkQ1djsj2DkOZUN9?=
 =?Windows-1252?Q?QiN2wvaZ/51IqNK3OJLWIdLc/rgE8D8h+skv9asD2ztbEklgwhfUB2TG?=
 =?Windows-1252?Q?vfsQ/emYX/1EL3ltzApKomA7Rr3fLS3IgwSCIMrLhhIEZzWLO7WfXk2N?=
 =?Windows-1252?Q?SWCBhaN2tCHykOiTW7EBvl0uyyBHhMpOgoJeR5rfqGQ8iSlPnpQfFM1G?=
 =?Windows-1252?Q?VzcMongMDT3kLkXANcJ01n33WyJKbfhxMZa+/9VX5YXMUPo9vG+F5/LD?=
 =?Windows-1252?Q?Hdpfce0EFru9nTNxqwxN0JmqpSw/tJ79bT/LIMYj/y4hrDUhIVYk2Emv?=
 =?Windows-1252?Q?GvkgyAbRqHFE+Iv7effXsGN/c0SXQ6d6buKKLIkj3/o46scG37wSvGRd?=
 =?Windows-1252?Q?YDC08pSp3XcbO9Ya7QWD+5nj07HAXvIhHVFYFVw2PKDtVjyU4ZyuO/aG?=
 =?Windows-1252?Q?AzB3VZeRNc81WNKjYdQ8Ndyae5iFQ4569J8+OfvNK3YhckVyVysnVLgj?=
 =?Windows-1252?Q?5sUOkHr1WB/e33zOvnPRMRUfcr2dfwo4Q99f1ZBodyLhhSlAVE4FN1v3?=
 =?Windows-1252?Q?VWESHOb0vYwkG9bQieKB1uBGVX+YJAej1mKCpTArLLMK3Eo3lpBFirfh?=
 =?Windows-1252?Q?bRvRLr6s6Aq+yDARe0DDUgeaqdNfwdkq9JC3nX1Mk3P+H/mdNi0GnvN2?=
 =?Windows-1252?Q?IqNgjj1XNjLb2VEW+oqvCjIqdln8rhVID+ZQR9igjr9tmwZz5FSmtk8u?=
 =?Windows-1252?Q?JeGsaLRt2xOjeOSUbCt6OnC3WO9ZCrHb37Fv5VwzBVUwfyDVs5w5GEXm?=
 =?Windows-1252?Q?XCfe0WzJQnodSTWu1qyHrVrqc3zeVzhCYRwMz0ZlehybsR9SpSldxmUk?=
 =?Windows-1252?Q?+cL01J4QjgkY0Ax+M30BgeFRPWlCvFMXKc7+xlU5SswOBxLyEr4k8IqY?=
 =?Windows-1252?Q?001LDUWv6JN7P4YvHrAhJKjd21liRQZYgKXmo5ZcV9RnC9e7goTrnm1b?=
 =?Windows-1252?Q?/6m0y/KiN9aOYLmSXlpj5k5ewSuci9Kt7uGdUeTFA4kHwRy2HvqWMXvo?=
 =?Windows-1252?Q?T5qHJGhgXb60t9wk0+rTjb7uIakz/YrsS3Pep6B9d9MsIAlp6TDdxzju?=
 =?Windows-1252?Q?j+UOULKNdVSK9rqvliCL10z7oCQrM9MyIJkfB4k1IUHOC6KY+4SrDieD?=
 =?Windows-1252?Q?Dx7IebejjmWQ0xhkn64VYam78zodiS3YTm0q9XfZmMAp5vSQIx8tBOwn?=
 =?Windows-1252?Q?rpQ3rRX/OY9+CDTFGUfNJ4M9D3i1IAwy7vuaYhvVzarNK9J1uzy6KzTu?=
 =?Windows-1252?Q?uVSheisbznhBe650FY1ZVDt6o0Y1+8ZmyC0rwz7izbXfJrTfE1ef+lIb?=
 =?Windows-1252?Q?9I+Zs1Vt5GsvlGUeFFnYfzTTbkrBaLR6u8N3Q4kMErW9mWxNMow+EoT2?=
 =?Windows-1252?Q?LogE1Anm4h2NMzGgsFg/pD66vZw/bjX58RhoF39MaqhILdbCq2WdK/kx?=
 =?Windows-1252?Q?2Xqic1HWRCjIAnvBEXk6Jgjn5N/7lBmcJbALtwRpz0LE4mlAm9wd7RA0?=
 =?Windows-1252?Q?btR6yac9HnujlJsvnRfe9/qN4EH9LNg9YmIFbp6lxgXTAyO6IF4YcLb0?=
 =?Windows-1252?Q?iZEu1T0+fk8xtlDAhtAUttX3yH23j5bJ?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9db4dd2-9308-40b5-7f8d-08dcc5b5ce14
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2024 09:59:41.6558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YsoVFatQWMbpdCGf16xzItGA6KmVHMgr6JYnML5Oj9C8F6UCnDr9J849819LaTB2H7yzoTH+RXR72L++BN6weDakbSvynX7Pax4VQ179tzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6268

> >=0A=
> > In the 7th generation of the SoC from Aspeed, the control logic of the=
=0A=
> > GPIO controller has been updated to support per-pin control. Each pin n=
ow=0A=
> > has its own 32-bit register, allowing for individual control of the pin=
=92s=0A=
> > value, direction, interrupt type, and other settings.=0A=
> >=0A=
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>=0A=
> > ---=0A=
> >  drivers/gpio/Kconfig          |   7 +=0A=
> >  drivers/gpio/Makefile         |   1 +=0A=
> >  drivers/gpio/gpio-aspeed-g7.c | 831 ++++++++++++++++++++++++++++++++++=
=0A=
> >  3 files changed, 839 insertions(+)=0A=
> >  create mode 100644 drivers/gpio/gpio-aspeed-g7.c=0A=
> >=0A=
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig=0A=
> > index 58f43bcced7c..93f237429b92 100644=0A=
> > --- a/drivers/gpio/Kconfig=0A=
> > +++ b/drivers/gpio/Kconfig=0A=
> > @@ -172,6 +172,13 @@ config GPIO_ASPEED=0A=
> >         help=0A=
> >           Say Y here to support Aspeed AST2400 and AST2500 GPIO control=
lers.=0A=
> >=0A=
> > +config GPIO_ASPEED_G7=0A=
> > +       tristate "Aspeed G7 GPIO support"=0A=
> > +       depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO=0A=
> > +       select GPIOLIB_IRQCHIP=0A=
> > +       help=0A=
> > +         Say Y here to support Aspeed AST2700 GPIO controllers.=0A=
> > +=0A=
> >  config GPIO_ASPEED_SGPIO=0A=
> >         bool "Aspeed SGPIO support"=0A=
> >         depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO=0A=
> > diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile=0A=
> > index 64dd6d9d730d..e830291761ee 100644=0A=
> > --- a/drivers/gpio/Makefile=0A=
> > +++ b/drivers/gpio/Makefile=0A=
> > @@ -34,6 +34,7 @@ obj-$(CONFIG_GPIO_AMD_FCH)            +=3D gpio-amd-f=
ch.o=0A=
> >  obj-$(CONFIG_GPIO_AMDPT)               +=3D gpio-amdpt.o=0A=
> >  obj-$(CONFIG_GPIO_ARIZONA)             +=3D gpio-arizona.o=0A=
> >  obj-$(CONFIG_GPIO_ASPEED)              +=3D gpio-aspeed.o=0A=
> > +obj-$(CONFIG_GPIO_ASPEED_G7)           +=3D gpio-aspeed-g7.o=0A=
> >  obj-$(CONFIG_GPIO_ASPEED_SGPIO)                +=3D gpio-aspeed-sgpio.=
o=0A=
> >  obj-$(CONFIG_GPIO_ATH79)               +=3D gpio-ath79.o=0A=
> >  obj-$(CONFIG_GPIO_BCM_KONA)            +=3D gpio-bcm-kona.o=0A=
> > diff --git a/drivers/gpio/gpio-aspeed-g7.c b/drivers/gpio/gpio-aspeed-g=
7.c=0A=
> > new file mode 100644=0A=
> > index 000000000000..dbca097de6ea=0A=
> > --- /dev/null=0A=
> > +++ b/drivers/gpio/gpio-aspeed-g7.c=0A=
> > @@ -0,0 +1,831 @@=0A=
> > +// SPDX-License-Identifier: GPL-2.0-or-later=0A=
> > +/*=0A=
> > + * Copyright 2024 Aspeed Technology Inc.=0A=
> > + *=0A=
> > + * Billy Tsai <billy_tsai@aspeedtech.com>=0A=
> > + */=0A=
> > +=0A=
> > +#include <linux/clk.h>=0A=
> > +#include <linux/gpio/aspeed.h>=0A=
> > +#include <linux/gpio/driver.h>=0A=
> > +#include <linux/hashtable.h>=0A=
> > +#include <linux/init.h>=0A=
> > +#include <linux/io.h>=0A=
> > +#include <linux/kernel.h>=0A=
> > +#include <linux/module.h>=0A=
> > +#include <linux/pinctrl/consumer.h>=0A=
> > +#include <linux/platform_device.h>=0A=
> > +#include <linux/seq_file.h>=0A=
> > +#include <linux/spinlock.h>=0A=
> > +#include <linux/string.h>=0A=
> > +=0A=
> > +#include <asm/div64.h>=0A=
> > +=0A=
> > +#define GPIO_G7_IRQ_STS_BASE 0x100=0A=
> > +#define GPIO_G7_IRQ_STS_OFFSET(x) (GPIO_G7_IRQ_STS_BASE + (x) * 0x4)=
=0A=
> > +#define GPIO_G7_CTRL_REG_BASE 0x180=0A=
> > +#define GPIO_G7_CTRL_REG_OFFSET(x) (GPIO_G7_CTRL_REG_BASE + (x) * 0x4)=
=0A=
> > +#define GPIO_G7_OUT_DATA BIT(0)=0A=
> > +#define GPIO_G7_DIR BIT(1)=0A=
> > +#define GPIO_G7_IRQ_EN BIT(2)=0A=
> > +#define GPIO_G7_IRQ_TYPE0 BIT(3)=0A=
> > +#define GPIO_G7_IRQ_TYPE1 BIT(4)=0A=
> > +#define GPIO_G7_IRQ_TYPE2 BIT(5)=0A=
> > +#define GPIO_G7_RST_TOLERANCE BIT(6)=0A=
> > +#define GPIO_G7_DEBOUNCE_SEL GENMASK(8, 7)=0A=
> > +#define GPIO_G7_INPUT_MASK BIT(9)=0A=
> > +#define GPIO_G7_IRQ_STS BIT(12)=0A=
> > +#define GPIO_G7_IN_DATA BIT(13)=0A=
> > +/*=0A=
> > + * The configuration of the following registers should be determined=
=0A=
> > + * outside of the GPIO driver.=0A=
> > + */=0A=
> > +#define GPIO_G7_PRIVILEGE_W_REG_BASE 0x810=0A=
> > +#define GPIO_G7_PRIVILEGE_W_REG_OFFSET(x) (GPIO_G7_PRIVILEGE_W_REG_BAS=
E + ((x) >> 2) * 0x4)=0A=
> > +#define GPIO_G7_PRIVILEGE_R_REG_BASE 0x910=0A=
> > +#define GPIO_G7_PRIVILEGE_R_REG_OFFSET(x) (GPIO_G7_PRIVILEGE_R_REG_BAS=
E + ((x) >> 2) * 0x4)=0A=
> > +#define GPIO_G7_IRQ_TARGET_REG_BASE 0xA10=0A=
> > +#define GPIO_G7_IRQ_TARGET_REG_OFFSET(x) (GPIO_G7_IRQ_TARGET_REG_BASE =
+ ((x) >> 2) * 0x4)=0A=
> > +#define GPIO_G7_IRQ_TO_INTC2_18 BIT(0)=0A=
> > +#define GPIO_G7_IRQ_TO_INTC2_19 BIT(1)=0A=
> > +#define GPIO_G7_IRQ_TO_INTC2_20 BIT(2)=0A=
> > +#define GPIO_G7_IRQ_TO_SIO BIT(3)=0A=
> > +#define GPIO_G7_IRQ_TARGET_RESET_TOLERANCE BIT(6)=0A=
> > +#define GPIO_G7_IRQ_TARGET_W_PROTECT BIT(7)=0A=
> > +=0A=
> > +static inline u32 field_get(u32 _mask, u32 _val)=0A=
> > +{=0A=
> > +       return (((_val) & (_mask)) >> (ffs(_mask) - 1));=0A=
> > +}=0A=
> > +=0A=
> > +static inline u32 field_prep(u32 _mask, u32 _val)=0A=
> > +{=0A=
> > +       return (((_val) << (ffs(_mask) - 1)) & (_mask));=0A=
> > +}=0A=
> > +=0A=
> > +static inline void ast_write_bits(void __iomem *addr, u32 mask, u32 va=
l)=0A=
> > +{=0A=
> > +       iowrite32((ioread32(addr) & ~(mask)) | field_prep(mask, val), a=
ddr);=0A=
> > +}=0A=
> > +=0A=
> > +static inline void ast_clr_bits(void __iomem *addr, u32 mask)=0A=
> > +{=0A=
> > +       iowrite32((ioread32(addr) & ~(mask)), addr);=0A=
> > +}=0A=
=0A=
> For all of the above and similar instances below - can you add the=0A=
> aspeed prefix to symbols?=0A=
=0A=
Okay, I will add the aspeed prefix to these functions or use regmap to repl=
ace them.=0A=
=0A=
> [snip]=0A=
=0A=
=0A=
> > +=0A=
> > +/*=0A=
> > + * Note: The "value" register returns the input value sampled on the=
=0A=
> > + *       line even when the GPIO is configured as an output. Since=0A=
> > + *       that input goes through synchronizers, writing, then reading=
=0A=
=0A=
> Drop the leading tabs indentations from the comment.=0A=
=0A=
Okay.=0A=
=0A=
> [snip]=0A=
 =0A=
> > +=0A=
> > +       register_allocated_timer(gpio, offset, i);=0A=
> > +       configure_timer(gpio, offset, i);=0A=
> > +=0A=
> > +out:=0A=
> > +       raw_spin_unlock_irqrestore(&gpio->lock, flags);=0A=
> > +=0A=
> =0A=
> How about using scoped guards across the driver? You'll avoid such labels=
.=0A=
=0A=
Okay, I will use the guard(raw_spinlock_irqsave)(&gpio->lock) to replace it=
.=0A=
=0A=
> [snip]=0A=
=0A=
> > +=0A=
> > +static int aspeed_gpio_g7_set_config(struct gpio_chip *chip, unsigned =
int offset,=0A=
> > +                                    unsigned long config)=0A=
> > +{=0A=
> > +       unsigned long param =3D pinconf_to_config_param(config);=0A=
> > +       u32 arg =3D pinconf_to_config_argument(config);=0A=
> > +=0A=
> > +       if (param =3D=3D PIN_CONFIG_INPUT_DEBOUNCE)=0A=
> > +               return set_debounce(chip, offset, arg);=0A=
> > +       else if (param =3D=3D PIN_CONFIG_BIAS_DISABLE || param =3D=3D P=
IN_CONFIG_BIAS_PULL_DOWN ||=0A=
> > +                param =3D=3D PIN_CONFIG_DRIVE_STRENGTH)=0A=
> > +               return pinctrl_gpio_set_config(offset, config);=0A=
> > +       else if (param =3D=3D PIN_CONFIG_DRIVE_OPEN_DRAIN || param =3D=
=3D PIN_CONFIG_DRIVE_OPEN_SOURCE)=0A=
> > +               /* Return -EOPNOTSUPP to trigger emulation, as per data=
sheet */=0A=
> > +               return -EOPNOTSUPP;=0A=
> > +       else if (param =3D=3D PIN_CONFIG_PERSIST_STATE)=0A=
> > +               return aspeed_gpio_g7_reset_tolerance(chip, offset, arg=
);=0A=
> > +=0A=
 =0A=
> Please use a switch here like everyone else.=0A=
=0A=
Okay.=0A=
=0A=
> > +       return -EOPNOTSUPP;=0A=
> > +}=0A=
> > +=0A=
> > +static void aspeed_gpio_g7_irq_print_chip(struct irq_data *d, struct s=
eq_file *p)=0A=
> > +{=0A=
> > +       struct aspeed_gpio_g7 *gpio;=0A=
> > +       int rc, offset;=0A=
> > +=0A=
> > +       rc =3D irqd_to_aspeed_gpio_g7_data(d, &gpio, &offset);=0A=
> > +       if (rc)=0A=
> > +               return;=0A=
> > +=0A=
> > +       seq_printf(p, dev_name(gpio->dev));=0A=
> > +}=0A=
> > +=0A=
> > +static const struct irq_chip aspeed_gpio_g7_irq_chip =3D {=0A=
> > +       .irq_ack =3D aspeed_gpio_g7_irq_ack,=0A=
> > +       .irq_mask =3D aspeed_gpio_g7_irq_mask,=0A=
> > +       .irq_unmask =3D aspeed_gpio_g7_irq_unmask,=0A=
> > +       .irq_set_type =3D aspeed_gpio_g7_set_type,=0A=
> > +       .irq_print_chip =3D aspeed_gpio_g7_irq_print_chip,=0A=
> > +       .flags =3D IRQCHIP_IMMUTABLE,=0A=
> > +       GPIOCHIP_IRQ_RESOURCE_HELPERS,=0A=
> > +};=0A=
> > +=0A=
> > +static const struct aspeed_bank_props ast2700_bank_props[] =3D {=0A=
> > +       /*     input      output   */=0A=
> > +       { 1, 0x0fffffff, 0x0fffffff }, /* E/F/G/H, 4-GPIO hole */=0A=
> > +       { 6, 0x00ffffff, 0x00ffffff }, /* Y/Z/AA */=0A=
> > +       {},=0A=
> > +};=0A=
> > +=0A=
> > +static const struct aspeed_gpio_g7_config ast2700_config =3D=0A=
> > +       /*=0A=
> > +        * ast2700 has two controllers one with 212 GPIOs and one with =
16 GPIOs.=0A=
> > +        * 216 for simplicity, actual number is 212 (4-GPIO hole in GPI=
OH)=0A=
> > +        * We expect ngpio being set in the device tree and this is a f=
allback=0A=
> > +        * option.=0A=
> > +        */=0A=
> > +       {=0A=
> > +               .nr_gpios =3D 216,=0A=
> > +               .props =3D ast2700_bank_props,=0A=
> > +       };=0A=
> > +=0A=
> > +static const struct of_device_id aspeed_gpio_g7_of_table[] =3D {=0A=
> > +       {=0A=
> > +               .compatible =3D "aspeed,ast2700-gpio",=0A=
> > +               .data =3D &ast2700_config,=0A=
> > +       },=0A=
> > +       {}=0A=
> > +};=0A=
> > +MODULE_DEVICE_TABLE(of, aspeed_gpio_g7_of_table);=0A=
> > +=0A=
> > +static int __init aspeed_gpio_g7_probe(struct platform_device *pdev)=
=0A=
> > +{=0A=
> > +       const struct of_device_id *gpio_id;=0A=
> > +       struct aspeed_gpio_g7 *gpio;=0A=
> > +       int rc, banks, err;=0A=
> > +       u32 ngpio;=0A=
> > +=0A=
> > +       gpio =3D devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);=
=0A=
> > +       if (!gpio)=0A=
> > +               return -ENOMEM;=0A=
> > +=0A=
> > +       gpio->base =3D devm_platform_ioremap_resource(pdev, 0);=0A=
> > +       if (IS_ERR(gpio->base))=0A=
> > +               return PTR_ERR(gpio->base);=0A=
> > +=0A=
> > +       gpio->dev =3D &pdev->dev;=0A=
> > +=0A=
> > +       raw_spin_lock_init(&gpio->lock);=0A=
> > +=0A=
> > +       gpio_id =3D of_match_node(aspeed_gpio_g7_of_table, pdev->dev.of=
_node);=0A=
=0A=
> Please use device_get_match_data() and elsewhere use generic device=0A=
> property getters instead of the specialized OF variants.=0A=
=0A=
Okay.=0A=
=0A=
> > +       if (!gpio_id)=0A=
> > +               return -EINVAL;=0A=
> > +=0A=
> > +       gpio->clk =3D of_clk_get(pdev->dev.of_node, 0);=0A=
> > +       if (IS_ERR(gpio->clk)) {=0A=
> > +               dev_warn(&pdev->dev, "Failed to get clock from devicetr=
ee, debouncing disabled\n");=0A=
> > +               gpio->clk =3D NULL;=0A=
> > +       }=0A=
> > +=0A=
> > +       gpio->config =3D gpio_id->data;=0A=
> > +=0A=
> > +       gpio->chip.parent =3D &pdev->dev;=0A=
> > +       err =3D of_property_read_u32(pdev->dev.of_node, "ngpios", &ngpi=
o);=0A=
> > +       gpio->chip.ngpio =3D (u16)ngpio;=0A=
> > +       if (err)=0A=
> > +               gpio->chip.ngpio =3D gpio->config->nr_gpios;=0A=
> > +       gpio->chip.direction_input =3D aspeed_gpio_g7_dir_in;=0A=
> > +       gpio->chip.direction_output =3D aspeed_gpio_g7_dir_out;=0A=
> > +       gpio->chip.get_direction =3D aspeed_gpio_g7_get_direction;=0A=
> > +       gpio->chip.request =3D aspeed_gpio_g7_request;=0A=
> > +       gpio->chip.free =3D aspeed_gpio_g7_free;=0A=
> > +       gpio->chip.get =3D aspeed_gpio_g7_get;=0A=
> > +       gpio->chip.set =3D aspeed_gpio_g7_set;=0A=
> > +       gpio->chip.set_config =3D aspeed_gpio_g7_set_config;=0A=
> > +       gpio->chip.label =3D dev_name(&pdev->dev);=0A=
> > +       gpio->chip.base =3D -1;=0A=
> > +=0A=
> > +       /* Allocate a cache of the output registers */=0A=
> > +       banks =3D DIV_ROUND_UP(gpio->chip.ngpio, 32);=0A=
> > +       gpio->dcache =3D devm_kcalloc(&pdev->dev, banks, sizeof(u32), G=
FP_KERNEL);=0A=
> > +       if (!gpio->dcache)=0A=
> > +               return -ENOMEM;=0A=
> > +=0A=
> > +       /* Optionally set up an irqchip if there is an IRQ */=0A=
> > +       rc =3D platform_get_irq(pdev, 0);=0A=
> > +       if (rc > 0) {=0A=
> > +               struct gpio_irq_chip *girq;=0A=
> > +=0A=
> > +               gpio->irq =3D rc;=0A=
> > +               girq =3D &gpio->chip.irq;=0A=
> > +               gpio_irq_chip_set_chip(girq, &aspeed_gpio_g7_irq_chip);=
=0A=
> > +               girq->chip->name =3D dev_name(&pdev->dev);=0A=
> > +=0A=
> > +               girq->parent_handler =3D aspeed_gpio_g7_irq_handler;=0A=
> > +               girq->num_parents =3D 1;=0A=
> > +               girq->parents =3D devm_kcalloc(&pdev->dev, 1, sizeof(*g=
irq->parents), GFP_KERNEL);=0A=
> > +               if (!girq->parents)=0A=
> > +                       return -ENOMEM;=0A=
> > +               girq->parents[0] =3D gpio->irq;=0A=
> > +               girq->default_type =3D IRQ_TYPE_NONE;=0A=
> > +               girq->handler =3D handle_bad_irq;=0A=
> > +               girq->init_valid_mask =3D aspeed_init_irq_valid_mask;=
=0A=
> > +       }=0A=
> > +=0A=
> > +       gpio->offset_timer =3D devm_kzalloc(&pdev->dev, gpio->chip.ngpi=
o, GFP_KERNEL);=0A=
> > +       if (!gpio->offset_timer)=0A=
> > +               return -ENOMEM;=0A=
> > +=0A=
> > +       rc =3D devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);=
=0A=
 =0A=
> Just return devm_gpiochip_add_data().=0A=
=0A=
Okay.=0A=
=0A=
> > +       if (rc < 0)=0A=
> > +               return rc;=0A=
> > +=0A=
> > +       return 0;=0A=
> > +}=0A=
> > +=0A=
> > +static struct platform_driver aspeed_gpio_g7_driver =3D {=0A=
> > +       .driver =3D {=0A=
> > +               .name =3D KBUILD_MODNAME,=0A=
> > +               .of_match_table =3D aspeed_gpio_g7_of_table,=0A=
> > +       },=0A=
> > +};=0A=
> > +=0A=
> > +module_platform_driver_probe(aspeed_gpio_g7_driver, aspeed_gpio_g7_pro=
be);=0A=
=0A=
> I see that it was done like this in other aspeed drivers but I would=0A=
> need some explanation as to why you think it's needed here. You do get=0A=
> some resources in probe() that may defer the probing of this driver=0A=
> and this macro doesn't allow it. Unless you have a very good reason, I=0A=
> suspect you want to use module_platform_driver() here instead.=0A=
=0A=
Okay, I will replace it to module_platform_driver(aspeed_gpio_g7_driver); a=
nd hook the probe=0A=
function into the aspeed_gpio_g7_driver structure.=0A=
=0A=
> > +=0A=
> > +MODULE_DESCRIPTION("Aspeed G7 GPIO Driver");=0A=
> > +MODULE_LICENSE("GPL");=0A=
=0A=
> MODULE_AUTHOR()?=0A=
=0A=
Okay.=0A=
=0A=
Best regards,=0A=
Billy Tsai=0A=

