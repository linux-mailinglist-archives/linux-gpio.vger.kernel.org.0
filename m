Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1F125858F
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Sep 2020 04:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbgIACPg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 22:15:36 -0400
Received: from mail-eopbgr20051.outbound.protection.outlook.com ([40.107.2.51]:52740
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725993AbgIACPe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 31 Aug 2020 22:15:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBcSf7HwfPDYUGZZSCeno7Os6rBJOct4ssTGV7mOFHo/xvN0vKc1Kvl9cfhY05O+QeUg3BxdVls79S15Dd8eDGrkM5AkIBwVP0RJGPa3at+v+uq4reC4PgaMfn9+XyXMgKOry02dFeEvfFv82Gm9gWXmuWUkDPeqmSpZQ1TPELXchS9vIko27U50CySUkV9d3SSBNC8m1wne6342hkkP35xOkMvj1KKQg25WRdgMzqA5lrnMtt5nzH4J5jMY/EfDAz58AkEvbcoiI8tK2JXAxAlR90gOG4MOMUVc140WALcd78ONisfPanGeATVuR6o7K92r7gQTrFoCM7g/T4zp3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4LX9EVgA9XQoSSZWHvVRSQ7EO+12VFI5wVEqELarRI=;
 b=TAjoY94eTC5lp/jhRUSTRCCXnM46AkiL/OsKtQhpOaB2TlRNsg6Qh/InDXe/1thKYo8LedYVon+hw4Ugw8c973/a327rSnMfBhgcSTQ7XRAmEBPea8eqRzE1YCbPO8SupU9C38BpTo0ZALZKgGv0KHEsYzAFXr57aOHUHuAThzcZEizM/juSf+gVM+CN6Ns36qK7AKWqqOKSayKE5p9beTk/+f1aS47/hMpTY37YAOKYS3Dvtucm1alAJmkRrdc+6Lt22uTTxCXw82YJUm635xt0adSxGFTDH/fZYe28uWn1cSc9SSeLDSmh/vo25cBNpz4oTHROhuZN6A3kWBKjiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4LX9EVgA9XQoSSZWHvVRSQ7EO+12VFI5wVEqELarRI=;
 b=CxxeUPillwCSZPgUo+J7qsawvriu+uslThmtQfsOt0z9o5Vhk8uSqBBtHo4c5dV4N4Og9DuHIZ+IvD+8FyRIXc78IPqaAaes3D2yvibNr11UAtBOuvCp2nOdEdg7SyC1aiaUXjbYwXXYNoSCDsBJnEwANM7MnYsdvgJoHqVozR0=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB7PR04MB4491.eurprd04.prod.outlook.com (2603:10a6:5:34::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Tue, 1 Sep
 2020 02:15:29 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::9c75:8bb2:aff6:450d]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::9c75:8bb2:aff6:450d%3]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 02:15:29 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Anson Huang <anson.huang@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 1/2] pinctrl: imx: Support building SCU pinctrl driver as
 module
Thread-Topic: [PATCH 1/2] pinctrl: imx: Support building SCU pinctrl driver as
 module
Thread-Index: AQHWW4NHWrU0ATUAm0ydC8gIz0Rl9alTVGrg
Date:   Tue, 1 Sep 2020 02:15:29 +0000
Message-ID: <DB3PR0402MB39161BB4BB9268894E19610DF52E0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1594912013-20859-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1594912013-20859-1-git-send-email-Anson.Huang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 41d56231-fbba-48a4-7de6-08d84e1ce5cb
x-ms-traffictypediagnostic: DB7PR04MB4491:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4491A7CDFA1928298FB179B6F52E0@DB7PR04MB4491.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lZRGZEn4zJmVTI1xQHmIXdLy8TY5j3Z5dxP4QyVW7wLSPB3ZgKjlCZjTyRrMXcsXFMLJLcEtYCYkZPt2W3e2WL66N7afWzQYqvICBbp4+9ri/rkgx1Ox+YnOaycSqgWI7ujoW2m6Cmn7FqKUQWAmtK7zKz+kTTS7jfNlSrGQF/8HhFw1tZ4VgtULvmZW46uM2YUyW4P2m1HBFKrVIAisV7gQlfXHpknybmm9/vpjdTkLfzZqXOoDd4tySxpewZaxz1dnKhtW9ZJn7VwtyFr6b/orB3SKd82GeEnQ9Ua7X9fxLGHQtl2oZoM8LfLABEEtJTQxbGCVNZ6lsLmzIpO0nn92H325S5mjWnLxyf6fy+IO8nrtMsSTleVMGKMrw86d
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(66946007)(5660300002)(8676002)(86362001)(33656002)(66476007)(8936002)(44832011)(83380400001)(76116006)(7696005)(9686003)(4326008)(66446008)(478600001)(64756008)(52536014)(66556008)(316002)(2906002)(26005)(110136005)(71200400001)(55016002)(186003)(6506007)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: uOzaFj/hUcXCtyI2YpeDO42kT+yDCPAgUUIFqNqdq0NujqC+VPT6xKBrYTvFEUJ/AtQgIP1g8UlCpSTKP9ZMYFoy/nzmIOcclJxABTBa+d+V7SQWKjt0c7MwBG3FRKwDXpNVcsNGw8e4U+iFKm5yHvCu6IXj3I0sBlsPZumGTvbTFkyBRwzUWLK7Kt0opAPnBSBgjw3+zEpZA52tIKO/fsWH5VCDgiUq81lMjvyMBcikx1Jn6eBZKo3PXbV4jfnbU01pelR+dn684hFa85SCFEx/KGzbzylb2SVf3rVPL7zJlGSR2PtzxLh+msZ2cCtShiKFfH8IwE/lYOnpL8sy+A7fGOSz4g/856qi3X2BLOa3aNtCYjS15Mz/vKFP+f547/SVVATFu0OXaM1GIJTXMyoAaWu5dp0C4WyOSkv9FpQzuuj4feGPKzLtaXtLUygOMDOMSnao9Vz38EL0ZQ9Sbf293tQVucbKSGJ1KmTQ7+omilJbv35EiqO5tlEJaqT/o+cpiEYgu76cV7EL/IXIONPGCTtIBlxN6eYb46jXf9uIBMa6Zy9vF/xQr+L9tXqxbU/Avgszpkqo1dC4c/w0MVyw2kpPWkYJ6yTAX7Lovcug0ABu2FCaAtnB/qwogvq+M78Kqpdl/xT864APQ21/OQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d56231-fbba-48a4-7de6-08d84e1ce5cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2020 02:15:29.3434
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sA+OwaB639qwFjAkEXXyVF7/mHG7KYY30GNXdbGwgcc8hPEpu5xG68RWA/c76xDOtbCu8kQ9zKp4BTudR32LGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4491
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Gentle ping...

> Subject: [PATCH 1/2] pinctrl: imx: Support building SCU pinctrl driver as
> module
>=20
> To support building i.MX SCU pinctrl driver as module, below things need =
to be
> changed:
>=20
>     - Export SCU related functions and use "IS_ENABLED" instead of
>       "ifdef" to support SCU pinctrl driver user and itself to be
>       built as module;
>     - Use function callbacks for SCU related functions in pinctrl-imx.c
>       in order to support the scenario of PINCTRL_IMX is built in
>       while PINCTRL_IMX_SCU is built as module;
>     - All drivers using SCU pinctrl driver need to initialize the
>       SCU related function callback;
>     - Change PINCTR_IMX_SCU to tristate;
>     - Add module author, description and license.
>=20
> With above changes, i.MX SCU pinctrl driver can be built as module.
>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/pinctrl/freescale/Kconfig           |  2 +-
>  drivers/pinctrl/freescale/pinctrl-imx.c     |  8 ++--
>  drivers/pinctrl/freescale/pinctrl-imx.h     | 57 ++++++++++++-----------=
------
>  drivers/pinctrl/freescale/pinctrl-imx8dxl.c |  3 ++
> drivers/pinctrl/freescale/pinctrl-imx8qm.c  |  3 ++
> drivers/pinctrl/freescale/pinctrl-imx8qxp.c |  3 ++
>  drivers/pinctrl/freescale/pinctrl-scu.c     |  5 +++
>  7 files changed, 42 insertions(+), 39 deletions(-)
>=20
> diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescal=
e/Kconfig
> index 08fcf5c..570355c 100644
> --- a/drivers/pinctrl/freescale/Kconfig
> +++ b/drivers/pinctrl/freescale/Kconfig
> @@ -7,7 +7,7 @@ config PINCTRL_IMX
>  	select REGMAP
>=20
>  config PINCTRL_IMX_SCU
> -	bool
> +	tristate "IMX SCU pinctrl driver"
>  	depends on IMX_SCU
>  	select PINCTRL_IMX
>=20
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c
> b/drivers/pinctrl/freescale/pinctrl-imx.c
> index 507e4af..b80c450 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> @@ -373,7 +373,7 @@ static int imx_pinconf_get(struct pinctrl_dev *pctlde=
v,
>  	const struct imx_pinctrl_soc_info *info =3D ipctl->info;
>=20
>  	if (info->flags & IMX_USE_SCU)
> -		return imx_pinconf_get_scu(pctldev, pin_id, config);
> +		return info->imx_pinconf_get(pctldev, pin_id, config);
>  	else
>  		return imx_pinconf_get_mmio(pctldev, pin_id, config);  } @@
> -423,7 +423,7 @@ static int imx_pinconf_set(struct pinctrl_dev *pctldev,
>  	const struct imx_pinctrl_soc_info *info =3D ipctl->info;
>=20
>  	if (info->flags & IMX_USE_SCU)
> -		return imx_pinconf_set_scu(pctldev, pin_id,
> +		return info->imx_pinconf_set(pctldev, pin_id,
>  					   configs, num_configs);
>  	else
>  		return imx_pinconf_set_mmio(pctldev, pin_id, @@ -440,7 +440,7
> @@ static void imx_pinconf_dbg_show(struct pinctrl_dev *pctldev,
>  	int ret;
>=20
>  	if (info->flags & IMX_USE_SCU) {
> -		ret =3D imx_pinconf_get_scu(pctldev, pin_id, &config);
> +		ret =3D info->imx_pinconf_get(pctldev, pin_id, &config);
>  		if (ret) {
>  			dev_err(ipctl->dev, "failed to get %s pinconf\n",
>  				pin_get_name(pctldev, pin_id));
> @@ -629,7 +629,7 @@ static int imx_pinctrl_parse_groups(struct
> device_node *np,
>  	for (i =3D 0; i < grp->num_pins; i++) {
>  		pin =3D &((struct imx_pin *)(grp->data))[i];
>  		if (info->flags & IMX_USE_SCU)
> -			imx_pinctrl_parse_pin_scu(ipctl, &grp->pins[i],
> +			info->imx_pinctrl_parse_pin(ipctl, &grp->pins[i],
>  						  pin, &list);
>  		else
>  			imx_pinctrl_parse_pin_mmio(ipctl, &grp->pins[i], diff --git
> a/drivers/pinctrl/freescale/pinctrl-imx.h
> b/drivers/pinctrl/freescale/pinctrl-imx.h
> index 333d32b..bdb86c2 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.h
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.h
> @@ -75,6 +75,21 @@ struct imx_cfg_params_decode {
>  	bool invert;
>  };
>=20
> +/**
> + * @dev: a pointer back to containing device
> + * @base: the offset to the controller in virtual memory  */ struct
> +imx_pinctrl {
> +	struct device *dev;
> +	struct pinctrl_dev *pctl;
> +	void __iomem *base;
> +	void __iomem *input_sel_base;
> +	const struct imx_pinctrl_soc_info *info;
> +	struct imx_pin_reg *pin_regs;
> +	unsigned int group_index;
> +	struct mutex mutex;
> +};
> +
>  struct imx_pinctrl_soc_info {
>  	const struct pinctrl_pin_desc *pins;
>  	unsigned int npins;
> @@ -98,21 +113,13 @@ struct imx_pinctrl_soc_info {
>  				  struct pinctrl_gpio_range *range,
>  				  unsigned offset,
>  				  bool input);
> -};
> -
> -/**
> - * @dev: a pointer back to containing device
> - * @base: the offset to the controller in virtual memory
> - */
> -struct imx_pinctrl {
> -	struct device *dev;
> -	struct pinctrl_dev *pctl;
> -	void __iomem *base;
> -	void __iomem *input_sel_base;
> -	const struct imx_pinctrl_soc_info *info;
> -	struct imx_pin_reg *pin_regs;
> -	unsigned int group_index;
> -	struct mutex mutex;
> +	int (*imx_pinconf_get)(struct pinctrl_dev *pctldev, unsigned int pin_id=
,
> +			       unsigned long *config);
> +	int (*imx_pinconf_set)(struct pinctrl_dev *pctldev, unsigned int pin_id=
,
> +			       unsigned long *configs, unsigned int num_configs);
> +	void (*imx_pinctrl_parse_pin)(struct imx_pinctrl *ipctl,
> +				      unsigned int *pin_id, struct imx_pin *pin,
> +				      const __be32 **list_p);
>  };
>=20
>  #define IMX_CFG_PARAMS_DECODE(p, m, o) \ @@ -137,7 +144,7 @@ struct
> imx_pinctrl {  int imx_pinctrl_probe(struct platform_device *pdev,
>  			const struct imx_pinctrl_soc_info *info);
>=20
> -#ifdef CONFIG_PINCTRL_IMX_SCU
> +#if IS_ENABLED(CONFIG_PINCTRL_IMX_SCU)
>  #define BM_PAD_CTL_GP_ENABLE		BIT(30)
>  #define BM_PAD_CTL_IFMUX_ENABLE		BIT(31)
>  #define BP_PAD_CTL_IFMUX		27
> @@ -150,23 +157,5 @@ int imx_pinconf_set_scu(struct pinctrl_dev *pctldev,
> unsigned pin_id,  void imx_pinctrl_parse_pin_scu(struct imx_pinctrl *ipct=
l,
>  			       unsigned int *pin_id, struct imx_pin *pin,
>  			       const __be32 **list_p);
> -#else
> -static inline int imx_pinconf_get_scu(struct pinctrl_dev *pctldev,
> -				      unsigned pin_id, unsigned long *config)
> -{
> -	return -EINVAL;
> -}
> -static inline int imx_pinconf_set_scu(struct pinctrl_dev *pctldev,
> -				      unsigned pin_id, unsigned long *configs,
> -				      unsigned num_configs)
> -{
> -	return -EINVAL;
> -}
> -static inline void imx_pinctrl_parse_pin_scu(struct imx_pinctrl *ipctl,
> -					    unsigned int *pin_id,
> -					    struct imx_pin *pin,
> -					    const __be32 **list_p)
> -{
> -}
>  #endif
>  #endif /* __DRIVERS_PINCTRL_IMX_H */
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx8dxl.c
> b/drivers/pinctrl/freescale/pinctrl-imx8dxl.c
> index 12b97da..d3020c0 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx8dxl.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx8dxl.c
> @@ -159,6 +159,9 @@ static struct imx_pinctrl_soc_info imx8dxl_pinctrl_in=
fo
> =3D {
>  	.pins =3D imx8dxl_pinctrl_pads,
>  	.npins =3D ARRAY_SIZE(imx8dxl_pinctrl_pads),
>  	.flags =3D IMX_USE_SCU,
> +	.imx_pinconf_get =3D imx_pinconf_get_scu,
> +	.imx_pinconf_set =3D imx_pinconf_set_scu,
> +	.imx_pinctrl_parse_pin =3D imx_pinctrl_parse_pin_scu,
>  };
>=20
>  static const struct of_device_id imx8dxl_pinctrl_of_match[] =3D { diff -=
-git
> a/drivers/pinctrl/freescale/pinctrl-imx8qm.c
> b/drivers/pinctrl/freescale/pinctrl-imx8qm.c
> index 095acf4..8f46b940 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx8qm.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx8qm.c
> @@ -292,6 +292,9 @@ static const struct imx_pinctrl_soc_info
> imx8qm_pinctrl_info =3D {
>  	.pins =3D imx8qm_pinctrl_pads,
>  	.npins =3D ARRAY_SIZE(imx8qm_pinctrl_pads),
>  	.flags =3D IMX_USE_SCU,
> +	.imx_pinconf_get =3D imx_pinconf_get_scu,
> +	.imx_pinconf_set =3D imx_pinconf_set_scu,
> +	.imx_pinctrl_parse_pin =3D imx_pinctrl_parse_pin_scu,
>  };
>=20
>  static const struct of_device_id imx8qm_pinctrl_of_match[] =3D { diff --=
git
> a/drivers/pinctrl/freescale/pinctrl-imx8qxp.c
> b/drivers/pinctrl/freescale/pinctrl-imx8qxp.c
> index 81ebd4c..6776ad6 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx8qxp.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx8qxp.c
> @@ -198,6 +198,9 @@ static struct imx_pinctrl_soc_info
> imx8qxp_pinctrl_info =3D {
>  	.pins =3D imx8qxp_pinctrl_pads,
>  	.npins =3D ARRAY_SIZE(imx8qxp_pinctrl_pads),
>  	.flags =3D IMX_USE_SCU,
> +	.imx_pinconf_get =3D imx_pinconf_get_scu,
> +	.imx_pinconf_set =3D imx_pinconf_set_scu,
> +	.imx_pinctrl_parse_pin =3D imx_pinctrl_parse_pin_scu,
>  };
>=20
>  static const struct of_device_id imx8qxp_pinctrl_of_match[] =3D { diff -=
-git
> a/drivers/pinctrl/freescale/pinctrl-scu.c b/drivers/pinctrl/freescale/pin=
ctrl-scu.c
> index 9df45d3..59b5f8a 100644
> --- a/drivers/pinctrl/freescale/pinctrl-scu.c
> +++ b/drivers/pinctrl/freescale/pinctrl-scu.c
> @@ -7,6 +7,7 @@
>=20
>  #include <linux/err.h>
>  #include <linux/firmware/imx/sci.h>
> +#include <linux/module.h>
>  #include <linux/of_address.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/platform_device.h>
> @@ -123,3 +124,7 @@ void imx_pinctrl_parse_pin_scu(struct imx_pinctrl
> *ipctl,
>  		pin_scu->mux_mode, pin_scu->config);
>  }
>  EXPORT_SYMBOL_GPL(imx_pinctrl_parse_pin_scu);
> +
> +MODULE_AUTHOR("Dong Aisheng <aisheng.dong@nxp.com>");
> +MODULE_DESCRIPTION("NXP i.MX SCU common pinctrl driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.7.4

