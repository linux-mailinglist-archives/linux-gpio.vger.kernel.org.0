Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95A9B792E82
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Sep 2023 21:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234115AbjIETM3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Sep 2023 15:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242019AbjIETMG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Sep 2023 15:12:06 -0400
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 630081A3
        for <linux-gpio@vger.kernel.org>; Tue,  5 Sep 2023 12:11:40 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5009d4a4897so4882968e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 Sep 2023 12:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940727; x=1694545527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENyvcqOYq6piL9aYNsmVNToV9MKgtDTkh/A8a81eQKQ=;
        b=oxG2R2m5kVH1DQKAze20F+mv3Jhk9EW2TxrFXXVcWxVm1sExwC2lpKhovFd/tH2Rgu
         qBLNBni4vMDqNoqckYU5SDKjwK3HL3uVid2vMHvMXrIi/xUwlqxsIdFSH8YHXV5Vbcqy
         0zPWzo2tQa9UywgAapayxFdwt3n9P026BhXjxd4EpFaQsHH5GACLZqVlEcSaiYB6XiY9
         8ptkJgnfIA4NKvorcG8UkAmBXVa5KepMiVTMs1UIHBVnSRYpnmKvtEfZp7oTL1pJYZqf
         tqyPE+WzOj3weFJDcZwBN4EuYlcbaA7Ha0q0SVmBiZReJiB5XBrvP+mIHzmV0+nG9W/Y
         fd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940727; x=1694545527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENyvcqOYq6piL9aYNsmVNToV9MKgtDTkh/A8a81eQKQ=;
        b=H38q05SDxq+h51KUvMDYWmcGGIjpCpJ8A6iX8gdOsrOwQygKdfWeEprO+120xQ4svi
         lYmjIuALLDvmRQtmJxF41Q9rJvA6b32SRRGvA+Q1dto9GuOSTzYEB7c3W0xmMQulBeEN
         z1gvUozMK6apmC/+BPKQMse515+47jegZo6MGPvbeJxurVRRM3Izi4ZLT3ZsPrF8MzDv
         6ol8XwL3RmCnjz9CReai5K8n3jQSiS+iKDdw24EVGBqCpistSkkajF2mEmZlYlPz2MPB
         MG9GXu4aImv9Eqn1Ov+sb8AIPvkf0ufWy4C5lIZAjaD2jygTheDdmqtQHhigGA0dxQVr
         /FjA==
X-Gm-Message-State: AOJu0YzDJjjT+oBnwdc8pjZBd3p8FdTyTu2sI4FHGXmso6M2elLtpD8u
        JarUENstGrHli+dJP1/fyrhsiftG2pDedKWENFU=
X-Google-Smtp-Source: AGHT+IETzIspKoYp23peY3Mtm+8LIAaFcti4lea83HydZgiIlGoA8ysWTU5DS/F06PC8tJEHYtDSiA==
X-Received: by 2002:a1c:7410:0:b0:401:d1a3:d7f7 with SMTP id p16-20020a1c7410000000b00401d1a3d7f7mr407237wmc.30.1693940025441;
        Tue, 05 Sep 2023 11:53:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:45 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 16/21] gpio: of: correct notifier return codes
Date:   Tue,  5 Sep 2023 20:53:04 +0200
Message-Id: <20230905185309.131295-17-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905185309.131295-1-brgl@bgdev.pl>
References: <20230905185309.131295-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

According to the comments in linux/notifier.h, the code to return when a
notifications is "not for us" is NOTIFY_DONE, not NOTIFY_OK.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-of.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 531faabead0f..5515f32cf19b 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -834,14 +834,14 @@ static int of_gpio_notify(struct notifier_block *nb, unsigned long action,
 	switch (of_reconfig_get_state_change(action, arg)) {
 	case OF_RECONFIG_CHANGE_ADD:
 		if (!of_property_read_bool(rd->dn, "gpio-hog"))
-			return NOTIFY_OK;	/* not for us */
+			return NOTIFY_DONE;	/* not for us */
 
 		if (of_node_test_and_set_flag(rd->dn, OF_POPULATED))
-			return NOTIFY_OK;
+			return NOTIFY_DONE;
 
 		chip = of_find_gpiochip_by_node(rd->dn->parent);
 		if (chip == NULL)
-			return NOTIFY_OK;	/* not for us */
+			return NOTIFY_DONE;	/* not for us */
 
 		ret = of_gpiochip_add_hog(chip, rd->dn);
 		if (ret < 0) {
@@ -850,22 +850,22 @@ static int of_gpio_notify(struct notifier_block *nb, unsigned long action,
 			of_node_clear_flag(rd->dn, OF_POPULATED);
 			return notifier_from_errno(ret);
 		}
-		break;
+		return NOTIFY_OK;
 
 	case OF_RECONFIG_CHANGE_REMOVE:
 		if (!of_node_check_flag(rd->dn, OF_POPULATED))
-			return NOTIFY_OK;	/* already depopulated */
+			return NOTIFY_DONE;	/* already depopulated */
 
 		chip = of_find_gpiochip_by_node(rd->dn->parent);
 		if (chip == NULL)
-			return NOTIFY_OK;	/* not for us */
+			return NOTIFY_DONE;	/* not for us */
 
 		of_gpiochip_remove_hog(chip, rd->dn);
 		of_node_clear_flag(rd->dn, OF_POPULATED);
-		break;
+		return NOTIFY_OK;
 	}
 
-	return NOTIFY_OK;
+	return NOTIFY_DONE;
 }
 
 struct notifier_block gpio_of_notifier = {
-- 
2.39.2

