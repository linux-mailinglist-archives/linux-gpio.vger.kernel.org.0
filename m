Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5A4194581
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2020 18:36:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727646AbgCZRgN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Mar 2020 13:36:13 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:40906 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgCZRgN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Mar 2020 13:36:13 -0400
Received: by mail-ed1-f65.google.com with SMTP id w26so7832390edu.7;
        Thu, 26 Mar 2020 10:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8+Ugwyc8ML4peI25E2t3UFApnbL9Vw/SvVb5J6/qvFg=;
        b=lPhMtOCLbROjP2BLncSQ9jCvAf5x53CJgO1FmY67FXg9UduaalPhxePkOSGGXtqTK9
         z0WTnfs5jhx76mvR2fBXM8pJTy/vfl5CkIWoBaypUI+aRsMoctrlFT6gT9QlAShOFgnJ
         OhO5lpz0bAsPTpWpObd39j1AxBxVB27cegmgA79Qt25nDojzSsvzXrlT7AVhsGJO3usb
         v5oEj21GAfemq4xyeQyW6eKyJyWggVhoryC5SX/ealeEiniEmAfv0rAcm1G+50RHQjsG
         JL2Dauenw6nvMUnF7Y5l67J1GOsQVlc7tdzjQpnUkhpKWVepZ93bUDDJLDbL0HNKA20/
         C0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8+Ugwyc8ML4peI25E2t3UFApnbL9Vw/SvVb5J6/qvFg=;
        b=lhdRqVfm+XFTW+W5/MeVGmZR94S0pr/ubSdgZRAepyA5CCLhYD6z71REH7m1WCoiuO
         GTEnrNKDIubAFWzQeVj84bHvMdbkaCraFEIfGp3BVxpvxFEMA15KA2+o6DGjZX3tlyeD
         PoWYxG/pHpbJmNqs+J8zrfO1yRaW0uceixJPtctd5IBDKk3BtlJC7/er6f1SYiisOTt+
         Pn/mFMrOmz9f/lA8WpOR3DuK1MFL3U88kxaPrgm1TnH4s9Y79GR3AqLXvc+lMth7QQeZ
         Fl5LLnwH3/YTY3Eu5ooTJgKnxEZfp4WVF/Vq84HCMwcX3YngX1W0q/UhvyPZccNfGJxP
         /W1Q==
X-Gm-Message-State: ANhLgQ2V0UXkawr5INrWgtsQ8AS+FQJfS7VMQ+GxCHG195gLZjx1syy/
        ibyUJWJf/Ucpl/oLPkAcZRc=
X-Google-Smtp-Source: ADFU+vsrsA/iixmQ2Wh7lUtLnt+k2r/AoPzphAGrjbVY1iT6R8i2W1Zt6miMmd2Qs7O9ItaLYWsZtg==
X-Received: by 2002:a17:906:fd7:: with SMTP id c23mr9080221ejk.312.1585244170431;
        Thu, 26 Mar 2020 10:36:10 -0700 (PDT)
Received: from Ansuel-XPS.localdomain ([79.53.232.203])
        by smtp.googlemail.com with ESMTPSA id d11sm375409ejd.2.2020.03.26.10.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 10:36:09 -0700 (PDT)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     Andy Gross <agross@kernel.org>
Cc:     Ajay Kishore <akisho@codeaurora.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] pinctrl: qcom: use scm_call to route GPIO irq to Apps
Date:   Thu, 26 Mar 2020 18:35:24 +0100
Message-Id: <20200326173524.15236-1-ansuelsmth@gmail.com>
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
v2:
* Move static varibale in msm_pinctrl struct
* Revert '4b024225c4a8 ("pinctrl: use devm_platform_ioremap_resource() to simplify code")'
  to get base_reg addr

 drivers/pinctrl/qcom/pinctrl-msm.c | 37 ++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 9a8daa256a32..9627ebd41ff9 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -22,6 +22,8 @@
 #include <linux/reboot.h>
 #include <linux/pm.h>
 #include <linux/log2.h>
+#include <linux/qcom_scm.h>
+#include <linux/io.h>
 
 #include <linux/soc/qcom/irq.h>
 
@@ -60,6 +62,9 @@ struct msm_pinctrl {
 	struct irq_chip irq_chip;
 	int irq;
 
+	int route_to_apps;
+	u32 base_reg;
+
 	raw_spinlock_t lock;
 
 	DECLARE_BITMAP(dual_edge_irqs, MAX_NR_GPIO);
@@ -883,10 +888,27 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		clear_bit(d->hwirq, pctrl->dual_edge_irqs);
 
 	/* Route interrupts to application cpu */
-	val = msm_readl_intr_target(pctrl, g);
-	val &= ~(7 << g->intr_target_bit);
-	val |= g->intr_target_kpss_val << g->intr_target_bit;
-	msm_writel_intr_target(val, pctrl, g);
+	if (pctrl->route_to_apps && pctrl->base_reg) {
+		u32 addr = pctrl->base_reg + g->intr_target_reg;
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
@@ -1241,6 +1263,8 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 	pctrl->dev = &pdev->dev;
 	pctrl->soc = soc_data;
 	pctrl->chip = msm_gpio_template;
+	pctrl->route_to_apps = of_device_is_compatible(pctrl->dev->of_node,
+					"qcom,ipq8064-pinctrl");
 
 	raw_spin_lock_init(&pctrl->lock);
 
@@ -1253,9 +1277,12 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 				return PTR_ERR(pctrl->regs[i]);
 		}
 	} else {
-		pctrl->regs[0] = devm_platform_ioremap_resource(pdev, 0);
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		pctrl->regs[0] = devm_ioremap_resource(&pdev->dev, res);
 		if (IS_ERR(pctrl->regs[0]))
 			return PTR_ERR(pctrl->regs[0]);
+		else
+			pctrl->base_reg = res->start;
 	}
 
 	msm_pinctrl_setup_pm_reset(pctrl);
-- 
2.25.1

