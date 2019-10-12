Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30553D4BFB
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2019 03:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728442AbfJLB5F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 21:57:05 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45918 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727345AbfJLB5F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2019 21:57:05 -0400
Received: by mail-pf1-f196.google.com with SMTP id y72so7075422pfb.12
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2019 18:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9yM+7slsNLJm2jMU2/8cO8XX3jrRvDxcj2OR+Xd2zxk=;
        b=mhHSoPhJ0mPyKq+x1R0ViVgGWoxCKcMPdTBMCPzYENHXbJmujHK3lWGk+0q6e/x9hh
         J/l2czViPPIseswxFFL3eEgWzniRDQOMJdTrqFp0Rh6ZZonagqeJAGS4eo1hFaPt3zp8
         YCvcnTXepDLrpWd5PXuaxkppACj5X0j2D/I9bgqJqMFEzO/7aOqcdJ7OHx76pdUbFLXl
         Olqo0g4ixpzJAhXK/m+TRFU75XbeGzp4uWxhTfabjdeoZVnHhtLiq9njH329s6ACLZGQ
         NT5vRxbJBzy4lKVAcRWc0eLTgF/qd4U1NkyaxhY7pbmFx29i9Gt+yoOQreQQG8oc4OEk
         YuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9yM+7slsNLJm2jMU2/8cO8XX3jrRvDxcj2OR+Xd2zxk=;
        b=bkhSiupQ4owj6h8f+stxXTYNyEIfQMlDHxhgLMi1JvUz83EB1BspDzCs/pOp12YZ1O
         tc/uZvgUPBNhZwGS6uFq87r0DKvygCFwPSaMhWLDhrfdT5PTgo1e+arIT1yRUE9XV5t8
         BFWoli8TEpUy7Dm9k8o+bQifXTtQaeVwIlwW/ds0+lAMdNlBFq9RiJObwZ+rqvYh6jlS
         kxGnV4SQiWdrbfz7msaObNApqNBx7XJ8jeO4RQeH+7QPotqlF+kEGz4dJvjJEd+zF/RZ
         DHUWvXj5b45thgaG4cFL5xBHdNDoA2sH1SHzYZhCZkUT96mUjS6Ejik2ckANX+pn4EMD
         q55w==
X-Gm-Message-State: APjAAAWSGaJ8lYeQCEfxN+zM+tC7NOE7hbZwS4b7uJHYhqhgywlTmm+H
        Wddw6jCInVOgN0r57S8Ef8qNAEAdC/JF0w==
X-Google-Smtp-Source: APXvYqyo7bF1WJDVRXZa4XRiL3uVXCvH7ghxRJZ8SIcwcS4tptcf/Ec7r1pFYwrHa0h/TQcGbAxyiA==
X-Received: by 2002:a17:90a:aa0a:: with SMTP id k10mr20706200pjq.13.1570845423881;
        Fri, 11 Oct 2019 18:57:03 -0700 (PDT)
Received: from sol.lan (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id b20sm12042242pff.158.2019.10.11.18.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 18:57:03 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 3/6] gpio: mockup: add set_config to support pull up/down
Date:   Sat, 12 Oct 2019 09:56:25 +0800
Message-Id: <20191012015628.9604-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191012015628.9604-1-warthog618@gmail.com>
References: <20191012015628.9604-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds support for the pull up/down state set via gpiolib line
requests to be reflected in the state of the mockup.
Use case is for testing of the GPIO uAPI, specifically the pull up/down
flags.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpio-mockup.c | 94 ++++++++++++++++++++++++--------------
 1 file changed, 60 insertions(+), 34 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 213aedc97dc2..493077229677 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -146,6 +146,61 @@ static void gpio_mockup_set_multiple(struct gpio_chip *gc,
 	mutex_unlock(&chip->lock);
 }
 
+static int gpio_mockup_apply_pull(struct gpio_mockup_chip *chip,
+			unsigned int offset, int value)
+{
+	struct gpio_desc *desc;
+	struct gpio_chip *gc;
+	struct irq_sim *sim;
+	int curr, irq, irq_type;
+
+	gc = &chip->gc;
+	desc = &gc->gpiodev->descs[offset];
+	sim = &chip->irqsim;
+
+	mutex_lock(&chip->lock);
+
+	if (test_bit(FLAG_REQUESTED, &desc->flags) &&
+		!test_bit(FLAG_IS_OUT, &desc->flags)) {
+		curr = __gpio_mockup_get(chip, offset);
+		if (curr == value)
+			goto out;
+
+		irq = irq_sim_irqnum(sim, offset);
+		irq_type = irq_get_trigger_type(irq);
+
+		if ((value == 1 && (irq_type & IRQ_TYPE_EDGE_RISING)) ||
+			(value == 0 && (irq_type & IRQ_TYPE_EDGE_FALLING)))
+			irq_sim_fire(sim, offset);
+	}
+
+	/* Change the value unless we're actively driving the line. */
+	if (!test_bit(FLAG_REQUESTED, &desc->flags) ||
+		!test_bit(FLAG_IS_OUT, &desc->flags))
+		__gpio_mockup_set(chip, offset, value);
+
+out:
+	chip->lines[offset].pull = value;
+	mutex_unlock(&chip->lock);
+	return 0;
+}
+
+static int gpio_mockup_set_config(struct gpio_chip *gc,
+				   unsigned int offset, unsigned long config)
+{
+	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
+
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_BIAS_PULL_UP:
+		return gpio_mockup_apply_pull(chip, offset, 1);
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		return gpio_mockup_apply_pull(chip, offset, 0);
+	default:
+		break;
+	}
+	return -ENOTSUPP;
+}
+
 static int gpio_mockup_dirout(struct gpio_chip *gc,
 			      unsigned int offset, int value)
 {
@@ -226,12 +281,8 @@ static ssize_t gpio_mockup_debugfs_write(struct file *file,
 					 size_t size, loff_t *ppos)
 {
 	struct gpio_mockup_dbgfs_private *priv;
-	int rv, val, curr, irq, irq_type;
-	struct gpio_mockup_chip *chip;
+	int rv, val;
 	struct seq_file *sfile;
-	struct gpio_desc *desc;
-	struct gpio_chip *gc;
-	struct irq_sim *sim;
 
 	if (*ppos != 0)
 		return -EINVAL;
@@ -244,35 +295,9 @@ static ssize_t gpio_mockup_debugfs_write(struct file *file,
 
 	sfile = file->private_data;
 	priv = sfile->private;
-	chip = priv->chip;
-	gc = &chip->gc;
-	desc = &gc->gpiodev->descs[priv->offset];
-	sim = &chip->irqsim;
-
-	mutex_lock(&chip->lock);
-
-	if (test_bit(FLAG_REQUESTED, &desc->flags) &&
-	    !test_bit(FLAG_IS_OUT, &desc->flags)) {
-		curr = __gpio_mockup_get(chip, priv->offset);
-		if (curr == val)
-			goto out;
-
-		irq = irq_sim_irqnum(sim, priv->offset);
-		irq_type = irq_get_trigger_type(irq);
-
-		if ((val == 1 && (irq_type & IRQ_TYPE_EDGE_RISING)) ||
-		    (val == 0 && (irq_type & IRQ_TYPE_EDGE_FALLING)))
-			irq_sim_fire(sim, priv->offset);
-	}
-
-	/* Change the value unless we're actively driving the line. */
-	if (!test_bit(FLAG_REQUESTED, &desc->flags) ||
-	    !test_bit(FLAG_IS_OUT, &desc->flags))
-		__gpio_mockup_set(chip, priv->offset, val);
-
-out:
-	chip->lines[priv->offset].pull = val;
-	mutex_unlock(&chip->lock);
+	rv = gpio_mockup_apply_pull(priv->chip, priv->offset, val);
+	if (rv)
+		return rv;
 
 	return size;
 }
@@ -418,6 +443,7 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	gc->direction_output = gpio_mockup_dirout;
 	gc->direction_input = gpio_mockup_dirin;
 	gc->get_direction = gpio_mockup_get_direction;
+	gc->set_config = gpio_mockup_set_config;
 	gc->to_irq = gpio_mockup_to_irq;
 	gc->free = gpio_mockup_free;
 
-- 
2.23.0

