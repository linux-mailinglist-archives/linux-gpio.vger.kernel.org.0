Return-Path: <linux-gpio+bounces-16601-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E29BBA45550
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 07:10:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9D4A7A2318
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 06:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0BC2676DD;
	Wed, 26 Feb 2025 06:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UrQnoEPZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9D8266F07;
	Wed, 26 Feb 2025 06:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740550194; cv=none; b=Z7CD85vGUgkKiJHXEit3a9VjPoSpDE82ExDCCbMScMh8/RiFlrXtEVxgL2oUh/h2iXM7O3dG9aRtQxKw1Ehczr/FH7Yfjbo5DrX+XWQLEgepeCk2FZ0Fi4nsYtn20FVolfHs15YSCgpZm4HGZW2Q0OmKls1NnMDbJT2unkHP0ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740550194; c=relaxed/simple;
	bh=iAc22T3HLdg9MoIWIu6HrXNwZZHyWM7nNlh5x6uZYuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KnfVq9zTVy3Ocd6YS7HJTyS5NY2rheJEP3foBPBSIG+fnect4+K6Hh3ZlT1dGl+sS1BuVMCvp+pDvh4jPQb/rcPiBzhnQPTyhd3nad0OUuLxey31VA+TAMz0V+ZB2DGPlV3Wnl0zeIyLjo3L4UPUtEBPst67q+447+BhoxJpcys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UrQnoEPZ; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30613802a04so68296381fa.2;
        Tue, 25 Feb 2025 22:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740550191; x=1741154991; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wo0R2waQkz/+BFp9U5SUX15rq39Vkclag114XFhluP4=;
        b=UrQnoEPZhDb9c9e3J0KiDekADhnTODYzyX+lj4+2WyZ9MKRewdal9xJIs7WFFT9mWH
         fux+a6MXFIflOFF2KbGaN6Q0Vv2UgRQp4K6i4xAZf7BRVUfy7hkbAs5VrnrgtLvCkOp0
         x/LxpvYpIaqg+6Bwrrz1NXlII8CJHTUd7nreENl+5TGEQmJfhpky4XhCHU3zi0CSi2Zq
         BgMbnzHrxSoSQvxBntHm/BUQHeANDQcPEycjmeDaXg9gl8iwJlrUTOtuhZXq4dZRuAG3
         OSU3XgGWFZnl0BCbIinZhb3ViTp6BlHQ+8wYeu64788wpvxe41peBiB7Vq52IVVRjApY
         TI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740550191; x=1741154991;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wo0R2waQkz/+BFp9U5SUX15rq39Vkclag114XFhluP4=;
        b=u+JlsPhnj+LTRcZ6E6u5yRoDtJZRkC43l+D+ZaHZB+0/HJgwogpwXcs0Wl3zFgqmGJ
         ta6a+Oz0ktcacSUgx02mQIe6QL5saPj15yD7ckuRNtLqKRSpyqRGgjSoR8mEbATNyGk8
         TTOLuZZL6i2JvyOEQ4eBffrVBg+7frVT+OPQc19hGqjht7zmTRSd1k0Q/DFiISpT8gLa
         iuMmVaTyyF+iVIsaFVgtXv+CHq2q/7S3/Psfhrlw4+fHWLKezGBQUJem79oUVlmNlTws
         qMqTq/cyzgk2mgQSqKqC/i3Ti6T3TBlpkHGy3pf/xbDhHkg7C2PnuzQb6VycnASGoNsL
         8d6w==
X-Forwarded-Encrypted: i=1; AJvYcCW606AZm5MCOTVVc6adMn5SAMBE7Eu2pmC6UqJjLEZxqJVuIXd3ddRgFdOqxM2dYhzAbL1qxOfu2RUqjvr+@vger.kernel.org, AJvYcCXIf7UFuYmSrVtNDM/X/4/TrVwnSypQz1xotEN32VRyf95OFCZf71uOkKqCbh7cnqdyOtMbPjTZpSmr@vger.kernel.org
X-Gm-Message-State: AOJu0YxJwNjzsqkdKwXjd6cm/9YFcGpml01h9oDWgr0mTgyAqriJWOsH
	/QSgojYhyMuT0ZPFSaphyV7KhwEf41t2ndmAUp8SPvkMooFfCZ1L
X-Gm-Gg: ASbGncvI+OCNN845EMYzJUUS1cJcmKpSvaLnFAqRXedn6NZ3Y1vn1Y6YiGUYJ+Ggq1R
	EUJxYFuKAmH26Fw+z3Ey9uNl5Our3PZlYwKxXayeBNHJsu/PcXhXPyW+YjZzcC1VBXQaxKoE7H5
	ijIawKud5B+dq2bqZGY+kN+rkBm5EtzdBN8L0YYvy/v5MNoE1lF67To6hA22XKPJumCfDc8oyrY
	0CEnHppw/LQvDw4kkm1cKa7r9MmIpSGCEyi4s53qk+UGgy/1vzHxRTUadrKg+0JNpDNxipK8zfV
	KK7FEcY+RaYLal2AdgsYr78CrpvnBHRa2uqUX5F5iLnfoPsXhNNT/ENcOq4nd8cBBeSUknDJlFn
	l1UrMgiI=
X-Google-Smtp-Source: AGHT+IEAkaEvaXKfYvkTudZqULWt1MJEbpkYLs8mH5rY2WeODCsGKUKzd/mcYoopST4g2xRs0X7QFA==
X-Received: by 2002:a2e:9c8b:0:b0:302:4130:e0c7 with SMTP id 38308e7fff4ca-30a5b16873bmr81239231fa.5.1740550190497;
        Tue, 25 Feb 2025 22:09:50 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a819ec2dfsm4216321fa.45.2025.02.25.22.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 22:09:48 -0800 (PST)
Message-ID: <ce0d802d-6bad-4028-bb57-18bddba5632d@gmail.com>
Date: Wed, 26 Feb 2025 08:09:46 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: Document the 'valid_mask' being internal
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <Z71qphikHPGB0Yuv@mva-rohm>
 <CACRpkdYOGeDaDUuQQUGwvFNNk7ZuFjkXSMPXL3BJ=4jGEGPkoQ@mail.gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CACRpkdYOGeDaDUuQQUGwvFNNk7ZuFjkXSMPXL3BJ=4jGEGPkoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/02/2025 23:36, Linus Walleij wrote:
> On Tue, Feb 25, 2025 at 8:01 AM Matti Vaittinen
> <mazziesaccount@gmail.com> wrote:
> 
>> The valid_mask member of the struct gpio_chip is unconditionally written
>> by the GPIO core at driver registration. Current documentation does not
>> mention this but just says the valid_mask is used if it's not NULL. This
>> lured me to try populating it directly in the GPIO driver probe instead
>> of using the init_valid_mask() callback. It took some retries with
>> different bitmaps and eventually a bit of code-reading to understand why
>> the valid_mask was not obeyed. I could've avoided this trial and error if
>> it was mentioned in the documentation.
>>
>> Help the next developer who decides to directly populate the valid_mask
>> in struct gpio_chip by documenting the valid_mask as internal to the
>> GPIO core.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Ah typical.
> 
>>           * If not %NULL, holds bitmask of GPIOs which are valid to be used
>> -        * from the chip.
>> +        * from the chip. Internal to GPIO core. Chip drivers should populate
>> +        * init_valid_mask instead.
>>           */
>>          unsigned long *valid_mask;
> 
> Actually if we want to protect this struct member from being manipulated
> outside of gpiolib, we can maybe move it to struct gpio_device in
> drivers/gpio/gpiolib.h?
> 
> This struct exist for every gpio_chip but is entirely gpiolib-internal.
> 
> Then it becomes impossible to do it wrong...

True. I can try seeing what it'd require to do that. But ... If there 
are any drivers out there altering the valid_mask _after_ registering 
the driver to the gpio-core ... Then it may be a can of worms and I may 
just keep the lid closed :)

Furthermore, I was not 100% sure the valid_mask was not intended to be 
used directly by the drivers. I hoped you and Bart have an opinion on that.

We can also try:

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ca2f58a2cd45..68fc0c6e2ed3 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1047,9 +1047,11 @@ int gpiochip_add_data_with_key(struct gpio_chip 
*gc, void *data,
         if (ret)
                 goto err_cleanup_desc_srcu;

-       ret = gpiochip_init_valid_mask(gc);
-       if (ret)
-               goto err_cleanup_desc_srcu;
+       if (!gc->valid_mask) {
+               ret = gpiochip_init_valid_mask(gc);
+               if (ret)
+                       goto err_cleanup_desc_srcu;
+       }

         for (desc_index = 0; desc_index < gc->ngpio; desc_index++) {
                 struct gpio_desc *desc = &gdev->descs[desc_index];

if you think this is safe enough.

For example the BD79124 driver digs the pin config (GPO or ADC-input) 
during the probe. It needs this to decide which ADC channels to 
register, and also to configure the pinmux. So, the BD79124 could just 
populate the bitmask directly to the valid_mask and omit the 
init_valid_mask() - which might be a tiny simplification in driver. 
Still, I'm not sure if it's worth having two mechanisms to populate 
valid masks - I suppose supporting only the init_valid_mask() might be 
simpler for the gpiolib maintainers ;)

Yours,
	-- Matti



