Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B756196126
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 23:32:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727585AbgC0WcW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 18:32:22 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:41541 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbgC0WcW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 18:32:22 -0400
Received: by mail-ed1-f65.google.com with SMTP id v1so13210024edq.8;
        Fri, 27 Mar 2020 15:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PS7K5rF+Cg6On6T3DToyfe3R3dABZKL4am5J0GbhTdc=;
        b=uhUfpfv1fHQDzSKiZvahUYHiOoF2HuQgzuE83x6rP4SAxvRKfVV29Os1SuqguMCqIo
         n7FtXSqsPrizA2bWYlZqgJH9R5pbQDR2Y/zjaFsOCtsaY/ys/iTK0ADLKFG3+PGRGh/F
         xIr2eTCKnTOoy4XHUpg50mXyOsd6Bi8gV9ufFexWeqMLPlh4DuJ69yu5JnN4OQKfjazd
         lCDiTWcV2+x3ixrkMcD2mimcBvGmpRfHYMX32XlbIoGu6NSTmCg+tlkZK/3D/qegi5jD
         GcOoZnubiVjCOFKZAnVsQUbDqkdyN/iVwqMMPAMu1/rqGpHqnAJnnH3XGw7P6BqfhWZx
         zuyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PS7K5rF+Cg6On6T3DToyfe3R3dABZKL4am5J0GbhTdc=;
        b=XcU4WI0n1FhswMRe64IKvYinIcj5H6A6ex+RwawWtSY9IHiMZch/O4FfuTIajwWSLs
         mKEZz3QaWxM8bo4SJHmbzyOL+oUr9b+GjXKdmKHAqMjatBt6Wm9TBp3AGJMfDEeWPRrV
         5jHz0tafcKJTQPyyfcy7SV2veH+8bqu6nQYiCHp0edPJIuAaO79IjqaAmvOTf1noExgF
         G1Xy1x0ywMopWqI9o76zp15MoGmvgrcEmRmRmnqEiWKUATAWWFicqWuFuj4TwMC1ihgw
         vmJaikr3QF/veOrBTJRBTX6r7vx95Eu7c5WYAhjZkcNZLHmdJMpPc0zinCaZRcd5j+iz
         PfVw==
X-Gm-Message-State: ANhLgQ2oClLWzGKQntNLTLOMhdAIZ6mHZkWyfTCCnf341xGdDwgmdKGd
        i7DARoS4NyMV+4XBSHXVhLA=
X-Google-Smtp-Source: ADFU+vtxilaq5/JJXYmsRylks0eE4gcJmXLVEWDGDi4/GpErXjHanhDXgc13g3q4tpCUIuuPtQGsyg==
X-Received: by 2002:a05:6402:b14:: with SMTP id bm20mr1336170edb.365.1585348340310;
        Fri, 27 Mar 2020 15:32:20 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (host203-232-dynamic.53-79-r.retail.telecomitalia.it. [79.53.232.203])
        by smtp.googlemail.com with ESMTPSA id p8sm1056354edm.96.2020.03.27.15.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 15:32:19 -0700 (PDT)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     Andy Gross <agross@kernel.org>
Cc:     Ajay Kishore <akisho@codeaurora.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3] pinctrl: qcom: use scm_call to route GPIO irq to Apps
Date:   Fri, 27 Mar 2020 23:32:08 +0100
Message-Id: <20200327223209.20409-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Ajay Kishore <akisho@codeaurora.org>

For IPQ806x targets, TZ protects the registers that are used to
configure the routing of interrupts to a target processor.
To resolve this, this patch uses scm call to route GPIO interrupts
to application processor. Also the scm call interface is changed.

Signed-off-by: Ajay Kishore <akisho@codeaurora.org>
Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
v3:
* Rename route_to_apps to intr_target_use_scm
* Follow standard design and rename base_reg to phys_base
* Add additional comments in route interrupts condition 

v2:
* Move static varibale in msm_pinctrl struct
* Revert '4b024225c4a8 ("pinctrl: use devm_platform_ioremap_resource() to simplify code")'
  to get base_reg addr

 drivers/pinctrl/qcom/pinctrl-msm.c | 42 +++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 9a8daa256a32..7d2a34beb1b6 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -22,6 +22,8 @@
 #include <linux/reboot.h>
 #include <linux/pm.h>
 #include <linux/log2.h>
+#include <linux/qcom_scm.h>
+#include <linux/io.h>
 
 #include <linux/soc/qcom/irq.h>
 
@@ -60,6 +62,8 @@ struct msm_pinctrl {
 	struct irq_chip irq_chip;
 	int irq;
 
+	bool intr_target_use_scm;
+
 	raw_spinlock_t lock;
 
 	DECLARE_BITMAP(dual_edge_irqs, MAX_NR_GPIO);
@@ -68,6 +72,7 @@ struct msm_pinctrl {
 
 	const struct msm_pinctrl_soc_data *soc;
 	void __iomem *regs[MAX_NR_TILES];
+	u32 phys_base[MAX_NR_TILES];
 };
 
 #define MSM_ACCESSOR(name) \
@@ -882,11 +887,31 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	else
 		clear_bit(d->hwirq, pctrl->dual_edge_irqs);
 
-	/* Route interrupts to application cpu */
-	val = msm_readl_intr_target(pctrl, g);
-	val &= ~(7 << g->intr_target_bit);
-	val |= g->intr_target_kpss_val << g->intr_target_bit;
-	msm_writel_intr_target(val, pctrl, g);
+	/* Route interrupts to application cpu.
+	 * With intr_target_use_scm interrupts are routed to
+	 * application cpu using scm calls.
+	 */
+	if (pctrl->intr_target_use_scm) {
+		u32 addr = pctrl->phys_base[0] + g->intr_target_reg;
+		int ret;
+
+		qcom_scm_io_readl(addr, &val);
+
+		val &= ~(7 << g->intr_target_bit);
+		val |= g->intr_target_kpss_val << g->intr_target_bit;
+
+		ret = qcom_scm_io_writel(addr, val);
+		if (ret)
+			dev_err(pctrl->dev,
+				"Failed routing %lu interrupt to Apps proc",
+				d->hwirq);
+		}
+	} else {
+		val = msm_readl_intr_target(pctrl, g);
+		val &= ~(7 << g->intr_target_bit);
+		val |= g->intr_target_kpss_val << g->intr_target_bit;
+		msm_writel_intr_target(val, pctrl, g);
+	}
 
 	/* Update configuration for gpio.
 	 * RAW_STATUS_EN is left on for all gpio irqs. Due to the
@@ -1241,6 +1266,9 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 	pctrl->dev = &pdev->dev;
 	pctrl->soc = soc_data;
 	pctrl->chip = msm_gpio_template;
+	pctrl->intr_target_use_scm = of_device_is_compatible(
+					pctrl->dev->of_node,
+					"qcom,ipq8064-pinctrl");
 
 	raw_spin_lock_init(&pctrl->lock);
 
@@ -1253,9 +1280,12 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 				return PTR_ERR(pctrl->regs[i]);
 		}
 	} else {
-		pctrl->regs[0] = devm_platform_ioremap_resource(pdev, 0);
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		pctrl->regs[0] = devm_ioremap_resource(&pdev->dev, res);
 		if (IS_ERR(pctrl->regs[0]))
 			return PTR_ERR(pctrl->regs[0]);
+
+		pctrl->phys_base[0] = res->start;
 	}
 
 	msm_pinctrl_setup_pm_reset(pctrl);
-- 
2.25.1

