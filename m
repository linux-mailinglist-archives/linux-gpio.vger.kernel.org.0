Return-Path: <linux-gpio+bounces-36490-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AYBLbmIAGrcJwEAu9opvQ
	(envelope-from <linux-gpio+bounces-36490-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 15:31:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 250825044A9
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 15:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01ACE3006527
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 13:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365D4388E63;
	Sun, 10 May 2026 13:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="wx2hFCYm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7411E492D
	for <linux-gpio@vger.kernel.org>; Sun, 10 May 2026 13:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778419895; cv=none; b=YEbWgNlj6+nIwp4JkrrG26oj8knWvrew4KRNRDZ4Rr+mvT0Rsy+Q3egcZGB6l6iI5gvJshKIVKLxK2IQ1zTRFSFmD+sQsQFUmQFa+7JNxrJpsto9lAxey524cFHEZe+2VaY7MJuwkPHIXhM6HtXokM0CR7BsRTje26vCfQdInGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778419895; c=relaxed/simple;
	bh=6HAXn+kxF5eQoAzjkNG4BkPt+b4r7Coyev2Gi0HExgE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=bNWF5wVO/NW3MRWJU3iVKCBlHnUbDt8JJqoxf8oNLVG/+8iEXB0VvkJYTFs0YSzDJcPg0gd1+qZoqJh1CQsRPDPe0/QTkiZEl+oekWqwKVPctTVNEn3Z3rteh3PnNAsOjNEjJQ/7VUclkJ50aeBORr3TqVr6ycheU3TiuUxgFZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=wx2hFCYm; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-94de68feaf4so2092843241.0
        for <linux-gpio@vger.kernel.org>; Sun, 10 May 2026 06:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778419891; x=1779024691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lhr6zcjHaIntrvl63ikySMmmCA16qxeIqmzRbDZIQ6I=;
        b=wx2hFCYmpE6FGvcx49T8M1M2sl6dHeYlJAYr3HtNY6brVFF6tRjhpAxizEgvaSP+jz
         uEg01P+T1EH1F//sBEZZOtZ7OaE8722MmujRyv3HvgkZbeKYCYMU3dgHEBqYQpJB5qpj
         IT/aDsfSqpnx/eipqb43+qleJ4HTPF/zd/5vgUtLG6C+xsirdrmLt2IDrV8V7ZqV/FQx
         e3g5QzGVSbpTfcSWRkwRTADko74CkQ27bnRB2dISL9us0upt/y1pLTNS3QNbjcVbS7xu
         WageXc+W1y55/VwAe11Uoduy27fmdtfGn1Jh4FGyZrGSE+NuB1vWpfE2Th0moINcvBCg
         pTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778419891; x=1779024691;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lhr6zcjHaIntrvl63ikySMmmCA16qxeIqmzRbDZIQ6I=;
        b=g4OpsMsK63Rf+XLHcEfR1htIa0RdKWh0HkOukpWgJ763pNUS3PN+fNPF+NOQjs1p0+
         FIM8Z4fGYh4sjBXeImqCeKQQ/DbAF4MyrueUE/f6EDkrWrb0qxJxbtAbZ+uhISbZWyiy
         lhoaWCvV4XtRttgihq/3PRYYmtb3vX0wUWNtht4JGGdaCwD/LlSCRvU2UscPotBC03Z2
         xnqFEFr95Ey/oTZp+1zIrZ8WvTwQnKtMCv3V4qRCUtNNZxypqGJRfKRnWUU63uw1+QkK
         FOwpRDSYIFNZrEDiAg2UE2xYezEerEmNKVeip40NdMLOqNDCQRiIGFTzn/y9UIkGhYCX
         GeGw==
X-Gm-Message-State: AOJu0Yw9RLz/KdqcW3dqsnWnBDj4S6TJkmnW8gH8BPSgBNT03Lr1tR3H
	UxqbqrknBwuUqCesfAbGAwYK0jmWzVKB/VmCUcmODM8Rggj9/sLYrFzeeK8hoEJqH4qkwLibBCu
	bh6PbPPc=
X-Gm-Gg: Acq92OEoJCw3BCWjBCAWAYdUltI9QLzjSZuX8EjtOI4OfGN8V5+IziQ/Uzl4pYC8752
	KzMfpG6mHfkatN1Lb8Y7SaENmngRSxWmDecYl6A1lp1DvQO4id06NvlY64GlQ0NA/b/R/tdCE/7
	KvfrzAf/wME9Pg647lIMQvptn3qjhcNSesJn3NQd/Py7JybMo8YkCjEw3uA1Mgx2pPBszEcLJC2
	U0WkBz3oX4JD0t1i2gB7ifVMbFBWql8gXxzGYezU5At7U7wDWRpbTGpOcDZtS6HMTqKEhEmNEmE
	muk0XXOHvI3f8kESbrbqHIxsaTzSripmj7Jhfj9G4klPIUpWVsyVbdjV5j5B9BCSgVjOPJXPt1S
	U7tP2LCJK1dlYylMr31KmAXEwBB6rwFeLLxLxwRt8L3UPEFsV1XFU6aUim32qauvV80xq+egXyF
	ODgktGZdk9hXUhPnVdq3+cwDrJvN9mc2KvjeUP7nHMqhVKbZcFiGCWDTVDVS7+1UijVgLSb4VqF
	/2h
X-Received: by 2002:a05:6102:160f:b0:631:9366:da8c with SMTP id ada2fe7eead31-63193670d8bmr2967988137.14.1778419891397;
        Sun, 10 May 2026 06:31:31 -0700 (PDT)
Received: from [10.211.55.5] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91cdfbsm2864554785a.34.2026.05.10.06.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 06:31:30 -0700 (PDT)
Message-ID: <092e2eee-5fbd-413b-99f6-dd9b08512504@riscstar.com>
Date: Sun, 10 May 2026 08:31:29 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] gpio: regmap: Support sparsed fixed direction
From: Alex Elder <elder@riscstar.com>
To: Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260508-regmap-gpio-sparse-fixed-dir-v2-0-deee84df3027@kernel.org>
 <20260508-regmap-gpio-sparse-fixed-dir-v2-1-deee84df3027@kernel.org>
 <6f15ed94-c52d-41c6-9e96-68e96c70d287@riscstar.com>
Content-Language: en-US
In-Reply-To: <6f15ed94-c52d-41c6-9e96-68e96c70d287@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 250825044A9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.56 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36490-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/8/26 8:03 AM, Alex Elder wrote:
> On 5/8/26 7:51 AM, Linus Walleij wrote:
>> On some regmapped GPIOs apparently only a sparser selection
>> of the lines (not all) are actually fixed direction.
>>
>> Support this situation by adding an optional bitmap indicating
>> which GPIOs are actually fixed direction and which are not.
>>
>> Cc: Alex Elder <elder@riscstar.com>
>> Link: https://lore.kernel.org/linux-gpio/20260501155421.3329862-10- 
>> elder@riscstar.com/
>> Tested-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Linus Walleij <linusw@kernel.org>
> 
> 
> 
> In addition, it would be fine with me if you merged this together
> iwth your new patch:
> 
> 
> https://lore.kernel.org/lkml/20260508-regmap-gpio-sparse-fixed-dir-v2-2- 
> deee84df3027@kernel.org/
> 
> It makes sense and it is logically part of the same change.
> 
> I even tested with that change applied, even though I know
> just by inspection it will do what's desired.
> 
> Anyway, for both (or a combined single patch), these apply:
> 
> Tested-by: Alex Elder <elder@riscstar.com>
> Reviewed-by: Alex Elder <elder@riscstar.com>
> 
> 
>                      -Alex

I had another look at this and I had two more comments.  I
don't care whether you address them or not, but I thought
I'd mention them.

The first is, in gpio_regmap_set_direction(), if a request to
set the direction to something that isn't supported (e.g. set
the direction to input on an output-only GPIO), shouldn't it
return an error to indicate nothing happened?  (-EINVAL or
-ENOTSUP maybe?)

Doing that might not be as simple as it seems, and maybe you
just opted to keep it simple.  gpio_regmap_direction_output()
calls gpio_regmap_set() before setting the direction, so
checking whether it's valid happens later than desired.

The second is a missing blank line that I didn't expect,
in gpio_regmap_get_direction().  I mention it in context
below.

					-Alex

>> ---
>>   drivers/gpio/gpio-regmap.c  | 37 +++++++++++++++++++++++++++++++++----
>>   include/linux/gpio/regmap.h |  7 +++++++
>>   2 files changed, 40 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
>> index 9ae4a41a2427..f45a432e8ebe 100644
>> --- a/drivers/gpio/gpio-regmap.c
>> +++ b/drivers/gpio/gpio-regmap.c
>> @@ -31,6 +31,7 @@ struct gpio_regmap {
>>       unsigned int reg_clr_base;
>>       unsigned int reg_dir_in_base;
>>       unsigned int reg_dir_out_base;
>> +    unsigned long *fixed_direction_sparse;
>>       unsigned long *fixed_direction_output;
>>   #ifdef CONFIG_REGMAP_IRQ
>> @@ -138,6 +139,20 @@ static int gpio_regmap_set_with_clear(struct 
>> gpio_chip *chip,
>>       return regmap_write(gpio->regmap, reg, mask);
>>   }
>> +static bool gpio_regmap_fixed_direction(struct gpio_regmap *gpio,
>> +                    unsigned int offset)
>> +{
>> +    if (!gpio->fixed_direction_output)
>> +        return false;
>> +
>> +    /* In this case only some GPIOs are fixed as input/output */
>> +    if (gpio->fixed_direction_sparse &&
>> +        !test_bit(offset, gpio->fixed_direction_sparse))
>> +        return false;
>> +
>> +    return true;
>> +}
>> +
>>   static int gpio_regmap_get_direction(struct gpio_chip *chip,
>>                        unsigned int offset)
>>   {
>> @@ -145,7 +160,7 @@ static int gpio_regmap_get_direction(struct 
>> gpio_chip *chip,
>>       unsigned int base, val, reg, mask;
>>       int invert, ret;

This isn't new, but why is there no blank line here?

>> -    if (gpio->fixed_direction_output) {
>> +    if (gpio_regmap_fixed_direction(gpio, offset)) {
>>           if (test_bit(offset, gpio->fixed_direction_output))
>>               return GPIO_LINE_DIRECTION_OUT;
>>           else
>> @@ -302,12 +317,23 @@ struct gpio_regmap *gpio_regmap_register(const 
>> struct gpio_regmap_config *config
>>               goto err_free_gpio;
>>       }
>> +    if (config->fixed_direction_sparse) {
>> +        gpio->fixed_direction_sparse = bitmap_alloc(chip->ngpio,
>> +                                GFP_KERNEL);
>> +        if (!gpio->fixed_direction_sparse) {
>> +            ret = -ENOMEM;
>> +            goto err_free_gpio;
>> +        }
>> +        bitmap_copy(gpio->fixed_direction_sparse,
>> +                config->fixed_direction_sparse, chip->ngpio);
>> +    }
>> +
>>       if (config->fixed_direction_output) {
>>           gpio->fixed_direction_output = bitmap_alloc(chip->ngpio,
>>                                   GFP_KERNEL);
>>           if (!gpio->fixed_direction_output) {
>>               ret = -ENOMEM;
>> -            goto err_free_gpio;
>> +            goto err_free_bitmap_sparse;
>>           }
>>           bitmap_copy(gpio->fixed_direction_output,
>>                   config->fixed_direction_output, chip->ngpio);
>> @@ -329,7 +355,7 @@ struct gpio_regmap *gpio_regmap_register(const 
>> struct gpio_regmap_config *config
>>       ret = gpiochip_add_data(chip, gpio);
>>       if (ret < 0)
>> -        goto err_free_bitmap;
>> +        goto err_free_bitmap_output;
>>   #ifdef CONFIG_REGMAP_IRQ
>>       if (config->regmap_irq_chip) {
>> @@ -355,8 +381,10 @@ struct gpio_regmap *gpio_regmap_register(const 
>> struct gpio_regmap_config *config
>>   err_remove_gpiochip:
>>       gpiochip_remove(chip);
>> -err_free_bitmap:
>> +err_free_bitmap_output:
>>       bitmap_free(gpio->fixed_direction_output);
>> +err_free_bitmap_sparse:
>> +    bitmap_free(gpio->fixed_direction_sparse);
>>   err_free_gpio:
>>       kfree(gpio);
>>       return ERR_PTR(ret);
>> @@ -376,6 +404,7 @@ void gpio_regmap_unregister(struct gpio_regmap *gpio)
>>       gpiochip_remove(&gpio->gpio_chip);
>>       bitmap_free(gpio->fixed_direction_output);
>> +    bitmap_free(gpio->fixed_direction_sparse);
>>       kfree(gpio);
>>   }
>>   EXPORT_SYMBOL_GPL(gpio_regmap_unregister);
>> diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
>> index 12d154732ca9..ff00b4aeaf1c 100644
>> --- a/include/linux/gpio/regmap.h
>> +++ b/include/linux/gpio/regmap.h
>> @@ -38,6 +38,12 @@ struct regmap;
>>    *            offset to a register/bitmask pair. If not
>>    *            given the default gpio_regmap_simple_xlate()
>>    *            is used.
>> + * @fixed_direction_sparse:
>> + *            (Optional) Bitmap representing the GPIO lines that
>> + *            make use of the @fixed_direction_output list to
>> + *            enforce direction of the GPIO. If this is NULL
>> + *            and @fixed_direction_output is defined, ALL GPIOs
>> + *            are assumed to be fixed direction (out or in).
>>    * @fixed_direction_output:
>>    *            (Optional) Bitmap representing the fixed direction of
>>    *            the GPIO lines. Useful when there are GPIO lines with a
>> @@ -89,6 +95,7 @@ struct gpio_regmap_config {
>>       int reg_stride;
>>       int ngpio_per_reg;
>>       struct irq_domain *irq_domain;
>> +    unsigned long *fixed_direction_sparse;
>>       unsigned long *fixed_direction_output;
>>   #ifdef CONFIG_REGMAP_IRQ
>>
> 


