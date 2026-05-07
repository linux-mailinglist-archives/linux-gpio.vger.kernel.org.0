Return-Path: <linux-gpio+bounces-36417-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEbyD+sO/WmwXAAAu9opvQ
	(envelope-from <linux-gpio+bounces-36417-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 00:15:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7CA4EFA7C
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 00:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D674330480DD
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 22:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010C635BDAA;
	Thu,  7 May 2026 22:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="wBf0LIcx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD6F3537E5
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 22:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778192033; cv=none; b=gknWGuNZX2zQWg5p2PZEwtAJxg+BMgVotCwYN1ovc0ZpEhZK9oIE7a15ka0fFk0POkRwo4acH3KspNcHIObndvMDrE1yqMAr0YqHEbdG2cWV/54wZObqwB6LSMCFXqLA3jA6KpvVaBB/d4owUo/aOaKVjZpQHcFDazRh6m0HmWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778192033; c=relaxed/simple;
	bh=i2goPQ+5CehJtzewck9sJw/d7QO5lIUAOCoZXH/u9HU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WXVr6vhXmfhjdvaRIrGt6srSAV+RWOungK0T2f8ZviHLRzH50uwl6Qx7r5wsutFMGgJyD34knA0MdSTXOLBY1WyiJjZWPtBMCN77fa+OYALYXaM4juZgN1v6uRb12gOoxVUSE1KQFBBynjF+nmfJP8F7k4h3EiRb4ExbAxSqxX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=wBf0LIcx; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50e63771eb0so12385571cf.3
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 15:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778192029; x=1778796829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+YmVAR6P2lvdU3Vlv0mh6Jm+l1RNrUJm94KlauQmZsc=;
        b=wBf0LIcx0i/NMUaRL+2KM1wMKehZlIwYwLzS1uI1S0WCkJxEQm24pEdlwV5Q/ZdKQo
         tcUAfaEK5JIF0pecJ7/YBquY7xQF5EcH2rESBarITPryRKSDbNTWNUxvouQ3Y6lzV7eG
         eqYMQ/nEu0xg/+xsFmZOVTT9x3JwGikNejSWD75ipCLXng6bAqr6bKlzPLwSMRaN9Ggs
         KCEYLo55iUsr8VGswmB4KcpOILi1HAhCGx2UyIF9EVvB61YZD5T17fjNQU1Kon886U8o
         Nm4nbZWXEB2zzSzRdAeCu11rgCPshnVkvR/6YsxCL88X8Tv4kmLO6+cnTq34rddAOkDE
         WZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778192029; x=1778796829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+YmVAR6P2lvdU3Vlv0mh6Jm+l1RNrUJm94KlauQmZsc=;
        b=IN8DwLBJU45ckcLKu1qqEmysydNzAjuQuWnF+orFQblVbgZZigEnkDUSMaABt7Hamj
         3lc7trxv9GQeoHVqsJKuiOUQ9IupfbF+pljq4v6xiPx+vSoAbh5tXTeau2rA0h71Zlwn
         f6VQ7cfRBh82tfd7ejCaM5JonXgawQDTDNfMOvfniwo5fc7jG74e9pph8V0ypcW0jjqy
         IrxUH7jUTzuINdLPMy0AWvSJJtt19OA1DEDpalzD8B4Mlb5rWp5K0KEIaHUOVG9iC2i8
         njOHS3uJ4va8IWjB622q9TgEX/ZXH6/mgKc+gPQqzWAsAGZfWtzJftjOA4a0BpqbVlHd
         wQpw==
X-Gm-Message-State: AOJu0Yy3aO/6Wf+fMp1aJZe6QGO9UNvUhZLRiONZydV0qJ9Zb4+QwIIA
	K1qw/gVRtwR9/VodkhWNz0TRd+dncv+JgSK/Y/qq0fgfhGCLxt/dapoR6LviaJEu1s0=
X-Gm-Gg: AeBDieuVhFpdOSkKvAc3rTCA69yIM7hw2LnZdXAQVoGwhLMV4wfJ2SGb4ShguEnETxA
	MNWqwfdjjIX/ykkrw5Vqz6uLCv6UkVg585khOkJzrrCZYdqv+iCs+VavRSnBTP2BGKWN/Yow2/+
	jSp5T0+TxdEyPK3JCSi6mr+aMGTFJHtMpateW1lQnKRUMczw40AGXp0MDSktvt37IA43RGhzWsn
	4gsSqWwKphJcCU3i108q+GozRzzo/r6e0jcrC/DoUT33gqU3GnbSDqopYsF8oVJyt8Samh9rzTE
	Iv9cW4JBeb9rJD41SUBHwfN/rsjzsOemX8xjPiapADhbFE/eYirQUfDYtBsy1cnLP6lyIKA0zy9
	59oCyPiXDdh31YzWUEiJfmCedU1++YtfMnEM6sB716kXyXFh3H9EOXwjWye7xnfBbZZedOEpHD2
	T1ts0TXAgkp4ck++u4/5eMMixE9ev34knmIU2tYp3kgtEzzsb+kY311IpDZyQOIu9QG5Uq2SLu5
	ZU=
X-Received: by 2002:a05:622a:598a:b0:50f:b69a:f4b9 with SMTP id d75a77b69052e-51461e38c5cmr147244991cf.27.1778192029287;
        Thu, 07 May 2026 15:13:49 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e677e63sm619611cf.12.2026.05.07.15.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 15:13:48 -0700 (PDT)
Message-ID: <3728c4d0-4961-4696-9e7b-29efb7a8a427@riscstar.com>
Date: Thu, 7 May 2026 17:13:47 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: regmap: Support sparsed fixed direction
To: Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260507-regmap-gpio-sparse-fixed-dir-v1-1-a2e5855e2701@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260507-regmap-gpio-sparse-fixed-dir-v1-1-a2e5855e2701@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9E7CA4EFA7C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.56 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36417-lists,linux-gpio=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar-com.20251104.gappssmtp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,riscstar.com:email,riscstar.com:mid]
X-Rspamd-Action: no action

On 5/7/26 7:10 AM, Linus Walleij wrote:
> On some regmapped GPIOs apparently only a sparser selection
> of the lines (not all) are actually fixed direction.
> 
> Support this situation by adding an optional bitmap indicating
> which GPIOs are actually fixed direction and which are not.
> 
> Cc: Alex Elder <elder@riscstar.com>
> Link: https://lore.kernel.org/linux-gpio/20260501155421.3329862-10-elder@riscstar.com/
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Tested-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/gpio/gpio-regmap.c  | 38 +++++++++++++++++++++++++++++++++-----
>   include/linux/gpio/regmap.h |  7 +++++++
>   2 files changed, 40 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index 9ae4a41a2427..37568dc611f5 100644
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
> @@ -138,14 +139,27 @@ static int gpio_regmap_set_with_clear(struct gpio_chip *chip,
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
>   	struct gpio_regmap *gpio = gpiochip_get_data(chip);
>   	unsigned int base, val, reg, mask;
>   	int invert, ret;
> -
> -	if (gpio->fixed_direction_output) {
> +	if (gpio_regmap_fixed_direction(gpio, offset)) {
>   		if (test_bit(offset, gpio->fixed_direction_output))
>   			return GPIO_LINE_DIRECTION_OUT;
>   		else
> @@ -302,12 +316,23 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
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
> @@ -329,7 +354,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
>   
>   	ret = gpiochip_add_data(chip, gpio);
>   	if (ret < 0)
> -		goto err_free_bitmap;
> +		goto err_free_bitmap_output;
>   
>   #ifdef CONFIG_REGMAP_IRQ
>   	if (config->regmap_irq_chip) {
> @@ -355,8 +380,10 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
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
> @@ -376,6 +403,7 @@ void gpio_regmap_unregister(struct gpio_regmap *gpio)
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
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> change-id: 20260507-regmap-gpio-sparse-fixed-dir-1d5c0d2e2c6f
> 
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>
> 


