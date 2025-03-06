Return-Path: <linux-gpio+bounces-17145-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C855BA54A2E
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 12:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECC4B3A4EBA
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 11:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D6C20AF7A;
	Thu,  6 Mar 2025 11:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mZhrrtOb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B0B201260
	for <linux-gpio@vger.kernel.org>; Thu,  6 Mar 2025 11:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741262261; cv=none; b=eteFbKwBlbgHJPuTAFh2lvCtaQZicDWUAohJ9L6OijksN2YXZDhM2bj3lteVYh6rG0PvxR1gMJD94rMg5x84zvLYBKEdaGmBy9CwkoX2b2nwtHK/HHfZDcsxvt210Dn9HFVG9/VWIbD2yNilXBqL1fh0kjMVuITHgi3ZDqo9B8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741262261; c=relaxed/simple;
	bh=5H7eg+WL3WR1CRhmTiHpru9iL0FA1jYfIqvgL+L7RGM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PBo+GC23s6g7buNEEJZhZupnlKoApVxa4G0b7XU3Acjy9ZpmnxojCVe+3vFIBOb/3lCgEjqvMw7WB+E5dS1CCWXLYvrzCImiVhF8JfYtBX2m13I7++YLyV7X11ljovkOwCeJ/aRgdudAJD//HHF4e78A3YLuBgIK9D8DpAZvvlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mZhrrtOb; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e4ad1d67bdso809855a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 06 Mar 2025 03:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741262257; x=1741867057; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BARUASpJRV7rjuWtAQfVw6iGKUQXuRHG9Omp79hJ7oc=;
        b=mZhrrtOb4RSm8IBaL29iN5g5loA1gkaqQvp4mGrxtkw4Brl9Qapwod/AncIaeGa0Hr
         oPpGAi64EbeRvjHQyJDt+HwrrxsP4fiN58EMHnb8uytVlJoTmAfmtechRxEdOmd5Uh9f
         wuSppeZe2xiD2bKEC0tWstyKn++p0Si3bORRTobxmBB0ErfB6iJHilqP7smDaHfddfM+
         Hc7rG/C8MUDjVmSLGq3EWQnLlAADj7xMGyfYgPXOtTIlpLY7ZMMelpnBNtGbv14XqcYP
         Z/5HYNpAq6BFyzxcapmG/YQkKzmNWXnSjOiVW/GHpvr4WVcqp5AULeCMoqcEcKOW2IPP
         DckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741262257; x=1741867057;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BARUASpJRV7rjuWtAQfVw6iGKUQXuRHG9Omp79hJ7oc=;
        b=J9K4cMe0aJPPdbJTMAdf228YDHhBVJ/b/CTVFLeBolYaQGgfw4bvaGfkpEAMgWDNl7
         5DiGAHPXVQQLNyeZupuMVai6Ow+TV3ciMuDYJVsgzth7KFQGotmqnbkzXaR43y88e/X1
         6E/mPYCIy53/SVtQ0uzeq9TBjQ0NVA24TXFL2lPQXhEDIgk1BhgUuAdJqZ2VvMT3LJa1
         UC3lOtcQr0z815QBwdau8dDi3WdMHm/j8p2eM0MvSdrLHkwWuWHJzcOv8Tc1wUz7bMoH
         /Es9X4NwzIhYZtN9qU6ejtXoz+JurXkUAUG96zTN/OgMzcxC26vTn086QqhFJjD59odN
         gjBA==
X-Forwarded-Encrypted: i=1; AJvYcCVpdeB6d9a417ptmu2hdOYcUiagF4aqTwrdBSCa48kE74lwFU9q+e3bo2HTqQ0kISmxXLiU4PSPQFRe@vger.kernel.org
X-Gm-Message-State: AOJu0YzLppCRHyy3pRcx/KPuNlYCqGGo5x+PIa78qoJNhZdSct8w8lRd
	TWlpnWKuiOsFjMnS8XnEyY//xyBZ7uTqhOotwGy3ikCLm2rJeQhRej+gC8Kj70c=
X-Gm-Gg: ASbGncvdPZeuwT3hehTMhrk3UfY3yJO0kPHvMuvxX5LN3Ot/xRD2WDCFPZLa5wvU9zW
	OYuxCW8/ZDaK5tnUjAa6Zm5MGpZLsHWXafu4rtmC5AE/j5zfxkyd4UTScVN2ETK+Kcuj7E1LnL6
	iSPzUAsIWPxNq9DMOZV2zzZiucGs+INITSNGU6L5O9u6A09UY53EEy5TH8I8BiHVtBWZIGfc33H
	0zvDsomImEG0EKyZs0GISnE1jLxXy8COKxlTXWXd2iZD3odF3cO4wxCDGBSuUTkaza9vC3rumtB
	T6leIwaWVm79SJ22f27HgjtExc9HT3M8/5yJWOk1FtZdrCsk
X-Google-Smtp-Source: AGHT+IFVm1H9GI3kx+kJniQRxYGCrEUbz/D381snyIxSGg+a4nF/a3d4dUAKhYqpsRUeFr9SNwunXA==
X-Received: by 2002:a05:6402:84d:b0:5e0:745c:6503 with SMTP id 4fb4d7f45d1cf-5e59f530e18mr6315105a12.31.1741262256822;
        Thu, 06 Mar 2025 03:57:36 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c768f213sm839847a12.74.2025.03.06.03.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:57:36 -0800 (PST)
Message-ID: <f7c0101ff26ac0d4ef70a374ae31ee5d23b3c8fc.camel@linaro.org>
Subject: Re: [PATCH v2 2/4] pinctrl: samsung: add dedicated SoC eint
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
Date: Thu, 06 Mar 2025 11:57:35 +0000
In-Reply-To: <20250301-pinctrl-fltcon-suspend-v2-2-a7eef9bb443b@linaro.org>
References: <20250301-pinctrl-fltcon-suspend-v2-0-a7eef9bb443b@linaro.org>
	 <20250301-pinctrl-fltcon-suspend-v2-2-a7eef9bb443b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2025-03-01 at 11:43 +0000, Peter Griffin wrote:
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
> =C2=A05 files changed, 111 insertions(+), 143 deletions(-)
>=20
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pin=
ctrl/samsung/pinctrl-exynos-arm64.c
> index e28fe8177646..57c98d2451b5 100644
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
> index ac6dc22b37c9..d65a9fba0781 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> @@ -761,153 +761,118 @@ __init int exynos_eint_wkup_init(struct samsung_p=
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
> +	struct exynos_irq_chip *irq_chip =3D NULL;

This is a useless init and the value is overwritten right away.

> =C2=A0
> -	if (clk_enable(bank->drvdata->pclk)) {
> -		dev_err(bank->gpio_chip.parent,
> -			"unable to enable clock for saving state\n");
> -		return;
> +	if (bank->eint_type =3D=3D EINT_TYPE_WKUP) {
> +		if (bank->irq_chip) {
> +			irq_chip =3D bank->irq_chip;
> +			irq_chip->set_eint_wakeup_mask(bank->drvdata, irq_chip);
> +		}
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
> +	exynos_set_wakeup(bank);
> +
> +	if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {

Can you swap the order, and make the call to exynos_set_wakeup()
an else, to avoid some needless tests and make it clearer that
set_wakeup() is conditional as well, i.e.:

	if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {
	  ...
	} else {
	  exynos_set_wakeup(bank);
	}

What makes it hard to read is that as-is, it looks like the
set_wakeup() is unconditional, while it's also based on
bank->eint_type (which is also more obvious before your patch).

Or maybe even have exynos_set_wakeup() return a bool, as in
the follow-up gs101 patch, there are three tests of this type.

Other than that, I think I looks good.

Cheers,
Andre'

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
> =C2=A0	}
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
> +	exynos_set_wakeup(bank);
> +
> +	if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {
> +		save->eint_con =3D readl(regs + bank->pctl_offset +
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bank->eint_con_offset);
> +		save->eint_mask =3D readl(regs + bank->pctl_offset +
> +					bank->eint_mask_offset);
> +		pr_debug("%s: save=C2=A0=C2=A0=C2=A0=C2=A0 con %#010x\n",
> +			 bank->name, save->eint_con);
> +		pr_debug("%s: save=C2=A0=C2=A0=C2=A0 mask %#010x\n",
> +			 bank->name, save->eint_mask);
> =C2=A0	}
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
> +		pr_debug("%s:=C2=A0=C2=A0=C2=A0 mask %#010x =3D> %#010x\n", bank->name=
,
> +			 readl(regs + bank->pctl_offset +
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bank->eint_mask_offset), save->e=
int_mask);
> +
> +		writel(save->eint_con,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regs + bank->pctl_offset + bank->=
eint_con_offset);
> +		writel(save->eint_mask,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regs + bank->pctl_offset + bank->=
eint_mask_offset);
> =C2=A0	}
> -
> -	pr_debug("%s:=C2=A0=C2=A0=C2=A0=C2=A0 con %#010x =3D> %#010x\n", bank->=
name,
> -		 readl(regs + bank->pctl_offset + bank->eint_con_offset), save->eint_c=
on);
> -	pr_debug("%s:=C2=A0=C2=A0=C2=A0 mask %#010x =3D> %#010x\n", bank->name,
> -		 readl(regs + bank->pctl_offset + bank->eint_mask_offset), save->eint_=
mask);
> -
> -	writel(save->eint_con, regs + bank->pctl_offset + bank->eint_con_offset=
);
> -	writel(save->eint_mask, regs + bank->pctl_offset + bank->eint_mask_offs=
et);
> -
> -	clk_disable(bank->drvdata->pclk);
> -}
> -
> -void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata)
> -{
> -	struct samsung_pin_bank *bank =3D drvdata->pin_banks;
> -	int i;
> -
> -	for (i =3D 0; i < drvdata->nr_banks; ++i, ++bank)
> -		if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {
> -			if (bank->eint_con_offset)
> -				exynosauto_pinctrl_resume_bank(drvdata, bank);
> -			else
> -				exynos_pinctrl_resume_bank(drvdata, bank);
> -		}
> =C2=A0}
> =C2=A0
> =C2=A0static void exynos_retention_enable(struct samsung_pinctrl_drv_data=
 *drvdata)
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/s=
amsung/pinctrl-exynos.h
> index 33df21d5c9d6..35c2bc4ea488 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> @@ -221,8 +221,10 @@ struct exynos_muxed_weint_data {
> =C2=A0
> =C2=A0int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d);
> =C2=A0int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d);
> -void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata);
> -void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata);
> +void exynosautov920_pinctrl_resume(struct samsung_pin_bank *bank);
> +void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank);
> +void exynos_pinctrl_suspend(struct samsung_pin_bank *bank);
> +void exynos_pinctrl_resume(struct samsung_pin_bank *bank);
> =C2=A0struct samsung_retention_ctrl *
> =C2=A0exynos_retention_init(struct samsung_pinctrl_drv_data *drvdata,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct samsung_retention_dat=
a *data);
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/=
samsung/pinctrl-samsung.c
> index 963060920301..375634d8cc79 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -1349,6 +1349,9 @@ static int __maybe_unused samsung_pinctrl_suspend(s=
truct device *dev)
> =C2=A0		const u8 *widths =3D bank->type->fld_width;
> =C2=A0		enum pincfg_type type;
> =C2=A0
> +		if (drvdata->suspend)
> +			drvdata->suspend(bank);
> +
> =C2=A0		/* Registers without a powerdown config aren't lost */
> =C2=A0		if (!widths[PINCFG_TYPE_CON_PDN])
> =C2=A0			continue;
> @@ -1373,8 +1376,6 @@ static int __maybe_unused samsung_pinctrl_suspend(s=
truct device *dev)
> =C2=A0
> =C2=A0	clk_disable(drvdata->pclk);
> =C2=A0
> -	if (drvdata->suspend)
> -		drvdata->suspend(drvdata);
> =C2=A0	if (drvdata->retention_ctrl && drvdata->retention_ctrl->enable)
> =C2=A0		drvdata->retention_ctrl->enable(drvdata);
> =C2=A0
> @@ -1406,9 +1407,6 @@ static int __maybe_unused samsung_pinctrl_resume(st=
ruct device *dev)
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0
> -	if (drvdata->resume)
> -		drvdata->resume(drvdata);
> -
> =C2=A0	for (i =3D 0; i < drvdata->nr_banks; i++) {
> =C2=A0		struct samsung_pin_bank *bank =3D &drvdata->pin_banks[i];
> =C2=A0		void __iomem *reg =3D bank->pctl_base + bank->pctl_offset;
> @@ -1416,6 +1414,9 @@ static int __maybe_unused samsung_pinctrl_resume(st=
ruct device *dev)
> =C2=A0		const u8 *widths =3D bank->type->fld_width;
> =C2=A0		enum pincfg_type type;
> =C2=A0
> +		if (drvdata->resume)
> +			drvdata->resume(bank);
> +
> =C2=A0		/* Registers without a powerdown config aren't lost */
> =C2=A0		if (!widths[PINCFG_TYPE_CON_PDN])
> =C2=A0			continue;
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/=
samsung/pinctrl-samsung.h
> index 371e4f02bbfb..e939e5bb0347 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> @@ -285,8 +285,8 @@ struct samsung_pin_ctrl {
> =C2=A0	int		(*eint_gpio_init)(struct samsung_pinctrl_drv_data *);
> =C2=A0	int		(*eint_wkup_init)(struct samsung_pinctrl_drv_data *);
> =C2=A0	void		(*pud_value_init)(struct samsung_pinctrl_drv_data *drvdata);
> -	void		(*suspend)(struct samsung_pinctrl_drv_data *);
> -	void		(*resume)(struct samsung_pinctrl_drv_data *);
> +	void		(*suspend)(struct samsung_pin_bank *bank);
> +	void		(*resume)(struct samsung_pin_bank *bank);
> =C2=A0};
> =C2=A0
> =C2=A0/**
> @@ -335,8 +335,8 @@ struct samsung_pinctrl_drv_data {
> =C2=A0
> =C2=A0	struct samsung_retention_ctrl	*retention_ctrl;
> =C2=A0
> -	void (*suspend)(struct samsung_pinctrl_drv_data *);
> -	void (*resume)(struct samsung_pinctrl_drv_data *);
> +	void (*suspend)(struct samsung_pin_bank *bank);
> +	void (*resume)(struct samsung_pin_bank *bank);
> =C2=A0};
> =C2=A0
> =C2=A0/**
>=20


