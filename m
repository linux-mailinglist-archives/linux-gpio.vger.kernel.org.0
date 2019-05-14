Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB2451C4A5
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2019 10:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbfENI1G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 May 2019 04:27:06 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35638 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbfENI1E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 May 2019 04:27:04 -0400
Received: by mail-wm1-f67.google.com with SMTP id q15so1833613wmj.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 May 2019 01:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=O97zZZn1z4pV5/CBd0LynhS3xGUIwq2UphBG0p1YFRQ=;
        b=bPf4WuuYIqH2CH9bQmXEo1O34FgtRlbigWtGU36yskR/JqXCQ/OJg76GS3qGPgMcR3
         vHOr3yIF50qoEfqp2acVrlqRNwYxmCtwNrQxxMlMjfvOMjYEq/hfhCPcZ92ywzjH/Wu3
         2X6f+ps9mNRR882qkn9/0YTWP3xAaw/S8SMi6j7LPy5n84ItH994gvgN8f22JsCBQjiW
         2ptIfpHlkGvIz1fhsW+HEgTyY/tnOsLHH50eYsvvTCPLuOPqAkvdQHlfZ5sKy7IQeD4U
         1nbAL8REhP2W/4aftAOOcxBoc9DY+hyc2QYH17vGyL2+bpQ9vJAjSpnIIXL6OUuQ3TNo
         8wUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=O97zZZn1z4pV5/CBd0LynhS3xGUIwq2UphBG0p1YFRQ=;
        b=tqS/yfPUik8LV8QffLT7D/yPQWfgVU2uhAZgwSTFlv/wFWph0ui7Deoaidj0HYFykT
         msQUEzgaOM7Bn9Qj3Wlnv+mmAQYJr14jdlpX+IdcMB8f+ZHxUMcG6Xitrx/JL/7HoYFR
         t2YzxafQiveRo511JegXFlJoCt95yUGE1SUEr/v8ZyBosHtI1+HOKm/Xe5/XPoSA0zxG
         4CNrDqJe2g/rSYF49heYocEkQtmnmVmdi7/UWtRZ7mrqq4iGvHQex0lk6VpVnH6kxAC8
         SJQSrVu/MlDC/o10sGeHJFAki9vfZN9x+zI2+avtwK5gb5Mle/Bo3hdz2nue/GctaQII
         ueiA==
X-Gm-Message-State: APjAAAUH52T+tibcGpfgSeZZfnhAkGZWQ/4WzH2J4d7xU5/HiiW8C/dy
        wPR0/GNRy7MdaAOJ6BFLAbsVVA==
X-Google-Smtp-Source: APXvYqwgUQzayw2v0ikkYZxkiB0BG9CeOqyLkpcMOf/bqVkm0uyUrcKtkGPsT8Nrob/g7fdLlQ43wg==
X-Received: by 2002:a7b:c8d1:: with SMTP id f17mr5244524wml.45.1557822421448;
        Tue, 14 May 2019 01:27:01 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.home ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
        by smtp.gmail.com with ESMTPSA id j190sm2450772wmb.19.2019.05.14.01.27.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 01:27:01 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     linus.walleij@linaro.org, khilman@baylibre.com
Cc:     jbrunet@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/6] pinctrl: meson: g12a: add DS bank value
Date:   Tue, 14 May 2019 10:26:52 +0200
Message-Id: <20190514082652.20686-7-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190514082652.20686-1-glaroque@baylibre.com>
References: <20190514082652.20686-1-glaroque@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

add drive-strength bank regiter and bit value for G12A SoC

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson-g12a.c | 36 +++++++++++-----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
index d494492e98e9..3475cd7bd2af 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
@@ -1304,28 +1304,28 @@ static struct meson_pmx_func meson_g12a_aobus_functions[] = {
 };
 
 static struct meson_bank meson_g12a_periphs_banks[] = {
-	/* name  first  last  irq  pullen  pull  dir  out  in */
-	BANK("Z",    GPIOZ_0,    GPIOZ_15, 12, 27,
-	     4,  0,  4,  0,  12,  0,  13, 0,  14, 0),
-	BANK("H",    GPIOH_0,    GPIOH_8, 28, 36,
-	     3,  0,  3,  0,  9,  0,  10,  0,  11,  0),
-	BANK("BOOT", BOOT_0,     BOOT_15,  37, 52,
-	     0,  0,  0,  0,  0, 0,  1, 0,  2, 0),
-	BANK("C",    GPIOC_0,    GPIOC_7,  53, 60,
-	     1,  0,  1,  0,  3, 0,  4, 0,  5, 0),
-	BANK("A",    GPIOA_0,    GPIOA_15,  61, 76,
-	     5,  0,  5,  0,  16,  0,  17,  0,  18,  0),
-	BANK("X",    GPIOX_0,    GPIOX_19,   77, 96,
-	     2,  0,  2,  0,  6,  0,  7,  0,  8,  0),
+	/* name  first  last  irq  pullen  pull  dir  out  in  ds */
+	BANK_DS("Z",    GPIOZ_0,    GPIOZ_15, 12, 27,
+		4,  0,  4,  0,  12,  0,  13, 0,  14, 0, 5, 0),
+	BANK_DS("H",    GPIOH_0,    GPIOH_8, 28, 36,
+		3,  0,  3,  0,  9,  0,  10,  0,  11,  0, 4, 0),
+	BANK_DS("BOOT", BOOT_0,     BOOT_15,  37, 52,
+		0,  0,  0,  0,  0, 0,  1, 0,  2, 0, 0, 0),
+	BANK_DS("C",    GPIOC_0,    GPIOC_7,  53, 60,
+		1,  0,  1,  0,  3, 0,  4, 0,  5, 0, 1, 0),
+	BANK_DS("A",    GPIOA_0,    GPIOA_15,  61, 76,
+		5,  0,  5,  0,  16,  0,  17,  0,  18,  0, 6, 0),
+	BANK_DS("X",    GPIOX_0,    GPIOX_19,   77, 96,
+		2,  0,  2,  0,  6,  0,  7,  0,  8,  0, 2, 0),
 };
 
 static struct meson_bank meson_g12a_aobus_banks[] = {
-	/* name  first  last  irq  pullen  pull  dir  out  in  */
-	BANK("AO",   GPIOAO_0,  GPIOAO_11,  0, 11,
-	     3,  0,  2, 0,  0,  0,  4, 0,  1,  0),
+	/* name  first  last  irq  pullen  pull  dir  out  in  ds */
+	BANK_DS("AO", GPIOAO_0, GPIOAO_11, 0, 11, 3, 0, 2, 0, 0, 0, 4, 0, 1, 0,
+		0, 0),
 	/* GPIOE actually located in the AO bank */
-	BANK("E",   GPIOE_0,  GPIOE_2,   97, 99,
-	     3,  16,  2, 16,  0,  16,  4, 16,  1,  16),
+	BANK_DS("E", GPIOE_0, GPIOE_2, 97, 99, 3, 16, 2, 16, 0, 16, 4, 16, 1,
+		16, 1, 0),
 };
 
 static struct meson_pmx_bank meson_g12a_periphs_pmx_banks[] = {
-- 
2.17.1

