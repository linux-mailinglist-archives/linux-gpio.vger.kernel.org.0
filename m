Return-Path: <linux-gpio+bounces-9034-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 216EE95C902
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 11:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A071F1F227E2
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 09:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7841F149E01;
	Fri, 23 Aug 2024 09:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="asvknlex"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011013.outbound.protection.outlook.com [52.101.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7294A13B5A1;
	Fri, 23 Aug 2024 09:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724404590; cv=fail; b=n+a4tD4Km8Ij+aaRcRP7vLMy527fUDiMhBBXjIIXiH2WF8usvrMwjufUnZlhvHohENTZIZKYZWjIFHKA+y0NZwU1yv+I+0w/vd+PHTrvpkj1ppLLghhpI2Yr5biDdO9tdwg8netSPb4KUm2UIonMjXpilFrxNQvPao+Grl4SUWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724404590; c=relaxed/simple;
	bh=6O+Wg6FSemZ9NJKDX3etj02FUdkgUE8StjKNCrDd8ic=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r3fEP+nTDeVJp4MbARsic8+JuW5XIKLrwSHn1rw189Gj2RhcRGx5pPIw5WA3DVccYqv/+8KgJHIYqRM7vsw5qYvb5B5dPzJTo3FwXoTqC8y2oa/ySF8jlszyNjDF78V1X6lUWLS2lta3UiPn1zIRHsGuVu7iYUyBqnN62XEIqsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=asvknlex; arc=fail smtp.client-ip=52.101.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=piINZF6TGn/7y2nfuzIfgw02ho0ltoKSW/7Z4pPIyLC89aYwRlEFqGPdzUAOQBqRtiXmpMkuauCryoVGzjRDUfo6ahNB7JBVxvhE/vzRE32wnFJ9jSKnkCV4iDH0X78o78aYGlTeCyXkHxNgJB93GcQ4oJl3Z+wuCIyUCGJpxCzfJFKUeYCoFgizw0IaP6N0DZZYNQ5khkC4bseay4BS7kj2zeisVrYCSglC+Om7uetEYv9Lr3kjAkaDDNIXldoTsj+2CFmEJY1LdG5FM8D3+Agq0J+H6tokAMpb0dxaYdFHTeVgWXD3ZqvIcB/Z5y/d8F7jQ9PJpOpthPQhjkLT+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6O+Wg6FSemZ9NJKDX3etj02FUdkgUE8StjKNCrDd8ic=;
 b=CaR/fkWl0EkCrb5KsWA5+ej5Mnq5zc+BRUAUYi2ahrf/oEIRorgDT4wGDqVw3ZPNptPBI/B1xP1V77gM4XkXVLcIZiCI6Eg8wSMQkJs7jF9X/A9DmspOoz/AEXsf2RlckDlGbIjgKODWf055fLPrWzFfRNpektVtJuRb26NMMlE2Xis2U13v2KUHJYKZlaF4cNXNMuHUxdu+Clv24UrrPpnSf/32NLInR1xFJIe3+Ch7zURMFfJPcnLIvGtMfzgum8g0z3jOHckFGG4hpxngx5euknFGU3y/s7mWgQ5Je0+smrqafYVoxfYJKNCWVwwBliEksGJXbsq3G3ipjLVQYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6O+Wg6FSemZ9NJKDX3etj02FUdkgUE8StjKNCrDd8ic=;
 b=asvknlexrWpauQu1znu14iamfEU7APbQ7TTW6r4EqpFiB0crAJDSXGiDDR2fI0Y3U3pf3XB1e16ckVRiN8qYydPs8x34FV1zRPdl38S0GBJCW9MmmevCEovGeuYP31/E1UWF/rQ31MuGxc/9oJQedjWjALWxLjVyqQHSjOCum8LlApfIyDvSMQjP9G7PXgMhhbFPTRGRJysUWi8RmFQatIjWrIsfThVLFEtKIEeICaujB3MCpjGM9fhBMcLiNLv3HDM45QHv4iDryZZt8GAB+naH15lj/bEpBAJczfk3m55YMo1d2V3ZktPZ2OF1D109PHs8+sDr58RJgOYWGrepvA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8956.eurprd04.prod.outlook.com (2603:10a6:20b:40b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Fri, 23 Aug
 2024 09:16:25 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 09:16:25 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Shen Lichuan <shenlichuan@vivo.com>, Aisheng Dong <aisheng.dong@nxp.com>,
	"festevam@gmail.com" <festevam@gmail.com>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1] drivers/pinctrl/freescale: Use kmemdup_array instead
 of kmemdup for multiple allocation
Thread-Topic: [PATCH v1] drivers/pinctrl/freescale: Use kmemdup_array instead
 of kmemdup for multiple allocation
Thread-Index: AQHa9P2ftXXx9+da10ykxelYlyxXHLI0j6GA
Date: Fri, 23 Aug 2024 09:16:25 +0000
Message-ID:
 <PAXPR04MB84591307E55292798F8ECC0788882@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20240823013959.6281-1-shenlichuan@vivo.com>
In-Reply-To: <20240823013959.6281-1-shenlichuan@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM9PR04MB8956:EE_
x-ms-office365-filtering-correlation-id: 3b4bfed1-78b7-4aee-08f4-08dcc354436a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?xYHPZvlhfe9gRDBCc3A6qdhctUGMy8Gpm2sEKsZLGqeLGGXc2OL/l0+DzjYQ?=
 =?us-ascii?Q?vwtlqp19aZI26veaRuksct1/l2i98LBTOgJOd4mO579EGRy2mH9tAS4rOxFx?=
 =?us-ascii?Q?MI7rN5G23y7NcNwccysQX6p7l5zhBqWcSNvLlvOmjRyqIVVqcnnnrLtCyUCV?=
 =?us-ascii?Q?/hG5Yniv/jPpmq5Yg9pg3Mtu3AMhsy3Y1Juc4PdonymxLv7zHjucdeOXmd8H?=
 =?us-ascii?Q?kIK6lh6kEHiVFzrCEx/fJOF7mqmy1sqptY0HMzPXUySDrxXpAsulJxiM2erG?=
 =?us-ascii?Q?WUdBPnP8CNHLQs9cYEgkEu51zIEb6JxjnyS3PCjxP/pt/qbpvkHzQ8g0Jqyh?=
 =?us-ascii?Q?jKhGajBeCeLcbn9XXCFGVPjfCfyGwetGKu/A2+mV1HIAX+6urGRFQnFVHMqC?=
 =?us-ascii?Q?4HV832PKZJVyXy+JBI9zSEmSZ9GJzcfhcbOyvSE+0lKPBXS8xsUceveO7Qt8?=
 =?us-ascii?Q?8jQBx3dBbf/cFKvFMxOUWqyrZ95aevHcvZAFH5C4SiY35ynG1c8Bhue6XHow?=
 =?us-ascii?Q?aL+n1fOFZmjyZj1xgoURGo5qi0se827aLmPU6MMOqeFW6ky4RARh5PDzpSzq?=
 =?us-ascii?Q?TrgoOh1TUPKmPSjZXFxXxrMhy7QMrD5YzAfPjKAdyrTtWvKbrHidfnImWX0L?=
 =?us-ascii?Q?oej4b983Vj3PX4CqP/H+r7oHInCSp6VVD8giXmGKf2EyYVqTfunrPAjCFny1?=
 =?us-ascii?Q?4R+UVewR1DH22GAWWcTYREdNCjECeVhRupO0slON5bz9XFfNX8gyzXajfPnX?=
 =?us-ascii?Q?UzztVY0Z/E2DITXjJVmAH426t9I/WjV1E3NXrNdBkKyGUCSZ7tNvrrRXHu0P?=
 =?us-ascii?Q?JMW9/Gn+T5sdtklIpAylPGLijRS9mxvgwo7CQf5o5fJmoJ8p6xi24UtFigd/?=
 =?us-ascii?Q?aQrTa88SIu6ZYWb+z1Lag0D94zddBl2jfKBFmAX+y8fqRH+VFPBwW78mXwUI?=
 =?us-ascii?Q?xgN1ZaZBRLGDoKFv+1CDp+en0TMMjhBRgKbrMn6r6jrVnMk4kdhCqvxfO0rt?=
 =?us-ascii?Q?DbN1njxGUISrCtcnpemY5O6hTYpWMakwjT5QO6shoVhbLmJLJv7EXncGdZN7?=
 =?us-ascii?Q?e4KjMyhV5ynE08cgFXQNkOxKaGz00sIlByjSX083cR0hhLALikoq/CUZTmta?=
 =?us-ascii?Q?YPaX4ilm6ekLCFh6xsfUZP+nzBrquoGQ9jos95y9oZBUqDyHQk+SbQXgax1p?=
 =?us-ascii?Q?ZOXJ1YQxlmIf7r/C4vZFQ9V0vaX15s+o/x38Kk5ZQmJP742HT6r8t9HfpUl9?=
 =?us-ascii?Q?lsSOyP4rhR+rPmNuG/rJFvdgX5be5wRMPMtKqo+h0OOCRmaFvGaUZoY2s0By?=
 =?us-ascii?Q?uw0zQwrBLNp57NdfXBz48qvwgmLQyk7mitnUDnj32bDpPxyo+cB68o46NCYS?=
 =?us-ascii?Q?de8eGXSpc5pliOQUdAMT7nR3KXQ9ykFu93ZYJj4mbmZNBRYbbw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?X6L3JJpqzxFXo0jFurwVYu+eDQ7tVJjAI5eT9mb5QgVLN/xkoh6Eper59ssH?=
 =?us-ascii?Q?ddJdyJJLe0ik6WV7jeDpZf0B3+0/nbgYCHtt+zd6jX6+z4Y2AGhH+bdnewlJ?=
 =?us-ascii?Q?4F9UAhMCLQf0Yx+gfzarv5aoxM9LUWkMlVkc4JKdFv6kkBLoQR2JooJ7QHrl?=
 =?us-ascii?Q?b5f6kGF5A418he3Rn5uUN1KXXR0RejHfRgvntGgbbzeKf8GMky8427Fy7jlH?=
 =?us-ascii?Q?qSXfr3dBW59BReTsmB3uhS2i6IcT0yLqh1nq3zXOa6bYAzPCMtJQeTLsBpVQ?=
 =?us-ascii?Q?B0c1Xfnc7lk1zHh8yieEwsbVr79z7kc8UATaqBulgSTNqtXCryt/ZI+oxnhN?=
 =?us-ascii?Q?oZyanAgPyUZS7Lr7TopEO1HAMYjVFknLuwJoOxLmpMC1zyBDL74EqXbwCURw?=
 =?us-ascii?Q?Bl3+eyso0aG6x00n1KwwIOJGAjILniRR/8ZYpTFHY7AFg1gnYGlxR+4LWsTw?=
 =?us-ascii?Q?Vi1hC8foOpR/4t0NegXC4tQEzGyZGcHSOWH+2Imxh3PFwgPX6OI64cUq4FD0?=
 =?us-ascii?Q?wGIm4yX+8uQl6SYVLztv0Z7HgnOIdQHrk7OEhuob+st0x3IXmqEIXlpeyvvK?=
 =?us-ascii?Q?0kFwqO+xemZ3fSCdW0vw0EkHU5kk6g+lMZtEb8NEBx+JBRa5arHXmHOvtF8M?=
 =?us-ascii?Q?y6LZoSOVUn+9NzTJDlWCtKUpQ5eBGT2aBn1xHvZ9U6znwEWXpYrEhqvruHk8?=
 =?us-ascii?Q?UnWmklNfIb5b62RrDEQtvn0rE3wapFfKJ7TOC/XbEoOvSVJYGAmpVeREErg2?=
 =?us-ascii?Q?KU80/Nr/hyFSuWugs18IH6lIYMS/o9pB8nwk9d/rSDIE58cMCfL+IzITiC9c?=
 =?us-ascii?Q?iEIezU4URU4ifF0akdNRgS+5fepm8F/CY9Vs7wWLwAwQEcEDweIGgaUFJl1G?=
 =?us-ascii?Q?/WR2E/0ZK06f9ocIxAcZqjcUPDNV3Hm1qVx7aHxfeUb3XzBQ1o6O4yXaYlFm?=
 =?us-ascii?Q?m7+tyH0CKlBIPBuQwxSf7C99dxwDp1NiVGOgQknmEWApRp32QgpFae6z45Q+?=
 =?us-ascii?Q?XLZ1I9tZux74IJ0a+rzIY+0FSEeZS3HqU6DkPiT/eN7wSr8B40a5xpgBqFh1?=
 =?us-ascii?Q?Gl4gi3neUkkiRdOrYkculCYyM+VOfawzlf31omPPR2Vg8mVHBFIqZ+VFgl9i?=
 =?us-ascii?Q?f8XCsqhYVc+kFYg9dERLDK+i9ZblcuNoAWDaqkDS1YpGsFC+V4KrGwem3FAn?=
 =?us-ascii?Q?SEwHwhWkr66MvAg+gq8FhfRBZKQxdkWknx6UE/5hI9Em0TruUq6rwBLlEZ6u?=
 =?us-ascii?Q?CRbhW59/Be4al4gF51h8zzNVunWU08qUMXU3WkHDbGm0CGdiUeejsIxZtpXE?=
 =?us-ascii?Q?h/GiQUd8pW45IIbuI3OZfpyCEQ3h3NDutrmAm+2JArubGkaHQNEJDwhB2C1E?=
 =?us-ascii?Q?Ka5Kg/gZxB3IvuVSC0sWs5rmkGt5MI0YUPNUbmyS1tXnIlXvzVsqzfatX5Iu?=
 =?us-ascii?Q?baXzpNdMD3eYxaoB/qFpzNVoX0qLrlW1uuX2b5/RCb9Z1DPsQZim5f6fkIu4?=
 =?us-ascii?Q?yuta7PetxybdcssHm01ulnu12jnraOkTZOJGlm8VmO6znPaNmhCXVZByAiyl?=
 =?us-ascii?Q?em61Gyt8qpf7LN5ULJI=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4bfed1-78b7-4aee-08f4-08dcc354436a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 09:16:25.5339
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s/jgGxTmxJJ1Uomji69swJIY7jeyspTl+dNOzlWLZ0V4WGCBsk5/OykwE75dc9L8GNncP1vvzeMe/P6Y8Tvx3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8956

> Subject: [PATCH v1] drivers/pinctrl/freescale: Use kmemdup_array
> instead of kmemdup for multiple allocation

Nit: subject prefix:
"pinctrl: freescale: imx-scmi:"=20

Reviewed-by: Peng Fan <peng.fan@nxp.com>

Regards,
Peng.
>=20

