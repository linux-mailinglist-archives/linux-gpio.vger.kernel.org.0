Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76C40455C9E
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 14:23:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230473AbhKRN0Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 08:26:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230349AbhKRN0W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Nov 2021 08:26:22 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C7EC061570
        for <linux-gpio@vger.kernel.org>; Thu, 18 Nov 2021 05:23:22 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id t30so11499991wra.10
        for <linux-gpio@vger.kernel.org>; Thu, 18 Nov 2021 05:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HruntyEK+pw1BpLtwCYk1VkoplidL3Q+Wm5DupTh6Hg=;
        b=Nj0Go1LsEp5M39tKvD7EY8KR+1eV8/kMWdoQPennxO7hRsdPfbur3RRLjiZkXGGoht
         503dMNwR+T3QV4AvUJv/uYmTcu5Xd2fJ2IXHppObUgeRgPa1AjxWXRIb9vo5M13YYpTv
         gCdhfGQIEiekpZaMjxAu/xPyGada72sjNr5pN8ZVfRmhf5ytlVT9JLedNsFee/q2qlFO
         bHNGBjQsMhw1X87H3Zaud1OJ5kJl9/zafrj5MbP6t/UklxaZevY+LJvMR9bv42yvL5vt
         atY32+8cXcLuIrPIi/SC79u+aTUMulfK0yyvKSuQRnibHta1GxBm/8uFfywqR6osUnFh
         cLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HruntyEK+pw1BpLtwCYk1VkoplidL3Q+Wm5DupTh6Hg=;
        b=4QYAXnU+iutqJVLAGC1bYNbeFO5VO16+iYYmsbeOSHb4SjIfWVRgsH0athprNiJxPZ
         CeqBPB63QWCXaUPQp1Us+FUnY7Ko+N2D7WeiahmSHur3sIjpG+zPeZlEfUrbLr52ioXq
         lUEiAQVvMLerexQ3tDxVbxFDytK2g/Z+VP3L5CvLOTuID00Ky0gpU4S2gqqbCt5hBllt
         WNim8V5Qtpc5+1j95+5UktP0Bt/SY+PYK6o3FRbKPO0u8w7tPZRwzg01PZlss/kWYGpm
         6E1tGUEvRztLaYit4F49DReSeREdzLR4E7BB6LpTZnAXWJ/YpRx2TOFPn/cCRrHbO+ur
         S7LQ==
X-Gm-Message-State: AOAM532IzrTwihhgN+nXYeVkRu62hR3PlvYbkTa4QEkWzLmE9mCMpvkU
        LKtyiq5NPDCdg5E0T1L4OPg55NRMDUfw/kjt
X-Google-Smtp-Source: ABdhPJyZ2pdFa9VXqicqdlSMFsf3Ej6ZOrK98L5UdGKCsVWnK2QRu/TR3RVw2ITykSqoqwRQzBjX0w==
X-Received: by 2002:a5d:4ecd:: with SMTP id s13mr31932335wrv.400.1637241800652;
        Thu, 18 Nov 2021 05:23:20 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id x1sm3094267wru.40.2021.11.18.05.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 05:23:20 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 1/2] gpiolib: improve coding style for local variables
Date:   Thu, 18 Nov 2021 14:23:16 +0100
Message-Id: <20211118132317.15898-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Drop unneeded whitespaces and put the variables of the same type
together for consistency with the rest of the code.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index abfbf546d159..20d63028b85c 100644
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
2.25.1

