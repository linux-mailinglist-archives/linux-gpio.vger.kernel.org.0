Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A537649F67
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Dec 2022 14:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232258AbiLLNIB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Dec 2022 08:08:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232048AbiLLNH6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Dec 2022 08:07:58 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE14D6441
        for <linux-gpio@vger.kernel.org>; Mon, 12 Dec 2022 05:07:51 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so5071639wms.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Dec 2022 05:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M5yuV9jd97R81uDazuj6Xzn2nQRDFmr1/RjN3Yc1W2U=;
        b=8COUZHtUWTRPsp14Y0Sk3z9fvujNJj0DQepHFAVugiJvB918gp3oHwgyBkUoWq51Qa
         nnYtfpFk9AoKIdNXM1cauY2lk3TIPDGUm6k+wO6Qg8YLBj1fG1/mznNTgABWRVb3slP8
         Q6ceNEZiPiSCGcOtAtxOwdRag3a+gCGtYHg3WTLT0Ge9FilcFX9jzUxVLJKxCVflZVZh
         CVyuy9L4YC3mLOcUzVgKef8K3opHmRcadQBaLzDMkYo8SfhjpLCWSclju2SeWm4jjGLA
         QyO0+lT2v5K/vTNjJX5g9zZwghp2pv7RwbG27An9hyFd+enSXqo+zMUfEUmdqVgFrtf/
         L3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M5yuV9jd97R81uDazuj6Xzn2nQRDFmr1/RjN3Yc1W2U=;
        b=7xBwSItECGP/V75fETXmouGwk2ETv9TVfpxdYrZ+3uyiXc2bThabDhqaO0t4jHuKyH
         faeAWul23uHOos7SmbYOpbATkCwIK3Y7BZphWlI+tBtjD7aqRJCBt3fCpJSL585YYu5K
         lify8KieJ6T1Zn5Dmzes0hyNQB7McNYGUrQj+Xcw9QiiZt1Z/y2yLYUE3Z/D9Fgih8s9
         ppp7VIXMd7r8IFbSGejA6a0Bgq9C872EAzsvtouV+zZdsv3R9bGIw4JTbIQigTip9MK5
         ZzuR1mGA9CmBASpyg1pvPsbF9nDKLCZsel0vZ7GPgl3gYOtXEVeZgGKWKxc+TxusztLk
         Sy5w==
X-Gm-Message-State: ANoB5pmKdgnX16otHvSxzNiNSZ5LooSZacQZ4/M87yNjHxw6mx3yKALJ
        juQ43RszhaW3MUIWWLy4mjI35FbyjVkcd4o2
X-Google-Smtp-Source: AA0mqf4MoBDUAd5xQ6VFh8EbzCBzqe4szK5HnulC7sIiYS7H23IC2XsHAi1J0o87pRzHoT0vu+SIig==
X-Received: by 2002:a05:600c:908:b0:3d1:fb5d:dd67 with SMTP id m8-20020a05600c090800b003d1fb5ddd67mr12039182wmp.23.1670850470397;
        Mon, 12 Dec 2022 05:07:50 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:8f39:2597:6684:1762])
        by smtp.gmail.com with ESMTPSA id i2-20020a1c5402000000b003c6c182bef9sm11220360wmb.36.2022.12.12.05.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 05:07:49 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        kernel test robot <oliver.sang@intel.com>
Subject: [PATCH] gpio: sim: set a limit on the number of GPIOs
Date:   Mon, 12 Dec 2022 14:07:48 +0100
Message-Id: <20221212130748.443416-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With the removal of ARCH_NR_GPIOS in commit 7b61212f2a07 ("gpiolib: Get
rid of ARCH_NR_GPIOS") the gpiolib core no longer sanitizes the number
of GPIOs for us. This causes the gpio-sim selftests to now fail when
setting the number of GPIOs to 99999 and expecting the probe() to fail.

Set a sane limit of 1024 on the number of simulated GPIOs and bail out
of probe if it's exceeded.

Reported-by: kernel test robot <oliver.sang@intel.com>
Link: https://lore.kernel.org/oe-lkp/202212112236.756f5db9-oliver.sang@intel.com
Fixes: 7b61212f2a07 ("gpiolib: Get rid of ARCH_NR_GPIOS")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sim.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 1020c2feb249..60514bc5454f 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -31,6 +31,7 @@
 
 #include "gpiolib.h"
 
+#define GPIO_SIM_NGPIO_MAX	1024
 #define GPIO_SIM_PROP_MAX	4 /* Max 3 properties + sentinel. */
 #define GPIO_SIM_NUM_ATTRS	3 /* value, pull and sentinel */
 
@@ -371,6 +372,9 @@ static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
 	if (ret)
 		return ret;
 
+	if (num_lines > GPIO_SIM_NGPIO_MAX)
+		return -ERANGE;
+
 	ret = fwnode_property_read_string(swnode, "gpio-sim,label", &label);
 	if (ret) {
 		label = devm_kasprintf(dev, GFP_KERNEL, "%s-%s",
-- 
2.37.2

