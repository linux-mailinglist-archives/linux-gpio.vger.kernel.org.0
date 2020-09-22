Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBC7D2738BB
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 04:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728603AbgIVCgF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 22:36:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729924AbgIVCgF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2020 22:36:05 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CC1AC061755;
        Mon, 21 Sep 2020 19:36:05 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x22so6258398pfo.12;
        Mon, 21 Sep 2020 19:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yxKIyBLT5u8uwfgnqH40ev+Mr1LACz2e+jVMDRAal6w=;
        b=noWDh3ZC2u8vSs1HCTAdPIjLJ1WHipmYM3lFWjo9ZBKbSoN02GaaKK54x8KPhSdmEm
         M8C5mwI64iI6nQpGikVHOAHk7UwkzyZkUMrjizdAIO3YzkuWPpaHZqSdiJBkxnlGfkcq
         R+xgylD0xYC9DMIU/VRTbzUx6aD9fN+DKaIPhukcrekstTm3iOl9hA+/angESIOBhNEn
         RRzGYAtbIJ/Y/UodQEFVkxpYEHFlorZmMfmLirDzNdZ1CRPLF3/l+yjvnFKmmEQ6HD8N
         4UOL8Hkor/Stw7bImXg8TZ7umaY7OATbazGIUWTH4nTPqQCGE2bh2KAzxtzpibqmHeDY
         LXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yxKIyBLT5u8uwfgnqH40ev+Mr1LACz2e+jVMDRAal6w=;
        b=AKpFyxDuYR73k7eRonp5n2wdpLu2F8K9VI0kSI9sil+Koj6VvaFihYjTE3fiQLBwzb
         6jDl6aDzqcScj3nwxg5UjRBapzTaQOd/VNP+44BD+Y/MuhqJhgalycjX1emlMqgszqFM
         5pVBtNauKmpPqDR3KDoTxgWwRAf6Ti4L0o52X3HRNQUGY46bJgDJWfjWK8mJkXcff0hw
         AsY0FAYK1bvv1yICONsjPJ/vRGMTvDF2peECi0GXNdgPY8UNHNxYUQqkncVyphK2jAkt
         pfq8/LTPAdWnSCnnN85F++7TiDVUzo9haiCriyAFb8LiC4UUlml2hjRYKhJXVxwer9NZ
         3J3w==
X-Gm-Message-State: AOAM5329ktfnfXx1111NwS2kBE1mAZTbyPfiIPJgFxAvE10WpWziFsBw
        BoLG1TfxmP7fdsKpv8Ofv2XXJgSendZ5qQ==
X-Google-Smtp-Source: ABdhPJw8/7yjxDVPH4BEJ951eGkKjopSIBvAh74VEpmBFOgdhnaLfpKJlQFd36qYAGtXfRnFZ2CfBQ==
X-Received: by 2002:a62:5586:0:b029:13e:d13d:a12c with SMTP id j128-20020a6255860000b029013ed13da12cmr2421699pfb.20.1600742164436;
        Mon, 21 Sep 2020 19:36:04 -0700 (PDT)
Received: from sol.lan (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id j19sm13321390pfi.51.2020.09.21.19.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 19:36:03 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com
Cc:     arnd@arndb.de, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v9 11/20] gpiolib: cdev: support GPIO_V2_LINE_SET_VALUES_IOCTL
Date:   Tue, 22 Sep 2020 10:31:42 +0800
Message-Id: <20200922023151.387447-12-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922023151.387447-1-warthog618@gmail.com>
References: <20200922023151.387447-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for the GPIO_V2_LINE_SET_VALUES_IOCTL.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 61 +++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index debd3b277523..ba951f74e569 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -813,6 +813,65 @@ static long linereq_get_values(struct linereq *lr, void __user *ip)
 	return 0;
 }
 
+static long linereq_set_values_unlocked(struct linereq *lr,
+					struct gpio_v2_line_values *lv)
+{
+	DECLARE_BITMAP(vals, GPIO_V2_LINES_MAX);
+	struct gpio_desc **descs;
+	unsigned int i, didx, num_set;
+	int ret;
+
+	bitmap_zero(vals, GPIO_V2_LINES_MAX);
+	for (num_set = 0, i = 0; i < lr->num_lines; i++) {
+		if (lv->mask & BIT_ULL(i)) {
+			if (!test_bit(FLAG_IS_OUT, &lr->lines[i].desc->flags))
+				return -EPERM;
+			if (lv->bits & BIT_ULL(i))
+				__set_bit(num_set, vals);
+			num_set++;
+			descs = &lr->lines[i].desc;
+		}
+	}
+	if (num_set == 0)
+		return -EINVAL;
+
+	if (num_set != 1) {
+		/* build compacted desc array and values */
+		descs = kmalloc_array(num_set, sizeof(*descs), GFP_KERNEL);
+		if (!descs)
+			return -ENOMEM;
+		for (didx = 0, i = 0; i < lr->num_lines; i++) {
+			if (lv->mask & BIT_ULL(i)) {
+				descs[didx] = lr->lines[i].desc;
+				didx++;
+			}
+		}
+	}
+	ret = gpiod_set_array_value_complex(false, true, num_set,
+					    descs, NULL, vals);
+
+	if (num_set != 1)
+		kfree(descs);
+	return ret;
+}
+
+static long linereq_set_values(struct linereq *lr, void __user *ip)
+{
+	struct gpio_v2_line_values lv;
+	int ret;
+
+	if (copy_from_user(&lv, ip, sizeof(lv)))
+		return -EFAULT;
+
+	mutex_lock(&lr->config_mutex);
+
+	ret = linereq_set_values_unlocked(lr, &lv);
+
+	mutex_unlock(&lr->config_mutex);
+
+	return ret;
+}
+
 static long linereq_set_config_unlocked(struct linereq *lr,
 					struct gpio_v2_line_config *lc)
 {
@@ -889,6 +948,8 @@ static long linereq_ioctl(struct file *file, unsigned int cmd,
 
 	if (cmd == GPIO_V2_LINE_GET_VALUES_IOCTL)
 		return linereq_get_values(lr, ip);
+	else if (cmd == GPIO_V2_LINE_SET_VALUES_IOCTL)
+		return linereq_set_values(lr, ip);
 	else if (cmd == GPIO_V2_LINE_SET_CONFIG_IOCTL)
 		return linereq_set_config(lr, ip);
 
-- 
2.28.0

