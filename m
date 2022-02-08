Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9854AD658
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Feb 2022 12:24:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356404AbiBHLYF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Feb 2022 06:24:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356609AbiBHKwW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Feb 2022 05:52:22 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B5B3C03FEC0
        for <linux-gpio@vger.kernel.org>; Tue,  8 Feb 2022 02:52:21 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id m14so29876944wrg.12
        for <linux-gpio@vger.kernel.org>; Tue, 08 Feb 2022 02:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0CQbxMJOnjaEmQVk1Qu6z2PqUIU60bIvzU+hkaKUKTQ=;
        b=kGidisdFa8k5KK04NQ4IRamFK7vfe6B3WMLvAD41oQPw3/IH+SfHs0iKzrH5OC46pY
         ti7QBTiqNz26HVjpA3rV87mnrbbHRr+BbfySXRK1Qaa6KLOw19mfCHOm2bfqL4gQmdpG
         hpEI8+p9eswcsULqpp6PlmkcjkB7xFoGQLJ4TCQjAgKSb0AL34/WXDuXqDwSQLScvf9+
         BauGtZyaAsZkEuSTcS/7I++xv/n8rlUh2oK8sfsJbT0NefN5TOEOsUGTHCoR0ZJbUTVM
         sLnBU8P0t5udrVaZ4cvICyBst6RC2vRYQ3hr2OO0l9b8s5XEiPl/dyS7RoXUqcKFgof4
         29gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0CQbxMJOnjaEmQVk1Qu6z2PqUIU60bIvzU+hkaKUKTQ=;
        b=3XZHEh/3M0+I7OpSrLbUaVAcNVihIK8YFLhV+H2UT6wwKTS2TR2JFyZ9ROP9v+Wjfo
         ncG64QhY8tNawG++rR8JCuEQcaPDwE/SspyZ1LDVUxyC7QT872TKcjiP7bm07g8RA/TV
         v+ynEVAFf19RXibPcMxWLzzs9sH+zkdzrBz4FHk5bUQuQgJZiXEi1QtLkZuSr8t/HDop
         V/4oqWc8LrQSbCtbuIvjN44/ltJTca03/ixrvUaKjbJHDvAyt61N/gYk2ljOSAwQUA6K
         bNMykzwC8qsxoYwA3pXAPVD9euuC6tgYul7zqsVn4mlTqehmc3AWjkGrcojTuSYibblo
         3VSg==
X-Gm-Message-State: AOAM532YnUZErGPhe1wwOFlymIAcm9L0UZWhN25wuCiDrxsBwBl5CGj5
        0GEbn+dfmoNC/rAy7KIF0NvdUw==
X-Google-Smtp-Source: ABdhPJwPLmQDqrkrL676f5NwmaSEW/gSilbINWjyNpB+LZjHjwI7o4GZNs8CXtvJFZ2duVyATkIqzw==
X-Received: by 2002:adf:da46:: with SMTP id r6mr3063168wrl.71.1644317539748;
        Tue, 08 Feb 2022 02:52:19 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id r2sm2496801wmq.0.2022.02.08.02.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 02:52:19 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] gpio: sim: fix hogs with custom chip labels
Date:   Tue,  8 Feb 2022 11:52:18 +0100
Message-Id: <20220208105218.316834-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We always assign the default device name as the chip_label in hog
structures which makes it impossible to assign hogs to chips. Let's
first check if a custom label was set and then copy it instead of the
default device name.

Fixes: cb8c474e79be ("gpio: sim: new testing module")
Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-sim.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 04b137eca8da..33df418ea8d1 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -570,6 +570,11 @@ static struct gpio_sim_bank *to_gpio_sim_bank(struct config_item *item)
 	return container_of(group, struct gpio_sim_bank, group);
 }
 
+static bool gpio_sim_bank_has_label(struct gpio_sim_bank *bank)
+{
+	return (bank->label && (strlen(bank->label) > 0));
+}
+
 static struct gpio_sim_device *
 gpio_sim_bank_get_device(struct gpio_sim_bank *bank)
 {
@@ -770,9 +775,15 @@ static int gpio_sim_add_hogs(struct gpio_sim_device *dev)
 			 * point the device doesn't exist yet and so dev_name()
 			 * is not available.
 			 */
-			hog->chip_label = kasprintf(GFP_KERNEL,
-						    "gpio-sim.%u-%s", dev->id,
-						    fwnode_get_name(bank->swnode));
+			if (gpio_sim_bank_has_label(bank))
+				hog->chip_label = kstrdup(bank->label,
+							  GFP_KERNEL);
+			else
+				hog->chip_label = kasprintf(GFP_KERNEL,
+							"gpio-sim.%u-%s",
+							dev->id,
+							fwnode_get_name(
+								bank->swnode));
 			if (!hog->chip_label) {
 				gpio_sim_remove_hogs(dev);
 				return -ENOMEM;
@@ -816,7 +827,7 @@ gpio_sim_make_bank_swnode(struct gpio_sim_bank *bank,
 
 	properties[prop_idx++] = PROPERTY_ENTRY_U32("ngpios", bank->num_lines);
 
-	if (bank->label && (strlen(bank->label) > 0))
+	if (gpio_sim_bank_has_label(bank))
 		properties[prop_idx++] = PROPERTY_ENTRY_STRING("gpio-sim,label",
 							       bank->label);
 
-- 
2.25.1

