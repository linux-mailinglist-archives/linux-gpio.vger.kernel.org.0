Return-Path: <linux-gpio+bounces-36062-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SC64OjeW+GkhwwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36062-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 14:51:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF5F4BD3DE
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 14:51:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E815230262D4
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 12:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7D73D7D7D;
	Mon,  4 May 2026 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9LBD7Lk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF12379986
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 12:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777899001; cv=none; b=bKISvULIepNWfuCmkup9wFiyPhJ+KLYIxY7rhDO4pIIl4AXjSbrkVaZzPMPxz0btW1nDk0JiTQ76O6Ac6LMWkWsocWWPq3FUNSQckIp1syvOtV0r2Io30GIZBwX0Gfoj770Y02T9MYSgTZIUC9nS1YpNsnHvXH37uY/4ZB6/z9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777899001; c=relaxed/simple;
	bh=+1FnhPZbpaCowm410vJXpQYNxfDfUsfEMGpLprfnB0Q=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=taePPB4eUCwlgmMbR9HcH143wC5N93KwCTDOGKEgYxeZE1u+pcQwFi5HgXVL1ywg8ZnQo60jEbNo6HukeNz5kEUgj+Ds30QS6DEXOimFIlkrRhpUucArNeMIWEJqeAIjE9IcrApOrMkGZt5ekAvPMPajt8rmz2SpGb1p1yh7fK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9LBD7Lk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21BA2C2BCB8
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 12:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777899001;
	bh=+1FnhPZbpaCowm410vJXpQYNxfDfUsfEMGpLprfnB0Q=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=A9LBD7LkPumPtzOcC7NXj8b9ftEbbqEcf9IlAz/PcdZ8IIRJaBX4GIQZP589zxiVo
	 cE04Ft4IkHdoupZfoJToNUtVd65sYQ6jno2GL8d1H0+/wHM0Bar9Nh2s+qs/GGnMMn
	 tmmGVDH22Aebd8kUsCfMEtns3Zada6tWl4oDMG+TOKD87mBLOWEe1aNBQjOA5JyR7e
	 DgOEo+N9B+iKBOKFOc+w7zJbAQX1rfTyq/qHTuE2GtBPgnSO0An8edt2PWpW+da7Mw
	 YcqtAevMhXVUiozHskAFPWV5DEo/8w4nxCcv3xUkNKBmmB36LwCQWxxnmqI7Mx+sBV
	 oKFvmffmo8Umw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a87782588cso589213e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 05:50:01 -0700 (PDT)
X-Gm-Message-State: AOJu0YyFSSyHp2dQhjBLM6tIvqQVzVIlk18Ew46uFZs/kkltimC62/sl
	S9f9ysltlXmvxbg7j1Rb+Sl2AxREWqXkgggGvE9JfjIbrYTJ/phR8P384mPQOP0cK1cpo+SUMln
	J5D/dZ4PYzZiqKK9AjJjw7DUeGzjhvxJSF9AS8Z8AkQ==
X-Received: by 2002:a05:6512:2251:b0:5a8:7247:ad38 with SMTP id
 2adb3069b0e04-5a87247b429mr982726e87.15.1777898999540; Mon, 04 May 2026
 05:49:59 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 May 2026 12:49:58 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 May 2026 12:49:58 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260502210354.160439-1-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502210354.160439-1-m32285159@gmail.com>
Date: Mon, 4 May 2026 12:49:58 +0000
X-Gmail-Original-Message-ID: <CAMRc=MfdB3Ht6DGP5x1BqQ36RzLeRpP9nz+S2CcKMPhfD=O9hg@mail.gmail.com>
X-Gm-Features: AVHnY4Lch37Q8iZRzoYkoyyQCQNAAr_yT_c4JYBXYHDxAea8QSSLCvgTkhsUzkY
Message-ID: <CAMRc=MfdB3Ht6DGP5x1BqQ36RzLeRpP9nz+S2CcKMPhfD=O9hg@mail.gmail.com>
Subject: Re: [PATCH] gpio: twl4030: Use guard(mutex)() over manual locking
To: Maxwell Doose <m32285159@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linusw@kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 6FF5F4BD3DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36062-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]

On Sat, 2 May 2026 23:03:54 +0200, Maxwell Doose <m32285159@gmail.com> said:
> Replace mutex_lock() and mutex_unlock() pairs with the RAII macro
> guard(mutex)(). This keeps the driver up-to-date with the latest
> function macros.
>
> Remove now-redundant gotos and goto labels which will maintain
> readability. In addition, replace some gotos with direct returns where
> appropriate.
>
> Update certain control paths to make them more suited to the new
> locking.
>
> Signed-off-by: Maxwell Doose <m32285159@gmail.com>
> ---
>  drivers/gpio/gpio-twl4030.c | 69 ++++++++++++++-----------------------
>  1 file changed, 26 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
> index a851702befde..df17f9c08817 100644
> --- a/drivers/gpio/gpio-twl4030.c
> +++ b/drivers/gpio/gpio-twl4030.c
> @@ -23,6 +23,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/of.h>
>  #include <linux/irqdomain.h>
> +#include <linux/cleanup.h>

Maybe order the includes alphabetically if you're at it?

>
>  #include <linux/mfd/twl.h>
>
> @@ -209,7 +210,7 @@ static int twl_request(struct gpio_chip *chip, unsigned offset)
>  	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
>  	int status = 0;
>
> -	mutex_lock(&priv->mutex);
> +	guard(mutex)(&priv->mutex);
>
>  	/* Support the two LED outputs as output-only GPIOs. */
>  	if (offset >= TWL4030_GPIO_MAX) {
> @@ -227,30 +228,29 @@ static int twl_request(struct gpio_chip *chip, unsigned offset)
>  		/* Configure PWM OFF register first */
>  		status = twl_i2c_write_u8(TWL4030_MODULE_LED, 0x7f, reg + 1);
>  		if (status < 0)
> -			goto done;
> +			return status;
>
>  		/* Followed by PWM ON register */
>  		status = twl_i2c_write_u8(TWL4030_MODULE_LED, 0x7f, reg);
>  		if (status < 0)
> -			goto done;
> +			return status;
>
>  		/* init LED to not-driven (high) */
>  		status = twl_i2c_read_u8(TWL4030_MODULE_LED, &cached_leden,
>  					 TWL4030_LED_LEDEN_REG);
>  		if (status < 0)
> -			goto done;
> +			return status;
>  		cached_leden &= ~ledclr_mask;
>  		status = twl_i2c_write_u8(TWL4030_MODULE_LED, cached_leden,
>  					  TWL4030_LED_LEDEN_REG);
>  		if (status < 0)
> -			goto done;
> +			return status;
>
>  		status = 0;
> -		goto done;
>  	}
>
>  	/* on first use, turn GPIO module "on" */
> -	if (!priv->usage_count) {
> +	else if (!priv->usage_count) {

This is a functional change, I'm not sure you want to change the logic.

>  		struct twl4030_gpio_platform_data *pdata;
>  		u8 value = MASK_GPIO_CTRL_GPIO_ON;
>
> @@ -264,11 +264,9 @@ static int twl_request(struct gpio_chip *chip, unsigned offset)
>  		status = gpio_twl4030_write(REG_GPIO_CTRL, value);
>  	}
>
> -done:
>  	if (!status)
>  		priv->usage_count |= BIT(offset);
>
> -	mutex_unlock(&priv->mutex);
>  	return status;
>  }
>
> @@ -276,10 +274,10 @@ static void twl_free(struct gpio_chip *chip, unsigned offset)
>  {
>  	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
>
> -	mutex_lock(&priv->mutex);
> +	guard(mutex)(&priv->mutex);
>  	if (offset >= TWL4030_GPIO_MAX) {
>  		WARN_ON_ONCE(twl4030_led_set_value(offset - TWL4030_GPIO_MAX, 1));
> -		goto out;
> +		return;
>  	}
>
>  	priv->usage_count &= ~BIT(offset);
> @@ -287,9 +285,6 @@ static void twl_free(struct gpio_chip *chip, unsigned offset)
>  	/* on last use, switch off GPIO module */
>  	if (!priv->usage_count)
>  		gpio_twl4030_write(REG_GPIO_CTRL, 0x0);
> -
> -out:
> -	mutex_unlock(&priv->mutex);
>  }
>
>  static int twl_direction_in(struct gpio_chip *chip, unsigned offset)
> @@ -297,17 +292,15 @@ static int twl_direction_in(struct gpio_chip *chip, unsigned offset)
>  	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
>  	int ret;
>
> -	mutex_lock(&priv->mutex);
> +	guard(mutex)(&priv->mutex);
>  	if (offset < TWL4030_GPIO_MAX)
>  		ret = twl4030_set_gpio_direction(offset, 1);
>  	else
> -		ret = -EINVAL;	/* LED outputs can't be set as input */
> +		return -EINVAL;	/* LED outputs can't be set as input */
>
>  	if (!ret)
>  		priv->direction &= ~BIT(offset);
>
> -	mutex_unlock(&priv->mutex);
> -
>  	return ret;
>  }
>
> @@ -317,10 +310,9 @@ static int twl_get(struct gpio_chip *chip, unsigned offset)
>  	int ret;
>  	int status = 0;
>
> -	mutex_lock(&priv->mutex);
> +	guard(mutex)(&priv->mutex);
>  	if (!(priv->usage_count & BIT(offset))) {
> -		ret = -EPERM;
> -		goto out;
> +		return -EPERM;
>  	}
>
>  	if (priv->direction & BIT(offset))
> @@ -328,10 +320,7 @@ static int twl_get(struct gpio_chip *chip, unsigned offset)
>  	else
>  		status = twl4030_get_gpio_datain(offset);
>
> -	ret = (status < 0) ? status : !!status;
> -out:
> -	mutex_unlock(&priv->mutex);
> -	return ret;
> +	return (status < 0) ? status : !!status;
>  }
>
>  static int twl_set(struct gpio_chip *chip, unsigned int offset, int value)
> @@ -339,7 +328,7 @@ static int twl_set(struct gpio_chip *chip, unsigned int offset, int value)
>  	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
>  	int ret;
>
> -	mutex_lock(&priv->mutex);
> +	guard(mutex)(&priv->mutex);
>  	if (offset < TWL4030_GPIO_MAX)
>  		ret = twl4030_set_gpio_dataout(offset, value);
>  	else
> @@ -350,8 +339,6 @@ static int twl_set(struct gpio_chip *chip, unsigned int offset, int value)
>  	else
>  		priv->out_state &= ~BIT(offset);
>
> -	mutex_unlock(&priv->mutex);
> -
>  	return ret;
>  }
>
> @@ -360,21 +347,19 @@ static int twl_direction_out(struct gpio_chip *chip, unsigned offset, int value)
>  	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
>  	int ret = 0;
>
> -	mutex_lock(&priv->mutex);
> -	if (offset < TWL4030_GPIO_MAX) {
> -		ret = twl4030_set_gpio_direction(offset, 0);
> -		if (ret) {
> -			mutex_unlock(&priv->mutex);
> -			return ret;
> +	scoped_guard(mutex, &priv->mutex) {
> +		if (offset < TWL4030_GPIO_MAX) {
> +			ret = twl4030_set_gpio_direction(offset, 0);
> +			if (ret)
> +				return ret;
>  		}
> -	}
>
> -	/*
> -	 *  LED gpios i.e. offset >= TWL4030_GPIO_MAX are always output
> -	 */
> +		/*
> +		 *  LED gpios i.e. offset >= TWL4030_GPIO_MAX are always output
> +		 */
>
> -	priv->direction |= BIT(offset);
> -	mutex_unlock(&priv->mutex);
> +		priv->direction |= BIT(offset);
> +	}
>
>  	return twl_set(chip, offset, value);
>  }
> @@ -388,15 +373,13 @@ static int twl_get_direction(struct gpio_chip *chip, unsigned offset)
>  	 */
>  	int ret = GPIO_LINE_DIRECTION_OUT;
>
> -	mutex_lock(&priv->mutex);
> +	guard(mutex)(&priv->mutex);
>  	if (offset < TWL4030_GPIO_MAX) {
>  		ret = twl4030_get_gpio_direction(offset);
>  		if (ret) {

Drop the brackets if there's only one line left. Same elsewhere.

> -			mutex_unlock(&priv->mutex);
>  			return ret;
>  		}
>  	}
> -	mutex_unlock(&priv->mutex);
>
>  	return ret;
>  }
> --
> 2.53.0
>
>

Bart

