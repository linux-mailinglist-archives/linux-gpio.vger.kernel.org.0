Return-Path: <linux-gpio+bounces-16789-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2551BA49502
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 10:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 973D07A8CFD
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 09:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E142566DF;
	Fri, 28 Feb 2025 09:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sgh3jPEX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115DD25335E;
	Fri, 28 Feb 2025 09:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740734912; cv=none; b=WDHHaZ2f9npcxz/6/glFy+4dmakUTALFM02kguoi3uq+VTuzUGgpGUXHEYkilJZklVOPO+CHlaOpb6Ggmm62w391vL0L15FXlbf323CH+zkJjSdlpEXSJxlvkJmU8bUrzShhbxqUPdmQsYD126dUAQ8IAS97uGOcuFE5liONUWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740734912; c=relaxed/simple;
	bh=qaFvCl6yDojSmybg8Is/y5DTJls7wzVhPc38o+NeUow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jQFSpYbDpJ4pcCWuNh0+DBhu6cM5OGyuUxQHdnkvNz2Oi3uOwsTDEVA9HHmzOcb3eiQRAhYURkJ6XMoYDgg5ee3D0sX1nLY/Zn/Pl4jrt8uOUe1DSwkZN0naxP4JFIt+kN0uSeKvbM4MUwV9gTck5zifmJDZnbJNGhjIxCm13RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sgh3jPEX; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5454f00fc8dso1736351e87.0;
        Fri, 28 Feb 2025 01:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740734909; x=1741339709; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AjcnfgTgBW1hxxffgK8by4v9n4p/BPOPHc9L4TWEfzU=;
        b=Sgh3jPEXwskifikcgeS2ZxnNZhJBkIaoIRWCG+9t06hPS4ktH01Ty81Z3hzzRtBcs5
         i49af0kwMj9F9rpXWEezITAFDKBUJIev4ltvEMMequo9JTRTyFeCKJUvNq+cqdBawSXN
         NqACBQPzbGSPYxwBC0knJ6SyihsMxSzz15mphErSkqqCuf3UhnJ7GZLM+cFj3sVY1EZu
         hMRAuowQs44FgqK3aCmDaZsyu+WuF5GWGudUkqeQfEDc1hawWAHGpwp2AfR/YDNNy9/5
         l1onJM94r5E73s4bx6sAxXcWbqWgxOAvxxn77TMIVOfYxh43/jB0D/Jd8PdVod/23kcX
         LmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740734909; x=1741339709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AjcnfgTgBW1hxxffgK8by4v9n4p/BPOPHc9L4TWEfzU=;
        b=DuUeF2GSxvF88AIxWVx6bjnvP2/cCWxBGeHPblRLpiE3YVeb7DpnsAnAcc5bll3ExM
         qFlElJZjCWYVdxeMaNZqaHAc4ls7nhx6CtiNa+LpxaEvbcd4Wu27Fyq3Skkk5An5odqL
         w9zztgEV/p2WaohtneL/PznXGN1pyUuLV8S0adJYSfdEFUwsznvsHbHFm3un9oyxeP7B
         BeXv9njPr0/0MKDxYhtmgIKmsnNMbD0ccIztiyrbKbYoaMwwj3f9H8PF63lvS63296RH
         4sYqWQD8HoCxzf6ynUeHWr1sXpX12vBW9Eax3jkjHLpLGmK/ZvfhHVsPbC9CWWVxFDBR
         h5qw==
X-Forwarded-Encrypted: i=1; AJvYcCVP7Orna1eacfOUodafx/7Qd4LkfDaF+vvNEHvo+QBbT4HJQaBmoXrIcNOMXE6wacOiUq+FiXBzhvheicqV@vger.kernel.org, AJvYcCWL0glDJqWvQts2py1QQjJ03+pg0c5FclrYCTNWCkCDWOPTVeyfEomBn99DGvl76aU9MgMRVAd+2hyY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3gDPp/UjGKThUB+xpc+zUr5tzI4/lpmiQ3vSrCteSyDfrO/+R
	9se2cE5g8z6vCU/ggE0wH6+g6SHrnNT31Ufeq7tbLdG0wHPKL0Lg
X-Gm-Gg: ASbGnctKwKTZBy//RrYADYc0hXr8N+fi5HfnWpN8swhwQ4RtltJ0/hi9uUiHSXwtBT2
	LzMM01ZrcZV0qskRsp7bmYDGIuqzuIKhddJZLtA7vD2s7OZ7Vs8erSTRB9KFS+exadOS39beh6l
	lKTgcguj9KbeB9+XyXi/WIQty+qBhbwz/aODVHAYNtQXO2ysBg6my1JS8MaG1z41DAsHLylyrux
	dbYKAGQ6fA0ec/XP7WPUbFKQrBbgQMSun8zFpvU6wznkMa1zH/6UqD++6ixxKFWi12NZi9u0aax
	esL1X30y+K2J/TltrEbeEx3h1mTBp80tqHX+VQTD8ASxUB0Mdz1T6XHkcCIxYrYE7KaBF9dgd+x
	mVuz5O2w=
X-Google-Smtp-Source: AGHT+IHHpdwqplK2tXf3aLmS7Bm9wMRQEewUAaqTx7XCJqu7dsLSgLFMieBUM5Aq2birwUWKUCy6WQ==
X-Received: by 2002:a05:6512:e8b:b0:545:1d96:d6dd with SMTP id 2adb3069b0e04-5494c330ae4mr845287e87.26.1740734908665;
        Fri, 28 Feb 2025 01:28:28 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54944174117sm432574e87.22.2025.02.28.01.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 01:28:26 -0800 (PST)
Message-ID: <f3984cfc-3e3f-47d9-a734-3af7f072c22b@gmail.com>
Date: Fri, 28 Feb 2025 11:28:25 +0200
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
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
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


CC: Geert (because, I think he was asked about the Rcar GPIO check before).

On 28/02/2025 10:23, Linus Walleij wrote:
> On Thu, Feb 27, 2025 at 9:24 AM Matti Vaittinen
> <mazziesaccount@gmail.com> wrote:
 > >> I did some quick testing. I used:
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
> 
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

Here in my setup the guard.gc->request == NULL. Thus the code never goes 
to the branch with the validation. And just before you ask me why the 
guard.gc->request is NULL - what do you call a blind bambi? :)
  - No idea.

>                          gpiochip_line_is_valid()

Eg, This is never called.

Yours,
	-- Matti

