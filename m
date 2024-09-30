Return-Path: <linux-gpio+bounces-10546-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D20989A48
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 07:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A07B1C212B9
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 05:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B518145B14;
	Mon, 30 Sep 2024 05:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aFeWv3I/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010027.outbound.protection.outlook.com [52.101.228.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DC83C466;
	Mon, 30 Sep 2024 05:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727675333; cv=fail; b=NHM6HsjUIGBuXbG82lw0XdxVfk7CvcJGAvoWAvEDdwPMhRnrLz9ZRK/6XPCaqRcgLSIspmMrP9j608kDSHmF6Yi4dTXU8ml7ZVKjne3Q93FgIDcCBnS4VfnjsMKe5qGl3xlnBJtTHIDPMKeqF5MT2dxR5HGfAzVgkOqwIkJlyL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727675333; c=relaxed/simple;
	bh=PMzbh9U4wcKv+Q+6RmV6uKvcX554/1pTHRiBejRdXHE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=m75qTlmJ11Kd5Jh/w7Vuet9oVmE6sLQgXakuaKqharLXUqZ1VGNxFcvHUqad8JY5SBkGkV7IzC2t8+wgtRFGDekqjEbMIzA01svq6PdwzRNyitPMNTNpcSNB1JlPbfbLc0edIdNoi4hVVJhh6bWewOjRT3sb96aMY6GpMNRZnyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aFeWv3I/; arc=fail smtp.client-ip=52.101.228.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2a+j6nGxSKKTlgFT/KPzQMLvXK78CdRFIaz6ZDy+gfdOSt5VziHS3s7tzaFBraU+/lp9+DEGs91PUasl5XPN24BwQnzLGjn2ojilyBJ8E5yHQjjjZBujWGSLULjd9oIu7S9i/cJMVW0erRT1j6XPLPpBPEiAhti5EG5bmWQgituVwEZKbJUYe7914RShiwsIQMIgrWhojCn4duTEAU3gIULFyiIk+Ba3PmIrIgBLtEJR/7wRmDj+V9CRBuoo/JXFsP2uPupdvRfkSTeT2zC5rfQ5Cs0mJECYEX8mDbRT4XuTyCDwnCTlbuzOrlAd2z3gplQU8g4QCcaUJSlx01iHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dqqz2mAzpWVtPXa5Krihn1gS1Jw7OzLCEsqAZkJ7SDw=;
 b=rTSLeeMQlmlvN1PjpKDFTF6CLauCRZpXYVsZYkBPDFyBsxBZQnoA6suBl3INTBibrli7qssG8MzhwN9TEu1RZv0+jmyz8Ce7Gb8++7DOPrwtLDupxpeTas3qSGuSyn/9FtuagMmCI17fG5P2MKlruWV7KTIExEtscTxEP7168NZv2y/XYy81VDD1VJgMcETfE0xa058zXjq5CvSrredGKrZ2PE5+QmLDwbQTOp6EoqaL1B9QQ+GW2NZxCYGuq+7sfSdJ7Wnh6goY/i66VLc9pWYj9Vn86MsaWUegORAkNJP/o7S5O2ws6wJq2/dUfHFq34LOQaRmRRm4UykTsAVItA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dqqz2mAzpWVtPXa5Krihn1gS1Jw7OzLCEsqAZkJ7SDw=;
 b=aFeWv3I/xJwafH8S6ulu3aAvHYN/EB+CEPyf4mqz+B6uRiWSrrfXJMjk5REin09//lmnnLvXF/MxywjsNN+iRkbZdpU06QhSSSX1/9i0nc6ddPL8E0jM+VoLU2LZsj8V9I88Qjij0n44Nl+NeSLiww9BrgXMT6PB0tVbP0o0lpo=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by OS3PR01MB6854.jpnprd01.prod.outlook.com (2603:1096:604:123::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.24; Mon, 30 Sep
 2024 05:48:47 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%5]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 05:48:46 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: rcar-gen4: Switch PCIe to
 reset-gpios
Thread-Topic: [PATCH] arm64: dts: renesas: rcar-gen4: Switch PCIe to
 reset-gpios
Thread-Index: AQHbENSdXVxUGRjuGUSKrGSxXurV07Jv1v5w
Date: Mon, 30 Sep 2024 05:48:46 +0000
Message-ID:
 <TYCPR01MB11040C60F22CC553ACF2AA933D8762@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References:
 <853019acdfcdf05fcb46d8124157ef298da55188.1727438172.git.geert+renesas@glider.be>
In-Reply-To:
 <853019acdfcdf05fcb46d8124157ef298da55188.1727438172.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|OS3PR01MB6854:EE_
x-ms-office365-filtering-correlation-id: 6beda2b5-b6f0-4031-3349-08dce1138d38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?v7A6efvFNSmWukfx8xvgl/sCIQifE1Cl8IZmqboExTPiY6RFDOHsI3jDsIfY?=
 =?us-ascii?Q?lwSlXHlX44SXlCb4pz5bdcKF3lao5IJUiuxPvsDUjioy7oxOONrq5+bq0HOq?=
 =?us-ascii?Q?6/oBqqxTPPWOBKXFyZy71BCYkNQX9W2MfA6+yPP/Hmg6jVX7mo696HJxTCRU?=
 =?us-ascii?Q?13p3Yll9TdP9dAAuf3gXta0fJVwqjF8b7NSISUbAu14di7Zzyh4mCldoK7l3?=
 =?us-ascii?Q?JkjE+DcipO+OQ19HLoiSMhJINZfsw3rRc+jZNfn2TvoxWOAeiCFF7tgXRECX?=
 =?us-ascii?Q?E3+IEBuTV2NLuJ7Xf5ldtmQVGPIVwTUlUsr//O5YRIpJo0DG0S10SccEbek6?=
 =?us-ascii?Q?kMkxv4iIdGjUryCAxF+NOiYGgApAVoeypxZrMBvGeSm629jtzRZvozCRYecc?=
 =?us-ascii?Q?Ipo72HdQUPnoOhcIGqsz5Izf549pWix3nwQknj4d5Zuz1uNqWh37i7Fy9N4u?=
 =?us-ascii?Q?ZbC3ZcMQG+nU2QDNGlP/CuQz/2lgM7f5ZasJ7Sqrut+h9X/ZBW3JEGLu6DjH?=
 =?us-ascii?Q?/LGSmKmeLszZha7gMBj9nCVyCrPtghSSf2kJUemAawjkht53NqOjPUXJ1puJ?=
 =?us-ascii?Q?HTllXeL+op97lU0c8gakDHdKvKRFAE/6jTnilpqUqKjmKPGocfSPv0Ha+H3Q?=
 =?us-ascii?Q?yerMlZKAeJHA4kcPP73AL55FNdFdu0FqHunaTS8Fz+FatNqYUbzqf2KbkbHh?=
 =?us-ascii?Q?kHINR+ZdWFTrqB+iCruhb2/gBoaFYT1ER/iWqBnuotdzWeUOjo4u7nQKtoWQ?=
 =?us-ascii?Q?UCtFHCQ6ucrGIi5gc44740cfWGvI8/+pNtGCmS4oMkEeEtcH2+uuOxK4D0Zd?=
 =?us-ascii?Q?wRJurLqsxmzsEjSPPVJR8KSrwiHwCYwPEREqo9i6Xhn3RszzDvNKUkwsYGEg?=
 =?us-ascii?Q?sirKzMtIepkPjiQiXR7TCSza4twDdMA9UP5VLuudQNEuqdAFdTwWHdYjSYZm?=
 =?us-ascii?Q?OuXSqFqyCQ9lvxNcP/H6sL9xf4gLaZh6hIV8l37n1WIzatkUr0ISh44XPZEy?=
 =?us-ascii?Q?Kdr0cmQ56nh1Jb4qMsfGpUa6q0absaTy8CbQCsb/kEnWHDPCOpWVq1ho+8kX?=
 =?us-ascii?Q?7SLzag0T9jA9RPV+buUuaFJlGo10Ce1j9DK2tBwg2WY39DtpXASpBaa/mwRc?=
 =?us-ascii?Q?tDwNtilJAdlRTCuvCqDE08gEXcXai4e+OBpia6+obocDAbyvigNPjswbublW?=
 =?us-ascii?Q?1gLN+LK/gz+p2d2fuvT20nBdnk0rEvo7+AfBYijQ6UdCKYwCw3yyNYh/fYhR?=
 =?us-ascii?Q?hh9VxY3B2i5y6Lbwid7HsqbEU+b5IZ4fjbCD065IqIozHESjgpTwmMe/hySq?=
 =?us-ascii?Q?ckPIqydFHphIsf0i9/MhakEJBGkcH0mblmI4L/rlhFvKDA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?m2uiPpJ0V98hxRoTpzcYBw7TtCHgtKv0LQ+5Lu8rL8T/3PFlRAxPfPcDHKmu?=
 =?us-ascii?Q?6rPg9f4BKiHZjK4g6xgS6Vmdi8dCaKvh/2ngZZQaEQa0/W4XvZ2ge3EjKD7X?=
 =?us-ascii?Q?S5v+UMenmpAueegN1XdlhB84p7AVA7YBdud2Aq7joyFYnkojH+2LTtRmii1K?=
 =?us-ascii?Q?DBDoL1f/3Eo/K+4koezfJzGrBhB9eV8arNblt+WY5dcMl5NNEmUZ8jc38hq8?=
 =?us-ascii?Q?tme2hDn4TN1KZUNLg44l/9UX4k830XO7rCNq8Bia9cQqSFv86V3x726ZQWoI?=
 =?us-ascii?Q?/BK4yE0pSP1pvShmLJ+uRX3QHcTaZi+enrDeZ0BAwbjx1fIbQI4CM6uXLbus?=
 =?us-ascii?Q?XNM5sf5QEyOyAezt0CBwiWB0/tTwACpcDzxnW7+mxgyTN0nSd2xJb78ABO4H?=
 =?us-ascii?Q?Z2K9PSGgr7WGdEbyWnhxvnGiKAnUMCUh7PfiUQYMPKxtoJlKkabAequ66dHp?=
 =?us-ascii?Q?T7rb83XAq40ZRsfZXPWVsDBUprp07jfXDtVkyY2ZmSy4hit6HkZrC3ygCqcB?=
 =?us-ascii?Q?hkd4Yza0/vK+4LVQckX0rHGdEt/LtqxCvvj7QHYSu7US4HUsetkURX9C01WQ?=
 =?us-ascii?Q?FCaq53dScda8J/qMPrY7EKPLbuUqx5mSqmrS6ounGQ2FnV6vuoSF8bf3QkZ9?=
 =?us-ascii?Q?ANLO9Hb4oBWZdrzCQJTU1yo5aBwzhdcADLoMxVvpGvN1GRRMfATsqJIv4NsI?=
 =?us-ascii?Q?WZYID4G4iJB4NwF46gpKs5k4gl3PvuhaT6PMuJ8pSPzGFIvKMYXJApg2r//5?=
 =?us-ascii?Q?d/kjZz8nC44MOUtHfuF7HtdOYKcPFrSTrnvTxKHJVXjxBwS4NDgsjQCw8r5U?=
 =?us-ascii?Q?jONEqh/HHiA66Q0sDlm94RttXodmdFwpGAhQWfxgEEPXFhwOOUyzY58OSc+i?=
 =?us-ascii?Q?8WYgGL2i+iCobqfJ/+Yt4eTpTUYL6DR7MsQjEFELPKysCr1HeWeD4T7By/iV?=
 =?us-ascii?Q?1B4WxRXNA6lIT3ICQUWjVE8qTa3wpaYaJ5diAF7AXtSY7t5wO8vN/UWeB8Q+?=
 =?us-ascii?Q?8R37aCC5EwEHgeSwzPg7dZn3h1voSpgFs8BukOVJXH3H2fYxh1cKD6SZgyjX?=
 =?us-ascii?Q?+d07k4LMAmMKC6ckNMjU5Sfbg37LlDLzTE6EvaG0Qq+ZpsRe1MbG6cz9Nor/?=
 =?us-ascii?Q?qt+pC9BCq1PeGpwdPy9ypL9fIlUmGqos43zkIWx3Y6oxn4rVecB/PtCr6kEm?=
 =?us-ascii?Q?jb4G3W3l+aXK4elsbHgAGMtLgFpJdS+Io/45b1A0raYgJk6mRAe/N2oFFyl6?=
 =?us-ascii?Q?SD1t0JWYBQE95AUsCci+XwL/thNa/+jCvlsb3iYceBx3UOLAvqmaO6gotTth?=
 =?us-ascii?Q?97JBs9DCMZtlaJzMzXYQeK7hBIqwypVTd3trgf5eIJ/zT4otLfgfwL15GNt3?=
 =?us-ascii?Q?QV1b9xQebWzaC0ToGDPuobDtn6ZYZTpj9caiTRoBTPgIg24OImlTo3AdRPQk?=
 =?us-ascii?Q?8c9actHB7qHGNmDry+oOmm76EIOJlrq/6UnUpH9TcYc4HLaSxfvULbfImt5W?=
 =?us-ascii?Q?FaMrUGJnzza6ck5ryeJZdlHiPhEySkD9KagM1kNquc0bLeZ11Niz3NDM2uXu?=
 =?us-ascii?Q?hbki68gK3Zrnb1Rexmy0+BHgL382tq5ryMNS/r+0OBGakiEr+PF22xDheAaI?=
 =?us-ascii?Q?kMaILlJ/Efvw1DGG2CimPuzJ4/V35E9hyIF0677HN20Rq+tEMb65j23x2Y8U?=
 =?us-ascii?Q?NTDnWA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6beda2b5-b6f0-4031-3349-08dce1138d38
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 05:48:46.9311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: il+4aKx7moUdkQJLCv9bwRzpfq7fO2Lo6gYQxHes0jkR9Mghf80PJM7b4fBJ8VX+UppYdQvwu1fH1EA8W71vLTYMJpq8VphoLafQrvKJ1wr0KUPYairT7y91+bO2JRFS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6854

Hello Geert-san,

> From: Geert Uytterhoeven, Sent: Friday, September 27, 2024 8:59 PM
>=20
> Commit 42694f9f6407a933 ("dt-bindings: PCI: add snps,dw-pcie.yaml")
> deprecated the "reset-gpio" property in favor of "reset-gpios".
> Hence replace the "reset-gpio" property by "reset-gpios" in PCIe device
> nodes.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> ---
> To be queued in renesas-devel for v6.13.
>=20
>  arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi   | 2 +-
>  arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> index 4ed8d4c379066342..e03baefb6a98b070 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> @@ -171,7 +171,7 @@ &pcie0_clkref {
>  };
>=20
>  &pciec0 {
> -	reset-gpio =3D <&gpio_exp_20 0 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio_exp_20 0 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
>=20
> diff --git a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
> b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
> index 3845b413bd24cd72..6dc968352c046129 100644
> --- a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
> @@ -302,7 +302,7 @@ &pcie0_clkref {
>  };
>=20
>  &pciec0 {
> -	reset-gpio =3D <&io_expander_a 0 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&io_expander_a 0 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
>=20
> --
> 2.34.1


