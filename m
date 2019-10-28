Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4B7E6D56
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2019 08:38:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732984AbfJ1HiK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Oct 2019 03:38:10 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39261 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732043AbfJ1HiJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Oct 2019 03:38:09 -0400
Received: by mail-pl1-f196.google.com with SMTP id t12so547218plo.6
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2019 00:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LsdGXAZDsLtoyIzrg5Nm/vCICJV/ZMXt/g2t+ZwO92U=;
        b=IVRdALVewCeKOhf/3dprfUokjJiXk4Nyvf9Dqgm/2HW09PFIVkADtmNEx1As4UMlXM
         ZSCA8ypu2pIkXInaUPjAhcH4I7Af3T1SnJ+lVF0UtgtAIX0bHUMFViLZpTdidYE/YTcG
         M0GWmlfKA4Mv/LyyP77gvjLKmKvJ9qCswQateofG3VFySFVDhMQFvqVUwdTEkV5c9EVD
         f2j6Obd2vXPXGMfZkepHbda2mXVDcvw5lup41enNRrdZCSUSDo/iem9c+LpyL27NJDHC
         3ez/Ui9dsBrdbO+xtpzWp1XBQfHsYVZblKyGvgbMx/mQnYjIIT2VVEtHy9Q3Y3Yp2sd5
         cbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LsdGXAZDsLtoyIzrg5Nm/vCICJV/ZMXt/g2t+ZwO92U=;
        b=BpTj6by9Emd+hXYb8ApaDYpKkqFNDjoHvOtluEtcfrftJOLiC7VGwFyB21q9UZ9CjR
         2TtLRrkGsyLnDKTqJNNJurZa69mU7ol2sZhPVJqcaSWYuiUOMtNYtvzFQLA/4+zRjQeg
         6CiNWfQRC/xc3dPAB1sozzJlhkURGdfQk7P15oV47FrlYajkOa2JNdISkAyyUYCUJMdo
         310wo/s7Aiym5kbHkb3sNfaxJYh0nCOXPW0oVdGrm7DhU9OUem8el3IjB/mpwrMxN4tL
         7Vrwqepm0f9WAO8qzVYnKCkyw1nOmsWLfQDCcGLP52VuSFEtXCFwjb2vZC6wYyclUn87
         ibbA==
X-Gm-Message-State: APjAAAWrRXz1V+sJLVuU3Z0OS9/nWA6n4VgUbGbPel1wvnk+Eqox5slC
        rvLYaLGnPn6hnSRo5C6Xr1Nd23CtTPWhQhWO
X-Google-Smtp-Source: APXvYqzcCB9xFHZFz2A/njwtyC2u9AMZ0iYoaDGhe1oL/Iv67NJLbQhibJHRrMPajJFkFavZOAilJw==
X-Received: by 2002:a17:902:7089:: with SMTP id z9mr16727741plk.51.1572248288687;
        Mon, 28 Oct 2019 00:38:08 -0700 (PDT)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id b17sm11191015pfr.17.2019.10.28.00.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 00:38:08 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v4 3/5] gpio: mockup: add set_config to support pull up/down
Date:   Mon, 28 Oct 2019 15:37:11 +0800
Message-Id: <20191028073713.25664-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028073713.25664-1-warthog618@gmail.com>
References: <20191028073713.25664-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for the pull up/down state set via gpiolib line requests to
be reflected in the state of the mockup.
Use case is for testing of the GPIO uAPI, specifically the pull up/down
flags.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpio-mockup.c | 94 ++++++++++++++++++++++++--------------
 1 file changed, 60 insertions(+), 34 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 213aedc97dc2..c28219962ae2 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -146,6 +146,61 @@ static void gpio_mockup_set_multiple(struct gpio_chip *gc,
 	mutex_unlock(&chip->lock);
 }
 
+static int gpio_mockup_apply_pull(struct gpio_mockup_chip *chip,
+				  unsigned int offset, int value)
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
+				  unsigned int offset, unsigned long config)
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

