Return-Path: <linux-gpio+bounces-16793-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA53A49629
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 11:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F08E2188529B
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 10:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78EC625BAB9;
	Fri, 28 Feb 2025 10:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SK5AB13D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7976D256C74;
	Fri, 28 Feb 2025 10:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740736813; cv=none; b=Xb2SMl7wvJsfsG1OadhztD4Hvh1yFCbF1bGnLxyyo9s05AE3ZX/+lorNgKqZz3CvsDjemKGFYUl4tv6NTBxzOLHwvLloK9AFx+KfgVqb4sFzX/kQrcMbcHgiYOU2tuIRqX79pKQPSQ5F3xdcpRUHxST/moZDLjhgAai1Qo3gAR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740736813; c=relaxed/simple;
	bh=2fezt6E/toOpvGQ/maIJKmQIerdFnEOW1E01JmM4A5A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=sC0Al7k1+2hfxXYHhUr7VYoEtN50b3ObEIfNdmsS+PF64MSaEOd8Oj4bRoRuJ5H5EstyaTCCJD0ekGGvS/ey35nVdwinVbvKLrHcFAHG5FzEZLg5niD3aAixywwyaR4EZM0ZQuiMjSeadtvYWNMfp+Z2q/NDZks+9E1+cJvUVSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SK5AB13D; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30b909f0629so8236601fa.0;
        Fri, 28 Feb 2025 02:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740736808; x=1741341608; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e8/KW66e+2kSdtpDjiB9O/DXhYGHHMWWc9C6pdhsHHA=;
        b=SK5AB13DtRTLct4rRBaFqMVQnGONI3hZmo66s4QIM1FHHPazpG21796REGr33o/vzB
         TIfOY6LciCFaBBCiwPJXutqc7N82KhEpg0m2QgNXayqD8+HI9DyiOu0UL+hdKTpQrOL1
         nOy3fLLrZV1HVPLvZGDFDBVhyHS4eHJVxNcnwJ1X01rAyaCXDrQ9No/GxJZW5KRK63xv
         SUchW26GrtzkY3CY8FAqjMhItLWjPJfoBHVH1N/CayAbZhM2dgm5m7PBSIKjD2p1j/LO
         YehpJJ7yDyDeA3XE/Le3LeTxK8GLHY1L7ROggxPQV5skftWMuEYleybwqIWISwXFxUGS
         GSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740736808; x=1741341608;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e8/KW66e+2kSdtpDjiB9O/DXhYGHHMWWc9C6pdhsHHA=;
        b=o6yYblrg2PQXFwHAHilgLfODFyzrNQkRsLdnA9zeEwazoOz00PXei49mKgCaNR8GCF
         30kIjwmZxxpkUPV2z7e1Y3wTeTZ+cmNqDwfoMjAeuGw5oYA5iMx0Ik+ZRe8ahfdbUys7
         5qgSBaNSP0L90/WaXdq39CErUP7yOxSXoUVXbAXteotofHMA1HkfzIGjNi2pQh9kdAgL
         LUr6MFrxpW13m9hwGrxt3pePj5wj/W1n8klbKbja7f2Rznve+DCfXYdHxznSFUXStB5z
         ZK4bIB+Bt0EqU3UyQshAITMAXBfCmMf3B4m3cueH7L+VRxPmgzH/CG4OY7c3M39IJUiu
         udCw==
X-Forwarded-Encrypted: i=1; AJvYcCUaw1jQ8q1mc8w8/Lc7u0siQAZI/39ITaa0rwkx4E8Z0bKAxoB+icxLzvxUAHqGKP6ZR8lyqsIGQKKMjoal@vger.kernel.org, AJvYcCWaBGdTTMfpPPPH/Xl7HlApToo7ITvs3cRfCtgChQE2YAuRUtcuNAPkyViEkCljeWODYRGHiIx7waFM@vger.kernel.org
X-Gm-Message-State: AOJu0YwZnXhXpbwzGwZgBRytgB9SkOshC+ao8ix0vCn9yJj942ZIlDp+
	fN6iei56ruvwZqjOYD1jadhzXwYFVrmZ4wbresJImLV9/YDXnyA5
X-Gm-Gg: ASbGncumS96vT6iIR21+5oXLYBBqcpHCFmO2TN7gGcy7fqMM5vh+V2L7HXm/NDdwH58
	NUGPRhe7/+XUBDHbZD5Ru47QlCHboGykcfhvSpu9DtoZoMr3i3sMt11RhAKpcKeDv7+mHEQClSG
	YuUeIPlp9M5fXuSkKPhDNfDdTpjRPzZ74GkViaG3ifHWfwo3et+zo2Q1VBavUa0fNQrOo83oLNG
	XDYoPibZBMPOQGYP1oTimEhm/LEOyu3Mt4bia993vVTUQBxyFl+SWMgsLqCzmPG94xchSoA02To
	aE4LF4dBOJOKCGPkMannQe+LGQc/SxwdKKjiS3Re51do3wAbARJzAfxGosqxE0UY5iwerjjUM0j
	uzIR17tM=
X-Google-Smtp-Source: AGHT+IGyRp8hI4t7T43ptRiHkMVh7sT8uEcSSYopBs+Zo+MF7XVTxA73/hYKbTZJJ7+AgQQ9QgdWPA==
X-Received: by 2002:a2e:b8d1:0:b0:309:1f1a:276b with SMTP id 38308e7fff4ca-30b90a0d479mr8875191fa.10.1740736808128;
        Fri, 28 Feb 2025 02:00:08 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b867a7c66sm4555331fa.7.2025.02.28.02.00.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 02:00:07 -0800 (PST)
Message-ID: <46364d27-0316-4288-b559-209b4e41a533@gmail.com>
Date: Fri, 28 Feb 2025 12:00:06 +0200
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
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
References: <Z71qphikHPGB0Yuv@mva-rohm>
 <CACRpkdYOGeDaDUuQQUGwvFNNk7ZuFjkXSMPXL3BJ=4jGEGPkoQ@mail.gmail.com>
 <ce0d802d-6bad-4028-bb57-18bddba5632d@gmail.com>
 <CACRpkdZtWLGAn0K+xENY+RF6CsWPn0m7R--W9EaH+xTKazALFg@mail.gmail.com>
 <8979f8d4-8768-40b0-a3a7-6638ddb626cd@gmail.com>
 <a7ab9d47-cd17-4098-b2ba-d53dfc19dbed@gmail.com>
 <CACRpkdafJfmuO++XXSFha51Q5=9DrqqRtxOpNeUsmvy7BHrC2g@mail.gmail.com>
 <f3984cfc-3e3f-47d9-a734-3af7f072c22b@gmail.com>
 <6cb71da0-18cd-4ecc-8b7d-822e85987216@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
In-Reply-To: <6cb71da0-18cd-4ecc-8b7d-822e85987216@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/02/2025 11:42, Matti Vaittinen wrote:
> On 28/02/2025 11:28, Matti Vaittinen wrote:
>>
>> CC: Geert (because, I think he was asked about the Rcar GPIO check 
>> before).
>>
>> On 28/02/2025 10:23, Linus Walleij wrote:
>>> On Thu, Feb 27, 2025 at 9:24 AM Matti Vaittinen
>>> <mazziesaccount@gmail.com> wrote:
> 
>>> The call graph should look like this:
>>>
>>> devm_gpiod_get_array()
>>>      gpiod_get_array()
>>>          gpiod_get_index(0...n)
>>>              gpiod_find_and_request()
>>>                  gpiod_request()
>>>                      gpiod_request_commit()
>>
>> Here in my setup the guard.gc->request == NULL. Thus the code never 
>> goes to the branch with the validation. And just before you ask me why 
>> the guard.gc->request is NULL - what do you call a blind bambi? :)
>>   - No idea.
> 
> Oh, I suppose the 'guard.gc' is just the chip structure. So, these 
> validity checks are only applied if the gc provides the request 
> callback? As far as I understand, the request callback is optional, and 
> thus the validity check for GPIOs may be omitted.
> 
>>
>>>                          gpiochip_line_is_valid()

Would something like this be appropriate? It seems to work "on my 
machine" :) Do you see any unwanted side-effects?

+++ b/drivers/gpio/gpiolib.c
@@ -2315,6 +2315,10 @@ static int gpiod_request_commit(struct gpio_desc 
*desc, const char *label)
         if (!guard.gc)
                 return -ENODEV;

+       offset = gpio_chip_hwgpio(desc);
+       if (!gpiochip_line_is_valid(guard.gc, offset))
+               return -EINVAL;
+
         if (test_and_set_bit(FLAG_REQUESTED, &desc->flags))
                 return -EBUSY;

@@ -2323,11 +2327,7 @@ static int gpiod_request_commit(struct gpio_desc 
*desc, const char *label)
          */

         if (guard.gc->request) {
-               offset = gpio_chip_hwgpio(desc);
-               if (gpiochip_line_is_valid(guard.gc, offset))
-                       ret = guard.gc->request(guard.gc, offset);
-               else
-                       ret = -EINVAL;
+               ret = guard.gc->request(guard.gc, offset);
                 if (ret)
                         goto out_clear_bit;
         }

I can craft a formal patch if this seems reasonable.

Yours,
	-- Matti

