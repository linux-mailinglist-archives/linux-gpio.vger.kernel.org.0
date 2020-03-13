Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC4E2184F31
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2020 20:15:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgCMTPY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Mar 2020 15:15:24 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:38220 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726297AbgCMTPX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Mar 2020 15:15:23 -0400
Received: by mail-ed1-f65.google.com with SMTP id h5so13259956edn.5;
        Fri, 13 Mar 2020 12:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a/Mvn0+PY7Zqcxqn/jETgFaE9sx7vy1J6+fqxPSu5Yk=;
        b=fuhkVmLz0gXC7XyjGBn7cTymXP5dyrOVvVB9f/Tnr8064WVq1pfjwi7JX5cFeEn2yf
         4hfh/x5jL7FEsLrBWEH7S1jt4v6Yy9QEGXFKY6AULjKerRJZKILqoY5PFuN8n3daVfYl
         awUBRY6G7fqWz4i2GTvRJ05OuVDVqNL4bxFY7jDWPZxHVpqgCMgl1AsPuHG2NM1SF7js
         d4IT7h9k7jCZu1bzp4D4WrvNq7RYRYx+U3YahXAvOfglfYjatLK71vmFz93IsY0LraXE
         vXmN2pbQCzySLsfI/QmDy6YMgSlrAn7oVk7F/iwCO9TVF+2YPyha8m/bTII43yQy4Wr5
         Qpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a/Mvn0+PY7Zqcxqn/jETgFaE9sx7vy1J6+fqxPSu5Yk=;
        b=kL3yXd4D7DbNbuV+RdqAo1Lh1TUCNPwXlsCA7KwLbv8OWuAxURdoRMtBnpEa/SvoEm
         npdieQVRc8/WyDilCyBWqFTqc2+W6Ob61ddQ1FXWUmurK6nOWJS2HcWFmHmNyHo2NYC/
         uBsngqs9BHgwNQv26FnR49towoafA1J7H2V8So1oNiry9ZZ7gYWNSwKwmvEpWz0b2vyP
         sQPEtx+8MPnozq/xAx9eC2HyuLtp+MEggg8Zfe2X1deXPzpw+8McPzzMkdwFmWUPHHJc
         15VWeatzA8S45nIxDOPCmpAMeicThf0Z6KzZW5Fx7Uq4AcUWYF3TiG+ACJwjfX9CWFD9
         iyMA==
X-Gm-Message-State: ANhLgQ1YLWK4qFdrw1W408bmZbVPr0l+akXreAn82hpIuM6MPBl9rs4p
        IDiWYeyc+kyemAgebGF+m4s=
X-Google-Smtp-Source: ADFU+vuWQEL9cTysb661kQdTOnQxHILIOGZA5AemK+0tjWcwsDfvcfV7S8iwXIUEw+EDH7G3oqKPOA==
X-Received: by 2002:aa7:cf86:: with SMTP id z6mr14954854edx.281.1584126921840;
        Fri, 13 Mar 2020 12:15:21 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (host61-50-dynamic.50-79-r.retail.telecomitalia.it. [79.50.50.61])
        by smtp.googlemail.com with ESMTPSA id 94sm2552140eda.7.2020.03.13.12.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 12:15:21 -0700 (PDT)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     agross@kernel.org
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Ajay Kishore <akisho@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: use scm_call to route GPIO irq to Apps
Date:   Fri, 13 Mar 2020 20:15:13 +0100
Message-Id: <20200313191513.11365-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

For IPQ806x targets, TZ protects the registers that are used to
configure the routing of interrupts to a target processor.
To resolve this, this patch uses scm call to route GPIO interrupts
to application processor. Also the scm call interface is changed.

Signed-off-by: Ajay Kishore <akisho@codeaurora.org>
Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 36 ++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 9a8daa256a32..a83cfd1da219 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -22,6 +22,8 @@
 #include <linux/reboot.h>
 #include <linux/pm.h>
 #include <linux/log2.h>
+#include <linux/qcom_scm.h>
+#include <linux/io.h>
 
 #include <linux/soc/qcom/irq.h>
 
@@ -710,6 +712,9 @@ static void msm_gpio_irq_mask(struct irq_data *d)
 	const struct msm_pingroup *g;
 	unsigned long flags;
 	u32 val;
+	u32 addr;
+	int ret;
+	const __be32 *reg;
 
 	if (d->parent_data)
 		irq_chip_mask_parent(d);
@@ -863,6 +868,7 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	const struct msm_pingroup *g;
 	unsigned long flags;
 	u32 val;
+	int ret;
 
 	if (d->parent_data)
 		irq_chip_set_type_parent(d, type);
@@ -882,11 +888,33 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	else
 		clear_bit(d->hwirq, pctrl->dual_edge_irqs);
 
+	ret = of_device_is_compatible(pctrl->dev->of_node,
+					"qcom,ipq8064-pinctrl");
 	/* Route interrupts to application cpu */
-	val = msm_readl_intr_target(pctrl, g);
-	val &= ~(7 << g->intr_target_bit);
-	val |= g->intr_target_kpss_val << g->intr_target_bit;
-	msm_writel_intr_target(val, pctrl, g);
+	if (!ret) {
+		val = msm_readl_intr_target(pctrl, g);
+		val &= ~(7 << g->intr_target_bit);
+		val |= g->intr_target_kpss_val << g->intr_target_bit;
+		msm_writel_intr_target(val, pctrl, g);
+	} else {
+		const __be32 *reg = of_get_property(pctrl->dev->of_node,
+						    "reg", NULL);
+
+		if (reg) {
+			u32 addr = be32_to_cpup(reg) + g->intr_target_reg;
+
+			qcom_scm_io_readl(addr, &val);
+			__iormb();
+
+			val &= ~(7 << g->intr_target_bit);
+			val |= g->intr_target_kpss_val << g->intr_target_bit;
+
+			__iowmb();
+			ret = qcom_scm_io_writel(addr, val);
+			if (ret)
+				pr_err("\n Routing interrupts to Apps proc failed");
+		}
+	}
 
 	/* Update configuration for gpio.
 	 * RAW_STATUS_EN is left on for all gpio irqs. Due to the
-- 
2.25.0

