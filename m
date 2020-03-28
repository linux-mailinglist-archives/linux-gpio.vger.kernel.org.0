Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8938E1962DD
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2020 02:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbgC1Ba6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 21:30:58 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:39816 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726212AbgC1Ba6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 21:30:58 -0400
Received: by mail-ed1-f66.google.com with SMTP id a43so13632549edf.6;
        Fri, 27 Mar 2020 18:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bqT8zHEhZa0RTlkhy4qKG7cq6fJlBsGhhqptNH72bxQ=;
        b=gwCB7KDLeADAzzsrh+YqZNXm/L3tbs2cfx261Jhj5JAIZcswtA3RIDtgrAhsc3hm4Q
         xdhoE3Bzep+rMZnFRy/9qOYWOjd8RabxRdyQ/42pX/WelJKFKqKe2toP5+1Wrz0r27LQ
         NGpyT3RDBKnQTaGeYh4Cxc2ICvf+2fztyDv1cYZcHnQVDBjiZn0m4e3rzXYnl1EoASKj
         OrVkJ8lnk0ETVCnl2rIIq8Oa7+FrHU7yjLmIeq5hLVW4ZwkBBuNrwsrvoQTQv5IgyrSo
         M+BOwu06PKUQvxR/I5HEXru9WJNvAA2637OkiZd4SvJ8jFRoaTT1e8exxeifZC85PRFY
         Ofiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bqT8zHEhZa0RTlkhy4qKG7cq6fJlBsGhhqptNH72bxQ=;
        b=WkduKmx5gnj+68sBYFMOjr7JpMc0kb4JgwMmISTNwWJbHMufhXafk5Lvza8rEmeKQ/
         5auaslPeGFxGJxJKPRQPAiKW1XbyTcgUC/xG25xvmKiOQQIqgH/h8bqI1V2LLCVDCDJA
         sjOgUImUtELyV7t/HYy00nn+zBAm6We4r6d40HjKvlgZ5w48VbBdJxhN4f4K58dQZFCc
         OFgZZejvqeSgQx3Sm57tHMUlCyeRTKqHb63OMrLB7oS3FDIXswVNMIbzS+wQIw5xQaE6
         j5PMPmWeSdEh+8zDX88uZ2htPLpEmUgod93VCmyNFn2QltKg+tufCSST1QsTfVEcvamE
         74qg==
X-Gm-Message-State: ANhLgQ2aUMhIE2vMS7dg3JmUg86h+t85vMQK/3E/dT8cL+eSnN+mKBKX
        hUMTqYFrUp1G0w36ew8okJI=
X-Google-Smtp-Source: ADFU+vuHCU4sQkngTx3NhSPPqw+wj0gPVgK3h4iCqKh/LSBgfZ5eSXC9N72wDi+q5ODUn/GOr84u2g==
X-Received: by 2002:a17:906:360f:: with SMTP id q15mr1723087ejb.299.1585359054169;
        Fri, 27 Mar 2020 18:30:54 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (host203-232-dynamic.53-79-r.retail.telecomitalia.it. [79.53.232.203])
        by smtp.googlemail.com with ESMTPSA id v12sm1066560edw.51.2020.03.27.18.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 18:30:53 -0700 (PDT)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     Andy Gross <agross@kernel.org>
Cc:     Ajay Kishore <akisho@codeaurora.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4] pinctrl: qcom: use scm_call to route GPIO irq to Apps
Date:   Sat, 28 Mar 2020 02:30:35 +0100
Message-Id: <20200328013034.20739-1-ansuelsmth@gmail.com>
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
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
v4:
* Fix compilation error

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
@@ -882,11 +887,30 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
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

