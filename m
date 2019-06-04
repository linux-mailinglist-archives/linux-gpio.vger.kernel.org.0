Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7840344A4
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2019 12:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727555AbfFDKpb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jun 2019 06:45:31 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33898 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727434AbfFDKpF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jun 2019 06:45:05 -0400
Received: by mail-wr1-f66.google.com with SMTP id e16so7022053wrn.1
        for <linux-gpio@vger.kernel.org>; Tue, 04 Jun 2019 03:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ixa6PZM7Qd3yNTQ1/2lb9UJukHzNBYD4+3OM8ec4OSs=;
        b=SrM3zAvHO7s4r4kfWRb3yKeFRE5PBTe75g4T6jp6QVLZ+DbjYiqMYZ/caaJl2svogL
         Dho1YX4HBmmhcjNwienKNpKLHxULynaK4RwnoYB8aEOifJlkpTWldE/+L9a6CBOW2SBV
         8TY+kVlRP8QzflACyJFTgmXnlx9rJAUzH4CNwmMUfhVqaznt97K1fxCP8/Zawp6/IgVv
         nclsKzImAAkMxU8Y2NicxZ+aWSjqdzGCXD6Uy2EN7XkkhnMLxpGxX+mLyl/mAhj77crl
         3OedRVGkpp68L5HrhDth6eUQCdIJppx09j67O+gWfpNvj+pXqJRqm3HD5nbQBk9OGfYV
         t2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ixa6PZM7Qd3yNTQ1/2lb9UJukHzNBYD4+3OM8ec4OSs=;
        b=JQpIMqjXRgOmZLs11PIlkkGUufYJ9M+l0jp6fStWeLi9fWYjxb6XTegCriSEj1lRUx
         PLlbR7ki0KNZYNeXa4EyQ4r14fEtwmBP+RD6IUt+z1BaaYG6tdoQoXg76ZmU+fRIETQu
         fk/Pp5oT4hcZM1OFumf3a0+mNqdu0Jz8L1077fP7W0Ag/D8VhmZKqTlMCz0EAUeKTpee
         Z4lgaZ7ZT5i+w86WpKpv4cAxFFVbhvfafzkOYwJ0nkugGiV/0bVAclaK11IafRPBoStl
         /gV9j6jTgtVszhNazWbNKSl7B3GATnoOVn0p2P/M6B3hGJDgGoQAkyNpvFsG6MC+/1zk
         yT6w==
X-Gm-Message-State: APjAAAWIUOe3AKffKfBVnEDbQtK8j0Rd4Xz8OH+P3U1Odt9YS2VoyCh2
        FP2DVUiEhJbD4P1K9okw/LwsfQ==
X-Google-Smtp-Source: APXvYqxeY6H93q1Bt0x5h2fNrnGLPGAkTcBxIAddnWtbIbwQwr3Fz5wwwK1XYktubxlpc0VDO1ZA7Q==
X-Received: by 2002:adf:e286:: with SMTP id v6mr6228022wri.340.1559645103884;
        Tue, 04 Jun 2019 03:45:03 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id t140sm2718623wmt.0.2019.06.04.03.45.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 03:45:03 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, kramasub@codeaurora.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 5/8] soc: qcom: geni: Add support for ACPI
Date:   Tue,  4 Jun 2019 11:44:52 +0100
Message-Id: <20190604104455.8877-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604104455.8877-1-lee.jones@linaro.org>
References: <20190604104455.8877-1-lee.jones@linaro.org>
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

