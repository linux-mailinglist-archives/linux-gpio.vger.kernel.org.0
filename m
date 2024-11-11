Return-Path: <linux-gpio+bounces-12824-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A330F9C3D57
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 12:31:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E3051F25A60
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 11:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8926318FC7F;
	Mon, 11 Nov 2024 11:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BP+2xH+/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011056.outbound.protection.outlook.com [52.101.125.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E3018870C;
	Mon, 11 Nov 2024 11:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731324613; cv=fail; b=J1N535bdbFi4mbXBZOnyclAt1zrjVzYlEYfqxEPI8aWWWplAior10iIFN1eXkbzctyAhTk9YxJl6+aq8vIhNfP/Q7vx1MneV9jS+ommqPNsHMFfFNV9obs2Z/9c9oOUU/7MTBnGglpkCE7QCE/PINgn9NMpejQO/G1Ob2XEvS8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731324613; c=relaxed/simple;
	bh=gyUygPEmCpvZSFEKnK8tXDhkX1MhpLg8Us9f8TPb2vc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=at3xkjzEbeOPAutWjlc/6rXcBcBOQuo5DFgZJnwr+5Yu4x6cxk2DptCQCidPZhVSWC0551ndKCZ60CfSTzuLUEEAQJRnrjb2LTq+DnI5xQ4lWl1EbIyEdIAdpzQdkVb6ga+fEPJQTQ+HdQfXVMVruOS7n9BUd09cjFW4hkAw7k8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BP+2xH+/; arc=fail smtp.client-ip=52.101.125.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xs50Alxaw9qavvGP5nGS9lKWUM9xzOrfONnM1Dd3bipSwrb/M/lWC51d0F7OYvix2+1cqztfFOUi0bjltAuub2d89hKDVE5ehz1FPRJ/5YdDoVbOO+N6DyJNjqFJFPF0E9p+k1IlePQip3jrM4ymHXyQcQ+vuA7jef1RFUb7h6LZCTgNFXJ80Dpx8yfpV9wxpsM0zHmQVmP977mtX/YAvxW52vZPYDGXLhbDo4lq0Uwqp4kHGpBwhsNCgBxqzDVfYUtcUeUUJyBxmcRemOkcUy0613KNN4hBghNQP4NBanotX9M0PpS0b8h/2YmvyAvCPsK3KxF7EvmIgSrSnNN/uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyUygPEmCpvZSFEKnK8tXDhkX1MhpLg8Us9f8TPb2vc=;
 b=B5LT6rVxPg+z4eePdpeTehK4YKQoMVBLnhmNE6Ne21q/5jtv2DiiHddmgnAdJAvimfuXZ6Q93seucD/qP2PX9VKuPy0sKS8VP/qXjQj9gXO/eDafTnha3xNt7KrogGbWJ1rOQy9lvF/wlE6RBAus3JlveG8dLlm0HGleZV0sCSBzfJIHyHo47C/rlBPVbhp+uJ6FgK1PASERatGFVES9xUnMuEo9V7Kj6B0jvd8TPi58H+/XjZgsY/rpjferJihmkyt2e8tkzYknjytjF9H8oHaIGglgRL+lO9Erdhko8l0tkysmTr9vU0y568FVqPAEcl9UJuDW9nTu3gfFnR/vrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyUygPEmCpvZSFEKnK8tXDhkX1MhpLg8Us9f8TPb2vc=;
 b=BP+2xH+/oi1Uaze0bEiWrDMU1Iz/xClo4LnpXwlhja/QYRjOaNNSWMaCxjjL2Ij6WWh7ImPD1Nj7qW1r6qHule1sIdQsyZD6FBUHB5vl7MJH3P2djRnB0mEepEpYSBMFJvwdEyDBC5HUJZRrEeT2MtgtH7M8SCLMG675JmwdshE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11063.jpnprd01.prod.outlook.com (2603:1096:400:396::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 11:30:03 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 11:30:03 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 24/25] arm64: dts: renesas: rzg3s-smarc: Enable SSI3
Thread-Topic: [PATCH v2 24/25] arm64: dts: renesas: rzg3s-smarc: Enable SSI3
Thread-Index: AQHbMcwk+s13zfsAPEGSqJT9ouqgjLKwN5YwgAG8EACAAABHYA==
Date: Mon, 11 Nov 2024 11:30:03 +0000
Message-ID:
 <TY3PR01MB1134600DEBF0096A67950441086582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
 <20241108104958.2931943-25-claudiu.beznea.uj@bp.renesas.com>
 <TYCPR01MB113329FE5E9E610BEF45DC001865F2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <c15bb621-6cd9-4be3-beec-20fecd411547@tuxon.dev>
In-Reply-To: <c15bb621-6cd9-4be3-beec-20fecd411547@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11063:EE_
x-ms-office365-filtering-correlation-id: bbb9e15b-dd60-4a85-cdfe-08dd02442f59
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZUg2TDlLZWlxYVFVeHFuS3lhWDJOSjRWaDJnNE5yTUdZMU1HQWg4QkJSRWVt?=
 =?utf-8?B?YXdacnR6Lyt4aFo3SjdZRUtPa3lFWWJwaXZmWndJYmVESnlqMWpSd05XYkdU?=
 =?utf-8?B?cCtZWjkvdzlPS3BYVzBINmpjVnNsWHJDVXZSKzdFSDBEQ21RbkphdHUzT20z?=
 =?utf-8?B?cTl2Q1dHaUxRSlc2U2J1akNESm1iOEZxcjRWUnJLVDI1VUc3dFA1TEtEclNn?=
 =?utf-8?B?Rkc2ak1paCt5eHdQQUdEN3pweVNTUTVqaitpNmJXL1JFNTRPS3dOWDU3YWZn?=
 =?utf-8?B?UU1OOWhZZStVUkdGSmdxRjR3dFBybnE5V1l4TzBoM09FV3FRcnBiQkNWaC9G?=
 =?utf-8?B?QkdabXR0ZzMyeDZ2MXJsbk1FMWJpMnZNNHE3L2xDaUl2bU1RVkNtSlgwQlcy?=
 =?utf-8?B?d1Q2M1ErQ2sxSFNXWkx1MmJ0SXczMnFxVHlRN1lTOTZRcHF6dDJlWS96UUVL?=
 =?utf-8?B?WW9hY29KczVvOHQvMStqdFpaZUNGOTVnS3ZxU3QzSGF6MSs5QnlXY20vNUp5?=
 =?utf-8?B?Qkp5dE05UXlZR2Z2WE5LMXFZajdaQUhtbmJ3aUR6am5WeE9zazh4WUVuaDdy?=
 =?utf-8?B?VWVIeCt6aUMrdTFoQXc5bTIrSlZSNWdyMVY0YitjZVd5N1lZR2h3RmFJZWox?=
 =?utf-8?B?WjJ6amwxSkhRblJxRkQ2d3ZQSkQ1K0dKRDNIcUxpMHFPZVpFREQ4WFFrd3E0?=
 =?utf-8?B?SnU4TVQ4bEFleWhjdW5UMjNUUXVMN1JFOWtEeU9jS2lqTUxOSzloYXNTMHcr?=
 =?utf-8?B?U0NYYWwvRTlnL2NMREVUbjJoVExhTmU0SUE4bHVvOUhXQTZmeEg3aFd0QXdk?=
 =?utf-8?B?WUJvVkpzNUc5RzJURUJQOUJ6N2dVTHV5aklPZ09EeG5tWFBjSDRhUGFmVkU5?=
 =?utf-8?B?QjJPNXlJeUlvQXNyeVpwZzdNZTZGcWxyZ1NCWnp1YkdoTFFGYyt4aGN0TXF5?=
 =?utf-8?B?WkJZektVTTJDMElzSE5hTWIzM0F0bDMrRzNoWXZhQWIwZVh3Z3dRNDhmYmZ1?=
 =?utf-8?B?ZGpiZEN5eW1VUk5IRHZTdURvKzR2TjAwb0w3Mmd2NndHV2ZucXU0ZFAvSmcw?=
 =?utf-8?B?UW9USUdtSng1RWpyZ0x0eDNJam5Zc01VOEZKOTM4WWNoeXlMRDJiT2hNejJN?=
 =?utf-8?B?ZXFGczVTWkF3SVdIdGQ5ZEpPbDFDako1ZE02WkNsVkx5VkpKcFZLVnVSNjNT?=
 =?utf-8?B?TGFITmhFU1M5TkREVGRJZk1TVDhiWVE0M3EvMHFqUWExWExoRklCU2xVVzdo?=
 =?utf-8?B?Q2JtYnhLK3ZFd0ppSVpudDdMTlFmdVFpNUtocTRwK1c2dStRVksrYXdOb2lv?=
 =?utf-8?B?V2RKYUMvZXZvaWp4cHAzSlFiVlI5cTdTWG1rMHYrNGt5dWJCZFRlbU1kektE?=
 =?utf-8?B?MTZscHBCNEdZOWo5ZWdCN2JDZEhTemREckFGdlYwcUxDVk1HM2NFanE2Y1NY?=
 =?utf-8?B?STVFMDk4VWd5MFV6MFpnVmVGSCsyYjNleFZtV3JIQ2d5Yy9NWXBzcFR6TzA1?=
 =?utf-8?B?R3kyeFRrbDRyaXlIT2ZDYXJNWGtrditzam1HeTA4M2RvclhqVXJrRXpJM0RY?=
 =?utf-8?B?VGxVK2hiemV6b0k2R1ZRM3VLSGhIZzI1ejVGQVpoNG1mYUMyQm9tTHBLaVBw?=
 =?utf-8?B?ekxndlp3NlZxOWNVcGowWk03NU5YaUZiNlFUS1JheGlLb0FFOW1KR2N4cnor?=
 =?utf-8?B?aEUvcjNPT0VVSTFTVFVpY1V4ZFZJMjVaTHJTSWp0ZFIrb2pSVE1Sb1FzUVpo?=
 =?utf-8?B?OFVnN1c4ZTBlWFpPMGg2eEJKQnhMVWplc3RJOGlrM3gxbXMzdjZmSndyUk43?=
 =?utf-8?B?bXlmeXJXSTZDdi81TTVRNmdVZ2JYS21NZXJ6azg0WlIzWWZQK0s5eDVqYVhO?=
 =?utf-8?Q?pgz/Cm+zFFIIJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VzNFV2FxS2FaRnJ1SVJrRWdNc1k5M0NhalhKL3N6SDMwVWhsYTZQMVRUQkow?=
 =?utf-8?B?ME9TanZHWHB6OWhzYkVBd2IxY0hPZHRaWmUrYW95NjN3cVdMeEtDeTVLM2o3?=
 =?utf-8?B?V3VMc3FkNW9SekloUURndERIMjluTVpwY1o0THVDTzVOV3gzSVQ0MVAwZjBV?=
 =?utf-8?B?WGNTUDhSek02aU1IV1BZRkd5M2sxejNRa0N3WmF4ZHgxZHhha2dxdlRrK0Rh?=
 =?utf-8?B?eU04dWRTRGJXNWxEcFVTV1NCRXl4dStoK0wrbTRJYmlQVzQ5dWVxbzhJVmM0?=
 =?utf-8?B?TVB6S1lwQUhaMnVpZFFUWUVZbTNFNzgyMm1yeXhwRThiWkI4YTFybURrVHFa?=
 =?utf-8?B?N0pUaHdtWDZjbjFQdkg2TS9KUHNHN0hlYkp6b3ZSakRRS1RpWXpKMjhXUzVV?=
 =?utf-8?B?M20xNEd4MlBoeGU2ejR5bkRXbmo1RHJNZ0MzQ3M4MjlEeEM2cVpNbzVscFFJ?=
 =?utf-8?B?alBMNjFpM2JpK0swcHNaWHluMWZSdUV4cUw3N0RVbzBnajRTWHlUMW5nb08x?=
 =?utf-8?B?cUgwR2UxNDBMMklYS0FiOXFHb3JGNVhxdVNZMDJweG1tclA0bFBteVRDMWh3?=
 =?utf-8?B?ZUowRnJCWHdRN2FHTmFIQXNsZG82LzkyQVJ2cDRMWmhZaExOSGtKaGR5cnZl?=
 =?utf-8?B?dGxuSVFYN1pneStZVzNOdVdoM1Q0MGhtYmRmQTMydldLUmR4OWNMWVpIUE1t?=
 =?utf-8?B?TFZSZSthTzJTVFI3Q2ZpSDFJZGM2ZndLM0pBeFdLTVRHeU9sdUZiVHZ1YVR0?=
 =?utf-8?B?SWx2WjZ1TEVhaENGekliWkErTU9MaHBqTyt2dW5ZbkJ4UXI2dkZLa2tsUm5W?=
 =?utf-8?B?UUw1Q2lrSTZ5SElEKzF3b2pnN3QyMXRrcldRekNKMjhyeVUwWFR4OUdLajNt?=
 =?utf-8?B?SEFFOW9CbDZ2eVFZSGdVdFd4anZuRGx1OGdxL1lkUXU0VXlVRnJ0ZFRNbWlN?=
 =?utf-8?B?ekloNG96djdrbW1lNWE2SWFIR1Rra08xNTc0SDJIVFFWTmpaWThLYXNKMndI?=
 =?utf-8?B?RmxMTjBJRnN5QklSb3k1d0NjNWhPVEUrU2tYRFNHTjFvVktBenJiZUN1eGpP?=
 =?utf-8?B?NTlLMGFZSGFWR1g5ejQ4VG5YZVFtV29iTXkyYzZMQzE3aFBYQ3d4aXdLbHhY?=
 =?utf-8?B?SVBVQmZMYklmVzh1ZDlHY20ySHhCc0luNzFxR1RTeU52dXVTZ3FUQ3dTbTBm?=
 =?utf-8?B?amVKV0pwVzRpZWJwb1B3czhsYlFyUjF2K051Mmt2dEcwdlNISjNvaitQdmpI?=
 =?utf-8?B?NmVHNkhrUGhLMlFEYm1FSVh6VGlwVzZqWG5qaExnQ25WdFR4M2hndCtZeWw0?=
 =?utf-8?B?dXpxMXYvancramI1ZG5uYUFFWHo2TDIyaWw1WW9UM21ZNExmVkJpbFVRUGk1?=
 =?utf-8?B?MUdlOG04MFI1TmFnUG0rVlFadmlabGNVTXl6R2U0ZHJZeVZEbTN6UEtZRE91?=
 =?utf-8?B?ekZSeU43SUN1YllZWTdza3VHZWNYeUpYdHNMRlRqL1RlbmYvN1pNS3NJMDdG?=
 =?utf-8?B?aklHMzFQaHBwZlhFUDhxWHJSeXBTOFpMRWZST3JTMzJucERiZ1hZanFjOERJ?=
 =?utf-8?B?MWtETUU4L1hsRFdBOXlDdkU1NUV5anU3N3Vmd1d1dE5LaUZ3WUJudm83d2o2?=
 =?utf-8?B?bERGWnBEcDc4bXB0K0RLNWpjR3k4c09Cd2xjVWIwVnVXVVcvOWJHVnJIdW56?=
 =?utf-8?B?ZzNpdUk4RmZrOGcvTTJzVVhwWmFZOEpHMW1PUHZZM0M1WnNnVDlYektGMUJY?=
 =?utf-8?B?R0xUUmNVaE5RcU1jWFdxTnNsMGRXMEdya1R1U0JBTW92eEgxSDJOeis0ZmI0?=
 =?utf-8?B?eGNQRFRmVi9KTDFHcER5bGlKbENyYjhMWWRjWDRxV2p2STJLS01ZUmlkMEs4?=
 =?utf-8?B?L3BvZkUxN1JzUlNwdHhVNFZ3ckk5OFNJSWJoOUIxNVJkS0w4NUdxN0c4a1U4?=
 =?utf-8?B?Qjd1OGRXdS9rSlRaK2hwcHdPc2pjblF1ZFdIaitPcHNlQy9KYi91MEF1UHNm?=
 =?utf-8?B?blR4Mm9YWFlJZzJDc0FUVndDRFRhVEhFdWFtUHZSWnNkS1hpK2lDeFRVYi9k?=
 =?utf-8?B?dzlVS1dyQnpacG55RzFSTXovV3NCamg4K0RjSEZOQUxkdk9hUk5COHdKSUtX?=
 =?utf-8?B?N1dsSGZBcjd1SlpTekE2bTJZa1hBMndXSzZKNk9Qc2tudmJrS0FBZU0wc01Z?=
 =?utf-8?B?WXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbb9e15b-dd60-4a85-cdfe-08dd02442f59
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2024 11:30:03.1695
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VjktBQWkiLJ/r88dJ/F6HkKRPlVg8V0p61etqeNGGd+pi0lgYjzqAgEfKmwDK2SVyVIsmPj4BcuYFjOHyvp0zFdb9/iN32RguOQmR7Y4xNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11063

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDbGF1
ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiAxMSBOb3ZlbWJl
ciAyMDI0IDExOjIwDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMjQvMjVdIGFybTY0OiBkdHM6
IHJlbmVzYXM6IHJ6ZzNzLXNtYXJjOiBFbmFibGUgU1NJMw0KPiANCj4gSGksIEJpanUsDQo+IA0K
PiBPbiAxMC4xMS4yMDI0IDEwOjU0LCBCaWp1IERhcyB3cm90ZToNCj4gPiBIaSBDbGF1ZGl1LA0K
PiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgcGF0Y2guDQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBDbGF1ZGl1IDxjbGF1ZGl1LmJlem5lYUB0dXhv
bi5kZXY+DQo+ID4+IFNlbnQ6IDA4IE5vdmVtYmVyIDIwMjQgMTA6NTANCj4gPj4gU3ViamVjdDog
W1BBVENIIHYyIDI0LzI1XSBhcm02NDogZHRzOiByZW5lc2FzOiByemczcy1zbWFyYzogRW5hYmxl
DQo+ID4+IFNTSTMNCj4gPj4NCj4gPj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6
bmVhLnVqQGJwLnJlbmVzYXMuY29tPg0KPiA+Pg0KPiA+PiBFbmFibGUgU1NJMy4NCj4gPj4NCj4g
Pj4gU2lnbmVkLW9mZi1ieTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJl
bmVzYXMuY29tPg0KPiA+PiAtLS0NCj4gPj4NCj4gPj4gQ2hhbmdlcyBpbiB2MjoNCj4gPj4gLSBu
b25lDQo+ID4+DQo+ID4+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnM3Mtc21hcmMu
ZHRzaSB8IDI2DQo+ID4+ICsrKysrKysrKysrKysrKysrKysrDQo+ID4+ICAxIGZpbGUgY2hhbmdl
ZCwgMjYgaW5zZXJ0aW9ucygrKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9i
b290L2R0cy9yZW5lc2FzL3J6ZzNzLXNtYXJjLmR0c2kNCj4gPj4gYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL3JlbmVzYXMvcnpnM3MtDQo+ID4+IHNtYXJjLmR0c2kNCj4gPj4gaW5kZXggNGFhOTk4MTRi
ODA4Li42ZGQ0MzllNjhiZDQgMTAwNjQ0DQo+ID4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
cmVuZXNhcy9yemczcy1zbWFyYy5kdHNpDQo+ID4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
cmVuZXNhcy9yemczcy1zbWFyYy5kdHNpDQo+ID4+IEBAIC02NCw2ICs2NCwxMSBAQCB2Y2NxX3Nk
aGkxOiByZWd1bGF0b3ItdmNjcS1zZGhpMSB7DQo+ID4+ICAJfTsNCj4gPj4gIH07DQo+ID4+DQo+
ID4NCj4gPiAmYXVkaW9fY2xrMSB7DQo+ID4gICAgICAgIGFzc2lnbmVkLWNsb2NrcyA9IDwmdmVy
c2EzIHh4PjsNCj4gPiAgICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDExMjg5NjAwPjsNCj4gPiB9
Ow0KPiANCj4gYXVkaW9fY2xrMSBub2RlIGlzIGluIHRoZSBSWi9HM1MgZHRzaSB0byBrZWVwIHRo
ZSBjb21waWxhdGlvbiBoYXBweS4NCj4gDQo+IEZvciB0aGlzIGJvYXJkIHRoZSBhdWRpbyBjbG9j
azEgZm9yIHRoZSBTU0kgMyBpcyBmcm9tIDwmdmVyc2EzIDI+Lg0KPiANCj4gSWYgd2UgZmlsbCBp
biB0aGUgYXVkaW9fY2xrMSBoZXJlIGl0IHdpbGwgYmUgdXNlbGVzcywgdGhlcmUgd2lsbCBiZSBu
byBjb25zdW1lcnMgZm9yIGl0IGFuZCBpdCBpcyBub3QNCj4gYXZhaWxhYmxlIG9uIGJvYXJkLg0K
DQpBcyBwZXIgU1NJIElQIG5lZWRzIGV4dGVybmFsIGNsa3MgQVVESU9fQ0xLMSBhbmQgQVVESU9f
Q0xLMi4gDQoNCkFVRElPX0NMSzEgaXMgcHJvdmlkZWQgYnkgdmVyc2EzIGdlbmVyYXRvciBhbmQN
CkFVRElPX0NMSzIgaXMgcHJvdmlkZWQgYnkgQ3J5c3RhbC4NCg0KQ3VycmVudGx5IEFVRElPX0NM
SzIgaXQgcmVwb3J0cyBhIGZyZXF1ZW5jeSBvZiAxMjI4ODAwMCB3aGljaCBpcyBhIG11bHRpcGxl
IG9mIDQ4a0h6DQp3aGVyZWFzIGZvciBBVURJT19DTEsxLCBpdCByZXBvcnRzIGEgZnJlcXVlbmN5
IG9mIDAuIEJ5IGRlZmluaW5nIHRoZSBub2RlLCBpdCB3aWxsIHJlcG9ydCBhcyB0aGUgdmFsdWUg
YXMNCjExMjg5NjAwIHdoaWNoIGlzIGEgbXVsdGlwbGUgb2YgNDQuMWtIWi4NCg0KRnJvbSB0aGUg
c2NoZW1hdGljIHdlIGtub3cgdGhhdCB2ZXJzYSAzIGlzIHByb3ZpZGluZyB0aGlzIGNsb2NrIGFu
ZCB0aGUgYXVkaW9fY2xrMSBoYXMNCmEgZnJlcXVlbmN5IG9mICIxMTI4OTYwMCIuDQoNCkNoZWVy
cywNCkJpanUNCg0KDQo+IA0KPiBUaGFuayB5b3UsDQo+IENsYXVkaXUgQmV6bmVhDQo+IA0KPiA+
DQo+ID4gTWF5YmUgYWRkIGF1ZGlvX2NsazEsIHNvIHRoYXQgaXQgZGVzY3JpYmVkIHByb3Blcmx5
IGluIGNsb2NrIHRyZWU/Pw0KPiA+DQo+ID4gQ2hlZXJzLA0KPiA+IEJpanUNCj4gPg0KPiA+PiAr
JmF1ZGlvX2NsazIgew0KPiA+PiArCWNsb2NrLWZyZXF1ZW5jeSA9IDwxMjI4ODAwMD47DQo+ID4+
ICsJc3RhdHVzID0gIm9rYXkiOw0KPiA+PiArfTsNCj4gPj4gKw0KPiA+PiAgJmkyYzAgew0KPiA+
PiAgCXN0YXR1cyA9ICJva2F5IjsNCj4gPj4NCj4gPj4gQEAgLTk0LDYgKzk5LDExIEBAIGRhNzIx
MjogY29kZWNAMWEgeyAgfTsNCj4gPj4NCj4gPj4gICZwaW5jdHJsIHsNCj4gPj4gKwlhdWRpb19j
bG9ja19waW5zOiBhdWRpby1jbG9jayB7DQo+ID4+ICsJCXBpbnMgPSAiQVVESU9fQ0xLMSIsICJB
VURJT19DTEsyIjsNCj4gPj4gKwkJaW5wdXQtZW5hYmxlOw0KPiA+PiArCX07DQo+ID4+ICsNCj4g
Pj4gIAlrZXktMS1ncGlvLWhvZyB7DQo+ID4+ICAJCWdwaW8taG9nOw0KPiA+PiAgCQlncGlvcyA9
IDxSWkcyTF9HUElPKDE4LCAwKSBHUElPX0FDVElWRV9MT1c+OyBAQCAtMTUxLDYgKzE2MSwxMyBA
QCBjZCB7DQo+ID4+ICAJCQlwaW5tdXggPSA8UlpHMkxfUE9SVF9QSU5NVVgoMCwgMiwgMSk+OyAv
KiBTRDFfQ0QgKi8NCj4gPj4gIAkJfTsNCj4gPj4gIAl9Ow0KPiA+PiArDQo+ID4+ICsJc3NpM19w
aW5zOiBzc2kzIHsNCj4gPj4gKwkJcGlubXV4ID0gPFJaRzJMX1BPUlRfUElOTVVYKDE4LCAyLCA4
KT4sIC8qIEJDSyAqLw0KPiA+PiArCQkJIDxSWkcyTF9QT1JUX1BJTk1VWCgxOCwgMywgOCk+LCAv
KiBSQ0sgKi8NCj4gPj4gKwkJCSA8UlpHMkxfUE9SVF9QSU5NVVgoMTgsIDQsIDgpPiwgLyogVFhE
ICovDQo+ID4+ICsJCQkgPFJaRzJMX1BPUlRfUElOTVVYKDE4LCA1LCA4KT47IC8qIFJYRCAqLw0K
PiA+PiArCX07DQo+ID4+ICB9Ow0KPiA+Pg0KPiA+PiAgJnNjaWYwIHsNCj4gPj4gQEAgLTE3MSwz
ICsxODgsMTIgQEAgJnNkaGkxIHsNCj4gPj4gIAltYXgtZnJlcXVlbmN5ID0gPDEyNTAwMDAwMD47
DQo+ID4+ICAJc3RhdHVzID0gIm9rYXkiOw0KPiA+PiAgfTsNCj4gPj4gKw0KPiA+PiArJnNzaTMg
ew0KPiA+PiArCWNsb2NrcyA9IDwmY3BnIENQR19NT0QgUjlBMDhHMDQ1X1NTSTNfUENMSzI+LA0K
PiA+PiArCQkgPCZjcGcgQ1BHX01PRCBSOUEwOEcwNDVfU1NJM19QQ0xLX1NGUj4sDQo+ID4+ICsJ
CSA8JnZlcnNhMyAyPiwgPCZhdWRpb19jbGsyPjsNCj4gPj4gKwlwaW5jdHJsLW5hbWVzID0gImRl
ZmF1bHQiOw0KPiA+PiArCXBpbmN0cmwtMCA9IDwmc3NpM19waW5zPiwgPCZhdWRpb19jbG9ja19w
aW5zPjsNCj4gPj4gKwlzdGF0dXMgPSAib2theSI7DQo+ID4+ICt9Ow0KPiA+PiAtLQ0KPiA+PiAy
LjM5LjINCj4gPg0K

