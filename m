Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7626506E88
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Apr 2022 15:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352622AbiDSNpG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Apr 2022 09:45:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352563AbiDSNlu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Apr 2022 09:41:50 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D45438781
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 06:38:58 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3C7D3839B7;
        Tue, 19 Apr 2022 15:38:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1650375535;
        bh=C6bkAusu1flzQMOf+A+6byWOd4l1MhM2tfURKsZszaI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=fKU4kGGJAiQa69b41st5FHLO4TPaKY2oGupNuVQeI5qpbOyrGObl8QdH0u1pbiHg6
         mzpNHG4osX/7XDkcmK5Sz+IqnJmYfprLqoJEYj+7mxxzWZyHy5zcTZn/yaSRQJg7IE
         m7YlLKCuWKYtV1wifuHkGzhsS9IVnqj4v9Oit85dUBUeBgQBnITmbuhiU3pMmCOqpH
         OZJ6qDmlsowm5okRCtEsrK2cug+0Ga5NyKbOSq2BilDhuwMIAkzsCbzho9weJFmOMJ
         dbNquWG43XygUYkEKjUKYHPUnlh+RPl7aISPvODVL9ij4zGq2va3+tI2R97wJW5YOt
         JGnkHCqPN63cg==
Message-ID: <0f3c5762-f317-b9e5-47a6-dadb92008b0a@denx.de>
Date:   Tue, 19 Apr 2022 15:38:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC][PATCH] irqchip/stm32: Retrigger hierarchy for LEVEL
 triggered IRQs in tasklet
Content-Language: en-US
To:     Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        linux-gpio@vger.kernel.org
Cc:     Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20220415215550.498381-1-marex@denx.de>
 <316ce7c7-2a8b-7854-8ea1-3cbe588eb605@foss.st.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <316ce7c7-2a8b-7854-8ea1-3cbe588eb605@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 4/19/22 14:36, Alexandre TORGUE wrote:
> Hi Marek

Hi,

> On 4/15/22 23:55, Marek Vasut wrote:
>> The current EOI handler for LEVEL triggered interrupts calls 
>> clk_enable(),
>> register IO, clk_disable(). The clock manipulation requires locking which
>> happens with IRQs disabled in clk_enable_lock(). Move the LEVEL IRQ test
>> and retrigger into dedicated tasklet and schedule the tasklet every time
>> a LEVEL IRQ triggers. This makes EOI fast for majority of IRQs on this
>> platform again, since those are edge triggered IRQs, and LEVEL triggered
>> IRQs are the exception.
>>
>> This also fixes the following splat found when using preempt-rt:
>>   ------------[ cut here ]------------
>>   WARNING: CPU: 0 PID: 0 at kernel/locking/rtmutex.c:2040 
>> __rt_mutex_trylock+0x37/0x62
>>   Modules linked in:
>>   CPU: 0 PID: 0 Comm: swapper/0 Not tainted 
>> 5.10.109-rt65-stable-standard-00068-g6a5afc4b1217 #85
>>   Hardware name: STM32 (Device Tree Support)
>>   [<c010a45d>] (unwind_backtrace) from [<c010766f>] (show_stack+0xb/0xc)
>>   [<c010766f>] (show_stack) from [<c06353ab>] (dump_stack+0x6f/0x84)
>>   [<c06353ab>] (dump_stack) from [<c01145e3>] (__warn+0x7f/0xa4)
>>   [<c01145e3>] (__warn) from [<c063386f>] (warn_slowpath_fmt+0x3b/0x74)
>>   [<c063386f>] (warn_slowpath_fmt) from [<c063b43d>] 
>> (__rt_mutex_trylock+0x37/0x62)
>>   [<c063b43d>] (__rt_mutex_trylock) from [<c063c053>] 
>> (rt_spin_trylock+0x7/0x16)
>>   [<c063c053>] (rt_spin_trylock) from [<c036a2f3>] 
>> (clk_enable_lock+0xb/0x80)
>>   [<c036a2f3>] (clk_enable_lock) from [<c036ba69>] 
>> (clk_core_enable_lock+0x9/0x18)
>>   [<c036ba69>] (clk_core_enable_lock) from [<c034e9f3>] 
>> (stm32_gpio_get+0x11/0x24)
>>   [<c034e9f3>] (stm32_gpio_get) from [<c034ef43>] 
>> (stm32_gpio_irq_trigger+0x1f/0x48)
>>   [<c034ef43>] (stm32_gpio_irq_trigger) from [<c014aa53>] 
>> (handle_fasteoi_irq+0x71/0xa8)
>>   [<c014aa53>] (handle_fasteoi_irq) from [<c0147111>] 
>> (generic_handle_irq+0x19/0x22)
>>   [<c0147111>] (generic_handle_irq) from [<c014752d>] 
>> (__handle_domain_irq+0x55/0x64)
>>   [<c014752d>] (__handle_domain_irq) from [<c0346f13>] 
>> (gic_handle_irq+0x53/0x64)
>>   [<c0346f13>] (gic_handle_irq) from [<c0100ba5>] (__irq_svc+0x65/0xc0)
>>   Exception stack(0xc0e01f18 to 0xc0e01f60)
>>   1f00:                                                       0000300c 
>> 00000000
>>   1f20: 0000300c c010ff01 00000000 00000000 c0e00000 c0e07714 00000001 
>> c0e01f78
>>   1f40: c0e07758 00000000 ef7cd0ff c0e01f68 c010554b c0105542 40000033 
>> ffffffff
>>   [<c0100ba5>] (__irq_svc) from [<c0105542>] (arch_cpu_idle+0xc/0x1e)
>>   [<c0105542>] (arch_cpu_idle) from [<c063be95>] 
>> (default_idle_call+0x21/0x3c)
>>   [<c063be95>] (default_idle_call) from [<c01324f7>] (do_idle+0xe3/0x1e4)
>>   [<c01324f7>] (do_idle) from [<c01327b3>] (cpu_startup_entry+0x13/0x14)
>>   [<c01327b3>] (cpu_startup_entry) from [<c0a00c13>] 
>> (start_kernel+0x397/0x3d4)
>>   [<c0a00c13>] (start_kernel) from [<00000000>] (0x0)
>>   ---[ end trace 0000000000000002 ]---
> 
> Internally we are changing things about clocking in stm32 pinctrl 
> driver. Fabien will give more details than me, but the idea is to clock 
> one times all banks during probe. It is done mainily to improve 
> performances during GPIO toggling and it will fix also the issue you 
> report.

Nice. If you have anything to submit, please CC me.

Also, I think you can still apply this one as an optimization ?

[PATCH] irqchip/stm32: Do not call stm32_gpio_get() for edge triggered 
IRQs in EOI
