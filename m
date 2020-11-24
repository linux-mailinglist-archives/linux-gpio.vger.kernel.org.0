Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A79F02C235C
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 11:58:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732187AbgKXK4q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 05:56:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbgKXK4q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2020 05:56:46 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1DDDC0613D6
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 02:56:44 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id w187so3630141pfd.5
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 02:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ho+OU1gWIbxlU6vkFFYhPItLBY/4CgC1Ux1l0SznRAg=;
        b=SSOV3AHKcYwB6+VVY1RKwf3eonAoK6VB7pgCtKHR8LD3fRuhXLehOkIUQSnbQIDI4/
         p3q0lllVhyARw/nFniVJuSZDSA1nyuupwNNDJFfBpDHPMhOE1FaqJl/r4F+EjejdwGh6
         JcTYJjpYmkK5vvITW2a+tZh4AjKcXiOtBFjVSdkurRhJSjv91DLg2qu+cCdrKbmCH2ek
         XlPQWnIeN1dG8UEFO7U6FU5ocZw0syYsyS7a7xM2lRPAMw13hOx8/vzLXyLbY8/o4EiN
         9GUnx1vWcyBeLGNll61sm78qt98gQpFgpeGDJx/kqBx4w5ovOS0zJDPQfVVMkvsWOSLZ
         1UcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ho+OU1gWIbxlU6vkFFYhPItLBY/4CgC1Ux1l0SznRAg=;
        b=ssIv7NX48seILBqxlwBDu/4gmuG1Lq6XiSYWaIi9DWLA2IPZ/QSPJIOvlrwyZfaQhi
         bgehurn1BLFvPeoM5UmG/e4buAe1wSQPJkIFrlPLLen8Wha8hWwBoYm+yxYu81UMSTex
         Bo1YxSl2E0/JfyQ1C9B1T0aVmc0SwdYqyTaGp0mVqbD+XKaFhZaIPosBeNjAxuIhcXzb
         vzphzm8koO4+6fe1sZBInjwCeXzJMHgxwSLyH77tCVtC91Gwb5ntW/PxSB3zoehNyCNd
         93EKDhmVkjYlxxeTKUH4GYCfB1nlDQ4PjeIrKUSxeztdvNy3CX+9RRETrKQrYc3/Uo6E
         TuMg==
X-Gm-Message-State: AOAM5303lTJuRKtsZY31S0tJTYQi05XfS3PfRFZiAi1Hrooee+DbESzW
        NfrZ3CaD3ORloe+9jkNQYuHceg==
X-Google-Smtp-Source: ABdhPJx7aupXyGjbsXOlPp/GgIVXYWhXASJLws7GvUy6w0exJM/+0lrVY6h+M0ix3HjuU4jTiROcvg==
X-Received: by 2002:a17:90b:4398:: with SMTP id in24mr4069757pjb.188.1606215404113;
        Tue, 24 Nov 2020 02:56:44 -0800 (PST)
Received: from [0.0.0.0] (124-171-134-245.dyn.iinet.net.au. [124.171.134.245])
        by smtp.gmail.com with UTF8SMTPSA id j10sm1087588pji.29.2020.11.24.02.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 02:56:43 -0800 (PST)
Subject: Re: [PATCH kernel v4 2/8] genirq/irqdomain: Clean legacy IRQ
 allocation
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
        Frederic Barrat <fbarrat@linux.ibm.com>,
        =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
        Oliver O'Halloran <oohall@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT" 
        <linuxppc-dev@lists.ozlabs.org>
References: <20201124061720.86766-1-aik@ozlabs.ru>
 <20201124061720.86766-3-aik@ozlabs.ru>
 <CAHp75VfV4mG23C9Ep1vNLk2oBjB=LTQGyU=fhWPhw4PX-Ci-7A@mail.gmail.com>
From:   Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <38b803db-2d67-dfa0-7e7b-e4ce816576ad@ozlabs.ru>
Date:   Tue, 24 Nov 2020 21:56:36 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:84.0) Gecko/20100101
 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfV4mG23C9Ep1vNLk2oBjB=LTQGyU=fhWPhw4PX-Ci-7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 11/24/20 8:19 PM, Andy Shevchenko wrote:
> On Tue, Nov 24, 2020 at 8:20 AM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>
>> There are 10 users of __irq_domain_alloc_irqs() and only one - IOAPIC -
>> passes realloc==true. There is no obvious reason for handling this
>> specific case in the generic code.
>>
>> This splits out __irq_domain_alloc_irqs_data() to make it clear what
>> IOAPIC does and makes __irq_domain_alloc_irqs() cleaner.
>>
>> This should cause no behavioral change.
> 
>> +       ret = __irq_domain_alloc_irqs_data(domain, virq, nr_irqs, node, arg, affinity);
>> +       if (ret <= 0)
>>                  goto out_free_desc;
> 
> Was or wasn't 0 considered as error code previously?

Oh. I need to clean this up, the idea is since this does not allocate 
IRQs, this should return error code and not an irq, I'll make this explicit.

> 
>>          return virq;
> 
>>   out_free_desc:
>>          irq_free_descs(virq, nr_irqs);
>>          return ret;
> 

-- 
Alexey
