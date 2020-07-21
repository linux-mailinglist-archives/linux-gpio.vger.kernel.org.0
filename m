Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03E87228146
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 15:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgGUNsD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 09:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgGUNsC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 09:48:02 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDE3FC061794
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 06:48:00 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id z24so24110614ljn.8
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 06:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QuUxI4r5Mp0cVJKuifuZE4+r2XkKwlriYuJpesd1+7s=;
        b=q89k/1WzBGEScu6wJLizSoD82Jffei4nIeH1yMuLd+pwY8zpy6lswG7y84jGDawPXq
         bjYqgvUwpmt+5RiKF9StCBEU4ywgRJer5prtG8QU4Zg7NUIxQm9eyd1RqPzS2wa9OqZq
         OfCUeCJDvV36FkRLItaMUp0yYOC9BE2711bXCXk4TziTA/AH/v1W291xgt7GcNvNkedj
         MMjW72JVgT4/U+7gGZ6tKulONQxh+0l+TLxRgRNLcxGbjOI/EIxGMOCumGkIRBWuRm0m
         9NgpcRW3hZ/VEiIYPNbhKEXcP9g7V5sZPHRJYyGeOtEyKbynjqdwQwsbZsgSfNHdqftb
         nyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QuUxI4r5Mp0cVJKuifuZE4+r2XkKwlriYuJpesd1+7s=;
        b=dXnzxUgasAYd6hA4zEWc5z7B8mA8IbuehZ/ghwp3CeVYNeH6Rcwbeu+Ss+phOTpB3H
         xVTGdlcRpnqZ/INynCFuobdtSkY9MzLE/7Yjx4EdAxA3Zxmay+5eDpCyUvItslNSpB2E
         Hc3z+X5jGDhbYMa4SQEwp8/isoBh8CUHWR+UYm+T/++RtpC4jKC/FK/k5XKjpg1YjPNr
         DOc88WFGnpv62A8GFLVFHQB3IGiWQeUiZcNZhdNVTktJJ28iYroURpA9IQJ7TOO4Wz7v
         7sRwugay0B8a+3YHXyVo5XoDiFBO6Hv4WNxZSdAQqFvL+CObWBLS6LZC3KXULVyv6Ywh
         2jHQ==
X-Gm-Message-State: AOAM530r1lmXncQewQGVSb8UU5KMlJ7D8EYoYqwc945BjJNCt4YDavUn
        Cg3QwORCXR+mPcMy3orC/RPLZCx1x3o=
X-Google-Smtp-Source: ABdhPJwefhCEdss/EwuJw2R3TGZMX2M5QPVMCfmExXkwr8Qny0qpMuKzGTNtTwAEcOa28KrpC5Lu8w==
X-Received: by 2002:a2e:780b:: with SMTP id t11mr12173987ljc.271.1595339278863;
        Tue, 21 Jul 2020 06:47:58 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id x24sm4504249ljh.21.2020.07.21.06.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 06:47:58 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] gpio: Retire the explicit gpio irqchip code
Date:   Tue, 21 Jul 2020 15:47:56 +0200
Message-Id: <20200721134756.368357-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Now that all gpiolib irqchip users have been over to use
the irqchip template, we can finally retire the old code
path and leave just one way in to the irqchip: set up the
template when registering the gpio_chip. For a while
we had two code paths for this which was a bit confusing.

This brings this work to a conclusion, there is now one
way to do this.

Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Note: this will only be applied once all the patches converting
misc thereade irqchips over to use this method have been
merged.
---
 Documentation/driver-api/gpio/driver.rst |  63 ++++++----
 drivers/gpio/TODO                        |  49 --------
 drivers/gpio/gpiolib.c                   | 153 -----------------------
 include/linux/gpio/driver.h              |  71 -----------
 4 files changed, 42 insertions(+), 294 deletions(-)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
index 9809f593c0ab..42911a80fcf2 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -416,7 +416,8 @@ The preferred way to set up the helpers is to fill in the
 struct gpio_irq_chip inside struct gpio_chip before adding the gpio_chip.
 If you do this, the additional irq_chip will be set up by gpiolib at the
 same time as setting up the rest of the GPIO functionality. The following
-is a typical example of a cascaded interrupt handler using gpio_irq_chip:
+is a typical example of a chained cascaded interrupt handler using
+the gpio_irq_chip:
 
 .. code-block:: c
 
@@ -452,7 +453,46 @@ is a typical example of a cascaded interrupt handler using gpio_irq_chip:
 
   return devm_gpiochip_add_data(dev, &g->gc, g);
 
-The helper support using hierarchical interrupt controllers as well.
+The helper support using threaded interrupts as well. Then you just request
+the interrupt separately and go with it:
+
+.. code-block:: c
+
+  /* Typical state container with dynamic irqchip */
+  struct my_gpio {
+      struct gpio_chip gc;
+      struct irq_chip irq;
+  };
+
+  int irq; /* from platform etc */
+  struct my_gpio *g;
+  struct gpio_irq_chip *girq;
+
+  /* Set up the irqchip dynamically */
+  g->irq.name = "my_gpio_irq";
+  g->irq.irq_ack = my_gpio_ack_irq;
+  g->irq.irq_mask = my_gpio_mask_irq;
+  g->irq.irq_unmask = my_gpio_unmask_irq;
+  g->irq.irq_set_type = my_gpio_set_irq_type;
+
+  ret = devm_request_threaded_irq(dev, irq, NULL,
+		irq_thread_fn, IRQF_ONESHOT, "my-chip", g);
+  if (ret < 0)
+	return ret;
+
+  /* Get a pointer to the gpio_irq_chip */
+  girq = &g->gc.irq;
+  girq->chip = &g->irq;
+  /* This will let us handle the parent IRQ in the driver */
+  girq->parent_handler = NULL;
+  girq->num_parents = 0;
+  girq->parents = NULL;
+  girq->default_type = IRQ_TYPE_NONE;
+  girq->handler = handle_bad_irq;
+
+  return devm_gpiochip_add_data(dev, &g->gc, g);
+
+The helper supports using hierarchical interrupt controllers as well.
 In this case the typical set-up will look like this:
 
 .. code-block:: c
@@ -493,25 +533,6 @@ the parent hardware irq from a child (i.e. this gpio chip) hardware irq.
 As always it is good to look at examples in the kernel tree for advice
 on how to find the required pieces.
 
-The old way of adding irqchips to gpiochips after registration is also still
-available but we try to move away from this:
-
-- DEPRECATED: gpiochip_irqchip_add(): adds a chained cascaded irqchip to a
-  gpiochip. It will pass the struct gpio_chip* for the chip to all IRQ
-  callbacks, so the callbacks need to embed the gpio_chip in its state
-  container and obtain a pointer to the container using container_of().
-  (See Documentation/driver-api/driver-model/design-patterns.rst)
-
-- gpiochip_irqchip_add_nested(): adds a nested cascaded irqchip to a gpiochip,
-  as discussed above regarding different types of cascaded irqchips. The
-  cascaded irq has to be handled by a threaded interrupt handler.
-  Apart from that it works exactly like the chained irqchip.
-
-- gpiochip_set_nested_irqchip(): sets up a nested cascaded irq handler for a
-  gpio_chip from a parent IRQ. As the parent IRQ has usually been
-  explicitly requested by the driver, this does very little more than
-  mark all the child IRQs as having the other IRQ as parent.
-
 If there is a need to exclude certain GPIO lines from the IRQ domain handled by
 these helpers, we can set .irq.need_valid_mask of the gpiochip before
 devm_gpiochip_add_data() or gpiochip_add_data() is called. This allocates an
diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index e560e45e84f8..cd04e0b60159 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -129,58 +129,9 @@ GPIOLIB irqchip
 The GPIOLIB irqchip is a helper irqchip for "simple cases" that should
 try to cover any generic kind of irqchip cascaded from a GPIO.
 
-- Convert all the GPIOLIB_IRQCHIP users to pass an irqchip template,
-  parent and flags before calling [devm_]gpiochip_add[_data]().
-  Currently we set up the irqchip after setting up the gpiochip
-  using gpiochip_irqchip_add() and gpiochip_set_[chained|nested]_irqchip().
-  This is too complex, so convert all users over to just set up
-  the irqchip before registering the gpio_chip, typical example:
-
-  /* Typical state container with dynamic irqchip */
-  struct my_gpio {
-      struct gpio_chip gc;
-      struct irq_chip irq;
-  };
-
-  int irq; /* from platform etc */
-  struct my_gpio *g;
-  struct gpio_irq_chip *girq;
-
-  /* Set up the irqchip dynamically */
-  g->irq.name = "my_gpio_irq";
-  g->irq.irq_ack = my_gpio_ack_irq;
-  g->irq.irq_mask = my_gpio_mask_irq;
-  g->irq.irq_unmask = my_gpio_unmask_irq;
-  g->irq.irq_set_type = my_gpio_set_irq_type;
-
-  /* Get a pointer to the gpio_irq_chip */
-  girq = &g->gc.irq;
-  girq->chip = &g->irq;
-  girq->parent_handler = ftgpio_gpio_irq_handler;
-  girq->num_parents = 1;
-  girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
-                               GFP_KERNEL);
-  if (!girq->parents)
-      return -ENOMEM;
-  girq->default_type = IRQ_TYPE_NONE;
-  girq->handler = handle_bad_irq;
-  girq->parents[0] = irq;
-
-  When this is done, we will delete the old APIs for instatiating
-  GPIOLIB_IRQCHIP and simplify the code.
-
 - Look over and identify any remaining easily converted drivers and
   dry-code conversions to gpiolib irqchip for maintainers to test
 
-- Drop gpiochip_set_chained_irqchip() when all the chained irqchips
-  have been converted to the above infrastructure.
-
-- Add more infrastructure to make it possible to also pass a threaded
-  irqchip in struct gpio_irq_chip.
-
-- Drop gpiochip_irqchip_add_nested() when all the chained irqchips
-  have been converted to the above infrastructure.
-
 
 Increase integration with pin control
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 80137c1b3cdc..3f63107fd49d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -873,67 +873,6 @@ bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gc,
 }
 EXPORT_SYMBOL_GPL(gpiochip_irqchip_irq_valid);
 
-/**
- * gpiochip_set_cascaded_irqchip() - connects a cascaded irqchip to a gpiochip
- * @gc: the gpiochip to set the irqchip chain to
- * @parent_irq: the irq number corresponding to the parent IRQ for this
- * cascaded irqchip
- * @parent_handler: the parent interrupt handler for the accumulated IRQ
- * coming out of the gpiochip. If the interrupt is nested rather than
- * cascaded, pass NULL in this handler argument
- */
-static void gpiochip_set_cascaded_irqchip(struct gpio_chip *gc,
-					  unsigned int parent_irq,
-					  irq_flow_handler_t parent_handler)
-{
-	struct gpio_irq_chip *girq = &gc->irq;
-	struct device *dev = &gc->gpiodev->dev;
-
-	if (!girq->domain) {
-		chip_err(gc, "called %s before setting up irqchip\n",
-			 __func__);
-		return;
-	}
-
-	if (parent_handler) {
-		if (gc->can_sleep) {
-			chip_err(gc,
-				 "you cannot have chained interrupts on a chip that may sleep\n");
-			return;
-		}
-		girq->parents = devm_kcalloc(dev, 1,
-					     sizeof(*girq->parents),
-					     GFP_KERNEL);
-		if (!girq->parents) {
-			chip_err(gc, "out of memory allocating parent IRQ\n");
-			return;
-		}
-		girq->parents[0] = parent_irq;
-		girq->num_parents = 1;
-		/*
-		 * The parent irqchip is already using the chip_data for this
-		 * irqchip, so our callbacks simply use the handler_data.
-		 */
-		irq_set_chained_handler_and_data(parent_irq, parent_handler,
-						 gc);
-	}
-}
-
-/**
- * gpiochip_set_nested_irqchip() - connects a nested irqchip to a gpiochip
- * @gc: the gpiochip to set the irqchip nested handler to
- * @irqchip: the irqchip to nest to the gpiochip
- * @parent_irq: the irq number corresponding to the parent IRQ for this
- * nested irqchip
- */
-void gpiochip_set_nested_irqchip(struct gpio_chip *gc,
-				 struct irq_chip *irqchip,
-				 unsigned int parent_irq)
-{
-	gpiochip_set_cascaded_irqchip(gc, parent_irq, NULL);
-}
-EXPORT_SYMBOL_GPL(gpiochip_set_nested_irqchip);
-
 #ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
 
 /**
@@ -1584,98 +1523,6 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gc)
 	gpiochip_irqchip_free_valid_mask(gc);
 }
 
-/**
- * gpiochip_irqchip_add_key() - adds an irqchip to a gpiochip
- * @gc: the gpiochip to add the irqchip to
- * @irqchip: the irqchip to add to the gpiochip
- * @first_irq: if not dynamically assigned, the base (first) IRQ to
- * allocate gpiochip irqs from
- * @handler: the irq handler to use (often a predefined irq core function)
- * @type: the default type for IRQs on this irqchip, pass IRQ_TYPE_NONE
- * to have the core avoid setting up any default type in the hardware.
- * @threaded: whether this irqchip uses a nested thread handler
- * @lock_key: lockdep class for IRQ lock
- * @request_key: lockdep class for IRQ request
- *
- * This function closely associates a certain irqchip with a certain
- * gpiochip, providing an irq domain to translate the local IRQs to
- * global irqs in the gpiolib core, and making sure that the gpiochip
- * is passed as chip data to all related functions. Driver callbacks
- * need to use gpiochip_get_data() to get their local state containers back
- * from the gpiochip passed as chip data. An irqdomain will be stored
- * in the gpiochip that shall be used by the driver to handle IRQ number
- * translation. The gpiochip will need to be initialized and registered
- * before calling this function.
- *
- * This function will handle two cell:ed simple IRQs and assumes all
- * the pins on the gpiochip can generate a unique IRQ. Everything else
- * need to be open coded.
- */
-int gpiochip_irqchip_add_key(struct gpio_chip *gc,
-			     struct irq_chip *irqchip,
-			     unsigned int first_irq,
-			     irq_flow_handler_t handler,
-			     unsigned int type,
-			     bool threaded,
-			     struct lock_class_key *lock_key,
-			     struct lock_class_key *request_key)
-{
-	struct device_node *of_node;
-
-	if (!gc || !irqchip)
-		return -EINVAL;
-
-	if (!gc->parent) {
-		chip_err(gc, "missing gpiochip .dev parent pointer\n");
-		return -EINVAL;
-	}
-	gc->irq.threaded = threaded;
-	of_node = gc->parent->of_node;
-#ifdef CONFIG_OF_GPIO
-	/*
-	 * If the gpiochip has an assigned OF node this takes precedence
-	 * FIXME: get rid of this and use gc->parent->of_node
-	 * everywhere
-	 */
-	if (gc->of_node)
-		of_node = gc->of_node;
-#endif
-	/*
-	 * Specifying a default trigger is a terrible idea if DT or ACPI is
-	 * used to configure the interrupts, as you may end-up with
-	 * conflicting triggers. Tell the user, and reset to NONE.
-	 */
-	if (WARN(of_node && type != IRQ_TYPE_NONE,
-		 "%pOF: Ignoring %d default trigger\n", of_node, type))
-		type = IRQ_TYPE_NONE;
-	if (has_acpi_companion(gc->parent) && type != IRQ_TYPE_NONE) {
-		acpi_handle_warn(ACPI_HANDLE(gc->parent),
-				 "Ignoring %d default trigger\n", type);
-		type = IRQ_TYPE_NONE;
-	}
-
-	gc->irq.chip = irqchip;
-	gc->irq.handler = handler;
-	gc->irq.default_type = type;
-	gc->to_irq = gpiochip_to_irq;
-	gc->irq.lock_key = lock_key;
-	gc->irq.request_key = request_key;
-	gc->irq.domain = irq_domain_add_simple(of_node,
-					gc->ngpio, first_irq,
-					&gpiochip_domain_ops, gc);
-	if (!gc->irq.domain) {
-		gc->irq.chip = NULL;
-		return -EINVAL;
-	}
-
-	gpiochip_set_irq_hooks(gc);
-
-	acpi_gpiochip_request_interrupts(gc);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(gpiochip_irqchip_add_key);
-
 /**
  * gpiochip_irqchip_add_domain() - adds an irqdomain to a gpiochip
  * @gc: the gpiochip to add the irqchip to
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index db82451776fc..d3e2a992a931 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -612,83 +612,12 @@ int gpiochip_irq_domain_activate(struct irq_domain *domain,
 void gpiochip_irq_domain_deactivate(struct irq_domain *domain,
 				    struct irq_data *data);
 
-void gpiochip_set_nested_irqchip(struct gpio_chip *gc,
-		struct irq_chip *irqchip,
-		unsigned int parent_irq);
-
-int gpiochip_irqchip_add_key(struct gpio_chip *gc,
-			     struct irq_chip *irqchip,
-			     unsigned int first_irq,
-			     irq_flow_handler_t handler,
-			     unsigned int type,
-			     bool threaded,
-			     struct lock_class_key *lock_key,
-			     struct lock_class_key *request_key);
-
 bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gc,
 				unsigned int offset);
 
 int gpiochip_irqchip_add_domain(struct gpio_chip *gc,
 				struct irq_domain *domain);
 
-#ifdef CONFIG_LOCKDEP
-
-/*
- * Lockdep requires that each irqchip instance be created with a
- * unique key so as to avoid unnecessary warnings. This upfront
- * boilerplate static inlines provides such a key for each
- * unique instance.
- */
-static inline int gpiochip_irqchip_add(struct gpio_chip *gc,
-				       struct irq_chip *irqchip,
-				       unsigned int first_irq,
-				       irq_flow_handler_t handler,
-				       unsigned int type)
-{
-	static struct lock_class_key lock_key;
-	static struct lock_class_key request_key;
-
-	return gpiochip_irqchip_add_key(gc, irqchip, first_irq,
-					handler, type, false,
-					&lock_key, &request_key);
-}
-
-static inline int gpiochip_irqchip_add_nested(struct gpio_chip *gc,
-			  struct irq_chip *irqchip,
-			  unsigned int first_irq,
-			  irq_flow_handler_t handler,
-			  unsigned int type)
-{
-
-	static struct lock_class_key lock_key;
-	static struct lock_class_key request_key;
-
-	return gpiochip_irqchip_add_key(gc, irqchip, first_irq,
-					handler, type, true,
-					&lock_key, &request_key);
-}
-#else /* ! CONFIG_LOCKDEP */
-static inline int gpiochip_irqchip_add(struct gpio_chip *gc,
-				       struct irq_chip *irqchip,
-				       unsigned int first_irq,
-				       irq_flow_handler_t handler,
-				       unsigned int type)
-{
-	return gpiochip_irqchip_add_key(gc, irqchip, first_irq,
-					handler, type, false, NULL, NULL);
-}
-
-static inline int gpiochip_irqchip_add_nested(struct gpio_chip *gc,
-			  struct irq_chip *irqchip,
-			  unsigned int first_irq,
-			  irq_flow_handler_t handler,
-			  unsigned int type)
-{
-	return gpiochip_irqchip_add_key(gc, irqchip, first_irq,
-					handler, type, true, NULL, NULL);
-}
-#endif /* CONFIG_LOCKDEP */
-
 int gpiochip_generic_request(struct gpio_chip *gc, unsigned int offset);
 void gpiochip_generic_free(struct gpio_chip *gc, unsigned int offset);
 int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
-- 
2.26.2

