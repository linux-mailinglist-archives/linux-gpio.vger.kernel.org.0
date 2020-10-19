Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCDE2927AB
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Oct 2020 14:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727155AbgJSMwA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Oct 2020 08:52:00 -0400
Received: from mail-eopbgr1300123.outbound.protection.outlook.com ([40.107.130.123]:26592
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726506AbgJSMv7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 19 Oct 2020 08:51:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hu8+V8ILaNbCij4MU6l/VlN0cIeCGR9LwvSmiWhUXL0WYWnu9Ti5GR2Zp331wA+5hILBmZegXPxY+iwT6ykKbxRUlkmubM+Swdi3sj3OBX7vjITaS97Yg+xDzb7lts3VUhn/SjMXmFZNY6PT6Je5yuRBg8Zsr3s67VzURdKIUQrYkGI+0T/wOnaNQy9G1O2xeaejgEGuGPVoBz2xI5V19Xs6MFOKIJfIlTW9udnC3IPFPL02Cnjm69uI9nyBLpW8w1nkGJ98L9qOb23sXQWsyE6FyhRCOVM0aiHf1G7sYetZkuDn0VB+kh3I4JOvF924OsEgveWsPnYyrPiOm9s3Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ir1JzOTmU7BfdDTi3IjpbaaLs57JkpzY51YiSZ5r0w=;
 b=F8N33VLthFAB1GPLQOWiaZZ9mdRFgd0oJeVli/dN/ZSTINWvDjIXYSv8tstcQAYeF5ZMwVPjb8dkRVt1CHc4VmGn1Ltn0HHpWNNQYLTIoe4TNrsn7lRAN1xci6V77+GgXA2MxMjvR56ma7b8GKSQvUePa1BpR48FtbCD2Tr/2gSl4sgr02Qa4+Pz54UfrfNYLK9YK+Qer1kDUfRdanAbtpifD/H8bQweaAw8gQLAeHg6u+XEQHv3HMA9BFs8WHKGmKOv6aTtfLsvqHS865YptFCGP8C6UgjXH031aazfqx/3Z2FSnr7fRlyeXe7PPT+HNEJqM0YaC8jOd2vblCik2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ir1JzOTmU7BfdDTi3IjpbaaLs57JkpzY51YiSZ5r0w=;
 b=N3bAQ+ZerOv/oiNGf0hTkM9palq9AgSZJmHwoFaK7HJ2E21oGKUnoqfqwsdRkbhPdJJ8lROSfaz+JlUr3fHtjIi153nQdXuWenWgQUfvwj/iC6wOXtulMtpcgcUbHhVyuysqi/dQ4bT6yINPbvGmX25IDNwaCZCjhPyD7hqPYg8=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TY2PR01MB2811.jpnprd01.prod.outlook.com
 (2603:1096:404:6f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Mon, 19 Oct
 2020 12:51:52 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::757f:58cf:296e:9f84]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::757f:58cf:296e:9f84%4]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 12:51:52 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 2/6] pinctrl: renesas: r8a7796: Optimize pinctrl image
 size for R8A774A1
Thread-Topic: [PATCH 2/6] pinctrl: renesas: r8a7796: Optimize pinctrl image
 size for R8A774A1
Thread-Index: AQHWphVmkdYF06SAbEyCDWgkr0D7wqme4ENQ
Date:   Mon, 19 Oct 2020 12:51:52 +0000
Message-ID: <TYBPR01MB5309DE5A3422E76A40EB3B0E861E0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20201019124258.4574-1-biju.das.jz@bp.renesas.com>
 <20201019124258.4574-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20201019124258.4574-3-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [109.152.220.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 50c0e51b-1fbd-43bd-22cf-08d8742dc0b2
x-ms-traffictypediagnostic: TY2PR01MB2811:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB28113C094B1EA9CD4E7948C5861E0@TY2PR01MB2811.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7LkEqPqm1wuUCfkeeLUE+0tVt8ZhtfDnYJngOQgUNp9rWIiWyQQZl14gm2CBVM26S+NPwmjBSTFJxCtPwOiU+HJ87yO0HDLfiJ6FuwIQdGKBiLI/OmWV2/nWkdaXtGV1La4Ua7XchSHLWVEnl8DjxwFGLRWX07epe4X9w/JDCr5YDbG2CvGfuu0aHkKDp/8/9TTNWWwbn6+JUM/wfsOgcr8BAtaI6bYGhEP5aaYjYN/bsDrJe8/e6RGg3U28DSCU6bvcSYOoHKDS0IfW/XeR6pEd4OxIRtxai4Mzgs0Ue7vaUJPBdLQs55d5BN02tygG
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(66476007)(5660300002)(86362001)(52536014)(83380400001)(186003)(478600001)(26005)(66946007)(76116006)(66556008)(7696005)(66446008)(64756008)(53546011)(6506007)(4326008)(6916009)(71200400001)(54906003)(316002)(9686003)(8676002)(8936002)(33656002)(2906002)(55016002)(107886003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: pLhtlECU4BgKXXV7jSmbbPYc4pItqpj53dot9B5rU+OGvJBNkQtZP85JXWMPk9Mf35a65kfdg3mYLeZ6OpIq16hAcUDghCh8TwNkX7fVQ/47KSBqNHsYwYL7hxJ+mSMns4PBZLl9gseqAwg6ZZ3fA2RaWoE9Mlvj2b88E6FjEqL3ALj7pqfIgMBUjs0mXc41wTR9C3NcY7MXfukQoVxRjeTZLzF+00i2enVuFwyLQlPByL9uAVYPGyDIk+lHTMt5vjPyTTBj33p69ZfusxeQgde9ff2CBdF3AchYApow943mHLy/oCgGLz1RrcCIr1l/++aR8gXtHOc2fvVOuu7IBntzvDAkAFWzYCrvDtZDu6RBbpFCE+30J73w/ftRLktROOv+pqPkox0UAPMjrUYkOmwafyJAt2bZktM+EtZ/YVf9VbSe6kPcwSaR9dmKEbOPfVkLCc7Kx3aaOqftCAE9cjm74vjC17coqkAOuRCw7nahJKK+0iviOToa0Bzbc7uGbaP6c0S5GRTOCG34g679wJzBIrgdwuy3792D/lzwaV3sCdctH3RY/I+KltKXL85UaKnwSLqycs1dtugAKgtHTXgZ9z4nKei79t5EBpxdsUbNQRGvaz04PefzLKUl7z8XFcbUiesetRxf455uf2qCNw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c0e51b-1fbd-43bd-22cf-08d8742dc0b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2020 12:51:52.5955
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SS/WmiXmC28VqWCDtk5r4YBwjMxjl4JsycqTzejjqlwlVbMgmWU3voMesTgCu573JTyf9iOSit4RconyBRM558TIP3iznBpxIysrhpwiErA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2811
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi All,

Please drop this patch, Will send V2 for this. I have missed adding CONFIG_=
PINCTRL_PFC_R8A77960  for automotive parts.
Sorry for the inconvenience.

Regards,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 19 October 2020 13:43
> To: Linus Walleij <linus.walleij@linaro.org>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; Geert Uytterhoeven
> <geert+renesas@glider.be>; linux-renesas-soc@vger.kernel.org; linux-
> gpio@vger.kernel.org; Chris Paterson <Chris.Paterson2@renesas.com>; Biju
> Das <biju.das@bp.renesas.com>; Prabhakar Mahadev Lad
> <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Subject: [PATCH 2/6] pinctrl: renesas: r8a7796: Optimize pinctrl image si=
ze for
> R8A774A1
>=20
> This driver supports both RZ/G2M and R-Car M3-W/W+(R8A7796[0|1]) SoC's.
> Optimize pinctrl image size for RZ/G2M, when R-Car M3-
> W/W+(R8A7796[0|1]) SoC's are disabled in the defconfig.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/pinctrl/renesas/pfc-r8a7796.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/pinctrl/renesas/pfc-r8a7796.c
> b/drivers/pinctrl/renesas/pfc-r8a7796.c
> index 55f0344a3d3e..65bb8b3c62d4 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a7796.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a7796.c
> @@ -1831,6 +1831,7 @@ static const unsigned int canfd1_data_mux[] =3D {
>  	CANFD1_TX_MARK,         CANFD1_RX_MARK,
>  };
>=20
> +#ifdef CONFIG_PINCTRL_PFC_R8A77961
>  /* - DRIF0 -------------------------------------------------------------=
-- */  static
> const unsigned int drif0_ctrl_a_pins[] =3D {
>  	/* CLK, SYNC */
> @@ -2045,6 +2046,7 @@ static const unsigned int drif3_data1_b_pins[] =3D =
{
> static const unsigned int drif3_data1_b_mux[] =3D {
>  	RIF3_D1_B_MARK,
>  };
> +#endif
>=20
>  /* - DU ----------------------------------------------------------------=
----- */  static
> const unsigned int du_rgb666_pins[] =3D { @@ -4133,7 +4135,9 @@ static co=
nst
> unsigned int vin5_clk_mux[] =3D {
>=20
>  static const struct {
>  	struct sh_pfc_pin_group common[316];
> +#ifdef CONFIG_PINCTRL_PFC_R8A77961
>  	struct sh_pfc_pin_group automotive[30];
> +#endif
>  } pinmux_groups =3D {
>  	.common =3D {
>  		SH_PFC_PIN_GROUP(audio_clk_a_a),
> @@ -4453,6 +4457,7 @@ static const struct {
>  		SH_PFC_PIN_GROUP(vin5_clkenb),
>  		SH_PFC_PIN_GROUP(vin5_clk),
>  	},
> +#ifdef CONFIG_PINCTRL_PFC_R8A77961
>  	.automotive =3D {
>  		SH_PFC_PIN_GROUP(drif0_ctrl_a),
>  		SH_PFC_PIN_GROUP(drif0_data0_a),
> @@ -4485,6 +4490,7 @@ static const struct {
>  		SH_PFC_PIN_GROUP(drif3_data0_b),
>  		SH_PFC_PIN_GROUP(drif3_data1_b),
>  	}
> +#endif
>  };
>=20
>  static const char * const audio_clk_groups[] =3D { @@ -4543,6 +4549,7 @@
> static const char * const canfd1_groups[] =3D {
>  	"canfd1_data",
>  };
>=20
> +#ifdef CONFIG_PINCTRL_PFC_R8A77961
>  static const char * const drif0_groups[] =3D {
>  	"drif0_ctrl_a",
>  	"drif0_data0_a",
> @@ -4584,6 +4591,7 @@ static const char * const drif3_groups[] =3D {
>  	"drif3_data0_b",
>  	"drif3_data1_b",
>  };
> +#endif
>=20
>  static const char * const du_groups[] =3D {
>  	"du_rgb666",
> @@ -4997,7 +5005,9 @@ static const char * const vin5_groups[] =3D {
>=20
>  static const struct {
>  	struct sh_pfc_function common[50];
> +#ifdef CONFIG_PINCTRL_PFC_R8A77961
>  	struct sh_pfc_function automotive[4];
> +#endif
>  } pinmux_functions =3D {
>  	.common =3D {
>  		SH_PFC_FUNCTION(audio_clk),
> @@ -5051,12 +5061,14 @@ static const struct {
>  		SH_PFC_FUNCTION(vin4),
>  		SH_PFC_FUNCTION(vin5),
>  	},
> +#ifdef CONFIG_PINCTRL_PFC_R8A77961
>  	.automotive =3D {
>  		SH_PFC_FUNCTION(drif0),
>  		SH_PFC_FUNCTION(drif1),
>  		SH_PFC_FUNCTION(drif2),
>  		SH_PFC_FUNCTION(drif3),
>  	}
> +#endif
>  };
>=20
>  static const struct pinmux_cfg_reg pinmux_config_regs[] =3D {
> --
> 2.17.1

