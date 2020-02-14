Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62D0E15D64D
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2020 12:10:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729020AbgBNLK3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Feb 2020 06:10:29 -0500
Received: from mx-relay53-hz1.antispameurope.com ([94.100.132.227]:48048 "EHLO
        mx-relay53-hz1.antispameurope.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728522AbgBNLK3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 14 Feb 2020 06:10:29 -0500
X-Greylist: delayed 460 seconds by postgrey-1.27 at vger.kernel.org; Fri, 14 Feb 2020 06:10:28 EST
Received: from smtp.eckelmann.de ([217.19.183.80]) by mx-relay53-hz1.antispameurope.com;
 Fri, 14 Feb 2020 12:02:45 +0100
Received: from ws067.eckelmann.group (2a00:1f08:4007:5c00:1a60:24ff:fe97:84c9)
 by EX-SRV2.eckelmann.group (2a00:1f08:4007:e035:172:18:35:5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Fri, 14 Feb 2020 12:02:39 +0100
Date:   Fri, 14 Feb 2020 12:02:38 +0100
From:   Thorsten Scherer <thorsten.scherer@eckelmann.de>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        <kernel-janitors@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] gpio: siox: use raw spinlock for irq related locking
Message-ID: <20200214110238.zkbfyzfjvkzipgjr@ws067.eckelmann.group>
References: <87d0al4600.fsf@nanos.tec.linutronix.de>
 <20200211135121.15752-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200211135121.15752-1-uwe@kleine-koenig.org>
X-Originating-IP: [2a00:1f08:4007:5c00:1a60:24ff:fe97:84c9]
X-ClientProxiedBy: EX-SRV1.eckelmann.group (2a00:1f08:4007:e035:172:18:35:4)
 To EX-SRV2.eckelmann.group (2a00:1f08:4007:e035:172:18:35:5)
X-cloud-security-sender: t.scherer@eckelmann.de
X-cloud-security-recipient: linux-gpio@vger.kernel.org
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay53-hz1.antispameurope.com with 7B5302600C9
X-cloud-security-connect: smtp.eckelmann.de[217.19.183.80], TLS=1, IP=217.19.183.80
X-cloud-security: scantime:.9918
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

AFAICT this is all good.

Unfortunately i don't have any idea on how to test out the difference
this patch makes on a real SIOX.

Any hints? Is it necessary at all?

Thank you.

Kind regards
Thorsten

Acked-by: Thorsten Scherer <t.scherer@eckelmann.de>

On Tue, Feb 11, 2020 at 02:51:21PM +0100, Uwe Kleine-König wrote:
> All the irq related callbacks are called with the (raw) spinlock
> desc->lock being held. So the lock here must be raw as well. Also irqs
> were already disabled by the caller for the irq chip callbacks, so the
> non-irq variants of spin_lock must be used there.
> 
> Fixes: be8c8facc707 ("gpio: new driver to work with a 8x12 siox")
> Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
> ---
> > 
> > I explicitely said: "for all irqchip callbacks".
> > 
> > gpio_siox_get_data() is not a irq chip callback, right? So obviously it
> > has to stay there.
> 
> Ah, I read "irqchip callbacks" as "spinlock calls". Thanks to restate
> this for me.
> 
> Thanks
> Uwe
> 
>  drivers/gpio/gpio-siox.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
> index 311f66757b92..26e1fe092304 100644
> --- a/drivers/gpio/gpio-siox.c
> +++ b/drivers/gpio/gpio-siox.c
> @@ -15,7 +15,7 @@ struct gpio_siox_ddata {
>  	u8 setdata[1];
>  	u8 getdata[3];
>  
> -	spinlock_t irqlock;
> +	raw_spinlock_t irqlock;
>  	u32 irq_enable;
>  	u32 irq_status;
>  	u32 irq_type[20];
> @@ -44,7 +44,7 @@ static int gpio_siox_get_data(struct siox_device *sdevice, const u8 buf[])
>  
>  	mutex_lock(&ddata->lock);
>  
> -	spin_lock_irq(&ddata->irqlock);
> +	raw_spin_lock_irq(&ddata->irqlock);
>  
>  	for (offset = 0; offset < 12; ++offset) {
>  		unsigned int bitpos = 11 - offset;
> @@ -66,7 +66,7 @@ static int gpio_siox_get_data(struct siox_device *sdevice, const u8 buf[])
>  
>  	trigger = ddata->irq_status & ddata->irq_enable;
>  
> -	spin_unlock_irq(&ddata->irqlock);
> +	raw_spin_unlock_irq(&ddata->irqlock);
>  
>  	ddata->getdata[0] = buf[0];
>  	ddata->getdata[1] = buf[1];
> @@ -84,9 +84,9 @@ static int gpio_siox_get_data(struct siox_device *sdevice, const u8 buf[])
>  			 * handler of the irq chip. But it doesn't, so we have
>  			 * to clean the irq_status here.
>  			 */
> -			spin_lock_irq(&ddata->irqlock);
> +			raw_spin_lock_irq(&ddata->irqlock);
>  			ddata->irq_status &= ~(1 << offset);
> -			spin_unlock_irq(&ddata->irqlock);
> +			raw_spin_unlock_irq(&ddata->irqlock);
>  
>  			handle_nested_irq(irq);
>  		}
> @@ -101,9 +101,9 @@ static void gpio_siox_irq_ack(struct irq_data *d)
>  	struct gpio_siox_ddata *ddata =
>  		container_of(ic, struct gpio_siox_ddata, ichip);
>  
> -	spin_lock_irq(&ddata->irqlock);
> +	raw_spin_lock(&ddata->irqlock);
>  	ddata->irq_status &= ~(1 << d->hwirq);
> -	spin_unlock_irq(&ddata->irqlock);
> +	raw_spin_unlock(&ddata->irqlock);
>  }
>  
>  static void gpio_siox_irq_mask(struct irq_data *d)
> @@ -112,9 +112,9 @@ static void gpio_siox_irq_mask(struct irq_data *d)
>  	struct gpio_siox_ddata *ddata =
>  		container_of(ic, struct gpio_siox_ddata, ichip);
>  
> -	spin_lock_irq(&ddata->irqlock);
> +	raw_spin_lock(&ddata->irqlock);
>  	ddata->irq_enable &= ~(1 << d->hwirq);
> -	spin_unlock_irq(&ddata->irqlock);
> +	raw_spin_unlock(&ddata->irqlock);
>  }
>  
>  static void gpio_siox_irq_unmask(struct irq_data *d)
> @@ -123,9 +123,9 @@ static void gpio_siox_irq_unmask(struct irq_data *d)
>  	struct gpio_siox_ddata *ddata =
>  		container_of(ic, struct gpio_siox_ddata, ichip);
>  
> -	spin_lock_irq(&ddata->irqlock);
> +	raw_spin_lock(&ddata->irqlock);
>  	ddata->irq_enable |= 1 << d->hwirq;
> -	spin_unlock_irq(&ddata->irqlock);
> +	raw_spin_unlock(&ddata->irqlock);
>  }
>  
>  static int gpio_siox_irq_set_type(struct irq_data *d, u32 type)
> @@ -134,9 +134,9 @@ static int gpio_siox_irq_set_type(struct irq_data *d, u32 type)
>  	struct gpio_siox_ddata *ddata =
>  		container_of(ic, struct gpio_siox_ddata, ichip);
>  
> -	spin_lock_irq(&ddata->irqlock);
> +	raw_spin_lock(&ddata->irqlock);
>  	ddata->irq_type[d->hwirq] = type;
> -	spin_unlock_irq(&ddata->irqlock);
> +	raw_spin_unlock(&ddata->irqlock);
>  
>  	return 0;
>  }
> @@ -222,7 +222,7 @@ static int gpio_siox_probe(struct siox_device *sdevice)
>  	dev_set_drvdata(dev, ddata);
>  
>  	mutex_init(&ddata->lock);
> -	spin_lock_init(&ddata->irqlock);
> +	raw_spin_lock_init(&ddata->irqlock);
>  
>  	ddata->gchip.base = -1;
>  	ddata->gchip.can_sleep = 1;
> -- 
> 2.24.0
> 

--
Thorsten Scherer | Eckelmann AG | www.eckelmann.de |
