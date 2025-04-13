Return-Path: <linux-gpio+bounces-18753-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD90A870FC
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Apr 2025 10:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 137AF1895311
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Apr 2025 08:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9748C1514F6;
	Sun, 13 Apr 2025 08:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRFAKNpF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7F21FDD;
	Sun, 13 Apr 2025 08:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744531700; cv=none; b=lawb5zZ7Dyg7I+WnMp6jXANVgGlXDNz3L7FZZR2CC7vwjM65DsalCBcWg9QxdlcheKhexaf1ApaY0SHnyKo71CBaMv893uwpoRGBMhnjXB3HxHWTjACGCOGOHY1SDx8PZN7Dh1joyOfhp1/1VOExpm180mF3S5Dzf8qjSFbOIzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744531700; c=relaxed/simple;
	bh=n0fKbLmb0yFlmzjcfYMiXH73JZk0R38Lw/U7p4Qj3ps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pC/d3v3za3vCVjzxKmocD2KRW4jfNl3fCBJRVbvimjbP/J+pe6GXclj0cBDEjBW4rvsbgemSwMuJkx/l3tk9bM7m6RaGVhL6OeNl/0YYLBM9az75JOdiBkqGmGxplUDAIiNS7/4dJ048F/5BYOS3hTijFHWKIv1Ue5KSpqMnpjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRFAKNpF; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30c461a45f8so29048871fa.1;
        Sun, 13 Apr 2025 01:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744531696; x=1745136496; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZx4tBRB7RjQJIC+jIgsWE9+Y5vQNcKxI0YR/5t7Kng=;
        b=NRFAKNpFfqbnMj+Yx0OmpN4O07YJ/RW+/YFCqX+fzdobvuRqN7nGJQXSy2CHt3aX39
         fCREs17L3F6+j6VKOWbJ/+fU/bb42ExjQHeXu48WdWNyFKlSyYjXlYTVWzVF29PHf7pQ
         P9lVyyTtYACgDlEhPXvxFZUajDgeeykjSIpJW6NWRUAY/lYSFvWNvk6qeL9Ej6Y6/sEM
         +OE4JMZzmV7f9VeGJYBJi9BNaRXiDcOECtbbYMDfRY733qhp4cDODhBlolHGvJgWDS+k
         OOUiomHfBUmcZZhD4j+AKHg+TUbLxfSLxmkA4CcbEHHqviROHq7J6BVUAYpLSX6LntIX
         iSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744531696; x=1745136496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZx4tBRB7RjQJIC+jIgsWE9+Y5vQNcKxI0YR/5t7Kng=;
        b=Jjw75b0ec2xgZ3Qrqu8LZ+xm1M6hLz2GOnJdLNUKpYKus0NrrIdJVGIGWcSEiMvyf0
         +3armB2R/BekGU4G2ilQrJJTlGjtU0RBcfpJPi+0qaterCl9mtpiLWRHb1+guW9EZEsB
         kOMvxi8N71Srd/ob6iqFDlyDNaApSq7O+d/UYNd0VqdEeYULZz2wUOk6/nGgxPvHw/MH
         P/ApfNQ9zOKjVwn2m9afFsXkYh7PK2DqYxCrHwWhhTrAVclAnJ6B1wte8i5s5thHRtkA
         HbIEG+NGEOSb7R5cJauUUDFF6vAoewceccv0a6gzHa8ELQPv9hq/eLzMwn8VD7xWtg5J
         NKzw==
X-Forwarded-Encrypted: i=1; AJvYcCU8mLYXqDa6GtueEjxr1YnG1dmqgFYx55hLfc7wlXO05rJPXhXT8NHInqO8xEYJd08SYTXUd+Ai+kXlhg==@vger.kernel.org, AJvYcCVUAhlt0NL62znDBadEBF4TzWchFXQd7vjiLcE9xTZEjIMvnjqyqwFydxd3buc59q6EKk+MgFw2ujLBzQ+s@vger.kernel.org, AJvYcCXeRj8Gf7w0qAkiMzihKjZXxCt7rPRYw4M94ixGlNzs/mOXGP0oR1FxXSmzw4vADOb2QxggmJfu2LRFyqSG@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs00vbz+2SRG2TdSzgGGEcUDwO5OoXIxmTR6UIbQPQhjt32MRp
	Dyce8gnFDIkQYqXjyGkiGzCvudyFoe+HAcCJmbxk54sFawtuKWFq
X-Gm-Gg: ASbGncsrR2H+yfRrF69f5WMeHEo0XCSenQ8VSx1S2F9VnNARdB1LqrK/4D6Gw9cMUoM
	RCQBooj9wMQ8Eua11Zx6ZCNTKgxp6g1VuUNC10Juf3meXOYy7xrLcUeci2GO9o0cTGtHFBRXGgC
	0mnJzaxb7tHNuAwitJIC/rDeMSP2Nv05PLXy+lSdwUxG+1RR3LXYm1rP/l578vph5gcfF0TRMJY
	J70Ieq5EIEBEXGNifPyVPh7nVomVTHq9O3+TfWOBsAV/a/ckphXYfa88ZgNULJqNS9Iv+hTDwct
	ct681/HlTACnafMoqC78i5WRYkYGCysDHqxBsbW9AaI+FznjXdeZAy/HiiICtjjI6z7Pf7QEgLJ
	6KhVTjFABSSpUMHUkV/6NXA==
X-Google-Smtp-Source: AGHT+IHLySiEuQ9f9xiJNnAKuGIL+MuoL8PLZIgKiNWCMXZd7EUKa6NxuUaReqWnH6rjU09IXQ7x4A==
X-Received: by 2002:a2e:b8d4:0:b0:30c:1d:b147 with SMTP id 38308e7fff4ca-31049a1a89dmr28458071fa.19.1744531696163;
        Sun, 13 Apr 2025 01:08:16 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f84e5sm12800391fa.105.2025.04.13.01.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 01:08:15 -0700 (PDT)
Message-ID: <944dab74-f431-41e1-b4d7-fddf25ffa147@gmail.com>
Date: Sun, 13 Apr 2025 11:08:14 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] gpio: Hide valid_mask from direct assignments
To: Doug Anderson <dianders@chromium.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <cover.1741180097.git.mazziesaccount@gmail.com>
 <4547ca90d910d60cab3d56d864d59ddde47a5e93.1741180097.git.mazziesaccount@gmail.com>
 <CAD=FV=Vg8_ZOLgLoC4WhFPzhVsxXFC19NrF38W6cW_W_3nFjbw@mail.gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CAD=FV=Vg8_ZOLgLoC4WhFPzhVsxXFC19NrF38W6cW_W_3nFjbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Doug,

On 13/04/2025 02:00, Doug Anderson wrote:
> Hi,
> 
> On Wed, Mar 5, 2025 at 5:23 AM Matti Vaittinen <mazziesaccount@gmail.com> wrote:
>>
>> The valid_mask member of the struct gpio_chip is unconditionally written
>> by the GPIO core at driver registration. Current documentation does not
>> mention this but just says the valid_mask is used if it's not NULL. This
>> lured me to try populating it directly in the GPIO driver probe instead
>> of using the init_valid_mask() callback. It took some retries with
>> different bitmaps and eventually a bit of code-reading to understand why
>> the valid_mask was not obeyed. I could've avoided this trial and error if
>> the valid_mask was hidden in the struct gpio_device instead of being a
>> visible member of the struct gpio_chip.
>>
>> Help the next developer who decides to directly populate the valid_mask
>> in struct gpio_chip by hiding the valid_mask in struct gpio_device and
>> keep it internal to the GPIO core.
>>
>> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>> Revision history:
>> v2 => v3:
>>   - Rebase to gpio/for-next
>> v1 => v2:
>>   - Hide the valid_mask instead of documenting it as internal to GPIO
>>     core as suggested by Linus W.
>> https://lore.kernel.org/all/Z71qphikHPGB0Yuv@mva-rohm/
>> ---
>>   drivers/gpio/gpiolib.c      | 16 ++++++++--------
>>   drivers/gpio/gpiolib.h      |  3 +++
>>   include/linux/gpio/driver.h |  8 --------
>>   3 files changed, 11 insertions(+), 16 deletions(-)
> 
> FWIW, I've found that this patch is crashing me at bootup on my
> sc7180-trogdor board. The problem is pretty obvious in gdb.
> "gc->gpiodev" is NULL in gpiochip_line_is_valid().

Thanks for debugging this! I find this odd. It seems to me the 
pinctrl-msm.c is calling the gpiochip_add_data() for the chip, in the 
msm_gpio_init() - which is called from the msm_pinctrl_probe().

The gpiochip_add_data() should go to the gpiochip_add_data_with_key() - 
where the gpiodev should be allocated and set.

I don't spot any successful code path where the gpiodev was not allocated.

> 
> 0xffff80008066c760 in gpiochip_line_is_valid (gc=0xffff000083223890,
> offset=offset@entry=66) at drivers/gpio/gpiolib.c:746
> 746             if (likely(!gc->gpiodev->valid_mask))
> (gdb) bt
> #0  0xffff80008066c760 in gpiochip_line_is_valid
> (gc=0xffff000083223890, offset=offset@entry=66) at
> drivers/gpio/gpiolib.c:746
> #1  0xffff800080666338 in msm_pinmux_request (pctldev=<optimized out>,

Ah, but now I see the call comes from the pinmux. Looking at the 
msm_pinctrl_probe() - the pincontroller is registered before the gpio. 
Maybe, with unlucky timing, the request happens right after registering 
the pinctrl - but before registering the gpios.

This, I think, can be a bug even before this change (because the 
valid_mask is not initialized prior the gpio registration) - but this 
change now made it obvious.

I see the probe is actually an exported function, and there are mentions 
about ACPI support etc. I don't really know if there are valid cases 
where the pincontroller should be usable without the gpiochip. If this 
is the case, the unconditional call to the gpiochip_line_is_valid() from 
the msm_pinmux_request() smells wrong.

I am not sure about the right fix. One could try:

@@ -1568,6 +1568,10 @@ int msm_pinctrl_probe(struct platform_device *pdev,
         if (pctrl->irq < 0)
                 return pctrl->irq;

+       ret = msm_gpio_init(pctrl);
+       if (ret)
+               return ret;
+
         pctrl->desc.owner = THIS_MODULE;
         pctrl->desc.pctlops = &msm_pinctrl_ops;
         pctrl->desc.pmxops = &msm_pinmux_ops;
@@ -1582,10 +1586,6 @@ int msm_pinctrl_probe(struct platform_device *pdev,
                 return PTR_ERR(pctrl->pctrl);
         }

-       ret = msm_gpio_init(pctrl);
-       if (ret)
-               return ret;
-
         platform_set_drvdata(pdev, pctrl);

         dev_dbg(&pdev->dev, "Probed Qualcomm pinctrl driver\n")

but I am not at all this is the fix we're looking after. I wonder if 
Krzysztof has any suggestions? (Seeing he has been authoring some 
changes here :] )

Yours,
	-- Matti


> offset=66) at drivers/pinctrl/qcom/pinctrl-msm.c:152
> #2  0xffff800080662314 in pin_request (pctldev=0xffff000082686ac0,
> pin=66, owner=0xffff000082c02790 "3500000.pinctrl", gpio_range=0x0)
>      at drivers/pinctrl/pinmux.c:176
> #3  0xffff800080662900 in pinmux_enable_setting
> (setting=0xffff000082684b40) at drivers/pinctrl/pinmux.c:445
> #4  0xffff80008065fd54 in pinctrl_commit_state (p=0xffff000083a07520,
> state=0xffff000082684a40) at drivers/pinctrl/core.c:1300
> #5  0xffff8000806605bc in pinctrl_select_state (p=0xffff000083223890,
> p@entry=0xffff000082686ac0, state=0x42) at drivers/pinctrl/core.c:1381
> #6  pinctrl_claim_hogs (pctldev=0xffff000082686ac0) at
> drivers/pinctrl/core.c:2136
> #7  pinctrl_enable (pctldev=0xffff000082686ac0) at drivers/pinctrl/core.c:2156
> #8  0xffff800080660814 in pinctrl_register
> (pctldesc=0xffff000083223a90, dev=0xffff000081406410,
> driver_data=0xffff000083223880) at drivers/pinctrl/core.c:2193
> #9  0xffff800080660df4 in devm_pinctrl_register
> (dev=0xffff000081406410, pctldesc=0xffff000083223a90,
> driver_data=0xffff000083223880) at drivers/pinctrl/core.c:2313
> #10 0xffff8000806657b4 in msm_pinctrl_probe (pdev=0xffff000081406400,
> soc_data=<optimized out>) at drivers/pinctrl/qcom/pinctrl-msm.c:1579
> #11 0xffff80008066afcc in sc7180_pinctrl_probe
> (pdev=0xffff000083223890) at
> drivers/pinctrl/qcom/pinctrl-sc7180.c:1147
> #12 0xffff80008089583c in platform_probe (_dev=0xffff000081406410) at
> drivers/base/platform.c:1404
> 
> (gdb) print gc->gpiodev
> $1 = (struct gpio_device *) 0x0
> 
> -Doug


