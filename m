Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 202954F4467
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Apr 2022 00:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240964AbiDEUTN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Apr 2022 16:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1447085AbiDEPpp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Apr 2022 11:45:45 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1178D7E583;
        Tue,  5 Apr 2022 07:20:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 73F9BB81E3D;
        Tue,  5 Apr 2022 14:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FB7C385A0;
        Tue,  5 Apr 2022 14:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649168402;
        bh=dc45WnQh0XkwaqeGUyTJ67z7YNeqRTjfgC0FPHFrHso=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MRGWno1cU58iqjN429BjD9E+uM/lLD15OlF3SPmpxxGquaHaRzXhXdVaLcBgbYxsr
         tOCdfTjIE8Gu1mQTkzqPOsrypjTcrejI5FvWccefvcMdogpeFtHWcemsr2WWtn6k+c
         x4NUDhx9iHux5PPQHirACc1I/JcuGdzFl9eLmUjEsPWGR1Wn1U1Xk9chXGVTbFn+zz
         i8BJjosrU02/ABpipgWUuu8XzdH6aECeHZ5HPOHfYUHx3zSAYbDV9PDSFwjJsUrejA
         bSrJTcVryg+ajrcxt3jhc9JVtpmSYF3uSzuYKx2y9JG/kAFWh99t88nq0Uw6/5Izmn
         dRJqjM+0XhdnQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1nbjeA-001q4g-AF; Tue, 05 Apr 2022 14:55:02 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Joey Gouly <joey.gouly@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel-team@android.com
Subject: [PATCH v2 10/10] Documentation: Update the recommended pattern for GPIO irqchips
Date:   Tue,  5 Apr 2022 14:54:44 +0100
Message-Id: <20220405135444.199295-11-maz@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220405135444.199295-1-maz@kernel.org>
References: <20220405135444.199295-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, thierry.reding@gmail.com, joey.gouly@arm.com, jonathanh@nvidia.com, marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io, bjorn.andersson@linaro.org, agross@kernel.org, jeffrey.l.hugo@gmail.com, tglx@linutronix.de, Basavaraj.Natikar@amd.com, Shyam-sundar.S-k@amd.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update the documentation to get rid of the per-gpio_irq_chip
irq_chip structure, and give examples of the new pattern.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 Documentation/driver-api/gpio/driver.rst | 175 ++++++++++++++++++-----
 1 file changed, 142 insertions(+), 33 deletions(-)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
index bbc53920d4dd..7e9f1167ea7d 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -417,30 +417,66 @@ struct gpio_irq_chip inside struct gpio_chip before adding the gpio_chip.
 If you do this, the additional irq_chip will be set up by gpiolib at the
 same time as setting up the rest of the GPIO functionality. The following
 is a typical example of a chained cascaded interrupt handler using
-the gpio_irq_chip:
+the gpio_irq_chip. Note how the mask/unmask (or disable/enable) functions
+call into the core gpiolib code:
 
 .. code-block:: c
 
-  /* Typical state container with dynamic irqchip */
+  /* Typical state container */
   struct my_gpio {
       struct gpio_chip gc;
-      struct irq_chip irq;
+  };
+
+  static void my_gpio_mask_irq(struct irq_data *d)
+  {
+      struct gpio_chip *gc = irq_desc_get_handler_data(d);
+
+      /*
+       * Perform any necessary action to mask the interrupt,
+       * and then call into the core code to synchronise the
+       * state.
+       */
+
+      gpiochip_disable_irq(gc, d->hwirq);
+  }
+
+  static void my_gpio_unmask_irq(struct irq_data *d)
+  {
+      struct gpio_chip *gc = irq_desc_get_handler_data(d);
+
+      gpiochip_disable_irq(gc, d->hwirq);
+
+      /*
+       * Perform any necessary action to unmask the interrupt,
+       * after having called into the core code to synchronise
+       * the state.
+       */
+  }
+
+  /*
+   * Statically populate the irqchip. Note that it is made const
+   * (further indicated by the IRQCHIP_IMMUTABLE flag), and that
+   * the GPIOCHIP_IRQ_RESOURCE_HELPER macro adds some extra
+   * callbacks to the structure.
+   */
+  static const struct irq_chip my_gpio_irq_chip = {
+      .name		= "my_gpio_irq",
+      .irq_ack		= my_gpio_ack_irq,
+      .irq_mask		= my_gpio_mask_irq,
+      .irq_unmask	= my_gpio_unmask_irq,
+      .irq_set_type	= my_gpio_set_irq_type,
+      .flags		= IRQCHIP_IMMUTABLE,
+      /* Provide the gpio resource callbacks */
+      GPIOCHIP_IRQ_RESOURCE_HELPERS,
   };
 
   int irq; /* from platform etc */
   struct my_gpio *g;
   struct gpio_irq_chip *girq;
 
-  /* Set up the irqchip dynamically */
-  g->irq.name = "my_gpio_irq";
-  g->irq.irq_ack = my_gpio_ack_irq;
-  g->irq.irq_mask = my_gpio_mask_irq;
-  g->irq.irq_unmask = my_gpio_unmask_irq;
-  g->irq.irq_set_type = my_gpio_set_irq_type;
-
   /* Get a pointer to the gpio_irq_chip */
   girq = &g->gc.irq;
-  girq->chip = &g->irq;
+  gpio_irq_chip_set_chip(girq, &my_gpio_irq_chip);
   girq->parent_handler = ftgpio_gpio_irq_handler;
   girq->num_parents = 1;
   girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
@@ -458,23 +494,58 @@ the interrupt separately and go with it:
 
 .. code-block:: c
 
-  /* Typical state container with dynamic irqchip */
+  /* Typical state container */
   struct my_gpio {
       struct gpio_chip gc;
-      struct irq_chip irq;
+  };
+
+  static void my_gpio_mask_irq(struct irq_data *d)
+  {
+      struct gpio_chip *gc = irq_desc_get_handler_data(d);
+
+      /*
+       * Perform any necessary action to mask the interrupt,
+       * and then call into the core code to synchronise the
+       * state.
+       */
+
+      gpiochip_disable_irq(gc, d->hwirq);
+  }
+
+  static void my_gpio_unmask_irq(struct irq_data *d)
+  {
+      struct gpio_chip *gc = irq_desc_get_handler_data(d);
+
+      gpiochip_disable_irq(gc, d->hwirq);
+
+      /*
+       * Perform any necessary action to unmask the interrupt,
+       * after having called into the core code to synchronise
+       * the state.
+       */
+  }
+
+  /*
+   * Statically populate the irqchip. Note that it is made const
+   * (further indicated by the IRQCHIP_IMMUTABLE flag), and that
+   * the GPIOCHIP_IRQ_RESOURCE_HELPER macro adds some extra
+   * callbacks to the structure.
+   */
+  static const struct irq_chip my_gpio_irq_chip = {
+      .name		= "my_gpio_irq",
+      .irq_ack		= my_gpio_ack_irq,
+      .irq_mask		= my_gpio_mask_irq,
+      .irq_unmask	= my_gpio_unmask_irq,
+      .irq_set_type	= my_gpio_set_irq_type,
+      .flags		= IRQCHIP_IMMUTABLE,
+      /* Provide the gpio resource callbacks */
+      GPIOCHIP_IRQ_RESOURCE_HELPERS,
   };
 
   int irq; /* from platform etc */
   struct my_gpio *g;
   struct gpio_irq_chip *girq;
 
-  /* Set up the irqchip dynamically */
-  g->irq.name = "my_gpio_irq";
-  g->irq.irq_ack = my_gpio_ack_irq;
-  g->irq.irq_mask = my_gpio_mask_irq;
-  g->irq.irq_unmask = my_gpio_unmask_irq;
-  g->irq.irq_set_type = my_gpio_set_irq_type;
-
   ret = devm_request_threaded_irq(dev, irq, NULL,
 		irq_thread_fn, IRQF_ONESHOT, "my-chip", g);
   if (ret < 0)
@@ -482,7 +553,7 @@ the interrupt separately and go with it:
 
   /* Get a pointer to the gpio_irq_chip */
   girq = &g->gc.irq;
-  girq->chip = &g->irq;
+  gpio_irq_chip_set_chip(girq, &my_gpio_irq_chip);
   /* This will let us handle the parent IRQ in the driver */
   girq->parent_handler = NULL;
   girq->num_parents = 0;
@@ -500,24 +571,61 @@ In this case the typical set-up will look like this:
   /* Typical state container with dynamic irqchip */
   struct my_gpio {
       struct gpio_chip gc;
-      struct irq_chip irq;
       struct fwnode_handle *fwnode;
   };
 
-  int irq; /* from platform etc */
+  static void my_gpio_mask_irq(struct irq_data *d)
+  {
+      struct gpio_chip *gc = irq_desc_get_handler_data(d);
+
+      /*
+       * Perform any necessary action to mask the interrupt,
+       * and then call into the core code to synchronise the
+       * state.
+       */
+
+      gpiochip_disable_irq(gc, d->hwirq);
+      irq_mask_mask_parent(d);
+  }
+
+  static void my_gpio_unmask_irq(struct irq_data *d)
+  {
+      struct gpio_chip *gc = irq_desc_get_handler_data(d);
+
+      gpiochip_disable_irq(gc, d->hwirq);
+
+      /*
+       * Perform any necessary action to unmask the interrupt,
+       * after having called into the core code to synchronise
+       * the state.
+       */
+
+      irq_mask_unmask_parent(d);
+  }
+
+  /*
+   * Statically populate the irqchip. Note that it is made const
+   * (further indicated by the IRQCHIP_IMMUTABLE flag), and that
+   * the GPIOCHIP_IRQ_RESOURCE_HELPER macro adds some extra
+   * callbacks to the structure.
+   */
+  static const struct irq_chip my_gpio_irq_chip = {
+      .name		= "my_gpio_irq",
+      .irq_ack		= my_gpio_ack_irq,
+      .irq_mask		= my_gpio_mask_irq,
+      .irq_unmask	= my_gpio_unmask_irq,
+      .irq_set_type	= my_gpio_set_irq_type,
+      .flags		= IRQCHIP_IMMUTABLE,
+      /* Provide the gpio resource callbacks */
+      GPIOCHIP_IRQ_RESOURCE_HELPERS,
+  };
+
   struct my_gpio *g;
   struct gpio_irq_chip *girq;
 
-  /* Set up the irqchip dynamically */
-  g->irq.name = "my_gpio_irq";
-  g->irq.irq_ack = my_gpio_ack_irq;
-  g->irq.irq_mask = my_gpio_mask_irq;
-  g->irq.irq_unmask = my_gpio_unmask_irq;
-  g->irq.irq_set_type = my_gpio_set_irq_type;
-
   /* Get a pointer to the gpio_irq_chip */
   girq = &g->gc.irq;
-  girq->chip = &g->irq;
+  gpio_irq_chip_set_chip(girq, &my_gpio_irq_chip);
   girq->default_type = IRQ_TYPE_NONE;
   girq->handler = handle_bad_irq;
   girq->fwnode = g->fwnode;
@@ -605,8 +713,9 @@ When implementing an irqchip inside a GPIO driver, these two functions should
 typically be called in the .irq_disable() and .irq_enable() callbacks from the
 irqchip.
 
-When using the gpiolib irqchip helpers, these callbacks are automatically
-assigned.
+When IRQCHIP_IMMUTABLE is not advertised by the irqchip, these callbacks
+are automatically assigned. This behaviour is deprecated and on its way
+to be removed from the kernel.
 
 
 Real-Time compliance for GPIO IRQ chips
-- 
2.34.1

