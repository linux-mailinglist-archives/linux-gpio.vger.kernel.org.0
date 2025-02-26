Return-Path: <linux-gpio+bounces-16620-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D9382A45D6A
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 12:43:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB4127A1A91
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 11:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690782153EA;
	Wed, 26 Feb 2025 11:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBLyiBHY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A652321505D;
	Wed, 26 Feb 2025 11:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740570181; cv=none; b=knFhLJEaabqn6M5HPjEtbz2l8Y2RR5pru3joBFLMKd1tJCY0mNp1rFekE5hJToheBAdzpPzYBss0n+7DLDjOVt3F0brjFVK+EWRyr1sex9iPJRbNuiubQ4ooBabvyhjuwtYZU1w8OrnE/rHBI/XPfXhN1UI08jlQbVJ6aSx3c54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740570181; c=relaxed/simple;
	bh=5i/OknVHZIgAS7fy0fc/g2sApGx+XqAVMHcU0hKTur8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i5oK8zgAgIF8/Pc9QEB1eBQMCc5t01hvT0Wrj2+zMWDE1eQEsXIw+Wir1KqOsSPPjpTGoNmMy2xPsuryCGnhvdRUDpOU3wQZdIbitQsW4W/DMFoHFfFVUpKt2epgQ59T60jnhtSzf4ZZ2Gvoj7GvgnYEPgZG7YOhOHXDb+mpWso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBLyiBHY; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54838cd334cso5763908e87.1;
        Wed, 26 Feb 2025 03:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740570178; x=1741174978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L5hrGQtYfhc5Y+HY7h904Luh/ddK0W6WhpT8KbPVtUc=;
        b=NBLyiBHYCPyuZ6VxRa/b9eUn51wslQDiMgx8zyTznQ4UcE/rzXKLMfIkJgTc27gYrT
         UlGrFIM9S5MBv2onMJnbB8WMIbfMfZORn9bfOK6CJkjHeDzdIyco99V69L+hbRSxHsTb
         6AzLDlIossix8m478tYzP+OLcjd1HaOJ0enyNDbEZ/sZJg+WmQJZuj3m0oLj77XU1nEN
         qyXctGUdx7KJR7/kavkBusr1V6jfJ82+wdxKcR61OMTcz7AYpbsXBw/yekiGo8MkSAVK
         DkkVTnXVsQ+/G6tTWs7tYjaHwKPpchVk+K1vaqiwz7hNwScQ4RA6OqlaN5KS26bahlv9
         OO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740570178; x=1741174978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L5hrGQtYfhc5Y+HY7h904Luh/ddK0W6WhpT8KbPVtUc=;
        b=aUV/wsBJGOeGUlZfVvVewiHQyTOpidqh3xQCaB41rt3UQkbaMgwf7raJ8Hhg+fVcN4
         uy1qYIxOIuMMr66kxmwQZujEbRy37nQ09k1ZotUeWlbg1ZR0PNo9i0sm05XKND/ox1go
         cCXyKYPGcm0Xq5LotPmjhEIUWVt+175l9h/or4ZEA1yX1Ma6BjDCqeoABNZIaHVvYLSy
         F1CktVxVNMg8NzmBGH3T46x3MJntkXg39ZveUeWatA0l6lYMzm8PtvxYypJy+sFOVyhn
         /Y2eEPOmy9X5D/vsmsgKQA539SymKbjsSz685jSXvmveCrm6jEeCkHg3aIYfPwSnyY+y
         JK4w==
X-Forwarded-Encrypted: i=1; AJvYcCUUFUJJuRvEsbVzqtMtNphkkIw1wctvR1K/MvXFpd8TCZHJyTQOTeJjyj7UDeLZ/S7MRsNvS+JLSOdJqcpo@vger.kernel.org, AJvYcCX4f7XMVtkQo7jfgCKeamMJrxbMt316/7REqxTJ/+jXR32eGnDEOBvlXaD/bzHp0f3AQtqFv4HZldp3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+l4ikjAB9YIkdECl5NKgAzQvRax7OzDg9+vUVpgEzTECNwT63
	EaENA2g5SSpIj0EW2brnt2jUSkZ+KKpvhJyhOPAm4n70V/aUZVbeuG3GHw==
X-Gm-Gg: ASbGncsjkyHZ8Q7dCPAqhty1y7sqi8mC1QLxWKkxGoHyYhiLEXCV3G73A8aScPjPt88
	jrPIHE7ZPwZbOomQ82OfjPgZh60/z/mHiVGMcOvdcfa27xicGaYc4CRHli/pxwRECrLqiYu3l8N
	LFD48H7L0mcOCtBGl7gi7fzYdw6Rz42QOoFg+IDDpL+9zgEDxNGgeq6HdGY2yirid3ytxGJaEE6
	boAkAr6lJoz6QmPD/MjcoKX9D1+NLnqIvb52B7TawjHrzhtU1D4jqjghPOeeQJIWcQXI9h7wviS
	IbUo8QlaoaZNqgTPtwGfJ5l0b54YCNIK6i8JmuM/dKW0+88QpK0QphsifUv3R9E2B52iWsYAXq5
	5x5tpyAM=
X-Google-Smtp-Source: AGHT+IGWmhNVTANspZfihUtvglm0GZovp+BUZPoZB6tq8t5oZerY9iOeHToM9Prhn88TfpdSdzHrIg==
X-Received: by 2002:a05:6512:3f07:b0:545:a1a:556b with SMTP id 2adb3069b0e04-5493c373156mr2643553e87.0.1740570177524;
        Wed, 26 Feb 2025 03:42:57 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514efcd5sm432787e87.141.2025.02.26.03.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 03:42:56 -0800 (PST)
Message-ID: <8979f8d4-8768-40b0-a3a7-6638ddb626cd@gmail.com>
Date: Wed, 26 Feb 2025 13:42:55 +0200
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
 <ce0d802d-6bad-4028-bb57-18bddba5632d@gmail.com>
 <CACRpkdZtWLGAn0K+xENY+RF6CsWPn0m7R--W9EaH+xTKazALFg@mail.gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CACRpkdZtWLGAn0K+xENY+RF6CsWPn0m7R--W9EaH+xTKazALFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/02/2025 12:18, Linus Walleij wrote:
> On Wed, Feb 26, 2025 at 7:09 AM Matti Vaittinen
> <mazziesaccount@gmail.com> wrote:
>> On 25/02/2025 23:36, Linus Walleij wrote:
>>> we can maybe move it to struct gpio_device in
>>> drivers/gpio/gpiolib.h?
>>>
>>> This struct exist for every gpio_chip but is entirely gpiolib-internal.
>>>
>>> Then it becomes impossible to do it wrong...
>>
>> True. I can try seeing what it'd require to do that. But ... If there
>> are any drivers out there altering the valid_mask _after_ registering
>> the driver to the gpio-core ... Then it may be a can of worms and I may
>> just keep the lid closed :)
> 
> That's easy to check with some git grep valid_mask

True. I just tried. It seems mostly Ok, but...
For example the drivers/gpio/gpio-rcar.c uses the contents of the 
'valid_mask' in it's set_multiple callback to disallow setting the value 
of masked GPIOs.

For uneducated person like me, it feels this check should be done and 
enforced by the gpiolib and not left for untrustworthy driver writers 
like me! (I am working on BD79124 driver and it didn't occur to me I 
should check for the valid_mask in driver :) If gpiolib may call the 
driver's set_multiple() with masked lines - then the bd79124 driver just 
had one unknown bug less :rolleyes:) )

I tried looking at the gpiolib to see how this works... It seems to me:

gpio_chip_set_multiple() does not seem to check for valid_mask. This is 
called from the gpiod_set_array_value_complex() - which gave me a 
headache as it is, as name says, complex. Well, I didn't spot valid_mask 
check but I may have missed a thing or 2...

If someone remembers straight away how this is supposed to work - I 
appreciate any guidance. If not, then I try doing some testing when I 
wire the BD79124 to my board for the next version of the BD79124 series.

> and intuition. I think all calls actually changing the valid_mask
> are in the init_valid_mask() callback as they should be.
> 
>> Furthermore, I was not 100% sure the valid_mask was not intended to be
>> used directly by the drivers. I hoped you and Bart have an opinion on that.
> 
> Oh it was. First we just had .valid_mask and then it was
> manipulated directly.

I still can't decide if hiding the valid_mask is the right thing to do, 
or if we should just respect it if it is set by driver (as it was 
originally intended).

> Then we introduced init_valid_mask() and all users switched over
> to using that.
> 
> So evolution, not intelligent design...

Like anything we actually get done ^_^;

Yours,
	-- Matti


