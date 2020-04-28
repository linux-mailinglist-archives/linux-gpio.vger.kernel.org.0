Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A42A01BBA72
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 11:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgD1J5c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 05:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726971AbgD1J5c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 05:57:32 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9CC5C03C1A9
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 02:57:31 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id w145so16388918lff.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 02:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=emWSYXlvaLYbUsqppuZRW0WW307P6cdu3tUygZ7HsUs=;
        b=ChNa+MI0PV5AUDk2WT90eheZaHg4vbnI7AgBQqrVkxc5FbNbdO8bUyDRfkz4xfd7qh
         B8eLVgLCuz8hw7Y7NtRavExkKSYkvBtNYTO+0+OneUAwAqSPHViwww5B9SnPtX4AT4GQ
         +l8J3ogATy5QJ4REzSbRX5DEmakF30Vni1zZIjJERr3uLcOs9LyHA9tlX+2HxAvp3jz7
         uj6z7JKeexUzdUcsPZdMi/OBLpJK7IghB4i83rZOIZokHOfL0jrQa39lvcs9PTHymNGf
         xHa5aVSZotzwPPMJ5yoPs4XspfcDeh7LivOGta5gHoHf14Sm2PWEuASHNorKGFyDvmZQ
         EWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=emWSYXlvaLYbUsqppuZRW0WW307P6cdu3tUygZ7HsUs=;
        b=EU4Af5KbovRJwvBiLfj4qeWo33crfA63iYQVacHBgd2HyFor80qtIPgG8zsyAKoVjI
         O0edNAwGIki0en4n2F6Od0Hypg3GEomWZhYJK1k0fIGoHYXLweocCj0BEH1CbyafRvpW
         ghl8iLfF90Iwy6aa+3NgmgqikrB10dN6+Q4mFkWNSErZf8Dofw2vovDT4wHEx1tvf9Im
         polPt0gEZZNHZ9m6KpEGVbhxiHtai/xS46wMPNRyY22yW2oWCK5tPYW1u5gq/qcNHPps
         nxh/Fwvje1Ba2xm+qMtcWZgeMmvRc9KmdSuyS10+3A7qMNHNA1ID5at5MpMg/73ErTwM
         aBLw==
X-Gm-Message-State: AGi0PuYpvPjbSjva6subsuYJcHGtHeseUVLnhtc/Tp1Kh9QW6lZvwXZa
        9muEbJ2bVISUSI/vHbBMU6AxIw/+RjY=
X-Google-Smtp-Source: APiQypLzRbRv2WMOdSl7GImhlcTFvhciJkHhLYTBgDJUD5ABVnxRwjRD8eytiFb8Q2LzP2uYtXrZ5w==
X-Received: by 2002:a19:f614:: with SMTP id x20mr18462531lfe.84.1588067849877;
        Tue, 28 Apr 2020 02:57:29 -0700 (PDT)
Received: from localhost.localdomain (c-f3d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.243])
        by smtp.gmail.com with ESMTPSA id x80sm14037760lff.23.2020.04.28.02.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 02:57:29 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Hulk Robot <hulkci@huawei.com>, Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] pinctrl: db8500: Fix some old bugs
Date:   Tue, 28 Apr 2020 11:55:26 +0200
Message-Id: <20200428095526.854974-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Hulk robot reports these build warnings:

drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c:899:20: warning:
‘sbag_groups’ defined but not used [-Wunused-const-variable=]
 DB8500_FUNC_GROUPS(sbag, "sbag_oc2_1", "sbag_oc4_1");
                    ^
drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c:570:23: warning:
‘ipgpio6_c_2_pins’ defined but not used [-Wunused-const-variable=]
 static const unsigned ipgpio6_c_2_pins[] = { DB8500_PIN_G3 };
                       ^~~~~~~~~~~~~~~~
drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c:472:23: warning:
‘mc1dir_a_1_pins’ defined but not used [-Wunused-const-variable=]
 static const unsigned mc1dir_a_1_pins[] = { DB8500_PIN_AH13,
DB8500_PIN_AG12,
                       ^~~~~~~~~~~~~~~
drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c:453:23: warning:
‘modem_a_1_pins’ defined but not used [-Wunused-const-variable=]
 static const unsigned modem_a_1_pins[] = { DB8500_PIN_D22,
DB8500_PIN_C23,
                       ^~~~~~~~~~~~~~
drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c:430:23: warning:
‘kpskaskb_a_1_pins’ defined but not used [-Wunused-const-variable=]
 static const unsigned kpskaskb_a_1_pins[] = { DB8500_PIN_D17,
DB8500_PIN_D16 };
                       ^~~~~~~~~~~~~~~~~

They are just very old bugs in seldomly used pin groups.
Fix the problem by using the pins and referencing the
function.

Reported-by: Hulk Robot <hulkci@huawei.com>
Reported-by: Jason Yan <yanaijie@huawei.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c b/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c
index b9246e0b4fe2..acad3887cc74 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c
@@ -691,18 +691,21 @@ static const struct nmk_pingroup nmk_db8500_groups[] = {
 	DB8500_PIN_GROUP(lcd_d8_d11_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(lcd_d12_d23_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(kp_a_1, NMK_GPIO_ALT_A),
+	DB8500_PIN_GROUP(kpskaskb_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(mc2_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(ssp1_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(ssp0_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(i2c0_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(ipgpio0_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(ipgpio1_a_1, NMK_GPIO_ALT_A),
+	DB8500_PIN_GROUP(modem_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(kp_a_2, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(msp2sck_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(msp2_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(mc4_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(mc1_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(mc1_a_2, NMK_GPIO_ALT_A),
+	DB8500_PIN_GROUP(mc1dir_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(hsir_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(hsit_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(hsit_a_2, NMK_GPIO_ALT_A),
@@ -760,7 +763,7 @@ static const struct nmk_pingroup nmk_db8500_groups[] = {
 	DB8500_PIN_GROUP(u0_c_1, NMK_GPIO_ALT_C),
 	DB8500_PIN_GROUP(ipgpio4_c_1, NMK_GPIO_ALT_C),
 	DB8500_PIN_GROUP(ipgpio5_c_1, NMK_GPIO_ALT_C),
-	DB8500_PIN_GROUP(ipgpio6_c_1, NMK_GPIO_ALT_C),
+	DB8500_PIN_GROUP(ipgpio6_c_2, NMK_GPIO_ALT_C),
 	DB8500_PIN_GROUP(ipgpio7_c_1, NMK_GPIO_ALT_C),
 	DB8500_PIN_GROUP(smcleale_c_1, NMK_GPIO_ALT_C),
 	DB8500_PIN_GROUP(stmape_c_1, NMK_GPIO_ALT_C),
@@ -955,6 +958,7 @@ static const struct nmk_function nmk_db8500_functions[] = {
 	FUNCTION(spi0),
 	FUNCTION(spi2),
 	FUNCTION(remap),
+	FUNCTION(sbag),
 	FUNCTION(ptm),
 	FUNCTION(rf),
 	FUNCTION(hx),
-- 
2.25.2

