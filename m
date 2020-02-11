Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC7C9158AFB
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2020 09:01:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727800AbgBKIBy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Feb 2020 03:01:54 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58981 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727613AbgBKIBy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Feb 2020 03:01:54 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1j1QUH-0000wy-0p; Tue, 11 Feb 2020 09:01:41 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1j1QUE-0006ew-Oc; Tue, 11 Feb 2020 09:01:38 +0100
Date:   Tue, 11 Feb 2020 09:01:38 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Thorsten Scherer <t.scherer@eckelmann.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] gpio: siox: potentially enabling IRQs too early
Message-ID: <20200211080138.6bm5toge74wjncxw@pengutronix.de>
References: <20200211073511.r24n3bygyjxrsuez@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200211073511.r24n3bygyjxrsuez@kili.mountain>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

[Dropped Gavin Schenk from recipients as he left Eckelmann. Added tglx.]

Hello,

On Tue, Feb 11, 2020 at 10:35:44AM +0300, Dan Carpenter wrote:
> Smatch thinks that gpio_siox_irq_set_type() can be called from
> probe_irq_on().  In that case the call to spin_unlock_irq() would
> renable IRQs too early.
> 
> Fixes: be8c8facc707 ("gpio: new driver to work with a 8x12 siox")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpio/gpio-siox.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
> index 311f66757b92..578b71760939 100644
> --- a/drivers/gpio/gpio-siox.c
> +++ b/drivers/gpio/gpio-siox.c
> @@ -133,10 +133,11 @@ static int gpio_siox_irq_set_type(struct irq_data *d, u32 type)
>  	struct irq_chip *ic = irq_data_get_irq_chip(d);
>  	struct gpio_siox_ddata *ddata =
>  		container_of(ic, struct gpio_siox_ddata, ichip);
> +	unsigned long flags;
>  
> -	spin_lock_irq(&ddata->irqlock);
> +	spin_lock_irqsave(&ddata->irqlock, flags);
>  	ddata->irq_type[d->hwirq] = type;
> -	spin_unlock_irq(&ddata->irqlock);
> +	spin_unlock_irqrestore(&ddata->irqlock, flags);

"Normally" the .irq_set_type() callback is called from irq_set_irq_type.
There desc->lock is taken with raw_spin_lock_irqsave (as part of
irq_get_desc_buslock()), so I assume irqs are always disabled when the
type changes? tglx?

If so, the better fix would be to change to spin_lock/spin_unlock
instead. Also given that a raw spinlock is taken, the irqlock here
should be changed to a raw one, too?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
