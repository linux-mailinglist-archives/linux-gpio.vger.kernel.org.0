Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1756C0522
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Mar 2023 22:02:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbjCSVCW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Mar 2023 17:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbjCSVCT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Mar 2023 17:02:19 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C31218A9E
        for <linux-gpio@vger.kernel.org>; Sun, 19 Mar 2023 14:02:18 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id t9so11130596qtx.8
        for <linux-gpio@vger.kernel.org>; Sun, 19 Mar 2023 14:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679259737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfG9mfcspZBE4/h8FcdjQMkctNEOZ5oA5NoomWRzGVU=;
        b=jFndtOjDkLUot7o9sc6frHEnBbzN5UuKeSzdG6epBk/jFfPp6KQd8/QaAPIdqNmO77
         wvxv1OWkeUZ6P56LJeU6S25OdI9NG3aVEb1a1xvpXeDR1tw5QigNnsQEhFDyf28wBIj1
         YX04nXPK6pJYxcQrrZ6BZjfkPe0pquxmJLKvTKrBBM18j96hgEGhgLWN1lar4tptvJwi
         mshoTWspYkXTYL97mdq2ZNA6hZ900X2+UVc1+DIL5n6uVg1f+DZyX+6Bo/YV6fIVxDFN
         xXAaK7vLAJxtOQ7bRjJJq8JXAIJK/khUJCrXt5I8XrjgyzNXKJX/sAHmajGG+4nnjLdM
         DP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679259737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xfG9mfcspZBE4/h8FcdjQMkctNEOZ5oA5NoomWRzGVU=;
        b=7qr5Cn5lanDC9OrMNtOegYvLxtNydmAV8+02nOZbnI2l9PHcou+IpVeIImICIJb9gq
         iFiFgWcr7WckEO4NqcXpSQ8gOX9KHT1XCx67hRN9Q6npH8ttR63wvGkep/ZCRYqEyfqY
         +JOZGs8iYZrRF6e7zBsTkNrcApjyGfZoN5LJ5CTLdu0/RlHTmnTT7Sgy1UPaCIO9Fg40
         p+5gBbRMHo8990tnPJ60ygaQzy4/d3373yhymg+3djmVQPG+QmdFzNIpPv6vGYzwRpE4
         4E3sv5XnROtdNdYJ+qg/vw1rVspajF7kboIMGTzSrcwCRx2GziFnNLh85VNsxblkd9aC
         vwUw==
X-Gm-Message-State: AO0yUKX0awQtavVlP5qiw1NK4/2nkwnHAQyTvV3IRnkI7XZbx38ZadKK
        wUxmIWVGWHak+chVI9NHJ0SmfZPbNww8PHYXQEY=
X-Google-Smtp-Source: AK7set/l8WaLcrtX0GZhnCyX7Ggc5Qs+U3Qs2ZWKRng+9wuO5/VkS3BWD5XZUjd1iahuVd5e98r8gg==
X-Received: by 2002:ac8:5bd1:0:b0:3d4:17dc:3feb with SMTP id b17-20020ac85bd1000000b003d417dc3febmr22403303qtb.41.1679259737379;
        Sun, 19 Mar 2023 14:02:17 -0700 (PDT)
Received: from fedora.attlocal.net (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id o16-20020ac86990000000b003bf9f9f1844sm5225762qtq.71.2023.03.19.14.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 14:02:17 -0700 (PDT)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        William Breathitt Gray <william.gray@linaro.org>
Subject: [PATCH v2 2/2] regmap-irq: Drop map from handle_mask_sync() parameters
Date:   Sun, 19 Mar 2023 17:02:02 -0400
Message-Id: <6199f345dce8b868296722560245a1e442fa100b.1679259085.git.william.gray@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1679259085.git.william.gray@linaro.org>
References: <cover.1679259085.git.william.gray@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove the map parameter from the struct regmap_irq_chip callback
handle_mask_sync() because it can be passed via the irq_drv_data
parameter instead. The gpio-104-dio-48e driver is the only consumer of
this callback and is thus updated accordingly.

Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
---
 drivers/base/regmap/regmap-irq.c | 5 ++---
 drivers/gpio/gpio-104-dio-48e.c  | 2 +-
 include/linux/regmap.h           | 3 +--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 8c903b8c9714..a9337192ddd3 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -116,8 +116,7 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 	for (i = 0; i < d->chip->num_regs; i++) {
 		if (d->mask_base) {
 			if (d->chip->handle_mask_sync)
-				d->chip->handle_mask_sync(d->map, i,
-							  d->mask_buf_def[i],
+				d->chip->handle_mask_sync(i, d->mask_buf_def[i],
 							  d->mask_buf[i],
 							  d->chip->irq_drv_data);
 			else {
@@ -915,7 +914,7 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 
 		if (d->mask_base) {
 			if (chip->handle_mask_sync) {
-				ret = chip->handle_mask_sync(d->map, i,
+				ret = chip->handle_mask_sync(i,
 							     d->mask_buf_def[i],
 							     d->mask_buf[i],
 							     chip->irq_drv_data);
diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-48e.c
index ef64c33e2685..8d7f83564886 100644
--- a/drivers/gpio/gpio-104-dio-48e.c
+++ b/drivers/gpio/gpio-104-dio-48e.c
@@ -109,7 +109,7 @@ struct dio48e_gpio {
 	unsigned int irq_mask;
 };
 
-static int dio48e_handle_mask_sync(struct regmap *const map, const int index,
+static int dio48e_handle_mask_sync(const int index,
 				   const unsigned int mask_buf_def,
 				   const unsigned int mask_buf,
 				   void *const irq_drv_data)
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 4d10790adeb0..6e18d8b405b1 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1644,8 +1644,7 @@ struct regmap_irq_chip {
 
 	int (*handle_pre_irq)(void *irq_drv_data);
 	int (*handle_post_irq)(void *irq_drv_data);
-	int (*handle_mask_sync)(struct regmap *map, int index,
-				unsigned int mask_buf_def,
+	int (*handle_mask_sync)(int index, unsigned int mask_buf_def,
 				unsigned int mask_buf, void *irq_drv_data);
 	int (*set_type_virt)(unsigned int **buf, unsigned int type,
 			     unsigned long hwirq, int reg);
-- 
2.39.2

