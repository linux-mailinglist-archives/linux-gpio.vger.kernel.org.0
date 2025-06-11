Return-Path: <linux-gpio+bounces-21417-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E3BAD6255
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 00:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DEED17F175
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 22:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18158248F7E;
	Wed, 11 Jun 2025 22:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="CQP/2RSc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8233244684
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 22:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749680532; cv=none; b=kNqF13kHmhCRz3S1x0wjuFO4xQggBJdP3A1X6teEdhjJTu70NQoJo0b4012ksv5C1AsJFVq2JqSGcQJahjU5IJNmPWLty7abu3IiOoexP5Z27t2cm1f4fC6Dw4DppvFvivsJSYkgxbrufMloIwEYa+neDlYe/j0IFB5JfbIDsz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749680532; c=relaxed/simple;
	bh=J1+vvNnJkt9XAUeHMDEtolpBQ4940dsHU+99an2m8Ts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WbvPWsQFsFVeeyNPq/EdoOcrnHfK1cY1RPNsISe3frOP27yXBaaSaRp5pOxorbbhR8eVU2sfxJlKh4o9N87AuSkUD0acwGyklBVXM0R2MFxfXlvAwvfCCnKt64SKIlBskEARu6KT9Yv7S7d5L0Pm0WCvlFOx7oecEc/qIkEYMV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=CQP/2RSc; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-311a6236effso328825a91.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 15:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1749680530; x=1750285330; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hECvCp2144ISjYFuCPwHbO2eSKNwdlu+MMKqmQG6JC0=;
        b=CQP/2RSc3bQlG/mG3+ynatwTRxaQ9ozhRhvIv+554F43gDqqnvygxACE//ULcgIXrs
         pM3lyLmbkMGmSZJMn0w43OQL17SsaNEQ8hUTYTVK25caPy9a1ONqCjZwvy/nItNeS2u1
         ZRtpmC7WPYFt1+UYUFPejvvseu0dro91N8WrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749680530; x=1750285330;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hECvCp2144ISjYFuCPwHbO2eSKNwdlu+MMKqmQG6JC0=;
        b=OhHMAkcx4tiItEP6fggKMLC49TRFNS9SSWSreFGGJt+0lvccgzvVq9b65kWz3rd3lJ
         AkG9tjK+80Lt8PoqgV4l03uRmlOeej9nYcESSX3O4rhe/VeGeKmOIXHhwO9G/1KIKUyG
         BCD6pBFuxWWwJjasDdF2bqQP2vESu0uLMze6ZALKqXHlOxXbNPKpWQsAk1Ci1oiPNFwK
         dcphASH+w3lr+epU0sAExF2/6EPxhNYBv7qWqdEN2Hh21a5vbxzYFkbK95I2vj+y3uWt
         Rcj56Q9p92ajzZ8BqZXg6bKR7FUIDBmOyqvfNlsaLw22yAv+hAN+xAg9KD0IVTZkgEUa
         auOA==
X-Forwarded-Encrypted: i=1; AJvYcCXxsYJlZNbgdi6XWWT43vmqO7H5HxnPNqoWHs51urlc3E36th9TLFHGDxwE4injRxCQgv60GTxVfc43@vger.kernel.org
X-Gm-Message-State: AOJu0Yz26RUNWWM5kar2eEGkD7j6FiG5z2m88e9teYa3cYeZe3RH4oH8
	IP1RsRcTxAPAzDDqJMv2eINGIhP+41qsB/4DYEOqm5Rcr1+oEpW9Aci4QtjwmbBguDWxm7l2cwv
	KHLwQ01rMj1qujcoYj8mK59TIkJKQVNn9bv7DkEatVA==
X-Gm-Gg: ASbGncvP2EV7rr1LRPuZ/7g43tm/RNardaWxkDPpbqSFOATatLApnNfbD5HkiHaVhe6
	QIUOYRg30kTpVG0FmnhT73jQQc+zl+0hss983jyBXlhWmUg3v1Qh+EOPn9n71H28qHpEDtpF056
	51/eGCA8tyQaEfq+xMp0YIgzFcaJkqA8loTaeOVAweJA/g53S/hwjI65orGoNjW2nPkKzzRVf/D
	Vtt
X-Google-Smtp-Source: AGHT+IE8FknUC40PscBGYY7OPNelZLLkTFE7qxHwumbpWqTQtgyRPt7nCSuQoA+6xvyngwoaYT3v2ByQ5TtYzKrW9d8=
X-Received: by 2002:a17:90b:2892:b0:312:26d9:d5b6 with SMTP id
 98e67ed59e1d1-313bfba12a1mr1389789a91.3.1749680529907; Wed, 11 Jun 2025
 15:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org> <20250610-gpiochip-set-rv-gpio-v1-7-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-7-3a9a3c1472ff@linaro.org>
From: Daniel Palmer <daniel@thingy.jp>
Date: Thu, 12 Jun 2025 07:21:56 +0900
X-Gm-Features: AX0GCFuAPMzR2tj8IuIF1_MflSdk31p_mu_qD7qQzgmBFTWEvU6XX8YEN4mo1dI
Message-ID: <CAFr9PXmeYETV5FSAnEacFCo7LiS3cYBpPqraexLC7=MTzshfNg@mail.gmail.com>
Subject: Re: [PATCH 07/12] gpio: msc313: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Romain Perier <romain.perier@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Tue, 10 Jun 2025 at 21:33, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-msc313.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
> index 6db9e469e0dc254e791d497b89a4c6d329d0add4..992339a89d19840fc03ccf849972a83cb86415ae 100644
> --- a/drivers/gpio/gpio-msc313.c
> +++ b/drivers/gpio/gpio-msc313.c
> @@ -486,7 +486,7 @@ struct msc313_gpio {
>         u8 *saved;
>  };
>
> -static void msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
> +static int msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
>  {
>         struct msc313_gpio *gpio = gpiochip_get_data(chip);
>         u8 gpioreg = readb_relaxed(gpio->base + gpio->gpio_data->offsets[offset]);
> @@ -497,6 +497,8 @@ static void msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int val
>                 gpioreg &= ~MSC313_GPIO_OUT;
>
>         writeb_relaxed(gpioreg, gpio->base + gpio->gpio_data->offsets[offset]);
> +
> +       return 0;
>  }
>
>  static int msc313_gpio_get(struct gpio_chip *chip, unsigned int offset)
> @@ -656,7 +658,7 @@ static int msc313_gpio_probe(struct platform_device *pdev)
>         gpiochip->direction_input = msc313_gpio_direction_input;
>         gpiochip->direction_output = msc313_gpio_direction_output;
>         gpiochip->get = msc313_gpio_get;
> -       gpiochip->set = msc313_gpio_set;
> +       gpiochip->set_rv = msc313_gpio_set;
>         gpiochip->base = -1;
>         gpiochip->ngpio = gpio->gpio_data->num;
>         gpiochip->names = gpio->gpio_data->names;
>
> --
> 2.48.1
>

Reviewed-by: Daniel Palmer <daniel@thingy.jp>

Cheers,

Daniel

