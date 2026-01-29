Return-Path: <linux-gpio+bounces-31314-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0B5oMFqie2nOGAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31314-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 19:09:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 646B5B3668
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 19:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A194E3016CA5
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 18:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84D7F356A1F;
	Thu, 29 Jan 2026 18:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZoTemHRi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010057.outbound.protection.outlook.com [52.101.228.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233132D46B3;
	Thu, 29 Jan 2026 18:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769710163; cv=fail; b=s2ATYzAGftJWjp8mLR5MYyeS8LHjGi8sdyE0pF9lGre01TrT+veks76VIPg2iyAz0Q5jkm4IsdmL4IgOtURFbBZRL1eCVZ2hod+RJx41nOzh5Mm+yexjnRRlGWyySt2/s7MFsdEYTXYHV98pJxJ7nyFu3WzN6+udiqNSkvKhy+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769710163; c=relaxed/simple;
	bh=j5M7f3m88qxsXyxa8mTNpay2FFp43VmUpro+Z36QYI8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R4sRJeIjlLzCTvCPsnxV8pYNzQjH9WWNBI5yUNcl30dhrYY0K33TEyMXTjJT+1wCcCptHKaehTTtvIsK8Z5p/Z4fhQWK3jrp5UWX/TUrSSXLUjj/EB7k2rJLhMoIlnJaSOhXLxsfAR0Za106qhMVSqKiJsxhfUBP3hDMCrmuSLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZoTemHRi; arc=fail smtp.client-ip=52.101.228.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llIDg+qlG6PA2amojdbZo9eFS1i2YxzcWcNctzTWaP21h8cveM+8xAxcpioCNUpgpJ6OGxMuL3Y+CrLqDnw+TyaiPsxsmnDjICVDLYkjdubZjvqnPWxZK6nDnOsL1k5pDpJsgApHaqPHRfZgMU/+lr6h5XFUMIzHq6inanIc2ldrAC9+HXJoMK21d6qCX7ffGtMtGS9DKA3++IkDjZhDi+DRD1p2JVACXbYdDAKjQ1cpjRlUfxSJKP8fRmbL+Z9P4j2H1jpMdZ5poM4z7fgUciIKHDcTCI0wlhvTb80kBvSQblUe9rFV7DiGPj80O9pxWih/duRZ3LUAhDGmla4Rtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xb2rBxbvZpqft1hIrSuoO6gzn9K+Lv/Z5crr4HC+2Mg=;
 b=JVAvAYbtVkbgHQkzzeuBH63CPrUmih9VxvmbMqqhKiX3nISyoPnSfky+u3cX1RC2SgJsRjhNxpbJ4BTUqziBRtVbTsuuzg5A+KMA81f7Uw9p3DXTpklf8A8hWst8MK4+nFwJlWjJS1Ku0/prShijF1idAxGNFB/NBdHZOzVTPmi1rTyouK12wt28DlacU6OrGkl8v3JOaTRwOSTDxQnaN4OtDHQXiL0uMCG1r2AsrO3RxAgGG63/9JJuqrOfNCH0SvcEvfaaNVCZx6iAj/n6MKW0ea3iTbTonq5hO8QR8CLd13s3QCJl4Lhyb/s8xgfM3ofujCG2pAjmm12MGdGV4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xb2rBxbvZpqft1hIrSuoO6gzn9K+Lv/Z5crr4HC+2Mg=;
 b=ZoTemHRiqAT2mk4agcWPq676p38zcRTkbchnYDZ8e1XFczRmS3wedk3qUxH8Wp2NV/avApE9G+rarxNO7F1EnPjJiSBXHOsixWk4m2UgU3hcrDczJuUv/yEiRXL6EUiUDl2VS5Kk12Xuoi3qknaZ8K+20lFqkItuq8uz2gr9Efo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB8529.jpnprd01.prod.outlook.com (2603:1096:604:18a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 18:09:16 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9564.010; Thu, 29 Jan 2026
 18:09:16 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Conor Dooley <conor@kernel.org>
CC: biju.das.au <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Linus Walleij <linusw@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, magnus.damm <magnus.damm@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH RESEND 1/9] dt-bindings: pinctrl: renesas: Document
 reset-names
Thread-Topic: [PATCH RESEND 1/9] dt-bindings: pinctrl: renesas: Document
 reset-names
Thread-Index: AQHckQhl2WiS89m9YE2u3b4jm6jmu7VpaquAgAAAcTCAAAEWgIAAADYAgAAGC0A=
Date: Thu, 29 Jan 2026 18:09:16 +0000
Message-ID:
 <TY3PR01MB11346221862DCD11BB6D6FFA0869EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
 <e70c010cb8c599d342807af146bd5c2a6d6cb4c5.1769681553.git.biju.das.jz@bp.renesas.com>
 <20260129-skyline-romp-e81f8ec9ae1f@spud>
 <TY3PR01MB11346C5187C5A0A3745B6F870869EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20260129-snort-maroon-c0478598c227@spud>
 <20260129-cherub-prenatal-7882029a9027@spud>
In-Reply-To: <20260129-cherub-prenatal-7882029a9027@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB8529:EE_
x-ms-office365-filtering-correlation-id: 3b4b39f2-1dc5-49b8-b5f1-08de5f61842e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?gJYcQOmM8kH2MLwfiqcnGzaYa5+CT7WViTVIQVHYGlfx43NmQorx5CD/2Z3W?=
 =?us-ascii?Q?ZIQaNXKKD2se/afFspeiy7UH4z7Op4gjFXNDxk1pOIDSYQc4kLm0MCWR5oK5?=
 =?us-ascii?Q?SqtfqO3pO1LPFpuP26sHg4XsExTlEIcJpJcrjPrsr1C/bDYnEanx/7v2FD9N?=
 =?us-ascii?Q?TCmb6xDjD8UgEL4ahiigRhvZLVyJE1Rvw9Yne8Q6p6f4d+rmbwxsppyBNVP4?=
 =?us-ascii?Q?Vsh3ZmypB+XyVh/tKRTl/4YlWBNgRcxpmY6URbChYsbOvllbHK4VzdJCfJ3F?=
 =?us-ascii?Q?iVfx2boKIcadaFFKmwFSzM5tU7whd1znr+WVWBdQwT5WoMR40jOJTi+hKzo+?=
 =?us-ascii?Q?k5duCagioDxtzAfpnhvd9wdVqj5hivjLZZfIY9K2k+sOZ4ZFdS054XbthUgT?=
 =?us-ascii?Q?mnBn5gkXOChosX45rk0J53uLKFnY4PMtSgevuW3TcvtgQEbDWlnEd+R5LC1N?=
 =?us-ascii?Q?BZ4jAEjf/REPVxhbj9jqYVW3D8UsRQ7otAfmMY6JzCpcT1ffSmJl3yim74gG?=
 =?us-ascii?Q?gEUNBlSkJ8vnLYt/CXctGZ+igyCDjNQ23jOkSSti0rgqj+zo9ydWx7/XZlpU?=
 =?us-ascii?Q?M+lUaTW5Y6VaSpX0szyQP6Y6hs5X/qEgkXZ4c2lKjPYo/11DPYhZYZkHe+fi?=
 =?us-ascii?Q?B6+VjZE+o+dL/xHCq3SxD70BFpt0/U139nEUaLb2Ksj3fVbMMPRyeVeqKXC3?=
 =?us-ascii?Q?xgbvrZ84Kk26lmutmtMzvrto7FlQJZ1B/u5968a9Utyxg2raeDpk7Zt+G4wl?=
 =?us-ascii?Q?V5jilHgPDiN6qNFJKoNdpeGzHSMnA4HNCZMkyK+rj35pJ4+BG1BmkOo768YO?=
 =?us-ascii?Q?pYEBdsJe+HlWb+S4HVl3BgTQQ6NyIydKwHHfKiC6qsEj4DMeO/WCISO4nYdZ?=
 =?us-ascii?Q?kThhO2RcaumIvkNPHH8s8KpJWB3BZsYyPiBoCGdwzJL3k7v2VeA3QgufsnrB?=
 =?us-ascii?Q?hStm0cETbydyyjZznBEnAGCQvNJ7u0RJnmLsU2oqOhNJq6zPdhMOa5R8U7Wn?=
 =?us-ascii?Q?xfWx3EO4EP5BQN8ybbtqIYYmGiDQ9tyb6x5WpFXqwpsySV22wtFgj2JY8yK4?=
 =?us-ascii?Q?ziAok9kFT/Uy2uxES8OK/gH6R1A3320BWPftjSBFgB9DeWXquuc7E0XmBBef?=
 =?us-ascii?Q?H38GWSZ8jVybVSMhMlzC12d9tgV6aPjhiuhhHZVYTnLJu5c07Dcdd1IqC3iq?=
 =?us-ascii?Q?SCEi7np9oMyPJGSC1vj1DRVXfZKn09IKiOeuHCCggbGeB0DPDXZpAFFWt3wl?=
 =?us-ascii?Q?yw097tHaE0zt28im0n/mp9xZYqYulKZAvzQ0KjRffqEeBwEZ0s6wNzhCv7rr?=
 =?us-ascii?Q?ZMdeMWtgxrZT9Co8n9x8RZFmYsv8ykKqhH7JEg6UoI18S29PFdT9gs3COCuY?=
 =?us-ascii?Q?PgbuW4EWKpvWq1ju052/Hzc9wbm2u7v9fFcQii79lvSWCQ9fnS3r06M+wHyL?=
 =?us-ascii?Q?sUcP7JhCGq95MQqIaKPwrZ4I2UkI1Yb3lnmMjGkzL+r12tyKDAmOxOvTEDb3?=
 =?us-ascii?Q?czaM4HbyYXH1lmR2lg/tR4jt5SugmuShroFxd0j/2eOOwxlLzh6YCV5VJ57Y?=
 =?us-ascii?Q?kUUqlAlUGfxBs9envpIBPtdODoEC7bDGhBi4T76KKNV5omZciFWItvDYEAwS?=
 =?us-ascii?Q?jH4OLEj6IIVsSoQThmuznLc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?M6TaTI349pYHznzjs1ql+iDNF1MbygSgYJ0NAfC5mgelb55jUsyNflUyKnzf?=
 =?us-ascii?Q?/BlHrBUE4yu2PqxXf76O5RNtgOQ/Rx85EyIMm6QjA1w6yG745xRs39MFoizM?=
 =?us-ascii?Q?CudKTW9NCt5ND7tBc4TeEh1riLh6WsBSzLQWfa7Ry1osFrCzokDtaYw9MhZm?=
 =?us-ascii?Q?FO0LNE5Qn1XBGPJCHyJfQ4LxuxMExzHwtxJFeq1loZeyco0hHkk2E/JFcdZL?=
 =?us-ascii?Q?CqXP3oOuzb6bGcyLnuyUfLd4vciJzdKs7PNrX2WOPLJPOXk9SM+tbSr9tQtD?=
 =?us-ascii?Q?iT1y17E78eY8tA/LsTZZKujsAlj+dFM+cb08EyTLaYXama93k/DG9bdowslg?=
 =?us-ascii?Q?9VIM248vScj499QoAWvKIFpf5ZgscPBDaTRwa4VYzByOCnJWEOrLXR5Ch5W9?=
 =?us-ascii?Q?UYhhNoc5M5thgZd6SqTX3MO9qKeYRstf94Yp6UsZvQ/05l/QcxoEShDoaJq4?=
 =?us-ascii?Q?IexlBw3QzLny4aBR1cgPx/W4olLyNciUq/oqphC5dZoxM41+7fDTvoGx1Oob?=
 =?us-ascii?Q?Z5uVvyBAMW1jCmn396sQroWbZX8e7AOb9AMOhtC5dXGwdxYLXTMAfizEPC2k?=
 =?us-ascii?Q?lBwx6NupG8Mk8coqteSK9GYSrDD1vQeXMnH2tcmAX5pli/AsgXK5ZNeOk92L?=
 =?us-ascii?Q?rz01O4VpheZPxUzqXB9X2ymkmMwFvcvKzBSbMMJePvQdoicBZvOnifFAUAVN?=
 =?us-ascii?Q?d7icjfztm01gajLFvXdx7f0xNTFBRSO0GFRXRB51omn96Yu84hc0XFnhyA9p?=
 =?us-ascii?Q?Oh8iMPM6CBVie7/UtFtcNxmulB6i+NAOwHGXORunGQZsA1tSYkDWc6qA9LIL?=
 =?us-ascii?Q?YdpxiH/61oEu3aoDDwGpOyNiz0GGWPVA1asy34sOD+EmcBoTIqVYsBNUVp6s?=
 =?us-ascii?Q?2CX/f07usXiqGjsoxSFvv29EGnTnH8q+ZhowQuwWyzL3yFHSoezRQ06fECYp?=
 =?us-ascii?Q?CnL5J3WxJdKMa9oTdtp0Bw9tKEimKYmrXwgYTiDmQFeXHXBbixkgnO8E9SXg?=
 =?us-ascii?Q?r2SSr8ZDYX8vl0ekKX/SRVopSREN/uHxeud/8FJmPGpwvt5nfYMip5Eck9iy?=
 =?us-ascii?Q?b/EcGxUzvVdQOJSkixE7l+QpGQPDQGxa2v68i6g7ONkEUb1j/ozbwomNYfLC?=
 =?us-ascii?Q?l81J4/KgufHQ4MQoBaSEN26fZ+DONTdoej03yNtMdrnoJNIE+J09WhELHNlR?=
 =?us-ascii?Q?VjcA4jBvTiIXf8hkoomLf7AZq7kOhBEGU2s0ADsuqVo9VkE6h+DdMxrDT0S4?=
 =?us-ascii?Q?mST72oDsO9q4xyDztZGq/jpE1kXcrTyrcHTeckScdBC4yGCjo0JR/PtaGXlc?=
 =?us-ascii?Q?qoDx9/jvxixz8I2xDQJ3sG3LVk/tugMGJwPxrGHANQ4clmd64TlQ3V/3bzLS?=
 =?us-ascii?Q?Q71mjJej1cqrkplWw884bKFqEIVWqPKx7UAgaNpdScUWenuSdtpMhIpS1Xi1?=
 =?us-ascii?Q?5k/3OJlKBV6Pkun0RsE0qf+zCkB6TFtaJYPROGz1J3QwLAlYmA+4ZmAz6jp+?=
 =?us-ascii?Q?NaE0uzhhAuTP7DtgrG/Th2JEa8iYTs80gt8v7wKtxZ3P6ua1OOHiMMgIvucj?=
 =?us-ascii?Q?ZZTr/JlkH48llcpkATJ+Vnk/8pOhC4J4OmQ5EptzqPXmieFKf6B/raaDQIiX?=
 =?us-ascii?Q?BYV97MtcsbhhqQjZAm7apwIuiZ64Etp+5nV8xUXDtUsMeZ9UX/cOCmoickLu?=
 =?us-ascii?Q?Ja2mmwPV1f/j9v/P9ogvOnJhbyercOK1IV0DZcoD90Nf4pPLNqeRyJKw/V+0?=
 =?us-ascii?Q?A5nS2EoygQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4b39f2-1dc5-49b8-b5f1-08de5f61842e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 18:09:16.6875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YaIM9W7btu3MPVjeVmA5wytaGW5L0PlHD8CtujDFfwaXY2TOIFdei25m2es3Uqg6i9iyKM9DwN1wLYKQJgmMAvMev4wa40Wp4EbY2K4MUzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8529
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31314-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,glider.be,kernel.org,baylibre.com,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,microchip.com:email]
X-Rspamd-Queue-Id: 646B5B3668
X-Rspamd-Action: no action

Hi Conor,

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: 29 January 2026 17:47
> Subject: Re: [PATCH RESEND 1/9] dt-bindings: pinctrl: renesas: Document r=
eset-names
>=20
> On Thu, Jan 29, 2026 at 05:46:01PM +0000, Conor Dooley wrote:
> > On Thu, Jan 29, 2026 at 05:43:09PM +0000, Biju Das wrote:
> > > Hi Conor,
> > >
> > > Thanks for the feedback.
> > >
> > > > -----Original Message-----
> > > > From: Conor Dooley <conor@kernel.org>
> > > > Sent: 29 January 2026 17:41
> > > > Subject: Re: [PATCH RESEND 1/9] dt-bindings: pinctrl: renesas:
> > > > Document reset-names
> > > >
> > > > On Thu, Jan 29, 2026 at 10:16:36AM +0000, Biju wrote:
> > > > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > > >
> > > > > All SoCs has multiple resets. Document reset-names property.
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > ---
> > > > >  .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml   | 15 +++++++++=
++++++
> > > > >  arch/arm64/boot/dts/renesas/r9a07g043.dtsi        |  1 +
> > > > >  arch/arm64/boot/dts/renesas/r9a07g044.dtsi        |  1 +
> > > > >  arch/arm64/boot/dts/renesas/r9a07g054.dtsi        |  1 +
> > > > >  arch/arm64/boot/dts/renesas/r9a08g045.dtsi        |  1 +
> > > > >  arch/arm64/boot/dts/renesas/r9a09g047.dtsi        |  1 +
> > > > >  arch/arm64/boot/dts/renesas/r9a09g056.dtsi        |  1 +
> > > > >  arch/arm64/boot/dts/renesas/r9a09g057.dtsi        |  1 +
> > > > >  8 files changed, 22 insertions(+)
> > > > >
> > > > > diff --git
> > > > > a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctr
> > > > > l.yaml
> > > > b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.
> > > > yaml
> > > > > index 00c05243b9a4..fbbba53cde9b 100644
> > > > > ---
> > > > > a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctr
> > > > > l.yaml
> > > > > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pi
> > > > > +++ nctrl.yaml
> > > > > @@ -78,6 +78,16 @@ properties:
> > > > >            - description: PFC main reset
> > > > >            - description: Reset for the control register related
> > > > > to WDTUDFCA and WDTUDFFCM pins
> > > > >
> > > > > +  reset-names:
> > > > > +    oneOf:
> > > > > +      - items:
> > > > > +          - const: rstn
> > > > > +          - const: port
> > > > > +          - const: spare
> > > > > +      - items:
> > > > > +          - const: main
> > > > > +          - const: error
> > > > > +
> > > > >  additionalProperties:
> > > > >    anyOf:
> > > > >      - type: object
> > > > > @@ -152,10 +162,14 @@ allOf:
> > > > >        properties:
> > > > >          resets:
> > > > >            maxItems: 2
> > > > > +        reset-names:
> > > > > +          maxItems: 2
> > > > >      else:
> > > > >        properties:
> > > > >          resets:
> > > > >            minItems: 3
> > > > > +        reset-names:
> > > > > +          maxItems: 3
> > > >
> > > > This is minItems, no?
> > >
> > > Oops, Will fix it in next version.
> >
> > w/ minItems
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Actually, can you remove the dtsi changes from the binding patch? I forgo=
t they were in here.

OK, I will make it separate in next version

Cheers,
Biju

