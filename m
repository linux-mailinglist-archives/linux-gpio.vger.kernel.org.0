Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3711A159140
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2020 14:59:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729362AbgBKN7s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Feb 2020 08:59:48 -0500
Received: from antares.kleine-koenig.org ([94.130.110.236]:45946 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729031AbgBKN7s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Feb 2020 08:59:48 -0500
X-Greylist: delayed 500 seconds by postgrey-1.27 at vger.kernel.org; Tue, 11 Feb 2020 08:59:47 EST
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id 9A890905F35; Tue, 11 Feb 2020 14:51:25 +0100 (CET)
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Thorsten Scherer <t.scherer@eckelmann.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        kernel-janitors@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: siox: use raw spinlock for irq related locking
Date:   Tue, 11 Feb 2020 14:51:21 +0100
Message-Id: <20200211135121.15752-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <87d0al4600.fsf@nanos.tec.linutronix.de>
References: <87d0al4600.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

All the irq related callbacks are called with the (raw) spinlock
desc->lock being held. So the lock here must be raw as well. Also irqs
were already disabled by the caller for the irq chip callbacks, so the
non-irq variants of spin_lock must be used there.

Fixes: be8c8facc707 ("gpio: new driver to work with a 8x12 siox")
Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
Hello,

On Tue, Feb 11, 2020 at 02:18:23PM +0100, Thomas Gleixner wrote:
> Uwe Kleine-König <u.kleine-koenig@pengutronix.de> writes:
> > On Tue, Feb 11, 2020 at 09:59:30AM +0100, Thomas Gleixner wrote:
> >> Uwe Kleine-König <u.kleine-koenig@pengutronix.de> writes:
> >> Indeed. Looking at the driver, all of the spin_lock_irq() usage in the
> >> irqchip callbacks is broken.
> >> 
> >> So this needs two changes:
> >> 
> >>    1) Convert to raw spin lock, as this won't work on RT otherwise
> >> 
> >>    2) s/lock_irq/lock/ for all irqchip callbacks.
> >
> > Are you sure about the calls in gpio_siox_get_data()? This is only
> > called by siox_poll() which doesn't disable irqs.
> 
> I explicitely said: "for all irqchip callbacks".
> 
> gpio_siox_get_data() is not a irq chip callback, right? So obviously it
> has to stay there.

Ah, I read "irqchip callbacks" as "spinlock calls". Thanks to restate
this for me.

Thanks
Uwe

 drivers/gpio/gpio-siox.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
index 311f66757b92..26e1fe092304 100644
--- a/drivers/gpio/gpio-siox.c
+++ b/drivers/gpio/gpio-siox.c
@@ -15,7 +15,7 @@ struct gpio_siox_ddata {
 	u8 setdata[1];
 	u8 getdata[3];
 
-	spinlock_t irqlock;
+	raw_spinlock_t irqlock;
 	u32 irq_enable;
 	u32 irq_status;
 	u32 irq_type[20];
@@ -44,7 +44,7 @@ static int gpio_siox_get_data(struct siox_device *sdevice, const u8 buf[])
 
 	mutex_lock(&ddata->lock);
 
-	spin_lock_irq(&ddata->irqlock);
+	raw_spin_lock_irq(&ddata->irqlock);
 
 	for (offset = 0; offset < 12; ++offset) {
 		unsigned int bitpos = 11 - offset;
@@ -66,7 +66,7 @@ static int gpio_siox_get_data(struct siox_device *sdevice, const u8 buf[])
 
 	trigger = ddata->irq_status & ddata->irq_enable;
 
-	spin_unlock_irq(&ddata->irqlock);
+	raw_spin_unlock_irq(&ddata->irqlock);
 
 	ddata->getdata[0] = buf[0];
 	ddata->getdata[1] = buf[1];
@@ -84,9 +84,9 @@ static int gpio_siox_get_data(struct siox_device *sdevice, const u8 buf[])
 			 * handler of the irq chip. But it doesn't, so we have
 			 * to clean the irq_status here.
 			 */
-			spin_lock_irq(&ddata->irqlock);
+			raw_spin_lock_irq(&ddata->irqlock);
 			ddata->irq_status &= ~(1 << offset);
-			spin_unlock_irq(&ddata->irqlock);
+			raw_spin_unlock_irq(&ddata->irqlock);
 
 			handle_nested_irq(irq);
 		}
@@ -101,9 +101,9 @@ static void gpio_siox_irq_ack(struct irq_data *d)
 	struct gpio_siox_ddata *ddata =
 		container_of(ic, struct gpio_siox_ddata, ichip);
 
-	spin_lock_irq(&ddata->irqlock);
+	raw_spin_lock(&ddata->irqlock);
 	ddata->irq_status &= ~(1 << d->hwirq);
-	spin_unlock_irq(&ddata->irqlock);
+	raw_spin_unlock(&ddata->irqlock);
 }
 
 static void gpio_siox_irq_mask(struct irq_data *d)
@@ -112,9 +112,9 @@ static void gpio_siox_irq_mask(struct irq_data *d)
 	struct gpio_siox_ddata *ddata =
 		container_of(ic, struct gpio_siox_ddata, ichip);
 
-	spin_lock_irq(&ddata->irqlock);
+	raw_spin_lock(&ddata->irqlock);
 	ddata->irq_enable &= ~(1 << d->hwirq);
-	spin_unlock_irq(&ddata->irqlock);
+	raw_spin_unlock(&ddata->irqlock);
 }
 
 static void gpio_siox_irq_unmask(struct irq_data *d)
@@ -123,9 +123,9 @@ static void gpio_siox_irq_unmask(struct irq_data *d)
 	struct gpio_siox_ddata *ddata =
 		container_of(ic, struct gpio_siox_ddata, ichip);
 
-	spin_lock_irq(&ddata->irqlock);
+	raw_spin_lock(&ddata->irqlock);
 	ddata->irq_enable |= 1 << d->hwirq;
-	spin_unlock_irq(&ddata->irqlock);
+	raw_spin_unlock(&ddata->irqlock);
 }
 
 static int gpio_siox_irq_set_type(struct irq_data *d, u32 type)
@@ -134,9 +134,9 @@ static int gpio_siox_irq_set_type(struct irq_data *d, u32 type)
 	struct gpio_siox_ddata *ddata =
 		container_of(ic, struct gpio_siox_ddata, ichip);
 
-	spin_lock_irq(&ddata->irqlock);
+	raw_spin_lock(&ddata->irqlock);
 	ddata->irq_type[d->hwirq] = type;
-	spin_unlock_irq(&ddata->irqlock);
+	raw_spin_unlock(&ddata->irqlock);
 
 	return 0;
 }
@@ -222,7 +222,7 @@ static int gpio_siox_probe(struct siox_device *sdevice)
 	dev_set_drvdata(dev, ddata);
 
 	mutex_init(&ddata->lock);
-	spin_lock_init(&ddata->irqlock);
+	raw_spin_lock_init(&ddata->irqlock);
 
 	ddata->gchip.base = -1;
 	ddata->gchip.can_sleep = 1;
-- 
2.24.0

