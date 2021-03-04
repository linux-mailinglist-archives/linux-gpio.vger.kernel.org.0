Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6B9432CC4D
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 07:07:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233603AbhCDGGR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 01:06:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233609AbhCDGGP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 01:06:15 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2301C06175F
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 22:05:34 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id d12so15604465pfo.7
        for <linux-gpio@vger.kernel.org>; Wed, 03 Mar 2021 22:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Z8RUAsOxRMOpgK0k+D8Q9aGesIbnggJxLwFflwjLlcE=;
        b=it9UPNgFAIzPg4fVSgc7O0kA3WSkr3mcFUJUgL3CdAk9vcpuQS0aL4SNlGWFypGHmB
         Ndd3pKGbZiUntLVpDtHZ8A98VfzEw/Dg7E2yhsms5Cb9nNFYY6ygUAE5I3fhStVUNcdL
         d5RgQ/Ax9KBxnbPrnlXjh09DgithJCw9Ih4WIj3FVINHffzuNPejqTKmI2TJz6a/vIpB
         X54TwDc0LSp/PRXIlMYkVXfe+ygaiS3Vz4u/Pie0Sn+Ak8vishj1v/pCmA0wfirTSIlo
         xct19DLrL2Kk6yAUn7w5bo8a96KRz3iYoZizwrDSPltIfzA8jlYjzVMMpNe0SCpVG0iz
         cguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Z8RUAsOxRMOpgK0k+D8Q9aGesIbnggJxLwFflwjLlcE=;
        b=oXkIK8jXQmCL/qkFYM1OOFCD8DvLBibgQ7E6xLuMNLx2hEqQBsGL/S+T+GDjwyuzb7
         pXRCZsyai2KdQKi6v6IZnes3MoYC5v8KwwGkWzuBPvYqpE6waIwylXvSXMOHlmISSTQa
         LTsrHChwxn+XGfe1Si3yNypQvhsMhA3wH2em+Kj+y+hIFHPA1g8E3edYNoznL0hEA/0d
         gYKCsBzXVrj6OuhAwb7z79teQAZ7iVBH1yiLx/AQGGoIblN91GX4LmQbtBgWKIxPPfb/
         4mfYciGIYPIvsiGeiBgiKAMIaFCKyR+zqNXdF8kLvNa4jQCFoT3mKxFkPoZ/14iQDGct
         HKNQ==
X-Gm-Message-State: AOAM533cZqO6v/6eoFZBhul7e/9ypTCZbRBgTcT4L9a2Pj1TwVV/f3gG
        yq5J+/aWY/a3dPkH18dsq6sW8Q==
X-Google-Smtp-Source: ABdhPJyreUBTtF030QQECYO3aAtKwXhfu5J12DNEA44oSodIQR88JnlIxhZOGWZV+zLQWLmgE4VvJw==
X-Received: by 2002:aa7:808d:0:b029:1ed:993c:3922 with SMTP id v13-20020aa7808d0000b02901ed993c3922mr2522172pff.75.1614837934575;
        Wed, 03 Mar 2021 22:05:34 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id j2sm776386pgh.39.2021.03.03.22.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 22:05:34 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v3 1/2] pinctrl: qcom: sc8180x: drop the use of tiles
Date:   Thu,  4 Mar 2021 14:05:19 +0800
Message-Id: <20210304060520.24975-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210304060520.24975-1-shawn.guo@linaro.org>
References: <20210304060520.24975-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

To support both ACPI and DT, it makes more sense to not use tiles for
pinctrl-sc8180x driver, as ACPI table describes TLMM block with one
single memory resource.  Since DTS of SC8180X hasn't landed, there is
still chance to align DT description with ACPI.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-sc8180x.c | 41 +++++++++-----------------
 1 file changed, 14 insertions(+), 27 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc8180x.c b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
index b765bf667574..66f76ed22200 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8180x.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
@@ -11,17 +11,9 @@
 
 #include "pinctrl-msm.h"
 
-static const char * const sc8180x_tiles[] = {
-	"south",
-	"east",
-	"west"
-};
-
-enum {
-	SOUTH,
-	EAST,
-	WEST
-};
+#define WEST	0x00100000
+#define EAST	0x00500000
+#define SOUTH	0x00d00000
 
 #define FUNCTION(fname)					\
 	[msm_mux_##fname] = {				\
@@ -31,7 +23,7 @@ enum {
 	}
 
 #define REG_SIZE 0x1000
-#define PINGROUP_OFFSET(id, _tile, offset, f1, f2, f3, f4, f5, f6, f7, f8, f9)	\
+#define PINGROUP_OFFSET(id, base, offset, f1, f2, f3, f4, f5, f6, f7, f8, f9)	\
 	{						\
 		.name = "gpio" #id,			\
 		.pins = gpio##id##_pins,		\
@@ -49,12 +41,11 @@ enum {
 			msm_mux_##f9			\
 		},					\
 		.nfuncs = 10,				\
-		.ctl_reg = REG_SIZE * id + offset,	\
-		.io_reg = REG_SIZE * id + 0x4 + offset,	\
-		.intr_cfg_reg = REG_SIZE * id + 0x8 + offset,	\
-		.intr_status_reg = REG_SIZE * id + 0xc + offset,\
-		.intr_target_reg = REG_SIZE * id + 0x8 + offset,\
-		.tile = _tile,				\
+		.ctl_reg = base + REG_SIZE * id + offset,		\
+		.io_reg = base + REG_SIZE * id + 0x4 + offset,		\
+		.intr_cfg_reg = base + REG_SIZE * id + 0x8 + offset,	\
+		.intr_status_reg = base + REG_SIZE * id + 0xc + offset,	\
+		.intr_target_reg = base + REG_SIZE * id + 0x8 + offset,	\
 		.mux_bit = 2,				\
 		.pull_bit = 0,				\
 		.drv_bit = 6,				\
@@ -71,20 +62,19 @@ enum {
 		.intr_detection_width = 2,		\
 	}
 
-#define PINGROUP(id, _tile, f1, f2, f3, f4, f5, f6, f7, f8, f9)	\
-	PINGROUP_OFFSET(id, _tile, 0x0, f1, f2, f3, f4, f5, f6, f7, f8, f9)
+#define PINGROUP(id, base, f1, f2, f3, f4, f5, f6, f7, f8, f9)	\
+	PINGROUP_OFFSET(id, base, 0x0, f1, f2, f3, f4, f5, f6, f7, f8, f9)
 
 #define SDC_QDSD_PINGROUP(pg_name, ctl, pull, drv)	\
 	{						\
 		.name = #pg_name,			\
 		.pins = pg_name##_pins,			\
 		.npins = (unsigned int)ARRAY_SIZE(pg_name##_pins),	\
-		.ctl_reg = ctl,				\
+		.ctl_reg = EAST + ctl,			\
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
 		.intr_target_reg = 0,			\
-		.tile = EAST,				\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
@@ -105,12 +95,11 @@ enum {
 		.name = #pg_name,			\
 		.pins = pg_name##_pins,			\
 		.npins = (unsigned int)ARRAY_SIZE(pg_name##_pins),	\
-		.ctl_reg = 0xb6000,			\
-		.io_reg = 0xb6004,			\
+		.ctl_reg = SOUTH + 0xb6000,		\
+		.io_reg = SOUTH + 0xb6004,		\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
 		.intr_target_reg = 0,			\
-		.tile = SOUTH,				\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
 		.drv_bit = 0,				\
@@ -1575,8 +1564,6 @@ static const struct msm_gpio_wakeirq_map sc8180x_pdc_map[] = {
 };
 
 static struct msm_pinctrl_soc_data sc8180x_pinctrl = {
-	.tiles = sc8180x_tiles,
-	.ntiles = ARRAY_SIZE(sc8180x_tiles),
 	.pins = sc8180x_pins,
 	.npins = ARRAY_SIZE(sc8180x_pins),
 	.functions = sc8180x_functions,
-- 
2.17.1

