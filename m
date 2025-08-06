Return-Path: <linux-gpio+bounces-24021-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9F6B1C12A
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 09:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05A0018A0E2E
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 07:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD692212B3D;
	Wed,  6 Aug 2025 07:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9DwHWrE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA521EB9F2;
	Wed,  6 Aug 2025 07:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754464734; cv=none; b=cRjDQs7TY7Ynf58+cruQTt2T/RT5A3bx2RgpnZrGGVzYtklp/RK2Om6oaTEnr1z8uUtJ6/2/g5EGgemphPXFDrzKwFLC9kNzlCL0ogphS4DsEik0J/JesQBZFwJe019BfjkA7DFhHrTRHv3jOCvH5nHCfGsV96IG/aW2rBXA/1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754464734; c=relaxed/simple;
	bh=wpxQ1s0i40oS2OBy1CFVyOyFnXhCSHIq3YQabEpp/p0=;
	h=Date:From:Subject:To:Cc:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IC/aaRCdTYmrN/9BhYAw+mQlDB5OdIKeBe5sTqmaJuRFOj6Y2EwsqwVMrJiitBvrtPksc3pt62b8WXMjPmeOp+zAi++nt/43lYq6WrDg+PHhq9uhZDs4poZC892PKKQE/UnyLSenTmqkw/iGWjdNfCxucRCLYjUkRJiU4ebExnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9DwHWrE; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-459e210bd2dso1750135e9.1;
        Wed, 06 Aug 2025 00:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754464731; x=1755069531; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcORt+J7xAb8pmnip8ym6roKKrM2AoIWZ5wNS91iof4=;
        b=j9DwHWrEEfU5eOWe3Sv+rEwXZaTQniic3FJeo6+oisf8OLxae0IR3rQCS+9eUJYFHD
         So+DVfbmWLJb99iGJhXjfmWKypZUvwFeGjwf9b+FOif8ZpB65Sl2XxYSQaP1kA37k2JT
         g3Mo86r2A/BTl7q8LrHhkyuQnpBrFJYhfWxAhaAgUMFeYErhVfNkSonaCjDibKpliX60
         axiOkYEnALXmTPsbgHEmCtqrrzs/VpaXqyH3dtVepRzknEzvPqq+ciHFzOLuuSESFuo2
         moavv3ogIs6c+w4HyYtMFsAQtVee6G6NrEO+vPBtQ48jdL581dL4XSq9pzBgpnw20jXy
         rfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754464731; x=1755069531;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcORt+J7xAb8pmnip8ym6roKKrM2AoIWZ5wNS91iof4=;
        b=akxGQ/NtMRCZrAJzaPo2SpqW9bffnzza+9uHfYj/RlO3g+h/b3wYfGjncyVjvC+RG6
         hAybWo/MY5ZyQksF0EzAfwMMkNbDkVNz5Wtq8DoRT9mfxFsYedKYjmUllPtGIQ6PyaJK
         /0wKQrnzBBiiN+ajgkBD8lMxA5p9MGZSfxi8FXJaPZzOevM7XDsrK8J4RBbqVjjSN/EH
         bkYNfIi3CogWQ0pRuP4UtLKzLpjoU6D3SH3N5tyON2Si8olWQ81YiJRidcf74e0BqMM1
         pHXyuLb3tIZa9rvsPerR4nxXpY10A6bWss5/hLbP/u0PDqyakbaou47RQYOoNokVE/aY
         EggA==
X-Forwarded-Encrypted: i=1; AJvYcCVdMbAeRUgIXtKCVcXssPrRYccle+OYN4eg/3VrJhvhxyBcBmCP70E4qrwPle/Fi4zWm1rrN6iNnBMlfzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOr4/XeD0IwH+MD++20rGCH0RCqa5RAd2ytgbV1ppfbIEkVFia
	2ud8fcPvZXsIpwOJO9/bSaKH3RYaYraYzQINSDMDZ5S2kVzvsFueViz1KgxyQZ8l
X-Gm-Gg: ASbGncthD1mK0bJs1xrLqNJI7mgv3Xi7atz5QKsJgKhmNFliVp7qRmhlGfWibEwaYz8
	s07H2d3QgQasVLJLt4FgSyoZcx/c097twhwdMRkLYulVUzZ8Vpq2cxENXL4i4Rd9Bqpw00uXsTV
	h+QL212ZysNdYTuD5ShI6MFu6AgsxoXaVek9Fvg07b7DMdSMQcUikQQeLV7BsZukLRwYPgNZ3PG
	wUN69h6FruzbnzxGPy5+L93RruNX8tXQllC9Xm/hH1ovexguNnGJfP7oxFsm51sL+qHmXMXz1hO
	HqakS/qvn9IrfOOvnpMcSKb2recQMHe20OHaawEhEvua4HXqeXLr868tAEQQDuCBvZD92fbu7Qh
	C1wsdaFEvSQSKf+gx+8+F/Y5p+cNEEEgEOVNur62N1YSFkGJB8XaSyyyyrreGhPg=
X-Google-Smtp-Source: AGHT+IEdsDjU+JrlWdnHOZ+roZlE/WDrWuWM2AJJmWEpeMY8pnVcWD/QpMp2KTsa3dR9lNnbtnj0HA==
X-Received: by 2002:a05:600c:3147:b0:453:6c45:ce14 with SMTP id 5b1f17b1804b1-459e70768acmr12696365e9.4.1754464730903;
        Wed, 06 Aug 2025 00:18:50 -0700 (PDT)
Received: from [10.14.5.169] (93-38-186-193.ip71.fastwebnet.it. [93.38.186.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3c4d02sm21412951f8f.33.2025.08.06.00.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 00:18:50 -0700 (PDT)
Date: Wed, 06 Aug 2025 11:17:15 +0200
From: Stefano Manni <stefano.manni@gmail.com>
Subject: Re: [PATCH] gpio: pisosr: read ngpios as U32
To: linus.walleij@linaro.org, brgl@bgdev.pl
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Stefano Manni
	<stefano.manni@eletechsrl.it>
Message-Id: <R4FK0T.J4M42BU49IZ9@gmail.com>
In-Reply-To: <20250805142856.18360-1-stefano.manni@gmail.com>
References: <20250805142856.18360-1-stefano.manni@gmail.com>
X-Mailer: geary/46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed

Please take v2: 
https://lore.kernel.org/linux-gpio/20250806091531.109861-1-stefano.manni@gmail.com/T/#u

On mar, ago 5 2025 at 16:28:56 +02:00:00, Stefano Manni 
<stefano.manni@gmail.com> wrote:
> From: Stefano Manni <stefano.manni@eletechsrl.it>
> 
> If of_property_read_u16() is used instead the value read
> is always zero.
> 
> Signed-off-by: Stefano Manni <stefano.manni@eletechsrl.it>
> Signed-off-by: Stefano Manni <stefano.manni@gmail.com>
> ---
>  drivers/gpio/gpio-pisosr.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
> index a69b74866a13..2dc1b1e021d2 100644
> --- a/drivers/gpio/gpio-pisosr.c
> +++ b/drivers/gpio/gpio-pisosr.c
> @@ -117,6 +117,7 @@ static int pisosr_gpio_probe(struct spi_device 
> *spi)
>  {
>  	struct device *dev = &spi->dev;
>  	struct pisosr_gpio *gpio;
> +	unsigned int ngpio;
>  	int ret;
> 
>  	gpio = devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
> @@ -125,8 +126,11 @@ static int pisosr_gpio_probe(struct spi_device 
> *spi)
> 
>  	gpio->chip = template_chip;
>  	gpio->chip.parent = dev;
> -	of_property_read_u16(dev->of_node, "ngpios", &gpio->chip.ngpio);
> 
> +	if (of_property_read_u32(dev->of_node, "ngpios", &ngpio))
> +		ngpio = DEFAULT_NGPIO;
> +
> +	gpio->chip.ngpio = ngpio;
>  	gpio->spi = spi;
> 
>  	gpio->buffer_size = DIV_ROUND_UP(gpio->chip.ngpio, 8);
> --
> 2.48.1
> 



