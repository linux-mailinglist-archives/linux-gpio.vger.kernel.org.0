Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF3034BE45
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Mar 2021 20:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231308AbhC1Sbb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Mar 2021 14:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhC1SbN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Mar 2021 14:31:13 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B448C061756
        for <linux-gpio@vger.kernel.org>; Sun, 28 Mar 2021 11:31:13 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id g15so10436180qkl.4
        for <linux-gpio@vger.kernel.org>; Sun, 28 Mar 2021 11:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5Q1MlGPc2yU9CGm4dEHwkWVivbKD4LZDpmBT9hFu1d4=;
        b=aQnYao5F9f+pvECDkho0WhobE0ZTzBhAhX57qyhpjRpYM/0fNN+pHDGK0L5/VQLRj2
         RG7x2rK29EbGr2Mp2BgPtQD38wYxFRcPiihr7ya8vV1SH4teXaYUSwEwS3pRBZhaaV9w
         clBv2fxcu3Hh8H+LZVYfpMB3nOo7M8+moSehHDCCrZE4M8M9uON9jNE5SSBZbITUJmGm
         cuaAanus7v6VBuoP3m5g/ErVaxkF9srQjVWbSBGiGQ4CZH5Mnc1aO7mfIVT3Br4N2sSg
         Eyc9RsGuSrdw/HbU4Uz48yaDFDw1BiKty7J7c+ZeJsn9qLfz2F2bpfBailsVhns48uo8
         0I5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5Q1MlGPc2yU9CGm4dEHwkWVivbKD4LZDpmBT9hFu1d4=;
        b=l/8TdNYE4K2px3F3B0u6BamAFAMYTHN0vgIGCJptxauwBUtV1nv/JetEPTlzyugbRQ
         sSU6rDy5MH+idmICczaC8mnT+EnLlA68jR7aAR17mTieDVGT10Zgq62td/Tc4HFagSn2
         FxqomJS7i2sg5gRzz+762eA+fj8j3Y+v2BjuaF8PYdlVoI7s72vTCuuPrKrWBbdTcIAK
         PIYR/fp8tqJsirK4XomsM5lweWj5W5x5kbR6VGgfIC5CeLm5g0Tb+hL2PvDzTazM14Iu
         sJO3JXlTet3v0LsxI6WGlZn5kdsGagTo35flCFSV3Bv6+VEHp4P/RuMuUOrnUrZpKyWF
         ME3w==
X-Gm-Message-State: AOAM530JnkxYzaQ/nLApvi8ZR31V4esEEK3+MA9XINxxtXuyUVhuQOhB
        6y0n1ao0vsPB9VyWEBG9cio=
X-Google-Smtp-Source: ABdhPJxyaHXF0bYTWFDc1OogEU+jj3DLZ74bNkspx3I2rYrITnkv+E3gEnXTLIbJq1H7bMnND/oJYA==
X-Received: by 2002:a37:638f:: with SMTP id x137mr21745067qkb.199.1616956272644;
        Sun, 28 Mar 2021 11:31:12 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:919:7898:56c:200:f2a5])
        by smtp.gmail.com with ESMTPSA id g186sm11831801qke.0.2021.03.28.11.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 11:31:11 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     linus.walleij@linaro.org
Cc:     linux-imx@nxp.com, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/2] pinctrl: imx: Remove unneeded of_match_ptr()
Date:   Sun, 28 Mar 2021 15:30:33 -0300
Message-Id: <20210328183034.555702-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

i.MX is a DT-only platform, so of_match_ptr() can be safely
removed.

Remove the unneeded of_match_ptr().

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/pinctrl/freescale/pinctrl-imx25.c   | 2 +-
 drivers/pinctrl/freescale/pinctrl-imx27.c   | 2 +-
 drivers/pinctrl/freescale/pinctrl-imx50.c   | 2 +-
 drivers/pinctrl/freescale/pinctrl-imx6sll.c | 2 +-
 drivers/pinctrl/freescale/pinctrl-imx6sx.c  | 2 +-
 drivers/pinctrl/freescale/pinctrl-imx6ul.c  | 2 +-
 drivers/pinctrl/freescale/pinctrl-imx7d.c   | 2 +-
 drivers/pinctrl/freescale/pinctrl-imx7ulp.c | 2 +-
 drivers/pinctrl/freescale/pinctrl-imx8dxl.c | 2 +-
 drivers/pinctrl/freescale/pinctrl-imx8mm.c  | 2 +-
 drivers/pinctrl/freescale/pinctrl-imx8mn.c  | 2 +-
 drivers/pinctrl/freescale/pinctrl-imx8mp.c  | 2 +-
 drivers/pinctrl/freescale/pinctrl-imx8mq.c  | 2 +-
 drivers/pinctrl/freescale/pinctrl-imx8qm.c  | 2 +-
 drivers/pinctrl/freescale/pinctrl-imx8qxp.c | 2 +-
 15 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx25.c b/drivers/pinctrl/freescale/pinctrl-imx25.c
index a899a398b6bb..d7acd532ca8c 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx25.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx25.c
@@ -323,7 +323,7 @@ static int imx25_pinctrl_probe(struct platform_device *pdev)
 static struct platform_driver imx25_pinctrl_driver = {
 	.driver = {
 		.name = "imx25-pinctrl",
-		.of_match_table = of_match_ptr(imx25_pinctrl_of_match),
+		.of_match_table = imx25_pinctrl_of_match,
 	},
 	.probe = imx25_pinctrl_probe,
 };
diff --git a/drivers/pinctrl/freescale/pinctrl-imx27.c b/drivers/pinctrl/freescale/pinctrl-imx27.c
index b4dfc1676cbc..e87e7798e89d 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx27.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx27.c
@@ -396,7 +396,7 @@ static int imx27_pinctrl_probe(struct platform_device *pdev)
 static struct platform_driver imx27_pinctrl_driver = {
 	.driver = {
 		.name = "imx27-pinctrl",
-		.of_match_table = of_match_ptr(imx27_pinctrl_of_match),
+		.of_match_table = imx27_pinctrl_of_match,
 	},
 	.probe = imx27_pinctrl_probe,
 };
diff --git a/drivers/pinctrl/freescale/pinctrl-imx50.c b/drivers/pinctrl/freescale/pinctrl-imx50.c
index cf182c040e0b..7069a2fcd10a 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx50.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx50.c
@@ -399,7 +399,7 @@ static int imx50_pinctrl_probe(struct platform_device *pdev)
 static struct platform_driver imx50_pinctrl_driver = {
 	.driver = {
 		.name = "imx50-pinctrl",
-		.of_match_table = of_match_ptr(imx50_pinctrl_of_match),
+		.of_match_table = imx50_pinctrl_of_match,
 	},
 	.probe = imx50_pinctrl_probe,
 };
diff --git a/drivers/pinctrl/freescale/pinctrl-imx6sll.c b/drivers/pinctrl/freescale/pinctrl-imx6sll.c
index 0618f4d887fd..dfefcecbe072 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx6sll.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx6sll.c
@@ -345,7 +345,7 @@ static int imx6sll_pinctrl_probe(struct platform_device *pdev)
 static struct platform_driver imx6sll_pinctrl_driver = {
 	.driver = {
 		.name = "imx6sll-pinctrl",
-		.of_match_table = of_match_ptr(imx6sll_pinctrl_of_match),
+		.of_match_table = imx6sll_pinctrl_of_match,
 		.suppress_bind_attrs = true,
 	},
 	.probe = imx6sll_pinctrl_probe,
diff --git a/drivers/pinctrl/freescale/pinctrl-imx6sx.c b/drivers/pinctrl/freescale/pinctrl-imx6sx.c
index c7e2b1f94f01..594185745029 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx6sx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx6sx.c
@@ -382,7 +382,7 @@ static int imx6sx_pinctrl_probe(struct platform_device *pdev)
 static struct platform_driver imx6sx_pinctrl_driver = {
 	.driver = {
 		.name = "imx6sx-pinctrl",
-		.of_match_table = of_match_ptr(imx6sx_pinctrl_of_match),
+		.of_match_table = imx6sx_pinctrl_of_match,
 	},
 	.probe = imx6sx_pinctrl_probe,
 };
diff --git a/drivers/pinctrl/freescale/pinctrl-imx6ul.c b/drivers/pinctrl/freescale/pinctrl-imx6ul.c
index 7e37627c63f5..3c62bb38e551 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx6ul.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx6ul.c
@@ -342,7 +342,7 @@ static int imx6ul_pinctrl_probe(struct platform_device *pdev)
 static struct platform_driver imx6ul_pinctrl_driver = {
 	.driver = {
 		.name = "imx6ul-pinctrl",
-		.of_match_table = of_match_ptr(imx6ul_pinctrl_of_match),
+		.of_match_table = imx6ul_pinctrl_of_match,
 	},
 	.probe = imx6ul_pinctrl_probe,
 };
diff --git a/drivers/pinctrl/freescale/pinctrl-imx7d.c b/drivers/pinctrl/freescale/pinctrl-imx7d.c
index 369d3e59fdd6..38cbad3dba3a 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx7d.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx7d.c
@@ -386,7 +386,7 @@ static int imx7d_pinctrl_probe(struct platform_device *pdev)
 static struct platform_driver imx7d_pinctrl_driver = {
 	.driver = {
 		.name = "imx7d-pinctrl",
-		.of_match_table = of_match_ptr(imx7d_pinctrl_of_match),
+		.of_match_table = imx7d_pinctrl_of_match,
 	},
 	.probe = imx7d_pinctrl_probe,
 };
diff --git a/drivers/pinctrl/freescale/pinctrl-imx7ulp.c b/drivers/pinctrl/freescale/pinctrl-imx7ulp.c
index 922ff73c7087..1915378d92b2 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx7ulp.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx7ulp.c
@@ -303,7 +303,7 @@ static int imx7ulp_pinctrl_probe(struct platform_device *pdev)
 static struct platform_driver imx7ulp_pinctrl_driver = {
 	.driver = {
 		.name = "imx7ulp-pinctrl",
-		.of_match_table = of_match_ptr(imx7ulp_pinctrl_of_match),
+		.of_match_table = imx7ulp_pinctrl_of_match,
 		.suppress_bind_attrs = true,
 	},
 	.probe = imx7ulp_pinctrl_probe,
diff --git a/drivers/pinctrl/freescale/pinctrl-imx8dxl.c b/drivers/pinctrl/freescale/pinctrl-imx8dxl.c
index d3020c0cd55d..041455c13d0d 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8dxl.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8dxl.c
@@ -184,7 +184,7 @@ static int imx8dxl_pinctrl_probe(struct platform_device *pdev)
 static struct platform_driver imx8dxl_pinctrl_driver = {
 	.driver = {
 		.name = "fsl,imx8dxl-iomuxc",
-		.of_match_table = of_match_ptr(imx8dxl_pinctrl_of_match),
+		.of_match_table = imx8dxl_pinctrl_of_match,
 		.suppress_bind_attrs = true,
 	},
 	.probe = imx8dxl_pinctrl_probe,
diff --git a/drivers/pinctrl/freescale/pinctrl-imx8mm.c b/drivers/pinctrl/freescale/pinctrl-imx8mm.c
index 31c5d8861406..39dc73281ce6 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8mm.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8mm.c
@@ -337,7 +337,7 @@ static int imx8mm_pinctrl_probe(struct platform_device *pdev)
 static struct platform_driver imx8mm_pinctrl_driver = {
 	.driver = {
 		.name = "imx8mm-pinctrl",
-		.of_match_table = of_match_ptr(imx8mm_pinctrl_of_match),
+		.of_match_table = imx8mm_pinctrl_of_match,
 		.suppress_bind_attrs = true,
 	},
 	.probe = imx8mm_pinctrl_probe,
diff --git a/drivers/pinctrl/freescale/pinctrl-imx8mn.c b/drivers/pinctrl/freescale/pinctrl-imx8mn.c
index 14c9deb51fec..448a79eb4568 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8mn.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8mn.c
@@ -337,7 +337,7 @@ static int imx8mn_pinctrl_probe(struct platform_device *pdev)
 static struct platform_driver imx8mn_pinctrl_driver = {
 	.driver = {
 		.name = "imx8mn-pinctrl",
-		.of_match_table = of_match_ptr(imx8mn_pinctrl_of_match),
+		.of_match_table = imx8mn_pinctrl_of_match,
 		.suppress_bind_attrs = true,
 	},
 	.probe = imx8mn_pinctrl_probe,
diff --git a/drivers/pinctrl/freescale/pinctrl-imx8mp.c b/drivers/pinctrl/freescale/pinctrl-imx8mp.c
index bf4bbb5e2446..0cacf5ba162c 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8mp.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8mp.c
@@ -335,7 +335,7 @@ static int imx8mp_pinctrl_probe(struct platform_device *pdev)
 static struct platform_driver imx8mp_pinctrl_driver = {
 	.driver = {
 		.name = "imx8mp-pinctrl",
-		.of_match_table = of_match_ptr(imx8mp_pinctrl_of_match),
+		.of_match_table = imx8mp_pinctrl_of_match,
 	},
 	.probe = imx8mp_pinctrl_probe,
 };
diff --git a/drivers/pinctrl/freescale/pinctrl-imx8mq.c b/drivers/pinctrl/freescale/pinctrl-imx8mq.c
index ae3ea5b5c204..3ed3c98bcedb 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8mq.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8mq.c
@@ -340,7 +340,7 @@ static int imx8mq_pinctrl_probe(struct platform_device *pdev)
 static struct platform_driver imx8mq_pinctrl_driver = {
 	.driver = {
 		.name = "imx8mq-pinctrl",
-		.of_match_table = of_match_ptr(imx8mq_pinctrl_of_match),
+		.of_match_table = imx8mq_pinctrl_of_match,
 		.pm = &imx_pinctrl_pm_ops,
 		.suppress_bind_attrs = true,
 	},
diff --git a/drivers/pinctrl/freescale/pinctrl-imx8qm.c b/drivers/pinctrl/freescale/pinctrl-imx8qm.c
index 8f46b9404cd7..2e2d30dc13f7 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8qm.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8qm.c
@@ -317,7 +317,7 @@ static int imx8qm_pinctrl_probe(struct platform_device *pdev)
 static struct platform_driver imx8qm_pinctrl_driver = {
 	.driver = {
 		.name = "imx8qm-pinctrl",
-		.of_match_table = of_match_ptr(imx8qm_pinctrl_of_match),
+		.of_match_table = imx8qm_pinctrl_of_match,
 		.suppress_bind_attrs = true,
 	},
 	.probe = imx8qm_pinctrl_probe,
diff --git a/drivers/pinctrl/freescale/pinctrl-imx8qxp.c b/drivers/pinctrl/freescale/pinctrl-imx8qxp.c
index 6776ad6a3a27..4f97813ba8b7 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8qxp.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8qxp.c
@@ -223,7 +223,7 @@ static int imx8qxp_pinctrl_probe(struct platform_device *pdev)
 static struct platform_driver imx8qxp_pinctrl_driver = {
 	.driver = {
 		.name = "imx8qxp-pinctrl",
-		.of_match_table = of_match_ptr(imx8qxp_pinctrl_of_match),
+		.of_match_table = imx8qxp_pinctrl_of_match,
 		.suppress_bind_attrs = true,
 	},
 	.probe = imx8qxp_pinctrl_probe,
-- 
2.25.1

