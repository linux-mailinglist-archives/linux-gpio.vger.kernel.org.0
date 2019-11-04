Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 411F9EE40B
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 16:39:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729277AbfKDPjn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 10:39:43 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44617 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729346AbfKDPjn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 10:39:43 -0500
Received: by mail-pg1-f194.google.com with SMTP id f19so2415942pgk.11
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 07:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LsdGXAZDsLtoyIzrg5Nm/vCICJV/ZMXt/g2t+ZwO92U=;
        b=b24QYCts9VHaVNFeysyVd5CLKl9Ve0ndM8ix/d9V7JBxoSdOCP3ycSPm7p9uQS2X5N
         TqJuZMnAZoHJF5XVvdJzrp2YQdEwLjhPimX2mSUamA9GBayqslMHqRq1YhDefCQAhxg/
         a+lbxx2Kvnc36ojjq87Qxwa06cMEiM77kl7tACIu9EiskFm9hCr7DzsgfBtnP5Sht+6q
         EBi+HIYin53n6q7kVM2+wQUN+bH5DeACYdmDvCfd/fbqIy/sLvfxhdX9i+4NwgnFE6nc
         1Yw2fi4e5mkv29+mVt49sJvq+lR2cgfLrhWec9xaXc+D/8WmVcTmjiNVfVb9iNbeucz9
         WArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LsdGXAZDsLtoyIzrg5Nm/vCICJV/ZMXt/g2t+ZwO92U=;
        b=SmsPWb0DCbOLAb6A4d0VXOim+oXx0Up+ieQ0PO8JX2+CbHEKh/salhLW8fKjkC7jXY
         tt2NDw++ONIKYGYUl1KIzYAbiTCdi40ZHaZLyWOd90oaNDHwQX7+Dhn1M4wfnQ4yGLlS
         +kVARNCMB/lqmoVuB2j2wjkJh35uf2YUPzvvBrctTtYDL5corPRuJw/THiSzQt9LixMh
         Mt+QkVQweqxuq2Hdr9A5M+bndD5BT+vyGeBMzjozO9Y1xwjNXIvvIbDYlxDJOaNzdszL
         7AOPbn9d02zKPq0F8M5gX0YtqsjC3rvQjZQkiKDNda2UguWAwGoTA8THRgJ23kWLO3qv
         NegA==
X-Gm-Message-State: APjAAAVePu66Lp6PsLUTdQjlz8zFj9t34SB4+3gKvLHI7CtYatCjaBOX
        IuNUIAbV4Rr8DGG78rGDeh0tdgYhSS+M5g==
X-Google-Smtp-Source: APXvYqzX8cndBJLjLRclPdjTAAVcKtrtDhEOtIVho+oRgKR2UJFFXahe6YB/a+wJ7eER2hdZGK0R5A==
X-Received: by 2002:a62:1d8d:: with SMTP id d135mr4940247pfd.172.1572881981501;
        Mon, 04 Nov 2019 07:39:41 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id a66sm5819761pfb.166.2019.11.04.07.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 07:39:40 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, thomas.petazzoni@bootlin.com,
        Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v5 5/7] gpio: mockup: add set_config to support pull up/down
Date:   Mon,  4 Nov 2019 23:38:39 +0800
Message-Id: <20191104153841.16911-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191104153841.16911-1-warthog618@gmail.com>
References: <20191104153841.16911-1-warthog618@gmail.com>
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

