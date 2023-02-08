Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3665D69B155
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Feb 2023 17:49:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbjBQQtn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Feb 2023 11:49:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbjBQQtl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Feb 2023 11:49:41 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B38F4497FB
        for <linux-gpio@vger.kernel.org>; Fri, 17 Feb 2023 08:49:40 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id l23so1295483qtj.1
        for <linux-gpio@vger.kernel.org>; Fri, 17 Feb 2023 08:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GwlRJ6QZLC4825eR4jurC5qWL3Ut7MNH8cguHvzEhM=;
        b=WGolbwhTzFWaofdqfEJ8TP6repSRsRwc3FPGxpK7wfibIFLRL+KpvtbBV29N/rhGKk
         YsDDaVlsYJelbAmFPKcBzndlF3aYlzPqxgEBxc4kqCLtLqUMA8lygycK2svwu3XhYpIu
         XKHUj4vCfB9s4aUksqbmk4JvZ1uRCEyWbGLpC+7V5gdNblDGfD/z0kd1lB3QA6peMhtS
         H7F+JqM6NAKXUSMIu/ysL1Rp8b7l5+Em4IQ3VfVPQlLw4YeSDytAq+VVOsRuxTXsx+9P
         UsXajI8KMjYU6GaByqAA2nw7x4CQKCJJF0Rk6SwPtrGqpZdwXFkZgFKCyIli7DnydW/E
         1qIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GwlRJ6QZLC4825eR4jurC5qWL3Ut7MNH8cguHvzEhM=;
        b=dzHmMf1OtInb69SLUiqh2kZXkbFlnSSylyzTjmiZVYk0pigqLqys9jR0oLx/UeD4zB
         JHKa9p/z9OtHb8GmMeIGk1pauZVhl7HbDp2uADIFywgb7aWQ9qtxAwt5/up/qzIyQAWA
         6uIoaFaKGYNfFeUG5VnRK4qXafD5d8DVY2C8+xWZjGEM+fm3oQ5q+mLJXJhFKM8ZQzeN
         j39qpT/rNcWcu33qtde7P+5Uhtal/9+Q+NM25AULwWA3XEh0voNTOFRbKHIjzx6hiDJ4
         lqlu426dBIe8YDzagSMxMb7T2FyffrFMLZSQ7VzqRxYeco3jRMFho9mlqkgd1wJ3uJVL
         NAdQ==
X-Gm-Message-State: AO0yUKW8mZ9gLZLnvZ72iAxksCH4lscC3NUn9ub563Vy4kLmKrCW047G
        gyUx8gWoPQRPhSztkerjyZEd3w==
X-Google-Smtp-Source: AK7set9ekPkTE3SQ0s7BZXYOpBFWNOzx0FBss2icitDMGpEKS3fCAHLe2utTGVFdGj/sKe8XcIWBkw==
X-Received: by 2002:ac8:5914:0:b0:3b9:ba24:4f38 with SMTP id 20-20020ac85914000000b003b9ba244f38mr2841609qty.56.1676652579813;
        Fri, 17 Feb 2023 08:49:39 -0800 (PST)
Received: from fedora.attlocal.net (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id b68-20020a37b247000000b0073980414888sm3569161qkf.42.2023.02.17.08.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 08:49:39 -0800 (PST)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     linus.walleij@linaro.org, brgl@bgdev.pl
Cc:     broonie@kernel.org, andriy.shevchenko@linux.intel.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        William Breathitt Gray <william.gray@linaro.org>
Subject: [PATCH 1/6] regmap-irq: Add no_status support
Date:   Wed,  8 Feb 2023 12:18:16 -0500
Message-Id: <1e14e042c84f0c0a5e7d25ae9986f88a9620965c.1675876659.git.william.gray@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1675876659.git.william.gray@linaro.org>
References: <cover.1675876659.git.william.gray@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.3 required=5.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some devices lack status registers, yet expect to handle interrupts.
Introduce a no_status flag to indicate such a configuration, where
rather than read a status register to verify, all interrupts received
are assumed to be active.

Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
---
 drivers/base/regmap/regmap-irq.c | 23 ++++++++++++++++-------
 include/linux/regmap.h           |  2 ++
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index a8f185430a07..7abc42c5794d 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -437,7 +437,11 @@ static irqreturn_t regmap_irq_thread(int irq, void *d)
 	 * possible in order to reduce the I/O overheads.
 	 */
 
-	if (chip->num_main_regs) {
+	if (chip->no_status) {
+		/* no status register so default to all active */
+		memset(data->status_buf, 0xFF,
+		       chip->num_regs * sizeof(*data->status_buf));
+	} else if (chip->num_main_regs) {
 		unsigned int max_main_bits;
 		unsigned long size;
 
@@ -967,12 +971,17 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 			continue;
 
 		/* Ack masked but set interrupts */
-		reg = d->get_irq_reg(d, d->chip->status_base, i);
-		ret = regmap_read(map, reg, &d->status_buf[i]);
-		if (ret != 0) {
-			dev_err(map->dev, "Failed to read IRQ status: %d\n",
-				ret);
-			goto err_alloc;
+		if (d->chip->no_status) {
+			/* no status register so default to all active */
+			d->status_buf[i] = -1;
+		} else {
+			reg = d->get_irq_reg(d, d->chip->status_base, i);
+			ret = regmap_read(map, reg, &d->status_buf[i]);
+			if (ret != 0) {
+				dev_err(map->dev, "Failed to read IRQ status: %d\n",
+					ret);
+				goto err_alloc;
+			}
 		}
 
 		if (chip->status_invert)
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index a3bc695bcca0..12637c4d231e 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1563,6 +1563,7 @@ struct regmap_irq_chip_data;
  *		      can be accomplished with a @get_irq_reg callback, without
  *		      the need for a @sub_reg_offsets table.
  * @status_invert: Inverted status register: cleared bits are active interrupts.
+ * @no_status: No status register: all interrupts assumed generated by device.
  * @runtime_pm:  Hold a runtime PM lock on the device when accessing it.
  *
  * @num_regs:    Number of registers in each control bank.
@@ -1630,6 +1631,7 @@ struct regmap_irq_chip {
 	unsigned int clear_on_unmask:1;
 	unsigned int not_fixed_stride:1;
 	unsigned int status_invert:1;
+	unsigned int no_status:1;
 
 	int num_regs;
 
-- 
2.39.1

