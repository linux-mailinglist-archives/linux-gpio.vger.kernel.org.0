Return-Path: <linux-gpio+bounces-17203-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E57A558C5
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 22:29:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09F5A174E97
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 21:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E717027605D;
	Thu,  6 Mar 2025 21:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vXeyj2VD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBD7274252
	for <linux-gpio@vger.kernel.org>; Thu,  6 Mar 2025 21:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741296585; cv=none; b=lrBCB23xb3Z09hVE7wcHBtLcUxPGG78hQ61NjRBYyXbaLX7AQser1pIq/ONvR6es/BdhfLi7NrOzaS8wKND2dp1CY1CpZCcB8SSaAek+6INXvMiKDulxT8L9DMzO+lvGmWcs0v239bH46V/2o+M0jYVg8F2YoO376rrBQeo1I5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741296585; c=relaxed/simple;
	bh=hEmoPL0cdxH03ueuz0dRlIy7qLAgVgtp5oB86Lfydqc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WQ05s7+NXAVqIhTDRNHuE0JhOtZF8dC38Z5ZQnndHHdmnP595qukNPgY0mvR19ik5yuMgljft3MoBA0XTbXfsRZj+LcWg7Hrfu/aoQouRYzaFLhegYvGwlOT+PzYoXO8TwmD138eCdR260SJ8zBrzVHWTQnEdrG00QrKfYblMXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vXeyj2VD; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abf3d64849dso139199066b.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Mar 2025 13:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741296582; x=1741901382; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DBqdEdyFMA8jQBs9AYHy8g4gG/ltjj6TjXAbzDfasO0=;
        b=vXeyj2VDmuNpD5itMmeWW4EH927f154BOPO19zxlS7uBEJfpFs7J27gKx/nAkib1xF
         5e9Cnn/oVBQY859A83QMpeLXRMCOJCpv7IOIaJTxxo7ItvSxCEZkJZ1wAoCIS6XqY/eI
         CtmRfcunwJLiYmol3pp22EeDz10LwyYw06cVdUw96WLJyp4yCaaKSwyKPPq9HFNmUk5F
         Z3D3ZgkVcuVGc+O2deom2Xo1aF4OhoxvPlP/e0GfFarnovLdgAGXC08W1MCAkGdZ/56O
         Tp8ujjlrdYMOr5nrMPC8dDvzDCbm3QI2EWcmiVLHGg4XMuUXrzE/56NicMXBbxdNLLSX
         gdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741296582; x=1741901382;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DBqdEdyFMA8jQBs9AYHy8g4gG/ltjj6TjXAbzDfasO0=;
        b=Xl2J/nF/1OZQ5GPqUmgHIGuyMlNUMtwJ8fOFhCUajumvdbfLr78uDc4l0BnHqz3FGq
         5RgqrirmrWS6TY/AmherKYRkpZkTJ2s3NErwCIK90MWgjPDUen2k581PQrHCfFjsAL0P
         sP/pXSFrtLMKbEsh793748a9GJ/sD5//ix/dFf84EbCHdgghyclobTsqxJdu6bU/Edq3
         a06VMZjy2fu6JWbg5y0c2/Cqi4jn9e5XqQqgRjyHtKBmg01WIJCLBPOyZrxPgQJxL/o6
         Ax7rFWq1f03BfTDOESfxfq14cTu75aZ+UwrGJpmbTfii0hfi8AYCx+DQKNZa1beL5jk8
         VS5w==
X-Forwarded-Encrypted: i=1; AJvYcCX5exX/vVrZi1eQy7TG3BuhhOQJ6yxiRUHHjgtFzE9fN4YsDYm0LMD1HWJFiJTPdzEmXz6LDzHAXA42@vger.kernel.org
X-Gm-Message-State: AOJu0YzzjjH4Znw0iH2RDjyHs2MGmracMGJxMdOaUmEHtRrAGDxofRT2
	qhHsOODghzO9wkvQARABdx+xV4Sz/L/wyS8eER70MCe4ngwxAcMRpc7VSc9qMRQ=
X-Gm-Gg: ASbGncvVfKLdafzjbEmcz+LdvwVdelCiqN0L/lbZ4s0vTDCR5o+bd4XzWUR5eZG2R0X
	xcItMACl0iQTPvplmwutMZ7lMS91mNPaSxfjjeVj1CsRgpE16COqRdU2rZugPalxzD0PXja7OXd
	JnTa7AWhAutaeZd0VC15jmiLec05mfYSBZVZ7AbjCNTV+z79oz8+FFnwfdjKaGYEbWNEcn2uI89
	oxiu5MrS+fBWUgcypF2P6Uy+IzqLDsJPqQnSsLh5S1GNNUnyaL43NrP+hdqDEMr0iK6wA6sPoc9
	68TDDVXc7SdpwYmjRY/nskTqKYDXVZRgW1ipz3Cu8pWkf1o=
X-Google-Smtp-Source: AGHT+IEht5attfJf4NoO7w7oWzHaMXyX2jwcgxZKSG9i63/Ri1Qw+KxdA1FQFbOfiD0tSmzzAdbgJA==
X-Received: by 2002:a05:6402:34c5:b0:5e5:dedf:9ddc with SMTP id 4fb4d7f45d1cf-5e5e24bbeb3mr1596449a12.29.1741296581573;
        Thu, 06 Mar 2025 13:29:41 -0800 (PST)
Received: from salami.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23973b09asm154583366b.119.2025.03.06.13.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 13:29:41 -0800 (PST)
Message-ID: <c1b8a01c0ef3761a33c9f2530152cb2eab1ff039.camel@linaro.org>
Subject: Re: [PATCH v3 2/4] pinctrl: samsung: add dedicated SoC eint
 suspend/resume callbacks
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
	 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org, 	kernel-team@android.com,
 jaewon02.kim@samsung.com
Date: Thu, 06 Mar 2025 21:29:39 +0000
In-Reply-To: <20250306-pinctrl-fltcon-suspend-v3-2-f9ab4ff6a24e@linaro.org>
References: <20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org>
	 <20250306-pinctrl-fltcon-suspend-v3-2-f9ab4ff6a24e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-03-06 at 20:42 +0000, Peter Griffin wrote:
> gs101 needs it's own suspend/resume callbacks to use the newly
> added eint_fltcon_offset for saving & restoring fltcon0 & fltcon1
> registers. It also differs to previous SoCs in that fltcon1
> register doesn't always exist for each bank.
>=20
> exynosautov920 also has dedicated logic for using eint_con_offset
> and eint_mask_offset for saving & restoring it's registers.
>=20
> Refactor the existing platform specific suspend/resume callback
> so that each SoC variant has their own callback containing the
> SoC specific logic.
>=20
> Additionally we now call drvdata->suspend() & drvdata->resume()
> from within the loop that iterates the banks in
> samsung_pinctrl_suspend() and samsung_pinctrl_resume().
>=20
> This simplifies the logic, and allows us to remove the
> clk_enable() and clk_disable() from the callbacks.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes since v2:
> * Remove useless init (Andre)
> * make it clear set_wakeup is conditional on bank->eint_type (Andre)

I think you missed
https://lore.kernel.org/all/4f91fe1c5eed00e58a3587bceaef3e5e2a1124cf.camel@=
linaro.org/

See below

> Changes since v1:
> * Split code refactor & gs101 parts into separate patches (Andre)
> ---
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos-arm64.c |=C2=A0 28 ++--
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 201 ++++++++++---------------
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> =C2=A0drivers/pinctrl/samsung/pinctrl-samsung.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 11 +-
> =C2=A0drivers/pinctrl/samsung/pinctrl-samsung.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A05 files changed, 109 insertions(+), 145 deletions(-)
>=20
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pin=
ctrl/samsung/pinctrl-exynos-arm64.c
> index e28fe81776466b693417c66bb15752d609b79eb1..57c98d2451b54b00d50e0e948=
e272ed53d386c34 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> @@ -1112,8 +1112,8 @@ static const struct samsung_pin_ctrl exynosautov920=
_pin_ctrl[] =3D {
> =C2=A0		.pin_banks	=3D exynosautov920_pin_banks0,
> =C2=A0		.nr_banks	=3D ARRAY_SIZE(exynosautov920_pin_banks0),
> =C2=A0		.eint_wkup_init	=3D exynos_eint_wkup_init,
> -		.suspend	=3D exynos_pinctrl_suspend,
> -		.resume		=3D exynos_pinctrl_resume,
> +		.suspend	=3D exynosautov920_pinctrl_suspend,
> +		.resume		=3D exynosautov920_pinctrl_resume,
> =C2=A0		.retention_data	=3D &exynosautov920_retention_data,
> =C2=A0	}, {
> =C2=A0		/* pin-controller instance 1 AUD data */
> @@ -1124,43 +1124,43 @@ static const struct samsung_pin_ctrl exynosautov9=
20_pin_ctrl[] =3D {
> =C2=A0		.pin_banks	=3D exynosautov920_pin_banks2,
> =C2=A0		.nr_banks	=3D ARRAY_SIZE(exynosautov920_pin_banks2),
> =C2=A0		.eint_gpio_init	=3D exynos_eint_gpio_init,
> -		.suspend	=3D exynos_pinctrl_suspend,
> -		.resume		=3D exynos_pinctrl_resume,
> +		.suspend	=3D exynosautov920_pinctrl_suspend,
> +		.resume		=3D exynosautov920_pinctrl_resume,
> =C2=A0	}, {
> =C2=A0		/* pin-controller instance 3 HSI1 data */
> =C2=A0		.pin_banks	=3D exynosautov920_pin_banks3,
> =C2=A0		.nr_banks	=3D ARRAY_SIZE(exynosautov920_pin_banks3),
> =C2=A0		.eint_gpio_init	=3D exynos_eint_gpio_init,
> -		.suspend	=3D exynos_pinctrl_suspend,
> -		.resume		=3D exynos_pinctrl_resume,
> +		.suspend	=3D exynosautov920_pinctrl_suspend,
> +		.resume		=3D exynosautov920_pinctrl_resume,
> =C2=A0	}, {
> =C2=A0		/* pin-controller instance 4 HSI2 data */
> =C2=A0		.pin_banks	=3D exynosautov920_pin_banks4,
> =C2=A0		.nr_banks	=3D ARRAY_SIZE(exynosautov920_pin_banks4),
> =C2=A0		.eint_gpio_init	=3D exynos_eint_gpio_init,
> -		.suspend	=3D exynos_pinctrl_suspend,
> -		.resume		=3D exynos_pinctrl_resume,
> +		.suspend	=3D exynosautov920_pinctrl_suspend,
> +		.resume		=3D exynosautov920_pinctrl_resume,
> =C2=A0	}, {
> =C2=A0		/* pin-controller instance 5 HSI2UFS data */
> =C2=A0		.pin_banks	=3D exynosautov920_pin_banks5,
> =C2=A0		.nr_banks	=3D ARRAY_SIZE(exynosautov920_pin_banks5),
> =C2=A0		.eint_gpio_init	=3D exynos_eint_gpio_init,
> -		.suspend	=3D exynos_pinctrl_suspend,
> -		.resume		=3D exynos_pinctrl_resume,
> +		.suspend	=3D exynosautov920_pinctrl_suspend,
> +		.resume		=3D exynosautov920_pinctrl_resume,
> =C2=A0	}, {
> =C2=A0		/* pin-controller instance 6 PERIC0 data */
> =C2=A0		.pin_banks	=3D exynosautov920_pin_banks6,
> =C2=A0		.nr_banks	=3D ARRAY_SIZE(exynosautov920_pin_banks6),
> =C2=A0		.eint_gpio_init	=3D exynos_eint_gpio_init,
> -		.suspend	=3D exynos_pinctrl_suspend,
> -		.resume		=3D exynos_pinctrl_resume,
> +		.suspend	=3D exynosautov920_pinctrl_suspend,
> +		.resume		=3D exynosautov920_pinctrl_resume,
> =C2=A0	}, {
> =C2=A0		/* pin-controller instance 7 PERIC1 data */
> =C2=A0		.pin_banks	=3D exynosautov920_pin_banks7,
> =C2=A0		.nr_banks	=3D ARRAY_SIZE(exynosautov920_pin_banks7),
> =C2=A0		.eint_gpio_init	=3D exynos_eint_gpio_init,
> -		.suspend	=3D exynos_pinctrl_suspend,
> -		.resume		=3D exynos_pinctrl_resume,
> +		.suspend	=3D exynosautov920_pinctrl_suspend,
> +		.resume		=3D exynosautov920_pinctrl_resume,
> =C2=A0	},
> =C2=A0};
> =C2=A0
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/s=
amsung/pinctrl-exynos.c
> index ac6dc22b37c98ed5b7fca3335764f19abb2f71cc..f10ff09c1af01c11ff9229aae=
f77df32eb057b7b 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> @@ -761,153 +761,114 @@ __init int exynos_eint_wkup_init(struct samsung_p=
inctrl_drv_data *d)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static void exynos_pinctrl_suspend_bank(
> -				struct samsung_pinctrl_drv_data *drvdata,
> -				struct samsung_pin_bank *bank)
> +static void exynos_set_wakeup(struct samsung_pin_bank *bank)
> =C2=A0{
> -	struct exynos_eint_gpio_save *save =3D bank->soc_priv;
> -	const void __iomem *regs =3D bank->eint_base;
> +	struct exynos_irq_chip *irq_chip;
> =C2=A0
> -	if (clk_enable(bank->drvdata->pclk)) {
> -		dev_err(bank->gpio_chip.parent,
> -			"unable to enable clock for saving state\n");
> -		return;
> +	if (bank->irq_chip) {
> +		irq_chip =3D bank->irq_chip;
> +		irq_chip->set_eint_wakeup_mask(bank->drvdata, irq_chip);
> =C2=A0	}
> -
> -	save->eint_con =3D readl(regs + EXYNOS_GPIO_ECON_OFFSET
> -						+ bank->eint_offset);
> -	save->eint_fltcon0 =3D readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
> -						+ 2 * bank->eint_offset);
> -	save->eint_fltcon1 =3D readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
> -						+ 2 * bank->eint_offset + 4);
> -	save->eint_mask =3D readl(regs + bank->irq_chip->eint_mask
> -						+ bank->eint_offset);
> -
> -	clk_disable(bank->drvdata->pclk);
> -
> -	pr_debug("%s: save=C2=A0=C2=A0=C2=A0=C2=A0 con %#010x\n", bank->name, s=
ave->eint_con);
> -	pr_debug("%s: save fltcon0 %#010x\n", bank->name, save->eint_fltcon0);
> -	pr_debug("%s: save fltcon1 %#010x\n", bank->name, save->eint_fltcon1);
> -	pr_debug("%s: save=C2=A0=C2=A0=C2=A0 mask %#010x\n", bank->name, save->=
eint_mask);
> =C2=A0}
> =C2=A0
> -static void exynosauto_pinctrl_suspend_bank(struct samsung_pinctrl_drv_d=
ata *drvdata,
> -					=C2=A0=C2=A0=C2=A0 struct samsung_pin_bank *bank)
> +void exynos_pinctrl_suspend(struct samsung_pin_bank *bank)
> =C2=A0{
> =C2=A0	struct exynos_eint_gpio_save *save =3D bank->soc_priv;
> =C2=A0	const void __iomem *regs =3D bank->eint_base;
> =C2=A0
> -	if (clk_enable(bank->drvdata->pclk)) {
> -		dev_err(bank->gpio_chip.parent,
> -			"unable to enable clock for saving state\n");
> -		return;
> -	}
> -
> -	save->eint_con =3D readl(regs + bank->pctl_offset + bank->eint_con_offs=
et);
> -	save->eint_mask =3D readl(regs + bank->pctl_offset + bank->eint_mask_of=
fset);
> -
> -	clk_disable(bank->drvdata->pclk);
> -
> -	pr_debug("%s: save=C2=A0=C2=A0=C2=A0=C2=A0 con %#010x\n", bank->name, s=
ave->eint_con);
> -	pr_debug("%s: save=C2=A0=C2=A0=C2=A0 mask %#010x\n", bank->name, save->=
eint_mask);
> +	if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {
> +		save->eint_con =3D readl(regs + EXYNOS_GPIO_ECON_OFFSET
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset);
> +		save->eint_fltcon0 =3D readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
> +					=C2=A0=C2=A0 + 2 * bank->eint_offset);
> +		save->eint_fltcon1 =3D readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
> +					=C2=A0=C2=A0 + 2 * bank->eint_offset + 4);
> +		save->eint_mask =3D readl(regs + bank->irq_chip->eint_mask
> +					+ bank->eint_offset);
> +
> +		pr_debug("%s: save=C2=A0=C2=A0=C2=A0=C2=A0 con %#010x\n",
> +			 bank->name, save->eint_con);
> +		pr_debug("%s: save fltcon0 %#010x\n",
> +			 bank->name, save->eint_fltcon0);
> +		pr_debug("%s: save fltcon1 %#010x\n",
> +			 bank->name, save->eint_fltcon1);
> +		pr_debug("%s: save=C2=A0=C2=A0=C2=A0 mask %#010x\n",
> +			 bank->name, save->eint_mask);
> +	} else if (bank->eint_type =3D=3D EINT_TYPE_WKUP)
> +		exynos_set_wakeup(bank);
> =C2=A0}
> =C2=A0
> -void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata)
> +void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
> =C2=A0{
> -	struct samsung_pin_bank *bank =3D drvdata->pin_banks;
> -	struct exynos_irq_chip *irq_chip =3D NULL;
> -	int i;
> +	struct exynos_eint_gpio_save *save =3D bank->soc_priv;
> +	const void __iomem *regs =3D bank->eint_base;
> =C2=A0
> -	for (i =3D 0; i < drvdata->nr_banks; ++i, ++bank) {
> -		if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {
> -			if (bank->eint_con_offset)
> -				exynosauto_pinctrl_suspend_bank(drvdata, bank);
> -			else
> -				exynos_pinctrl_suspend_bank(drvdata, bank);
> -		}
> -		else if (bank->eint_type =3D=3D EINT_TYPE_WKUP) {
> -			if (!irq_chip) {
> -				irq_chip =3D bank->irq_chip;
> -				irq_chip->set_eint_wakeup_mask(drvdata,
> -							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq_chip);
> -			}
> -		}
> -	}
> +	if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {
> +		save->eint_con =3D readl(regs + bank->pctl_offset +
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bank->eint_con_offset);
> +		save->eint_mask =3D readl(regs + bank->pctl_offset +
> +					bank->eint_mask_offset);
> +		pr_debug("%s: save=C2=A0=C2=A0=C2=A0=C2=A0 con %#010x\n",
> +			 bank->name, save->eint_con);
> +		pr_debug("%s: save=C2=A0=C2=A0=C2=A0 mask %#010x\n",
> +			 bank->name, save->eint_mask);
> +	} else if (bank->eint_type =3D=3D EINT_TYPE_WKUP)
> +		exynos_set_wakeup(bank);
> =C2=A0}
> =C2=A0
> -static void exynos_pinctrl_resume_bank(
> -				struct samsung_pinctrl_drv_data *drvdata,
> -				struct samsung_pin_bank *bank)
> +void exynos_pinctrl_resume(struct samsung_pin_bank *bank)
> =C2=A0{
> =C2=A0	struct exynos_eint_gpio_save *save =3D bank->soc_priv;
> =C2=A0	void __iomem *regs =3D bank->eint_base;
> =C2=A0
> -	if (clk_enable(bank->drvdata->pclk)) {
> -		dev_err(bank->gpio_chip.parent,
> -			"unable to enable clock for restoring state\n");
> -		return;
> +	if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {
> +		pr_debug("%s:=C2=A0=C2=A0=C2=A0=C2=A0 con %#010x =3D> %#010x\n", bank-=
>name,
> +			 readl(regs + EXYNOS_GPIO_ECON_OFFSET
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset), save->eint=
_con);
> +		pr_debug("%s: fltcon0 %#010x =3D> %#010x\n", bank->name,
> +			 readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + 2 * bank->eint_offset), save->=
eint_fltcon0);
> +		pr_debug("%s: fltcon1 %#010x =3D> %#010x\n", bank->name,
> +			 readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + 2 * bank->eint_offset + 4),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 save->eint_fltcon1);

here

> +		pr_debug("%s:=C2=A0=C2=A0=C2=A0 mask %#010x =3D> %#010x\n", bank->name=
,
> +			 readl(regs + bank->irq_chip->eint_mask
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset), save->eint=
_mask);
> +
> +		writel(save->eint_con, regs + EXYNOS_GPIO_ECON_OFFSET
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset);
> +		writel(save->eint_fltcon0, regs + EXYNOS_GPIO_EFLTCON_OFFSET
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + 2 * bank->eint_offset);
> +		writel(save->eint_fltcon1, regs + EXYNOS_GPIO_EFLTCON_OFFSET
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + 2 * bank->eint_offset + 4);
> +		writel(save->eint_mask, regs + bank->irq_chip->eint_mask
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset);
> =C2=A0	}
> -
> -	pr_debug("%s:=C2=A0=C2=A0=C2=A0=C2=A0 con %#010x =3D> %#010x\n", bank->=
name,
> -			readl(regs + EXYNOS_GPIO_ECON_OFFSET
> -			+ bank->eint_offset), save->eint_con);
> -	pr_debug("%s: fltcon0 %#010x =3D> %#010x\n", bank->name,
> -			readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
> -			+ 2 * bank->eint_offset), save->eint_fltcon0);
> -	pr_debug("%s: fltcon1 %#010x =3D> %#010x\n", bank->name,
> -			readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
> -			+ 2 * bank->eint_offset + 4), save->eint_fltcon1);
> -	pr_debug("%s:=C2=A0=C2=A0=C2=A0 mask %#010x =3D> %#010x\n", bank->name,
> -			readl(regs + bank->irq_chip->eint_mask
> -			+ bank->eint_offset), save->eint_mask);
> -
> -	writel(save->eint_con, regs + EXYNOS_GPIO_ECON_OFFSET
> -						+ bank->eint_offset);
> -	writel(save->eint_fltcon0, regs + EXYNOS_GPIO_EFLTCON_OFFSET
> -						+ 2 * bank->eint_offset);
> -	writel(save->eint_fltcon1, regs + EXYNOS_GPIO_EFLTCON_OFFSET
> -						+ 2 * bank->eint_offset + 4);
> -	writel(save->eint_mask, regs + bank->irq_chip->eint_mask
> -						+ bank->eint_offset);
> -
> -	clk_disable(bank->drvdata->pclk);
> =C2=A0}
> =C2=A0
> -static void exynosauto_pinctrl_resume_bank(struct samsung_pinctrl_drv_da=
ta *drvdata,
> -					=C2=A0=C2=A0 struct samsung_pin_bank *bank)
> +void exynosautov920_pinctrl_resume(struct samsung_pin_bank *bank)
> =C2=A0{
> =C2=A0	struct exynos_eint_gpio_save *save =3D bank->soc_priv;
> =C2=A0	void __iomem *regs =3D bank->eint_base;
> =C2=A0
> -	if (clk_enable(bank->drvdata->pclk)) {
> -		dev_err(bank->gpio_chip.parent,
> -			"unable to enable clock for restoring state\n");
> -		return;
> +	if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {
> +		/* exynosautov920 has eint_con_offset for all but one bank */
> +		if (!bank->eint_con_offset)
> +			exynos_pinctrl_resume(bank);
> +
> +		pr_debug("%s:=C2=A0=C2=A0=C2=A0=C2=A0 con %#010x =3D> %#010x\n", bank-=
>name,
> +			 readl(regs + bank->pctl_offset + bank->eint_con_offset),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 save->eint_con);

and here.

Cheers,
A.


