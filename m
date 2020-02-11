Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22660158B8F
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2020 09:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbgBKI7n convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Tue, 11 Feb 2020 03:59:43 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:45450 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727608AbgBKI7n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Feb 2020 03:59:43 -0500
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34] helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1j1ROE-0003ad-W2; Tue, 11 Feb 2020 09:59:31 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id 5DF2C101115; Tue, 11 Feb 2020 09:59:30 +0100 (CET)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Thorsten Scherer <t.scherer@eckelmann.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] gpio: siox: potentially enabling IRQs too early
In-Reply-To: <20200211080138.6bm5toge74wjncxw@pengutronix.de>
References: <20200211073511.r24n3bygyjxrsuez@kili.mountain> <20200211080138.6bm5toge74wjncxw@pengutronix.de>
Date:   Tue, 11 Feb 2020 09:59:30 +0100
Message-ID: <87r1z14hzh.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Uwe Kleine-König <u.kleine-koenig@pengutronix.de> writes:
> On Tue, Feb 11, 2020 at 10:35:44AM +0300, Dan Carpenter wrote:
>> Smatch thinks that gpio_siox_irq_set_type() can be called from
>> probe_irq_on().  In that case the call to spin_unlock_irq() would
>> renable IRQs too early.
>> 
>> Fixes: be8c8facc707 ("gpio: new driver to work with a 8x12 siox")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>>  drivers/gpio/gpio-siox.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
>> index 311f66757b92..578b71760939 100644
>> --- a/drivers/gpio/gpio-siox.c
>> +++ b/drivers/gpio/gpio-siox.c
>> @@ -133,10 +133,11 @@ static int gpio_siox_irq_set_type(struct irq_data *d, u32 type)
>>  	struct irq_chip *ic = irq_data_get_irq_chip(d);
>>  	struct gpio_siox_ddata *ddata =
>>  		container_of(ic, struct gpio_siox_ddata, ichip);
>> +	unsigned long flags;
>>  
>> -	spin_lock_irq(&ddata->irqlock);
>> +	spin_lock_irqsave(&ddata->irqlock, flags);
>>  	ddata->irq_type[d->hwirq] = type;
>> -	spin_unlock_irq(&ddata->irqlock);
>> +	spin_unlock_irqrestore(&ddata->irqlock, flags);
>
> "Normally" the .irq_set_type() callback is called from irq_set_irq_type.
> There desc->lock is taken with raw_spin_lock_irqsave (as part of
> irq_get_desc_buslock()), so I assume irqs are always disabled when the
> type changes? tglx?
>
> If so, the better fix would be to change to spin_lock/spin_unlock
> instead. Also given that a raw spinlock is taken, the irqlock here
> should be changed to a raw one, too?

Indeed. Looking at the driver, all of the spin_lock_irq() usage in the
irqchip callbacks is broken.

So this needs two changes:

   1) Convert to raw spin lock, as this won't work on RT otherwise

   2) s/lock_irq/lock/ for all irqchip callbacks.

Thanks,

        tglx


