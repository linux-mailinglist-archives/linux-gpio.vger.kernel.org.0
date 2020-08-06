Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC95B23E180
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Aug 2020 20:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726965AbgHFSu7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Aug 2020 14:50:59 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:59514 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgHFSu7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Aug 2020 14:50:59 -0400
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1596739855;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5jOLT7KjLh6KR3yDe2c8CCevF4wz5e+CIVgPqY2iFXs=;
        b=NMoTZ2qGTnYTY5RybCmhNFvlH2w4I4wqw515nHmsI/tI8w8wQiFP4ab4zLbvFjKsdgXN7Z
        MygJD4/gXv+1cZoTEUpMrzX9yJdp6AgARSEMwY4zFeP6FaiVZt3GbsELmk60znO6A7Mf58
        QUnseDIHwxNikREi49J6IfHR48B46vIZ/t7jFCLkMy8/A+4GO6LHzmfZSNbaW0SY+ONo9j
        R9ws3VnyP3TE4k6NIuPxoAkERyrLjkuNkZSp18QS0JOudmJldoiZbQUsEjSl4HEjc9D1fr
        BLiTn/6FLcLXVVdbFUmQaF4INiSZtBPq7K3t4a7p1QDojUZ1Dte/npAFtbXblA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1596739855;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5jOLT7KjLh6KR3yDe2c8CCevF4wz5e+CIVgPqY2iFXs=;
        b=VvvJ3lQ19xcZiry0/mPfqDVRDMByaLviePUWBVgpYxg6+mP8KW5cbdeWEezZNcHqOq+9IB
        0C73AlN4M9UafNAQ==
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thorsten Scherer <t.scherer@eckelmann.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        "open list\:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpio: siox: indicate exclusive support of threaded IRQs
In-Reply-To: <CACRpkdaOysS1-Y=3ghQ+1qbMTR8yi3bHg=_+gUOPo_EcmGmJiw@mail.gmail.com>
References: <20200804091603.541-1-a.fatoum@pengutronix.de> <20200805061753.5o63zu4ionhgjab4@pengutronix.de> <871rkkhy7v.fsf@nanos.tec.linutronix.de> <CACRpkdaOysS1-Y=3ghQ+1qbMTR8yi3bHg=_+gUOPo_EcmGmJiw@mail.gmail.com>
Date:   Thu, 06 Aug 2020 20:50:45 +0200
Message-ID: <87r1sjham2.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus Walleij <linus.walleij@linaro.org> writes:
> On Thu, Aug 6, 2020 at 12:20 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
>> So the solution for this driver is either to make the dispatch handler
>> threaded or use the hard interrupt variant of dispatching the
>> demultiplexed GPIO interrupts.
>
> The struct gpio_irq_chip .threaded bool that the patch
> sets just instructs the gpio core to issue
> irq_set_nested_thread(irq, 1) on the child IRQ.
>
> This is a driver of type "struct siox_driver" handling the
> IRQ through the special .get_data callback supplied in the
> driver struct and it calls handle_nested_irq(irq) so with
> this fix it percolated up to the parent as intended.
>
> So far so good. So I think the patch should be applied.
>
> But what is behind this .get_data() callback for siox drivers?
>
> The siox driver framework in drivers/siox dispatches calls
> to .get_data() from a polling thread which is just some ordinary
> kthread. It looks like this because the SIOX (I think) needs
> to do polled I/O. (drivers/siox/siox-core.c)
>
> So this is a thread but it is not an irq thread from the irq core,
> however it is treated like such by the driver, and in a way what
> happens is events, just polled by a thread.

As Uwe just explained.

> So when we call handle_nested_irq() ... we are not really
> calling that from an irq handler.
>
> I don't know if the IRQ core even sees a difference between which
> thread it gets interfaced with. I suppose it does? :/

handle_nested_irq() does not care. It cares about thread context,
external reentrancy protection for the same nested interrupt and that
the nested interrupt has a thread handler.

The latter is what goes belly up because w/o that threaded bit set the
GPIO core fails to set nested thread. So if a consumer requests an
interrupt with request_any_context_irq() then that fails to select
thread mode which means the threaded handler is not set causing
handle_nested_irq() to fail.

The polling kthread is a slight but clever abomination, but it just
works because it provides thread context and cannot run concurrently.

So Ahmad's patch is correct, just the changelog needs polishing.

Thanks,

        tglx
