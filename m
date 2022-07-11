Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB0385708F1
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jul 2022 19:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbiGKRea (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jul 2022 13:34:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbiGKRe2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2022 13:34:28 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 594BA28718
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 10:34:27 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id f2so7939698wrr.6
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 10:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zhemavgI4ydhrI08UVwAiDdznt/RffszwqLG6HFDp4E=;
        b=kopdkhB7cizOyS8zahe5evUVqfwltl/0QCPTvZH71hvUsSPc2jOjIm2PAXY4XWfygd
         hMM+xLSwzYnwwhnxpjHKmbjD4V4CkZ85D6n/Gphf5LGvxPtHlUdyTtexG3rv7x8skvT8
         vPPBdRL6Nfh5QONcwlRmK7LvJ0v1gNCrTkdNrieaDYdz+styCTDPX5CvtGs/0lOUfDS4
         8ltlrhScgVm4BvARdNeHVjbxb1+kCJiyv23Q0IAiydOTtEqfvsUeU8E8t/wb54ND+UOk
         8OfrgxSRJp2Icdq4ClcU8Bx9mPWfx6XNFrqqPFcnqJpw8sw8VV2Z5yYAQuKkBk1WXCGx
         rrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zhemavgI4ydhrI08UVwAiDdznt/RffszwqLG6HFDp4E=;
        b=E5MSiVbyQvvj1W12MuSYOJvUNOsNTB+jsmixFmXWYJtLo03SvvnYp6p0N4sQfPQv71
         X9mSMooWJmwMl/Dlc0XZi3FYV5pDAU4P1mp0zEd2UDUScg8xBvxJL6VtZ3ELXJ/e2N/B
         h1v9GKY6r1I92XVXX9xgPI9q02Z+ouxBSD61M2mlbHWC+rjy88JEU6GK+6OVL6KwBd/o
         dfzAst2hJVlhoeLdkxBm/eiSM6Clz/f6JOVmDCeYqOFf52Gttwmtz5ayoEJoM/JOm5LF
         zCrYwwms8wUYPO0FlTu2RBR1XF4XgspRgYVvQVXam9BT5s7LPCvbYex6eKrnSQAET3QR
         Cgyg==
X-Gm-Message-State: AJIora+4u4UDiGonIA/KXgQ5CjA25cgHUIlVFinOG1FiP1hzCi7+omSW
        Z/M2oMPdnXyU69Zjath/4wrydA==
X-Google-Smtp-Source: AGRyM1u1G0CVskNV+B5VY74AYXJQnreMsr9SFnboxszFScdTaPz2H94fFluLFgm6nTs+9m67Row0tA==
X-Received: by 2002:a5d:584d:0:b0:21b:a3a2:d67c with SMTP id i13-20020a5d584d000000b0021ba3a2d67cmr17165271wrf.149.1657560865906;
        Mon, 11 Jul 2022 10:34:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:5ec7:cc93:2210:a24b])
        by smtp.gmail.com with ESMTPSA id m65-20020a1c2644000000b003a2e87549f6sm2821042wmm.21.2022.07.11.10.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 10:34:25 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, stable@vger.kernel.org
Subject: [PATCH] gpio: sim: fix the chip_name configfs item
Date:   Mon, 11 Jul 2022 19:34:18 +0200
Message-Id: <20220711173418.91709-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
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

The chip_name configs attribute always displays the device name of the
first GPIO bank because the logic of the relevant function is simply
wrong.

Fix it by correctly comparing the bank's swnode against the GPIO
device's children.

Fixes: cb8c474e79be ("gpio: sim: new testing module")
Cc: stable@vger.kernel.org
Reported-by: Kent Gibson <warthog618@gmail.com>
Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-sim.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 98109839102f..a370d3aec6d9 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -991,7 +991,7 @@ static struct configfs_attribute *gpio_sim_device_config_attrs[] = {
 };
 
 struct gpio_sim_chip_name_ctx {
-	struct gpio_sim_device *dev;
+	struct fwnode_handle *swnode;
 	char *page;
 };
 
@@ -999,7 +999,6 @@ static int gpio_sim_emit_chip_name(struct device *dev, void *data)
 {
 	struct gpio_sim_chip_name_ctx *ctx = data;
 	struct fwnode_handle *swnode;
-	struct gpio_sim_bank *bank;
 
 	/* This would be the sysfs device exported in /sys/class/gpio. */
 	if (dev->class)
@@ -1007,12 +1006,10 @@ static int gpio_sim_emit_chip_name(struct device *dev, void *data)
 
 	swnode = dev_fwnode(dev);
 
-	list_for_each_entry(bank, &ctx->dev->bank_list, siblings) {
-		if (bank->swnode == swnode)
-			return sprintf(ctx->page, "%s\n", dev_name(dev));
-	}
+	if (swnode == ctx->swnode)
+		return sprintf(ctx->page, "%s\n", dev_name(dev));
 
-	return -ENODATA;
+	return 0;
 }
 
 static ssize_t gpio_sim_bank_config_chip_name_show(struct config_item *item,
@@ -1020,7 +1017,7 @@ static ssize_t gpio_sim_bank_config_chip_name_show(struct config_item *item,
 {
 	struct gpio_sim_bank *bank = to_gpio_sim_bank(item);
 	struct gpio_sim_device *dev = gpio_sim_bank_get_device(bank);
-	struct gpio_sim_chip_name_ctx ctx = { dev, page };
+	struct gpio_sim_chip_name_ctx ctx = { bank->swnode, page };
 	int ret;
 
 	mutex_lock(&dev->lock);
-- 
2.34.1

