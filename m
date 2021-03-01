Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE4E53275E9
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Mar 2021 02:44:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbhCABo0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Feb 2021 20:44:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbhCABoY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Feb 2021 20:44:24 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7FEC061788
        for <linux-gpio@vger.kernel.org>; Sun, 28 Feb 2021 17:43:44 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id u18so2706647plc.12
        for <linux-gpio@vger.kernel.org>; Sun, 28 Feb 2021 17:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=re5cneH5LwtASkkb/0TTV6Xt6BX2mOBhYFKz8Fn5mZk=;
        b=m3rwZ2wcH4mVG8aT8rSFmFWQcRo8Ry1I7h3d9X+MFtd+MPew3Tiuflom0cGALa5StK
         SDIX4kwPNrj/0YYKxJxXQBbOiukdUUgEd7AlBGnoqAVtUJFmN8ThUdQdbCEXeKXARgDP
         jnU+w6Xvc5H2AkA3pc985TwnffmiTtbq+GWpTr4ZucndpoFoEYL+GeACvTcab9xs4Oju
         N0x6pzg3IF7JONuXVI1ocuWtWIjr83cIYnaDcrPpDDJZ8JklokGqfYMqH5h11sn+OYA2
         Ne17XjB8ScLWyxLoF+eO9Ca/ge7cAqYbFkvWddKTAza2kkxTGB6qBUNQng5OzUu4qu5A
         FJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=re5cneH5LwtASkkb/0TTV6Xt6BX2mOBhYFKz8Fn5mZk=;
        b=J3RZDZfNLgOx3BOqHTFKGl3eqwIszU/iFA1uXrpecCspfMiSkkpbt2o1qVNRi3Ji6I
         MfNT3+AO1Wf9+J3tdXfcoP/e31J3JGUJ3VBRRD1Lb/brGs8BL8DpyXOciFMjs98xFEfW
         W6rocRqIX7jgRROe+1vcWoy12kZpntWfx2POjplMy5mI/+3VsQgApSHE9IJ2tElxOP8U
         NXD9Y+O1gQ04uBGGjo8gQOPLa5TQkcs6VSGVV/WMSfh7v1Anyy2CucEA8v77WxsxDEqH
         VRofhWTW+uiE1Yld0y9FM3lxx2zBWk4VfkyZYFkTlBKhRyVDSRwGJuuYJe5UO3FiHxwc
         G5pA==
X-Gm-Message-State: AOAM533FedqfwQGgvsCeBZZ78QxDjT9D4rV4W98Z8vA1zW3pSCpvvKPt
        eK4XBAYexvJEiVkw6xeA74hrMg==
X-Google-Smtp-Source: ABdhPJwKX7pq2bMMM9G6Xb5UrNgu+ahjrdsdzk0sMimihfsX5DD0u824rMpkSfGWFK72TaWN8gBCVQ==
X-Received: by 2002:a17:902:6b06:b029:e3:5edf:c2a1 with SMTP id o6-20020a1709026b06b02900e35edfc2a1mr13493323plk.51.1614563023773;
        Sun, 28 Feb 2021 17:43:43 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id q95sm5641080pjq.20.2021.02.28.17.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 17:43:43 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 1/2] pinctrl: qcom: handle tiles for ACPI boot
Date:   Mon,  1 Mar 2021 09:43:28 +0800
Message-Id: <20210301014329.30104-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210301014329.30104-1-shawn.guo@linaro.org>
References: <20210301014329.30104-1-shawn.guo@linaro.org>
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
 drivers/pinctrl/qcom/pinctrl-msm.c | 18 ++++++++++++++----
 drivers/pinctrl/qcom/pinctrl-msm.h |  1 +
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 40256663264f..2526f299bdce 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2013, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/io.h>
@@ -1399,6 +1400,7 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 {
 	struct msm_pinctrl *pctrl;
 	struct resource *res;
+	void __iomem *base;
 	int ret;
 	int i;
 
@@ -1415,7 +1417,7 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 
 	raw_spin_lock_init(&pctrl->lock);
 
-	if (soc_data->tiles) {
+	if (soc_data->tiles && !has_acpi_companion(&pdev->dev)) {
 		for (i = 0; i < soc_data->ntiles; i++) {
 			res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 							   soc_data->tiles[i]);
@@ -1425,9 +1427,17 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 		}
 	} else {
 		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		pctrl->regs[0] = devm_ioremap_resource(&pdev->dev, res);
-		if (IS_ERR(pctrl->regs[0]))
-			return PTR_ERR(pctrl->regs[0]);
+		base = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+
+		if (soc_data->tiles) {
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

