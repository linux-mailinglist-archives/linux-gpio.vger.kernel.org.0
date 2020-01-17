Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAE4F140704
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2020 10:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgAQJ5O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 04:57:14 -0500
Received: from mail1.bemta26.messagelabs.com ([85.158.142.116]:36088 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726053AbgAQJ5M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jan 2020 04:57:12 -0500
Received: from [85.158.142.201] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 55/99-30125-3F4812E5; Fri, 17 Jan 2020 09:57:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSfUxbZRTGee+9LRekcikwjg2toRvGDFpAiLl
  GFwnMiGaaObZMDWPewoVW24JtyWDyB3SbCAvjw6HbHNJBlUkZEzAMWBGGlY8tG5ENimSz6pAB
  dUAGfjSraNvbTf3vd57nvOd9cnJIXDjLF5FssYHVaRm1lB9MKBPIp2Vrh2OyE5dHYugm2zUe3
  dbQR9CO375F9HF3K0Z3N7kRfb3/NJ9e7Z/C6SMDtsBUMqOrrZKfcXPays+o+SsxY61LspN4k6
  fSKgqK3+Ipb/TdCSx0KYqPmy1YGXp/VxUKJhH1GQ5u1yCfK0YIsN8yBXJFN4L71S6fQ1BjOIy
  2LOHeQkjVYVAz852/uIXAWGZEVSiI5FM0fDj2o+9JBHUWg/O3R3zDcMqJwOGcw6oQSYZTz8PU
  6CbvgwgqFf7ureBz/BRcOPwl4WWCioX5sUrMywJqHzTW/exjIaWGujPegEFkEPUcHBu+7NMRJ
  Yb1cgvuZZyKgtm5Jp8OFAVm6wTOcSQs3t7gcf0sjBtnEKfHw1X7nJ+l8Gmjzc9imGw66udXoG
  K9heeND9RWaK/ncTIN5qNHCE7eAhvDJZyshlXXkL/lCZgot/M5jgar7Qvf3oDqIeCnMQtWixJ
  O/Sc1x/FguniPz3EcfH7GiZ/ybSIMxk/OESZEtCFaoVPlKw0aRqWWJSUmypKSkmUpsuREOXNQ
  ppCzRbIcVmvQMR5TzhzQy/Ulmhx1rlzLGrqQ58By3yUkvaj+97vyYfQYiUkjBRFWcbbwUUVBb
  omS0Sv364rUrH4YRZOkFASl5THZwjAdm88W56nUnjN9YAMZIo0Q7DV6bIG+kNHoVfmcdRklk7
  WLjc04Od5mbsaFhLZAy4qiBCXeVsrbqizSPhz04OQnkVgULkABAQHCkEJWp1EZ/u8voSgSScM
  FRYc8U0JUWsPD/5Y8UTBPlNp0iTeKgfnXEpVhVe2HLqV/tacl59KuycFeVxi5/yT62Ny+2WI9
  azQWn1u8GJkX3Dm4U3Qn4RFdZi6PdKRErKt3kA3V1cz9+lanO9ohSuv/RJLTnHe1vM+w75dQK
  vbuwlJ7/xC9kOnI1JpKFYoTW+zu5Y6ECck7v14fdraee2k9dKPi5eTovW+kRU9fW7BYVk840t
  7eJvne+LVt7d5AbtWEMzXrhl1c8SKjyv6jsqYzNLYjXr60sn27BOqmfkiNe/1A1saK+IOVuM6
  sgflnB63n3SnmyM098o73dty8cOXVP2PmS6Wm0N3pL3TzjhW9NqT5aGV0enkbFtdzuq9hz+5g
  senJZ+jZTTNXDtZ887iU0CuZpK24Ts/8A7bxKjltBAAA
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-34.tower-246.messagelabs.com!1579255027!261946!1
X-Originating-IP: [104.47.8.54]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.25; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15736 invoked from network); 17 Jan 2020 09:57:07 -0000
Received: from mail-am5eur03lp2054.outbound.protection.outlook.com (HELO EUR03-AM5-obe.outbound.protection.outlook.com) (104.47.8.54)
  by server-34.tower-246.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2020 09:57:07 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIzOpt69ciQ1rAwidTU/m83slNqGsskyhDih2A5n9CJZG5vqtOqJ66SMGSDGcrBSEBUrJw54dPK6czqRJpnjTJ8l+6Kah/joDci+7XOJwcHX8sL7Iiv1dHPqCSlWMkPdUNbcrnZYeLNpvp5SSGwlC4Duu5dVkgz+SCZ5y1Ia5f5qWLVec73Zf9Uvxanwm6DV3FjcbS5NQCtfKhcbPHrSTAIW4i4n0qAfwNki/YtBIm4CpGwImhKoQMoFHoVyQ6WYgpnNSp8raZnfVMp5saHNYotCdZSxeFoWquo1wDbpdvP53MwgXmBAmECwGYEscKeAL3V1BZ13QjZbp6n8WpI92A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGP8Zpk6IkqkpqTuj5vxLQfzpZOnYX6n4kvb1vT9QyU=;
 b=W52nfoWCrqv8n7PFa1YZNlo7NZN8OCr8XbBI5EpJzqc9g+CN/24RBd/j3dBixHAWjLWw+ajwXvbpxOj0nUaCpuxXqoM6cT0pTIQkSZY1VmKnHsR/SsuzncU8oTiATy5DwM23xRiUsoY6aW9GRkSb3pNLhvZA1XqybUYwzNUu0p32fvKFTo96B58ne6B9STShfJCUzZH0/TCJB9v7pmAEogIXib/W/xukl/wcBEeQEjRRguWwqE4asXqZBEutzqn95PQRdvcbb8dGQEtPRpCsSEBFw5efQ4NF1a7jlUbC0Zu6rZ1+qTyTaLa/KhWnHmS4Xro6ELBcRawxdmfFp67tAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGP8Zpk6IkqkpqTuj5vxLQfzpZOnYX6n4kvb1vT9QyU=;
 b=Is0dpCvJNszTFWu20H1HEtPZTguO8+LwHNMpUUADU0l+ydRa5YapX1SQsGKvTE/o3Us9a9r39Q6JaQ+MdCCDhyot0BVVadCR0RXXBUt1kJTkWVYjlEZWWo5ODS18a/IrFfSJhA3NWnD+uaOHy74E2cc5SC7Fis3PA4rRHSNjbXk=
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM (20.177.116.141) by
 AM6PR10MB2455.EURPRD10.PROD.OUTLOOK.COM (20.177.115.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.18; Fri, 17 Jan 2020 09:57:06 +0000
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9be:9fca:6def:97c3]) by AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9be:9fca:6def:97c3%5]) with mapi id 15.20.2623.018; Fri, 17 Jan 2020
 09:57:06 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH v4 3/3] pinctrl: da9062: add driver support
Thread-Topic: [PATCH v4 3/3] pinctrl: da9062: add driver support
Thread-Index: AQHVxhEh3oRaMtPqJkigzFB/6GafmafurMkA
Date:   Fri, 17 Jan 2020 09:57:06 +0000
Message-ID: <AM6PR10MB2263733CA8E02F39A647258D80310@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
References: <20200108104746.1765-1-m.felsch@pengutronix.de>
 <20200108104746.1765-4-m.felsch@pengutronix.de>
In-Reply-To: <20200108104746.1765-4-m.felsch@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2df1dad0-e0eb-4e80-1e62-08d79b339c47
x-ms-traffictypediagnostic: AM6PR10MB2455:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB24553EA7CE8A30C4539AFC81A7310@AM6PR10MB2455.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0285201563
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(346002)(39850400004)(376002)(136003)(396003)(199004)(189003)(2906002)(33656002)(966005)(55016002)(316002)(9686003)(30864003)(186003)(478600001)(53546011)(7696005)(110136005)(6506007)(26005)(8936002)(66946007)(66446008)(66556008)(81156014)(81166006)(4326008)(54906003)(76116006)(55236004)(52536014)(64756008)(71200400001)(5660300002)(86362001)(66476007)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR10MB2455;H:AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P78n8WArwaEglqdtZ1WDQpEGBPw5fm8zrRiCGpOBrXNBdWZ41mO0CjOrDnkRLO/gltxR973vTmHKHX+eVIxJUNtO4FunyddjofnvThowWXf3AUfoCs7C3Hfjzp5PKgp0dVnU2Flah/BBJewyp0rW3l4yy+rUrZtK2AMy+1pkI8NQX2CeHlJ+DeuKLmFDKdhxFVKgAM8kLOsVXpaPAJV4nchTWhhOmYAxKR5Le4h6+BRlddQZ0ihSAMzNv21cuHIyYf6/fbf3cfBu3W//66SE6HxlyDiUYJREBbGFA5BkbK7oKgXqw68kp1V/0eho0vqFkf+yTpuqHUOspeZpnisUbQF89ln6UlLetUrbekerdrf7GnsWqr9zktxfyo2yjp1K6ya5iFltgO2RRJlutOBtqK8UdhuOJuZRD7ne+hO8Z0b6l+bNbkjhDdBAOiqExVpna4Ez8SseZlvr02aWWE1IugD3/lSJ3xlyV/Mp2XZjHD4=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df1dad0-e0eb-4e80-1e62-08d79b339c47
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2020 09:57:06.3048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9eVDWkvW+ShMulIYK6iAJ162XvjExqfezxlXAsStuCJ/SGmPg8gzRTXVAHlSMcfxpLMUAKoKVoTz4p3cCPWZUpIUNvEbCfui2hp9SuDxu5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2455
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08 January 2020 10:48, Marco Felsch wrote:

> The DA9062 is a mfd pmic device which supports 5 GPIOs. The GPIOs can
> be used as input, output or have a special use-case.
>=20
> The patch adds the support for the normal input/output use-case.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

A little late, but:

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
> Changelog:
> v4:
> - add missing PIN_CONFIG_BIAS_DISABLE
>=20
> v3:
> - add comment for gpio private include
> - add missing bits.h include
> - add pin_config state container and set initial pin state to push-pull
> - make use of GPIO_LINE_DIRECTION_{IN,OUT}
> - update MAINTAINERS entry -> gpio-da90??.c already covered but not
>   pinctrl-da90??.c
>=20
> v2:
> - fix minor style issue
> - move from drivers/gpio to drivers/pinctrl
> - Fix spelling issue
> - rename local gpio_dir to gpio_mode
> - Add datasheet reference and TODO notes
> - move gpio to mfd-root node to avoid hierarchical interrupt chips
> - Add gpio-controller property check
> - remove of_device_id since we drop the gpio of-subnode
> - Drop da9062_gpio_get_hwgpio
> ---
>  MAINTAINERS                      |   1 +
>  drivers/pinctrl/Kconfig          |  12 ++
>  drivers/pinctrl/Makefile         |   1 +
>  drivers/pinctrl/pinctrl-da9062.c | 300 +++++++++++++++++++++++++++++++
>  4 files changed, 314 insertions(+)
>  create mode 100644 drivers/pinctrl/pinctrl-da9062.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bd5847e802de..9692ff05cd14 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4867,6 +4867,7 @@ F:	drivers/leds/leds-da90??.c
>  F:	drivers/mfd/da903x.c
>  F:	drivers/mfd/da90??-*.c
>  F:	drivers/mfd/da91??-*.c
> +F:	drivers/pinctrl/pinctrl-da90??.c
>  F:	drivers/power/supply/da9052-battery.c
>  F:	drivers/power/supply/da91??-*.c
>  F:	drivers/regulator/da903x.c
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 3bfbf2ff6e2b..88a3864f32a5 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -126,6 +126,18 @@ config PINCTRL_DA850_PUPD
>  	  Driver for TI DA850/OMAP-L138/AM18XX pinconf. Used to control
>  	  pullup/pulldown pin groups.
>=20
> +config PINCTRL_DA9062
> +	tristate "Dialog Semiconductor DA9062 PMIC pinctrl and GPIO Support"
> +	depends on MFD_DA9062
> +	select GPIOLIB
> +	help
> +	  The Dialog DA9062 PMIC provides multiple GPIOs that can be muxed for
> +	  different functions. This driver bundles a pinctrl driver to select t=
he
> +	  function muxing and a GPIO driver to handle the GPIO when the GPIO
> +	  function is selected.
> +
> +	  Say yes to enable pinctrl and GPIO support for the DA9062 PMIC.
> +
>  config PINCTRL_DIGICOLOR
>  	bool
>  	depends on OF && (ARCH_DIGICOLOR || COMPILE_TEST)
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index 879f312bfb75..0b36a1cfca8a 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -16,6 +16,7 @@ obj-$(CONFIG_PINCTRL_AT91PIO4)	+=3D pinctrl-at91-
> pio4.o
>  obj-$(CONFIG_PINCTRL_AMD)	+=3D pinctrl-amd.o
>  obj-$(CONFIG_PINCTRL_BM1880)	+=3D pinctrl-bm1880.o
>  obj-$(CONFIG_PINCTRL_DA850_PUPD) +=3D pinctrl-da850-pupd.o
> +obj-$(CONFIG_PINCTRL_DA9062)	+=3D pinctrl-da9062.o
>  obj-$(CONFIG_PINCTRL_DIGICOLOR)	+=3D pinctrl-digicolor.o
>  obj-$(CONFIG_PINCTRL_FALCON)	+=3D pinctrl-falcon.o
>  obj-$(CONFIG_PINCTRL_GEMINI)	+=3D pinctrl-gemini.o
> diff --git a/drivers/pinctrl/pinctrl-da9062.c b/drivers/pinctrl/pinctrl-d=
a9062.c
> new file mode 100644
> index 000000000000..f704ee0b2fd9
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-da9062.c
> @@ -0,0 +1,300 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Dialog DA9062 pinctrl and GPIO driver.
> + * Based on DA9055 GPIO driver.
> + *
> + * TODO:
> + *   - add pinmux and pinctrl support (gpio alternate mode)
> + *
> + * Documents:
> + * [1] https://www.dialog-
> semiconductor.com/sites/default/files/da9062_datasheet_3v6.pdf
> + *
> + * Copyright (C) 2019 Pengutronix, Marco Felsch <kernel@pengutronix.de>
> + */
> +#include <linux/bits.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <linux/gpio/driver.h>
> +
> +#include <linux/mfd/da9062/core.h>
> +#include <linux/mfd/da9062/registers.h>
> +
> +/*
> + * We need this get the gpio_desc from a <gpio_chip,offset> tuple to dec=
ide if
> + * the gpio is active low without a vendor specific dt-binding.
> + */
> +#include <../gpio/gpiolib.h>
> +
> +#define DA9062_TYPE(offset)		(4 * (offset % 2))
> +#define DA9062_PIN_SHIFT(offset)	(4 * (offset % 2))
> +#define DA9062_PIN_ALTERNATE		0x00 /* gpio alternate mode */
> +#define DA9062_PIN_GPI			0x01 /* gpio in */
> +#define DA9062_PIN_GPO_OD		0x02 /* gpio out open-drain */
> +#define DA9062_PIN_GPO_PP		0x03 /* gpio out push-pull */
> +#define DA9062_GPIO_NUM			5
> +
> +struct da9062_pctl {
> +	struct da9062 *da9062;
> +	struct gpio_chip gc;
> +	unsigned int pin_config[DA9062_GPIO_NUM];
> +};
> +
> +static int da9062_pctl_get_pin_mode(struct da9062_pctl *pctl,
> +				    unsigned int offset)
> +{
> +	struct regmap *regmap =3D pctl->da9062->regmap;
> +	int ret, val;
> +
> +	ret =3D regmap_read(regmap, DA9062AA_GPIO_0_1 + (offset >> 1), &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	val >>=3D DA9062_PIN_SHIFT(offset);
> +	val &=3D DA9062AA_GPIO0_PIN_MASK;
> +
> +	return val;
> +}
> +
> +static int da9062_pctl_set_pin_mode(struct da9062_pctl *pctl,
> +				    unsigned int offset, unsigned int mode_req)
> +{
> +	struct regmap *regmap =3D pctl->da9062->regmap;
> +	unsigned int mode =3D mode_req;
> +	unsigned int mask;
> +	int ret;
> +
> +	mode &=3D DA9062AA_GPIO0_PIN_MASK;
> +	mode <<=3D DA9062_PIN_SHIFT(offset);
> +	mask =3D DA9062AA_GPIO0_PIN_MASK << DA9062_PIN_SHIFT(offset);
> +
> +	ret =3D regmap_update_bits(regmap, DA9062AA_GPIO_0_1 + (offset >> 1),
> +				 mask, mode);
> +	if (!ret)
> +		pctl->pin_config[offset] =3D mode_req;
> +
> +	return ret;
> +}
> +
> +static int da9062_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct da9062_pctl *pctl =3D gpiochip_get_data(gc);
> +	struct regmap *regmap =3D pctl->da9062->regmap;
> +	int gpio_mode, val;
> +	int ret;
> +
> +	gpio_mode =3D da9062_pctl_get_pin_mode(pctl, offset);
> +	if (gpio_mode < 0)
> +		return gpio_mode;
> +
> +	switch (gpio_mode) {
> +	case DA9062_PIN_ALTERNATE:
> +		return -ENOTSUPP;
> +	case DA9062_PIN_GPI:
> +		ret =3D regmap_read(regmap, DA9062AA_STATUS_B, &val);
> +		if (ret < 0)
> +			return ret;
> +		break;
> +	case DA9062_PIN_GPO_OD:
> +	case DA9062_PIN_GPO_PP:
> +		ret =3D regmap_read(regmap, DA9062AA_GPIO_MODE0_4, &val);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return !!(val & BIT(offset));
> +}
> +
> +static void da9062_gpio_set(struct gpio_chip *gc, unsigned int offset,
> +			    int value)
> +{
> +	struct da9062_pctl *pctl =3D gpiochip_get_data(gc);
> +	struct regmap *regmap =3D pctl->da9062->regmap;
> +
> +	regmap_update_bits(regmap, DA9062AA_GPIO_MODE0_4, BIT(offset),
> +			   value << offset);
> +}
> +
> +static int da9062_gpio_get_direction(struct gpio_chip *gc, unsigned int =
offset)
> +{
> +	struct da9062_pctl *pctl =3D gpiochip_get_data(gc);
> +	int gpio_mode;
> +
> +	gpio_mode =3D da9062_pctl_get_pin_mode(pctl, offset);
> +	if (gpio_mode < 0)
> +		return gpio_mode;
> +
> +	switch (gpio_mode) {
> +	case DA9062_PIN_ALTERNATE:
> +		return -ENOTSUPP;
> +	case DA9062_PIN_GPI:
> +		return GPIO_LINE_DIRECTION_IN;
> +	case DA9062_PIN_GPO_OD:
> +	case DA9062_PIN_GPO_PP:
> +		return GPIO_LINE_DIRECTION_OUT;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int da9062_gpio_direction_input(struct gpio_chip *gc,
> +				       unsigned int offset)
> +{
> +	struct da9062_pctl *pctl =3D gpiochip_get_data(gc);
> +	struct regmap *regmap =3D pctl->da9062->regmap;
> +	struct gpio_desc *desc =3D gpiochip_get_desc(gc, offset);
> +	unsigned int gpi_type;
> +	int ret;
> +
> +	ret =3D da9062_pctl_set_pin_mode(pctl, offset, DA9062_PIN_GPI);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * If the gpio is active low we should set it in hw too. No worries
> +	 * about gpio_get() because we read and return the gpio-level. So the
> +	 * gpiolib active_low handling is still correct.
> +	 *
> +	 * 0 - active low, 1 - active high
> +	 */
> +	gpi_type =3D !gpiod_is_active_low(desc);
> +
> +	return regmap_update_bits(regmap, DA9062AA_GPIO_0_1 + (offset >>
> 1),
> +				DA9062AA_GPIO0_TYPE_MASK <<
> DA9062_TYPE(offset),
> +				gpi_type << DA9062_TYPE(offset));
> +}
> +
> +static int da9062_gpio_direction_output(struct gpio_chip *gc,
> +					unsigned int offset, int value)
> +{
> +	struct da9062_pctl *pctl =3D gpiochip_get_data(gc);
> +	unsigned int pin_config =3D pctl->pin_config[offset];
> +	int ret;
> +
> +	ret =3D da9062_pctl_set_pin_mode(pctl, offset, pin_config);
> +	if (ret)
> +		return ret;
> +
> +	da9062_gpio_set(gc, offset, value);
> +
> +	return 0;
> +}
> +
> +static int da9062_gpio_set_config(struct gpio_chip *gc, unsigned int off=
set,
> +				  unsigned long config)
> +{
> +	struct da9062_pctl *pctl =3D gpiochip_get_data(gc);
> +	struct regmap *regmap =3D pctl->da9062->regmap;
> +	int gpio_mode;
> +
> +	/*
> +	 * We need to meet the following restrictions [1, Figure 18]:
> +	 * - PIN_CONFIG_BIAS_PULL_DOWN -> only allowed if the pin is used as
> +	 *				  gpio input
> +	 * - PIN_CONFIG_BIAS_PULL_UP   -> only allowed if the pin is used as
> +	 *				  gpio output open-drain.
> +	 */
> +
> +	switch (pinconf_to_config_param(config)) {
> +	case PIN_CONFIG_BIAS_DISABLE:
> +		return regmap_update_bits(regmap, DA9062AA_CONFIG_K,
> +					  BIT(offset), 0);
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
> +		gpio_mode =3D da9062_pctl_get_pin_mode(pctl, offset);
> +		if (gpio_mode < 0)
> +			return -EINVAL;
> +		else if (gpio_mode !=3D DA9062_PIN_GPI)
> +			return -ENOTSUPP;
> +		return regmap_update_bits(regmap, DA9062AA_CONFIG_K,
> +					  BIT(offset), BIT(offset));
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +		gpio_mode =3D da9062_pctl_get_pin_mode(pctl, offset);
> +		if (gpio_mode < 0)
> +			return -EINVAL;
> +		else if (gpio_mode !=3D DA9062_PIN_GPO_OD)
> +			return -ENOTSUPP;
> +		return regmap_update_bits(regmap, DA9062AA_CONFIG_K,
> +					  BIT(offset), BIT(offset));
> +	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +		return da9062_pctl_set_pin_mode(pctl, offset,
> +						DA9062_PIN_GPO_OD);
> +	case PIN_CONFIG_DRIVE_PUSH_PULL:
> +		return da9062_pctl_set_pin_mode(pctl, offset,
> +						DA9062_PIN_GPO_PP);
> +	default:
> +		return -ENOTSUPP;
> +	}
> +}
> +
> +static int da9062_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct da9062_pctl *pctl =3D gpiochip_get_data(gc);
> +	struct da9062 *da9062 =3D pctl->da9062;
> +
> +	return regmap_irq_get_virq(da9062->regmap_irq,
> +				   DA9062_IRQ_GPI0 + offset);
> +}
> +
> +static const struct gpio_chip reference_gc =3D {
> +	.owner =3D THIS_MODULE,
> +	.get =3D da9062_gpio_get,
> +	.set =3D da9062_gpio_set,
> +	.get_direction =3D da9062_gpio_get_direction,
> +	.direction_input =3D da9062_gpio_direction_input,
> +	.direction_output =3D da9062_gpio_direction_output,
> +	.set_config =3D da9062_gpio_set_config,
> +	.to_irq =3D da9062_gpio_to_irq,
> +	.can_sleep =3D true,
> +	.ngpio =3D DA9062_GPIO_NUM,
> +	.base =3D -1,
> +};
> +
> +static int da9062_pctl_probe(struct platform_device *pdev)
> +{
> +	struct device *parent =3D pdev->dev.parent;
> +	struct da9062_pctl *pctl;
> +	int i;
> +
> +	pctl =3D devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
> +	if (!pctl)
> +		return -ENOMEM;
> +
> +	pctl->da9062 =3D dev_get_drvdata(parent);
> +	if (!pctl->da9062)
> +		return -EINVAL;
> +
> +	if (!device_property_present(parent, "gpio-controller"))
> +		return 0;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(pctl->pin_config); i++)
> +		pctl->pin_config[i] =3D DA9062_PIN_GPO_PP;
> +
> +	/*
> +	 * Currently the driver handles only the GPIO support. The
> +	 * pinctrl/pinmux support can be added later if needed.
> +	 */
> +	pctl->gc =3D reference_gc;
> +	pctl->gc.label =3D dev_name(&pdev->dev);
> +	pctl->gc.parent =3D &pdev->dev;
> +#ifdef CONFIG_OF_GPIO
> +	pctl->gc.of_node =3D parent->of_node;
> +#endif
> +
> +	platform_set_drvdata(pdev, pctl);
> +
> +	return devm_gpiochip_add_data(&pdev->dev, &pctl->gc, pctl);
> +}
> +
> +static struct platform_driver da9062_pctl_driver =3D {
> +	.probe =3D da9062_pctl_probe,
> +	.driver =3D {
> +		.name	=3D "da9062-gpio",
> +	},
> +};
> +module_platform_driver(da9062_pctl_driver);
> +
> +MODULE_AUTHOR("Marco Felsch <kernel@pengutronix.de>");
> +MODULE_DESCRIPTION("DA9062 PMIC pinctrl and GPIO Driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:da9062-gpio");
> --
> 2.20.1

