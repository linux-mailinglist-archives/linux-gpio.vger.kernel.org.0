Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4D342A6805
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 16:47:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbgKDPrt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 10:47:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726919AbgKDPrs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 10:47:48 -0500
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E0C2C0613D3;
        Wed,  4 Nov 2020 07:47:48 -0800 (PST)
Received: by mail-qt1-x844.google.com with SMTP id t5so3915804qtp.2;
        Wed, 04 Nov 2020 07:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5nqgYbTQbj5DuF62cIkj5ceft3vrquAOysci5njVet8=;
        b=tXrDnS89dOuzct3LHnimvC3ZPT0rh+2trLVO4aa9WRnWbs5ulbSgF2Anzz7QajG9mF
         3xfrwcZM0/tqEQc/yaih60I2X3b9kmJXKNnEJaEO18BoH/ooeFs3d2FdBV4IhHyW7KlS
         sDe++lq1YwzdxdN7pl9sPezgF2M3XGTUGo/IegXcwi3e1FYtf4pTPuJBssmXVDc71TQD
         WGMnsTfIq8H30/GJh1di7m4fF2GWg8Ih7QQBiMt63m64uEJ5VWYH8Zn3zch9892B5bnM
         J45Lcm8gxzC4iYKZxTQSdV5If9tSqkpCJjq/NjRtZoiW+lKEwlNONpKZiErIX5lkg6Ex
         QcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5nqgYbTQbj5DuF62cIkj5ceft3vrquAOysci5njVet8=;
        b=n3bIPxRagnpc2VPNuFIAMqr/Vv6T/HpPBOMOaYCjgqJx6noKUR3JdXanFwc7uAkSVj
         6ex9F51uXTuc1BP6sa7aITHd48iRcijjjnpRq27z5UgTWb0YroXwoykoXpsUe84AhRDm
         OyTeB9AYvyPUDO9h65h3ldLLdDiAVOKfpsI0IulMgUJ13ZD7D7A4AcsydR+FpOGFT4Pr
         lXGOVzKMOLCDq33OCucdjLg2DjfBVxq5vdEuo05LfrSMSTodRpkE3rceRYMigTmfdqQR
         gAtLDyKZwCXyViFrZUpl8xFOcfMP5M2bi0LbptkF9SSpeXwDgyKs0gcm1z6Ga2yOcMOV
         u2Lg==
X-Gm-Message-State: AOAM532IViZBfadgF7w8NgDmqhocEAAJr/yny7QN6zd918YtnF2xU9dM
        DK/iw02dcimCfeEHau3lNx4gIXwAWcHmKg==
X-Google-Smtp-Source: ABdhPJyYNL6Epqy559YeyjqRVOOjZPXZwYmyaJk9W3u2dAeAzLsXShoAUZm716DB/H9dSgMdzG+OkQ==
X-Received: by 2002:ac8:514f:: with SMTP id h15mr20106390qtn.154.1604504867707;
        Wed, 04 Nov 2020 07:47:47 -0800 (PST)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
        by smtp.gmail.com with ESMTPSA id g66sm2733182qkb.91.2020.11.04.07.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 07:47:46 -0800 (PST)
Date:   Wed, 4 Nov 2020 10:47:44 -0500
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Arnaud de Turckheim <quarium@gmail.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/3] gpio: pcie-idio-24: Enable PEX8311 interrupts
Message-ID: <20201104154744.GD406355@shinobu>
References: <20201104152455.40627-1-quarium@gmail.com>
 <20201104152455.40627-4-quarium@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="C+ts3FVlLX8+P6JN"
Content-Disposition: inline
In-Reply-To: <20201104152455.40627-4-quarium@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--C+ts3FVlLX8+P6JN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2020 at 04:24:55PM +0100, Arnaud de Turckheim wrote:
> This enables the PEX8311 internal PCI wire interrupt and the PEX8311
> local interrupt input so the local interrupts are forwarded to the PCI.
>=20
> Fixes: 585562046628 ("gpio: Add GPIO support for the ACCES PCIe-IDIO-24 f=
amily")
> Signed-off-by: Arnaud de Turckheim <quarium@gmail.com>

Reviewed-by: William Breathitt Gray <vilhelm.gray@gmail.com>

> ---
>  drivers/gpio/gpio-pcie-idio-24.c | 52 +++++++++++++++++++++++++++++++-
>  1 file changed, 51 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpio-pcie-idio-24.c b/drivers/gpio/gpio-pcie-id=
io-24.c
> index a61de14d09b6..2a07fd96707e 100644
> --- a/drivers/gpio/gpio-pcie-idio-24.c
> +++ b/drivers/gpio/gpio-pcie-idio-24.c
> @@ -28,6 +28,47 @@
>  #include <linux/spinlock.h>
>  #include <linux/types.h>
> =20
> +/*
> + * PLX PEX8311 PCI LCS_INTCSR Interrupt Control/Status
> + *
> + * Bit: Description
> + *   0: Enable Interrupt Sources (Bit 0)
> + *   1: Enable Interrupt Sources (Bit 1)
> + *   2: Generate Internal PCI Bus Internal SERR# Interrupt
> + *   3: Mailbox Interrupt Enable
> + *   4: Power Management Interrupt Enable
> + *   5: Power Management Interrupt
> + *   6: Slave Read Local Data Parity Check Error Enable
> + *   7: Slave Read Local Data Parity Check Error Status
> + *   8: Internal PCI Wire Interrupt Enable
> + *   9: PCI Express Doorbell Interrupt Enable
> + *  10: PCI Abort Interrupt Enable
> + *  11: Local Interrupt Input Enable
> + *  12: Retry Abort Enable
> + *  13: PCI Express Doorbell Interrupt Active
> + *  14: PCI Abort Interrupt Active
> + *  15: Local Interrupt Input Active
> + *  16: Local Interrupt Output Enable
> + *  17: Local Doorbell Interrupt Enable
> + *  18: DMA Channel 0 Interrupt Enable
> + *  19: DMA Channel 1 Interrupt Enable
> + *  20: Local Doorbell Interrupt Active
> + *  21: DMA Channel 0 Interrupt Active
> + *  22: DMA Channel 1 Interrupt Active
> + *  23: Built-In Self-Test (BIST) Interrupt Active
> + *  24: Direct Master was the Bus Master during a Master or Target Abort
> + *  25: DMA Channel 0 was the Bus Master during a Master or Target Abort
> + *  26: DMA Channel 1 was the Bus Master during a Master or Target Abort
> + *  27: Target Abort after internal 256 consecutive Master Retrys
> + *  28: PCI Bus wrote data to LCS_MBOX0
> + *  29: PCI Bus wrote data to LCS_MBOX1
> + *  30: PCI Bus wrote data to LCS_MBOX2
> + *  31: PCI Bus wrote data to LCS_MBOX3
> + */
> +#define PLX_PEX8311_PCI_LCS_INTCSR  0x68
> +#define INTCSR_INTERNAL_PCI_WIRE    BIT(8)
> +#define INTCSR_LOCAL_INPUT          BIT(11)
> +
>  /**
>   * struct idio_24_gpio_reg - GPIO device registers structure
>   * @out0_7:	Read: FET Outputs 0-7
> @@ -92,6 +133,7 @@ struct idio_24_gpio_reg {
>  struct idio_24_gpio {
>  	struct gpio_chip chip;
>  	raw_spinlock_t lock;
> +	__u8 __iomem *plx;
>  	struct idio_24_gpio_reg __iomem *reg;
>  	unsigned long irq_mask;
>  };
> @@ -455,6 +497,7 @@ static int idio_24_probe(struct pci_dev *pdev, const =
struct pci_device_id *id)
>  	struct device *const dev =3D &pdev->dev;
>  	struct idio_24_gpio *idio24gpio;
>  	int err;
> +	const size_t pci_plx_bar_index =3D 1;
>  	const size_t pci_bar_index =3D 2;
>  	const char *const name =3D pci_name(pdev);
>  	struct gpio_irq_chip *girq;
> @@ -469,12 +512,13 @@ static int idio_24_probe(struct pci_dev *pdev, cons=
t struct pci_device_id *id)
>  		return err;
>  	}
> =20
> -	err =3D pcim_iomap_regions(pdev, BIT(pci_bar_index), name);
> +	err =3D pcim_iomap_regions(pdev, BIT(pci_plx_bar_index) | BIT(pci_bar_i=
ndex), name);
>  	if (err) {
>  		dev_err(dev, "Unable to map PCI I/O addresses (%d)\n", err);
>  		return err;
>  	}
> =20
> +	idio24gpio->plx =3D pcim_iomap_table(pdev)[pci_plx_bar_index];
>  	idio24gpio->reg =3D pcim_iomap_table(pdev)[pci_bar_index];
> =20
>  	idio24gpio->chip.label =3D name;
> @@ -504,6 +548,12 @@ static int idio_24_probe(struct pci_dev *pdev, const=
 struct pci_device_id *id)
> =20
>  	/* Software board reset */
>  	iowrite8(0, &idio24gpio->reg->soft_reset);
> +	/*
> +	 * enable PLX PEX8311 internal PCI wire interrupt and local interrupt
> +	 * input
> +	 */
> +	iowrite8((INTCSR_INTERNAL_PCI_WIRE | INTCSR_LOCAL_INPUT) >> 8,
> +		 idio24gpio->plx + PLX_PEX8311_PCI_LCS_INTCSR + 1);
> =20
>  	err =3D devm_gpiochip_add_data(dev, &idio24gpio->chip, idio24gpio);
>  	if (err) {
> --=20
> 2.25.1
>=20

--C+ts3FVlLX8+P6JN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl+izSAACgkQhvpINdm7
VJJxpQ/+M92Vm/sePOijfAtr7BME6/eMIW9xN40dS9OsOhKeAty7kgABJWWtPkHd
U/vTQRaGdRjsRPH37H5qyvDB7LB6P2+0EGO8S5D1NJ4G2ahFzbwM7qTReHyLwKrq
faY2ZCsugGTd6lh2MGyZWbLAhLDF6m5utYyUEzTdDd7Ox/7t7HriUh7dUHuueS/I
aBvS4SP/vFlAiYuv36klt9YJLuK6FMME6XkiNPSTQuUQOvG6ZUjS2Z9G+AxpBieI
tec9APOY4UBC8qdsoQGe75CyjTc5xzEa9i2p5Tet2M1hzFFN7o48McSyp8REmVHp
kTb3dPZVjNQydKCGmy5HKLNn+cGwRcWPVTiEdfkERqf0Mg5H7I4YkISp9juDBVwC
BRsCsFAMAlqTEFhMj10iDIQQMamdt5HNICvYib+d/cVfGHPWlJZ7s+ilS0sqWgkX
mPPx/28PtbbI2z++/lxKusWt+TJSWS+mMzKa2BWoOPqp8xuCscFnelV4D31OJ62i
Fz/A6+SEA5+4CJ/fwaF0zKYdFm7ACDn4eTti7WhxtDYnLLqXRD/PEzpjovvZxHc7
34L2MkSJGmQoeRsTjUEXbJUuoXDBrGYGwXB3po6Bj50vCwd6QJ246Uq4y0zAMaXe
NKQsc2xjFz3ZegCDSGwUoqzgEUzuuZMSenzSy4XLk2QMM5bqKjE=
=sDqA
-----END PGP SIGNATURE-----

--C+ts3FVlLX8+P6JN--
