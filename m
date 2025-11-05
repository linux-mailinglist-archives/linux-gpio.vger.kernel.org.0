Return-Path: <linux-gpio+bounces-28086-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF59C349A0
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 09:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC8E118C8FB2
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 08:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8ACA2E093E;
	Wed,  5 Nov 2025 08:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iaJuOu+L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E982E284A
	for <linux-gpio@vger.kernel.org>; Wed,  5 Nov 2025 08:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762332682; cv=none; b=cLyc9eK9gY0Hk0tdM27k4PrZKpVQ3GcvHGmxvyb/DvhZSrOmp0jj+lUyXYM9iWZpmcMaLlV7jbCHQW9nI48L9q6ehbnsuy56hxN+CHbwRb5bVaFHgQ4L94YNovKbYVYcNvPZjOwxFKvgI6IG7Si4yy7DUX7dvEI66KKVH4G8y+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762332682; c=relaxed/simple;
	bh=MC0E0LFV/xPEYcoJSyRt7YbqwEmoTDhxfkNTbgU/xNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uTtdNK2QkgrAhn+yF5IUPHQuwkWkpI7r/L5i/B8AzSQ8aPCnvaaayQcbFWeTR67+modCjVgsB1KtehPA86b8wHPNvIagUo5vxBB9WSKiXtcBM86vkDUxq4HA8Lk8/WVP+Ql+pq8H4A1pcC3ovlYRhgyHOOSSNFjKfaax7MK4010=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iaJuOu+L; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DA2D64E41522;
	Wed,  5 Nov 2025 08:51:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A76EC60693;
	Wed,  5 Nov 2025 08:51:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6D3F210B51B68;
	Wed,  5 Nov 2025 09:51:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762332671; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=SGMIavh+U2EDQDSS/pNGC+7pHshWF/DndMrY4tOtrpA=;
	b=iaJuOu+LZNyNp0nQwOmzehXT+PA5/6t0gcb8lUhFw/SUvhokUgLy5MdfKhqNNkGFW0Kw0K
	OzWIt0wHVi0OB9xXE0uZj5gWwQQV59BaKqBEj6ikBx9hl+B0uCyCWI46NTj6YX25bqyj53
	W7NF63xJWL6UW/VdYq1NpBwM60bTYchoQQs279XR+rEGIcaByQWWy7jkvYqmHcfcgBtEDr
	2N8sQukctUzJhwkk6aLLuaNmKf8PnOKsl74FVdHdMVEWi+10e0Ev77CnQfkXZk5JwUh1yd
	vnOwsa1KAiFXoHR/5laU9iqKPl2cJli+8AB/qo2F07QxG4pNxdNh6rrkZWa9aA==
Message-ID: <087643b4-7a29-4424-a3b0-b60bbc7c3140@bootlin.com>
Date: Wed, 5 Nov 2025 09:51:08 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] gpio: add gpio-line-mux driver
To: Jonas Jelonek <jelonek.jonas@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251104210021.247476-1-jelonek.jonas@gmail.com>
 <20251104210021.247476-3-jelonek.jonas@gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20251104210021.247476-3-jelonek.jonas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Jonas,

On 11/4/25 10:00 PM, Jonas Jelonek wrote:
> Add a new driver which provides a 1-to-many mapping for a single real
> GPIO using a multiplexer. Each virtual GPIO corresponds to a multiplexer
> state which, if set for the multiplexer, connects the real GPIO to the
> corresponding virtual GPIO.

[...]

> +
> +struct gpio_lmux {
> +	struct gpio_chip gc;
> +	struct mux_control *mux;
> +	struct mutex lock;
> +
> +	struct gpio_desc *shared_gpio;
> +	/* dynamically sized, must be last */
> +	unsigned int gpio_mux_states[];
> +};
> +
> +DEFINE_GUARD(gpio_lmux, struct gpio_lmux *, mutex_lock(&_T->lock), mutex_unlock(&_T->lock))

I think you don't need this. A mutex guard is already defined in the
mutex header file [1].

So you just have to call:

	guard(mutex)(&glm->lock);

[1]
https://elixir.bootlin.com/linux/v6.17.7/source/include/linux/mutex.h#L228

> +
> +static int gpio_lmux_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct gpio_lmux *glm = (struct gpio_lmux *)gpiochip_get_data(gc);

useless cast

Best Regards,
Thomas

