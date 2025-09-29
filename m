Return-Path: <linux-gpio+bounces-26660-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89179BA9292
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 14:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36D9A165B21
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 12:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386452FFF88;
	Mon, 29 Sep 2025 12:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="KwG4vMWs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12ACC305040
	for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2025 12:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759147807; cv=none; b=uaE/QxlREFeOKttSYhVhKSeRdb8/Fgsb/ITdUbcpBfP6wnwLe5EIlEGDRV7nvjy6TTYzTGBx4c5dFomDvKbi3XQZ00upXWidaXvQb5ZYulpXVsUU1OPLpEarQO1lCR4Vm9XEX4Va41nmXXdfsGNPq7h6n62/0jMikdnOermVL7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759147807; c=relaxed/simple;
	bh=xp73wE0iogPFWbLCN8f/Njrke1JukbnUCU8WyG4rMoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HSt0sftyDp5owx8v36YatPVF6c3fcPHKGSQ4yKIl3XVtFWdcEMlj2emM99mV5SmYcZBp3CF4TFqjjQT4Rm1030W7TVxxQx7PHfMknEsaQsF5qPvW9+D2hI87oKPGm4DlzeW9iOQ1xN+SNp1mDDoNwoFO3PDpG4XBNkDylg+bU7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KwG4vMWs; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3c68ac7e18aso3128248f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2025 05:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1759147802; x=1759752602; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/A1N+ty2qApZBdj5/inaifpCvqdtitLGQdcgdQAh7Zc=;
        b=KwG4vMWspA2Bn1gXCL5Mpb2Dyvj7rwwLpccdrEyDsZfQUvYSXBydIuWgXUoFV7QIsi
         LGfsfd2k2boNqkTmkRagxw0LXvHEAzmGRuNGdfkJe/EAnb/hqlzxUtvvb0ry3iqyz90B
         ZDn+v6vgyXjYQAPyNOvhXb4oQsFEbJrbQ7olZJUhDatSBCRc7vX9eNisPPaHkSRrCHDy
         PE87+TvAIKXIaqt0uD7BP+bUcopb+I2Su1nJMS2Guc3bRn0abY3AyGC+I9zezqKhhBeJ
         sZ4shgjV/69blOTRjIhKStX01IxQL8ZG6yTuGGxBPUri3pCZFlDKYzZ5RPTiOzE6B/cr
         vemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759147802; x=1759752602;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/A1N+ty2qApZBdj5/inaifpCvqdtitLGQdcgdQAh7Zc=;
        b=b6taF4lds0NgzQJ0YQvClNVhMNBXoFPJ1jFheZX4PzD9vpU9fByTKo78TSQlpEe/RV
         OaPfu2jDxtYQFEBh9zFUbSIXj/PC9Vyqi8iXkqWBAgzWj9CyTwPWqt5+5hlNQ3rltL/O
         Vi9ExBxSt8uUwb7R0aPXse+AGbDvLNkMYNE5F8oi7wIaeMMbDSfZ3QmlM1RfYTQFfm/R
         gfrU95zOtfChO0j8oXyViQSNTDOZFjUr19Tq+FsvEQ31Nr/xDYctodjpMYBQmUH7tNQu
         6gCEVB/nVtHAPiE3OFqZCEQnc6uA7De3VeEGejSkwpBBi+sTQMug6a2Usj1vGzTOJ4CJ
         Sbeg==
X-Forwarded-Encrypted: i=1; AJvYcCXPGrGmpVh4q1hgGgQX6NoQp7ot7wePocd+PvlR9FDV2IlK/2Q7o1OgGHP9Wy0vjEy3m8msxw0cYPAS@vger.kernel.org
X-Gm-Message-State: AOJu0YyZIOw87bgvYtO4kLM2EaSfZLkF2Ies1pAW0KCjxzXjm2exDOki
	+iSH0A/CXcypUqDMk9FryCYPwhX63S4CgUXE6WPCvWo3RkstyaPyg1qXehVk/Ktkm34=
X-Gm-Gg: ASbGncvwMVEk3rhV+QW8GBzjf8/7m5zQmr41kY9PheeM6qPQ72+01/86ed5i5Wpwon3
	dV6yUTkoRU/pVgkRvWKLf2rW4QQqOmqGmBqyethZxYbdfb0LLPJA6dARNyIErDAOU8bzVQEcb48
	iLkPQ0gAKHmeFIBqFXGGmPs5CjX30Dd+CbesGylgkbaf9t9xiT3NLhn3Cf4UVp3P+i2I1myj16Y
	DCwvvZPJ5cZZJYkT3eejo2q/5MVT7CCPvuL2G/RfejOl+N4o0Qsp81a3aSQc5/H4bABugSe/I3h
	etxNbBPjidsOCEXbti64FuBRoxAkj0W9PXJefI1fJub21SGdHJt1Jj/H0UOpT5QPQE5hnh16tQU
	Y8ppRNlEzAxGJX1mwv/jQOUdta8DBf2unYRawYlawqQ==
X-Google-Smtp-Source: AGHT+IGOI3s83JZpf8iF/U2faBc1EGkYgirVAtNe1lZ2DI3XBN2xkajove5bIaa7373Vb0l2Wjr1lw==
X-Received: by 2002:a05:6000:3105:b0:3f8:6e37:376 with SMTP id ffacd0b85a97d-40e499acbecmr16060096f8f.45.1759147802117;
        Mon, 29 Sep 2025 05:10:02 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e56f3d754sm11135015e9.4.2025.09.29.05.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 05:10:01 -0700 (PDT)
Message-ID: <ef82c610-0571-4665-a5d1-07a9ed9fb8d3@tuxon.dev>
Date: Mon, 29 Sep 2025 15:10:00 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: renesas: rzg2l: Fix ISEL restore on resume
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linus.walleij@linaro.org, biju.das.jz@bp.renesas.com,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
References: <20250912095308.3603704-1-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdXv1-w0SE7FZy5k3jg2FO-a-RB2w1WB=VM_UFEA9zjWDw@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdXv1-w0SE7FZy5k3jg2FO-a-RB2w1WB=VM_UFEA9zjWDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 9/29/25 15:03, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Fri, 12 Sept 2025 at 11:53, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Commit 1d2da79708cb ("pinctrl: renesas: rzg2l: Avoid configuring ISEL in
>> gpio_irq_{en,dis}able*()") dropped the configuration of ISEL from
>> struct irq_chip::{irq_enable, irq_disable} APIs and moved it to
>> struct gpio_chip::irq::{child_to_parent_hwirq,
>> child_irq_domain_ops::free} APIs to fix spurious IRQs.
>>
>> After commit 1d2da79708cb ("pinctrl: renesas: rzg2l: Avoid configuring ISEL
>> in gpio_irq_{en,dis}able*()"), ISEL was no longer configured properly on
>> resume. This is because the pinctrl resume code used
>> struct irq_chip::irq_enable  (called from rzg2l_gpio_irq_restore()) to
>> reconfigure the wakeup interrupts. Some drivers (e.g. Ethernet) may also
>> reconfigure non-wakeup interrupts on resume through their own code,
>> eventually calling struct irq_chip::irq_enable.
>>
>> Fix this by adding ISEL configuration back into the
>> struct irq_chip::irq_enable API and on resume path for wakeup interrupts.
>>
>> As struct irq_chip::irq_enable needs now to lock to update the ISEL,
>> convert the struct rzg2l_pinctrl::lock to a raw spinlock and replace the
>> locking API calls with the raw variants. Otherwise the lockdep reports
>> invalid wait context when probing the adv7511 module on RZ/G2L:
>>
>>  [ BUG: Invalid wait context ]
>>  6.17.0-rc5-next-20250911-00001-gfcfac22533c9 #18 Not tainted
>>  -----------------------------
>>  (udev-worker)/165 is trying to lock:
>>  ffff00000e3664a8 (&pctrl->lock){....}-{3:3}, at: rzg2l_gpio_irq_enable+0x38/0x78
>>  other info that might help us debug this:
>>  context-{5:5}
>>  3 locks held by (udev-worker)/165:
>>  #0: ffff00000e890108 (&dev->mutex){....}-{4:4}, at: __driver_attach+0x90/0x1ac
>>  #1: ffff000011c07240 (request_class){+.+.}-{4:4}, at: __setup_irq+0xb4/0x6dc
>>  #2: ffff000011c070c8 (lock_class){....}-{2:2}, at: __setup_irq+0xdc/0x6dc
>>  stack backtrace:
>>  CPU: 1 UID: 0 PID: 165 Comm: (udev-worker) Not tainted 6.17.0-rc5-next-20250911-00001-gfcfac22533c9 #18 PREEMPT
>>  Hardware name: Renesas SMARC EVK based on r9a07g044l2 (DT)
>>  Call trace:
>>  show_stack+0x18/0x24 (C)
>>  dump_stack_lvl+0x90/0xd0
>>  dump_stack+0x18/0x24
>>  __lock_acquire+0xa14/0x20b4
>>  lock_acquire+0x1c8/0x354
>>  _raw_spin_lock_irqsave+0x60/0x88
>>  rzg2l_gpio_irq_enable+0x38/0x78
>>  irq_enable+0x40/0x8c
>>  __irq_startup+0x78/0xa4
>>  irq_startup+0x108/0x16c
>>  __setup_irq+0x3c0/0x6dc
>>  request_threaded_irq+0xec/0x1ac
>>  devm_request_threaded_irq+0x80/0x134
>>  adv7511_probe+0x928/0x9a4 [adv7511]
>>  i2c_device_probe+0x22c/0x3dc
>>  really_probe+0xbc/0x2a0
>>  __driver_probe_device+0x78/0x12c
>>  driver_probe_device+0x40/0x164
>>  __driver_attach+0x9c/0x1ac
>>  bus_for_each_dev+0x74/0xd0
>>  driver_attach+0x24/0x30
>>  bus_add_driver+0xe4/0x208
>>  driver_register+0x60/0x128
>>  i2c_register_driver+0x48/0xd0
>>  adv7511_init+0x5c/0x1000 [adv7511]
>>  do_one_initcall+0x64/0x30c
>>  do_init_module+0x58/0x23c
>>  load_module+0x1bcc/0x1d40
>>  init_module_from_file+0x88/0xc4
>>  idempotent_init_module+0x188/0x27c
>>  __arm64_sys_finit_module+0x68/0xac
>>  invoke_syscall+0x48/0x110
>>  el0_svc_common.constprop.0+0xc0/0xe0
>>  do_el0_svc+0x1c/0x28
>>  el0_svc+0x4c/0x160
>>  el0t_64_sync_handler+0xa0/0xe4
>>  el0t_64_sync+0x198/0x19c
>>
>> Having ISEL configuration back into the struct irq_chip::irq_enable API
>> should be safe with respect to spurious IRQs, as in the probe case IRQs
>> are enabled anyway in struct gpio_chip::irq::child_to_parent_hwirq. No
>> spurious IRQs were detected on suspend/resume, boot, ethernet link
>> insert/remove tests (executed on RZ/G3S). Boot, ethernet link
>> insert/remove tests were also executed successfully on RZ/G2L.
>>
>> Fixes: 1d2da79708cb ("pinctrl: renesas: rzg2l: Avoid configuring ISEL in gpio_irq_{en,dis}able*(")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v2:
>> - changed the implementation approach by dropping the spinlock in
>>   rzg2l_gpio_irq_endisable(), renaming it to
>>   __rzg2l_gpio_irq_endisable() and using it in
>>   rzg2l_gpio_irq_endisable(), the newly introduced
>>   __rzg2l_gpio_irq_enable() and rzg2l_gpio_irq_restore()
>> - convert struct rzg2l_pinctrl::lock to raw_spinlock_t
> 
> LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-pinctrl for v6.19.
> 
>> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> @@ -543,7 +543,7 @@ static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
>>         unsigned long flags;
>>         u32 reg;
>>
>> -       spin_lock_irqsave(&pctrl->lock, flags);
>> +       raw_spin_lock_irqsave(&pctrl->lock, flags);
>>
>>         /* Set pin to 'Non-use (Hi-Z input protection)'  */
>>         reg = readw(pctrl->base + PM(off));
> 
> This conflicts with commit d57183d06851bae4 ("pinctrl: renesas: rzg2l:
> Drop unnecessary pin configurations"), which I have already queued
> in renesas-drivers/renesas-pinctrl-for-v6.19.  Hence I am replacing
> the above hunk by:
> 
>             /* Switching to GPIO is not required if reset value is
> same as func */
>             reg = readb(pctrl->base + PMC(off));
>     -       spin_lock_irqsave(&pctrl->lock, flags);
>     +       raw_spin_lock_irqsave(&pctrl->lock, flags);
>             pfc = readl(pctrl->base + PFC(off));
>             if ((reg & BIT(pin)) && (((pfc >> (pin * 4)) & PFC_MASK) == func)) {
>     -               spin_unlock_irqrestore(&pctrl->lock, flags);
>     +               raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>                     return;
>             }
> 
> while applying.

This is right. Thank you! I'm going to give it also a try (on actual HW) a
bit later. I'll let you know.

Thank you,
Claudiu

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


