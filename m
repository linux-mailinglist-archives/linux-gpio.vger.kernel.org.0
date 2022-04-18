Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8338505CA2
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Apr 2022 18:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346412AbiDRQsH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Apr 2022 12:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346417AbiDRQsG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Apr 2022 12:48:06 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 991043298B
        for <linux-gpio@vger.kernel.org>; Mon, 18 Apr 2022 09:45:23 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id i14so1890671ljn.5
        for <linux-gpio@vger.kernel.org>; Mon, 18 Apr 2022 09:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NQxQe8MePCv7JpX3/6cV4n5tTTqS4u+VyFsbEVonGoI=;
        b=DlbuOhJD27lzur0Gb9gy+tIte7/kqlfWeIOc1NpKa0tK7FZubnzSS//1wmqGsjQzrY
         aDKsu7vVoGz1bK5/TK4pw+8T6V0Z8gqQLPfLce7m7BebH/LlTJq+IkOVFTm4cXPxm1G3
         NVNZcXNdTLOiEJafUNIF2CoHEK75cUgUExuwKZZZzV7hpsmnojpM2qPEmHafJ9ZorGjj
         noGW3MMBE/S3ENiD2CTgsCP1SdHsLdw2g+JEGmnL9tTNHqQLLRek8GtSYRtxn87RcKyG
         /Fqs1qGbqYcrUcMmgIQCCXtvOKCR+Phngj4vK+wsWtBrIgMv0T90N6AoNn3vH8nG+wQH
         0HAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NQxQe8MePCv7JpX3/6cV4n5tTTqS4u+VyFsbEVonGoI=;
        b=ZZ6LoCloUj4ZGrQeIxiw6/FfOohMcL35jZtHkp8F5JdXAwMbY1TZXw7/lTJLkkkfqm
         RmR2Gpu/MJYhqCkS0HEg2zmCt043OZeIruUuJc6/6OKQNq8a5wMXKLgAnhErUldteNTi
         xQNLIWnoVlOuOkGPSceC++e5EiH02USjTNLQ/k5OnsrsuSr5BYQhnQJMUwjORkMM1qQ3
         Jj3zQbF3cF0nDLHi/9XOfELpY7pk/zdZBPYsTFx+4RRsmHn4KBuiUO7dB8s3xiAE6t1z
         5QYnW2fNidk2BJ82xLY7hD3CI68iS0mY32FncSaSk5uEK1Go0bG2NXfkjwuNK+vs1R1M
         Ifgw==
X-Gm-Message-State: AOAM530T7xFFjwajAVdKw8dwW0I+hyE2ZWHXkQVC896HtKFUsWOxjyMM
        kRj/Xaqnk9NiPSoq174yRV9uuiJscxv06w==
X-Google-Smtp-Source: ABdhPJyJ9K5M9J6p8Tu59HRrSSe0xUud1txDzTk1zSiw6QaiC9yncdRXQqrhNcw02vxt/LTB1doPsw==
X-Received: by 2002:a05:651c:1783:b0:249:43a8:b6f9 with SMTP id bn3-20020a05651c178300b0024943a8b6f9mr7650235ljb.273.1650300321624;
        Mon, 18 Apr 2022 09:45:21 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id p9-20020a2e93c9000000b0024b3c2ecc18sm1225919ljh.115.2022.04.18.09.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 09:45:21 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: nomadik: Add new MC2 config
Date:   Mon, 18 Apr 2022 18:43:17 +0200
Message-Id: <20220418164317.864418-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The MC2 MMC interface can be configured with the FBCLK
(feedback clock) unconnected, leaving the pin available
for reuse for something else. Add a group mc2_a_2 for
this.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c b/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c
index 0b9b6cbfd10c..ac3d4d91266d 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c
@@ -440,6 +440,10 @@ static const unsigned mc2_a_1_pins[] = { DB8500_PIN_A5, DB8500_PIN_B4,
 	DB8500_PIN_C8, DB8500_PIN_A12, DB8500_PIN_C10, DB8500_PIN_B10,
 	DB8500_PIN_B9, DB8500_PIN_A9, DB8500_PIN_C7, DB8500_PIN_A7,
 	DB8500_PIN_C5 };
+/* MC2 without the feedback clock */
+static const unsigned mc2_a_2_pins[] = { DB8500_PIN_A5, DB8500_PIN_B4,
+	DB8500_PIN_A12, DB8500_PIN_C10, DB8500_PIN_B10, DB8500_PIN_B9,
+	DB8500_PIN_A9, DB8500_PIN_C7, DB8500_PIN_A7, DB8500_PIN_C5 };
 static const unsigned ssp1_a_1_pins[] = { DB8500_PIN_C9, DB8500_PIN_B11,
 					  DB8500_PIN_C12, DB8500_PIN_C11 };
 static const unsigned ssp0_a_1_pins[] = { DB8500_PIN_D12, DB8500_PIN_B13,
@@ -699,6 +703,7 @@ static const struct nmk_pingroup nmk_db8500_groups[] = {
 	DB8500_PIN_GROUP(kp_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(kpskaskb_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(mc2_a_1, NMK_GPIO_ALT_A),
+	DB8500_PIN_GROUP(mc2_a_2, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(ssp1_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(ssp0_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(i2c0_a_1, NMK_GPIO_ALT_A),
@@ -856,7 +861,7 @@ DB8500_FUNC_GROUPS(lcd, "lcdvsi0_a_1", "lcdvsi1_a_1", "lcd_d0_d7_a_1",
 		   "lcd_d8_d11_a_1", "lcd_d12_d15_a_1", "lcd_d12_d23_a_1", "lcd_b_1",
 		   "lcd_d16_d23_b_1");
 DB8500_FUNC_GROUPS(kp, "kp_a_1", "kp_a_2", "kp_b_1", "kp_b_2", "kp_c_1", "kp_oc1_1");
-DB8500_FUNC_GROUPS(mc2, "mc2_a_1", "mc2rstn_c_1");
+DB8500_FUNC_GROUPS(mc2, "mc2_a_1", "mc2_a_2", "mc2rstn_c_1");
 DB8500_FUNC_GROUPS(ssp1, "ssp1_a_1");
 DB8500_FUNC_GROUPS(ssp0, "ssp0_a_1");
 DB8500_FUNC_GROUPS(i2c0, "i2c0_a_1");
-- 
2.35.1

