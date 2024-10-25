Return-Path: <linux-gpio+bounces-12101-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F1E9B0321
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 14:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05B7D1C22D24
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 12:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD9E20651C;
	Fri, 25 Oct 2024 12:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xlixw56A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC98A2064FD;
	Fri, 25 Oct 2024 12:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729860353; cv=none; b=VvLl7wl2wQpQljG6M+sHUlSujXDjxDRhZ5pBsIz4/SONu9sqnQLisN+tyPqO3zhUaGcW+v08wat7VxqvY6GDHXtQDHFJU7rvtH4tF+CdxFoOntHBWJxXAl2ZHGNZAOQwrBpxV6Si6TlT2i6y9dlAJUCf9Q6zULJWul/Cl37aPMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729860353; c=relaxed/simple;
	bh=M45+IrFCDm5whN7JuzP+ufYFVBATlDx8hP8tOU4aM4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lrmrIb/TPq+ERJWYB62XNgY18PFhFv8YgvNLufeh/YxrQwtnD3mg9NMYilA1IpoCLspjzwviSybOV7utBH6bsUv+ssg74se5ghhBZq2/sMdIfWidMPzpjCp4CZZHvF+SFznnUsd0lgk+zH+kvlN3NXHlRdwBrC48npBbklI+lkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xlixw56A; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9a2cdc6f0cso273797466b.2;
        Fri, 25 Oct 2024 05:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729860349; x=1730465149; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9IEBNygevkwQNZu1U5FyCKWkFfhzXCDi5dfAjhFS+xQ=;
        b=Xlixw56A8Ud92zIFNFzeB5n+OJ6s/XXV4pKVZFD192GWMsK9r6LrZZI+uHumT/imrK
         TRl7S7ZtqFizIftDtUEJWMjWLJoX/G9TCr3qvjTg2eX2tMscqoRM52EnsMaldD07PFYS
         A5WnpbEYf077OiAv7bMKdjvzMteLosUxBZunvXxBoJzpWSR26TUsOaqCjnuCEGekO2I0
         Y0FFDPv6mbPIQbRmPxBAe3To4i+42kVmBc39Oj+vXMZCxGFlGPQLznuFryTT+l8xt1sJ
         uG/wwSOD9oVYHt9LdCkqaTKt5u5HJ4jyaBGdkEVm7hbrMdbiFInfD5iQXcR/ig87W6a7
         fkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729860349; x=1730465149;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9IEBNygevkwQNZu1U5FyCKWkFfhzXCDi5dfAjhFS+xQ=;
        b=dog/HuS9BHsLZPQfX7MhlvwVRvs9WhDJPMVrNSONZIJtN02Z/R6zc8XrCRgwxF36Bk
         e+Q95LljhLa4gxdGLoxjsBk8NoEAgyagB2+m4El+LjemKeXrmBtoJC5WQjDgzUmbOl+7
         JdsEsSHShk+KKiGipG78YhwY2JfGV/siGjJMFtARd3suT5kzzkQU9IcofHBgmZ6YIGby
         UPXPGkujZ3KFXkuVL+6oo5PMboIQyctz2JN4Qo16w8KNKLKttebpgfsUunKAFIOe7nB+
         qydGM9oczE/FK8y9Wk5z7VpIwisYJNdw6UQr8EyVzBtkWOykxZk+xDhXSmauMxuoATnh
         Ir5w==
X-Forwarded-Encrypted: i=1; AJvYcCUAYu6NXpETStW0TZG2YOCZ1b+jKvpxKLsWxnkO9qh9+O+26/xnClJoIPYY01Ich4ov4XZKIpfat2i/3ElRVwxv7QE=@vger.kernel.org, AJvYcCUYkOwWrBM8BsYSv4UovgLbOH6Qy1Camg4fcx3ZMTuPp1JU164hIp5bmPiuZi1T9vFCSlyyvy5MA8cT0xef@vger.kernel.org, AJvYcCVYXyLHpqz4j+0566bBsIgK1Eb9/K/VdOQsiP4p8oI9iNvFz5NoIn0A4PrLQVjV+7AZL36AgNT5PzIz@vger.kernel.org
X-Gm-Message-State: AOJu0YzWYpx7HMDlePKcfvwoW+t9hLeerqieh3HGnd5gbmy/zW/nIZZc
	k9bOrhjoXig1NRvxml1I94fEaDeYI+ghgVDwOHt+SnVjYavyp1dhYSq0fot2
X-Google-Smtp-Source: AGHT+IF3ox8PvDqMUukjKbUJTn9UxLimEb3hJAauNi1rSCh9lgU4OuiSITC4LEqMTkYTD82EWNkIlg==
X-Received: by 2002:a17:906:d54e:b0:a9a:38e6:2fdf with SMTP id a640c23a62f3a-a9abf96d1ffmr847883166b.64.1729860348617;
        Fri, 25 Oct 2024 05:45:48 -0700 (PDT)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dec7feasm67337966b.38.2024.10.25.05.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 05:45:48 -0700 (PDT)
Message-ID: <c956e16b-8334-4988-9f8a-20b94f6e1668@gmail.com>
Date: Fri, 25 Oct 2024 15:45:46 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] pinctrl: samsung: Add Exynos9810 SoC specific
 data
To: Markuss Broks <markuss.broks@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa
 <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maksym Holovach <nergzd@nergzd723.xyz>
References: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
 <20241025-exynos9810-v2-10-99ca3f316e21@gmail.com>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20241025-exynos9810-v2-10-99ca3f316e21@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit




On 10/25/24 14:24, Markuss Broks wrote:
> Add Samsung Exynos9810 SoC specific data to enable pinctrl
> support for platforms based on Exynos9810.
>
> Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
> Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
>
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 154 +++++++++++++++++++++++++
>  drivers/pinctrl/samsung/pinctrl-samsung.c      |   2 +
>  drivers/pinctrl/samsung/pinctrl-samsung.h      |   1 +
>  3 files changed, 157 insertions(+)
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> index f07c26d374425505019447161150929f7677f91d..3ea7106ce5eae3c21f11790b5a40037042c1d407 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> @@ -767,6 +767,160 @@ const struct samsung_pinctrl_of_match_data exynos990_of_data __initconst = {
>  	.num_ctrl	= ARRAY_SIZE(exynos990_pin_ctrl),
>  };
>  
> +/* pin banks of exynos9810 pin-controller 0 (ALIVE) */
> +static const struct samsung_pin_bank_data exynos9810_pin_banks0[] __initconst = {
> +	EXYNOS850_PIN_BANK_EINTN(6, 0x000, "etc1"),
> +	EXYNOS850_PIN_BANK_EINTW(8, 0x020, "gpa0", 0x00),
> +	EXYNOS850_PIN_BANK_EINTW(8, 0x040, "gpa1", 0x04),
> +	EXYNOS850_PIN_BANK_EINTW(8, 0x060, "gpa2", 0x08),
> +	EXYNOS850_PIN_BANK_EINTW(8, 0x080, "gpa3", 0x0c),
> +	EXYNOS850_PIN_BANK_EINTN(6, 0x0A0, "gpq0"),
> +	EXYNOS850_PIN_BANK_EINTW(2, 0x0C0, "gpa4", 0x10),
> +};
> +
> +/* pin banks of exynos9810 pin-controller 1 (AUD) */
> +static const struct samsung_pin_bank_data exynos9810_pin_banks1[] __initconst = {
> +	EXYNOS850_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpb1", 0x04),
> +	EXYNOS850_PIN_BANK_EINTG(4, 0x040, "gpb2", 0x08),
> +};
> +
> +/* pin banks of exynos9810 pin-controller 2 (CHUB) */
> +static const struct samsung_pin_bank_data exynos9810_pin_banks2[] __initconst = {
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gph0", 0x00),
> +	EXYNOS850_PIN_BANK_EINTG(5, 0x020, "gph1", 0x04),
> +};
> +
> +/* pin banks of exynos9810 pin-controller 3 (CMGP) */
> +static const struct samsung_pin_bank_data exynos9810_pin_banks3[] __initconst = {
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x000, "gpm0", 0x00),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x020, "gpm1", 0x04),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x040, "gpm2", 0x08),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x060, "gpm3", 0x0C),

Small nit - for the next version,  stay consistent with the lowercase
letters in hex numbers - for ex.: 0x0c

Best regards, Ivo

> +	EXYNOS850_PIN_BANK_EINTW(1, 0x080, "gpm4", 0x10),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x0A0, "gpm5", 0x14),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x0C0, "gpm6", 0x18),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x0E0, "gpm7", 0x1C),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x100, "gpm10", 0x20),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x120, "gpm11", 0x24),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x140, "gpm12", 0x28),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x160, "gpm13", 0x2C),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x180, "gpm14", 0x30),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x1A0, "gpm15", 0x34),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x1C0, "gpm16", 0x38),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x1E0, "gpm17", 0x3C),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x200, "gpm40", 0x40),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x220, "gpm41", 0x44),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x240, "gpm42", 0x48),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x260, "gpm43", 0x4C),
> +};
> +
> +/* pin banks of exynos9810 pin-controller 4 (FSYS0) */
> +static const struct samsung_pin_bank_data exynos9810_pin_banks4[] __initconst = {
> +	EXYNOS850_PIN_BANK_EINTG(2, 0x000, "gpf0", 0x00),
> +};
> +
> +/* pin banks of exynos9810 pin-controller 5 (FSYS1) */
> +static const struct samsung_pin_bank_data exynos9810_pin_banks5[] __initconst = {
> +	EXYNOS850_PIN_BANK_EINTG(7, 0x000, "gpf1", 0x00),
> +	EXYNOS850_PIN_BANK_EINTG(6, 0x020, "gpf2", 0x04),
> +};
> +
> +/* pin banks of exynos9810 pin-controller 6 (PERIC0) */
> +static const struct samsung_pin_bank_data exynos9810_pin_banks6[] __initconst = {
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp0", 0x00),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp1", 0x04),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpp2", 0x08),
> +	EXYNOS850_PIN_BANK_EINTG(4, 0x060, "gpp3", 0x0C),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpg0", 0x10),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x0A0, "gpg1", 0x14),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x0C0, "gpg2", 0x18),
> +};
> +
> +/* pin banks of exynos9810 pin-controller 7 (PERIC1) */
> +static const struct samsung_pin_bank_data exynos9810_pin_banks7[] __initconst = {
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp4", 0x00),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp5", 0x04),
> +	EXYNOS850_PIN_BANK_EINTG(4, 0x040, "gpp6", 0x08),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpc0", 0x0C),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpc1", 0x10),
> +	EXYNOS850_PIN_BANK_EINTG(4, 0x0A0, "gpd0", 0x14),
> +	EXYNOS850_PIN_BANK_EINTG(7, 0x0C0, "gpg3", 0x18),
> +};
> +
> +/* pin banks of exynos9810 pin-controller 8 (VTS) */
> +static const struct samsung_pin_bank_data exynos9810_pin_banks8[] __initconst = {
> +	EXYNOS850_PIN_BANK_EINTG(3, 0x000, "gpt0", 0x00),
> +};
> +
> +static const struct samsung_pin_ctrl exynos9810_pin_ctrl[] __initconst = {
> +	{
> +		/* pin-controller instance 0 ALIVE data */
> +		.pin_banks      = exynos9810_pin_banks0,
> +		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks0),
> +		.eint_wkup_init = exynos_eint_wkup_init,
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +		.suspend        = exynos_pinctrl_suspend,
> +		.resume         = exynos_pinctrl_resume,
> +	}, {
> +		/* pin-controller instance 1 AUD data */
> +		.pin_banks      = exynos9810_pin_banks1,
> +		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks1),
> +	}, {
> +		/* pin-controller instance 2 CHUB data */
> +		.pin_banks      = exynos9810_pin_banks2,
> +		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks2),
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +		.suspend        = exynos_pinctrl_suspend,
> +		.resume         = exynos_pinctrl_resume,
> +	}, {
> +		/* pin-controller instance 3 CMGP data */
> +		.pin_banks      = exynos9810_pin_banks3,
> +		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks3),
> +		.eint_wkup_init = exynos_eint_wkup_init,
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +		.suspend        = exynos_pinctrl_suspend,
> +		.resume         = exynos_pinctrl_resume,
> +	}, {
> +		/* pin-controller instance 4 FSYS0 data */
> +		.pin_banks      = exynos9810_pin_banks4,
> +		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks4),
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +		.suspend        = exynos_pinctrl_suspend,
> +		.resume         = exynos_pinctrl_resume,
> +	}, {
> +		/* pin-controller instance 5 FSYS1 data */
> +		.pin_banks      = exynos9810_pin_banks5,
> +		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks5),
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +		.suspend        = exynos_pinctrl_suspend,
> +		.resume         = exynos_pinctrl_resume,
> +	}, {
> +		/* pin-controller instance 6 PERIC0 data */
> +		.pin_banks      = exynos9810_pin_banks6,
> +		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks6),
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +		.suspend        = exynos_pinctrl_suspend,
> +		.resume         = exynos_pinctrl_resume,
> +	}, {
> +		/* pin-controller instance 7 PERIC1 data */
> +		.pin_banks      = exynos9810_pin_banks7,
> +		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks7),
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +		.suspend        = exynos_pinctrl_suspend,
> +		.resume         = exynos_pinctrl_resume,
> +	}, {
> +		/* pin-controller instance 8 VTS data */
> +		.pin_banks      = exynos9810_pin_banks8,
> +		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks8),
> +	},
> +};
> +
> +const struct samsung_pinctrl_of_match_data exynos9810_of_data __initconst = {
> +	.ctrl		= exynos9810_pin_ctrl,
> +	.num_ctrl	= ARRAY_SIZE(exynos9810_pin_ctrl),
> +};
> +
>  /* pin banks of exynosautov9 pin-controller 0 (ALIVE) */
>  static const struct samsung_pin_bank_data exynosautov9_pin_banks0[] __initconst = {
>  	EXYNOS850_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> index 42e40860841bcc94e3c11bf313df792da10ab00b..bbedd980ec67234aad847b757f40af5002b11ebb 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -1479,6 +1479,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
>  		.data = &exynos850_of_data },
>  	{ .compatible = "samsung,exynos8895-pinctrl",
>  		.data = &exynos8895_of_data },
> +	{ .compatible = "samsung,exynos9810-pinctrl",
> +		.data = &exynos9810_of_data },
>  	{ .compatible = "samsung,exynos990-pinctrl",
>  		.data = &exynos990_of_data },
>  	{ .compatible = "samsung,exynosautov9-pinctrl",
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
> index 615048f945243d4173d40142f1e62c8aeefe5b7e..bb0689d52ea0b4392714fa9bcdcbae8d253c73a1 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> @@ -385,6 +385,7 @@ extern const struct samsung_pinctrl_of_match_data exynos7_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos7885_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos8895_of_data;
> +extern const struct samsung_pinctrl_of_match_data exynos9810_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos990_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynosautov9_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynosautov920_of_data;
>


