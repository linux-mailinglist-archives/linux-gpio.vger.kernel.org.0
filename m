Return-Path: <linux-gpio+bounces-36625-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MON1IfpEAmoppwEAu9opvQ
	(envelope-from <linux-gpio+bounces-36625-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 23:07:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 821465161E6
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 23:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1BC5A30086BF
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 21:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158944D2EE2;
	Mon, 11 May 2026 21:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="FN2cb5rV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CC23B530A
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 21:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778533620; cv=none; b=mwyalucSoCVJ9Yq+w9z5i+2r1Ztg3uujTbieKnoJ2BDi+ULi1SVPBmFzIKIpmfAIvxC0ByKn4u8q57CK8nZflJ+6ivmLT9wivaY9MJb/KG1pWbYS8jecMX01yPmn5Z5v3qkkM1MyNF670QdSnqUY8ZIGQbSNLfiyKbapp62TfCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778533620; c=relaxed/simple;
	bh=2Gs3sD4cUcV1m3zrsiNa0/wpHJ847EmZare339tInT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RgwOjEdjCDhWrCMNPHQX2KwBKgAXp7AQgm6wQNrhQwAOuP+Y2g0jVB5Bun8hECu+tssdbAUNIBl1k+oSie9qME3daI3/WEGMD1RmOwF/zScdIw6tJIHloCvBT/0jOyZhmnAHn8QKPqDv3ieBe7yMZc7U4yxKJQs46APwRMjs2MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=FN2cb5rV; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-902deb2412fso521514085a.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 14:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778533618; x=1779138418; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OUMPxU9bBh07KOMeBhluYcUNfni6GhtS4Gt4qkqJTIY=;
        b=FN2cb5rVo1Nw/iDNuchsos7OWM0RmTcQO6knzbqF1T9EYIyctZ8pYFp8By2ZaA32VD
         1YHhBzd6/IqAWaNGYAchxFxvLw9AfjjPoRcJ0+mP/5O6s5w69Ox//bWljTTA1GnsaGVF
         ptL9qJVSSO7IlcMP8eLg/4CwhLDiTjyO86RNJQ5a1GauGGtyZngEGjb5AvXfttenM5Dk
         yN/UqaoxepEvql7WtgH2og1YoRogXYusXYRH57X8MfnGy7jrKxmuf55c45I1Emk4EnpV
         u+4WN95L6iqWgfyeu2chha/sqeHnOp1x/BpEpjVBN0NWHAoo6dBmscoFucRwX4Xqu8d+
         D8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778533618; x=1779138418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OUMPxU9bBh07KOMeBhluYcUNfni6GhtS4Gt4qkqJTIY=;
        b=K9YlFpItLSIlG3BRbYNmhvwW/aKCsUjkUWveZEqbPhxSw+/6pRFO/Ovh09/UDu+eAD
         8CwjgTvjUMazBjtV0JU1C/fX/solZAJaxHYmcpcPzaN/4xdI4DDC1MOGtn8P3fRnkZiO
         vu1SDc+hHPCKn2c2IX1lgIAadtOuwiITEF4PNwFqvcCMuRPyWDe2aAbG5iwexGOzCuAb
         Yw5YMWJOWjSQUNny4OGH03kRSkPGsAU5eUpBBw3aoazXR8Q2WkxBkymPr+tmdq+KBYaW
         sIBtzX35a8kHa2Q5kokw2t1ViE6qtk4C/IXFv7lmsmXRay/HuP6RoCRbx9czFJzHZ7h1
         OM+w==
X-Gm-Message-State: AOJu0YxCKjCGM2rM0+lBe2rw7k1oz6LKX8z4ceoHlassZoqnf6SJf2K5
	hXfPJbVa+8c3IjcHPaxzF7Au2mhLsKYtAb9OOq+egTZm9u6NAVge8CvdyKv4TUf+QwM=
X-Gm-Gg: Acq92OEpJ0Z1NrIn8DXrtuIVfk2fjr2zf6XAIOoi3OtcbvVqbCekpQCNz3z27A3tLhc
	CWn8NwIgiDhJCg565qdkVgzAj4HzHagZ7u7OCccM1N4uJULT9qXF7/2lfJb7l/CPCCqMFZXBe5+
	B0wu2sq2jA3BQDI/MP94q1Y0Z8eYATm9HxtC/Vah8Vt6XG5mvqlq2xDK3k0Nr7ClwgGMopt+BK9
	TNKOP4QErICLbVfG2j6doy3Fl+k2cdadPa1tiRbBkNJk7kOt+zCWBl2kpy25dPYfgsX3DJP6+gt
	IrwJVu/ZYVVPldDuTMBgqW1tXOazkYSmDqn/FA67rDl4B/r4+jNp9kFa4wvQXgQ19QTUeoc36Li
	6SWTIaoFhwjsPmL8Ja2JM0py/um9rt5zayZ6AGO8fOTHbkDTj3hwG9PzRvy2Y5HG7VwV+ms9Zfg
	jYuuDvl1Av4UorqkQzIe3LW6CLGHCQH1WkWvOfm4Tw4btBksYcr7XyhBZMSWxWdMU=
X-Received: by 2002:a05:620a:6989:b0:8d6:2958:ec16 with SMTP id af79cd13be357-909111f13ebmr1539111385a.60.1778533618038;
        Mon, 11 May 2026 14:06:58 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b977274csm1123387985a.6.2026.05.11.14.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 14:06:57 -0700 (PDT)
Message-ID: <ea6747cb-6771-4bc4-b0d0-d7ae9942bd41@riscstar.com>
Date: Mon, 11 May 2026 16:06:56 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] gpio: regmap: Support sparsed fixed direction
To: Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260511-regmap-gpio-sparse-fixed-dir-v3-0-1429ec453be7@kernel.org>
 <20260511-regmap-gpio-sparse-fixed-dir-v3-1-1429ec453be7@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260511-regmap-gpio-sparse-fixed-dir-v3-1-1429ec453be7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 821465161E6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.56 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36625-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/11/26 2:43 PM, Linus Walleij wrote:
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

Reviewed-by: Alex Elder <elder@riscstar.com>


You renamed "test_direction_sparse" so I had to do that too, but
I tested this again as well.


> ---
>   drivers/gpio/gpio-regmap.c  | 37 +++++++++++++++++++++++++++++++++----
>   include/linux/gpio/regmap.h |  7 +++++++
>   2 files changed, 40 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index 9ae4a41a2427..b3b4e77ec147 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -31,6 +31,7 @@ struct gpio_regmap {
>   	unsigned int reg_clr_base;
>   	unsigned int reg_dir_in_base;
>   	unsigned int reg_dir_out_base;
> +	unsigned long *fixed_direction_mask;
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
> +	if (gpio->fixed_direction_mask &&
> +	    !test_bit(offset, gpio->fixed_direction_mask))
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
> +	if (config->fixed_direction_mask) {
> +		gpio->fixed_direction_mask = bitmap_alloc(chip->ngpio,
> +							    GFP_KERNEL);
> +		if (!gpio->fixed_direction_mask) {
> +			ret = -ENOMEM;
> +			goto err_free_gpio;
> +		}
> +		bitmap_copy(gpio->fixed_direction_mask,
> +			    config->fixed_direction_mask, chip->ngpio);
> +	}
> +
>   	if (config->fixed_direction_output) {
>   		gpio->fixed_direction_output = bitmap_alloc(chip->ngpio,
>   							    GFP_KERNEL);
>   		if (!gpio->fixed_direction_output) {
>   			ret = -ENOMEM;
> -			goto err_free_gpio;
> +			goto err_free_bitmap_dirmask;
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
> +err_free_bitmap_dirmask:
> +	bitmap_free(gpio->fixed_direction_mask);
>   err_free_gpio:
>   	kfree(gpio);
>   	return ERR_PTR(ret);
> @@ -376,6 +404,7 @@ void gpio_regmap_unregister(struct gpio_regmap *gpio)
>   
>   	gpiochip_remove(&gpio->gpio_chip);
>   	bitmap_free(gpio->fixed_direction_output);
> +	bitmap_free(gpio->fixed_direction_mask);
>   	kfree(gpio);
>   }
>   EXPORT_SYMBOL_GPL(gpio_regmap_unregister);
> diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
> index 12d154732ca9..06255756710d 100644
> --- a/include/linux/gpio/regmap.h
> +++ b/include/linux/gpio/regmap.h
> @@ -38,6 +38,12 @@ struct regmap;
>    *			offset to a register/bitmask pair. If not
>    *			given the default gpio_regmap_simple_xlate()
>    *			is used.
> + * @fixed_direction_mask:
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
> +	unsigned long *fixed_direction_mask;
>   	unsigned long *fixed_direction_output;
>   
>   #ifdef CONFIG_REGMAP_IRQ
> 


