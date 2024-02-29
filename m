Return-Path: <linux-gpio+bounces-3967-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C8B86CAC5
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 14:56:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D10AC1F22DA4
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 13:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C57D12A17A;
	Thu, 29 Feb 2024 13:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PLPdM5vk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001158626B
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 13:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709215009; cv=none; b=tgwt3G3eEq337N44DYQJoM3eFBzyV5aRlOyVIlkaah/uNiBioOGHIZPdFt00T/Jmmn8NYrQ9B/xA5EJGeSOxXcjxJM7z/LrFO59w/+WgSTACcQhDn7xgbvtMlzozlzM4mTs03UfHVZVNGjxcmiJGPOJxphIe1QYmrgpXaCpBQnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709215009; c=relaxed/simple;
	bh=G/VaUVncQgGlRa2pys1Vi1dIIn09HOy27QTrgTzIkyA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=rg6vV5uCAzIDsb8q1aL8DwCtEghEYq1zrKlJz2kPv/UvCa+ET2LUaiqTdHPTVobVROumVOwUpA3kgS28PpfrnSqJkX1vTHZ9A/HkNJkTO/Q2mK6fhPKJwg0a7HAWLPaqk+ZtTKR5PKD/xdNcG5weKP12/z+LV6CRzcZavdxkX/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PLPdM5vk; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-429de32dad9so5319611cf.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 05:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709215006; x=1709819806; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNhdXSdXkLjYVE0deMxEiGlQYDwDvXw88ZjC208fOao=;
        b=PLPdM5vkMcjaYJEM/JBZ54lJoq+tLh4Zh/mhL3O6riIhSBMrpvccm0RnYQIClGmi0S
         qEWM4syXXwXNOHz8L3iSVMcUfA4Gpn6c6gKlaIwN35GaDMeFYGhwf4+PUGkVumoYeyNq
         GDNA3gnVCQse5zZqIFjqDlRsSjra7EFkpCIkDioMwzfdxib0SwVyMfSTkbVj6WobHwce
         DfLsvBpmroJ26vOTAAEnWfgsQEc+/ZU+oPNdyp8jYEnkH9ncCiFbAJGl6vPj/HsBungq
         x/ziYfKW0fjrhvnHzCRKsgxCHtyFYUVZoLrfQHaEFJqJvYbDQ3SiWhPIitmRpYvwLEoX
         FsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709215006; x=1709819806;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UNhdXSdXkLjYVE0deMxEiGlQYDwDvXw88ZjC208fOao=;
        b=pIyoK8qwrfHUUZulRVVQfgjgqxj/ywiSmAboU8yU17SPSBs2D8rIJo/Ig45JK4M0ts
         sXtoTR053yh3tpfRM+BY04jqVkMdZ1dGsLvbOFMZ7xiPtom0GdBjHplZVavL7mKA+GfL
         A0fdHAEfeo0s0kLIPVwJ2Mb9/eatyCc4NeikR55zhef7ivhJgp1y1tLb9ji5sR/HxGP8
         LIvdWlZPinGdhbELgnqcaydrit4iyJ+eiKkpF7fsqpAQTUsqY9hnELnDXPE1BZjJ+jkg
         JI2E9BqRsInFHkfLgkqFnfpwuaBVDlw31z3Z7cFm0mPsBAx/ak8Kf9T5n8L5+VcRoUYE
         STgA==
X-Forwarded-Encrypted: i=1; AJvYcCVQfJop1GVW4E/VhLFkLcAwjq07uwgnlWCvRyZ71DFYSG46gKwT4G58wFOuihhKG58TLupailD8p5EGNL+e3+a2ulOD0ZwjCsbS6Q==
X-Gm-Message-State: AOJu0YzPyW49oMpQcePNogCB6rNCHrtJbQ/vBlmVo8GJQ4ITU0GocNQR
	MWrDi7yDd4Tfe5xVr3CBwc5e+Ez3w14HePbGNhMB4dPxzqspq42GiPlGFaVBqjw=
X-Google-Smtp-Source: AGHT+IEBTojVUp8KOWJFuGjpZRNuTCVqmMqtQlVhuYYbIVXRAFqeFqc1mPKHL93Sf9q9YMhtXSG3EQ==
X-Received: by 2002:ac8:7ca:0:b0:42e:b8d1:2b2a with SMTP id m10-20020ac807ca000000b0042eb8d12b2amr1769677qth.48.1709215005911;
        Thu, 29 Feb 2024 05:56:45 -0800 (PST)
Received: from localhost (alyon-651-1-22-137.w82-122.abo.wanadoo.fr. [82.122.123.137])
        by smtp.gmail.com with ESMTPSA id wm18-20020a05620a581200b00787e1e94d00sm683328qkn.109.2024.02.29.05.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 05:56:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Feb 2024 14:56:41 +0100
Message-Id: <CZHM5FYHS6G0.295L6AYUNZCT@baylibre.com>
Subject: Re: [PATCH v2 13/14] pinctrl: pinctrl-tps6594: Add TPS65224 PMIC
 pinctrl and GPIO
From: "Esteban Blanc" <eblanc@baylibre.com>
To: "Bhargav Raviprakash" <bhargav.r@ltts.com>,
 <linux-kernel@vger.kernel.org>
Cc: <m.nirmaladevi@ltts.com>, <lee@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <jpanis@baylibre.com>, <devicetree@vger.kernel.org>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <nm@ti.com>, <vigneshr@ti.com>,
 <kristo@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240223093701.66034-1-bhargav.r@ltts.com>
 <20240223093701.66034-14-bhargav.r@ltts.com>
In-Reply-To: <20240223093701.66034-14-bhargav.r@ltts.com>

On Fri Feb 23, 2024 at 10:37 AM CET, Bhargav Raviprakash wrote:
> From: Nirmala Devi Mal Nadar <m.nirmaladevi@ltts.com>
>
> Add support for TPS65224 pinctrl and GPIOs to TPS6594 driver as they
> have significant functional overlap.
> TPS65224 PMIC has 6 GPIOS which can be configured as GPIO or other
> dedicated device functions.
>
> Signed-off-by: Nirmala Devi Mal Nadar <m.nirmaladevi@ltts.com>
> Signed-off-by: Bhargav Raviprakash <bhargav.r@ltts.com>
> ---
>  drivers/pinctrl/pinctrl-tps6594.c | 287 +++++++++++++++++++++++++-----
>  1 file changed, 246 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-tps6594.c b/drivers/pinctrl/pinctrl-=
tps6594.c
> index 66985e54b..5da21aa14 100644
> --- a/drivers/pinctrl/pinctrl-tps6594.c
> +++ b/drivers/pinctrl/pinctrl-tps6594.c

> @@ -201,7 +319,21 @@ static int tps6594_gpio_regmap_xlate(struct gpio_reg=
map *gpio,
> =20
>  static int tps6594_pmx_func_cnt(struct pinctrl_dev *pctldev)
>  {
> -	return ARRAY_SIZE(pinctrl_functions);
> +	struct tps6594_pinctrl *pinctrl =3D pinctrl_dev_get_drvdata(pctldev);
> +	int func_cnt =3D 0;
> +
> +	switch (pinctrl->tps->chip_id) {

See below.

> @@ -229,10 +361,26 @@ static int tps6594_pmx_set(struct tps6594_pinctrl *=
pinctrl, unsigned int pin,
>  			   u8 muxval)
>  {
>  	u8 mux_sel_val =3D muxval << TPS6594_OFFSET_GPIO_SEL;
> +	u8 mux_sel_mask =3D 0;
> +
> +	switch (pinctrl->tps->chip_id) {

See below.

> @@ -240,16 +388,28 @@ static int tps6594_pmx_set_mux(struct pinctrl_dev *=
pctldev,
>  {
>  	struct tps6594_pinctrl *pinctrl =3D pinctrl_dev_get_drvdata(pctldev);
>  	u8 muxval =3D pinctrl->funcs[function].muxval;
> +	unsigned int remap_cnt =3D 0;
> +	struct muxval_remap *remap;
> =20
>  	/* Some pins don't have the same muxval for the same function... */
> -	if (group =3D=3D 8) {
> -		if (muxval =3D=3D TPS6594_PINCTRL_DISABLE_WDOG_FUNCTION)
> -			muxval =3D TPS6594_PINCTRL_DISABLE_WDOG_FUNCTION_GPIO8;
> -		else if (muxval =3D=3D TPS6594_PINCTRL_SYNCCLKOUT_FUNCTION)
> -			muxval =3D TPS6594_PINCTRL_SYNCCLKOUT_FUNCTION_GPIO8;
> -	} else if (group =3D=3D 9) {
> -		if (muxval =3D=3D TPS6594_PINCTRL_CLK32KOUT_FUNCTION)
> -			muxval =3D TPS6594_PINCTRL_CLK32KOUT_FUNCTION_GPIO9;
> +	switch (pinctrl->tps->chip_id) {

See below.

> @@ -276,7 +436,21 @@ static const struct pinmux_ops tps6594_pmx_ops =3D {
> =20
>  static int tps6594_groups_cnt(struct pinctrl_dev *pctldev)
>  {
> -	return ARRAY_SIZE(tps6594_pins);
> +	struct tps6594_pinctrl *pinctrl =3D pinctrl_dev_get_drvdata(pctldev);
> +	int num_pins =3D 0;
> +
> +	switch (pinctrl->tps->chip_id) {

See below.

> @@ -320,8 +494,18 @@ static int tps6594_pinctrl_probe(struct platform_dev=
ice *pdev)
>  		return -ENOMEM;
>  	pctrl_desc->name =3D dev_name(dev);
>  	pctrl_desc->owner =3D THIS_MODULE;
> -	pctrl_desc->pins =3D tps6594_pins;
> -	pctrl_desc->npins =3D ARRAY_SIZE(tps6594_pins);
> +	switch (tps->chip_id) {

See below.

> @@ -329,8 +513,18 @@ static int tps6594_pinctrl_probe(struct platform_dev=
ice *pdev)
>  	if (!pinctrl)
>  		return -ENOMEM;
>  	pinctrl->tps =3D dev_get_drvdata(dev->parent);
> -	pinctrl->funcs =3D pinctrl_functions;
> -	pinctrl->pins =3D tps6594_pins;
> +	switch (pinctrl->tps->chip_id) {

See below.

> @@ -338,8 +532,18 @@ static int tps6594_pinctrl_probe(struct platform_dev=
ice *pdev)
> =20
>  	config.parent =3D tps->dev;
>  	config.regmap =3D tps->regmap;
> -	config.ngpio =3D TPS6594_PINCTRL_PINS_NB;
> -	config.ngpio_per_reg =3D 8;
> +	switch (pinctrl->tps->chip_id) {

Regarding all the switch case, I think you should try and put all the
differences inside the `struct tps6594_pinctrl`. This way most of the
functions (if not all of them) could be writen without the switch case,
making them more readable and straight forward to understand.
You already have some switch case in the probe, why not fill the `struct
tps6594_pintcl` there and use these new fileds in the different
function.

It's not pretty today, imagine if in the future there is more supported
chip, it would be quite unreadable IMAO.

Other than that the changes looks fine to me. I will have to boot a
board with TPS6594 to check that whole series did not break anything.

Please add me to your Cc for the next round.

Best regards,

--=20
Esteban "Skallwar" Blanc
BayLibre

