Return-Path: <linux-gpio+bounces-18756-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 534FFA8721E
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Apr 2025 15:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67F071897A5B
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Apr 2025 13:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71BA1A23B5;
	Sun, 13 Apr 2025 13:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHN88bVa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2560EEBB;
	Sun, 13 Apr 2025 13:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744551188; cv=none; b=iO9GOgQ9RvSiHBcAilgsSaV7q9VabhPzA6fOWNygF+aVy/z4NYpXWp+D/1X1FEheE/VpUmPIVsKBormipZ+86risAgNFhJWZDsBQMWqjcSzyeuWb5ZdJBRuAto8cFKYuMU3F8CbUQaopbqr97QP2uZt46P40sHlJorkb2mL23dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744551188; c=relaxed/simple;
	bh=/io2fCIVwn61bzE3IZ1zRxbRmeXYtRFxR0dmm26C8GM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V9YoF8C7AbEY7EgsYkJtbfQDW1Mow2kw7Edqley5nYbUxu4F1Lh1zPnb6fjEOy/Den6fYK4ihJAjjs4cSZi3qE4UnNg4fyqmHUbQRMHJJYWN92LRldfbgpWcpWMHKRwu6xntE0LOTAyed5iyUKlHT337MOVfaT4LDNpN+BYSqUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHN88bVa; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac339f53df9so674542966b.1;
        Sun, 13 Apr 2025 06:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744551184; x=1745155984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3a1u06AVbMvV39bT1It8UySBezoNCFj29bYys44rezM=;
        b=aHN88bVasyKXiwM/avfPJrhOfEcwk4quBIcHQCLrsHbgGWX54gL7DuhbyVIsPASMJ1
         gjHQz2xYhqa2uk7HBVQs8BhTHujQJhz2faoV6LDBEAtBS3gg6LPBNhKCNKtIn1G7XLWr
         u3FKOw/P+7k5znTQiFy+yQEk6HOK1y/SpIzEwuPNn0QvmJD2tuBygSr0aobCqu0BBd2d
         QoFVKy+lrGR7UVTJUsaI/Af51Xf0Javhd3xqI/5BIgxESsw13DzxGdNvxDR4junEVoKq
         W7HExz84P2f+uOZsc8osofrYwlr3Xq5CBVyMZCQVWlI8MwDEQ7pEXQO+jXwgvUUySaCl
         /wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744551184; x=1745155984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3a1u06AVbMvV39bT1It8UySBezoNCFj29bYys44rezM=;
        b=Wic/jABdUDOOWilq/lG+qt73/a+g8ZigbzEAB0xHRR7/6pqgmOsMB16qO3gTnHIQ7b
         zDch/PEQzeUvgfjph6/ESQBy4R4hq6R0a8l5YoiWg4jTmMDyFrWIVv2FLezmKhNgwja5
         WQanpdUsgpS0mKVJLu2sPqZqUuMNqEljbPlEW59VL+J9Ie9F/wjjQDa6qFgQgUnWS/CN
         eebyrBn79BvGiTjKN+JXmP/CPK8BoR2ntRY/5EDSsAx1rte351D0FW7ShUqlGxBxGKmA
         QWj37PaaMRTOnJ53rd/uyUEabDpil6ht9Mdz+xgAo45EyFPcLhBGI3R915cdjWXYWw4l
         V0Xg==
X-Forwarded-Encrypted: i=1; AJvYcCU+2UsfeJ4Y2qV9m1jeMwvlzy/AUsUHogYF63dGmLtmxJZFLidIweAwUfvMRWC9k4uLUspR0rDt@vger.kernel.org, AJvYcCUAfJsRggAan+gJ28du9sADrnT0ZgyNC0aM+hmvksFyNKqnR2YzX6KGgXpunlubE/ltA09jnt7Kh38HQHua@vger.kernel.org, AJvYcCWTwOcuc1+ltf4toDzgK8kT/wU/CUXFMCSd0kxHKbbXgeUVUoBo6y0k3zgndd38k9yC3ZHnbErvkg9Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzDoGO9wsLvy7tL+cz2MgzZeSCsYKEeBFYy4DLVmmFlIC6FXwxR
	FFeURM2n5I0P3WPY3FGSaNslkljSpp3PIJTagcta69oaX5OxR6OP
X-Gm-Gg: ASbGncsny2eGPNJXcONcRofPlDrQgulMODIOhkTdcopXxPV3/NtyjjP42m+NRh25at4
	miCbh6xSS2YysMbhlZ0e4J5H77d0meTfhkJBCsgj5xcJa1Xiu2iaxQ0Xi46Yzo3RrLNlNQClZ68
	8ciTvXrDQeyXDFh2cRjHMF9pYnD69a+RB/4uqAgH4sYmfAFNeJLInMf+zzn/F/Qkc01kV0F95/0
	vykWXN/a3DlMnDxwCFX6NctQD5VE9XpvRslNdLL/FUP1IAc1WQmv5ryPnlq6SHTmsiLkaDKXhnb
	yzn3qFec2ZruQzjgFhlBp8TA8bzh5X9c66eg7c7mr7DkpUVB/cujJo/giuyaceEXvmoNVAQXWbV
	snu1QxDbjcu6sfjiq/Q==
X-Google-Smtp-Source: AGHT+IHTQwDuqBoQOK8q70cMWsgCsNMhH8fcIhEQocxQ5y0LxOPpy4qDpZGCpfjyyFFl5L4pd2S1EA==
X-Received: by 2002:a17:907:9959:b0:aca:d571:7790 with SMTP id a640c23a62f3a-acad571781dmr675331266b.16.1744551183703;
        Sun, 13 Apr 2025 06:33:03 -0700 (PDT)
Received: from ?IPV6:2001:b07:aac:705d:3ebb:8db3:2e25:878b? ([2001:b07:aac:705d:3ebb:8db3:2e25:878b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bea6a9sm747513466b.69.2025.04.13.06.33.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 06:33:03 -0700 (PDT)
Message-ID: <ceed9ca5-d7e4-4a86-8af9-af3e87f1c70a@gmail.com>
Date: Sun, 13 Apr 2025 15:33:02 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] gpio: pca953x: fix IRQ storm on system wake up
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Francesco Dolcini <francesco@dolcini.it>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 stable@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>
References: <20250326173838.4617-1-francesco@dolcini.it>
 <174368202234.27533.1000100252310062471.b4-ty@linaro.org>
 <Z-6TGnGUEd4JkANQ@black.fi.intel.com>
 <CAMRc=Me15MyNJiU9E-E2R9yHZ4XaS=zAuETvzKFh8=K0B4rKPw@mail.gmail.com>
 <02cab60d-9748-4227-a4aa-33373ea0be38@gmail.com>
 <Z_Px_ajf96J_LlcD@smile.fi.intel.com>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <Z_Px_ajf96J_LlcD@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/04/2025 17:40, Andy Shevchenko wrote:
>> I’ve found another possible solution: disable the PCA953x IRQ in
>> pca953x_suspend() and re-enable it in pca953x_resume().
>> This would prevent the ISR from being triggered while the regmap is in
>> cache-only mode.
>> The wake-up capability is preserved, since an IRQ can still wake the system
>> even when disabled with disable_irq(), as long as it has wake enabled.
> 
> Can you enable IRQ debugfs and dump the state of the wake* nodes for the
> respective interrupts? In this case we will be 100% sure it works as expected.
> 
# cat /sys/kernel/debug/irq/irqs/124

handler:  handle_level_irq


device:   (null)


status:   0x00000508


            _IRQ_NOPROBE


istate:   0x00004020


            IRQS_ONESHOT


ddepth:   0


wdepth:   0


dstate:   0x02402208


            IRQ_TYPE_LEVEL_LOW


            IRQD_LEVEL


            IRQD_ACTIVATED


            IRQD_IRQ_STARTED


            IRQD_DEFAULT_TRIGGER_SET


node:     0


affinity: 0-5


effectiv:


domain:  :soc:gpio@47400000


 hwirq:   0xb


 chip:    gpio-vf610


  flags:   0xa04


             IRQCHIP_MASK_ON_SUSPEND


             IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND


             IRQCHIP_IMMUTABLE


# cat /sys/kernel/debug/irq/irqs/209

handler:  handle_simple_irq


device:   (null)


status:   0x00008403


            _IRQ_NOPROBE


            _IRQ_NESTED_THREAD


istate:   0x00004000


ddepth:   0


wdepth:   0


dstate:   0x00400203


            IRQ_TYPE_EDGE_RISING


            IRQ_TYPE_EDGE_FALLING


            IRQD_ACTIVATED


            IRQD_IRQ_STARTED


node:     0


affinity: 0-5


effectiv:


domain:  :soc:bus@42000000:i2c@42540000:gpio-expander@29


 hwirq:   0x4


 chip:    3-0029


  flags:   0x800


             IRQCHIP_IMMUTABLE

And these just for confirmation (4 interrupt triggered by pushing the
SMARC_SLEEP# button):
# cat /proc/interrupts |grep 0029

124:          4          0          0          0          0          0
gpio-vf610  11 Level     3-0029

209:          0          4          0          0          0          0 3-0029
 4 Edge      SMARC_SLEEP#


# cat /sys/kernel/debug/wakeup_sources

name            active_count    event_count     wakeup_count    expire_count
 active_since    total_time      max_time        last_change
prevent_suspend_time
gpio-keys       4               4               0               0
 0               43              14              293116          0

>> This should avoid introducing regressions and still handle Geert’s use case
>> properly.
>>
>> Andy, Bart, Geert - what do you think?
> 
> Sounds okay, but please double check the above.
> 
It took me a while to realize that the relevant information is only available
when CONFIG_GENERIC_IRQ_DEBUGFS is enabled.
All /sys/kernel/irq/*/wakeup always reports "disabled", even if wakeup is
actually configured. I guess if this is the information you were asking for.

Regards,
Emanuele


