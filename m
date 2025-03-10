Return-Path: <linux-gpio+bounces-17377-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A44DA5961C
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 14:22:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 727A43AB54B
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 13:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C274C22ACD2;
	Mon, 10 Mar 2025 13:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dT8+qqgk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13BA22A1E5;
	Mon, 10 Mar 2025 13:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741612881; cv=none; b=unS2Dh/IBsFCuWH8ZTHJYGf7KnW1qKHf9VnZTvMi5sE1E47GQnda99cWqKZbUQvDIU7XndWSwX8vYWcc5AQCD3Ljdcz/UOVwOJqxQFOE/iKhtYO3ugO0P9vVManyY/LpelrVOxKzfV2FQHMXPNGGoF6eoKSgGanfsnH7Wk9dIYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741612881; c=relaxed/simple;
	bh=IWlLF8DrTiQLV7YulM0bjPRBBicDPD7x0ITmE0vaaKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WPnCh0YZVHTrRL3O7RJHp/ABQM10JuHrn6hcS9KqMktGr2Nqgq7RrhVfmklp4AQLODeAvOUMFE6ZWjQBJwIs+C3wUh0U+qivQd+bt7zi7vMMSGhcRXVQcsyhBk+D0Z1xAghFwY9ZIcNcQmnPFHbaQFdQWKvv78UPP4s6noZv7R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dT8+qqgk; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54993c68ba0so3052706e87.2;
        Mon, 10 Mar 2025 06:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741612878; x=1742217678; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NRfmnl323OF9SrXb4A5kibGIpi4d7DcYj7fQ/ScUAs8=;
        b=dT8+qqgkIoy1HhSbj9SVJrTr1gHwtNS5dsj8K7IVSPxImzGXWGMeGZ25i4zJQEao3I
         XO78x9IwgicngjJZlNF9Yf+LJbYnackVFuVkdzAqmNdAh1tXOcFuoHrzClo7fe8muCUc
         nLEqtwb44Y366Ns4oZv99SRKxsr/zbDo4pTLsfKbRbOKCNqC/I5141lezZvjrcJMAoXk
         O117yeDybXEW+azdn1vDcmePFR4NjQfOz1EQZYyY26V4zilGURp3JnNKRG2RSzzDcX+n
         kINRriumNMNjKUqttLgSRzuE+TJaO0uvRa3PneaNlbYyO3kqhRF/OUduEss2D5bnK2Eg
         u+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741612878; x=1742217678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NRfmnl323OF9SrXb4A5kibGIpi4d7DcYj7fQ/ScUAs8=;
        b=TBKpeJAtV5Im71P9t3hhexEXqG1pB8ykLIJ5wNMP7UjpTkGOHur/LRlUPHjL1GpfrK
         gADghU1nyCsGLwMnLkeDtxOPsIo1EtcgWynqxJfxhuzs6QFaF4oRi0YeUF6ygQB+k7Wa
         K0wD6SdTJ5EYA0PUcm7r2GRrGFOeW6vAgPorFDuweIYxrhRm3ZhwSiDvKRHT9lyOWxTD
         7xdf7lCDpkpLSOGHMj09VJlYeFXWSVhSr4i4KkrilsKWUu0gjFaj6EkR1ZHyavttyvdP
         rCraFEmQ14TzONI7RTlkqX9v2UTztx2IVQt1R9GJ0OU72OIfC2IahXTWY5M6SeDMenXf
         MCXg==
X-Forwarded-Encrypted: i=1; AJvYcCVD4HRHBqFhXZozb+27ZyrkMZQXHGx3aozt8PNpx35NIOCu0yI6exmawocDIUtcbK8ScmBDSfGKajFVOhA=@vger.kernel.org, AJvYcCXTmiXhtA3ahy/NU0xn/78zjfAZVNlRV3LLVnBZOWBoum3xpKnCq71g9iAWGFTstdZumZSRead0eEiwAq7wvNpbU3U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi9BoNAvqyo7V4wi0mkwFPJaCI3KV2vA4n+EulDKhM0bzy4Y1z
	xili+BwbmQyUADVfu8SuosZVu/dZv9DczPzcKrcu+bQb6MHjzYBD
X-Gm-Gg: ASbGncvp6c1Yl+jMVuKcjXm3d/SuqTWdfGXLfVXGne3hUQG0LrzIZuwrWLU/yzGhFpb
	spmj5dd71oe5kjOoR4mR2SJP9z+JTBfpYRyXVkm7D/OHe18HICIf7ViC1VhD4tHbXMJ50sv/nD8
	H24ilp2DoTa9AcG6Enk85eiEiUAZL+Epm9qFjKcLryXg1ExjVocwFLe4qLC3Y9rlG+aLAdhHbI6
	QDPeVYipxutpfzBo8PBvFN5RLZDoOX3QgL7Tf8UfU/RJDtv9JZHhgphDweLoATHGjzbNn5PWh9J
	IK0hm1H6IIUq+9ObeLLGzsDb/SAJMSXXx46ZEyw73trT0/VCuyQu8l995wSv+/OiNZLSCVuidQn
	0mnpGp34rGmEuUDYF1plt5oScqw==
X-Google-Smtp-Source: AGHT+IGzewgmmnkeUFlJxWe8i0noE76ISEIkVEffA0dNVquaPUe/6tnIFsh0KoI73h3zjnHlAGQFQw==
X-Received: by 2002:a05:6512:3a8d:b0:545:cd5:84d9 with SMTP id 2adb3069b0e04-54990e5d338mr4308933e87.12.1741612877738;
        Mon, 10 Mar 2025 06:21:17 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae5902dsm1475143e87.99.2025.03.10.06.21.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 06:21:16 -0700 (PDT)
Message-ID: <bd86f1fe-8cd5-40f3-b06a-ed48a3ae5d5f@gmail.com>
Date: Mon, 10 Mar 2025 15:21:16 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/15] gpio: bd9571mwv: use new line value setter
 callbacks
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
 <20250310-gpiochip-set-conversion-v1-5-03798bb833eb@linaro.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250310-gpiochip-set-conversion-v1-5-03798bb833eb@linaro.org>
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
>   drivers/gpio/gpio-bd9571mwv.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-bd9571mwv.c b/drivers/gpio/gpio-bd9571mwv.c
> index 9a4d55f703bb..8df1361e3e84 100644
> --- a/drivers/gpio/gpio-bd9571mwv.c
> +++ b/drivers/gpio/gpio-bd9571mwv.c
> @@ -72,13 +72,13 @@ static int bd9571mwv_gpio_get(struct gpio_chip *chip, unsigned int offset)
>   	return val & BIT(offset);
>   }
>   
> -static void bd9571mwv_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +static int bd9571mwv_gpio_set(struct gpio_chip *chip, unsigned int offset,
>   			      int value)
>   {
>   	struct bd9571mwv_gpio *gpio = gpiochip_get_data(chip);
>   
> -	regmap_update_bits(gpio->regmap, BD9571MWV_GPIO_OUT,
> -			   BIT(offset), value ? BIT(offset) : 0);
> +	return regmap_update_bits(gpio->regmap, BD9571MWV_GPIO_OUT,
> +				  BIT(offset), value ? BIT(offset) : 0);
>   }
>   
>   static const struct gpio_chip template_chip = {
> @@ -88,7 +88,7 @@ static const struct gpio_chip template_chip = {
>   	.direction_input	= bd9571mwv_gpio_direction_input,
>   	.direction_output	= bd9571mwv_gpio_direction_output,
>   	.get			= bd9571mwv_gpio_get,
> -	.set			= bd9571mwv_gpio_set,
> +	.set_rv			= bd9571mwv_gpio_set,
>   	.base			= -1,
>   	.ngpio			= 2,
>   	.can_sleep		= true,
> 


