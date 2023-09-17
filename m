Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF497A34C5
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Sep 2023 10:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234547AbjIQI7J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Sep 2023 04:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234919AbjIQI65 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Sep 2023 04:58:57 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DAF8188
        for <linux-gpio@vger.kernel.org>; Sun, 17 Sep 2023 01:58:51 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-32003aae100so450803f8f.0
        for <linux-gpio@vger.kernel.org>; Sun, 17 Sep 2023 01:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694941129; x=1695545929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zF5U5vUhnt7bE83ZTLZTj8GaOaV41Vp3W8l0qtlekwM=;
        b=1I+/BmVDu+2dmaZ0bjp81ljNqcXMRYfNXYBPFO011NQLyvGll8OIhPB9k4uTsGzvg1
         v0rw+0PXYCTZtXDa2sCC6zSyOuagt9V7qqzaXpBLm602otaKZzRnG4mgHbR5pC8rnOPv
         G1+bVm6pg2LqAv2NABPPb0iZIxVKT5Zrh9RTseBxNxUfD5vF3h29aHmvKOMjLYgpIqJm
         c5OGeZbyTPMNaJ3niMBPeM5QQpvE1ZXrxUXYvqAez3RscC/KdprfivoRsLF3nxtwLr6n
         pnK9/prtuzAUYYjgBYmkQck1cx9nCz4GeqSrotxQEr0wPyVOZuv53ojlfJbBlQGtfdMO
         IO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694941129; x=1695545929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zF5U5vUhnt7bE83ZTLZTj8GaOaV41Vp3W8l0qtlekwM=;
        b=wdm7QDjHU2C5ACwLqTRbuvxDGWt5vIJW74O1JO2e/QPzkK2NLd1MmhJ/I5PmQw5fNI
         jYOP3PXWL8f89w03TXqj1C4nP/RuVtWIkz4MgyQvddNn/7ZbPh3DhzpWdLVo0ZpTeUZJ
         2NY994UUBeE3Z7y8zbcLKM2zr2FjJw639LzbhwwLnJp2N3oSCCRQZ4uUhVYDN6MUQ+3f
         ytFVDSmmr9Wa7ief/7WHIM07yymN2XdrKtzpOWXCNGToevbytRBarouXDMG/jhNwHkNH
         NBXCY7p0fjICIQeAfQmSuaz26BIBqaThtpGVZszyscFaljd+Bolo09pn9ShhBugKMcZY
         VQyg==
X-Gm-Message-State: AOJu0YwTkWwO9KUldXf5qxIepS82JYFi4IC/5+37QenP55g8yIli3wi+
        JG/V1dZEKAguxHGRypZ+ceoR5w==
X-Google-Smtp-Source: AGHT+IEydHdPml+3W7p6F7yEBUabgaDJJPFpL1NDrKi3GE8U9IGmY8P0wFnrvxmlHNcoJj6sjS9xzA==
X-Received: by 2002:adf:fe8b:0:b0:31f:f710:a943 with SMTP id l11-20020adffe8b000000b0031ff710a943mr3980576wrr.15.1694941129567;
        Sun, 17 Sep 2023 01:58:49 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4ea0:9945:6800:8739])
        by smtp.gmail.com with ESMTPSA id r10-20020adfdc8a000000b0031aeca90e1fsm9240971wrj.70.2023.09.17.01.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 01:58:49 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        akpm@linux-foundation.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 1/2] gpio: sim: fix an invalid __free() usage
Date:   Sun, 17 Sep 2023 10:58:36 +0200
Message-Id: <20230917085837.6199-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230917085837.6199-1-brgl@bgdev.pl>
References: <20230917085837.6199-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

gpio_sim_make_line_names() returns NULL or ERR_PTR() so we must not use
__free(kfree) on the returned address. Split this function into two, one
that determines the size of the "gpio-line-names" array to allocate and
one that actually sets the names at correct offsets. The allocation and
assignment of the managed pointer happens in between.

Fixes: 3faf89f27aab ("gpio: sim: simplify code with cleanup helpers")
Reported-by: Alexey Dobriyan <adobriyan@gmail.com>
Closes: https://lore.kernel.org/all/07c32bf1-6c1a-49d9-b97d-f0ae4a2b42ab@p183/
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sim.c | 64 +++++++++++++++++++----------------------
 1 file changed, 30 insertions(+), 34 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 59cba5b5f54a..4d74ea3a4269 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -21,6 +21,7 @@
 #include <linux/irq.h>
 #include <linux/irq_sim.h>
 #include <linux/list.h>
+#include <linux/minmax.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -718,52 +719,42 @@ gpio_sim_device_config_live_show(struct config_item *item, char *page)
 	return sprintf(page, "%c\n", live ? '1' : '0');
 }
 
-static char **gpio_sim_make_line_names(struct gpio_sim_bank *bank,
-				       unsigned int *line_names_size)
+static unsigned int gpio_sim_get_line_names_size(struct gpio_sim_bank *bank)
 {
 	unsigned int max_offset = 0;
 	bool has_line_names = false;
 	struct gpio_sim_line *line;
-	char **line_names;
 
 	list_for_each_entry(line, &bank->line_list, siblings) {
-		if (line->offset >= bank->num_lines)
+		if (!line->name)
 			continue;
 
-		if (line->name) {
-			if (line->offset > max_offset)
-				max_offset = line->offset;
-
-			/*
-			 * max_offset can stay at 0 so it's not an indicator
-			 * of whether line names were configured at all.
-			 */
-			has_line_names = true;
-		}
+		has_line_names = true;
+		max_offset = max(line->offset, max_offset);
 	}
 
-	if (!has_line_names)
-		/*
-		 * This is not an error - NULL means, there are no line
-		 * names configured.
-		 */
-		return NULL;
+	/*
+	 * It's possible that only the line at offset 0 has a name in which
+	 * case max_offset will be 0 but we still want to allocate an array
+	 * of size 1.
+	 */
+	if (has_line_names)
+		max_offset++;
 
-	*line_names_size = max_offset + 1;
+	return max_offset;
+}
 
-	line_names = kcalloc(*line_names_size, sizeof(*line_names), GFP_KERNEL);
-	if (!line_names)
-		return ERR_PTR(-ENOMEM);
+static void
+gpio_sim_set_line_names(struct gpio_sim_bank *bank, char **line_names)
+{
+	struct gpio_sim_line *line;
 
 	list_for_each_entry(line, &bank->line_list, siblings) {
-		if (line->offset >= bank->num_lines)
+		if (!line->name)
 			continue;
 
-		if (line->name && (line->offset <= max_offset))
-			line_names[line->offset] = line->name;
+		line_names[line->offset] = line->name;
 	}
-
-	return line_names;
 }
 
 static void gpio_sim_remove_hogs(struct gpio_sim_device *dev)
@@ -867,7 +858,7 @@ gpio_sim_make_bank_swnode(struct gpio_sim_bank *bank,
 			  struct fwnode_handle *parent)
 {
 	struct property_entry properties[GPIO_SIM_PROP_MAX];
-	unsigned int prop_idx = 0, line_names_size = 0;
+	unsigned int prop_idx = 0, line_names_size;
 	char **line_names __free(kfree) = NULL;
 
 	memset(properties, 0, sizeof(properties));
@@ -878,14 +869,19 @@ gpio_sim_make_bank_swnode(struct gpio_sim_bank *bank,
 		properties[prop_idx++] = PROPERTY_ENTRY_STRING("gpio-sim,label",
 							       bank->label);
 
-	line_names = gpio_sim_make_line_names(bank, &line_names_size);
-	if (IS_ERR(line_names))
-		return ERR_CAST(line_names);
+	line_names_size = gpio_sim_get_line_names_size(bank);
+	if (line_names_size) {
+		line_names = kcalloc(line_names_size, sizeof(*line_names),
+				     GFP_KERNEL);
+		if (!line_names)
+			return ERR_PTR(-ENOMEM);
+
+		gpio_sim_set_line_names(bank, line_names);
 
-	if (line_names)
 		properties[prop_idx++] = PROPERTY_ENTRY_STRING_ARRAY_LEN(
 						"gpio-line-names",
 						line_names, line_names_size);
+	}
 
 	return fwnode_create_software_node(properties, parent);
 }
-- 
2.39.2

