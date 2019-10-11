Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA6DD44BB
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 17:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728218AbfJKPsF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 11:48:05 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40825 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbfJKPsF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2019 11:48:05 -0400
Received: by mail-pf1-f195.google.com with SMTP id x127so6327882pfb.7
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2019 08:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9yM+7slsNLJm2jMU2/8cO8XX3jrRvDxcj2OR+Xd2zxk=;
        b=bPGYJob19nzCHOkRZiZw9lcnOYM/32jUdDRTmXqH5wREigpO5PXAzVSfZxl4KA9JVf
         A9fC33Cisw43YoA1gHD+4uVBWRN5LWRUuotkz29b0SOTlFL2ur24hd+BNb5ldklEn5UB
         BcS+m6CyL5ewnKCpSpzoHBT9fXQOByBTosnG6N9yfAsCAiDE/mOIXeHbKrr65xyXHHCb
         UJIHHyO7pXi9pBM5DpFzwjaar1opY7vRllB9+kICMLqxI7L3lAAunTSoXCQEEDApA3jV
         k5WDlBjuFqSZyuBSc7rW/zwL0sAob/Gv05pqqyFR4vyNAxb3ra45Tyntu22qAT+F2zX/
         jdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9yM+7slsNLJm2jMU2/8cO8XX3jrRvDxcj2OR+Xd2zxk=;
        b=RI3Qr6pTwmPV/C07RSb0hBEnevNJFEpeGHUVVSYtEbMiSzY7bi77i1XVRU0E6uJKPd
         WNkcuYGftZVX8Fi4uAhG8vWPjR/S8XtKBJiBvf7Pg1E3OQh63z9kexC4G+pfbHLhRiQB
         zkUSHlCooFiwOOCGaO2U0kUi+4tL/9vwFUF5FuTmVN0FzS/YW4A6GpdInM0b510fJ8Mh
         GZQAFS1DunsNPdi4n9rcdPFrnOsZ+gk8teM9GlUFvShTSzgVNF2kM29CcC7Ap6IUshyZ
         CiPfAIhvLjRjXTFfrVIb/2lOU3KQXN/h2+rGFI8BbrEyZOxRVRz3gBhZKGr7ABnSXlvr
         Y6og==
X-Gm-Message-State: APjAAAVw3xFb4Y+aMo7CqQ2iCOXQl9AqlaWVuWgeYBFhEFdsvioxLUU3
        B8jyhTDcVKBVVZK4fBOgJT9BSzUh6vgKtw==
X-Google-Smtp-Source: APXvYqycSvph7wuyWgaxY/gNqi5FEA75xzA7NELOcvDYdiYaiAA4j8bXvfnD1/bK5WsNvqu1mnZXHg==
X-Received: by 2002:a17:90a:8085:: with SMTP id c5mr6277402pjn.60.1570808883452;
        Fri, 11 Oct 2019 08:48:03 -0700 (PDT)
Received: from sol.lan (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id v28sm13755404pgn.17.2019.10.11.08.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 08:48:02 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 2/5] gpio: mockup: add set_config to support pull up/down
Date:   Fri, 11 Oct 2019 23:46:47 +0800
Message-Id: <20191011154650.1749-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191011154650.1749-1-warthog618@gmail.com>
References: <20191011154650.1749-1-warthog618@gmail.com>
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

