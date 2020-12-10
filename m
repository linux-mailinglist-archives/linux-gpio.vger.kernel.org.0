Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5187E2D5B9A
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 14:25:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732941AbgLJNYL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 08:24:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730429AbgLJNYG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 08:24:06 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6A83C061794
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:25 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id y23so5310273wmi.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MREplJn0zbz4Ws70bzs8mUZ2x7KMSkrlO7DONzE+PLI=;
        b=bF5lazIIjzdwSGmC1WrgYYoWScqDe3231rSqmhnIi5HHKBndplM7X/ANCgxI9VcJo7
         oOJYa4/ie7fIy0sKN+0c7PiTwvz7P43iJKZCMhJlqOffGIrBFOqA5zD4VuuU6w0FZ7hf
         uXKmaWaf5l4ABVK3c41RYc0UXaTdMspfjYnAoTytgkpuU4/zskX8cKlrw0wi51WEiwS2
         sjYc/6YG+Uv3p5vOrPPdUiGNC87U1E96cMCMu6GRutz68k2BXaHkhZsbgAK/LpWAp7Yw
         3O09vFnk8jZPLbDFpiFE1YuYjCkZzsZRCqJZnDOt4/pkHkXdQi9ByXsIw8SRI5UyY9Gp
         NUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MREplJn0zbz4Ws70bzs8mUZ2x7KMSkrlO7DONzE+PLI=;
        b=DEiZoSwS8DAsDkHtNApQLdKw7LbziGQAqVIC9OqWGM8UeiYWvGNOlpOytscjwvTbJ4
         Xam9zPx+U5WXXWZdAp+38CnBPUVhwDbmSXZ8Mm1Z2lb5Egqfq2ZrYdRiu5ti4oLXMiN7
         +BL+WTfXPAMTU4qcg0QsRK7Dkzjt//U4OtAFnctgYFaX/gwE0tZcBdSLGjqYU50Lzvv2
         FhbuOE62wT9+TeqbUsj8zZHIBcPdZfsKjJ9n4EMy3UWeulDXkm4/ihEGpg9RtJM6e3ov
         CuQc5TTbEu/vODxRbTYz1PsDXPg5VenN7+pFYpBA2S4/H3Je0LvFk+xBrLxDthF49tHs
         4LDQ==
X-Gm-Message-State: AOAM532cLFMemthFaI1h7BNNBHLKQfcQJGyOc9P0OkWCgK/yRFNcqveA
        VzHXOkmK5nsuXtcLk2jKfkplTFSRJg+3jw==
X-Google-Smtp-Source: ABdhPJxcv4GgNwNoD2/ZwpwxAYnnmDnWZa7HGMqUv3qfrHRgcZs0VdgwjTlmSkhZ1mFG3jiYGiUJbA==
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr7996011wmi.20.1607606604448;
        Thu, 10 Dec 2020 05:23:24 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id n14sm9444811wmi.1.2020.12.10.05.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 05:23:23 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 02/14] build: drop the message about tests having been built successfully
Date:   Thu, 10 Dec 2020 14:23:03 +0100
Message-Id: <20201210132315.5785-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201210132315.5785-1-brgl@bgdev.pl>
References: <20201210132315.5785-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This is a leftover from early times. We now have multiple different
test suites and none prints such a message. Drop it.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 tests/Makefile.am | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/tests/Makefile.am b/tests/Makefile.am
index 5c7edb6..2d3b959 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -28,15 +28,3 @@ gpiod_test_SOURCES =			\
 		tests-iter.c		\
 		tests-line.c		\
 		tests-misc.c
-
-all-local: gpiod-test
-	@echo " ********************************************************"
-	@echo " * Core tests have been built as tests/gpiod-test.      *"
-	@echo " *                                                      *"
-	@echo " * They require a recent linux kernel version and the   *"
-	@echo " * gpio-mockup module (must not be built-in).           *"
-	@echo " *                                                      *"
-	@echo " * Run the test executable with superuser privileges or *"
-	@echo " * make sure /dev/gpiochipX files are readable and      *"
-	@echo " * writable by normal users.                            *"
-	@echo " ********************************************************"
-- 
2.29.1

