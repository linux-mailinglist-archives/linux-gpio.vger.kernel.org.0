Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71B7B1FA8A0
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 08:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbgFPGOD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 02:14:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbgFPGNq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 02:13:46 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A87C03E96A
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 23:13:46 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id y18so7922098plr.4
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 23:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=M2uJULnvxDpfHs89lgaTRTB9rey6NHbhAifKB1x72gQ=;
        b=HS2MKGAsNdjUxJ+yy27jcpiH1bk7koug2OAXwLJHoTgucSozWnIJSObeAki8dM05am
         DLCS+qX0P1LSqKwIln1ckxouXz0KbXo3o0tpFiRBYmK+NPiqKE6pDzuqc9M+Woh0UQ59
         0qIqzR0HzmFta9njqekXv2RYydZQgrYMTxUNtcLireoA0iUhs07M+xTESQi6DDO/vBQo
         bSM6fZK5iqdLi0jpB6PQWvFyk1ti/AJVyzKrfiIVqCShGFceJ3mF8PFRVhuFFpNV+gJ8
         6/V4j3vwecDwCtqKeIWENohJF3zGujG5GiKGDkkY7rGGOJZOxBk/IL493YOcEiEuhVBI
         PAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=M2uJULnvxDpfHs89lgaTRTB9rey6NHbhAifKB1x72gQ=;
        b=dTd7CqJqG113+B4dfr3ZY9XktT1UBGB2mw++YU6iPpIjzL8IpwSEpKJpyLpFXxhuF9
         L9Iv+MbXLywcwhacT1N1M24WyXCgFNCBQGnmkd5K7Qvc9Yr6Zl1+GYYi9Izu9RljSRbr
         gYeghFV8BNYLJBz5u7oTLjLQtYaZ8+V3Q5OK5A6HDO843l7uN4drUWNglKsBpovTrXJW
         lgBLpqsU1gHm+gV0Nzj0yDsHzBksd8qyk0bxa5q35EV/Ml+1FtonZgf9hKJlXoWJ4mcI
         XY9ebOI9aoaRpcSW0F4VwQFZZJ+tSiROvQ62x7iwK+p3fWH9ieKs8lcW5EqQOkE3ztH8
         Sdzw==
X-Gm-Message-State: AOAM531q1Fc+OsRPMnpxSs0Cug7CgJoIi8Y9yAhKZ6piw5Bru2mmM8Kj
        20kBkVfYJMnR6tSP0ltjCCZEAg==
X-Google-Smtp-Source: ABdhPJw2m1e+LDbBPxO7NdX9TwT/7AlJxXRrPGMYRWdq75cFQWSCTf4uPSRnj0rAwyp+oCkFUZF2jQ==
X-Received: by 2002:a17:90b:238d:: with SMTP id mr13mr1308289pjb.19.1592288025969;
        Mon, 15 Jun 2020 23:13:45 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id i26sm15642032pfo.0.2020.06.15.23.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 23:13:45 -0700 (PDT)
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
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-gpio@vger.kernel.org
Subject: [RFC][PATCH 3/5] irqchip: Allow QCOM_PDC to be loadable as a perment module
Date:   Tue, 16 Jun 2020 06:13:36 +0000
Message-Id: <20200616061338.109499-4-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616061338.109499-1-john.stultz@linaro.org>
References: <20200616061338.109499-1-john.stultz@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allows qcom-pdc driver to be loaded as a permenent module

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
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Todd Kjos <tkjos@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: iommu@lists.linux-foundation.org
Cc: linux-gpio@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/irqchip/Kconfig    |  2 +-
 drivers/irqchip/qcom-pdc.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

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
index 6ae9e1f0819d..98d74160afcd 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -11,7 +11,9 @@
 #include <linux/irqdomain.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/soc/qcom/irq.h>
@@ -430,4 +432,32 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
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

