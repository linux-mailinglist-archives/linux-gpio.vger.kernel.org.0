Return-Path: <linux-gpio+bounces-11946-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B229AE44E
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 14:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B4C81F21597
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 12:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16CC51D1729;
	Thu, 24 Oct 2024 12:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VuwGmNEO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9714B1D173E;
	Thu, 24 Oct 2024 12:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729771204; cv=none; b=uXhKX35IISqBsafBk0QQtx1nQr9pNMxmvjgVswkkqOZckSgfzoxSi7ZZ2I28P4xWfWtdcBSo+VIIMOs4RG4VgHKz3mSPREtzFgWK6M8ZVSvcUzamqFxY6rhSaBpxUnR8scrZc4dvRD0OSWkuCy+xw41pCyTzuuLT4kNcPKnLG3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729771204; c=relaxed/simple;
	bh=nYlTSkVh7NgY07mCWIDG1+s+ry6uRpTH2y/84XRCNVs=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=m9DNmZZ12HqTffJ4ghBJt74Bpz8YwjMPsKGtpi6PDTm/3ePxigGv/7G24BpwNp10TCFDhVPoZU1y6p21Qx1ossrZw6uMm4k4ahI9WpFrecoWPzXZCgfJy5aCGfLUzJLLh+sg4O4qtP7PnXgoPSayYpmLJhpCCanORxf0oie9utA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VuwGmNEO; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53a0c160b94so996203e87.2;
        Thu, 24 Oct 2024 05:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729771200; x=1730376000; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKA994wAyo+egBxKA4JKuuuhQBYbY3bVVHxjAoOb2d4=;
        b=VuwGmNEOf4Yo9iTDnnzvHqQU2xW5Fkg3zJJ7NcSEgRlmpXqfdgyKXp/YDTMrsjXUMj
         lqWPybJlHG7U88DbVmQIgYJ0IZIcGjCnxuqVkoTPkCTPWBtvodmCOi+pg8PKL0IwRa3B
         wKyI64rg4BSce9zjhLZAMwR7UH3/rqGUJbcEu0JDrNY2a5NTfoWQREzr12ERxJxLynMj
         lU30tuD276kCcUxg/BJbT9HcZLtoIXEBtcDRbpyzh2cXubh1IolqB8v+Pvja5tdCh3Jc
         Se6/1f26CcDLYtoy1nYmSs6ZIfwzVly56Fk6a3F/SKlH6cWrsi5rZqYkdrt7LJP05aa2
         8GDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729771200; x=1730376000;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hKA994wAyo+egBxKA4JKuuuhQBYbY3bVVHxjAoOb2d4=;
        b=ryG4848iAj3V91d5OZuFZPwDMeU5OK9zU1eKj1fbcLcIp3SDz1NpDqy7TwKUYva+Yc
         bnD4niZUbBLn4yo1DVcf2odosFoQZ82ab4QVzJXd8QJthCzyaJQejg0PJSFNyvDbQcso
         eicF4ocZ7hCXBZ8rH2vZ3DkqygpIWrfPs7Lx1TmONUkJ1iuPdXw1Xtx32+ZWQYU1W+T4
         HNulHsm2uquZL923rrrD/zFHPx8LvW35KL/6Up4VIh/GRL3ErdGAxgCOHovI+aV/D04p
         E/2RqarC3Oubf8L9KVnkT7DiQrnlNE3LHTL9ZV/PZkFrnTKvnkOCn8ioty+IXOw0bvji
         l08g==
X-Forwarded-Encrypted: i=1; AJvYcCUxzYRDKxoVhpcRHYEtnOpOveeogUrvUbN7VFe1DIrYe0/XWCS/iSdjU/zwkIPwLEYOcBchDnpyR9IK@vger.kernel.org, AJvYcCV5t0s5OcLMQBI9LF3UDSNCXhfg8E1N2FHrwlWq4dJzPG0AqI8HoLL/UbGMTHPNWp+e4/92EkuUHt4QPCd+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf5PDwW35pL1Zorl3PqCI98sXkKYFCHk4qT5+Jb1LnHtgnR4Pi
	ck38PvfsrQ5Pe/ZYxu7JQNGByu7gl19L9z5hQfYy4WdiLKe6Kxw5
X-Google-Smtp-Source: AGHT+IHpcBjQ9n0enTg+gxMCp9XOHlTZTV+cWabshbjufkPk+DVQEouPKdJYFEd1xukTJ3RY0oNr7g==
X-Received: by 2002:a05:6512:3c9d:b0:539:9645:97ab with SMTP id 2adb3069b0e04-53b1a31f37dmr3401048e87.33.1729771199140;
        Thu, 24 Oct 2024 04:59:59 -0700 (PDT)
Received: from ?IPV6:2001:678:a5c:1202:4fb5:f16a:579c:6dcb? (soda.int.kasm.eu. [2001:678:a5c:1202:4fb5:f16a:579c:6dcb])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a224200acsm1346891e87.141.2024.10.24.04.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 04:59:57 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------g0JXqH05nzju718vJmfr0xrc"
Message-ID: <195a21e5-79e1-4502-bc75-05e2893a2503@gmail.com>
Date: Thu, 24 Oct 2024 13:59:56 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/8] gpiolib: notify user-space about in-kernel line
 state changes
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Mark Brown <broonie@kernel.org>
References: <20241018-gpio-notify-in-kernel-events-v5-0-c79135e58a1c@linaro.org>
 <20241018-gpio-notify-in-kernel-events-v5-8-c79135e58a1c@linaro.org>
 <d6601a31-7685-4b21-9271-1b76116cc483@sirena.org.uk>
 <CAMRc=MfW9n+y8Dehe_g9b8_=he1YuFr3CEGG3iQEfjYwFiWA_g@mail.gmail.com>
 <CAMRc=MdER_JNcvPMRuzbDFpAUqarC9K8KRP+i5SFTW3H7Mkg=w@mail.gmail.com>
 <bf16af3b-d00e-4084-aa29-6e4c1955ed88@gmail.com>
 <CAMRc=McUpRJ=EN3DB7gsgsNKZHhJym6vfURmX9+mXnYuXjNwMA@mail.gmail.com>
Content-Language: en-US, sv-SE
From: Klara Modin <klarasmodin@gmail.com>
In-Reply-To: <CAMRc=McUpRJ=EN3DB7gsgsNKZHhJym6vfURmX9+mXnYuXjNwMA@mail.gmail.com>

This is a multi-part message in MIME format.
--------------g0JXqH05nzju718vJmfr0xrc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-10-24 13:45, Bartosz Golaszewski wrote:
> On Thu, 24 Oct 2024 13:34:11 +0200, Klara Modin <klarasmodin@gmail.com> said:
>>
>> I think I hit the same, or a similar bug, on my Edgerouter 6P (Cavium
>> Octeon III):
>>
>> CPU 3 Unable to handle kernel paging request at virtual address
>> 0000000000000000, epc == ffffffff817a40c8, ra == ffffffff817a40a4
>> Oops[#1]:
>> CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted
>> 6.12.0-rc4-next-20241023-00032-g01c8e35f8d89 #84
>> ...
>> Call Trace:
>> gpiod_direction_output (drivers/gpio/gpiolib.c:4164
>> drivers/gpio/gpiolib.c:2700 drivers/gpio/gpiolib.c:2694)
>> i2c_register_adapter (drivers/i2c/i2c-core-base.c:396
>> drivers/i2c/i2c-core-base.c:422 drivers/i2c/i2c-core-base.c:434
>> drivers/i2c/i2c-core-base.c:1574)
>> octeon_i2c_probe (drivers/i2c/busses/i2c-octeon-platdrv.c:247)
>>
>> (the complete log is attached)
>>
>> Unfortunately the oops remains after applying the diff and the call
>> trace looks to be the same.
>>
>> Please let me know if there's anything else you need.
>>
> 
> Hmm so it's desc->gdev that is NULL... Could you try the following:
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index ae758ba6dc3d..c95c79ea2b49 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1026,6 +1026,9 @@ int gpiochip_add_data_with_key(struct gpio_chip
> *gc, void *data,
>   		}
>   	}
> 
> +	for (desc_index = 0; desc_index < gc->ngpio; desc_index++)
> +		gdev->descs[desc_index].gdev = gdev;
> +
>   	ATOMIC_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
>   	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->device_notifier);
> 
> @@ -1055,8 +1058,6 @@ int gpiochip_add_data_with_key(struct gpio_chip
> *gc, void *data,
>   	for (desc_index = 0; desc_index < gc->ngpio; desc_index++) {
>   		struct gpio_desc *desc = &gdev->descs[desc_index];
> 
> -		desc->gdev = gdev;
> -
>   		if (gc->get_direction && gpiochip_line_is_valid(gc, desc_index)) {
>   			assign_bit(FLAG_IS_OUT,
>   				   &desc->flags, !gc->get_direction(gc, desc_index));
> 
> I'm wondering if this is not an earlier commit.
> 
> Bart

That doesn't seem to change anything significantly:

Call Trace:
gpiod_direction_output (drivers/gpio/gpiolib.c:4165 
drivers/gpio/gpiolib.c:2701 drivers/gpio/gpiolib.c:2695)
i2c_register_adapter (drivers/i2c/i2c-core-base.c:396 
drivers/i2c/i2c-core-base.c:422 drivers/i2c/i2c-core-base.c:434 
drivers/i2c/i2c-core-base.c:1574)
octeon_i2c_probe (drivers/i2c/busses/i2c-octeon-platdrv.c:247)

--------------g0JXqH05nzju718vJmfr0xrc
Content-Type: application/gzip; name="gpiod_oops3_decoded.gz"
Content-Disposition: attachment; filename="gpiod_oops3_decoded.gz"
Content-Transfer-Encoding: base64

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

--------------g0JXqH05nzju718vJmfr0xrc--

