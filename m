Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D87D2EA696
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jan 2021 09:30:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbhAEIan (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jan 2021 03:30:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbhAEIan (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2021 03:30:43 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2324C061574
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jan 2021 00:30:02 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id m25so70637515lfc.11
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2021 00:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XCq0CKJP4XYbct7XxQnom8AWCp4/ufcTG2LyUmvpIA8=;
        b=ZPm2Hr2X2vPGAyPcI7KHmRgkr0eHtHGQUn3j9XaU9d08RLW3zjTKj43ziKpiGgHuZz
         SM0FEUX9cmSkF0VpLBL4rxi5DAXynqbRorYZkoPJ8hqvczTlyuCJC9ecGq0Umohv57Zb
         T+6Cr+QKQ6h9oWrxBiLnSUKbmYNOGPTvl/SlumI1quycB5kMzzFPX8Z+hEdc7gK2uD1m
         QfVGcBehO2pmlIufsqFHxAn11MF0rNY/R2xxAoasfLPiVcbOmiH2Tgy5JyTdr2uGNz8W
         c/4IJeOy1c5FostLAmCCVQ18dk23uMUT++4YEbUeTRPrqiUoHZT1b3RyMhjqr/bWiecG
         lLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XCq0CKJP4XYbct7XxQnom8AWCp4/ufcTG2LyUmvpIA8=;
        b=WUO62M6ATmCrrJylDyvt/IOzUEud2gNHygz4hFM0eOIVUrtT71psAzA/b/WvSuh9oK
         iJNsI4zd8dvclupsJZeiNQgc7z31E9VXcvYZkjnivTHS4tM/5N5HdCCqacHOniQoTw3E
         MEkwsvnYxh2r1XgrKLj9GAcQjPOLEnvHjzOV6jWn7klYJaXTvAxkRzllrg0CxppxiSdG
         +zJHG8Vs7MGZVWnDzzMz+ACf3t4BBU1sUQG8J3epbCh2+qOBXmaZncxoMbfryL9tvl2B
         +1hgIpr5Cwk+TusFL6fqiP5O0087xpcODE6lAXz4YsXRyX08PYhu7Assl+z0VHRCY+QY
         EsEw==
X-Gm-Message-State: AOAM530BsYaXX7/SKBGBANfvPQsWFoBukvA6eVoa+rHFkU69Xas0v6uh
        jof/C92g9bik71wny0rFM8de23oh5FzSRw==
X-Google-Smtp-Source: ABdhPJyns0oGvr5eKOFzPMDnUS+9J9P+P5ToaNK9dztTYE+MFdDpjScuGLeVSuE9W+yIBPYjHr+GSg==
X-Received: by 2002:a05:651c:124c:: with SMTP id h12mr39358378ljh.294.1609835401016;
        Tue, 05 Jan 2021 00:30:01 -0800 (PST)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id c25sm7559778lfm.52.2021.01.05.00.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 00:30:00 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH v2] gpiolib: Disallow identical line names in the same chip
Date:   Tue,  5 Jan 2021 09:27:58 +0100
Message-Id: <20210105082758.77762-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We need to make this namespace hierarchical: at least do not
allow two lines on the same chip to have the same name, this
is just too much flexibility. If we name a line on a chip,
name it uniquely on that chip.

This does not affect device tree and other gpiochips that
get named from device properties: the uniqueness
per-chip however affect all hotplugged devices such as
GPIO expanders on USB.

Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Johan Hovold <johan@kernel.org>
Link: https://lore.kernel.org/r/20201212003447.238474-1-linus.walleij@linaro.org
[Dropped warning for globally unique]
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Do NOT enforce unique line names on device tree instances.
  Devicetrees know what they are doing and will make sure
  not to create conflicting naming.
---
 drivers/gpio/gpiolib.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b02cc2abd3b6..8c0c8c5306d2 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -330,11 +330,9 @@ static struct gpio_desc *gpio_name_to_desc(const char * const name)
 
 /*
  * Take the names from gc->names and assign them to their GPIO descriptors.
- * Warn if a name is already used for a GPIO line on a different GPIO chip.
  *
- * Note that:
- *   1. Non-unique names are still accepted,
- *   2. Name collisions within the same GPIO chip are not reported.
+ * - Fail if a name is already used for a GPIO line on the same chip.
+ * - Allow names to not be globally unique but warn about it.
  */
 static int gpiochip_set_desc_names(struct gpio_chip *gc)
 {
@@ -343,13 +341,14 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
 
 	/* First check all names if they are unique */
 	for (i = 0; i != gc->ngpio; ++i) {
-		struct gpio_desc *gpio;
+		struct gpio_desc *gpiod;
 
-		gpio = gpio_name_to_desc(gc->names[i]);
-		if (gpio)
-			dev_warn(&gdev->dev,
-				 "Detected name collision for GPIO name '%s'\n",
-				 gc->names[i]);
+		gpiod = gpio_name_to_desc(gc->names[i]);
+		if (gpiod && (gpiod->gdev == gdev)) {
+			dev_err(&gdev->dev,
+				"GPIO name collision on the same chip, this is not allowed, fix all lines on the chip to have unique names\n");
+			return -EEXIST;
+		}
 	}
 
 	/* Then add all names to the GPIO descriptors */
-- 
2.29.2

