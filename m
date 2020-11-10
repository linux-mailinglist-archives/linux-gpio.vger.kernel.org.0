Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C909A2AD88F
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 15:19:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730783AbgKJOT7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 09:19:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:39650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730594AbgKJOT7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Nov 2020 09:19:59 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 37A5F207D3;
        Tue, 10 Nov 2020 14:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605017998;
        bh=K7JJrB+ZpQ1NkraBnAoR4CMvmKGwDe7qvMqD9qefqps=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=0FDk3afOEqhgxaKJxzKNjfr1qDa268skoAzIc5DpyZzvns5zLYV9Cy2+XYyyaPahv
         kZTTKRHD83c35jpnF3WcWijfT29a3Q217C7eVuXoHbuAfmqaN+5qHLcDsezvuSyS56
         ma7RwqoU6Cv05O0mxeeFOk6/F0HPrO8qeymtYgkY=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1kcUV2-009THw-4u; Tue, 10 Nov 2020 14:19:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 10 Nov 2020 14:19:56 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/5] gpio: msc313: MStar MSC313 GPIO driver
In-Reply-To: <CACRpkdYr+yhyROQzaYfFrGwG74DuZiA=fMVOesgOKrDajhTodQ@mail.gmail.com>
References: <20201019141008.871177-1-daniel@0x0f.com>
 <20201019141008.871177-4-daniel@0x0f.com>
 <CACRpkdZNr6sDqJhg3KcX0bCbcd8fh2gXFYbS1r2H2Sq+vGqjUw@mail.gmail.com>
 <3fd04aeb5047d8059ddecc1eda19c2e4@kernel.org>
 <CAFr9PX=vxCCQgCWe9FPb6Z=0=a48HwGOfM_uOG3SqGN9VSYQUA@mail.gmail.com>
 <71f3632bee262a18e1b7edb74980ae9a@kernel.org>
 <CACRpkdYr+yhyROQzaYfFrGwG74DuZiA=fMVOesgOKrDajhTodQ@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <bc0ab2f10bb72fe5b455ca12958f6444@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: linus.walleij@linaro.org, daniel@0x0f.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-11-10 14:02, Linus Walleij wrote:
> On Thu, Nov 5, 2020 at 4:43 PM Marc Zyngier <maz@kernel.org> wrote:
>> On 2020-11-05 15:23, Daniel Palmer wrote:
>> > On Thu, 5 Nov 2020 at 21:08, Marc Zyngier <maz@kernel.org> wrote:
> 
>> > >  I see that msc313_gpio_irqchip doesn't have a
>> >> .irq_set_affinity callback. Is this system UP only?
>> >
>> > What is in mainline right now is UP only but there are chips with a
>> > second cortex A7 that I have working in my tree.
>> > So I will add that in for v3 if I can work out what I should actually
>> > do there. :)
>> 
>> Probably nothing more than setting the callback to
>> irq_chip_set_affinity_parent,
> 
> Hm, is this something all GPIO irqchips used on SMP systems
> should be doing? Or just hierarchical ones?

Probably only the hierarchical ones. I'd expect the non-hierarchical
GPIOs to be muxed behind a single interrupt, which makes it impossible
to move a single GPIO around, and moving the mux interrupt would break
userspace's expectations that interrupts move independently of each 
others.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
