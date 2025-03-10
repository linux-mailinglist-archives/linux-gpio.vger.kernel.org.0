Return-Path: <linux-gpio+bounces-17374-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1456DA595E8
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 14:16:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 317D53A63BF
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 13:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E290229B2D;
	Mon, 10 Mar 2025 13:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdxatPs3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D8E229B05;
	Mon, 10 Mar 2025 13:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741612585; cv=none; b=BtmkG0ywYJN2bY727dEJSSNAwznfhgQ2/i4p9m7WB8jRWrBm4bMus7ab2v/x5xTKTgrxKJJRYIsZqY1dDIOfHUQOMfVE79AKJe6KNy96ZJ7SFx/6bcf2+M0VbiPqku5iGV2aW9fe3zd4OrPwuSnw5OZSXtMa97brez+oI2f31IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741612585; c=relaxed/simple;
	bh=M8qonvUQhRRmrlcJ0hhHz3omTRWoZtZPhcLCp42I2ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZL1dPfTUvErOeuo0+WIdQahK+pZMa4xjOzIw7MtE8ulhYJ1JrlPHfC4cDucfR6DSa2URNwOSr0uLIan5xXKhyZXbWVnR7xiK5/3nF1qtjCX2FgcK6xbDHFyC53yBVnZaeh1LP9G/0l57NSX7Pu4YGOknXaKvs22ZfDBHy9uLXNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdxatPs3; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-547bcef2f96so4366444e87.1;
        Mon, 10 Mar 2025 06:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741612581; x=1742217381; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VelmRFPde53xqbAzlgnHoP18LxVcPepOhlqsb8RM6wc=;
        b=kdxatPs3D5rjJZ0UDPQadawfJaNd3m5s/6hskTybniAqAZo8fb62F0zTOovZo+MGPG
         N69PcNROfjXgw5/0V2UHapnfv+bAGAamrGMSrn/wXmYhzDSJGL4PF/VwqJpyaWUvOEoL
         jboGTlHZyNj3AocW2CJ4AuyreWuUn5Vn8Kxi01Owkfbqyl9ujA1rtluCHQDJNIlltbzP
         KG+rvK46QKaNsSiQeo77cppagyKt00MuRwVQLQg7okSk/oRQ2HdeL6kAXqG6mnO6bxGm
         9em/FfUqWMnWAI/jOHMzOOX/S47Ejrt6pKFtYLAuVaOtsAoAMYhaUjOI2tnyvK0Soohq
         Rbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741612581; x=1742217381;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VelmRFPde53xqbAzlgnHoP18LxVcPepOhlqsb8RM6wc=;
        b=CRQGgGnHEGZVJFu1pTLhzChHJBBGVP5Zh2zhuFO29fVmQ5ryu7y6C7UzDKKu297oSs
         vAt9RyIf4dYUTdxfSIYhxbnJdTbjgXHwBvU2UuQoMvxRddfOfl4wVzcTDk2QoSuteaRA
         LwALY388PEqCvQt7p0ZXFmKUm/YwiLhmuPkN4E/3shiGN5yS9sCwEK1kgfc96sLw5v0L
         aRSHZr9hIAy13zpLzmsWKdIImHlQXbclsHPP4Cg4ltkIZdC0HLpBHoO/TOsnjAI4VvJe
         lvUoKPiInBlbuWuE2Z++/ez1mJwpPbQEliw0yQnrhiCHySQVLEb3adGOu/QFXSI8a9Ae
         Ekiw==
X-Forwarded-Encrypted: i=1; AJvYcCUSSi3Y5rTtmbxuoCsLPpgv2K/bRoG22m3NZZhgBN0SEbE6EqJy9Wt7nTh6l9Bab7cMXjUvKDERFC3x5o8=@vger.kernel.org, AJvYcCVP8SIUnub90OByUcGYgbMTuHa9Q5fdKFdvBtuwse0dNLKi03GwtESIOLQJEy7q2yxHdzQeR/jmzZRyRlTJ86j6E68=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVxzRfpPk5KRl1KQbvTuznzosp0+tvWR8xLlwosuOJMHGrxWEk
	nbGiEaKCbnrsL67gQt8z0ioUBcuTMkfOh/P8QIZR+0g9tBcT1/P3
X-Gm-Gg: ASbGnct40xgG1u5Uyl6dfdok85llZ0aauGnwE0CUhsrxZHL4xN0BRFq6XERLWHCOrwo
	dkztgknF/KD/NQeoI5oB4+3/IoJ1sNOYANV7Pcr2kSILCF8oRkwEG/4sMlAr5IG4lUOSrLHVeOW
	asdOfmiO1srLPU+DIvpZrC2+7HVZ+bbCF5k6n/RrTBqKU7AAzylH3Df2uH7vchImYDo8JWsbwj+
	Hn67I0i/cqJhF4GrAm8yxlWbBZ7oZruN0W6H/XNj7BJTdAWxg2BkE3Zff7n2JbC5OG327Cggmnb
	pcFMlKwPk0YAHO1yApPrJ9ybScRJ68t01mq1tIXU4cZ8CTxJP9/DG0lC/W1mk37kKHd4Zy2GHHi
	d1ePONk1i3ZXqStM92ro60SYxF02B3XwoHHTY
X-Google-Smtp-Source: AGHT+IEN6RA/FhUKAi67rrISyQvUAXdp5U/gAvAoDg3KjSkA/WcDoaiTVPJIm1UgDUAvGtdLc/DPIg==
X-Received: by 2002:a05:6512:ba6:b0:549:8ed4:fb64 with SMTP id 2adb3069b0e04-54990e6725bmr5092561e87.24.1741612581068;
        Mon, 10 Mar 2025 06:16:21 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b1bbee4sm1461221e87.168.2025.03.10.06.16.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 06:16:20 -0700 (PDT)
Message-ID: <a9f27271-320b-4cd3-a3bb-bd5aa3ac30da@gmail.com>
Date: Mon, 10 Mar 2025 15:16:19 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/15] gpio: bd71815: use new line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>, Ray Jui <rjui@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Michael Buesch <m@bues.ch>,
 Thomas Richard <thomas.richard@bootlin.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Andy Shevchenko <andy@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, chrome-platform@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
 <20250310-gpiochip-set-conversion-v1-3-03798bb833eb@linaro.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250310-gpiochip-set-conversion-v1-3-03798bb833eb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/03/2025 14:40, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Thanks!

> ---
>   drivers/gpio/gpio-bd71815.c | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-bd71815.c b/drivers/gpio/gpio-bd71815.c
> index 08ff2857256f..36701500925e 100644
> --- a/drivers/gpio/gpio-bd71815.c
> +++ b/drivers/gpio/gpio-bd71815.c
> @@ -37,21 +37,18 @@ static int bd71815gpo_get(struct gpio_chip *chip, unsigned int offset)
>   	return (val >> offset) & 1;
>   }
>   
> -static void bd71815gpo_set(struct gpio_chip *chip, unsigned int offset,
> -			   int value)
> +static int bd71815gpo_set(struct gpio_chip *chip, unsigned int offset,
> +			  int value)
>   {
>   	struct bd71815_gpio *bd71815 = gpiochip_get_data(chip);
> -	int ret, bit;
> +	int bit;
>   
>   	bit = BIT(offset);
>   
>   	if (value)
> -		ret = regmap_set_bits(bd71815->regmap, BD71815_REG_GPO, bit);
> -	else
> -		ret = regmap_clear_bits(bd71815->regmap, BD71815_REG_GPO, bit);
> +		return regmap_set_bits(bd71815->regmap, BD71815_REG_GPO, bit);
>   
> -	if (ret)
> -		dev_warn(bd71815->dev, "failed to toggle GPO\n");
> +	return regmap_clear_bits(bd71815->regmap, BD71815_REG_GPO, bit);
>   }
>   
>   static int bd71815_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
> @@ -88,7 +85,7 @@ static const struct gpio_chip bd71815gpo_chip = {
>   	.owner			= THIS_MODULE,
>   	.get			= bd71815gpo_get,
>   	.get_direction		= bd71815gpo_direction_get,
> -	.set			= bd71815gpo_set,
> +	.set_rv			= bd71815gpo_set,
>   	.set_config		= bd71815_gpio_set_config,
>   	.can_sleep		= true,
>   };
> 


