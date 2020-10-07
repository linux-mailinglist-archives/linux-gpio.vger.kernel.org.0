Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B81282861BB
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 17:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728732AbgJGPAp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 11:00:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:47862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728641AbgJGPAp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 7 Oct 2020 11:00:45 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1C20F208C7;
        Wed,  7 Oct 2020 15:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602082845;
        bh=P8qa4iCBFufQxB9GuwBrCnzYStLWh74O4dgBJmnTJ5Y=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=b//BJH3koCGhO/u/qHbubxe4LglHgryYJuPsLPfIHW0nw9xY/NkZB8rBMUfNIKIsx
         zOHmToxJSnGokww5BIorYu/xvLoPhiJdo/c9fT1OvXqJqSEhUItVgolSLGxXVMG8Se
         uBYz51+/xBziScUPJTdsOjmlrgYgS9++lm7GFolw=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kQAvr-000Oc8-17; Wed, 07 Oct 2020 16:00:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 07 Oct 2020 16:00:42 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        kernel-team@android.com
Subject: Re: [PATCH] gpio: pca953x: Survive spurious interrupts
In-Reply-To: <CAHp75VdZxU67P9RPAmw=hnToR2H-8bfHvzeU4UCwKCpV5xEKNg@mail.gmail.com>
References: <20201005140217.1390851-1-maz@kernel.org>
 <CACRpkdbctO9cWZZhVQHWkA1DN7YRTsLRo4Ub9g2x7q6BBSD=Ug@mail.gmail.com>
 <CAHp75Vdb3y_r_+Mq8K=Jog21wiFH54F18ED8eBwT4rM_zxcCUA@mail.gmail.com>
 <0175d3ce84ea0aa938a3ce9b3731762e@kernel.org>
 <CAHp75VdQixJStuVj_aMZ9PhkWXk4RoUa13wAMDj4KGwm2t9nFQ@mail.gmail.com>
 <bab5b8d99b57710030955c3924c9fca5@kernel.org>
 <CAHp75VdZxU67P9RPAmw=hnToR2H-8bfHvzeU4UCwKCpV5xEKNg@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <15ef48ca189e6535ea1549f7329bc20e@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: andy.shevchenko@gmail.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, bgolaszewski@baylibre.com, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-10-07 15:03, Andy Shevchenko wrote:
> On Wed, Oct 7, 2020 at 4:20 PM Marc Zyngier <maz@kernel.org> wrote:
>> On 2020-10-07 14:10, Andy Shevchenko wrote:
>> > On Wed, Oct 7, 2020 at 3:09 PM Marc Zyngier <maz@kernel.org> wrote:
>> >> On 2020-10-07 13:02, Andy Shevchenko wrote:
>> >> > On Wed, Oct 7, 2020 at 12:49 PM Linus Walleij
>> >> > <linus.walleij@linaro.org> wrote:
>> >> >> On Mon, Oct 5, 2020 at 4:02 PM Marc Zyngier <maz@kernel.org> wrote:
>> >> >>
>> >> >> > The pca953x driver never checks the result of irq_find_mapping(),
>> >> >> > which returns 0 when no mapping is found. When a spurious interrupt
>> >> >> > is delivered (which can happen under obscure circumstances), the
>> >> >> > kernel explodes as it still tries to handle the error code as
>> >> >> > a real interrupt.
>> >> >> >
>> >> >> > Handle this particular case and warn on spurious interrupts.
>> >> >> >
>> >> >> > Signed-off-by: Marc Zyngier <maz@kernel.org>
>> >> >
>> >> > Wait, doesn't actually [1]  fix the reported issue?
>> >>
>> >> Not at all.
>> >>
>> >> > Marc, can you confirm this?
>> >> >
>> >> > [1]: e43c26e12dd4 ("gpio: pca953x: Fix uninitialized pending variable")
>> >>
>> >> Different bug, really. If an interrupt is *really* pending, and no
>> >> mapping established yet, feeding the result of irq_find_mapping() to
>> >> handle_nested_irq() will lead to a panic.
>> >
>> > I don't understand. We have plenty of drivers doing exactly the way
>> > without checking this returned code.
>> 
>> I'm sure we do. Most driver code is buggy as hell, but I don't see 
>> that
>> as a reason to cargo-cult the crap. The API is crystal clear that it 
>> can
>> return 0 for no mapping, and 0 isn't a valid interrupt.
> 
> Yes, and the problem here is that we got this response from IRQ core,
> which we shouldn't.

What do you mean? There is no mapping at all. and all the core code
can tell you is exactly that. If you think that using an error code
as a valid input to another function is OK, we have a much bigger
problem.

> 
>> > What circumstances makes the mapping be absent?
>> 
>> Other bugs in the system ([1]), spurious interrupts (which can 
>> *always*
>> happen).
>> 
>> > Shouldn't we rather change this:
>> >
>> >         girq->handler = handle_simple_irq;
>> > to this:
>> >         girq->handler = handle_bad_irq;
>> > ?
>> 
>> I don't understand what you are trying to achieve with that, apart 
>> from
>> maybe breaking the driver. The right way to handle spurious interrupts
>> is by telling the core code that the interrupt wasn't handled, and to
>> let
>> the spurious interrupt code do its magic.
> 
> handle_bad_irq() is exactly for handling spurious IRQs as far as we
> believe documentation. So, by default the driver assigns (should
> assign) handle_bad_irq() to all IRQs as a default handler. If, by any
> chance, we got it, we already have a proper handler in place. The read
> handler is assigned whenever the IRQ core is called to register it (by
> means of ->irq_set_type() callback). My understanding that GPIO IRQ
> drivers are designed (should be designed) in this way.  The approach
> will make us sure that we don't have spurious interrupts with assigned
> handlers.

I can't see how setting this to anything else can work, given that
handle_nested_irq() knows nothing about this flow (it doesn't use
any).

         M.
-- 
Jazz is not dead. It just smells funny...
