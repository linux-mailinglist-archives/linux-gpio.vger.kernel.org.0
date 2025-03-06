Return-Path: <linux-gpio+bounces-17154-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 930DAA54F16
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 16:30:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A53FF1898F63
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 15:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5A820E703;
	Thu,  6 Mar 2025 15:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ckbFkW3L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F5420F078
	for <linux-gpio@vger.kernel.org>; Thu,  6 Mar 2025 15:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741274795; cv=none; b=E4O2q58ISz+1iigkZkcq/iihirMAXOwy00x+kjVnZLrZK8vYjIZ9j1AdW5fpWjSciOYEoOOVUHTubuujAcvuL78pxrkIGvpB+7fdsrfxQowKeg6EgPlcd7iXKB4Oxji3onKgXaRwamLmT6w4rMg8+wxOHYB5E4eU89J8tB9tLk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741274795; c=relaxed/simple;
	bh=rq3ebekspowb+RTf0p8oYZyBTCEKc4l+e107QAknleI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t0DrXwCuL6cmUQCzv0lRtBEKoMkmXKj50Vc/rX3V1O5JeGOTAj86ZLQbycA/5zVqJLCzPHDOmkcgKruYTvHH4lgvMyBsAu5yjKAUKzdUsG/Hfx+LnBef+v1HeEMTsx962I7SqAIsNCKpfpRqYvx3tLachsopwfhiTV5fASDREak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ckbFkW3L; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e4bed34bccso1267891a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Mar 2025 07:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741274790; x=1741879590; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iIFvuaqHhFntvQlpRTIvoKjIOarKQMOq9Ag0pcr/34A=;
        b=ckbFkW3LarT0Ylf2YXvXcU34exZ+nwldcYVSAjGMUQi0HxplMr6t4e8yeFluPYo98P
         6N0R/qQ5ELj9Z+CRJvmGIblisqyG1LQMB5ovpTNHhoX4zkNsmbiNoPukpC6Bc1UdjfRO
         9eyHSxVi9oyDUUcapn+hiLnk3IS7oaDriw0SFTvOiOdYhHWiZ9uCeBlIJoNVpLoi/0lQ
         7ME5PYORNJuedKqLDWxtZNlM/PXF1ZZ68N0Lp+C/SWZUB5JGnN5AxUymLXCGgtmZ5Vpx
         YwGTQr+YDpXaQBJHVePHzgJge/A3EbL+zmCgw4fL9ZRGphCcJsXgE2HnO17JIzk+xHOB
         NfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741274790; x=1741879590;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iIFvuaqHhFntvQlpRTIvoKjIOarKQMOq9Ag0pcr/34A=;
        b=GYMAZND/ywY6slYui4ovfPXgHvFQ06ItQBqpN8It3kEILE3rpDq96hYXxnTBM0dcH4
         7Dho4c+k4Am57emrS9yJUjvh0+6bjBB7ukJkpQiMbPOH93ceOqvFpa/rew2McZ8CIbcH
         g+Ai+Xpnbo3QU3VIh4SDn1GyoupXPGgA+bMwZiBJwIMLhOS7qmJlVuG0nLKKL6d1phKS
         k9gnbMJRwnoi/uW6/IvWiSV8Vh+2vvjITdU6LYnPZcqaPGj6iMAlsCJKq4a8yVpIkAEn
         GZ7QNYQOqwQ2WBchhLEQAfJgu+rIFZSVi5RIC96Qy89m5Qwa3TL+3MPnc+pL5J3YH2mg
         sm9A==
X-Forwarded-Encrypted: i=1; AJvYcCUOOqM+xLbqoR3i1Y1hAZySdWI+V4/X2dYDF7VW+jLoVPdh/H/rs/czxmTFu0mCaV5XLWeZwSATCQvo@vger.kernel.org
X-Gm-Message-State: AOJu0YyoCJAKbh4FchfvogKqLoEuc6gqsJgnmFs1oJpAflRNROITRbct
	IB/7McDJwyVpdh5Lsj75DB+UlfegteQl0fT26PZNLiteJoNRdwWCiMav1EvXz3I=
X-Gm-Gg: ASbGncteJWcSLGp32Om/FLjDYWxdcfQWnvj1cvIku1xqht9ZiJ69luVYBVE+cgbxjSQ
	9q4G2m3SLHS2qn0LJl2gXDcDJgrO+TklLg+LioXvDEe1aBW5rATZFYPgzSWXSioDAyp+RnkwhAI
	PaN0w7NjH75z9VbU0y+Zw+LfOgQ6iV+c1touL0yuTYENHpVlkmoXjYAlpcVJF0DZlKTWJKScHvl
	uEL61E1QlhvZzb3gsDcG73n4qD39GAllOaovnCP5uHThbXkZzczS6DNHTkuRCVrAku7XrPOtbzG
	CfmhVTD59jnxYEKMIGVHTSMYIHaFIjlYIKljpMNe3Z8cEy8r
X-Google-Smtp-Source: AGHT+IH0jkdkKlxaqF3wkqHwudjs10mK4wes1NDX4QS5VUliT9VayRAZEVO93js8rAurkPGvYT2syQ==
X-Received: by 2002:a05:6402:234a:b0:5d0:8197:7ab3 with SMTP id 4fb4d7f45d1cf-5e59f353369mr8529169a12.3.1741274790139;
        Thu, 06 Mar 2025 07:26:30 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c766a5bcsm1078630a12.52.2025.03.06.07.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 07:26:29 -0800 (PST)
Message-ID: <ac831e724393dd928d3e62a4cfe2d9d30af7a081.camel@linaro.org>
Subject: Re: [PATCH v2 4/4] pinctrl: samsung: Add filter selection support
 for alive bank on gs101
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
	 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org, 	kernel-team@android.com,
 jaewon02.kim@samsung.com
Date: Thu, 06 Mar 2025 15:26:28 +0000
In-Reply-To: <20250301-pinctrl-fltcon-suspend-v2-4-a7eef9bb443b@linaro.org>
References: <20250301-pinctrl-fltcon-suspend-v2-0-a7eef9bb443b@linaro.org>
	 <20250301-pinctrl-fltcon-suspend-v2-4-a7eef9bb443b@linaro.org>
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
> Newer Exynos based SoCs have a filter selection bitfield in the filter
> configuration registers on alive bank pins. This allows the selection of
> a digital or analog delay filter for each pin. Add support for selecting
> and enabling the filter.
>=20
> On suspend we set the analog filter to all pins in the bank (as the
> digital filter relies on a clock). On resume the digital filter is
> reapplied to all pins in the bank. The digital filter is working via
> a clock and has an adjustable filter delay flt_width bitfield, whereas
> the analog filter uses a fixed delay.
>=20
> The filter determines to what extent signal fluctuations received through
> the pad are considered glitches.
>=20
> The code path can be exercised using
> echo mem > /sys/power/state
> And then wake the device using a eint gpio
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>=20
> Changes since v1:
> * Remove eint_flt_selectable bool as it can be deduced from EINT_TYPE_WKU=
P (Peter)
> * Move filter config comment to header (Andre)
> * Rename EXYNOS_FLTCON_DELAY to EXYNOS_FLTCON_ANALOG (Andre)
> * Remove misleading old comment (Andre)
> * Refactor exynos_eint_update_flt_reg() into a loop (Andre)
>=20
> Note: this patch was previously sent as part of the initial gs101/ Pixel =
6
> series and was dropped in v6. This new version incorporates the review
> feedback from Sam Protsenko here in v5.
>=20
> Link: https://lore.kernel.org/all/20231201160925.3136868-1-peter.griffin@=
linaro.org/T/#m79ced98939e895c840d812c8b4c2b3f33ce604c8
>=20
> Changes since previous version
> * Drop fltcon_type enum and use bool eint_flt_selectable (Sam)
> * Refactor and add exynos_eint_update_flt_reg() (Sam)
> * Rename function to exynos_eint_set_filter() for easier readability (Sam=
)
> * Remove comments and `if bank->fltcon_type !=3D FLT_DEFAULT)` checks and=
 indentation (Sam)
> ---
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.c | 35 +++++++++++++++++++++=
+++++++++++
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.h | 21 +++++++++++++++++++
> =C2=A02 files changed, 56 insertions(+)
>=20
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/s=
amsung/pinctrl-exynos.c
> index ddc7245ec2e5..4c467651b034 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> @@ -369,6 +369,39 @@ struct exynos_eint_gpio_save {
> =C2=A0	u32 eint_mask;
> =C2=A0};
> =C2=A0
> +static void exynos_eint_update_flt_reg(void __iomem *reg, int cnt, int c=
on)
> +{
> +	unsigned int val, shift;
> +	int i;
> +
> +	val =3D readl(reg);
> +	for (i =3D 0; i < cnt; i++) {
> +		shift =3D i * EXYNOS_FLTCON_LEN;
> +		val |=3D con << shift;

EXYNOS_FLTCON_ANALOG =3D=3D 0, so this code still needs to clear
bit 6 to undo a previous enabling of digital filter:

    val &=3D ~(EXYNOS_FLTCON_DIGITAL << shift);
    val |=3D con << shift;


> +	}
> +	writel(val, reg);
> +}
> +
> +/*
> + * Set the desired filter (digital or analog delay) and enable it to
> + * every pin in the bank. Note the filter selection bitfield is only
> + * found on alive banks. The filter determines to what extent signal
> + * fluctuations received through the pad are considered glitches.
> + */
> +static void exynos_eint_set_filter(struct samsung_pin_bank *bank, int fi=
lter)
> +{
> +	unsigned int off =3D EXYNOS_GPIO_EFLTCON_OFFSET + bank->eint_fltcon_off=
set;
> +	void __iomem *reg =3D bank->drvdata->virt_base + off;
> +	unsigned int con =3D EXYNOS_FLTCON_EN | filter;
> +
> +	if (bank->eint_type !=3D EINT_TYPE_WKUP)
> +		return;
> +
> +	for (int n =3D 0; n < bank->nr_pins; n +=3D 4)
> +		exynos_eint_update_flt_reg(reg + n,
> +					=C2=A0=C2=A0 min(bank->nr_pins - n, 4), con);
> +}
> +
> =C2=A0/*
> =C2=A0 * exynos_eint_gpio_init() - setup handling of external gpio interr=
upts.
> =C2=A0 * @d: driver data of samsung pinctrl driver.
> @@ -834,6 +867,7 @@ void gs101_pinctrl_suspend(struct samsung_pin_bank *b=
ank)
> =C2=A0		pr_debug("%s: save=C2=A0=C2=A0=C2=A0 mask %#010x\n",
> =C2=A0			 bank->name, save->eint_mask);
> =C2=A0	}
> +	exynos_eint_set_filter(bank, EXYNOS_FLTCON_ANALOG);

Similar to patch 2, might be nicer to have this all if / else if to
make it more obvious that set_filter() is not unconditional.


> =C2=A0}
> =C2=A0
> =C2=A0void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
> @@ -889,6 +923,7 @@ void gs101_pinctrl_resume(struct samsung_pin_bank *ba=
nk)
> =C2=A0		writel(save->eint_mask, regs + bank->irq_chip->eint_mask
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset);
> =C2=A0	}
> +	exynos_eint_set_filter(bank, EXYNOS_FLTCON_DIGITAL);

dito.

Cheers,
Andre'

> =C2=A0}
> =C2=A0
> =C2=A0void exynos_pinctrl_resume(struct samsung_pin_bank *bank)
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/s=
amsung/pinctrl-exynos.h
> index 773f161a82a3..203d4b76a956 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> @@ -52,6 +52,27 @@
> =C2=A0#define EXYNOS_EINT_MAX_PER_BANK	8
> =C2=A0#define EXYNOS_EINT_NR_WKUP_EINT
> =C2=A0
> +/*
> + * EINT filter configuration register (on alive banks) has
> + * the following layout.
> + *
> + * BitfieldName[PinNum][Bit:Bit]
> + * FLT_EN[3][31] FLT_SEL[3][30] FLT_WIDTH[3][29:24]
> + * FLT_EN[2][23] FLT_SEL[2][22] FLT_WIDTH[2][21:16]
> + * FLT_EN[1][15] FLT_SEL[1][14] FLT_WIDTH[1][13:8]
> + * FLT_EN[0][7]=C2=A0 FLT_SEL[0][6]=C2=A0 FLT_WIDTH[0][5:0]
> + *
> + * FLT_EN	0x0 =3D Disable, 0x1=3DEnable
> + * FLT_SEL	0x0 =3D Analog delay filter, 0x1 Digital filter (clock count)
> + * FLT_WIDTH	Filtering width. Valid when FLT_SEL is 0x1
> + */
> +
> +#define EXYNOS_FLTCON_EN		BIT(7)
> +#define EXYNOS_FLTCON_DIGITAL		BIT(6)
> +#define EXYNOS_FLTCON_ANALOG		(0 << 6)
> +#define EXYNOS_FLTCON_MASK		GENMASK(7, 0)
> +#define EXYNOS_FLTCON_LEN		8
> +
> =C2=A0#define EXYNOS_PIN_BANK_EINTN(pins, reg, id)		\
> =C2=A0	{						\
> =C2=A0		.type		=3D &bank_type_off,	\
>=20


