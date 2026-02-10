Return-Path: <linux-gpio+bounces-31569-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPEiAN5mi2kMUQAAu9opvQ
	(envelope-from <linux-gpio+bounces-31569-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 18:11:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE4411DA71
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 18:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1CE7C300B59D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 17:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77FBF385520;
	Tue, 10 Feb 2026 17:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Yz3RxF+2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013057.outbound.protection.outlook.com [40.107.159.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEDE3803F9;
	Tue, 10 Feb 2026 17:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770743515; cv=fail; b=TA+16sqiYutj29R4DAOVIw2Q/vbMjOVlnJqwwjJncHx/QrFU/2lbAzSxY8ZEZFOvaSXRFmy2xjT9Zp4Vofye890TSQgcNjSyVf5oCiN19DbA6z8yIZ6SruA732RBu/fadrSnfXpxX2CvUyvWeP4OHh5mBhaxC5y+7X2VtjAjaE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770743515; c=relaxed/simple;
	bh=7yG6b/euDXky4DHPxgHqyWV6fQHq9bSxTA1xMojCoZc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gdF41bAAmrpyt1JTzKKt0Eg7CKk4KikIEiNJ8l4J+kFJsUhkmtiL5rHhpzQNBu2M2nrJC9hr693FqsCN1ks9Hvlkh4OvNEkRwgv187tsqWczm8asc0jSs95d799FzZkQE1ZfMfCwNj3EoroPqyf6vx+Y1lYKWq4y6n28rO1kEQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Yz3RxF+2; arc=fail smtp.client-ip=40.107.159.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHEwRlUHX8qUCZDSBHbEhhTA8+Hg3YZbtiP+BGuYELilCY9m/wS9sSzDLT6ihsk7A5mWbDhWVLkIzM2rpe0gaqQU8isB9ALY4/oRaM7brp5IRA563aKH0I/amP2x6QpoZJkn0cZCzvGnRK4m4bjAdrWV18g9A7/2dhM7Irlra67oPBUnk58PQQY3XaYk9/jYRVYE62Q5MQugFwL2i96k602geo7CEjQHuFjFjpzBJVL4cND3qurOFYYUzCNaZ/FeuLI7abTQdy7lEXcB1vnzaaX1IqCs5d67Lbz535MKDmxkIUwgfkO3+TNrV7zHZVRoJQmahVW+hcn7kPrsBESjQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBZMneYsAfYDTBfE17qJ6tEFRXQAfccXaxJF8mKyfks=;
 b=h160ft8ea4ks+kd2rrMRXM/W1LEBnUKfnC9a1WDV0mbxpZZOPTWp4vPOTDBnQ0/qxQdtstIJGoFP7z4mGfRDdrRGa4xpMPeiGOL4ChiSV/JHMdnaDEIhezE6ZecjtF59CGI8tW2E5stZzodmFiVSBe0h7bTl0/m1hutQRivT5pqAmRazyaLbuDuje9cs7wKJ2xx5ij7wbjBprRxv/EFH1ehmQhoymx+tB/c5cB9OEkRu/x5Hnh6wapaphaDlYmaihIk2AD7SeRR7rbVQxJl/bxZv/wBoMUvZd04tN/OxncVes4qGAEk7ez1UKzYpE2EkucO2d8ejvB82oj2x/c72Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBZMneYsAfYDTBfE17qJ6tEFRXQAfccXaxJF8mKyfks=;
 b=Yz3RxF+2CjgAF4b1/0LbC356lkuKiumtzQL9GSeS06jYELKMkAO1YGlhdgLTiWjWdlhbklXrd7DzkuAu2SosUDHxrFwgLh5FUuSr4j9u0OQi6PsMPZ0rMDD+i5XcAer408xAs+LYg0eGPe+jYtFhd7Y5zawUiRRFAqrFzzUC015J8u4/DhXc42xbkcXZpbqgazdC9iw+pUgFV32vwpqOKBV/+Z6ZFn5TWe+vbFKoPgnPKhJ1PyFafYQ6L3uDGg6jYm47ClqRF/RmmQUVAQLfXc8rHGf7av159h6Np4Q4gbjNCriWtfelsSRRZB9Qgpbk/wcAt9Mb8nk++jcR3kwcnA==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by VI0PR04MB12077.eurprd04.prod.outlook.com (2603:10a6:800:317::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 17:11:50 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 17:11:50 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Jonathan Corbet
	<corbet@lwn.net>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
	"arnaud.pouliquen@foss.st.com" <arnaud.pouliquen@foss.st.com>
Subject: RE: [PATCH v7 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
Thread-Topic: [PATCH v7 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
Thread-Index: AQHcmq94w++6Mtr9i0GYB3I24In+RbV8Kqsg
Date: Tue, 10 Feb 2026 17:11:50 +0000
Message-ID:
 <PAXPR04MB9185CDBDD02812933DEB62C08962A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260210170439.406513-1-shenwei.wang@nxp.com>
In-Reply-To: <20260210170439.406513-1-shenwei.wang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|VI0PR04MB12077:EE_
x-ms-office365-filtering-correlation-id: 4f82d986-ad5f-47ac-89f7-08de68c77acc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|38070700021|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?wGJ4US5cRWjRFNKCyzp6dG5ejZwEIjsfE50tE1hICIHGS609ZKdv4Ler1blO?=
 =?us-ascii?Q?eogmKj914plSeQ270VJubmPJmnLztnTlr7dD4EXdmYce2Q86lTINODD7CFch?=
 =?us-ascii?Q?l3P20hEOW5sxGhkRIc5DZJuDEAoszSzppziTqZE9s818U2qfLvM20qmUxxjN?=
 =?us-ascii?Q?9YH9pTvtjAK2ctrY/bQOyiv2/pnVPvnnkW+e5bQHTP2KON2sfDKsflA91+La?=
 =?us-ascii?Q?BdBmc/uchTl/89OxWbk2kfUBwEzkhKlwyvay0VG0CwaeFFUjtbcljH0IrYIg?=
 =?us-ascii?Q?7UcUkdugp7yYKSDN/JAyz8M+EHJzTgKbyPDPYFks+d5RbH+NCghCdBnIc40K?=
 =?us-ascii?Q?9ZNOprtClHdvDpT4ngHnszzMfpPUq8AixJfvmeEswItt5R0KiM8Loe1BzKIy?=
 =?us-ascii?Q?vxFKr8UgBObCbEBzYnMz2imFchVOdPbF4vo2Jb4teivek7mlnMs55D/NM1Md?=
 =?us-ascii?Q?lf6Un+G5+1WYpCZRvBfT24ssu3uByp24N7W8u/QG/2ygqxYQeQ88iyxA56vI?=
 =?us-ascii?Q?z9pIUrfR3BFSA4lPo3QMxRRNMSh3zsq5KAgOadzfVmIrP7Q8ohjgHEO6IGlA?=
 =?us-ascii?Q?1OcAL1U/WnPes9rCA48XIncsI/xLDBFW/2RhVpv2NJJ3Hc7RJIVzfa6T5u3A?=
 =?us-ascii?Q?Qkq0CktkUMJVOtUrLvNFV7kBqowUBYKl/tqIErj2OgdaNfKKguAnoEor1K3M?=
 =?us-ascii?Q?gse/N3eljmoXAp8VsQ7mw97g2CT/mxsG5Dir5c5rGmKQSbWzjOuoxFvIuww3?=
 =?us-ascii?Q?NyHyplSTLXTA8q6RORJDKEx1HurCQtbtzuKzh0LDREm0XTwuzFvF5RognFiN?=
 =?us-ascii?Q?XoEag70LfCeexTGVYQHvTv7Yx2Ww5wCgTLekwxY/r4cmOytGfXBglRMOmmD8?=
 =?us-ascii?Q?OTGAN4uSy/DwgCzbDkf2/fYFVUCOoDlMz3so2MggfmATU/bjui+WMf3CBvHU?=
 =?us-ascii?Q?+vRUGV2cpbZGUYG5Q1lm9G5tQKNFwxQPVnVr9CjYgV5w2Rr2XEV8zIj5N/Oe?=
 =?us-ascii?Q?ena1phGr8a1r5C2z6Vg/dkFCxCJ7jxatZlSxxEfsSwI888UebXIVXvHGt05V?=
 =?us-ascii?Q?tzghc2brgMUW5PuoxhOMO6YzcmD701/zOq+KJHXUjsMO89dLLwPoJxlaYQRX?=
 =?us-ascii?Q?RegppBGc1uB6bWl0t5yKmdKmyX31kbXiu8pLFYTMvfhK1c1YmB+cEH0NhmEr?=
 =?us-ascii?Q?JYWkBdtYOI7fUs9KNDdx9XxbprUoYBhivyPVJpWuXuTKaqo8vruuZ+w8vlv5?=
 =?us-ascii?Q?snpttPryzvSr5NeknOwyhDL/O/pJO9oLHJ2NK/3LFkqR398NRDMrGcgmApPT?=
 =?us-ascii?Q?b4I9WsSPeJS43Ia6wiI9AOKCxieQSmlsaCR309mCH1/QIhYMTUwdKdBYDo3W?=
 =?us-ascii?Q?5xhRzZs76GEqYCeRmQeKay9h2oaOhA3eu7FZAUeCZdW2j+JwuvwPSIvWkMLF?=
 =?us-ascii?Q?8Tl5VxVtOW10MORJjY//s6zbK4oCzakenrHssPYLxAFHkEl6G4EzfKajfbSG?=
 =?us-ascii?Q?xxgvlRBlhwSxrVRafbBviqsC8fIpKbb7befSKQKg0bJsFKk5ayG+TUhz3K6Z?=
 =?us-ascii?Q?VuvOM+vebCudtNzbYfii7RxBnyCxquDQcEjozkF/jw4dnKgXbmW8jNWmNi/1?=
 =?us-ascii?Q?JEjLV1eqtOujGKanetKdpBONtULS71psiFj26Wv2hOo3?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?c5ZJnrDzvx4cLQH9hKcL99kND8TeGTsHyeRW5qWMLSgWKiYipDZwfKUEeXNQ?=
 =?us-ascii?Q?QrDVGaOtbsoQE4kPm14v0dOBvFJ6CewNZPACdf8i8u7gb/f2Axz7KpR01S5n?=
 =?us-ascii?Q?qZ6m9DjO2NlHl+2zaU9q9/cnJpBwryBvqZI85latiSOlVft6NFzpSlGbhl8W?=
 =?us-ascii?Q?0BGO43JhoBjXdqxxu9qqulmg1aYIkOrIVlolCCPgrBXJdyhOLLrG8e9A3tFa?=
 =?us-ascii?Q?iazzS1V087QpVUt0C76+jVBBN40eDNcK0m+rCQZOTvlNJv4/byuoW/uCDqjS?=
 =?us-ascii?Q?Y/tIT8D+Vi5BFppUMnCFo7arnmPi4oiE0sgztEUH27v1zfYVOpcneqqJ3wB2?=
 =?us-ascii?Q?+5r3PmAdZybm+uQoFF3Z7NUKtMp+u86+1GzsJQyK96JTxcv1v/jSQkXCEFor?=
 =?us-ascii?Q?xRoRTXzbRRsf27CJ2eOzgm0E8ek0s+d9rQbz95s/qSlzYnenqqJjHabGY/UD?=
 =?us-ascii?Q?KE+AZZ7m5f2Av64SJiLUgXIidg8qUIigdr/suRHllyvAURHABmTjJA8W6pDu?=
 =?us-ascii?Q?lf8fwu2RoHsdeNNV1VCKmfph3MW5PvSV4DxH9Y46W8FgOSCQFDjTzld429SI?=
 =?us-ascii?Q?R0rdKf1Q8P8YTCact7Ld9vbn/YKZgrwtuLwozLxic+ExBoxpLMnyxFU1b3iA?=
 =?us-ascii?Q?ao8gbRs+1GpANurXdFMoZJ6VwSbboAGXTGWkLBmBLfbAGSYGNq59UgvcXrxI?=
 =?us-ascii?Q?z2jPU3YKd4iR7ZtkKioYB/dTz1J9m+ptnnOIyXR2wJl1bdfNY46oSHjpJ+Kf?=
 =?us-ascii?Q?iRLZrBuH80eVmwE80FU1FEWAnOWlNwguDhaP0HzPH05wgNjEptjJXruQ+1kG?=
 =?us-ascii?Q?UltLs2ubD1Jc4bfz5vgbIxHOs8kdH6kBsSqXBwunTG2nTXbbZQNCyc1uOSbu?=
 =?us-ascii?Q?WQC4o8h+KVGQrqvEJSdlSmyMundmmqYDZFlRlH5DRkAJmSDOZXq8O6iCkJfU?=
 =?us-ascii?Q?ZxUdIKgl9Lh9BGM9lwe/PupK9QRRvDdZfTe92zfE17LX4vdNAnpIdOPKUZOe?=
 =?us-ascii?Q?2NOpE/bfqxyUz9ljhdUBee0Jtz3ueisEOr7oREsI+PfMDyEyVG8MlAirhEih?=
 =?us-ascii?Q?gFWKguTRzSWNCzNiOBABXvl22rEUQiuBZL7Z2FSaVOdCMjMx+8Q6XZQJ9ii+?=
 =?us-ascii?Q?VcUxQi3n5Od2+GILI6oRq/qY1I3h/EYE+t2Gv5+LjiLwlKa3Q89mKMk2ifkf?=
 =?us-ascii?Q?DsHq0Ll6zfA8uj9O9+y3fNhPK9kHHn/yOy7LGxZxB+HM/m7r7mKWw/vboJEW?=
 =?us-ascii?Q?yKn5kzDDsFJwIKRCakwdkxNrHFnjyIqX4KZYqXhXk8lqJ90jwwqA3uL1hVQz?=
 =?us-ascii?Q?R8RgUC6g4aeMspTE866t3dn84l8Knm7cG9OPCnNDxFCTao1DRdCNpOKNGnuR?=
 =?us-ascii?Q?PfcQT60mwO/GvdZFOKcsV7kINVplVMeF6vvOSMdmCVbfcNobgIy+vsHT+T8A?=
 =?us-ascii?Q?7ZBO2aqO0vyqLtgPjfzeo0Nv50T3Sk82N71q/BzO5v2hXjgu00HePfPWoomt?=
 =?us-ascii?Q?P6/pMPyT8MRetTOpEK0TlR7aDTP75kCQUPjvHcBVmQcN7UKRXlSclPfNVGaq?=
 =?us-ascii?Q?MUu++2DNRbb1tRVfNAZZfAgNTklGQ44SfCRluigePU6QHv8zH0xTip3uV3sa?=
 =?us-ascii?Q?wc2xD+8yLzms6kf7pqZN8AOchnA6BN6HjxebpOuKmwjru2fTvT1TphnrZCAi?=
 =?us-ascii?Q?xY4pZHcn8ZCCMDqVBgqh5f4DpA66SGZD3e/Xne+S7TefbQIx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f82d986-ad5f-47ac-89f7-08de68c77acc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 17:11:50.0939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jseI4uvEk7GPkZF8y2TtVjzM9hysFaowPolqdByj/1qET6hWd3JLTya3mENwMwkRp9EF/S1hxbNN627pdjYsMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-31569-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AFE4411DA71
X-Rspamd-Action: no action

Please disregard this patch set and use the new one instead.

Thanks,
Shenwei

> -----Original Message-----
> From: Shenwei Wang <shenwei.wang@nxp.com>
> Sent: Tuesday, February 10, 2026 11:05 AM
> To: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.o=
rg>;
> Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>;
> Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Sha=
wn
> Guo <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>;
> Jonathan Corbet <corbet@lwn.net>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; Shenwei Wang <shenwei.wang@nxp.com>; Peng Fan
> <peng.fan@nxp.com>; linux-gpio@vger.kernel.org; devicetree@vger.kernel.or=
g;
> linux-kernel@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; linux-
> doc@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>;
> arnaud.pouliquen@foss.st.com
> Subject: [PATCH v7 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
>=20
> Support the remote devices on the remote processor via the RPMSG bus on i=
.MX
> platform.
>=20
> Changes in v7:
>  - Reworked the driver to use the rpmsg_driver framework instead of
>    platform_driver, based on feedback from Bjorn and Arnaud.
>  - Updated gpio-rpmsg.yaml and imx_rproc.yaml according to comments from
>    Rob and Arnaud.
>  - Further refinements to gpio-rpmsg.yaml per Arnaud's feedback.
>=20
> Changes in v6:
>  - make the driver more generic with the actions below:
>      rename the driver file to gpio-rpmsg.c
>      remove the imx related info in the function and variable names
>      rename the imx_rpmsg.h to rpdev_info.h
>      create a gpio-rpmsg.yaml and refer it in imx_rproc.yaml
>  - update the gpio-rpmsg.rst according to the feedback from Andrew and
>    move the source file to driver-api/gpio
>  - fix the bug reported by Zhongqiu Han
>  - remove the I2C related info
>=20
> Changes in v5:
>  - move the gpio-rpmsg.rst from admin-guide to staging directory after
>    discussion with Randy Dunlap.
>  - add include files with some code improvements per Bartosz's comments.
>=20
> Changes in v4:
>  - add a documentation to describe the transport protocol per Andrew's
>    comments.
>  - add a new handler to get the gpio direction.
>=20
> Changes in v3:
>  - fix various format issue and return value check per Peng 's review
>    comments.
>  - add the logic to also populate the subnodes which are not in the
>    device map per Arnaud's request. (in imx_rproc.c)
>  - update the yaml per Frank's review comments.
>=20
> Changes in v2:
>  - re-implemented the gpio driver per Linus Walleij's feedback by using
>    GPIOLIB_IRQCHIP helper library.
>  - fix various format issue per Mathieu/Peng 's review comments.
>  - update the yaml doc per Rob's feedback
>=20
> Shenwei Wang (4):
>   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>   docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
>   gpio: rpmsg: add generic rpmsg GPIO driver
>   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
>=20
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  |  55 ++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    |  53 ++
>  Documentation/driver-api/gpio/gpio-rpmsg.rst  | 236 +++++++
>  Documentation/driver-api/gpio/index.rst       |   1 +
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  27 +
>  drivers/gpio/Kconfig                          |  16 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-rpmsg.c                     | 583 ++++++++++++++++++
>  8 files changed, 972 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yam=
l
>  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
>  create mode 100644 drivers/gpio/gpio-rpmsg.c
>=20
> --
> 2.43.0


