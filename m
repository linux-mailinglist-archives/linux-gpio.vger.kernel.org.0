Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC3272AE3F6
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 00:23:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732184AbgKJXXv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 18:23:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbgKJXXt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 18:23:49 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 394E7C0613D1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 15:23:41 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id s30so587516lfc.4
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 15:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0iPOT1kCpEb8GIA2V0tWg7Hf1K8amg0YQm1Ma4D+KDc=;
        b=Ol/s+/ZvSqEfl2maqK5UhQOnw5386GSawhVN7yVbtpq0Eu0Y4f6VxAWnM8uq5uLNJ0
         gVtBNkODM++bI9b+HyNA5IJsRSOBtD2V6KTQVeIlG2QJtPNvXxudvgRdzzkTPf6y2nwF
         JzIDNwIDWvvgE/QUaPNsJ8+Lcr6aq3t5AVM4Ecz6d7nTkN5VKcgEXxUu8irQefoTY/og
         G1ep0Pc7KuPmHRRHhV3F3GvLJ+SChNOnrZdxlgaVe2CWKIaUu5Vq5LLvWTb1LX6aWvSL
         q9S7Snr2UM51CX4rhuFgkElJqHUFxLuk/Gx/Mpa3vnfjBs2nBRQDkBI0j7QVm8JWB1s6
         y8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0iPOT1kCpEb8GIA2V0tWg7Hf1K8amg0YQm1Ma4D+KDc=;
        b=tGp0Dtxgb4gc0+AMxTcnVmX+cAJ9QfZKRpMj2cXJC4Hp6gcWvx3E0kDCKMkZ0+i7LG
         S4jdx/m+zWYDNItwCmHmju9Nt7Thtv+kFDecs6g67ajIiT3fhpOFE+7tyLW9GbyBD2oU
         1wT9lYBuHlbW92w+xZ7tJIMxGGOfBIxKtSLiTt+qRDKk0OXN5UZ1XP2JKk1HVxg16KNm
         wZ4RB5b2pAj9mdOxCIPu6kpDz/3BnZyMfqE2QD7CnLiGgo5deTNIc2s2fqJ1xj6Kbiti
         2z3kewzGkbbof3WO8Lzqos+lmGJ/TnRDTCEpW706h6MmHVBZNnaxlzfz7eu6zXu4zFNl
         +vAQ==
X-Gm-Message-State: AOAM5304Alqc1shfOBgvBI7WTrc5gmRsVXQbnJHqYcB+kHnbkT3BmdBt
        AeUptFWFhNb4QqDZtSgb2F1C0rpZ6rKTWjUl
X-Google-Smtp-Source: ABdhPJwY+wdLaDHBCIG51IOXaiFgJQE0qFCe4uiaZueX0yYMTCn3Bn5Pg5B7tsGfY1JTMDdY2NjuLw==
X-Received: by 2002:a19:d02:: with SMTP id 2mr6237586lfn.294.1605050614879;
        Tue, 10 Nov 2020 15:23:34 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id c19sm33523lfr.182.2020.11.10.15.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 15:23:34 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: nomadik: db8500: Add more detailed LCD groups
Date:   Wed, 11 Nov 2020 00:23:30 +0100
Message-Id: <20201110232330.2242167-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We need a more granular distribution among funcion A
and function B for the LCD pins for the Samsung
GT-I9070 . Provide some new pin groups so we can
configure this phone properly.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c b/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c
index acad3887cc74..0b9b6cbfd10c 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c
@@ -421,6 +421,8 @@ static const unsigned lcd_d0_d7_a_1_pins[] = {
 /* D8 thru D11 often used as TVOUT lines */
 static const unsigned lcd_d8_d11_a_1_pins[] = { DB8500_PIN_F4,
 	DB8500_PIN_E3, DB8500_PIN_E4, DB8500_PIN_D2 };
+static const unsigned lcd_d12_d15_a_1_pins[] = {
+	DB8500_PIN_C1, DB8500_PIN_D3, DB8500_PIN_C2, DB8500_PIN_D5 };
 static const unsigned lcd_d12_d23_a_1_pins[] = {
 	DB8500_PIN_C1, DB8500_PIN_D3, DB8500_PIN_C2, DB8500_PIN_D5,
 	DB8500_PIN_C6, DB8500_PIN_B3, DB8500_PIN_C4, DB8500_PIN_E6,
@@ -535,6 +537,9 @@ static const unsigned lcd_b_1_pins[] = { DB8500_PIN_D17, DB8500_PIN_D16,
 	DB8500_PIN_A18, DB8500_PIN_C18, DB8500_PIN_B19, DB8500_PIN_B20,
 	DB8500_PIN_D21, DB8500_PIN_D20, DB8500_PIN_C20, DB8500_PIN_B21,
 	DB8500_PIN_C21, DB8500_PIN_A22, DB8500_PIN_B24, DB8500_PIN_C22 };
+static const unsigned lcd_d16_d23_b_1_pins[] = {
+	DB8500_PIN_D21, DB8500_PIN_D20, DB8500_PIN_C20, DB8500_PIN_B21,
+	DB8500_PIN_C21, DB8500_PIN_A22, DB8500_PIN_B24, DB8500_PIN_C22 };
 static const unsigned ddrtrig_b_1_pins[] = { DB8500_PIN_AJ27 };
 static const unsigned pwl_b_1_pins[] = { DB8500_PIN_AF25 };
 static const unsigned spi1_b_1_pins[] = { DB8500_PIN_AG15, DB8500_PIN_AF13,
@@ -689,6 +694,7 @@ static const struct nmk_pingroup nmk_db8500_groups[] = {
 	DB8500_PIN_GROUP(lcdvsi1_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(lcd_d0_d7_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(lcd_d8_d11_a_1, NMK_GPIO_ALT_A),
+	DB8500_PIN_GROUP(lcd_d12_d15_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(lcd_d12_d23_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(kp_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(kpskaskb_a_1, NMK_GPIO_ALT_A),
@@ -741,6 +747,7 @@ static const struct nmk_pingroup nmk_db8500_groups[] = {
 	DB8500_PIN_GROUP(lcdaclk_b_1, NMK_GPIO_ALT_B),
 	DB8500_PIN_GROUP(lcda_b_1, NMK_GPIO_ALT_B),
 	DB8500_PIN_GROUP(lcd_b_1, NMK_GPIO_ALT_B),
+	DB8500_PIN_GROUP(lcd_d16_d23_b_1, NMK_GPIO_ALT_B),
 	DB8500_PIN_GROUP(ddrtrig_b_1, NMK_GPIO_ALT_B),
 	DB8500_PIN_GROUP(pwl_b_1, NMK_GPIO_ALT_B),
 	DB8500_PIN_GROUP(spi1_b_1, NMK_GPIO_ALT_B),
@@ -846,7 +853,8 @@ DB8500_FUNC_GROUPS(mc0, "mc0_a_1", "mc0_a_2", "mc0_dat47_a_1", "mc0dat31dir_a_1"
 DB8500_FUNC_GROUPS(msp1, "msp1txrx_a_1", "msp1_a_1", "msp1txrx_b_1");
 DB8500_FUNC_GROUPS(lcdb, "lcdb_a_1");
 DB8500_FUNC_GROUPS(lcd, "lcdvsi0_a_1", "lcdvsi1_a_1", "lcd_d0_d7_a_1",
-	"lcd_d8_d11_a_1", "lcd_d12_d23_a_1", "lcd_b_1");
+		   "lcd_d8_d11_a_1", "lcd_d12_d15_a_1", "lcd_d12_d23_a_1", "lcd_b_1",
+		   "lcd_d16_d23_b_1");
 DB8500_FUNC_GROUPS(kp, "kp_a_1", "kp_a_2", "kp_b_1", "kp_b_2", "kp_c_1", "kp_oc1_1");
 DB8500_FUNC_GROUPS(mc2, "mc2_a_1", "mc2rstn_c_1");
 DB8500_FUNC_GROUPS(ssp1, "ssp1_a_1");
-- 
2.26.2

