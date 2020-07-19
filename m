Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C60E22543D
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Jul 2020 23:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbgGSVI4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Jul 2020 17:08:56 -0400
Received: from mail-40134.protonmail.ch ([185.70.40.134]:50766 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbgGSVI4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Jul 2020 17:08:56 -0400
Date:   Sun, 19 Jul 2020 21:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1595192934;
        bh=Fyu9jfhyPImp95But6mfnw73wgZWzedEWfpy1QW8K3U=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=vLKFl0rVdswNN+vjtUns30q6hDW57k+MlPQOvMSqCjOqDuH71zfwx3Syqs9wIlERh
         jPqxMRKLjf32tJF0P8XBCOJkaYZJFF6sYRENwzp3k8ACyIAAs0rDKB46L/xcFXF4gE
         dkP9Vh736vHo2jjDSv39J2l+4V+NVcdFSxHElut8=
To:     linux.walleij@linaro.org
From:   Colton Lewis <colton.w.lewis@protonmail.com>
Cc:     linux-gpio@vger.kernel.org,
        Colton Lewis <colton.w.lewis@protonmail.com>
Reply-To: Colton Lewis <colton.w.lewis@protonmail.com>
Subject: [PATCH] gpio: Correct kernel-doc inconsistency
Message-ID: <20200719210826.152223-1-colton.w.lewis@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Silence documentation build warnings by correcting kernel-doc comment
for gpiochip_add_data function.

./include/linux/gpio/driver.h:512: warning: Function parameter or member 'g=
c' not described in 'gpiochip_add_data'
./include/linux/gpio/driver.h:512: warning: Excess function parameter 'chip=
' description in 'gpiochip_add_data'

Signed-off-by: Colton Lewis <colton.w.lewis@protonmail.com>
---
 include/linux/gpio/driver.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index c4f272af7af5..ee5f86f67ef8 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -481,25 +481,25 @@ extern int gpiochip_add_data_with_key(struct gpio_chi=
p *gc, void *data,
=20
 /**
  * gpiochip_add_data() - register a gpio_chip
- * @chip: the chip to register, with chip->base initialized
+ * @gc: the chip to register, with gc->base initialized
  * @data: driver-private data associated with this chip
  *
  * Context: potentially before irqs will work
  *
  * When gpiochip_add_data() is called very early during boot, so that GPIO=
s
- * can be freely used, the chip->parent device must be registered before
+ * can be freely used, the gc->parent device must be registered before
  * the gpio framework's arch_initcall().  Otherwise sysfs initialization
  * for GPIOs will fail rudely.
  *
  * gpiochip_add_data() must only be called after gpiolib initialization,
  * ie after core_initcall().
  *
- * If chip->base is negative, this requests dynamic assignment of
+ * If gc->base is negative, this requests dynamic assignment of
  * a range of valid GPIOs.
  *
  * Returns:
  * A negative errno if the chip can't be registered, such as because the
- * chip->base is invalid or already associated with a different chip.
+ * gc->base is invalid or already associated with a different chip.
  * Otherwise it returns zero as a success code.
  */
 #ifdef CONFIG_LOCKDEP
--=20
2.26.2


