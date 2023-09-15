Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D12097A1ECA
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Sep 2023 14:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234909AbjIOMef (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Sep 2023 08:34:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234836AbjIOMef (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Sep 2023 08:34:35 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18175115
        for <linux-gpio@vger.kernel.org>; Fri, 15 Sep 2023 05:34:29 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-401187f8071so14212665e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 15 Sep 2023 05:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694781267; x=1695386067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RVVMN1mfiscodsKEBeruRJeoQBVr3gDmNiAY/CIpgV4=;
        b=IjCgxh87TBiHrV1SE6ETHbMXrIYYWElNSmmjo+YusbsU5KiOADizOqGsODOtKaYmNZ
         DKr82XMgGZkCciJRgR4FfjDYXhCBlT5uDfI1sIwlhTJSuZAC6rK+ZYyLVvAZ9kkUBaKs
         mjsCFPNp2PkOOlIitWPlMDUmhS3N58eeJaGl8s0b488Jh3BUFSeTgVGgf/CMSwPmd/D2
         IeSsSmnw93A03Hnuui3SLdLBxM37wgYEe8cYP3Icz2IFSiHgv8K8G+L+7TicvCpV64/F
         Ewgo2JdwdxhwTdunnsO2Ixw0PQItgTLmChqEAivKazzyefDBNw/QGdX8VsoZe9oJgQwS
         3FsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694781267; x=1695386067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RVVMN1mfiscodsKEBeruRJeoQBVr3gDmNiAY/CIpgV4=;
        b=Ch4fCYBChiWPlzLorvU1Ms1Ks3fYJeZ0dFz/O12Bt0CfZOrPIOGBgtOSDScW+BD5H1
         NUu461C4lF6NfMLRottbNIWr9lv9GHiTEY4jPrvl6LmCZi5MZdq569AWOgAv2E65u63a
         nKOOiX1DL3sFXahcq1Mxe8+87PWn0fTWoGwW8tg9X7XvC+R4Yjp9VFVi6YbUq0jpXTLV
         fjfna1skKmoQBhfRQ4rRCYEqy2W2zOCmGPhb0MW7z9L0kmKVTinSOaVoKAO6D1AXJTlJ
         XMffXD5qn9d9clmPtKlxPrAchUHQZcOJfsgg43Py1hAzlZBLBiKUEYZrt2r80ekK4n/o
         BmHw==
X-Gm-Message-State: AOJu0Yw3I7mI18VKrzJBxx5xdRmsBbhWbMuPrVgPJmDLIKGDUVOfd1G4
        jsyUFn64gXE8KlDpDPbPzc/2yw==
X-Google-Smtp-Source: AGHT+IHd7cVXJhogUvC3glrvp7pAUhSure0jmrqLqudDE/+xPJB8KYVqinjtWOUMEijpoVix98IrwQ==
X-Received: by 2002:a7b:c7cf:0:b0:404:730c:e7c1 with SMTP id z15-20020a7bc7cf000000b00404730ce7c1mr1201453wmk.15.1694781267285;
        Fri, 15 Sep 2023 05:34:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:aa19:4569:aeeb:c0d3])
        by smtp.gmail.com with ESMTPSA id p3-20020a05600c204300b003fefaf299b6sm4553110wmg.38.2023.09.15.05.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 05:34:26 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/2] gpio: sim: fix an invalid __free() usage
Date:   Fri, 15 Sep 2023 14:34:22 +0200
Message-Id: <20230915123423.75948-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

gpio_sim_make_line_names() returns NULL or ERR_PTR() so we must not use
__free(kfree) on the returned address. Let's rework the function so that
it returns the size of the gpio-line-names array or a negative error
code on failure. This way we know that the string array will either stay
NULL or be set to a correct, kcalloc()'ed address.

Fixes: 3faf89f27aab ("gpio: sim: simplify code with cleanup helpers")
Reported-by: Alexey Dobriyan <adobriyan@gmail.com>
Closes: https://lore.kernel.org/all/07c32bf1-6c1a-49d9-b97d-f0ae4a2b42ab@p183/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sim.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 2b9d9e172d5d..b4e6d06d08a2 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -717,13 +717,14 @@ gpio_sim_device_config_live_show(struct config_item *item, char *page)
 	return sprintf(page, "%c\n", live ? '1' : '0');
 }
 
-static char **gpio_sim_make_line_names(struct gpio_sim_bank *bank,
-				       unsigned int *line_names_size)
+static int gpio_sim_make_line_names(struct gpio_sim_bank *bank,
+				    char ***line_names)
 {
 	unsigned int max_offset = 0;
 	bool has_line_names = false;
 	struct gpio_sim_line *line;
-	char **line_names;
+	int line_names_size;
+	char **names;
 
 	list_for_each_entry(line, &bank->line_list, siblings) {
 		if (line->offset >= bank->num_lines)
@@ -743,26 +744,27 @@ static char **gpio_sim_make_line_names(struct gpio_sim_bank *bank,
 
 	if (!has_line_names)
 		/*
-		 * This is not an error - NULL means, there are no line
-		 * names configured.
+		 * This is not an error - 0 means, there are no line names
+		 * configured.
 		 */
-		return NULL;
+		return 0;
 
-	*line_names_size = max_offset + 1;
+	line_names_size = max_offset + 1;
 
-	line_names = kcalloc(*line_names_size, sizeof(*line_names), GFP_KERNEL);
-	if (!line_names)
-		return ERR_PTR(-ENOMEM);
+	names = kcalloc(line_names_size, sizeof(*line_names), GFP_KERNEL);
+	if (!names)
+		return -ENOMEM;
 
 	list_for_each_entry(line, &bank->line_list, siblings) {
 		if (line->offset >= bank->num_lines)
 			continue;
 
 		if (line->name && (line->offset <= max_offset))
-			line_names[line->offset] = line->name;
+			names[line->offset] = line->name;
 	}
 
-	return line_names;
+	*line_names = names;
+	return line_names_size;
 }
 
 static void gpio_sim_remove_hogs(struct gpio_sim_device *dev)
@@ -866,8 +868,9 @@ gpio_sim_make_bank_swnode(struct gpio_sim_bank *bank,
 			  struct fwnode_handle *parent)
 {
 	struct property_entry properties[GPIO_SIM_PROP_MAX];
-	unsigned int prop_idx = 0, line_names_size = 0;
 	char **line_names __free(kfree) = NULL;
+	unsigned int prop_idx = 0;
+	int line_names_size;
 
 	memset(properties, 0, sizeof(properties));
 
@@ -877,11 +880,11 @@ gpio_sim_make_bank_swnode(struct gpio_sim_bank *bank,
 		properties[prop_idx++] = PROPERTY_ENTRY_STRING("gpio-sim,label",
 							       bank->label);
 
-	line_names = gpio_sim_make_line_names(bank, &line_names_size);
-	if (IS_ERR(line_names))
-		return ERR_CAST(line_names);
+	line_names_size = gpio_sim_make_line_names(bank, &line_names);
+	if (line_names_size < 0)
+		return ERR_PTR(line_names_size);
 
-	if (line_names)
+	if (line_names_size > 0)
 		properties[prop_idx++] = PROPERTY_ENTRY_STRING_ARRAY_LEN(
 						"gpio-line-names",
 						line_names, line_names_size);
-- 
2.39.2

