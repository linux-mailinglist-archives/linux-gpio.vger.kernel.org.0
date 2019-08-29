Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE38CA2618
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2019 20:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728163AbfH2SfB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Aug 2019 14:35:01 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59502 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfH2SfB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Aug 2019 14:35:01 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 2F1F9686A4; Thu, 29 Aug 2019 18:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567103699;
        bh=rS68WLR481l1COMdQ2jk/qCVOqr85DyICDhl53r3iQE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KIgEPVQpEQaxoE3SnjaRFx8tjgi/VAre9a+7+dnPGm1pH33cptaNhOKvLnwXrDPNl
         n2ciXi0FlxHIXKhmpXomZfU3sdQErwalP1QvJMOJzSXb1/mSl34lV0+Kn6hs9MDVFl
         J4WHpPK4W1+xbMpsiyOnXx+0vn0U7WOBng0fr2Dc=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B8EB468997;
        Thu, 29 Aug 2019 18:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567102347;
        bh=rS68WLR481l1COMdQ2jk/qCVOqr85DyICDhl53r3iQE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Nyzgyb8c62V8KHiqGWcqXJsfpL1vdt1tW7PnmZou0JbmKQjBHnp62ZrCDdtqj2IEA
         Np6D7cjv8U7RSZyHLXtWsDuNyOVKmdldOclcfUiZgFMJmFFXI8j5P5eos4CH/92fYf
         HuCM5eC1yOz4ftXxDl0BHN0nE5lciYqRV4VwP6ak=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B8EB468997
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, rnayak@codeaurora.org,
        Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH RFC 09/14] drivers: pinctrl: msm: fix use of deprecated gpiolib APIs
Date:   Thu, 29 Aug 2019 12:11:58 -0600
Message-Id: <20190829181203.2660-10-ilina@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829181203.2660-1-ilina@codeaurora.org>
References: <20190829181203.2660-1-ilina@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace gpiochip_irqchip_add() and gpiochip_set_chained_irqchip() calls
by populating the gpio_irq_chip data structures instead.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 7f35c196bb3e..76e8528e4d0a 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1027,7 +1027,19 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	pctrl->irq_chip.irq_request_resources = msm_gpio_irq_reqres;
 	pctrl->irq_chip.irq_release_resources = msm_gpio_irq_relres;
 
-	ret = gpiochip_add_data(&pctrl->chip, pctrl);
+	chip->irq.chip = &pctrl->irq_chip;
+	chip->irq.default_type = IRQ_TYPE_NONE;
+	chip->irq.handler = handle_bad_irq;
+	chip->irq.fwnode = pctrl->dev->fwnode;
+	chip->irq.parent_handler = msm_gpio_irq_handler;
+	chip->irq.num_parents = 1;
+	chip->irq.parents = devm_kcalloc(pctrl->dev, 1,
+					 sizeof(*chip->irq.parents),
+					 GFP_KERNEL);
+	if (!chip->irq.parents)
+		return -ENOMEM;
+
+	ret = devm_gpiochip_add_data(pctrl->dev, chip, pctrl);
 	if (ret) {
 		dev_err(pctrl->dev, "Failed register gpiochip\n");
 		return ret;
@@ -1053,20 +1065,6 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 		}
 	}
 
-	ret = gpiochip_irqchip_add(chip,
-				   &pctrl->irq_chip,
-				   0,
-				   handle_edge_irq,
-				   IRQ_TYPE_NONE);
-	if (ret) {
-		dev_err(pctrl->dev, "Failed to add irqchip to gpiochip\n");
-		gpiochip_remove(&pctrl->chip);
-		return -ENOSYS;
-	}
-
-	gpiochip_set_chained_irqchip(chip, &pctrl->irq_chip, pctrl->irq,
-				     msm_gpio_irq_handler);
-
 	return 0;
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

