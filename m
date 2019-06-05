Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0E5035BDF
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2019 13:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727953AbfFELqU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jun 2019 07:46:20 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39847 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727508AbfFELnM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jun 2019 07:43:12 -0400
Received: by mail-wm1-f67.google.com with SMTP id z23so1925761wma.4
        for <linux-gpio@vger.kernel.org>; Wed, 05 Jun 2019 04:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ixa6PZM7Qd3yNTQ1/2lb9UJukHzNBYD4+3OM8ec4OSs=;
        b=Jp/JdV2yn/wqzzWfOfRwb4FDVYCujOYkpzb+HCTUS8NJcsoL4RrGPGuKPM8+By8ldP
         jPZZn5cDvQZM4hPjpBYEHrh/IeOX0Z7r4dvWciU3vsimgp8YD0BNAI+Gw25gu1z4Gz8Y
         D3ui/SE5BXLU3wep3K6tbv585rzPvuk4KGIyNY5pTZ73EYHFKqL0ETq7VHveP0ik1XbP
         vRjdeVso0R3Qf3fg30cUV1JGbZ9rPnx5URfNBjQnyBqMB1vL7SrpnuPWfhxvEodve6a9
         nxKo++m195buCgkzC5hyYHqa6Y2fqKDvoQRgatziZq1/c9ycvazbtDPQschW4lFDaiTC
         3eXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ixa6PZM7Qd3yNTQ1/2lb9UJukHzNBYD4+3OM8ec4OSs=;
        b=rg8InwHw8uqUa5nEhe0qRmTBaZ6/xCON7Roj/Mss/KfufWpxcc5lpt2ihlNor3fMJF
         NImixrBfGe9MPjGHUZL8i9gclwokaD7fwIiiMT4XwZUR1ZOP8z9UFfgXf4H035UXmY/e
         5HdsjXU6X+n3Lz/NPekA2ZXSNgkRcc81RCq2cPziX/dHz5Ftetzf37D76RzWtQ9rFyqz
         vdgPqfagL6xm30b5ZFqRvB+fDvZqrbtqT+N2indca4IBBhN5gV/m8ZvDxECHMEtZbMOZ
         XbUXRbs4NIxaRnbKAhM1BJRLIoe6saXn75Wu9PJYFaurMiS68RwkS6v128ZB2HXxlHId
         EjeA==
X-Gm-Message-State: APjAAAVz3UqrPUADmMus2OGnOwpWn7cY9D+m4TfiGA1FGqiQXX48SdFR
        pOwz+Wy6hgEcvZlpa828O7ry0g==
X-Google-Smtp-Source: APXvYqyl2gwOWbUGVEnYEh9X8OzB/jrJfkYNgjV/h4onDE5kOB10EdAyUcgxHPRB9QKTfy4UfkQugg==
X-Received: by 2002:a1c:e3c1:: with SMTP id a184mr1175742wmh.24.1559734991651;
        Wed, 05 Jun 2019 04:43:11 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id 34sm27718740wre.32.2019.06.05.04.43.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 04:43:11 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 5/8] soc: qcom: geni: Add support for ACPI
Date:   Wed,  5 Jun 2019 12:42:59 +0100
Message-Id: <20190605114302.22509-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190605114302.22509-1-lee.jones@linaro.org>
References: <20190605114302.22509-1-lee.jones@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When booting with ACPI as the active set of configuration tables,
all; clocks, regulators, pin functions ect are expected to be at
their ideal values/levels/rates, thus the associated frameworks
are unavailable.  Ensure calls to these APIs are shielded when
ACPI is enabled.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/soc/qcom/qcom-geni-se.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 6b8ef01472e9..cff0a413e59a 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/slab.h>
 #include <linux/dma-mapping.h>
@@ -450,6 +451,9 @@ int geni_se_resources_off(struct geni_se *se)
 {
 	int ret;
 
+	if (ACPI_HANDLE(se->dev))
+		return 0;
+
 	ret = pinctrl_pm_select_sleep_state(se->dev);
 	if (ret)
 		return ret;
@@ -487,6 +491,9 @@ int geni_se_resources_on(struct geni_se *se)
 {
 	int ret;
 
+	if (ACPI_HANDLE(se->dev))
+		return 0;
+
 	ret = geni_se_clks_on(se);
 	if (ret)
 		return ret;
@@ -724,12 +731,14 @@ static int geni_se_probe(struct platform_device *pdev)
 	if (IS_ERR(wrapper->base))
 		return PTR_ERR(wrapper->base);
 
-	wrapper->ahb_clks[0].id = "m-ahb";
-	wrapper->ahb_clks[1].id = "s-ahb";
-	ret = devm_clk_bulk_get(dev, NUM_AHB_CLKS, wrapper->ahb_clks);
-	if (ret) {
-		dev_err(dev, "Err getting AHB clks %d\n", ret);
-		return ret;
+	if (!ACPI_HANDLE(&pdev->dev)) {
+		wrapper->ahb_clks[0].id = "m-ahb";
+		wrapper->ahb_clks[1].id = "s-ahb";
+		ret = devm_clk_bulk_get(dev, NUM_AHB_CLKS, wrapper->ahb_clks);
+		if (ret) {
+			dev_err(dev, "Err getting AHB clks %d\n", ret);
+			return ret;
+		}
 	}
 
 	dev_set_drvdata(dev, wrapper);
-- 
2.17.1

