Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F62F27A4C6
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 02:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbgI1A3q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Sep 2020 20:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgI1A3q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Sep 2020 20:29:46 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5528BC0613CE;
        Sun, 27 Sep 2020 17:29:46 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 197so6778327pge.8;
        Sun, 27 Sep 2020 17:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FaUFcogze2+V66PN/PuD4HqelSjChmCQWYPEe3k7KCw=;
        b=lmcQKamd3BmtPBY4CvR7ZeGhRsLypZhLk4bi4xJ0sIc4GGlb2zFFC732OQvolCDBD0
         tuMKryTXqns/PdKtYK1hSONmJ9D8xu2HAuWzQX71TSYRw3f4PEshNmVHp4mnaPrreL8p
         jaOcnQCdIqNbcmpeoddG1jUmNyjTEmFhuYI/mZfaolddjaDrvAxvzj+2tLhuca/fA2HH
         EssFODXTpatme3rnKkbnLnZZENgzEAHH5tLbfHE5fKE4VTz7cm+C+b/XPCzD0DDm+BAt
         nXLKLgOiSXJeFAiOJI9ZV3bXaaE4fret3KPojWY39Bs5FlFRInCFPdNOLevCLHoEjYcm
         Ht+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FaUFcogze2+V66PN/PuD4HqelSjChmCQWYPEe3k7KCw=;
        b=sH2zMy8HJJgsxfPOsq9KtAf3S/rvNitj3lQFKCLs9BC83Sweo0w6i2GTOz2q7eKpcW
         eaO7n9j9KnrQvsfKYeuIwLdBlnlnY/pHA6kTZH98ZirfucsnkaFJpmsncOC0gbiBeyBo
         47dJBR3lgkvKY0R7nOSDSYsCyf1ap+qwsTgJAs+d0UHQlu11vvFK+2u3Zpq+5/VsNJ/J
         4K2BlaVJTzX95al9jzBPMrZ57zLyJNZufZzCDAMqLCMgJo6ZT2JHE1RXWbmJKIiFUT6O
         ngXKh8qY9daYElztHdgsyWFE4olvhov/BB9+Xs2D28f3DOxHLNcB3HLsXmhsr714PPRn
         xZFw==
X-Gm-Message-State: AOAM532ZGsm/+Qs8uDjJEejj/SZz+I1bNVdti3qdaBt/RUXJ7QbCIC1W
        kxblUgTj0HdNcCfBsRWkcQEp2a4YXUOnNQ==
X-Google-Smtp-Source: ABdhPJx9UJK7KWA70L19GVWGaayldZcwasnt9C8DakqS5G/6Rl557SMZIj0EF5HiskuPjiZjy1ZqCg==
X-Received: by 2002:a17:902:ee53:b029:d1:ece5:a1d1 with SMTP id 19-20020a170902ee53b02900d1ece5a1d1mr8833168plo.63.1601252985555;
        Sun, 27 Sep 2020 17:29:45 -0700 (PDT)
Received: from sol.lan (106-69-171-132.dyn.iinet.net.au. [106.69.171.132])
        by smtp.gmail.com with ESMTPSA id o20sm8443783pgh.63.2020.09.27.17.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 17:29:45 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com, arnd@arndb.de
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v10 06/20] gpiolib: add build option for CDEV v1 ABI
Date:   Mon, 28 Sep 2020 08:27:53 +0800
Message-Id: <20200928002807.12146-7-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928002807.12146-1-warthog618@gmail.com>
References: <20200928002807.12146-1-warthog618@gmail.com>
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

