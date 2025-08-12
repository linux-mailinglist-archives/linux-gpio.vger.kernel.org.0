Return-Path: <linux-gpio+bounces-24225-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6577DB21CC4
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 07:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C3963B3E1D
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 05:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861842C21CE;
	Tue, 12 Aug 2025 05:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMsmmC2r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BDC1A9FA6;
	Tue, 12 Aug 2025 05:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754975483; cv=none; b=IRYUSOgYM6jInVMvfoGrzqDrNYd0m4OdIWc/K+3gH6sSjGEiQ+u7n5SWt2lBkgolatk3WF5vtJ0H2MSEgJH5rPmqVjzoOrYeZBTNP3XSZIIOKxVkOnzZ420m4fLAAzKWLjMZsSzg1YWWI1koZRvVCrMrgqC+TijWVJtBI2SwWeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754975483; c=relaxed/simple;
	bh=ruoWzsKElHTPoCIhnSgV0Sg7RApZtpOfeWv8x9LYjcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MleMVjnoRwo4Xk33vEQOMGJZShfgIVOr4ZYbb13SD5dlIFpNXOYVyeimnzjCjtgoNiGx6z7xYH6sYS0BgdQUV7Zeql2j5Xv/Bzut+n0l7TTLjz/pKLM8/TA8wmKvb8e0Ae3McMqvYBd1v/PC5tti0QHBLBRK9rs5fVsebMBnVLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMsmmC2r; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-333be1f3f46so18511151fa.2;
        Mon, 11 Aug 2025 22:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754975479; x=1755580279; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6RCogcx5Oo6CLi0hB9llbGlmCv7IU5XWHAW2F4/A1O8=;
        b=QMsmmC2rrFn5Ob1oNw/DzCewplzJ2m+X0fWHCcKbh1zup+tvlq7ouQY4yah3I5eCSv
         odz0a7IabDbXTDICkkvkL4SkamcNWbAdRXR2Z9TQH0ZSGKxrH+mNtfNfnzHnX4f6ppP2
         PGh3Wj66O8ToZ3NX491oTFDIs3KA4UZSKL90FcxpyfHI2LONaWTNtLF3XLCEhFGQD0l1
         Cxny5+ra+TkUHxWcKGV1kz+060f7pbQ9/iRq6s1AADkxRpz4Y3Bv05cVZHu7P9IQk+E5
         yvBuNHUGzAHLhPCoSggqvI53CoYcpaioJt0Va5ScbEMMTi44guC7FLAHv0ZaSJ3/J8pO
         +XTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754975479; x=1755580279;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6RCogcx5Oo6CLi0hB9llbGlmCv7IU5XWHAW2F4/A1O8=;
        b=dIvtz1CAuMAbfzTkcr2typU9quh5KXHTpFx/FO7SSwbVzIjTv2gdKjb091MVtm1ioQ
         uHk63l4SmqlFvRe7wvB6RePyO3zG+JIZefFRLL1Fs+0M0cM2y3gAtm21IYXBQDJbM+fJ
         qMRM6Dt+a5KSOB/dwRMmdCrR9aWZ3pCi3BT8YyIyxbSgW+E/P9BbTH9uAoIai8FAk2km
         AxTTPhMYvWnWSH/frnlzuFeZlS1+Kp45PBuTG1bh83kn7za5qcD7Fb9/41IM3id4kfmo
         TWSyjAysFk/TEf3r0mar3B1rHVpipyY+BUaEGO+Nc8s5Un2wRhYML7xttmjMNXPHeb18
         QnTw==
X-Forwarded-Encrypted: i=1; AJvYcCVTAVXngNHZhbzSUwle6wISbkGyzYU5pVYpLt4i2Asd7RpAiy+dBIt/j/EN3s5bEbqvuSA4edVUp7wa@vger.kernel.org, AJvYcCXBVLmHCajAO6UGo2ufNnctoSl2KQ+cTUfnOK4J/lf/EOIwZrsrr4+9U3QvG4RsnCtGJHN4KbQ564iAXi/A@vger.kernel.org, AJvYcCXSiylD1DCs7mTWuSXSwmUnlhW+hvUTupzNRuMNCCyfpKKdumfZVd9MaObiI16qSG29C8SgFGNy+COS8s4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmzV31zzdNmg9StQleBkiKxkmobzgO5QpHIITDUxT1rbq2aJty
	zxMv7WSmFWuHb8T9qtYkuN65HRz46+0cYK4RqDmfFjc7gLQ5eP49oowp
X-Gm-Gg: ASbGnctOKpEC7DihJLl7g4R5Xps0iUOFjTDQDgR8yjElsmAVlTvkrIEQKLAtwHHapOG
	8U11RLd6ZUL1TGFh+K26eXDw4EINPvkwDzZtvtVW4/NdIPbS0nhGHm9A7L0dZy+vV1CZ3C3kgd+
	l0Ptye7FuhK67LValqVSJYQfuXcFWlYcsBP6lm12EmRpxHjHyqYJ4QF5ADigCAdY4KgSQOE5izX
	CRtZ0zE/+t4CTFGGdxz6PxxFhqItRUM7/7ErTeKzAEovZDOE2wovdxADgb4B4TE8+O0e+wP0tGA
	5L3HwVT1oiw3xodxRIZ43cbxiddaGEFQIf6mLeT+AIQwNCch9lnX2bzu/WwHZB4prtQxyEKWt6I
	tvglP4PQpUJ+52jw3l+a2IQx8/plnIU8wKOS+Ck1+28xicn8EppyVJIIKaUylJOAHBy1VFko0p9
	NO/zs=
X-Google-Smtp-Source: AGHT+IHWJM7707fkvhhfDDaVDfm0yh8SKnLXN3Du9JflbVXZU98HEhTKuegsiCyTS1CVAK9w56sCKQ==
X-Received: by 2002:a2e:bc10:0:b0:332:50e7:9898 with SMTP id 38308e7fff4ca-333d7ad447emr4442691fa.13.1754975479216;
        Mon, 11 Aug 2025 22:11:19 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332388d46besm42491251fa.48.2025.08.11.22.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 22:11:18 -0700 (PDT)
Message-ID: <b3c94552-c104-42e3-be15-7e8362e8039e@gmail.com>
Date: Tue, 12 Aug 2025 08:11:16 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/21] input: gpio-keys: make legacy gpiolib optional
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-10-arnd@kernel.org>
 <b7e97aa3-8f2d-4a59-8a38-577717404865@gmail.com>
 <aJnng9z9pUTFI49x@smile.fi.intel.com>
 <mrqxggv7vhclnranoc3uacfyzccod6dmc54kip4f7wjdpngjzz@falnsjwnfcjc>
 <aJpOEq_5jqGTUr4x@smile.fi.intel.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <aJpOEq_5jqGTUr4x@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/08/2025 23:09, Andy Shevchenko wrote:
> On Mon, Aug 11, 2025 at 12:21:51PM -0700, Dmitry Torokhov wrote:
>> On Mon, Aug 11, 2025 at 03:52:19PM +0300, Andy Shevchenko wrote:
>>> On Mon, Aug 11, 2025 at 01:34:43PM +0300, Matti Vaittinen wrote:
>>>> On 08/08/2025 18:17, Arnd Bergmann wrote:
> 
> ...
> 
>>>> As such, this patch seems Ok to me, you can treat this as an ack :) This,
>>>> however made me ponder following - is this the tight way to handle the
>>>> power-button IRQ? I don't see any other MFD devices doing this in same way,
>>>> although I am pretty sure there are other PMICs with similar power-button
>>>> IRQ...
>>>>
>>>> I see for example the "drivers/mfd/rt5120.c" to invoke
>>>> "drivers/input/misc/rt5120-pwrkey.c" instead of using the gpio-keys. This,
>>>> however, feels like code duplication to me. I'd rather kept using the
>>>> gpio-keys, but seeing:
>>>>
>>>> git grep KEY_POWER drivers/mfd/
>>>> drivers/mfd/rohm-bd71828.c:     .code = KEY_POWER,
>>>> drivers/mfd/rohm-bd718x7.c:     .code = KEY_POWER,
>>>>
>>>> makes me wonder if there is more widely used (better) way?
>>>
>>> FWIW, on Intel platforms that use power button by PMIC we add a special driver
>>> for each of such cases.
>>
>> If we can make gpio-keys work for various power buttons that would be
>> great IMO. The MFD drivers in question already are using device tree,
>> but they do not define/expect nodes for the power buttons. If the nodes
>> were there then I think gpio-keys would work out of the box?
> 
> Looking at the, e.g., https://elixir.bootlin.com/linux/v6.16/source/drivers/platform/x86/intel/mrfld_pwrbtn.c,
> I am not sure it's as simply as it sounds. Basically it's an IRQ, which
> requires IRQ handling and proper acking/masking/etc.

In some (many?) cases the interrupts (acking/masking) are handled by an 
irqchip code. When this is the case, the gpio-keys (or any other 
power-button code) does not need to care about IRQ-specifics. (I don't 
know about the Intel driver though.)

Problem with many of the bd718* (and probably some other MFD drivers) 
is, that the interrupts are really relevant only for the drivers 
specific to this one device (like PMIC in ROHM case). When this is the 
case, the device is not really (from the HW perspective) an 
interrupt-controller, which means it shouldn't probably be marked as one 
in the device-tree either. It will then also mean that there can't be 
meaningful interrupt specification for the button IRQ in the 
device-tree, right?

Additionally, we have devices where most of the interrupts are internal 
to the PMIC, but then the PMIC also has some pins usable as GPIO, which 
can be used as interrupt sources. Eg, someone can connect another device 
to these pins - which makes the PMIC an interrupt-controller. For these 
PMICs the power-button IRQ can be provided via device-tree node (but the 
IRQ spec may become a bit hairy, since most of the IRQs are meant to be 
internal).

Hence, for me, providing the IRQ number in platform data seems still to 
be the right thing to do :)

TLDR; I agree with Dmitry. It's nice to have an easily re-usable 
power-button handler, which requires no IC-specific code. Gpio-keys 
works for simple IRQ based power-buttons where IRQ controller takes care 
of the acks/masks. I just wanted to know if it is for some reason 
discouraged, or if I've used it in a wrong way (because the grep 
resulted so few results).

Yours,
	-- Matti

