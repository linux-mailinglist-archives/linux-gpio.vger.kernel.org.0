Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F452425CD5
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Oct 2021 22:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232840AbhJGUFA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 16:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233621AbhJGUFA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 16:05:00 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF9ACC061760
        for <linux-gpio@vger.kernel.org>; Thu,  7 Oct 2021 13:03:05 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id z11so21273870lfj.4
        for <linux-gpio@vger.kernel.org>; Thu, 07 Oct 2021 13:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iHfwn5Mw1HIjzLjvAUYzp2UZuoIMubw7afJsID4hRF4=;
        b=6gPe8ovz715qy+bgnvbNn2LceiWbPVtDmCs0IZNihJLAQkZ6bSU5nWkI2B1HMq2UoK
         frewdN+w64hYefylYfZ6wmyD2kBDsL3IbMUsHzVOYbppJoQfimgEyvxBm6tEaaAWqfTI
         u5xtWFYIVsE7XhEVY5d9rerurg9lpMaphCbCftMYELwjv2dS863s0LfbG/5lrRn0xtiB
         yqx+oj1t+vLF8JRw8wwgxD5+kQ6kaOeFkYt5WkJZqgR5WHkz8dRixSWJuRT4/NJhL1X2
         gTIuHMhiH1huwQScoQs3Fa61Dpt0waeAua2S55fu1I3Z9PmNtmrxaCwQEgB8peyi3Fl5
         VTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iHfwn5Mw1HIjzLjvAUYzp2UZuoIMubw7afJsID4hRF4=;
        b=DUPp9sYTeUOQqZwN9tBCkxHGYvkQXZwyo1vopuCiJyhtw6q2TtqcRLNR8fW6nOq5FO
         lP21LRhPxLe9bjSmIzeEgOsWYAO05ZF0EFomWiKzq3Cxzo1Y8IXR0r2jmmzABMyMc25u
         y6zQLwMky4Czayvkuzm48n+/pUJ27NKloLIGQgiwKb5r99KD+bG7EO2POBnvYEcmN2K1
         /cHmpjzEdCJLpWpYyUAsqgXXnjk22Mt2mftLjyO3iT1Jjo/NZ7smFfVlodJIxPfBfioP
         QEHntV4c4BoN3kJQye0YpyDhcoeJOaFDpFncZdZi4pmciv3323tw4+6Q3MtnkP8wpmMb
         ah5A==
X-Gm-Message-State: AOAM533L1nIw8wPhBCkdr6huQu/stk/XBEaceiWn+bioYjiYRk0AwMWj
        TEFEY/JshiG6YizThkDWLMYqrg==
X-Google-Smtp-Source: ABdhPJwUTdNezcC5wW4gCTIJ3haGM1K/ML/ZXF+EY/kmPq3gJBxkEj57luHb7Djq5RuRpmw1I/4B+g==
X-Received: by 2002:a2e:9410:: with SMTP id i16mr6915894ljh.134.1633636983860;
        Thu, 07 Oct 2021 13:03:03 -0700 (PDT)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id y3sm28182lfh.132.2021.10.07.13.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 13:03:02 -0700 (PDT)
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH v2] pinctrl: renesas: r8a779[56]x: add MediaLB pins
Date:   Thu,  7 Oct 2021 23:02:50 +0300
Message-Id: <20211007200250.20661-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <CAMuHMdUvNM8Tu-+Ed0vjB2-_JUQe7ojUPbzJM=Vy1m_j31sNSg@mail.gmail.com>
References: <CAMuHMdUvNM8Tu-+Ed0vjB2-_JUQe7ojUPbzJM=Vy1m_j31sNSg@mail.gmail.com>
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
Changes from v1:
- move mlb_3pin from common[] to automotive[] arrays
- fix missed array size update in pfc-r8a7796.c

 drivers/pinctrl/renesas/pfc-r8a77950.c | 14 ++++++++++++++
 drivers/pinctrl/renesas/pfc-r8a77951.c | 18 ++++++++++++++++--
 drivers/pinctrl/renesas/pfc-r8a7796.c  | 18 ++++++++++++++++--
 drivers/pinctrl/renesas/pfc-r8a77965.c | 18 ++++++++++++++++--
 4 files changed, 62 insertions(+), 6 deletions(-)

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
index 84c0ea5d59c1..b55c4d4156ce 100644
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
@@ -4235,7 +4243,7 @@ static const unsigned int vin5_clk_mux[] = {
 static const struct {
 	struct sh_pfc_pin_group common[328];
 #ifdef CONFIG_PINCTRL_PFC_R8A77951
-	struct sh_pfc_pin_group automotive[30];
+	struct sh_pfc_pin_group automotive[31];
 #endif
 } pinmux_groups = {
 	.common = {
@@ -4600,6 +4608,7 @@ static const struct {
 		SH_PFC_PIN_GROUP(drif3_ctrl_b),
 		SH_PFC_PIN_GROUP(drif3_data0_b),
 		SH_PFC_PIN_GROUP(drif3_data1_b),
+		SH_PFC_PIN_GROUP(mlb_3pin),
 	}
 #endif /* CONFIG_PINCTRL_PFC_R8A77951 */
 };
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
index a4d74df3d201..14c437c3b6f5 100644
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
@@ -4210,7 +4218,7 @@ static const unsigned int vin5_clk_mux[] = {
 static const struct {
 	struct sh_pfc_pin_group common[324];
 #if defined(CONFIG_PINCTRL_PFC_R8A77960) || defined(CONFIG_PINCTRL_PFC_R8A77961)
-	struct sh_pfc_pin_group automotive[30];
+	struct sh_pfc_pin_group automotive[31];
 #endif
 } pinmux_groups = {
 	.common = {
@@ -4571,6 +4579,7 @@ static const struct {
 		SH_PFC_PIN_GROUP(drif3_ctrl_b),
 		SH_PFC_PIN_GROUP(drif3_data0_b),
 		SH_PFC_PIN_GROUP(drif3_data1_b),
+		SH_PFC_PIN_GROUP(mlb_3pin),
 	}
 #endif /* CONFIG_PINCTRL_PFC_R8A77960 || CONFIG_PINCTRL_PFC_R8A77961 */
 };
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
index a7607a679886..b6adef9e8761 100644
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
@@ -4460,7 +4468,7 @@ static const unsigned int vin5_clk_mux[] = {
 static const struct {
 	struct sh_pfc_pin_group common[326];
 #ifdef CONFIG_PINCTRL_PFC_R8A77965
-	struct sh_pfc_pin_group automotive[30];
+	struct sh_pfc_pin_group automotive[31];
 #endif
 } pinmux_groups = {
 	.common = {
@@ -4823,6 +4831,7 @@ static const struct {
 		SH_PFC_PIN_GROUP(drif3_ctrl_b),
 		SH_PFC_PIN_GROUP(drif3_data0_b),
 		SH_PFC_PIN_GROUP(drif3_data1_b),
+		SH_PFC_PIN_GROUP(mlb_3pin),
 	}
 #endif /* CONFIG_PINCTRL_PFC_R8A77965 */
 };
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

