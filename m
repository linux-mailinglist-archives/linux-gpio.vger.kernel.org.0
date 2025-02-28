Return-Path: <linux-gpio+bounces-16775-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E7DA49392
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 09:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E299F3B519D
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 08:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CEAC245017;
	Fri, 28 Feb 2025 08:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7BSUqNx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A1A2500C6;
	Fri, 28 Feb 2025 08:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740731474; cv=none; b=fvVqIB5PYf8xyDTvNuNlVmbFbp9OIhU8P4d6YwV7q45gjuHJFgqX+Ill8DsLe8x/xG1fS8Bx8/3fz1dcsuvFaFNL7e7w0G0+mxqAnoIYaczMwFbSaf2on5d7n65EWEBabZLdFFPhZjWuY2wMmOQrgHBYY0d2IiEls7IVqZLbuNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740731474; c=relaxed/simple;
	bh=5iqVhUSMbrrLIJmFMWofm6eeEs0Wbgd95ErlLUB/mH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EWFjSJHLBRlOZrhYPpB6DOglSH4RjHJ3Rnb29dHNNKLQI6CRLAM2kf4Fz4u8piHhFebuQ78/iAUbpGAnbkGLPQwlH+j2g+bhbwc21KijtstaVRSPSHcmFRmSVLFcrIsgY/TpagryMrhWX7Ol1DWiaf7zHpLnaKk1+3Ck6A6wteg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7BSUqNx; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5494bc4d796so912588e87.3;
        Fri, 28 Feb 2025 00:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740731471; x=1741336271; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ar+75AnkBBOHQ0nLi6eO6uSmIlq6oLIRyUDgVOMz5CE=;
        b=g7BSUqNxO9+3KakkagdmFb11nRdREdkhVXYul2nHEfvmRjO1Ya6sfpxw2LCmeVVln5
         GnCJGGcZjmdCn0fz4aM0yYfEUEEx4NkDoGKyZr9IVZO/PzziVXAqPtGnywPcOgjw7MWm
         Ke7ZNR9yMLAtE4Lh1EgD8ElOzj3IteEi26baMbiimpu0L4sPwGuBk56YoBrHX6UUGVaS
         jlBbQg3q4/CgWLaY5k7dihdhy1UZcMXYsJRlNPdFWWUCtFgY50XKBdbAv5X2hYfAt56t
         /PLKubg7nbzlxPVRcNc1HNdZoPD7y2ijcFTqadfKIwHzBu/Qhp5fqgdyosnlD7myVADf
         8sZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740731471; x=1741336271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ar+75AnkBBOHQ0nLi6eO6uSmIlq6oLIRyUDgVOMz5CE=;
        b=lNnXD4HFWaAHZ+xAi4snJJ1WSJRNABFraFGpHOEzZsQ/82PU66h0GQQN/VQpYZIpbP
         9QWyRqKJrcSuC+wqv5Q1pbMSzlGBNkbns4XHq9BUsGSZBMDeMSfJTmTwGkIcxE5tFf6W
         gCWKGaLYGzC7MY777bP69DY7bkGHPwLtSyjKGMcUpNW6WXMHyjiOptBrry9t2jGTEXKv
         6F6xeawaYLc1O1Giy41/H0A6l4+2/E3oG67Iqs/3GaQYvoTjv0pL2+kmVTVngd2wT9bF
         3zAAtpwSBr+VvMYrC6pnQ3wy3Zzhxj/Ir3AZdT8qUvH6wjx1B9+fw1eHnIrvxil0rwot
         fhhw==
X-Forwarded-Encrypted: i=1; AJvYcCUmKPkjbvT8bODZMtfjlKlUJnm1ecoSxshY9LtS6L5G/63Bkn8XGCt8ZaSVY9aDC8cxhuzFmpq/MGRSZV5K@vger.kernel.org, AJvYcCWn738r2OznOlGTpbYvxnXUPwoGEXG+HMjUlenEf6S95yHZzbWZTYERfEyc6mhaWp06BseP5yJMzYA+@vger.kernel.org
X-Gm-Message-State: AOJu0YxMkN6vwI0wZNv3fgTv7tOH/XQpZPCGyHKLEBJfVhYg0NyYMwLn
	UKjqTHCMNA19mkG8h4f+BZLG7vcGUfvoKT4NMdXKNhzEXtna+hbOXt8H0Q==
X-Gm-Gg: ASbGncu5oPAgQ6BteFg+FPTYx3121m28V2lXaO4njkIdnhmj0TUi51htXv5JovYqd3F
	y6hy63Um96UMeitxWcqD96dLnQiYXUXdof+FypHGQUuBuR7lPnWYZl2gk9UmOv2q3ayoeTCf068
	GV2A2Mz7wOk5YXccX4/MjSxcSHKjZ787o3KWk5B48TfYbOHpsx6M8Ze0x5Ba3PvvRD4ww44sgHQ
	KiCX+Zm4NKPCzflGhZ/grIn3mNdxBEZNrBrmAl9Q2XDI9XzOIVAZfjydGf1w1jnQT/5veXvwxeA
	ouyAdcdRzRrLRSEBqIGBX6wjrKPCuznuBdo9xRAxzCK9CWFgT9PR7Q5cqOnd6/vcTLLpNt8XxmQ
	X27xvby0=
X-Google-Smtp-Source: AGHT+IHxVkOw5BtxvUJMaOvnDYyVVaA3CeL8lM42/0WkC0yeBuVAq4HENA/rmwXRepTmE3P8POujgQ==
X-Received: by 2002:a05:6512:114c:b0:540:2fd2:6c87 with SMTP id 2adb3069b0e04-5494c31c81bmr982411e87.16.1740731470329;
        Fri, 28 Feb 2025 00:31:10 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494417b62asm411711e87.85.2025.02.28.00.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 00:31:08 -0800 (PST)
Message-ID: <b4319228-44c1-4037-8474-2cbadcb839df@gmail.com>
Date: Fri, 28 Feb 2025 10:31:06 +0200
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
 <8979f8d4-8768-40b0-a3a7-6638ddb626cd@gmail.com>
 <a7ab9d47-cd17-4098-b2ba-d53dfc19dbed@gmail.com>
 <CACRpkdafJfmuO++XXSFha51Q5=9DrqqRtxOpNeUsmvy7BHrC2g@mail.gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CACRpkdafJfmuO++XXSFha51Q5=9DrqqRtxOpNeUsmvy7BHrC2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/02/2025 10:23, Linus Walleij wrote:
> On Thu, Feb 27, 2025 at 9:24 AM Matti Vaittinen
> <mazziesaccount@gmail.com> wrote:
> 
>> I did some quick testing. I used:
> (...)
>> which left GPIO0 ... GPIO6 masked (pins used for ADC) and only GPIO7
>> unmasked.
>>
>> Then I added:
>> gpiotst {
>>          compatible = "rohm,foo-bd72720-gpio";
>>          rohm,dvs-vsel-gpios = <&adc 5 0>, <&adc 6 0>;
>> };
>>
>> and a dummy driver which does:
>> gpio_array = devm_gpiod_get_array(&pdev->dev, "rohm,dvs-vsel",
>>                                    GPIOD_OUT_LOW);
>>
>> ...
>>
>> ret = gpiod_set_array_value_cansleep(gpio_array->ndescs,
>>                  gpio_array->desc, gpio_array->info, values);
>>
>> As a result the bd79124 gpio driver got it's set_multiple called with
>> masked pins. (Oh, and I had accidentally prepared to handle this as I
>> had added a sanity check for pinmux register in the set_multiple()).
> 
> But... how did you mask of the pins 0..5 in valid_mask in this
> example?

I will double-check this soon, but the BD79124 driver should use the 
init_valid_mask() to set all ADC channels 'invalid'. I believe I did 
print the gc->valid_mask in my test-run (0x80) and had the 
set_multiple() called with mask 0x60.

I need to rewind _my_ stack as I already switched to work with BD79104 
instead :) So, please give me couple of hours...

> If this is device tree, I would expect that at least you set up
> gpio-reserved-ranges = <0 5>; which will initialize the valid_mask.
> 
> You still need to tell the gpiolib that they are taken for other
> purposes somehow.
> 
> I think devm_gpiod_get_array() should have failed in that case.
> 
> The call graph should look like this:
> 
> devm_gpiod_get_array()
>      gpiod_get_array()
>          gpiod_get_index(0...n)
>              gpiod_find_and_request()
>                  gpiod_request()
>                      gpiod_request_commit()
>                          gpiochip_line_is_valid()

I remember trying to follow that call stack in the code. The beginning 
of it seems same, but for some reason I didn't end up in the 
gpiochip_line_is_valid(). This, however, requires confirmation :)

> 
> And gpiochip_line_is_valid() looks like this:
> 
> bool gpiochip_line_is_valid(const struct gpio_chip *gc,
>                  unsigned int offset)
> {
>      /* No mask means all valid */
>      if (likely(!gc->valid_mask))
>          return true;
>      return test_bit(offset, gc->valid_mask);
> }
> 
> So why is this not working?

couple of hours please, couple of hours ;)

Yours,
	-- Matti

