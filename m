Return-Path: <linux-gpio+bounces-31311-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGihF76ce2nOGAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31311-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 18:45:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D21B32C6
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 18:45:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E252C30097E5
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 17:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C9E3542FC;
	Thu, 29 Jan 2026 17:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="S1PuVvco"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010039.outbound.protection.outlook.com [52.101.229.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B0533E35F;
	Thu, 29 Jan 2026 17:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769708600; cv=fail; b=MHWbYtq+tGpRktxQDfi5ksKihA+qt/Q9FYMOdWeCRWaRRh1GfwwQgugBcqRG+4KZz3Rjj7tQ8ENFe9XcHm80jsSCjp6UE6U0Uw0Od3eQGdeKt9lKSEcV80yQ7BvyrcYXi9skqknszHTx4y8WeicUMmEVhNbGwQQsxpgNDL09Epk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769708600; c=relaxed/simple;
	bh=vNNmCDcoGYShk1WzPUdhNJpLDaZpXeEkSi+B/lFJvVA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bTo/l81T+LPKcxEwS5ZrTmDsAFG562H5IDeekT+it2dX5DQirbslR7ny78jTwPrK21DvEOftpaUb1b6FygPJibIPi4xMyJXoYTVlyzPWnt41X5m+sxq/je8e4Ldftn1B/vGrA213gKx88McRmerGQuA1v6zetqudOWxDz4Xxqro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=S1PuVvco; arc=fail smtp.client-ip=52.101.229.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RMLi5hEhMSMXp9ZvfHQAJ/u9dmKH0ByQNXYCZWciU4LGdKEvXV/rl8jVPtX6ySaI0LjwL74GxBIelHIjkBFwCs/4LjprDHOHLrVJAqTnlefnDJg09ene0NqohCz8yVAqYtS90t/2Jn3fuh8cGNWis4M1pOZlUM3lqc3Cej9OyhADOioaBrXRmBQxBV2/Usheojic0SGLOCLpv/h+8EBtdjJ6vY8y22hLr9NHQc+R19Y8iGUUYf95fDmq4+gMEmGNXu3Gq/w7KVCMq4IP9nAFZmVGm8neUIFLaayiqPwwyBn9u9Q5bfh4/b4/fEbTeRudLU4bYiXEuqGFp6qviwjO6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9d3Hr22qkRmfU4XOQR06c8vh9GNrY1Luc7bShpiQkO0=;
 b=uz/Lr7cQve2Xm+AZUpqMPxyOOBdlMrf5rCPkcBVzHEm3QqCdBUCxXXJf6GnC31QfoOrLkIcyNKvOA+FZr8JEHS2WTvTlXK6hM3xb10CgC83hlb3fPi35tMUlAvwHKEG7p+ZpJNdPeKrblcAwf2hBLoR800mpG5LXFxzue1ei74VaV6yiH2y6dQ/EejY2EGijaE2wGWApD/Ltfv35aRMjLNKGNJ03YsNfT+X7KqimCU+6+1Zc/EUle+kgcnSELd/zp155VXXRW4/YvpOWtb3lPUYC6+PTpJFA1lCmfXAyB4qh2to0X30wShuwJDiFKbK2uLDfpiMwKZ66KFE94T34XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9d3Hr22qkRmfU4XOQR06c8vh9GNrY1Luc7bShpiQkO0=;
 b=S1PuVvcon4itcK+A1EEeib6kfWfsu1Bw5kH78s8mG5GdqXSYu04mUmAJWXtK+pYL4xpvItTnAXROcCIqCvnb7/aZmUtkpkXHeqn2ah+cKx97+uzZWkAQ2/T0ELJVb5hmgOgvP90rc2jd7Y/clAJghfJNn29Mn1DtZHyS+a+ZCRc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB15166.jpnprd01.prod.outlook.com (2603:1096:405:1a2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Thu, 29 Jan
 2026 17:43:13 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9564.010; Thu, 29 Jan 2026
 17:43:09 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Conor Dooley <conor@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij
	<linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, magnus.damm
	<magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH RESEND 1/9] dt-bindings: pinctrl: renesas: Document
 reset-names
Thread-Topic: [PATCH RESEND 1/9] dt-bindings: pinctrl: renesas: Document
 reset-names
Thread-Index: AQHckQhl2WiS89m9YE2u3b4jm6jmu7VpaquAgAAAcTA=
Date: Thu, 29 Jan 2026 17:43:09 +0000
Message-ID:
 <TY3PR01MB11346C5187C5A0A3745B6F870869EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
 <e70c010cb8c599d342807af146bd5c2a6d6cb4c5.1769681553.git.biju.das.jz@bp.renesas.com>
 <20260129-skyline-romp-e81f8ec9ae1f@spud>
In-Reply-To: <20260129-skyline-romp-e81f8ec9ae1f@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB15166:EE_
x-ms-office365-filtering-correlation-id: 29255fa5-5dcd-480e-61bb-08de5f5dddcf
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?oaqm/U/W58pQXc5gRmciOv1TKtQqExL7lZmPO2pAXLdkNCz4/zlSyYbcDk88?=
 =?us-ascii?Q?DRxzRVAKk2BEA9yi9mSdZEn9JecegjfG35uJxe1vYDRuK9FflR3FBpZQTHjp?=
 =?us-ascii?Q?5l0BXsAM632DT5EWbe4T+J0Ofe4e5f2PwfMSVc9pJRYczsDIW0UPpgtV6RVD?=
 =?us-ascii?Q?7saNmnhxqPuZ+hBrtiAhZtI6YqszqbjBvPWGfJxnAuxjttR4LeMgOT5eFjdO?=
 =?us-ascii?Q?yBwAfm0vg/ZmxdQshCgOQEAK+fx3swoJip1uJ0+HVzP/3PGqiu27jwwLQyMk?=
 =?us-ascii?Q?B2m2Nz7fnDB0tlwyokhFzc5+VGD9YyjKB46bfEjzeMctmpDPdmS6EjXjdd2D?=
 =?us-ascii?Q?0YyaSEdZ2sMqkPNrW+OP5vTEVBe4ggHv+p+HEYStNfdbL3aqigj3mgCUB0Tg?=
 =?us-ascii?Q?3iaWksKKqWykWw/V+MwPrR1X2aYybMe3vr87KojsOpxKqwk1q41dhhuqAiZV?=
 =?us-ascii?Q?EHP5doMuyckXOgaeqO6GQgaqeyiU2V6U4ueKcVIv3ZClNt3B8ieCP1rtxypx?=
 =?us-ascii?Q?i598wla9+1BqgrSEmjTdU+TX8Dc2+we8xZVsZ05xtiFGzg+Q5aCGFDVkLqHN?=
 =?us-ascii?Q?AKSETiP3dfDzEhugEW/GX0p5UZfEXypkdMRgm2F1K5oMn7/tMB2djBVYl2oh?=
 =?us-ascii?Q?ERrG8irFGY2x2kUoJq6kpZVYw8JujrUAv0vpvfxTRxtd+pFHXxu/wVP1PNn+?=
 =?us-ascii?Q?L5D8CYvYMNb/PQx+288uBsFd+uUjVF+BhRrEHHFJsEBVel+49bfwXDUy9L95?=
 =?us-ascii?Q?0yx2qW5X4G662oqLjZP04punj7W7AIaxW0qboTUNxC2zeQCzxm83pW1BEQAB?=
 =?us-ascii?Q?+kyetjkAJ4D64Ptf6F/RVrpcB2E1W0+MGju3TkGrfHo+R/ZPV3aUCJmINmj8?=
 =?us-ascii?Q?YKdv6HIQWhcMc4p1auwi3JBeMDut4wVfGaw8e1zO2wLwQnlA7zbRizx0vTZK?=
 =?us-ascii?Q?p++5+bNYe1wYk2lVRJsFPdNwSM48BfMWFu1wLWTERbUL+ppTGLBaVciqK30d?=
 =?us-ascii?Q?6IIh59TxRM7dXSjyoqyqaoELjpSMyRnt7EpFaV1evSKWpbXDWaUMDFJPwr3F?=
 =?us-ascii?Q?/ePGiiwj2QJISuWpn9PMv6PuyJr3uQNWC+HqjpAff+gQuGHHIfMCyzIhaRqQ?=
 =?us-ascii?Q?9r4k9f2Xvmt9yy1khpnXWfzw6bvhu9lld+NpeSE70Wd2njomGMgi6nfDRbTB?=
 =?us-ascii?Q?XS+6oIYx1LmFeIwcjwRY5J5DKuNbMQWEn6PJYYXEfjPrwy4899RWOESRvpGv?=
 =?us-ascii?Q?z+cD9PAl3Fxks6fNG/6c4dy9qHxtn9KgWbOmqE2AY/Oid9UiNHwttIFyU8s2?=
 =?us-ascii?Q?JD2u/Cfl2M3GU1AKhkQufLT0PCu/Fd2mMfw0RWHcFYGxxv6J8/OFdonKJmEc?=
 =?us-ascii?Q?nmfSoj8XoD+nuiaTMHpHZPx7PSz9wc9q33YUXsH1BKOvh9ChT1LDG5UIfodC?=
 =?us-ascii?Q?0mQSQp0oiddgQYChDyQAlT0yr9pkiCeCksmJ2gvJ63D7Qk5mZTwlbZa6l3pM?=
 =?us-ascii?Q?EDr0QApL9VV2RI/3CJHjvxJWscxVkapLM+/jOD3fLiNVRjXNNNcICsxysapV?=
 =?us-ascii?Q?RQAlDKGSjFzgMObD+xKzaSfcNY5jWiiT55FaKwNZPf2yh6qjy9iJMzBecpbm?=
 =?us-ascii?Q?IoCSKqYSc4kEESnjPO4cLQA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JBj1Mco4OtG3G5RQv6a3eDVR7ZppztkqerdO66CqvLIcFzGeSZd1HAJ7a1vO?=
 =?us-ascii?Q?0fmPNm8gHQZ14RzwwiOM1na6zk5x/its0bUsEUHoQPI7ARBXFusUTYMHFtXv?=
 =?us-ascii?Q?NLjd0Qtj8+5vf5eFJXC5slDJxjL4M2stXmXz6xO7GL4nN+5RhFhX9eikOdjY?=
 =?us-ascii?Q?LAVaEeRpnDkMKeNLgiJ70iUqVE92nytMcX2MDtK3LiZuIbBaVr8kn7avKG57?=
 =?us-ascii?Q?rkPVXV32Ec+5wgPayeEiWT+YyCqGYuQbYgKmg/n5kY/b+z1Fp2Ig2EhIULeA?=
 =?us-ascii?Q?uVfN0OaRDSn9K83fl9FlRjS29mv3si+spLn7Icc49iUjDo2VXMRIbhiHWk0Q?=
 =?us-ascii?Q?7eN80lxrkK+cYm3l9C/mGdm8476L8YXH2MhWjMTqOKVOGBIiFmn5dHvwCpH6?=
 =?us-ascii?Q?YaBnPS7qh1tQMQJufY1sQA+bt/kQyThTlE7Imvo5CkssHC8mRHK89gkK2AGk?=
 =?us-ascii?Q?JOAk/rkJj7IgJ80bGBySeiwtbrdDzP8TBT8s64cSc9nuDkxHhRt5tQK782kP?=
 =?us-ascii?Q?7WryN6bOZfFrkmmmNmWpnkpdtxfEOPdRCuxHZsS7aHyMLrQxlgg/kYQgZuh0?=
 =?us-ascii?Q?96qM53kAk/86R4RgXQyTkpoXg8ohMrM1l2IYnN33eYPYSIvtLRhlw4qpJQL6?=
 =?us-ascii?Q?/Ualpxx/s/QGA/vIXJoRG6tp7QcTuwq7PB13EU2p6t5BU8+P7QAODycAtlUL?=
 =?us-ascii?Q?iTaTrChCYEgc3tShwEQwmFyw7EEL0f9XgGjRxVahYmq1RX86GcruLSv3PTXG?=
 =?us-ascii?Q?IWq7anVMR8dGqGgjxPAKICLN2covk+sT+socANImlla8aMq5dZpn7iM2Em8R?=
 =?us-ascii?Q?Ym3FUGJ/35r1emAbnt08kEsVauro8EcEbrz9X71FaadVNCcRtLuX6c1Gv7hC?=
 =?us-ascii?Q?1Fdpy80D9qASWe4erYQYoFwQin1XzOH0LROidK+p2SkxtNaBfs6hjE4PJEOc?=
 =?us-ascii?Q?MsbnXtaBa8uprVuR0vZWnEGTCheFdf7x0o+ElKLS+hoL5snYkDXstSGpa7P5?=
 =?us-ascii?Q?vR9qJ9rTBGfAg3YWaaqkHStiYgMhVSpnt/+Dw0BQZmEwM3/X+PjvF7JzKlSW?=
 =?us-ascii?Q?mmyIOAJl051o83cXiLMoMtcKQU4NQKxgKfd66f7oFgERqdrxslhe1eLVPnmB?=
 =?us-ascii?Q?dbu4/DbWjWRxtDHRXHmGq0faWgqonDfPl/VrsHZsgC0pAIeb4PbzoLB9t5l/?=
 =?us-ascii?Q?HgVoK1yMBarcmgkL3sHphVx8rcRgYsGumGi/pWfGbjMsZADXhPaYdlfrVehI?=
 =?us-ascii?Q?3xb9f8mIO1eCn6V23DpGysvYVsHBigMpy+wAz2nasYufeafEegUJy4PkKmaA?=
 =?us-ascii?Q?r3c/T1+P629WAgE6sQYkTn0IUp725HLq0CIztpow3Od8cx4Ctx+oIoE+gLzn?=
 =?us-ascii?Q?sosJuR00if9SZkcbuIsjiCoZN6C7kpElakQTfOEpPH6/d0mdzDiDKiqM7AC9?=
 =?us-ascii?Q?s3tf1/Ij4zY7uyglMsOx2eVpYnfBKMYxAVr0oCEeesgk9Y+NnM7e7k7+Hlbs?=
 =?us-ascii?Q?HdswL9U/dcOc587j+zM6Hkzh5StXGBL5krxAOjexYcxJ/VS5WQwMn8lzxO74?=
 =?us-ascii?Q?gb4y/ZguPKGHQW1P8o6yMMBRf34obzCYiv4OGcLQaGZNlZcvOkDlfgigizkn?=
 =?us-ascii?Q?CYgp6Z9vVNvMr9HjzsZL2vu83jhSHtuL9IgY2O9qdaWl6oJaVAVK4csHM2wK?=
 =?us-ascii?Q?KookUyZWyTU5XDgb39QW363uDlciDbLPclao4QgyGf++BE2isvz7fQd2aVpw?=
 =?us-ascii?Q?FKiSYsBYKg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 29255fa5-5dcd-480e-61bb-08de5f5dddcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 17:43:09.1067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: siuhcd5PkoaSE+ayq6vnMb2SpW8Z9HSMmSc+kbTKX8volCPOYw6TFnFesQ9PFOyNBPJW4sfwzh/sUGlm9xfGHiZI6e2O+k3mcOjA/R/W73I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB15166
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31311-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,glider.be,kernel.org,gmail.com,baylibre.com,bp.renesas.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 06D21B32C6
X-Rspamd-Action: no action

Hi Conor,

Thanks for the feedback.

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: 29 January 2026 17:41
> Subject: Re: [PATCH RESEND 1/9] dt-bindings: pinctrl: renesas: Document r=
eset-names
>=20
> On Thu, Jan 29, 2026 at 10:16:36AM +0000, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > All SoCs has multiple resets. Document reset-names property.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml   | 15 +++++++++++++++
> >  arch/arm64/boot/dts/renesas/r9a07g043.dtsi        |  1 +
> >  arch/arm64/boot/dts/renesas/r9a07g044.dtsi        |  1 +
> >  arch/arm64/boot/dts/renesas/r9a07g054.dtsi        |  1 +
> >  arch/arm64/boot/dts/renesas/r9a08g045.dtsi        |  1 +
> >  arch/arm64/boot/dts/renesas/r9a09g047.dtsi        |  1 +
> >  arch/arm64/boot/dts/renesas/r9a09g056.dtsi        |  1 +
> >  arch/arm64/boot/dts/renesas/r9a09g057.dtsi        |  1 +
> >  8 files changed, 22 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pi=
nctrl.yaml
> b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> > index 00c05243b9a4..fbbba53cde9b 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.y=
aml
> > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.y=
aml
> > @@ -78,6 +78,16 @@ properties:
> >            - description: PFC main reset
> >            - description: Reset for the control register related to WDT=
UDFCA and WDTUDFFCM pins
> >
> > +  reset-names:
> > +    oneOf:
> > +      - items:
> > +          - const: rstn
> > +          - const: port
> > +          - const: spare
> > +      - items:
> > +          - const: main
> > +          - const: error
> > +
> >  additionalProperties:
> >    anyOf:
> >      - type: object
> > @@ -152,10 +162,14 @@ allOf:
> >        properties:
> >          resets:
> >            maxItems: 2
> > +        reset-names:
> > +          maxItems: 2
> >      else:
> >        properties:
> >          resets:
> >            minItems: 3
> > +        reset-names:
> > +          maxItems: 3
>=20
> This is minItems, no?

Oops, Will fix it in next version.

Cheers,
Biju

