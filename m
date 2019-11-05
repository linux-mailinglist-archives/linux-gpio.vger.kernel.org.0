Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B532EEF33A
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 03:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730298AbfKECFL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 21:05:11 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36614 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729524AbfKECFL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 21:05:11 -0500
Received: by mail-pg1-f196.google.com with SMTP id k13so1559681pgh.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 18:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LsdGXAZDsLtoyIzrg5Nm/vCICJV/ZMXt/g2t+ZwO92U=;
        b=ry3Nh/ccn/+CdgTPDmn+GolQlgmNmdjZEiBJXTiLPubMJpDK15gMGVYaUYsH4YSYeP
         3iASa1Mj+a0MZdq+5oR2n6JchdBoZ3u3TCiA4cJP5s41PlK8iLij87ueHQoZTqhmG3YA
         mOFqEPOC8Qln1mEM2w8RexXWJITfu+8CHHouaihjnpU17h0LJwsTATd47zMPA5CiSqQA
         o3RPoA0m/njfHtOZ7tIHpe362OQVwTIc10B45xOeLJdn5SJx4Kq0GAcSkxZ29CkuJqnd
         p0qLmBECY4MBzqWI8FUMh7Zdz1/cbobNmMXURgPO/VuJfkpZyhClI5yIPpL8JvpkzShb
         wKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LsdGXAZDsLtoyIzrg5Nm/vCICJV/ZMXt/g2t+ZwO92U=;
        b=qODqKTLPNamSnRHYprm0mlN9Y9XpRllV8RO1dQcF+dPWcq6Rv74x3PBBDQUQ5cRt8c
         bbgWIaGe2DuNBSK2nwPjFH7sArlr9SWVgxZFxNiaxz9TurOwAia/nN390LhfPmzWGYdv
         TmebaB8KGXSUNnsOfhBjcz0Hfj0HveGCupI6sy+x7WsrEhOQ8FL/zaVpgGgZDMvj8FZL
         oJF30fCoNJLF42htonnMF3BEgJ7MgrpplDZSfn3yJRswM+c6rPyUn70XXzIPC4u0w0cw
         zy+xNKBBID06oR8Vr1PG/FzAY8ABu7yfrqJxWx7toX3q2j01IfvNDikBxfciC0Z8Q7v9
         /VXA==
X-Gm-Message-State: APjAAAUhUHYIc1Kp1li4w2xnK9F+fSuwdwH18Otygnlnmc5yzdCc6cXC
        m5CGfRY68e2hkvKTssGxCdShfW7oa2HyWQ==
X-Google-Smtp-Source: APXvYqwwqhl5T2t2bKGs+P0SvSQXBCOSvNBn+nav20GDN9Ouw+HzdqWNQsRbs8/7kwY4QsEPq8gJXg==
X-Received: by 2002:a17:90a:f982:: with SMTP id cq2mr3061947pjb.34.1572919509762;
        Mon, 04 Nov 2019 18:05:09 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id r184sm11641909pfc.106.2019.11.04.18.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 18:05:09 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, thomas.petazzoni@bootlin.com,
        Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v6 5/7] gpio: mockup: add set_config to support pull up/down
Date:   Tue,  5 Nov 2019 10:04:27 +0800
Message-Id: <20191105020429.18942-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105020429.18942-1-warthog618@gmail.com>
References: <20191105020429.18942-1-warthog618@gmail.com>
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

