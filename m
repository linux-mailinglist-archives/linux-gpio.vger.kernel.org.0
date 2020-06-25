Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3DA209772
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2020 02:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388855AbgFYALB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 20:11:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388690AbgFYAKs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 20:10:48 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E78E4C061798
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 17:10:47 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id x11so1905650plo.7
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 17:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1BQGhEnOTLcAnkOD6cOIMtUwarBXYNy82wKDCDvtQ90=;
        b=iy2r5e1by3FC0GuBVTzvABwS1sD4L47z2FyOAtuRL5Nw4HSH7OnFvlk/D6A4mFIYFr
         r89IOmbNP/6C05wgPfM7ACNRmBaRJ/e2ia2g+EIA4Ej5K3IE4c1uBqd90U0mEnbQ2hoO
         3VIavoCGYFVVjdBivRpG5i1uf1uEvt2eAEPRzkjB5FNpCjigxCV2y80rpo0qZSFhuWHA
         mEDDBcY4xInnbBSOa08upCkelmx6fzp7w2DO+Byrtx7O+hcgLnviBGoVmbuusHwQerqo
         5XujoVtjN5X3htlhxMhTDYFJ87eeowerl8cx9iCtGDZhU4NNpCkYmSBUCyNIWcoBMWyi
         HxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1BQGhEnOTLcAnkOD6cOIMtUwarBXYNy82wKDCDvtQ90=;
        b=aUQ5Qnzu47r9SvwpMhWkrK3AXG+nWGGlMOAKGwSng9SetL/ZWquvFIMkk6eWVHsqmh
         oEf0PEnOdXqtt0oar4oOtJazpHbPZNQghD/GfpuKQuztWMqm4+poHD+EwyuB3xv3Vp50
         u/ylJXe9EaDp7sIj/zm6IlOHweBZ10UzZsXv3bxjDUD78/lx1jIP9KkYjzAxy87CH6AM
         0ubxdWywLS6qR4CbsKO5AkVTFW+xrjefFhxj5R8lO5U0qcHO8yCCq51XJONkxj/QE5uD
         9kRHO//QZxmYv9GW6ZFbg3Dqhrq/2DSSgpaOoaCqHeHlqiZ4up0Syp0q+In7KYBwGhCy
         pUcg==
X-Gm-Message-State: AOAM531Sc4hlixd/ksg+sAStc82v8jXjHv+e3dQ/rvKPoNwq1CsBewB8
        TcEOJer3EzO5q/MOm1oM2M0EYw==
X-Google-Smtp-Source: ABdhPJwDz2x/LmmZ4ChNgREsOBxp8f5ux0cChEqCx9b9fuxljjxzHtStIMBHmJqrHRJUwaMRnpVWew==
X-Received: by 2002:a17:902:a585:: with SMTP id az5mr30012995plb.207.1593043847478;
        Wed, 24 Jun 2020 17:10:47 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id n19sm17458671pgb.0.2020.06.24.17.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 17:10:47 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH v2 3/5] irqchip: Allow QCOM_PDC to be loadable as a permanent module
Date:   Thu, 25 Jun 2020 00:10:37 +0000
Message-Id: <20200625001039.56174-4-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625001039.56174-1-john.stultz@linaro.org>
References: <20200625001039.56174-1-john.stultz@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allows qcom-pdc driver to be loaded as a permanent module

Also, due to the fact that IRQCHIP_DECLARE becomes a no-op when
building as a module, we have to add the platform driver hooks
explicitly.

Thanks to Saravana for his help on pointing out the
IRQCHIP_DECLARE issue and guidance on a solution.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maulik Shah <mkshah@codeaurora.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Todd Kjos <tkjos@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: iommu@lists.linux-foundation.org
Cc: linux-gpio@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v2: Fix spelling, include order and set suppress_bind_attrs
    suggested by Maulik Shah
---
 drivers/irqchip/Kconfig    |  2 +-
 drivers/irqchip/qcom-pdc.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 29fead208cad..12765bed08f9 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -425,7 +425,7 @@ config GOLDFISH_PIC
          for Goldfish based virtual platforms.
 
 config QCOM_PDC
-	bool "QCOM PDC"
+	tristate "QCOM PDC"
 	depends on ARCH_QCOM
 	select IRQ_DOMAIN_HIERARCHY
 	help
diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 6ae9e1f0819d..3fee8b655da1 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -11,9 +11,11 @@
 #include <linux/irqdomain.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
+#include <linux/of_irq.h>
 #include <linux/soc/qcom/irq.h>
 #include <linux/spinlock.h>
 #include <linux/slab.h>
@@ -430,4 +432,33 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
 	return ret;
 }
 
+#ifdef MODULE
+static int qcom_pdc_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct device_node *parent = of_irq_find_parent(np);
+
+	return qcom_pdc_init(np, parent);
+}
+
+static const struct of_device_id qcom_pdc_match_table[] = {
+	{ .compatible = "qcom,pdc" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, qcom_pdc_match_table);
+
+static struct platform_driver qcom_pdc_driver = {
+	.probe = qcom_pdc_probe,
+	.driver = {
+		.name = "qcom-pdc",
+		.of_match_table = qcom_pdc_match_table,
+		.suppress_bind_attrs = true,
+	},
+};
+module_platform_driver(qcom_pdc_driver);
+#else
 IRQCHIP_DECLARE(qcom_pdc, "qcom,pdc", qcom_pdc_init);
+#endif
+
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. Power Domain Controller");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

