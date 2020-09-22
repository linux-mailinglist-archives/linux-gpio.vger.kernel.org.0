Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 354EB2746E0
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 18:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbgIVQml (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Sep 2020 12:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgIVQml (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Sep 2020 12:42:41 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96F39C061755;
        Tue, 22 Sep 2020 09:42:41 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 5so1763527pgf.5;
        Tue, 22 Sep 2020 09:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/fereSFqQtjNeg8le7K5lDKrvGxQoj/bAVfQwm0po3c=;
        b=dHH5oKhlEoh4J5N9ZkuGH1q+o9Mv03A8VbhRlhG1M7oRzS54iA5dhkOFP4CW6JYsRD
         Oy38Xwl0kFZq3/tbc9PqdocHb5kCa9JyK1zav5+xu9QMmvf/DempF6dL1o7r43aMPhRd
         LL/GrwJsndWrXr1o/6w1GPQ4muBJzMGj7aJfB2JAujOZGdeeufeYODJj1KJgxFG7UpyZ
         Vey43XDNPRXShaR0aK4kWsNhpUbhbnM+LwrSLl/5c14D9O41p53VZd7O9OTvpxfqCprT
         iauy957xP5c1bbv03/Lp6uOaYqOC3CQfSnx1xODwSfgeVM++6+6DoeXNVRltxTsBDJRy
         ieoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/fereSFqQtjNeg8le7K5lDKrvGxQoj/bAVfQwm0po3c=;
        b=U0Gyah3ozUnXCFTNM53lnx7iDObaRGLZdLerfjT/ASXDTSp0m/PW1/N1ZqviB6R2ap
         FyIOUKMGcyCVyqWNRyg/CUOjvsaYfb5ySqctzNe7nfTK4XKc/FuRuYDydUOiigdvSckx
         DoRqn3QEwUR+QVYQ0PFSHSSExVuQ2uPeatqrpQdgDFkcIvHQK0dQf+yriTZyNTwtaxo4
         5ISn+2rxd+0C2Gbl2kfcici4ZNxvMT4mo0JT7WamITJKVQaDX0sRUQSI2QXRmhlHn+EJ
         vLihbQyRCbC9TMDK2rHrsMdGirZnwr2tWr9/6VMGo5lBrI7cS6nlMAQJ+h+dJ+ITR4r9
         yWJA==
X-Gm-Message-State: AOAM532ayEPoY+DBc3tG2Xy22k2zEQplCqaUHIERoIEMzNsscJzjH8cC
        7yTo+OaINNKynOMFpAp9IRMr+azPD3U3Uw==
X-Google-Smtp-Source: ABdhPJzNUr1KXDsOg1ICr+4Gd0VWK+0LvoxG3I/dDawxGVcR3vfhTqOAt1Vr61Xae1xYBfgt+J+cdQ==
X-Received: by 2002:a17:902:b117:b029:d1:e5e7:bdf5 with SMTP id q23-20020a170902b117b02900d1e5e7bdf5mr5221747plr.85.1600792960666;
        Tue, 22 Sep 2020 09:42:40 -0700 (PDT)
Received: from guoguo-omen.lan ([156.96.148.94])
        by smtp.gmail.com with ESMTPSA id gj6sm2869768pjb.10.2020.09.22.09.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 09:42:40 -0700 (PDT)
From:   Chuanhong Guo <gch981213@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Chuanhong Guo <gch981213@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: mediatek: mt7622: add antsel pins/groups
Date:   Wed, 23 Sep 2020 00:41:57 +0800
Message-Id: <20200922164159.120920-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These pins are named ANTSEL[0~29] in datasheet and are used by wmac for
various functions.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt7622.c | 103 ++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7622.c b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
index ce4a8a0cc19cb..38c5e166fd0f6 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7622.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
@@ -263,6 +263,68 @@ static const struct mtk_pin_desc mt7622_pins[] = {
  * hardware probably has multiple combinations of these pinouts.
  */
 
+/* ANTSEL */
+static int mt7622_antsel0_pins[] = { 91, };
+static int mt7622_antsel0_funcs[] = { 5, };
+static int mt7622_antsel1_pins[] = { 92, };
+static int mt7622_antsel1_funcs[] = { 5, };
+static int mt7622_antsel2_pins[] = { 93, };
+static int mt7622_antsel2_funcs[] = { 5, };
+static int mt7622_antsel3_pins[] = { 94, };
+static int mt7622_antsel3_funcs[] = { 5, };
+static int mt7622_antsel4_pins[] = { 95, };
+static int mt7622_antsel4_funcs[] = { 5, };
+static int mt7622_antsel5_pins[] = { 96, };
+static int mt7622_antsel5_funcs[] = { 5, };
+static int mt7622_antsel6_pins[] = { 97, };
+static int mt7622_antsel6_funcs[] = { 5, };
+static int mt7622_antsel7_pins[] = { 98, };
+static int mt7622_antsel7_funcs[] = { 5, };
+static int mt7622_antsel8_pins[] = { 99, };
+static int mt7622_antsel8_funcs[] = { 5, };
+static int mt7622_antsel9_pins[] = { 100, };
+static int mt7622_antsel9_funcs[] = { 5, };
+static int mt7622_antsel10_pins[] = { 101, };
+static int mt7622_antsel10_funcs[] = { 5, };
+static int mt7622_antsel11_pins[] = { 102, };
+static int mt7622_antsel11_funcs[] = { 5, };
+static int mt7622_antsel12_pins[] = { 73, };
+static int mt7622_antsel12_funcs[] = { 5, };
+static int mt7622_antsel13_pins[] = { 74, };
+static int mt7622_antsel13_funcs[] = { 5, };
+static int mt7622_antsel14_pins[] = { 75, };
+static int mt7622_antsel14_funcs[] = { 5, };
+static int mt7622_antsel15_pins[] = { 76, };
+static int mt7622_antsel15_funcs[] = { 5, };
+static int mt7622_antsel16_pins[] = { 77, };
+static int mt7622_antsel16_funcs[] = { 5, };
+static int mt7622_antsel17_pins[] = { 22, };
+static int mt7622_antsel17_funcs[] = { 5, };
+static int mt7622_antsel18_pins[] = { 79, };
+static int mt7622_antsel18_funcs[] = { 5, };
+static int mt7622_antsel19_pins[] = { 80, };
+static int mt7622_antsel19_funcs[] = { 5, };
+static int mt7622_antsel20_pins[] = { 81, };
+static int mt7622_antsel20_funcs[] = { 5, };
+static int mt7622_antsel21_pins[] = { 82, };
+static int mt7622_antsel21_funcs[] = { 5, };
+static int mt7622_antsel22_pins[] = { 14, };
+static int mt7622_antsel22_funcs[] = { 5, };
+static int mt7622_antsel23_pins[] = { 15, };
+static int mt7622_antsel23_funcs[] = { 5, };
+static int mt7622_antsel24_pins[] = { 16, };
+static int mt7622_antsel24_funcs[] = { 5, };
+static int mt7622_antsel25_pins[] = { 17, };
+static int mt7622_antsel25_funcs[] = { 5, };
+static int mt7622_antsel26_pins[] = { 18, };
+static int mt7622_antsel26_funcs[] = { 5, };
+static int mt7622_antsel27_pins[] = { 19, };
+static int mt7622_antsel27_funcs[] = { 5, };
+static int mt7622_antsel28_pins[] = { 20, };
+static int mt7622_antsel28_funcs[] = { 5, };
+static int mt7622_antsel29_pins[] = { 21, };
+static int mt7622_antsel29_funcs[] = { 5, };
+
 /* EMMC */
 static int mt7622_emmc_pins[] = { 40, 41, 42, 43, 44, 45, 47, 48, 49, 50, };
 static int mt7622_emmc_funcs[] = { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, };
@@ -543,6 +605,36 @@ static int mt7622_wled_pins[] = { 85, };
 static int mt7622_wled_funcs[] = { 0, };
 
 static const struct group_desc mt7622_groups[] = {
+	PINCTRL_PIN_GROUP("antsel0", mt7622_antsel0),
+	PINCTRL_PIN_GROUP("antsel1", mt7622_antsel1),
+	PINCTRL_PIN_GROUP("antsel2", mt7622_antsel2),
+	PINCTRL_PIN_GROUP("antsel3", mt7622_antsel3),
+	PINCTRL_PIN_GROUP("antsel4", mt7622_antsel4),
+	PINCTRL_PIN_GROUP("antsel5", mt7622_antsel5),
+	PINCTRL_PIN_GROUP("antsel6", mt7622_antsel6),
+	PINCTRL_PIN_GROUP("antsel7", mt7622_antsel7),
+	PINCTRL_PIN_GROUP("antsel8", mt7622_antsel8),
+	PINCTRL_PIN_GROUP("antsel9", mt7622_antsel9),
+	PINCTRL_PIN_GROUP("antsel10", mt7622_antsel10),
+	PINCTRL_PIN_GROUP("antsel11", mt7622_antsel11),
+	PINCTRL_PIN_GROUP("antsel12", mt7622_antsel12),
+	PINCTRL_PIN_GROUP("antsel13", mt7622_antsel13),
+	PINCTRL_PIN_GROUP("antsel14", mt7622_antsel14),
+	PINCTRL_PIN_GROUP("antsel15", mt7622_antsel15),
+	PINCTRL_PIN_GROUP("antsel16", mt7622_antsel16),
+	PINCTRL_PIN_GROUP("antsel17", mt7622_antsel17),
+	PINCTRL_PIN_GROUP("antsel18", mt7622_antsel18),
+	PINCTRL_PIN_GROUP("antsel19", mt7622_antsel19),
+	PINCTRL_PIN_GROUP("antsel20", mt7622_antsel20),
+	PINCTRL_PIN_GROUP("antsel21", mt7622_antsel21),
+	PINCTRL_PIN_GROUP("antsel22", mt7622_antsel22),
+	PINCTRL_PIN_GROUP("antsel23", mt7622_antsel23),
+	PINCTRL_PIN_GROUP("antsel24", mt7622_antsel24),
+	PINCTRL_PIN_GROUP("antsel25", mt7622_antsel25),
+	PINCTRL_PIN_GROUP("antsel26", mt7622_antsel26),
+	PINCTRL_PIN_GROUP("antsel27", mt7622_antsel27),
+	PINCTRL_PIN_GROUP("antsel28", mt7622_antsel28),
+	PINCTRL_PIN_GROUP("antsel29", mt7622_antsel29),
 	PINCTRL_PIN_GROUP("emmc", mt7622_emmc),
 	PINCTRL_PIN_GROUP("emmc_rst", mt7622_emmc_rst),
 	PINCTRL_PIN_GROUP("ephy_leds", mt7622_ephy_leds),
@@ -663,6 +755,16 @@ static const struct group_desc mt7622_groups[] = {
 /* Joint those groups owning the same capability in user point of view which
  * allows that people tend to use through the device tree.
  */
+static const char *mt7622_antsel_groups[] = { "antsel0", "antsel1", "antsel2",
+					      "antsel3", "antsel4", "antsel5",
+					      "antsel6", "antsel7", "antsel8",
+					      "antsel9", "antsel10", "antsel11",
+					      "antsel12", "antsel13", "antsel14",
+					      "antsel15", "antsel16", "antsel17",
+					      "antsel18", "antsel19", "antsel20",
+					      "antsel21", "antsel22", "antsel23",
+					      "antsel24", "antsel25", "antsel26",
+					      "antsel27", "antsel28", "antsel29",};
 static const char *mt7622_emmc_groups[] = { "emmc", "emmc_rst", };
 static const char *mt7622_ethernet_groups[] = { "esw", "esw_p0_p1",
 						"esw_p2_p3_p4", "mdc_mdio",
@@ -732,6 +834,7 @@ static const char *mt7622_uart_groups[] = { "uart0_0_tx_rx",
 static const char *mt7622_wdt_groups[] = { "watchdog", };
 
 static const struct function_desc mt7622_functions[] = {
+	{"antsel", mt7622_antsel_groups, ARRAY_SIZE(mt7622_antsel_groups)},
 	{"emmc", mt7622_emmc_groups, ARRAY_SIZE(mt7622_emmc_groups)},
 	{"eth",	mt7622_ethernet_groups, ARRAY_SIZE(mt7622_ethernet_groups)},
 	{"i2c", mt7622_i2c_groups, ARRAY_SIZE(mt7622_i2c_groups)},
-- 
2.26.2

