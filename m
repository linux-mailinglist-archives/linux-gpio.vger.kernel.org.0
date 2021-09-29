Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A3F41CDDF
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Sep 2021 23:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346864AbhI2VQK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Sep 2021 17:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346863AbhI2VQJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Sep 2021 17:16:09 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A91C6C061768
        for <linux-gpio@vger.kernel.org>; Wed, 29 Sep 2021 14:14:27 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id i19so13311471lfu.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Sep 2021 14:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JxVIPgVfpVqL0JfwpZSNVlN3XKjnqM3iLuF/UiuxfNg=;
        b=QWuUJRCPI6/ss+u52Phgc67pCpjXKROsuUB+fzeV8jd6vsELEYp31wShUQMasDSFwE
         j2JchLAV0HF0J4dq0D847gi2gDQrMz+ju/3z26rNlaQnGBNQDqpRwo+UykT1Rhp0m6po
         yYlIU+uIazyeU+lNWoOEd0uMvQB9QC3bN6NuaUHfiqeQ4Qvxj4ng0VhOh8hGROe07o2X
         Qj843skXa+9hLXGycl/tigfsga9BemGyUMgT0arI6XCp8Aew+UWlpv4bIMh4DRhoSBdx
         RhQ4c2/O88209PI7KBxDB3dCyBfG3HczwY7ePluAHAQUv21QhqiO3KWfsPyxuZel3RQv
         CcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JxVIPgVfpVqL0JfwpZSNVlN3XKjnqM3iLuF/UiuxfNg=;
        b=ft9QX0FLN2hBwwuq1oQEQE4egJyIRCoGvLITTzAiKSzQoFCoPgK59MOiIRwohTY0Sf
         ImTFE+VEmUwOhbEm7aXeTvbeCfViTaSQXhEwcLG1O62zmyFcC8+2P/syB/Cegfo2X+sX
         Bl8I3SieEvQl97GgaRCYlg+tq9PzuWHpWz1ZkxbGUXJYIq3zy3ue2JDvOAMH2+UhGD8K
         AwrI270cOO0ta2ygX5tYp953Y1gjkCe/8Q/crQ1mr1wKxRzYjx8GSyR6jIbwQODIhtFa
         GyMxPdnlo9Ebb9YmIcYRMuLKvzCN9ath//wPLSJZa1kL3VdT7CGmEMT9CuKq9joHM3ZY
         YZvw==
X-Gm-Message-State: AOAM532SXmSGlPGT9OZW6G7fdD7GSMUd7La9WnlMlFnDeJBF2rtyTcaJ
        caGP/XaLFMzXXNOHpzmYuOY13w==
X-Google-Smtp-Source: ABdhPJzoQkLWL5uVQdbdIwZYJI4THZavHlyTpU33uxrPlGHHU9/zByUu3AjQTOsjBcTPdcv6FDn7Ew==
X-Received: by 2002:a2e:6c14:: with SMTP id h20mr2051476ljc.519.1632950065819;
        Wed, 29 Sep 2021 14:14:25 -0700 (PDT)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id l26sm115884lfh.247.2021.09.29.14.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 14:14:25 -0700 (PDT)
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH] pinctrl: renesas: r8a779[56]x: add MediaLB pins
Date:   Thu, 30 Sep 2021 00:13:51 +0300
Message-Id: <20210929211350.4226-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Andrey Gusakov <andrey.gusakov@cogentembedded.com>

This adds pins, groups, and functions for MediaLB device on Renesas
H3 and M3.

Signed-off-by: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/pinctrl/renesas/pfc-r8a77950.c | 14 ++++++++++++++
 drivers/pinctrl/renesas/pfc-r8a77951.c | 18 ++++++++++++++++--
 drivers/pinctrl/renesas/pfc-r8a7796.c  | 16 +++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a77965.c | 18 ++++++++++++++++--
 4 files changed, 61 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77950.c b/drivers/pinctrl/renesas/pfc-r8a77950.c
index ee4ce9349aae..c86064900c6e 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77950.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77950.c
@@ -2369,6 +2369,14 @@ static const unsigned int intc_ex_irq5_mux[] = {
 	IRQ5_MARK,
 };
 
+/* - MLB+ ------------------------------------------------------------------- */
+static const unsigned int mlb_3pin_pins[] = {
+	RCAR_GP_PIN(5, 23), RCAR_GP_PIN(5, 24), RCAR_GP_PIN(5, 25),
+};
+static const unsigned int mlb_3pin_mux[] = {
+	MLB_CLK_MARK, MLB_SIG_MARK, MLB_DAT_MARK,
+};
+
 /* - MSIOF0 ----------------------------------------------------------------- */
 static const unsigned int msiof0_clk_pins[] = {
 	/* SCK */
@@ -3987,6 +3995,7 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(intc_ex_irq3),
 	SH_PFC_PIN_GROUP(intc_ex_irq4),
 	SH_PFC_PIN_GROUP(intc_ex_irq5),
+	SH_PFC_PIN_GROUP(mlb_3pin),
 	SH_PFC_PIN_GROUP(msiof0_clk),
 	SH_PFC_PIN_GROUP(msiof0_sync),
 	SH_PFC_PIN_GROUP(msiof0_ss1),
@@ -4380,6 +4389,10 @@ static const char * const intc_ex_groups[] = {
 	"intc_ex_irq5",
 };
 
+static const char * const mlb_3pin_groups[] = {
+	"mlb_3pin",
+};
+
 static const char * const msiof0_groups[] = {
 	"msiof0_clk",
 	"msiof0_sync",
@@ -4709,6 +4722,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(i2c5),
 	SH_PFC_FUNCTION(i2c6),
 	SH_PFC_FUNCTION(intc_ex),
+	SH_PFC_FUNCTION(mlb_3pin),
 	SH_PFC_FUNCTION(msiof0),
 	SH_PFC_FUNCTION(msiof1),
 	SH_PFC_FUNCTION(msiof2),
diff --git a/drivers/pinctrl/renesas/pfc-r8a77951.c b/drivers/pinctrl/renesas/pfc-r8a77951.c
index 84c0ea5d59c1..4e4e39640df4 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77951.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77951.c
@@ -2453,6 +2453,14 @@ static const unsigned int intc_ex_irq5_mux[] = {
 	IRQ5_MARK,
 };
 
+/* - MLB+ ------------------------------------------------------------------- */
+static const unsigned int mlb_3pin_pins[] = {
+	RCAR_GP_PIN(5, 23), RCAR_GP_PIN(5, 24), RCAR_GP_PIN(5, 25),
+};
+static const unsigned int mlb_3pin_mux[] = {
+	MLB_CLK_MARK, MLB_SIG_MARK, MLB_DAT_MARK,
+};
+
 /* - MSIOF0 ----------------------------------------------------------------- */
 static const unsigned int msiof0_clk_pins[] = {
 	/* SCK */
@@ -4233,7 +4241,7 @@ static const unsigned int vin5_clk_mux[] = {
 };
 
 static const struct {
-	struct sh_pfc_pin_group common[328];
+	struct sh_pfc_pin_group common[329];
 #ifdef CONFIG_PINCTRL_PFC_R8A77951
 	struct sh_pfc_pin_group automotive[30];
 #endif
@@ -4326,6 +4334,7 @@ static const struct {
 		SH_PFC_PIN_GROUP(intc_ex_irq3),
 		SH_PFC_PIN_GROUP(intc_ex_irq4),
 		SH_PFC_PIN_GROUP(intc_ex_irq5),
+		SH_PFC_PIN_GROUP(mlb_3pin),
 		SH_PFC_PIN_GROUP(msiof0_clk),
 		SH_PFC_PIN_GROUP(msiof0_sync),
 		SH_PFC_PIN_GROUP(msiof0_ss1),
@@ -4795,6 +4804,10 @@ static const char * const intc_ex_groups[] = {
 	"intc_ex_irq5",
 };
 
+static const char * const mlb_3pin_groups[] = {
+	"mlb_3pin",
+};
+
 static const char * const msiof0_groups[] = {
 	"msiof0_clk",
 	"msiof0_sync",
@@ -5142,7 +5155,7 @@ static const char * const vin5_groups[] = {
 };
 
 static const struct {
-	struct sh_pfc_function common[55];
+	struct sh_pfc_function common[56];
 #ifdef CONFIG_PINCTRL_PFC_R8A77951
 	struct sh_pfc_function automotive[4];
 #endif
@@ -5168,6 +5181,7 @@ static const struct {
 		SH_PFC_FUNCTION(i2c5),
 		SH_PFC_FUNCTION(i2c6),
 		SH_PFC_FUNCTION(intc_ex),
+		SH_PFC_FUNCTION(mlb_3pin),
 		SH_PFC_FUNCTION(msiof0),
 		SH_PFC_FUNCTION(msiof1),
 		SH_PFC_FUNCTION(msiof2),
diff --git a/drivers/pinctrl/renesas/pfc-r8a7796.c b/drivers/pinctrl/renesas/pfc-r8a7796.c
index a4d74df3d201..bfbe2529ff9c 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7796.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7796.c
@@ -2458,6 +2458,14 @@ static const unsigned int intc_ex_irq5_mux[] = {
 	IRQ5_MARK,
 };
 
+/* - MLB+ ------------------------------------------------------------------- */
+static const unsigned int mlb_3pin_pins[] = {
+	RCAR_GP_PIN(5, 23), RCAR_GP_PIN(5, 24), RCAR_GP_PIN(5, 25),
+};
+static const unsigned int mlb_3pin_mux[] = {
+	MLB_CLK_MARK, MLB_SIG_MARK, MLB_DAT_MARK,
+};
+
 /* - MSIOF0 ----------------------------------------------------------------- */
 static const unsigned int msiof0_clk_pins[] = {
 	/* SCK */
@@ -4301,6 +4309,7 @@ static const struct {
 		SH_PFC_PIN_GROUP(intc_ex_irq3),
 		SH_PFC_PIN_GROUP(intc_ex_irq4),
 		SH_PFC_PIN_GROUP(intc_ex_irq5),
+		SH_PFC_PIN_GROUP(mlb_3pin),
 		SH_PFC_PIN_GROUP(msiof0_clk),
 		SH_PFC_PIN_GROUP(msiof0_sync),
 		SH_PFC_PIN_GROUP(msiof0_ss1),
@@ -4766,6 +4775,10 @@ static const char * const intc_ex_groups[] = {
 	"intc_ex_irq5",
 };
 
+static const char * const mlb_3pin_groups[] = {
+	"mlb_3pin",
+};
+
 static const char * const msiof0_groups[] = {
 	"msiof0_clk",
 	"msiof0_sync",
@@ -5100,7 +5113,7 @@ static const char * const vin5_groups[] = {
 };
 
 static const struct {
-	struct sh_pfc_function common[52];
+	struct sh_pfc_function common[53];
 #if defined(CONFIG_PINCTRL_PFC_R8A77960) || defined(CONFIG_PINCTRL_PFC_R8A77961)
 	struct sh_pfc_function automotive[4];
 #endif
@@ -5126,6 +5139,7 @@ static const struct {
 		SH_PFC_FUNCTION(i2c5),
 		SH_PFC_FUNCTION(i2c6),
 		SH_PFC_FUNCTION(intc_ex),
+		SH_PFC_FUNCTION(mlb_3pin),
 		SH_PFC_FUNCTION(msiof0),
 		SH_PFC_FUNCTION(msiof1),
 		SH_PFC_FUNCTION(msiof2),
diff --git a/drivers/pinctrl/renesas/pfc-r8a77965.c b/drivers/pinctrl/renesas/pfc-r8a77965.c
index a7607a679886..dcde4edc309b 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77965.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77965.c
@@ -2609,6 +2609,14 @@ static const unsigned int intc_ex_irq5_mux[] = {
 	IRQ5_MARK,
 };
 
+/* - MLB+ ------------------------------------------------------------------- */
+static const unsigned int mlb_3pin_pins[] = {
+	RCAR_GP_PIN(5, 23), RCAR_GP_PIN(5, 24), RCAR_GP_PIN(5, 25),
+};
+static const unsigned int mlb_3pin_mux[] = {
+	MLB_CLK_MARK, MLB_SIG_MARK, MLB_DAT_MARK,
+};
+
 /* - MSIOF0 ----------------------------------------------------------------- */
 static const unsigned int msiof0_clk_pins[] = {
 	/* SCK */
@@ -4458,7 +4466,7 @@ static const unsigned int vin5_clk_mux[] = {
 };
 
 static const struct {
-	struct sh_pfc_pin_group common[326];
+	struct sh_pfc_pin_group common[327];
 #ifdef CONFIG_PINCTRL_PFC_R8A77965
 	struct sh_pfc_pin_group automotive[30];
 #endif
@@ -4551,6 +4559,7 @@ static const struct {
 		SH_PFC_PIN_GROUP(intc_ex_irq3),
 		SH_PFC_PIN_GROUP(intc_ex_irq4),
 		SH_PFC_PIN_GROUP(intc_ex_irq5),
+		SH_PFC_PIN_GROUP(mlb_3pin),
 		SH_PFC_PIN_GROUP(msiof0_clk),
 		SH_PFC_PIN_GROUP(msiof0_sync),
 		SH_PFC_PIN_GROUP(msiof0_ss1),
@@ -5018,6 +5027,10 @@ static const char * const intc_ex_groups[] = {
 	"intc_ex_irq5",
 };
 
+static const char * const mlb_3pin_groups[] = {
+	"mlb_3pin",
+};
+
 static const char * const msiof0_groups[] = {
 	"msiof0_clk",
 	"msiof0_sync",
@@ -5356,7 +5369,7 @@ static const char * const vin5_groups[] = {
 };
 
 static const struct {
-	struct sh_pfc_function common[53];
+	struct sh_pfc_function common[54];
 #ifdef CONFIG_PINCTRL_PFC_R8A77965
 	struct sh_pfc_function automotive[4];
 #endif
@@ -5382,6 +5395,7 @@ static const struct {
 		SH_PFC_FUNCTION(i2c5),
 		SH_PFC_FUNCTION(i2c6),
 		SH_PFC_FUNCTION(intc_ex),
+		SH_PFC_FUNCTION(mlb_3pin),
 		SH_PFC_FUNCTION(msiof0),
 		SH_PFC_FUNCTION(msiof1),
 		SH_PFC_FUNCTION(msiof2),
-- 
2.30.2

