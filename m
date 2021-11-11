Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06E5544DC76
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Nov 2021 21:25:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233575AbhKKU2C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Nov 2021 15:28:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233460AbhKKU2A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Nov 2021 15:28:00 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4067C061205
        for <linux-gpio@vger.kernel.org>; Thu, 11 Nov 2021 12:25:09 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id p3-20020a05600c1d8300b003334fab53afso5321522wms.3
        for <linux-gpio@vger.kernel.org>; Thu, 11 Nov 2021 12:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2q89+eCO5OTJBjwQcEdcm4YwakpritICTXy5rLsjKJE=;
        b=2oXYDeSr587m7GQrYT+XAjjuuTChhTvQ9PkoHiuoQCtg2VuX78ne04J8560Z3jbD+M
         udAuur671Glx3gcYiOL2bibHzk8F8dkSmFxDBJIv+85u+5M6//9UhdmjRxiCbEZasRW9
         QMXT/EmAKlgwHmS2rs+ewSWbxPcYZ9/D34kgx5wav1N+nkImRzZiB3ZD3xd4AmcVrW+v
         j4v8l1azCbiw/BdofTXfS/YumkJ8qvIqhgEklPZhnXiHuJsssvh5coTcxlXu9Weqx7DT
         Jmrw17cFVqG90p3F07h3RmUvfMUE2mYYYeHxzfqzf6faDmYf+Jk7jrMv8MaGFnTMTNBH
         1jgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2q89+eCO5OTJBjwQcEdcm4YwakpritICTXy5rLsjKJE=;
        b=pFCsN/pwUUbZVpdvSM2LdRwcxasvoSVxxQgioNcH+47HAcCCkj2JYWJiCBZMRGC1r7
         K2/V3WaLZ0+uKcdFoUh3iXxKZ+06WakNLTWhvrzykd7STb4nKo+9G2bfgQhmiJFN33Te
         fsdDebtF1ZptPuIBEwmm1kn7D6twYLij/QWx6vjZPfd0q2I/57DLCd3G1nznI4LkZCvE
         a/h1MmoC780wcBG4wW6OcBhWRGyzdGDGy5WC4WWuAhpU2VXw+yArZsLzBWHEmUw2AeqR
         EGSCCIkewJtGJEgTgGUfzGffy/71u0MjW8KZhd44qE1NO/n8qeFKF413C0YBSXsg4X5a
         gkxA==
X-Gm-Message-State: AOAM533ddNO4tt9ateioRLExNZovZDznabSzv/A4QWUZ9ThdaLdTlsvx
        cemhAK45suvbNPYlQ5HAmoLGPg==
X-Google-Smtp-Source: ABdhPJzJoTfVwDKyV4maNq6sdZjvFVbZzxugbHzTzHcLtFZO5Ri+wb6Y0XwVI95W3zDhdY0z4Z2Vng==
X-Received: by 2002:a7b:c14f:: with SMTP id z15mr11091547wmi.56.1636662308581;
        Thu, 11 Nov 2021 12:25:08 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id t11sm3819907wrz.97.2021.11.11.12.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 12:25:08 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 1/2] gpiolib: improve coding style for local variables
Date:   Thu, 11 Nov 2021 21:25:05 +0100
Message-Id: <20211111202506.19459-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Drop unneeded whitespaces and put the variables of the same type
together for consistency with the rest of the code.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpiolib.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d1b9b721218f..4c34c96ef136 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -594,11 +594,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 			       struct lock_class_key *request_key)
 {
 	struct fwnode_handle *fwnode = gc->parent ? dev_fwnode(gc->parent) : NULL;
-	unsigned long	flags;
-	int		ret = 0;
-	unsigned	i;
-	int		base = gc->base;
+	int ret = 0, base = gc->base;
 	struct gpio_device *gdev;
+	unsigned long flags;
+	unsigned int i;
 
 	/*
 	 * First: allocate and populate the internal stat container, and
-- 
2.30.1

