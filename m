Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7F532C7AC
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244083AbhCDAcc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:32:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380341AbhCCN3m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 08:29:42 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1505DC061225
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 05:26:34 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id u18so7846397plc.12
        for <linux-gpio@vger.kernel.org>; Wed, 03 Mar 2021 05:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=maMPLvANosgrYXfleNw2KezYU5GopvAbj7n4eI0AXJo=;
        b=HuI0vBnp6+7MEaHvxNDPYWOGA3vmjF5IhGt2Df7AwIxK1LTd4czI6kuCC3RrAdH58r
         igJvaexKKCVc4fnzeM/IccWYsw4woZwOeVCHMVnFZQR/pUMDtEDWJHDnavH2Vj8MW6pg
         o6zxl3oaJQxunRZZrjS2/JnIO9nffA1gdbc0rGBeHlLpqnaIOWJdpa5U0vudmP9xDQCg
         kdxZFC62uMI0VNOGli86hsfdY6g80tPCVgsqyIpuGvqnZrEN7nAYvprjrvvIOTDMKVyU
         T3dx1T8UKpZXSN10/JHEKAu8XySstobPoCRtv7Nz/l5BnVe8ZxQMrVVVQMhEW6oX0wep
         T1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=maMPLvANosgrYXfleNw2KezYU5GopvAbj7n4eI0AXJo=;
        b=osRee20pytyv6M1j8AL7nIKbjqxQj9jaQWED+W/zh+C1Qn8PjPDDeIi7tZERo/tvjE
         Xt5fmN30CQmlvHLHWB8UMt/aKYQYLQh3nfoASwXFjsZVHEna31SXhxk0Da7jpYXQ3w//
         2X6MR8t0SPC1PdA0HNC9O1c1ih32ldUbuKQp+peLP51mNKOu10KaPWDZHukeioDLqkYC
         fFSbQ8AHprKV3cjPImPkS1d3jrg8ZI/x7cdkNWbOJTcFS6Z2hMHwVfC6TkuFzSn1KYxu
         jvKXsEc77NALkXUpsxdFkBwUxtWfHtfeNdiuhYaaxo6PzgtIs7zx9ScWEHdyQ0RiaY+s
         WWRA==
X-Gm-Message-State: AOAM530RXRS4xaXZxYiQ6+NKtmtmk3VcE5pw3vGSf5wW5wV88WwTYswH
        cglCp/W/Q+IwI/9PqeiNmcbpVw==
X-Google-Smtp-Source: ABdhPJygHQyIB6VqqEcNEMhUPxgw49z8OAmZMWX5IvTxAdw8YZcNkAL0WiRetK57D3KBfItLfUYr/A==
X-Received: by 2002:a17:902:464:b029:e2:ebb4:9251 with SMTP id 91-20020a1709020464b02900e2ebb49251mr2745367ple.29.1614777993667;
        Wed, 03 Mar 2021 05:26:33 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id y20sm24425044pfo.210.2021.03.03.05.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 05:26:33 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 1/2] pinctrl: qcom: handle tiles for ACPI boot
Date:   Wed,  3 Mar 2021 21:26:21 +0800
Message-Id: <20210303132622.4115-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210303132622.4115-1-shawn.guo@linaro.org>
References: <20210303132622.4115-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It's not always the case that DT and ACPI describe hardware resource in
the same schema, even for a single platform.  For example, on SC8180X,
DT uses the tiles schema while ACPI describe memory resource as a single
region.  It patches msm_pinctrl_probe() function to map tiles regions
only for DT.  While for ACPI, it maps the single memory resource and
calculate tile bases with offsets passed from SoC data.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 27 +++++++++++++++++++++++----
 drivers/pinctrl/qcom/pinctrl-msm.h |  1 +
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index d70caecd21d2..af6ed7f43058 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2013, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/io.h>
@@ -1396,6 +1397,7 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 {
 	struct msm_pinctrl *pctrl;
 	struct resource *res;
+	void __iomem *base;
 	int ret;
 	int i;
 
@@ -1412,7 +1414,8 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 
 	raw_spin_lock_init(&pctrl->lock);
 
-	if (soc_data->tiles) {
+	if (soc_data->tiles && !has_acpi_companion(&pdev->dev)) {
+		/* DT boot with multiple tile resources */
 		for (i = 0; i < soc_data->ntiles; i++) {
 			res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 							   soc_data->tiles[i]);
@@ -1421,10 +1424,26 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 				return PTR_ERR(pctrl->regs[i]);
 		}
 	} else {
+		/*
+		 * DT boot with one single resource or ACPI boot (always
+		 * one memory resource in DSDT)
+		 */
 		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		pctrl->regs[0] = devm_ioremap_resource(&pdev->dev, res);
-		if (IS_ERR(pctrl->regs[0]))
-			return PTR_ERR(pctrl->regs[0]);
+		base = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+
+		if (soc_data->tiles) {
+			/*
+			 * ACPI boot with SoC driver using titles like
+			 * pinctrl-sc8180x.
+			 */
+			for (i = 0; i < soc_data->ntiles; i++)
+				pctrl->regs[i] = base +
+						 soc_data->tile_offsets[i];
+		} else {
+			pctrl->regs[0] = base;
+		}
 
 		pctrl->phys_base[0] = res->start;
 	}
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index e31a5167c91e..91333942d53c 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -131,6 +131,7 @@ struct msm_pinctrl_soc_data {
 	bool pull_no_keeper;
 	const char *const *tiles;
 	unsigned int ntiles;
+	const u32 *tile_offsets;
 	const int *reserved_gpios;
 	const struct msm_gpio_wakeirq_map *wakeirq_map;
 	unsigned int nwakeirq_map;
-- 
2.17.1

