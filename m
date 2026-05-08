Return-Path: <linux-gpio+bounces-36464-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKtHE4/f/Wn0jwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36464-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 15:05:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B62B74F6C31
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 15:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D1F7306CB02
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 13:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1F53E1220;
	Fri,  8 May 2026 13:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="qtRUiz5Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F202773CA
	for <linux-gpio@vger.kernel.org>; Fri,  8 May 2026 13:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778245429; cv=none; b=go4MaVJVhcd6iDJ/W0CoXvRdvRTwm5CpKFXOmyEa2yLqKDt6F103ydvBsAlDm1EapwqfhIGOUJwvPuYQvMJwARZWGobrzimlDcJ+XdCVyNqWN/jN4/tQOWl6k8/OS8GR9fFTd29ZjFgGBmmR6jy8uYPzK4EOElNt0vwAuwZhc5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778245429; c=relaxed/simple;
	bh=pt7XlsbOA9tv1TtrGt/RRq/85eL+D59/sDcgqu5C8XY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qgMqpc72q2gktvZhcoq+EipdGgIpKjxv/r9pO7CtlTmgvPbqHXh3NkUTFl3+UumBnnojRj3hqAlHWr8vWcQtpRlqUTAF9rU7rbiAQXtvWE4Tdz7ewYGz9ajAImZP8cYqEeUNl9c0zEiRXPR7IdBXrNZY3rxhlzN2LT0jwV/IPyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=qtRUiz5Z; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-682fce74c06so1324446eaf.3
        for <linux-gpio@vger.kernel.org>; Fri, 08 May 2026 06:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778245426; x=1778850226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4uYSKJlZDlhRVMvkmCmHZTLX4HWfRTth6fnS9HRLT2Q=;
        b=qtRUiz5Zogp3NkjZ8rJ1gsIAuVw4z0S3IiBZ+KIRiR5dMd9eY60gnVWlS8uCwYSMMy
         vJoEu9JeREoEWV4aicuzkk43TKP6iN8SjivnhOLOBaYIQpJH3YUXY7fNJ5bM50OKazoo
         Vgneib5nQaxVDJZyBXZZmSVgZ44auQlUElKIrrGJFiGjDb/kqoFSe0h3Vsaymy8hpdCX
         RG5n/dWMxi+ghJdmHCMQBPQLXBQOUPHjam2PvCnJV8M1wW6QQuS1/xNGwJFBuV3CpkAo
         A9YVOOAhFpTMcA5uyQQe8x+iS7Cwh6Q5APAMtG/Y120qrx/3SejU42+F1hyKU9P2HH1R
         Il2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778245426; x=1778850226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4uYSKJlZDlhRVMvkmCmHZTLX4HWfRTth6fnS9HRLT2Q=;
        b=cA197GMtbCvwvLQXbemVNISwDbNr2hrQ4wb7pFTp5rbnEB872pzii8tSeGWajjggaH
         CpI6+BVLBFpvoDfCcjma72Y2RyT+IwoFKrCiHuTqW0fGjeo+U33Buva1fbTcCbUlSsR5
         6xUiNct7006F0dv7gEKXeEmuw8+AOldlfCwl1L6YsVKhsSFmn9x1Xp5k/7l8HiGua7hL
         ZuWTGKL/QhmI9ULFFr2eau59pqEXr2YNLVH2kk+XN3EWSpvS/6wNQAghJH4DAuplmxX2
         QqcwBOJySC/VoPnNmxKxTGCoZRtJa1nVk8jOqTCyjMmW5CVdg0AT3KOglgLo0VJ1yV2g
         /lmw==
X-Gm-Message-State: AOJu0YylRqBhQReTPnJLcAEJrUViN5B6loLpqQmav3oWmhx0FZ9/rCA+
	xU2OIVqaUthiWYJdsK4iXKSkY3oBxYXDYYgw4PmVWAHw0zCHdIXigLcOifZsG4JnBEA=
X-Gm-Gg: AeBDieuwEZBvsHfmhEWzlwO8tcun8h7tm+Upu/8+d7CSZNnlBEW7lEKx08qAAlGNorF
	gFBazWM88YI6zVKtueNRxwzTfhSoZNhqExkUfU5khZeK1nfFqnY1j7+D+L1SCmQPeM3yH9/ViYo
	VnxwwVisri2ibXv1tbFtK2NsEmObl+M08eb+k1Wdhbgl4iC3varRcWxRNQtOyh/eRB9/Irn4KkA
	9ap2JVsE5y8JyptkvvXkmfR2g4LLXkFV08WuLYSofkSmndsHARidFVhnxHo1N1atSBsPQitSI8P
	wEqP5ryvzP82Wehz4D8nbE5fiSAM+9dbz1r38eLykp1wMu+rOCq8rTXghidzpSLfCUQ69V2JpNa
	/+4zHZuEdWMg58BJuWZ2eUasRGbrvFtEjK0nbgAVLidRCDMSRi/IOSEZsh6QeP6QHgJ+pPpaLNf
	LsCCqVRT6R5N8VJa9gkj+FwAAG3uWiKzerzlcErsdi9liMPTQ3jt5q0qREPzYT4LKf+Do9axSQr
	g==
X-Received: by 2002:a05:6820:160a:b0:680:89db:fd86 with SMTP id 006d021491bc7-69998cd7cd3mr7066137eaf.13.1778245425501;
        Fri, 08 May 2026 06:03:45 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf39c7dd09sm17034776d6.31.2026.05.08.06.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 06:03:44 -0700 (PDT)
Message-ID: <6f15ed94-c52d-41c6-9e96-68e96c70d287@riscstar.com>
Date: Fri, 8 May 2026 08:03:43 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] gpio: regmap: Support sparsed fixed direction
To: Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260508-regmap-gpio-sparse-fixed-dir-v2-0-deee84df3027@kernel.org>
 <20260508-regmap-gpio-sparse-fixed-dir-v2-1-deee84df3027@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260508-regmap-gpio-sparse-fixed-dir-v2-1-deee84df3027@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B62B74F6C31
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.56 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36464-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar-com.20251104.gappssmtp.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,riscstar.com:email,riscstar.com:mid]
X-Rspamd-Action: no action

On 5/8/26 7:51 AM, Linus Walleij wrote:
> On some regmapped GPIOs apparently only a sparser selection
> of the lines (not all) are actually fixed direction.
> 
> Support this situation by adding an optional bitmap indicating
> which GPIOs are actually fixed direction and which are not.
> 
> Cc: Alex Elder <elder@riscstar.com>
> Link: https://lore.kernel.org/linux-gpio/20260501155421.3329862-10-elder@riscstar.com/
> Tested-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>



In addition, it would be fine with me if you merged this together
iwth your new patch:

  
https://lore.kernel.org/lkml/20260508-regmap-gpio-sparse-fixed-dir-v2-2-deee84df3027@kernel.org/

It makes sense and it is logically part of the same change.

I even tested with that change applied, even though I know
just by inspection it will do what's desired.

Anyway, for both (or a combined single patch), these apply:

Tested-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Alex Elder <elder@riscstar.com>


					-Alex

> ---
>   drivers/gpio/gpio-regmap.c  | 37 +++++++++++++++++++++++++++++++++----
>   include/linux/gpio/regmap.h |  7 +++++++
>   2 files changed, 40 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index 9ae4a41a2427..f45a432e8ebe 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -31,6 +31,7 @@ struct gpio_regmap {
>   	unsigned int reg_clr_base;
>   	unsigned int reg_dir_in_base;
>   	unsigned int reg_dir_out_base;
> +	unsigned long *fixed_direction_sparse;
>   	unsigned long *fixed_direction_output;
>   
>   #ifdef CONFIG_REGMAP_IRQ
> @@ -138,6 +139,20 @@ static int gpio_regmap_set_with_clear(struct gpio_chip *chip,
>   	return regmap_write(gpio->regmap, reg, mask);
>   }
>   
> +static bool gpio_regmap_fixed_direction(struct gpio_regmap *gpio,
> +					unsigned int offset)
> +{
> +	if (!gpio->fixed_direction_output)
> +		return false;
> +
> +	/* In this case only some GPIOs are fixed as input/output */
> +	if (gpio->fixed_direction_sparse &&
> +	    !test_bit(offset, gpio->fixed_direction_sparse))
> +		return false;
> +
> +	return true;
> +}
> +
>   static int gpio_regmap_get_direction(struct gpio_chip *chip,
>   				     unsigned int offset)
>   {
> @@ -145,7 +160,7 @@ static int gpio_regmap_get_direction(struct gpio_chip *chip,
>   	unsigned int base, val, reg, mask;
>   	int invert, ret;
>   
> -	if (gpio->fixed_direction_output) {
> +	if (gpio_regmap_fixed_direction(gpio, offset)) {
>   		if (test_bit(offset, gpio->fixed_direction_output))
>   			return GPIO_LINE_DIRECTION_OUT;
>   		else
> @@ -302,12 +317,23 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
>   			goto err_free_gpio;
>   	}
>   
> +	if (config->fixed_direction_sparse) {
> +		gpio->fixed_direction_sparse = bitmap_alloc(chip->ngpio,
> +							    GFP_KERNEL);
> +		if (!gpio->fixed_direction_sparse) {
> +			ret = -ENOMEM;
> +			goto err_free_gpio;
> +		}
> +		bitmap_copy(gpio->fixed_direction_sparse,
> +			    config->fixed_direction_sparse, chip->ngpio);
> +	}
> +
>   	if (config->fixed_direction_output) {
>   		gpio->fixed_direction_output = bitmap_alloc(chip->ngpio,
>   							    GFP_KERNEL);
>   		if (!gpio->fixed_direction_output) {
>   			ret = -ENOMEM;
> -			goto err_free_gpio;
> +			goto err_free_bitmap_sparse;
>   		}
>   		bitmap_copy(gpio->fixed_direction_output,
>   			    config->fixed_direction_output, chip->ngpio);
> @@ -329,7 +355,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
>   
>   	ret = gpiochip_add_data(chip, gpio);
>   	if (ret < 0)
> -		goto err_free_bitmap;
> +		goto err_free_bitmap_output;
>   
>   #ifdef CONFIG_REGMAP_IRQ
>   	if (config->regmap_irq_chip) {
> @@ -355,8 +381,10 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
>   
>   err_remove_gpiochip:
>   	gpiochip_remove(chip);
> -err_free_bitmap:
> +err_free_bitmap_output:
>   	bitmap_free(gpio->fixed_direction_output);
> +err_free_bitmap_sparse:
> +	bitmap_free(gpio->fixed_direction_sparse);
>   err_free_gpio:
>   	kfree(gpio);
>   	return ERR_PTR(ret);
> @@ -376,6 +404,7 @@ void gpio_regmap_unregister(struct gpio_regmap *gpio)
>   
>   	gpiochip_remove(&gpio->gpio_chip);
>   	bitmap_free(gpio->fixed_direction_output);
> +	bitmap_free(gpio->fixed_direction_sparse);
>   	kfree(gpio);
>   }
>   EXPORT_SYMBOL_GPL(gpio_regmap_unregister);
> diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
> index 12d154732ca9..ff00b4aeaf1c 100644
> --- a/include/linux/gpio/regmap.h
> +++ b/include/linux/gpio/regmap.h
> @@ -38,6 +38,12 @@ struct regmap;
>    *			offset to a register/bitmask pair. If not
>    *			given the default gpio_regmap_simple_xlate()
>    *			is used.
> + * @fixed_direction_sparse:
> + *			(Optional) Bitmap representing the GPIO lines that
> + *			make use of the @fixed_direction_output list to
> + *			enforce direction of the GPIO. If this is NULL
> + *			and @fixed_direction_output is defined, ALL GPIOs
> + *			are assumed to be fixed direction (out or in).
>    * @fixed_direction_output:
>    *			(Optional) Bitmap representing the fixed direction of
>    *			the GPIO lines. Useful when there are GPIO lines with a
> @@ -89,6 +95,7 @@ struct gpio_regmap_config {
>   	int reg_stride;
>   	int ngpio_per_reg;
>   	struct irq_domain *irq_domain;
> +	unsigned long *fixed_direction_sparse;
>   	unsigned long *fixed_direction_output;
>   
>   #ifdef CONFIG_REGMAP_IRQ
> 


