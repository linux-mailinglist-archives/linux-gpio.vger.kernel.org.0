Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13F3334BE44
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Mar 2021 20:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhC1Sbc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Mar 2021 14:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbhC1SbR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Mar 2021 14:31:17 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4702C061756
        for <linux-gpio@vger.kernel.org>; Sun, 28 Mar 2021 11:31:15 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id v70so10438281qkb.8
        for <linux-gpio@vger.kernel.org>; Sun, 28 Mar 2021 11:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uCC1E20nPLbpaWzV+5Z+em38CZvQkmhbnQsaqp5fwlw=;
        b=DluvDjvJXDAziThxzPEtXOVH0wO+B3LcO0tS/FGrZYqQTmNI+XGANKjKDLsyeg7q4b
         YSWyR7rwdlWoDGEtEbIW0aA+W/M5w8BAVnAo9CGPGFWMLpI7fRBCskxanhmtrqvP7/U3
         6q++fxpromzpo7bmKiLfOXSUEP9hnhWAXQ6WMnYEoe68nl5L3vQL71qScS1ao3tXcbEc
         JqJu1ElVzSfigHTegTC4m5P8qbHL/DJWRsnzMPmNPyZqyT/eUto0pNtv/QhpX5TV0f9i
         WB/NXwvzSF2apd1Ut4dKd945PHtCVf17P6tdr4mqi9TeDEalP9n5axLSyXODrp4jci4a
         uBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uCC1E20nPLbpaWzV+5Z+em38CZvQkmhbnQsaqp5fwlw=;
        b=P8RP/xSYvHmAMDI8pkR4tmOJeXtfaTZAOHEP1L8BSTfh7OCXJZU4bjRU4uFJzGPxO+
         +JytTXqh+bJ2DU+aSGK74opbInWTd6NVzgnP3hAaSRPqej1zTWsNoeY8LpDyo2yF+Kkx
         OFEUmGBr5o2A1Gkt883M5+XtYZ95UBf3CD2CQDOMGLY1tRX8R/WEFSGLF8QTcXrpDr9e
         B2aO5Or3spjuMlISqB2PvEgJjY5KBvhDsHh/vQcvlzzQ5iXMDbCI5lw59vvVAc5ETZ6U
         PDLKmnStNjyreEZR8TbdGWA99diLzM3BQvysyUWOwtnIhMBjdrhiudoHiaAQtgP3EHPR
         ndkw==
X-Gm-Message-State: AOAM531oNetG5qN3xd/Xpai1dA5mi0WiN/+taFYIbYx0gTWHT1+dfkOk
        tr8a7Am4g/q1YzknoRNBBW8=
X-Google-Smtp-Source: ABdhPJyEJzPhf/0hI5ti4ai4pqF84MawmB+eoDauTXxW9/CcvmZistQVmGNyi7PtjO14lD3U0yL9/g==
X-Received: by 2002:a37:6887:: with SMTP id d129mr22147385qkc.252.1616956275023;
        Sun, 28 Mar 2021 11:31:15 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:919:7898:56c:200:f2a5])
        by smtp.gmail.com with ESMTPSA id g186sm11831801qke.0.2021.03.28.11.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 11:31:14 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     linus.walleij@linaro.org
Cc:     linux-imx@nxp.com, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] pinctrl: imx: Disallow driver unbind
Date:   Sun, 28 Mar 2021 15:30:34 -0300
Message-Id: <20210328183034.555702-2-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210328183034.555702-1-festevam@gmail.com>
References: <20210328183034.555702-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Performing the 'unbind' operation on pinctrl drivers is
not a sensible usecase, so pass the suppress_bind_attrs
atribute to prevent it.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/pinctrl/freescale/pinctrl-imx1.c   | 1 +
 drivers/pinctrl/freescale/pinctrl-imx25.c  | 1 +
 drivers/pinctrl/freescale/pinctrl-imx27.c  | 1 +
 drivers/pinctrl/freescale/pinctrl-imx35.c  | 1 +
 drivers/pinctrl/freescale/pinctrl-imx50.c  | 1 +
 drivers/pinctrl/freescale/pinctrl-imx51.c  | 1 +
 drivers/pinctrl/freescale/pinctrl-imx53.c  | 1 +
 drivers/pinctrl/freescale/pinctrl-imx6dl.c | 1 +
 drivers/pinctrl/freescale/pinctrl-imx6q.c  | 1 +
 drivers/pinctrl/freescale/pinctrl-imx6sl.c | 1 +
 drivers/pinctrl/freescale/pinctrl-imx6sx.c | 1 +
 drivers/pinctrl/freescale/pinctrl-imx6ul.c | 1 +
 drivers/pinctrl/freescale/pinctrl-imx7d.c  | 1 +
 drivers/pinctrl/freescale/pinctrl-imx8mp.c | 1 +
 drivers/pinctrl/freescale/pinctrl-vf610.c  | 1 +
 15 files changed, 15 insertions(+)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1.c b/drivers/pinctrl/freescale/pinctrl-imx1.c
index faf770f13bc7..1e2b0fe9ffd6 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1.c
@@ -262,6 +262,7 @@ static struct platform_driver imx1_pinctrl_driver = {
 	.driver	= {
 		.name		= "imx1-pinctrl",
 		.of_match_table	= imx1_pinctrl_of_match,
+		.suppress_bind_attrs = true,
 	},
 };
 builtin_platform_driver_probe(imx1_pinctrl_driver, imx1_pinctrl_probe);
diff --git a/drivers/pinctrl/freescale/pinctrl-imx25.c b/drivers/pinctrl/freescale/pinctrl-imx25.c
index d7acd532ca8c..51748da1668f 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx25.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx25.c
@@ -324,6 +324,7 @@ static struct platform_driver imx25_pinctrl_driver = {
 	.driver = {
 		.name = "imx25-pinctrl",
 		.of_match_table = imx25_pinctrl_of_match,
+		.suppress_bind_attrs = true,
 	},
 	.probe = imx25_pinctrl_probe,
 };
diff --git a/drivers/pinctrl/freescale/pinctrl-imx27.c b/drivers/pinctrl/freescale/pinctrl-imx27.c
index e87e7798e89d..67e7105be4f3 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx27.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx27.c
@@ -397,6 +397,7 @@ static struct platform_driver imx27_pinctrl_driver = {
 	.driver = {
 		.name = "imx27-pinctrl",
 		.of_match_table = imx27_pinctrl_of_match,
+		.suppress_bind_attrs = true,
 	},
 	.probe = imx27_pinctrl_probe,
 };
diff --git a/drivers/pinctrl/freescale/pinctrl-imx35.c b/drivers/pinctrl/freescale/pinctrl-imx35.c
index 871bb419e2f0..c8671ad5214c 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx35.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx35.c
@@ -1014,6 +1014,7 @@ static struct platform_driver imx35_pinctrl_driver = {
 	.driver = {
 		.name = "imx35-pinctrl",
 		.of_match_table = imx35_pinctrl_of_match,
+		.suppress_bind_attrs = true,
 	},
 	.probe = imx35_pinctrl_probe,
 };
diff --git a/drivers/pinctrl/freescale/pinctrl-imx50.c b/drivers/pinctrl/freescale/pinctrl-imx50.c
index 7069a2fcd10a..a245b4011c00 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx50.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx50.c
@@ -400,6 +400,7 @@ static struct platform_driver imx50_pinctrl_driver = {
 	.driver = {
 		.name = "imx50-pinctrl",
 		.of_match_table = imx50_pinctrl_of_match,
+		.suppress_bind_attrs = true,
 	},
 	.probe = imx50_pinctrl_probe,
 };
diff --git a/drivers/pinctrl/freescale/pinctrl-imx51.c b/drivers/pinctrl/freescale/pinctrl-imx51.c
index e5c261e2bf1e..307cf5fe4d15 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx51.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx51.c
@@ -776,6 +776,7 @@ static struct platform_driver imx51_pinctrl_driver = {
 	.driver = {
 		.name = "imx51-pinctrl",
 		.of_match_table = imx51_pinctrl_of_match,
+		.suppress_bind_attrs = true,
 	},
 	.probe = imx51_pinctrl_probe,
 };
diff --git a/drivers/pinctrl/freescale/pinctrl-imx53.c b/drivers/pinctrl/freescale/pinctrl-imx53.c
index 64c97aaf20c7..02bf3bda69ac 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx53.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx53.c
@@ -463,6 +463,7 @@ static struct platform_driver imx53_pinctrl_driver = {
 	.driver = {
 		.name = "imx53-pinctrl",
 		.of_match_table = imx53_pinctrl_of_match,
+		.suppress_bind_attrs = true,
 	},
 	.probe = imx53_pinctrl_probe,
 };
diff --git a/drivers/pinctrl/freescale/pinctrl-imx6dl.c b/drivers/pinctrl/freescale/pinctrl-imx6dl.c
index 0858b4d79ed2..2b6d5141a477 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx6dl.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx6dl.c
@@ -473,6 +473,7 @@ static struct platform_driver imx6dl_pinctrl_driver = {
 	.driver = {
 		.name = "imx6dl-pinctrl",
 		.of_match_table = imx6dl_pinctrl_of_match,
+		.suppress_bind_attrs = true,
 	},
 	.probe = imx6dl_pinctrl_probe,
 };
diff --git a/drivers/pinctrl/freescale/pinctrl-imx6q.c b/drivers/pinctrl/freescale/pinctrl-imx6q.c
index 078ed6a331fd..a7507def26a9 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx6q.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx6q.c
@@ -475,6 +475,7 @@ static struct platform_driver imx6q_pinctrl_driver = {
 	.driver = {
 		.name = "imx6q-pinctrl",
 		.of_match_table = imx6q_pinctrl_of_match,
+		.suppress_bind_attrs = true,
 	},
 	.probe = imx6q_pinctrl_probe,
 };
diff --git a/drivers/pinctrl/freescale/pinctrl-imx6sl.c b/drivers/pinctrl/freescale/pinctrl-imx6sl.c
index 9d2e6f987aa7..236f3bf120c2 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx6sl.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx6sl.c
@@ -379,6 +379,7 @@ static struct platform_driver imx6sl_pinctrl_driver = {
 	.driver = {
 		.name = "imx6sl-pinctrl",
 		.of_match_table = imx6sl_pinctrl_of_match,
+		.suppress_bind_attrs = true,
 	},
 	.probe = imx6sl_pinctrl_probe,
 };
diff --git a/drivers/pinctrl/freescale/pinctrl-imx6sx.c b/drivers/pinctrl/freescale/pinctrl-imx6sx.c
index 594185745029..b7b97c274dcc 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx6sx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx6sx.c
@@ -383,6 +383,7 @@ static struct platform_driver imx6sx_pinctrl_driver = {
 	.driver = {
 		.name = "imx6sx-pinctrl",
 		.of_match_table = imx6sx_pinctrl_of_match,
+		.suppress_bind_attrs = true,
 	},
 	.probe = imx6sx_pinctrl_probe,
 };
diff --git a/drivers/pinctrl/freescale/pinctrl-imx6ul.c b/drivers/pinctrl/freescale/pinctrl-imx6ul.c
index 3c62bb38e551..3b8747482e36 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx6ul.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx6ul.c
@@ -343,6 +343,7 @@ static struct platform_driver imx6ul_pinctrl_driver = {
 	.driver = {
 		.name = "imx6ul-pinctrl",
 		.of_match_table = imx6ul_pinctrl_of_match,
+		.suppress_bind_attrs = true,
 	},
 	.probe = imx6ul_pinctrl_probe,
 };
diff --git a/drivers/pinctrl/freescale/pinctrl-imx7d.c b/drivers/pinctrl/freescale/pinctrl-imx7d.c
index 38cbad3dba3a..4126387344cb 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx7d.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx7d.c
@@ -387,6 +387,7 @@ static struct platform_driver imx7d_pinctrl_driver = {
 	.driver = {
 		.name = "imx7d-pinctrl",
 		.of_match_table = imx7d_pinctrl_of_match,
+		.suppress_bind_attrs = true,
 	},
 	.probe = imx7d_pinctrl_probe,
 };
diff --git a/drivers/pinctrl/freescale/pinctrl-imx8mp.c b/drivers/pinctrl/freescale/pinctrl-imx8mp.c
index 0cacf5ba162c..88abc257318f 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8mp.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8mp.c
@@ -336,6 +336,7 @@ static struct platform_driver imx8mp_pinctrl_driver = {
 	.driver = {
 		.name = "imx8mp-pinctrl",
 		.of_match_table = imx8mp_pinctrl_of_match,
+		.suppress_bind_attrs = true,
 	},
 	.probe = imx8mp_pinctrl_probe,
 };
diff --git a/drivers/pinctrl/freescale/pinctrl-vf610.c b/drivers/pinctrl/freescale/pinctrl-vf610.c
index 37602b053ed2..700e5a136814 100644
--- a/drivers/pinctrl/freescale/pinctrl-vf610.c
+++ b/drivers/pinctrl/freescale/pinctrl-vf610.c
@@ -336,6 +336,7 @@ static struct platform_driver vf610_pinctrl_driver = {
 	.driver = {
 		.name = "vf610-pinctrl",
 		.of_match_table = vf610_pinctrl_of_match,
+		.suppress_bind_attrs = true,
 	},
 	.probe = vf610_pinctrl_probe,
 };
-- 
2.25.1

