Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1D9DF20
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2019 11:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727817AbfD2JQZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Apr 2019 05:16:25 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:42405 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727811AbfD2JQY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Apr 2019 05:16:24 -0400
Received: from mail-pl1-f200.google.com ([209.85.214.200])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1hL2Ob-0004Eo-W9
        for linux-gpio@vger.kernel.org; Mon, 29 Apr 2019 09:16:22 +0000
Received: by mail-pl1-f200.google.com with SMTP id s19so5147919plp.6
        for <linux-gpio@vger.kernel.org>; Mon, 29 Apr 2019 02:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=1vBVQBSQaK0ivjDWZNWqu8SXOnL5ZygG/J+bF2HLTJs=;
        b=o/yFZTy1r8lFBbzCryHY1mvxaGpnDRR0Xap3jKP9xCk7WazWYnjQnLysrChi7hPcpK
         2834+GKgOsnVUT1Uz4ICpPkfopXr5AnTZiaUg36mFUI944sbwZYyo/1Z3kjDqYxReuI9
         bCq0t0JPdkOjI+QwaEpW4ag6PhPNc2nWKKPsoFPmPRrQmlMIKT6Cm6U31dgcAeFfwpZ8
         yCe+SX+xS+Z36TiW945l71RZweeIfyQ/kZOgUsQX+Yc+dVtH6aoGj99jMMrlVLpOgNQv
         YPyg5D+lS6S9wNIg4AJvoW/BI7gGjLcpmgoftLwbhAi7kLDQ4QSNJ0XpFQs8SUITByhB
         Eygw==
X-Gm-Message-State: APjAAAU4L06TRVTlE5c+CDC5kn/QbTVy3gdGYmFqxO+r1QJVs0QnUViA
        uXmSuyQZ3MTREhC0PAWIyWEsp3beEOFhkVJroY1GDi8gzsCdaMueqBi3B3GH24A2bvQNFdKmomS
        50/Z5aY+/CQM+XXEh3TpQWZizyZFB8XRgO4l/z+4=
X-Received: by 2002:a17:902:864b:: with SMTP id y11mr57315654plt.1.1556529380731;
        Mon, 29 Apr 2019 02:16:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx9XpO1CeaEcjEEhjhsFZff8FIsuKve2mo/JyFPlSC/H3qRTN5B3xh7+JxXzybE2gVR/l0Djw==
X-Received: by 2002:a17:902:864b:: with SMTP id y11mr57315617plt.1.1556529380409;
        Mon, 29 Apr 2019 02:16:20 -0700 (PDT)
Received: from 2001-b011-380f-14b9-d9ab-9ff9-92fc-2609.dynamic-ip6.hinet.net (2001-b011-380f-14b9-d9ab-9ff9-92fc-2609.dynamic-ip6.hinet.net. [2001:b011:380f:14b9:d9ab:9ff9:92fc:2609])
        by smtp.gmail.com with ESMTPSA id f63sm55095222pfc.180.2019.04.29.02.16.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 02:16:19 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii;
        delsp=yes;
        format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: Re: [PATCH] pinctrl: intel: Clear interrupt status in unmask callback
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20190426214758.GC9224@smile.fi.intel.com>
Date:   Mon, 29 Apr 2019 17:16:16 +0800
Cc:     mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        hotwater438@tutanota.com, hdegoede@redhat.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <6BCF9C55-E365-4638-8030-99EBA348F8D4@canonical.com>
References: <20190422044539.16085-1-kai.heng.feng@canonical.com>
 <20190426214758.GC9224@smile.fi.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailer: Apple Mail (2.3445.104.8)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

at 05:47, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Mon, Apr 22, 2019 at 12:45:39PM +0800, Kai-Heng Feng wrote:
>> Commit a939bb57cd47 ("pinctrl: intel: implement gpio_irq_enable") was
>> added because clearing interrupt status bit is required to avoid
>> unexpected behavior.
>>
>> Turns out the unmask callback also needs the fix, which can solve weird
>> IRQ triggering issues on I2C touchpad ELAN1200.
>
>> -static void intel_gpio_irq_enable(struct irq_data *d)
>> -{
>> -	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>> -	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
>> -	const struct intel_community *community;
>> -	const struct intel_padgroup *padgrp;
>> -	int pin;
>> -
>> -	pin = intel_gpio_to_pin(pctrl, irqd_to_hwirq(d), &community, &padgrp);
>> -	if (pin >= 0) {
>> -		unsigned int gpp, gpp_offset, is_offset;
>> -		unsigned long flags;
>> -		u32 value;
>> -
>> -		gpp = padgrp->reg_num;
>> -		gpp_offset = padgroup_offset(padgrp, pin);
>> -		is_offset = community->is_offset + gpp * 4;
>> -
>> -		raw_spin_lock_irqsave(&pctrl->lock, flags);
>> -		/* Clear interrupt status first to avoid unexpected interrupt */
>> -		writel(BIT(gpp_offset), community->regs + is_offset);
>> -
>> -		value = readl(community->regs + community->ie_offset + gpp * 4);
>> -		value |= BIT(gpp_offset);
>> -		writel(value, community->regs + community->ie_offset + gpp * 4);
>> -		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>> -	}
>> -}
>> -
>>  static void intel_gpio_irq_mask_unmask(struct irq_data *d, bool mask)
>>  {
>>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>> @@ -963,6 +934,11 @@ static void intel_gpio_irq_mask_unmask(struct  
>> irq_data *d, bool mask)
>>  		reg = community->regs + community->ie_offset + gpp * 4;
>>
>>  		raw_spin_lock_irqsave(&pctrl->lock, flags);
>> +
>> +		/* Clear interrupt status first to avoid unexpected interrupt */
>
>> +		if (!mask)
>
> Can we do this unconditionally?

Yes I think so.

>
>> +			writel(BIT(gpp_offset), community->regs +  
>> community->is_offset + gpp * 4);
>
> I would rather prefer to follow the below pattern, like
>
> reg = ...;
> writel(..., reg);
>
> or, to decrease calculus under spin lock, something like
>
> reg = ->regs + gpp * 4;
>
> writel(..., reg + is_offset);
>
> readl(reg + ie_offset);
>
> etc.

Ok, will do.

>
>> +
>>  		value = readl(reg);
>>  		if (mask)
>>  			value &= ~BIT(gpp_offset);
>> @@ -1106,7 +1082,6 @@ static irqreturn_t intel_gpio_irq(int irq, void  
>> *data)
>>
>>  static struct irq_chip intel_gpio_irqchip = {
>>  	.name = "intel-gpio",
>
>> -	.irq_enable = intel_gpio_irq_enable,
>
> Is it possible scenario when IRQ enable is called, but not masking  
> callbacks?
> For _AEI or GPE?

I am unfamiliar with both of them, what are the callbacks to be used for  
_AEI and GPE case?
Seems like both gpiolib and irqchip call irq_unmask() when irq_enable() is  
absent.

Kai-Heng

>
>> .irq_ack = intel_gpio_irq_ack,
>>  	.irq_mask = intel_gpio_irq_mask,
>>  	.irq_unmask = intel_gpio_irq_unmask,
>
> -- 
> With Best Regards,
> Andy Shevchenko


