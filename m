Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1641F2FD1DF
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Jan 2021 14:55:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733204AbhATNle (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Jan 2021 08:41:34 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:22694 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387613AbhATNZv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Jan 2021 08:25:51 -0500
X-Greylist: delayed 529 seconds by postgrey-1.27 at vger.kernel.org; Wed, 20 Jan 2021 08:25:49 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1611148972;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:From:
        Subject:Sender;
        bh=YU/rKsjnWYPnj3nJ6KYYEFHw/ThNWuYDYVCY430vMEE=;
        b=BApUiAnoh6+9SmnPABmW2ADWtfWHMGbyR76fc44ndRvl5lhYaK610FzXQG7sOCfvZZ
        Cf8gZWal2Xeh7/KEwG5ivAyFodXdSx6uo/em+Adp73W19q0nmxgNekGCuKXr6X5gwLbe
        1TNkQ5zPC/b0kyxsSa/PccBAnQeGa+86ChFqDN+xI/n/EaSBrzitiFjyTdV2dZcXfxhw
        f4rDprrtyOOk1+LIltGMSXLdzcBLWEdj36QdMiRUaXRK6G1B/h4FKFpd9z4EZCf2g7mq
        o35dM/GYY0zBuykggvzc33tWK/bR6sVUin9em18y6lV+y89zVPwMzY/0JfDV1BU5FiJw
        JUFg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlaVXA4Fz1o="
X-RZG-CLASS-ID: mo00
Received: from [192.168.178.35]
        by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
        with ESMTPSA id m056b3x0KDDl36i
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 20 Jan 2021 14:13:47 +0100 (CET)
Subject: Re: [PATCH] pinctrl: ingenic: Improve JZ4760 support
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20210120110722.20133-1-paul@crapouillou.net>
Date:   Wed, 20 Jan 2021 14:13:46 +0100
Cc:     Linus Walleij <linus.walleij@linaro.org>, od@zcrc.me,
        linux-gpio@vger.kernel.org,
        linux-mips <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paul Boddie <paul@boddie.org.uk>,
        Lubomir Rintel <lkundrak@v3.sk>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5CD80D68-0E53-4DB8-8FA6-1A9DEF270B11@goldelico.com>
References: <20210120110722.20133-1-paul@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


> Am 20.01.2021 um 12:07 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> - Add otg function and otg-vbus group.
>=20
> - Add lcd-8bit, lcd-16bit, lcd-18bit, lcd-generic and lcd-special
>  groups. Change the lcd-24bit group so that it only selects the pins
>  that aren't in the lcd-18bit and lcd-generic groups (which breaks
>  Device Tree in theory, but there is none out there for any JZ4760
>  based board, yet). Remove the lcd-no-pins group which is just =
useless.

Does this mean it is also usless for the other Ingenic SoC?
Background: we are working on jz4730 support and have simply copied it.

>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> drivers/pinctrl/pinctrl-ingenic.c | 38 +++++++++++++++++++++++--------
> 1 file changed, 28 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c =
b/drivers/pinctrl/pinctrl-ingenic.c
> index 76fec77c5b67..f2746125b077 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -376,12 +376,21 @@ static int jz4760_cim_pins[] =3D {
> 	0x26, 0x27, 0x28, 0x29,
> 	0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f, 0x30, 0x31,
> };
> +static int jz4760_lcd_8bit_pins[] =3D {
> +	0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x4c,
> +	0x4d, 0x52, 0x53,
> +};
> +static int jz4760_lcd_16bit_pins[] =3D {
> +	0x4e, 0x4f, 0x50, 0x51, 0x56, 0x57, 0x58, 0x59,
> +};
> +static int jz4760_lcd_18bit_pins[] =3D {
> +	0x5a, 0x5b,
> +};
> static int jz4760_lcd_24bit_pins[] =3D {
> -	0x40, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47,
> -	0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d, 0x4e, 0x4f,
> -	0x50, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57,
> -	0x58, 0x59, 0x5a, 0x5b,
> +	0x40, 0x41, 0x4a, 0x4b, 0x54, 0x55,
> };
> +static int jz4760_lcd_special_pins[] =3D { 0x40, 0x41, 0x4a, 0x54 };
> +static int jz4760_lcd_generic_pins[] =3D { 0x49, };
> static int jz4760_pwm_pwm0_pins[] =3D { 0x80, };
> static int jz4760_pwm_pwm1_pins[] =3D { 0x81, };
> static int jz4760_pwm_pwm2_pins[] =3D { 0x82, };
> @@ -390,6 +399,7 @@ static int jz4760_pwm_pwm4_pins[] =3D { 0x84, };
> static int jz4760_pwm_pwm5_pins[] =3D { 0x85, };
> static int jz4760_pwm_pwm6_pins[] =3D { 0x6a, };
> static int jz4760_pwm_pwm7_pins[] =3D { 0x6b, };
> +static int jz4760_otg_pins[] =3D { 0x8a, };
>=20
> static u8 jz4760_uart3_data_funcs[] =3D { 0, 1, };
> static u8 jz4760_mmc0_1bit_a_funcs[] =3D { 1, 1, 0, };
> @@ -436,8 +446,12 @@ static const struct group_desc jz4760_groups[] =3D =
{
> 	INGENIC_PIN_GROUP("i2c0-data", jz4760_i2c0, 0),
> 	INGENIC_PIN_GROUP("i2c1-data", jz4760_i2c1, 0),
> 	INGENIC_PIN_GROUP("cim-data", jz4760_cim, 0),
> +	INGENIC_PIN_GROUP("lcd-8bit", jz4760_lcd_8bit, 0),
> +	INGENIC_PIN_GROUP("lcd-16bit", jz4760_lcd_16bit, 0),
> +	INGENIC_PIN_GROUP("lcd-18bit", jz4760_lcd_18bit, 0),
> 	INGENIC_PIN_GROUP("lcd-24bit", jz4760_lcd_24bit, 0),
> -	{ "lcd-no-pins", },
> +	INGENIC_PIN_GROUP("lcd-generic", jz4760_lcd_generic, 0),
> +	INGENIC_PIN_GROUP("lcd-special", jz4760_lcd_special, 1),
> 	INGENIC_PIN_GROUP("pwm0", jz4760_pwm_pwm0, 0),
> 	INGENIC_PIN_GROUP("pwm1", jz4760_pwm_pwm1, 0),
> 	INGENIC_PIN_GROUP("pwm2", jz4760_pwm_pwm2, 0),
> @@ -446,6 +460,7 @@ static const struct group_desc jz4760_groups[] =3D =
{
> 	INGENIC_PIN_GROUP("pwm5", jz4760_pwm_pwm5, 0),
> 	INGENIC_PIN_GROUP("pwm6", jz4760_pwm_pwm6, 0),
> 	INGENIC_PIN_GROUP("pwm7", jz4760_pwm_pwm7, 0),
> +	INGENIC_PIN_GROUP("otg-vbus", jz4760_otg, 0),
> };
>=20
> static const char *jz4760_uart0_groups[] =3D { "uart0-data", =
"uart0-hwflow", };
> @@ -477,7 +492,10 @@ static const char *jz4760_cs6_groups[] =3D { =
"nemc-cs6", };
> static const char *jz4760_i2c0_groups[] =3D { "i2c0-data", };
> static const char *jz4760_i2c1_groups[] =3D { "i2c1-data", };
> static const char *jz4760_cim_groups[] =3D { "cim-data", };
> -static const char *jz4760_lcd_groups[] =3D { "lcd-24bit", =
"lcd-no-pins", };
> +static const char *jz4760_lcd_groups[] =3D {
> +	"lcd-8bit", "lcd-16bit", "lcd-18bit", "lcd-24bit",
> +	"lcd-special", "lcd-generic",
> +};
> static const char *jz4760_pwm0_groups[] =3D { "pwm0", };
> static const char *jz4760_pwm1_groups[] =3D { "pwm1", };
> static const char *jz4760_pwm2_groups[] =3D { "pwm2", };
> @@ -486,6 +504,7 @@ static const char *jz4760_pwm4_groups[] =3D { =
"pwm4", };
> static const char *jz4760_pwm5_groups[] =3D { "pwm5", };
> static const char *jz4760_pwm6_groups[] =3D { "pwm6", };
> static const char *jz4760_pwm7_groups[] =3D { "pwm7", };
> +static const char *jz4760_otg_groups[] =3D { "otg-vbus", };
>=20
> static const struct function_desc jz4760_functions[] =3D {
> 	{ "uart0", jz4760_uart0_groups, ARRAY_SIZE(jz4760_uart0_groups), =
},
> @@ -514,6 +533,7 @@ static const struct function_desc =
jz4760_functions[] =3D {
> 	{ "pwm5", jz4760_pwm5_groups, ARRAY_SIZE(jz4760_pwm5_groups), },
> 	{ "pwm6", jz4760_pwm6_groups, ARRAY_SIZE(jz4760_pwm6_groups), },
> 	{ "pwm7", jz4760_pwm7_groups, ARRAY_SIZE(jz4760_pwm7_groups), },
> +	{ "otg", jz4760_otg_groups, ARRAY_SIZE(jz4760_otg_groups), },
> };
>=20
> static const struct ingenic_chip_info jz4760_chip_info =3D {
> @@ -648,7 +668,6 @@ static int jz4770_mac_rmii_pins[] =3D {
> 	0xa9, 0xab, 0xaa, 0xac, 0xa5, 0xa4, 0xad, 0xae, 0xa6, 0xa8,
> };
> static int jz4770_mac_mii_pins[] =3D { 0xa7, 0xaf, };
> -static int jz4770_otg_pins[] =3D { 0x8a, };
>=20
> static const struct group_desc jz4770_groups[] =3D {
> 	INGENIC_PIN_GROUP("uart0-data", jz4770_uart0_data, 0),
> @@ -747,7 +766,7 @@ static const struct group_desc jz4770_groups[] =3D =
{
> 	INGENIC_PIN_GROUP("pwm7", jz4770_pwm_pwm7, 0),
> 	INGENIC_PIN_GROUP("mac-rmii", jz4770_mac_rmii, 0),
> 	INGENIC_PIN_GROUP("mac-mii", jz4770_mac_mii, 0),
> -	INGENIC_PIN_GROUP("otg-vbus", jz4770_otg, 0),
> +	INGENIC_PIN_GROUP("otg-vbus", jz4760_otg, 0),
> };
>=20
> static const char *jz4770_uart0_groups[] =3D { "uart0-data", =
"uart0-hwflow", };
> @@ -808,7 +827,6 @@ static const char *jz4770_pwm5_groups[] =3D { =
"pwm5", };
> static const char *jz4770_pwm6_groups[] =3D { "pwm6", };
> static const char *jz4770_pwm7_groups[] =3D { "pwm7", };
> static const char *jz4770_mac_groups[] =3D { "mac-rmii", "mac-mii", };
> -static const char *jz4770_otg_groups[] =3D { "otg-vbus", };
>=20
> static const struct function_desc jz4770_functions[] =3D {
> 	{ "uart0", jz4770_uart0_groups, ARRAY_SIZE(jz4770_uart0_groups), =
},
> @@ -841,7 +859,7 @@ static const struct function_desc =
jz4770_functions[] =3D {
> 	{ "pwm6", jz4770_pwm6_groups, ARRAY_SIZE(jz4770_pwm6_groups), },
> 	{ "pwm7", jz4770_pwm7_groups, ARRAY_SIZE(jz4770_pwm7_groups), },
> 	{ "mac", jz4770_mac_groups, ARRAY_SIZE(jz4770_mac_groups), },
> -	{ "otg", jz4770_otg_groups, ARRAY_SIZE(jz4770_otg_groups), },
> +	{ "otg", jz4760_otg_groups, ARRAY_SIZE(jz4760_otg_groups), },
> };
>=20
> static const struct ingenic_chip_info jz4770_chip_info =3D {
> --=20
> 2.29.2
>=20

