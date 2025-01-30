Return-Path: <linux-gpio+bounces-15111-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08661A236ED
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 22:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68F02165299
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 21:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DC61F1521;
	Thu, 30 Jan 2025 21:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCZb3GWy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F08B1DA5F;
	Thu, 30 Jan 2025 21:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738273567; cv=none; b=fjX/BQ7TwMSEvQaB578oPHtEp013J2Kzz1D3qLOtzYXHCnMsB5frEaZIbaZ//eAPOmPTrj+WHshtVZZPEXg74u1QPwWQHZQsa6+cmFKDixccFWgqOCro8VUaAWozlZhdmUtGqcUzA+VN2BYiY3RaQD9/2vC80LM0yeBJxUyloTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738273567; c=relaxed/simple;
	bh=R4FHMuV58xYlq998ABzbvKFlrNrBrpyWWpTE7o7JLmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=urncz2rJtnkuzlOgwd/KU8z/b/H9qRmy3It+x5gPBbjMQLKeqDJVliEeXMyxwNCuPc4IqhsBkmFx8CdbNb6eMrZRhBKGAJkSE6LmXiT3W03PnrG0dOmJA48V+04moFyop1yXPtYGxP39DGtcPjKZ95WrQ/HcOaMUUiEKsNTAo7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCZb3GWy; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3bbb0f09dso2117667a12.2;
        Thu, 30 Jan 2025 13:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738273564; x=1738878364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8mMQmtr895BcP7Uq42BO3VPGUJukAXM2Ir4hDL4HfMk=;
        b=iCZb3GWyvAVdkRmOZtAoFHaXtMTh0fYloB7h6CXrNVrUMYOuosxZPmthabqKH6MmsS
         xI6BF0onsvmmpyhOVVboDrpPRKf7LD8uyZqRVsIEPJpIS4ssS819/hkJO+Yh9uWRhogi
         0CAgp1/DYsKnWrVTqXGm0MfrWFfFQ5RZK+Vdgvgd1j1c0znpG9X2QEvYibxyYNulpY/2
         5x4Jz62cPhAqVukrxN9Cp5NZJx4+si2hJZjKUqbII8wdFptgSJDAYPegqLRn4mDqRW0R
         2yVkv5T1b299aTRHv2dwobBvHAugXF7G6QGWmpjUecg1MfXaV09Nnv+QwMD9vR99iyle
         8xLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738273564; x=1738878364;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8mMQmtr895BcP7Uq42BO3VPGUJukAXM2Ir4hDL4HfMk=;
        b=ZfjLLRCdXYFtwOIcuyxpNxmVzZGWxEyPIOlJY8heySScjZmiJZuBW2TbJHA0Ip/Qn0
         7ZKfFkd8R2Zz7kr1Ug41xCJGBYRSDdBTKJsXgbqOqWE9aZ3lcCk0kEvVtEhw1b6rLBCM
         ovA2zoBmQBbiR5SU1FcqU5bsgWG6JeqHBGCy5R/1HQ66IDMR/nXZikjsT0xtTuZPwBST
         OTrak8BQXlxG3C3rhPSGIAbNzuZ6dtZEg6+CuryoUtmJwEOYJyI83B2yipQO99pc3wQU
         bVqHv46bmZMkxFn27wx0DslKIVET+YyNpXuHAKe3/2VUMF6UtfWNr75iUVavjmjoxpDL
         HZng==
X-Forwarded-Encrypted: i=1; AJvYcCVl7p0MFs5dYz2v15SOMDQJrof/i0xZ/Nafyp/gSuaQxTHctlic4oXHizi6cOhodFp3eIZeaNPCf/i/Vak=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDEmnMnnmQBBBOV7SGUnle/7BLhmWPZ9ddeEeQm4mWA9Z5HDu4
	4nJUV0qzybDXHRHIVlzK1O+VQHiFC4NHTl6LU5k7DUNCss6H401+FW8akg==
X-Gm-Gg: ASbGncsJi/1FkcKbLSaOsupwS5asmM7+JeroTa3Dz2BDEtaDaqTc6Q9swqzq/9nFNrY
	/LIwLvDG8LCLCXgxgmuOCYPwjBV8giZdSlKQE017mI/E3fXKtuy/iXrWEaOzK602c7R8o0IzpNn
	Ly3mfzWBOBRqNRtH5cq1B6B79FyFHP2g3pslashcwus+h8htAXeLyRmqytRz7MJgDsw95DNcWe1
	S67QC0c7hYuUrXhAsXWJt+slViOMWY6wge2NKi8Ksj/g7FnXiDQ9XXc3D+tHHJIlMeHDb5uOVJ1
	TwqeucnPOWD5fpCPtB+759be26jeFrcctZWILRY3ju6FT2X4NLamBAxnot+y7y1LKw==
X-Google-Smtp-Source: AGHT+IFjiyeDausgvZCLfUPyAgq7BMODwBxf3BmLLPI3rslS2Zj0a31k5dE6uWJF9nE2VVrQAPreww==
X-Received: by 2002:a05:6402:50ce:b0:5d1:1f2:1143 with SMTP id 4fb4d7f45d1cf-5dc5efc70ebmr9622139a12.18.1738273564293;
        Thu, 30 Jan 2025 13:46:04 -0800 (PST)
Received: from [192.168.50.244] (83.11.225.21.ipv4.supernova.orange.pl. [83.11.225.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724056e0sm1711392a12.41.2025.01.30.13.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 13:46:03 -0800 (PST)
Message-ID: <4af2c24d-1c79-4119-a112-eeac1112d49c@gmail.com>
Date: Thu, 30 Jan 2025 22:46:01 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] gpio: bcm-kona: Make sure GPIO bits are unlocked when
 requesting IRQ
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Scott Branden <sbranden@broadcom.com>,
 Markus Mayer <markus.mayer@linaro.org>, Tim Kryger <tim.kryger@linaro.org>,
 Matt Porter <matt.porter@linaro.org>, Markus Mayer <mmayer@broadcom.com>,
 Christian Daudt <csd@broadcom.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250130-kona-gpio-fixes-v1-0-dd61e0c0a9e7@gmail.com>
 <20250130-kona-gpio-fixes-v1-2-dd61e0c0a9e7@gmail.com>
 <9965d0b3-f169-45c4-9345-8588865a2ca4@broadcom.com>
From: Artur Weber <aweber.kernel@gmail.com>
Content-Language: en-US
In-Reply-To: <9965d0b3-f169-45c4-9345-8588865a2ca4@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30.01.2025 22:35, Florian Fainelli wrote:
> On 1/30/25 09:10, Artur Weber wrote:
>> diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
>> index 
>> 77bd4ec93a231472d7bc40db9d5db12d20bb1611..eeaa921df6f072129dbdf1c73d6da2bd7c1fe716 100644
>> --- a/drivers/gpio/gpio-bcm-kona.c
>> +++ b/drivers/gpio/gpio-bcm-kona.c
>> ...
>> @@ -87,14 +103,25 @@ static void bcm_kona_gpio_lock_gpio(struct 
>> bcm_kona_gpio *kona_gpio,
>>       unsigned long flags;
>>       int bank_id = GPIO_BANK(gpio);
>>       int bit = GPIO_BIT(gpio);
>> +    struct bcm_kona_gpio_bank *bank = &kona_gpio->banks[bank_id];
>> -    raw_spin_lock_irqsave(&kona_gpio->lock, flags);
>> +    if (bank->gpio_unlock_count[bit] == 0) {
>> +        dev_err(kona_gpio->gpio_chip.parent,
>> +            "Unbalanced locks for GPIO %u\n", gpio);
>> +        return;
> 
> Don't you want to release &kona_gpio->lock here?
> 

If you're talking about the "raw_spin_lock_irqsave" call above the if
condition - note that it has been removed and was actually moved below:

>> +    if (bank->gpio_unlock_count[bit] == 0) {
>> +        raw_spin_lock_irqsave(&kona_gpio->lock, flags);
>> +
>> +        val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
>> +        val |= BIT(bit);
>> +        bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, 
>> val);
>> +
>> +        raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
>> +    }

In general, the diff for this patch did not generate very well, sorry
about that. I'll see if there's anything I can do to improve that in the
future.

Best regards
Artur

