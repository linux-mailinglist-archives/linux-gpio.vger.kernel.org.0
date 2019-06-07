Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8DED38640
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2019 10:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727839AbfFGI3m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 04:29:42 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41388 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727939AbfFGI3J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 04:29:09 -0400
Received: by mail-wr1-f68.google.com with SMTP id c2so1222156wrm.8
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2019 01:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ixa6PZM7Qd3yNTQ1/2lb9UJukHzNBYD4+3OM8ec4OSs=;
        b=wikC+rZdUqNR3zYa4TZ+AvztWEikBNz5wbZm7r65rxsnDyDgTfXlcYq+WBYqLs5jOj
         hr74PKupzOhMt9dxYf6nfiWkRnedKpch2Vvd51AjOYuHM9Sd+qNyIws2b/VS4SqYvvW/
         TVZsTX7wKv/zNdLjvgeu61VENnYiQR4EMDVwBn+sbW6KBtD/NpmwstvwzEddF2SEOiu1
         O1VU/WvDqteNLlGZQDiR725yriDo+UadwNwdtidpPyKmw4jNY53RybTW4UkDYFMuPBPk
         ZF3ChktwCFp49vXoN989jLPXyfMlgOlk9DRIVrUTXbWabbEqSsLw0HnmNMNlGZaZd+n7
         m4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ixa6PZM7Qd3yNTQ1/2lb9UJukHzNBYD4+3OM8ec4OSs=;
        b=fFJ7fNlbfcsfonAtDAYqxAqMyTyfyr1R7kEO51yz+KGHe9t1iogUUlh9xyhN1wXBwB
         XKl6dwM5h+MSkQ0RZt3OVKr8MjkPYNMVLxgUSTLcrKwGnLGm/NuJ64vuKyi6V971utJk
         uEicoa9LGm6ruuDc7o1kRClNXuO0pjBeynT7lU+WQWj+1MevPbq1qMK8ZIrnyOuci6NL
         qR6Gl+Dzn5A/h06A+2Qx1G9CdVE5f2KdRpp5OfeORBhxA0Rc7E7r/0r3VELAWppK23vU
         QunnKgfu0aPAuaLDuexZ7nXpbwPLix3f+de/NHAQxNoUxTlGQc9bwxCtPacL+8TkvGcm
         u7BQ==
X-Gm-Message-State: APjAAAVPQaCtAQ7w1Oy5Ym8KDP00/uXgukH7DnrQcJoIU8t431ouPYvf
        6WGkrFJ7fpZP5I5/eLJFXm7F8g==
X-Google-Smtp-Source: APXvYqyChDV4RwAoziCux2dyzIiqJh49IzYKRL5KUJXCLJZjX/vcFT6zQy7kquy2uTSLwjq9N/DShA==
X-Received: by 2002:adf:ab11:: with SMTP id q17mr18952194wrc.182.1559896148016;
        Fri, 07 Jun 2019 01:29:08 -0700 (PDT)
Received: from localhost.localdomain ([2.31.167.229])
        by smtp.gmail.com with ESMTPSA id a3sm1092946wmb.35.2019.06.07.01.29.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 01:29:07 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 5/8] soc: qcom: geni: Add support for ACPI
Date:   Fri,  7 Jun 2019 09:28:58 +0100
Message-Id: <20190607082901.6491-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190607082901.6491-1-lee.jones@linaro.org>
References: <20190607082901.6491-1-lee.jones@linaro.org>
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

