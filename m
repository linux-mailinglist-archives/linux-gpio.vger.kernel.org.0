Return-Path: <linux-gpio+bounces-16673-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 734CFA477B6
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 09:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16AAA17054D
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 08:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D802236FF;
	Thu, 27 Feb 2025 08:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVUoSLwe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181FEA59;
	Thu, 27 Feb 2025 08:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740644664; cv=none; b=PJRmIGBo/N4XwmgywvJunOaDwrcG+4i3y96b2WqQ8AtXjH/shOkoB7qg2XAHOhY1fWTXY003dxsR9HaPVWW02kTQYTqiUzx9dOw7ZdaAwWL+VFUJ70dHi0Qfa8o0X5paZcxDQ/KFD/a0hEYPEysrbbeu4A5+Mo5ekclBSA+SXGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740644664; c=relaxed/simple;
	bh=Nb/Hgm4oStf7q+jlubqt6Dr9pzfPaYaAm6OB6hz1PCc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=tf7wWX8DJVgI01XKa4Jv+elQV1zqNsmD1/kZmSbchF4BiSdyb+ZYjV2RjlRvvnafSn4ZyMA/1BGxgxyM9ZUGXC3ouHW4Ym0vxz/dXowPu24taP0k6UmCtxXOicKTlNNSrPdikCYZT0GVDAEA4gN6dvUblHa0IM3w/zzF/5Vkypc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MVUoSLwe; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5439a6179a7so816366e87.1;
        Thu, 27 Feb 2025 00:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740644661; x=1741249461; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KMdKkT9T6eW8JPXgw7f6XF0ny6zLaa3x883xjhyN/zA=;
        b=MVUoSLwecQOMH9BOWeGg40Adg4tLwwyO9sk/1Uubi7hkg+a4SX2qjoahkB9r+JsKW9
         bXzG38swzA9JD3kK3CoEc4JBq+eNx84QDGwPj9+M4xBbhyTNWuR+rA7euLLkT/+md7+K
         /Woe1RVIywFM5f10Xup/4sye3TLxI2aNU4LYDFx4Fe6jh98dUipZLdW/l8oxSiFaJHTk
         z5oTQOXzJG3f2j/WXuK4fRQm5aqk6N5ExntaiFftEprxA79g5XfuT6+PLke0TAz85eB6
         YS0YOYUhjoFLE73nFQF8pg55G+MpKNt/d8qTg8Jyx6sAhMLMQ4vN3wPCJghds+LuKy7R
         2cKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740644661; x=1741249461;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KMdKkT9T6eW8JPXgw7f6XF0ny6zLaa3x883xjhyN/zA=;
        b=LuWRE2r8DnZiCOqt2qBmnfIaGGVnm58Pd+AqaRGlToSUHTwaZKB1dPTVsTtub56w74
         BLLf1ZNIhCBurG34Bv9gX0Al3TF5vN4HKMjdrJW2UMbr1/Ra4Zqq0OKno8UdZL8jBhj1
         4aHT8pEXXowaLJPiRXf074U0En3pQzl4Z1ikFrRP3+wV2KJNj+N+btvFXiSa3ltHiLd2
         aeK35ZVYH4R0bmt0OC754YLUJeWfLYrYguC2dYugiDH8a4r7VrGrqz97kjVf551cP1wn
         VE1kro7JCMcmZWflsCgzNiYzpO3qRNolvJWhDBuyx5ThP8tZaeBc9i7W4fgVnS3WxfbA
         GSKA==
X-Forwarded-Encrypted: i=1; AJvYcCXNsxDtLJR9IOuGYtzXMZjV+ALStmrER7YTdz7xj4pliJzdV0D8dyoQN2q/dEJto9j5i29QO7p8IBC9@vger.kernel.org, AJvYcCXn+KgEqxfLUAoREpuc8/9pCXP9hrVWlt21KZbcO+1Z664Ls0Awy5rcsYKkNCsu2iAblriMM/yI/TNrwoni@vger.kernel.org
X-Gm-Message-State: AOJu0YwbS6FNzy6R2Tmqz3Wvfwo3NAQiZrqQeXHP/fcw2rZNuqgkDPo3
	vVKz4yGqjG2bnqoCB7uVgHwLU9LI3OV6yBVVQyY/Dsiu2codG/C9wp5mSA==
X-Gm-Gg: ASbGncuwj41YJ3Ze7U1q2JqNMKTCYMybU1kYca4Tf40y/YhguF1cmv5UxtXov8sWdJo
	wbfu0oZhrvgw4emFEnr+u5VKit6WlbVWLQq/rVWUJP355BqbM+fnJ2kd6o6cdX5EC1bgMuiK7dt
	skQ6Gl9SXo8q2t9k5lB/8dpJwqFX71oxQLQPSe8XB+I7MpBsAvhwlGlVq5CZmO2ScF1GFhhXigv
	QnSvTjqTXrSjNcIX6JpnWvNw1828X/oaqwtia8WzL6LgV+IxZ9PYy8/8xw7u3Tj/Bg7H+5+Zbt9
	cnlL1vWf9KcDWnSo3h18906nd+nizd1AbtkAL8vSaAKCIGx5qiCe79fdEvL/BbXyo90Tk6U/Cz0
	dQuV1o3I=
X-Google-Smtp-Source: AGHT+IFXpgZteQzCMyngKYESsa8l1Q3yg0bIMEvwucuXw2MU6ApuyAwzf+m14YatM/t6Oej1nF7HQA==
X-Received: by 2002:a05:6512:31d4:b0:546:1ffa:51ce with SMTP id 2adb3069b0e04-54943327ab8mr723861e87.21.1740644660919;
        Thu, 27 Feb 2025 00:24:20 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494417b636sm102821e87.94.2025.02.27.00.24.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 00:24:18 -0800 (PST)
Message-ID: <a7ab9d47-cd17-4098-b2ba-d53dfc19dbed@gmail.com>
Date: Thu, 27 Feb 2025 10:24:18 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: Document the 'valid_mask' being internal
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <Z71qphikHPGB0Yuv@mva-rohm>
 <CACRpkdYOGeDaDUuQQUGwvFNNk7ZuFjkXSMPXL3BJ=4jGEGPkoQ@mail.gmail.com>
 <ce0d802d-6bad-4028-bb57-18bddba5632d@gmail.com>
 <CACRpkdZtWLGAn0K+xENY+RF6CsWPn0m7R--W9EaH+xTKazALFg@mail.gmail.com>
 <8979f8d4-8768-40b0-a3a7-6638ddb626cd@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
In-Reply-To: <8979f8d4-8768-40b0-a3a7-6638ddb626cd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/02/2025 13:42, Matti Vaittinen wrote:
> On 26/02/2025 12:18, Linus Walleij wrote:
>> On Wed, Feb 26, 2025 at 7:09 AM Matti Vaittinen
>> <mazziesaccount@gmail.com> wrote:
>>> On 25/02/2025 23:36, Linus Walleij wrote:
>>>> we can maybe move it to struct gpio_device in
>>>> drivers/gpio/gpiolib.h?
>>>>
>>>> This struct exist for every gpio_chip but is entirely gpiolib-internal.
>>>>
>>>> Then it becomes impossible to do it wrong...
>>>
>>> True. I can try seeing what it'd require to do that. But ... If there
>>> are any drivers out there altering the valid_mask _after_ registering
>>> the driver to the gpio-core ... Then it may be a can of worms and I may
>>> just keep the lid closed :)
>>
>> That's easy to check with some git grep valid_mask
> 
> True. I just tried. It seems mostly Ok, but...
> For example the drivers/gpio/gpio-rcar.c uses the contents of the 
> 'valid_mask' in it's set_multiple callback to disallow setting the value 
> of masked GPIOs.
> 
> For uneducated person like me, it feels this check should be done and 
> enforced by the gpiolib and not left for untrustworthy driver writers 
> like me! (I am working on BD79124 driver and it didn't occur to me I 
> should check for the valid_mask in driver :) If gpiolib may call the 
> driver's set_multiple() with masked lines - then the bd79124 driver just 
> had one unknown bug less :rolleyes:) )
> 
> I tried looking at the gpiolib to see how this works... It seems to me:
> 
> gpio_chip_set_multiple() does not seem to check for valid_mask. This is 
> called from the gpiod_set_array_value_complex() - which gave me a 
> headache as it is, as name says, complex. Well, I didn't spot valid_mask 
> check but I may have missed a thing or 2...
> 
> If someone remembers straight away how this is supposed to work - I 
> appreciate any guidance. If not, then I try doing some testing when I 
> wire the BD79124 to my board for the next version of the BD79124 series.

I did some quick testing. I used:

adc: adc@10 {

...

	channel@0 {
		reg = <0>;
	};
	channel@1 {
		reg = <1>;
	};
	/* ... up to the channel@6. */

	gpio-controller;
};

which left GPIO0 ... GPIO6 masked (pins used for ADC) and only GPIO7 
unmasked.

Then I added:
gpiotst {
	compatible = "rohm,foo-bd72720-gpio";
	rohm,dvs-vsel-gpios = <&adc 5 0>, <&adc 6 0>;
};

and a dummy driver which does:
gpio_array = devm_gpiod_get_array(&pdev->dev, "rohm,dvs-vsel",
				  GPIOD_OUT_LOW);

...

ret = gpiod_set_array_value_cansleep(gpio_array->ndescs,
		gpio_array->desc, gpio_array->info, values);

As a result the bd79124 gpio driver got it's set_multiple called with 
masked pins. (Oh, and I had accidentally prepared to handle this as I 
had added a sanity check for pinmux register in the set_multiple()).

I suppose one can think this is a result of invalid DT and that drivers 
shouldn't need to be prepared for that. But ... After supporting 
customers who try to integrate IC drivers to their products ... I think 
it's still better to be prepared. I definitely wouldn't blame the rcar 
driver authors for their valid_mask sanity check :)

After all this babbling, my point is that having the valid mask visible 
for drivers is useful. Especially because there are cases where the 
'valid_mask' can be directly compared to the 'mask' parameter in the 
set_multiple. It's clear and efficient check, and I could assume the 
set_multiple() is an optimized call, and thus being efficient makes sense.

So... Long story short - I would still suggest keeping the valid_mask 
visible and either taking just the doc update (as was done in the 
original patch) - or skipping the valid_mask initialization in gpiolib 
if driver provides non NULL value.

What do you think?

Yours,
	-- Matti

