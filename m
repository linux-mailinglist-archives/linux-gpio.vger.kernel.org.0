Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD8F52738AF
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 04:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729861AbgIVCfR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 22:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728517AbgIVCfR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2020 22:35:17 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8357FC061755;
        Mon, 21 Sep 2020 19:35:17 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id o20so11057395pfp.11;
        Mon, 21 Sep 2020 19:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FaUFcogze2+V66PN/PuD4HqelSjChmCQWYPEe3k7KCw=;
        b=qymuuoC+T+QvouTXOIRokVIG3k8snkUlHM0LCFXYzjVGJd2hwWAinka5gpmMn6av0w
         ZVTjkFzy8F+da7q+Q6G2JZETnmUYTAqxQfxITZGU4ZihicW7Cfb46XqTZWkygDJuHer4
         MQfz5Ro/YeYdnGvlZ2vHLyKvqsO8i2/x15zkhYUVz4SaTqh3dbcTRvlfKMPUoPca/sP9
         H8PgSn57hp4JyDxM9aahh1oQg2CWlh78uuTnZaxrO4zZwfUvxFWLA9cY/cjq3d484IWB
         QqOCUrfLqYJI1vrtgNOHogaG0Qb+4jApM//H5dIMq8+N/xSpMBAJrQUf7UTq1gWN7vlm
         7HFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FaUFcogze2+V66PN/PuD4HqelSjChmCQWYPEe3k7KCw=;
        b=nAdeK3VaHTIR490DN1RTUgpKZVwdYgbn1HgtbvLL2xR2d66PB8AKw4aqMYB8i7M9E4
         58EhU2f+UMPhJVa2excYk3/TpOfalLXLHIumUMK+svHXJc6lNDoWTxzm3R7ZCPxZSo2w
         7FtYnWX3jQBV53qsid+x4M11dzp4kfGiDRqd8VUPxSaJRqiPKtYqXzNU76oJHwZyb3PZ
         rooYHkDqKRLtukxfbT+qCXhPJaqjtiMZtJCf0uboGkiePi6Vu0QwdYCyr0l7OMz3qJs/
         WBEhIaFQitPoshs8vNmX47YBY76La2fRVR+V8CV4x6uqkLxJEgOpF5alKXlIg2jB37MU
         uDCg==
X-Gm-Message-State: AOAM533Q7Pi8cjaEnSyqSbRjOk3qFVBP/0Ll//6R3XMsG4TO2mHu0ibz
        tnMs49pwz3OtFCngZfKHb5wOPfj3jz6wGw==
X-Google-Smtp-Source: ABdhPJwcXRsXNuJ22gLjWDdb4bZaEhcn9fKSHgpJaonxpddGRjN2848rYmulnSSM9THocc41wFo14A==
X-Received: by 2002:a62:83cb:0:b029:142:2f13:f422 with SMTP id h194-20020a6283cb0000b02901422f13f422mr2256131pfe.18.1600742116701;
        Mon, 21 Sep 2020 19:35:16 -0700 (PDT)
Received: from sol.lan (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id j19sm13321390pfi.51.2020.09.21.19.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 19:35:16 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com
Cc:     arnd@arndb.de, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v9 06/20] gpiolib: add build option for CDEV v1 ABI
Date:   Tue, 22 Sep 2020 10:31:37 +0800
Message-Id: <20200922023151.387447-7-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922023151.387447-1-warthog618@gmail.com>
References: <20200922023151.387447-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a build option to allow the removal of the CDEV v1 ABI.

Suggested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Kent Gibson <warthog618@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---

This patch is before the v2 implementation, and is non-functional until
that patch, as some parts of that patch would be written slightly
differently if removing v1 was not considered.
Adding this patch after that would necessitate revisiting the v2 changes,
so this ordering results in two simpler patches.

 drivers/gpio/Kconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e4debd66d71f..d8d086635929 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -82,6 +82,18 @@ config GPIO_CDEV
 
 	  If unsure, say Y.
 
+config GPIO_CDEV_V1
+	bool "Support GPIO ABI Version 1"
+	default y
+	depends on GPIO_CDEV
+	help
+	  Say Y here to support version 1 of the GPIO CDEV ABI.
+
+	  This ABI version is deprecated.
+	  Please use the latest ABI for new developments.
+
+	  If unsure, say Y.
+
 config GPIO_GENERIC
 	depends on HAS_IOMEM # Only for IOMEM drivers
 	tristate
-- 
2.28.0

