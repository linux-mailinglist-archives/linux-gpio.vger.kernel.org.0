Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B52FF1960D8
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 23:07:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbgC0WHF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 18:07:05 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.163]:22486 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbgC0WHF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 18:07:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585346819;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=8US9yjR2qckFnDOrbB5ZKghJi+sBmaboahOW8mzYA7w=;
        b=r6Mnd9Lcb43Y+Nn0Q00NkTqK4zJPILJ1xDIK19xwq4OcWORj4ntL7mUJFR6Gk6rKMu
        +qsmbm6Tisp45X9dVoX6YX+OpRGnYaIY5wWryE1NNUxgjVFgo3OdC+NReGvPKqgKcGh+
        UVgQ+vQgkfiMKwdnkroRBTZJpfgauDlf6QhAS9w/kVaIhByAjESUaDJkfKnFWL+Hqfl/
        beBPoOnU7WUDARka3vSmYH+eaHP77F5mFTU83CkMsEwZbtmjybzB5uhswq2klS9LyXWB
        tPSFT9pBpYpDitUe/tWTkxnNzFUm72yqduXGK5to8bh8daHOM8/HhqInZKztNm/dG4/B
        NOsA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDVCUXA0O8ZI="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id m02241w2RM6i7sq
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 27 Mar 2020 23:06:44 +0100 (CET)
Subject: Re: [PATCH v1 2/2] [RFC] gpio: pca953x: drop unused parameters of pca953x_recalc_addr()
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200327172244.30816-3-u.kleine-koenig@pengutronix.de>
Date:   Fri, 27 Mar 2020 23:06:43 +0100
Cc:     Marek Vasut <marek.vasut@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Brown <broonie@kernel.org>, kernel@pengutronix.de,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <DF902AF8-CA86-4F31-9D98-288D40634D69@goldelico.com>
References: <20200327074922.vrxbcjw2xlrv2bkb@pengutronix.de> <20200327172244.30816-1-u.kleine-koenig@pengutronix.de> <20200327172244.30816-3-u.kleine-koenig@pengutronix.de>
To:     =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-Mailer: Apple Mail (2.3124)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


> Am 27.03.2020 um 18:22 schrieb Uwe Kleine-K=C3=B6nig =
<u.kleine-koenig@pengutronix.de>:
>=20
> After the previous patch the two last parameters of
> pca953x_recalc_addr() are unused and so can be dropped.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> drivers/gpio/gpio-pca953x.c | 31 +++++++++++--------------------
> 1 file changed, 11 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 8168558299c2..f4943cad5d0e 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -325,8 +325,7 @@ static const struct regmap_config =
pca953x_ai_i2c_regmap =3D {
> 	.max_register =3D 0x7f,
> };
>=20
> -static u8 pca953x_recalc_addr(struct pca953x_chip *chip, int reg, int =
off,
> -			      bool write, bool addrinc)
> +static u8 pca953x_recalc_addr(struct pca953x_chip *chip, int reg, int =
off)
> {
> 	int bank_shift =3D pca953x_bank_shift(chip);
> 	int addr =3D (reg & PCAL_GPIO_MASK) << bank_shift;
> @@ -338,7 +337,7 @@ static u8 pca953x_recalc_addr(struct pca953x_chip =
*chip, int reg, int off,
>=20
> static int pca953x_write_regs(struct pca953x_chip *chip, int reg, =
unsigned long *val)
> {
> -	u8 regaddr =3D pca953x_recalc_addr(chip, reg, 0, true, true);
> +	u8 regaddr =3D pca953x_recalc_addr(chip, reg, 0;

here is some ")" missing.

After fix&compile it still works for the pcal6524 of the OMAP5/Pyra =
(LPAE build).

> 	u8 value[MAX_BANK];
> 	int i, ret;
>=20
> @@ -356,7 +355,7 @@ static int pca953x_write_regs(struct pca953x_chip =
*chip, int reg, unsigned long
>=20
> static int pca953x_read_regs(struct pca953x_chip *chip, int reg, =
unsigned long *val)
> {
> -	u8 regaddr =3D pca953x_recalc_addr(chip, reg, 0, false, true);
> +	u8 regaddr =3D pca953x_recalc_addr(chip, reg, 0);
> 	u8 value[MAX_BANK];
> 	int i, ret;
>=20
> @@ -375,8 +374,7 @@ static int pca953x_read_regs(struct pca953x_chip =
*chip, int reg, unsigned long *
> static int pca953x_gpio_direction_input(struct gpio_chip *gc, unsigned =
off)
> {
> 	struct pca953x_chip *chip =3D gpiochip_get_data(gc);
> -	u8 dirreg =3D pca953x_recalc_addr(chip, chip->regs->direction, =
off,
> -					true, false);
> +	u8 dirreg =3D pca953x_recalc_addr(chip, chip->regs->direction, =
off);
> 	u8 bit =3D BIT(off % BANK_SZ);
> 	int ret;
>=20
> @@ -390,10 +388,8 @@ static int pca953x_gpio_direction_output(struct =
gpio_chip *gc,
> 		unsigned off, int val)
> {
> 	struct pca953x_chip *chip =3D gpiochip_get_data(gc);
> -	u8 dirreg =3D pca953x_recalc_addr(chip, chip->regs->direction, =
off,
> -					true, false);
> -	u8 outreg =3D pca953x_recalc_addr(chip, chip->regs->output, off,
> -					true, false);
> +	u8 dirreg =3D pca953x_recalc_addr(chip, chip->regs->direction, =
off);
> +	u8 outreg =3D pca953x_recalc_addr(chip, chip->regs->output, =
off);
> 	u8 bit =3D BIT(off % BANK_SZ);
> 	int ret;
>=20
> @@ -413,8 +409,7 @@ static int pca953x_gpio_direction_output(struct =
gpio_chip *gc,
> static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
> {
> 	struct pca953x_chip *chip =3D gpiochip_get_data(gc);
> -	u8 inreg =3D pca953x_recalc_addr(chip, chip->regs->input, off,
> -				       true, false);
> +	u8 inreg =3D pca953x_recalc_addr(chip, chip->regs->input, off);
> 	u8 bit =3D BIT(off % BANK_SZ);
> 	u32 reg_val;
> 	int ret;
> @@ -438,8 +433,7 @@ static int pca953x_gpio_get_value(struct gpio_chip =
*gc, unsigned off)
> static void pca953x_gpio_set_value(struct gpio_chip *gc, unsigned off, =
int val)
> {
> 	struct pca953x_chip *chip =3D gpiochip_get_data(gc);
> -	u8 outreg =3D pca953x_recalc_addr(chip, chip->regs->output, off,
> -					true, false);
> +	u8 outreg =3D pca953x_recalc_addr(chip, chip->regs->output, =
off);
> 	u8 bit =3D BIT(off % BANK_SZ);
>=20
> 	mutex_lock(&chip->i2c_lock);
> @@ -450,8 +444,7 @@ static void pca953x_gpio_set_value(struct =
gpio_chip *gc, unsigned off, int val)
> static int pca953x_gpio_get_direction(struct gpio_chip *gc, unsigned =
off)
> {
> 	struct pca953x_chip *chip =3D gpiochip_get_data(gc);
> -	u8 dirreg =3D pca953x_recalc_addr(chip, chip->regs->direction, =
off,
> -					true, false);
> +	u8 dirreg =3D pca953x_recalc_addr(chip, chip->regs->direction, =
off);
> 	u8 bit =3D BIT(off % BANK_SZ);
> 	u32 reg_val;
> 	int ret;
> @@ -491,10 +484,8 @@ static int pca953x_gpio_set_pull_up_down(struct =
pca953x_chip *chip,
> 					 unsigned int offset,
> 					 unsigned long config)
> {
> -	u8 pull_en_reg =3D pca953x_recalc_addr(chip, PCAL953X_PULL_EN, =
offset,
> -					     true, false);
> -	u8 pull_sel_reg =3D pca953x_recalc_addr(chip, PCAL953X_PULL_SEL, =
offset,
> -					      true, false);
> +	u8 pull_en_reg =3D pca953x_recalc_addr(chip, PCAL953X_PULL_EN, =
offset);
> +	u8 pull_sel_reg =3D pca953x_recalc_addr(chip, PCAL953X_PULL_SEL, =
offset);
> 	u8 bit =3D BIT(offset % BANK_SZ);
> 	int ret;
>=20
> --=20
> 2.26.0.rc2
>=20

BR and thanks,
Nikolaus Schaller


