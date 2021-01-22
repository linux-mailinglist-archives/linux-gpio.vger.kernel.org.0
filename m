Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CCDE300FBB
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 23:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbhAVWP7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 17:15:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728582AbhAVUAu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 15:00:50 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC38C06174A;
        Fri, 22 Jan 2021 12:00:09 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id x23so7895580lji.7;
        Fri, 22 Jan 2021 12:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ySROqCpqpgTDT8oyxKlu8mYrdsVHNrj8mgdO1gvw1O8=;
        b=dAqM9hKEJBD7SJ9nSMxLIdg1nOdSHr6KVLlOstj71hN6gES78SjTMf2T1od6HxRHg9
         nyMQRhSMt0HyyRS1bgShRoxTYql6RuUlkXrpD+PXPpHZ4r1b10gYOs1NZ4NlK9wvMh2t
         9ZeFX+TTe7Z4zgD3ZtqMbLHQMXruSo3mpOfuxiMJKvyoAoJrjRIHan0Y43lp0GiEreLI
         EMcAadnCgPQh91vO57TNx/mlegeGLynGbYYp407D6duvbqFVnDIqWVMp4a2hdOQGhx20
         RwK05HxK1qdhXU8cpL2AbiRQzKTC9H9xuibF9DwlXy6NFKizUVxnu+/XzchPEa11yeeG
         VHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ySROqCpqpgTDT8oyxKlu8mYrdsVHNrj8mgdO1gvw1O8=;
        b=caUViMSRNJYGiLOQUnPQZm7FfoQ5URhij5D7dcoTZCAyCosZg+2z8evQ0fEvbt7DVy
         Vs2dXEWcIRDBGZIw3TvQDTMQAp3Kd14A9CjoNZ1X+xjsIqUOzbGuQ/5EWTCRIHqXPV3a
         nOAJDz5ACUHsOOTsqEs8EYfPxj3ndy5SJ9jOjPebV5iScfhZ27Nn8I/MF9ZFnCdOfc0Q
         JET0gGziTF/CglQ+Dvjzs6Za54HyCUpDXpVBHKLSUDpao5lYnDJAdb3GXcEk/3NmC+oW
         EJWY5rxVJ5I26S5WposmKqVq7RowYuMOiVl0ZKSbBx0b2ZFN+J14br/3aMvmhZCYLugH
         l7Hw==
X-Gm-Message-State: AOAM531NZJrRhUyLbraC2/vnmx6xldU58jZKyUzCpVLq2CIVM3XjdwX3
        WvYHFKvHLKVBk/wS3EF2uIc=
X-Google-Smtp-Source: ABdhPJx/aNkD6pLYl1sH1ah8wn5QAG2qqt8Lue3LPtLn3f0E3j3HJ1TIltAOq9r+LpnJPGEcd5mILg==
X-Received: by 2002:a05:651c:30d:: with SMTP id a13mr952818ljp.238.1611345608033;
        Fri, 22 Jan 2021 12:00:08 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id y20sm306401ljh.124.2021.01.22.12.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 12:00:07 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] gpio: tegra: Improve formatting of the code
Date:   Fri, 22 Jan 2021 22:59:59 +0300
Message-Id: <20210122195959.4197-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Don't cross 80 chars of line length in order to keep formatting of the
code consistent.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-tegra.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 0be24248280a..0025f613d9b3 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -432,8 +432,10 @@ static void tegra_gpio_irq_handler(struct irq_desc *desc)
 		chained_irq_exit(chip, desc);
 }
 
-static int tegra_gpio_child_to_parent_hwirq(struct gpio_chip *chip, unsigned int hwirq,
-					    unsigned int type, unsigned int *parent_hwirq,
+static int tegra_gpio_child_to_parent_hwirq(struct gpio_chip *chip,
+					    unsigned int hwirq,
+					    unsigned int type,
+					    unsigned int *parent_hwirq,
 					    unsigned int *parent_type)
 {
 	*parent_hwirq = chip->irq.child_offset_to_irq(chip, hwirq);
@@ -442,7 +444,8 @@ static int tegra_gpio_child_to_parent_hwirq(struct gpio_chip *chip, unsigned int
 	return 0;
 }
 
-static void *tegra_gpio_populate_parent_fwspec(struct gpio_chip *chip, unsigned int parent_hwirq,
+static void *tegra_gpio_populate_parent_fwspec(struct gpio_chip *chip,
+					       unsigned int parent_hwirq,
 					       unsigned int parent_type)
 {
 	struct irq_fwspec *fwspec;
@@ -570,7 +573,8 @@ static int tegra_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
 }
 #endif
 
-static int tegra_gpio_irq_set_affinity(struct irq_data *data, const struct cpumask *dest,
+static int tegra_gpio_irq_set_affinity(struct irq_data *data,
+				       const struct cpumask *dest,
 				       bool force)
 {
 	if (data->parent_data)
@@ -712,7 +716,8 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 	if (!tgi->bank_info)
 		return -ENOMEM;
 
-	tgi->irqs = devm_kcalloc(&pdev->dev, tgi->bank_count, sizeof(*tgi->irqs), GFP_KERNEL);
+	tgi->irqs = devm_kcalloc(&pdev->dev, tgi->bank_count,
+				 sizeof(*tgi->irqs), GFP_KERNEL);
 	if (!tgi->irqs)
 		return -ENOMEM;
 
-- 
2.29.2

