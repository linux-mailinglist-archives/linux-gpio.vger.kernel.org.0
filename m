Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88DD03F3661
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Aug 2021 00:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbhHTW13 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Aug 2021 18:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbhHTW12 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Aug 2021 18:27:28 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD62C061575
        for <linux-gpio@vger.kernel.org>; Fri, 20 Aug 2021 15:26:50 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id o1so5259190lft.9
        for <linux-gpio@vger.kernel.org>; Fri, 20 Aug 2021 15:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VBPKFOdzonYzWHkpWwxMPuwBYpPGflOedk2+9WZL3WY=;
        b=ofhMeYxQVzOhrOvSWikcz0nLPPTyezUoUUzLObfB9HP9PNLr3cO+8c4dzIs5od/hyW
         6LoqtuW1Rl+utvgW+ZUHQq8MUdHKM1xftcb5KbBegHgWm+tfSpDcIrMvmckQ2X7+oizu
         mQer7m6v9YDEQkgMuRzHcXjvkEhB245dGEbOuAWbnRNyOi1C4nXPq3pRD18Yyj3wAfMh
         p6KxkYalQsjuvl1kX6yJ45mA896LJuJdpqF2z5nSr/Tk3tqnGASbCyNC6QHj0fWAGfT8
         IKF28RfyyVxNxEiWqz7DK2xNTl1Oe1FIHMEVh+GniWuGjx2+cKBOsA8YX+/QdhVOVyA/
         KWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VBPKFOdzonYzWHkpWwxMPuwBYpPGflOedk2+9WZL3WY=;
        b=PeTXrRHtUtSsEC5uWVWyOJ953ZB/huo2Qcx/j0wLDMmuo1EGSToykCOK64pRl5uW+V
         pvND6H8VS+u9c1bcFlOl2f33PbaK/k4nGJ33otrvZHZQjaDDWn0XllEPxLIvXi5PbFJr
         9SFKFDDsRNFODKRRk2ja0Zgs7xA6dFLxiufWtleAdgQmFwu4XsPaWqSZf7jwdDLbJx/u
         SUoyRg80NG8s1vMXamb9XVteHsXiX2jNdyN1kSq3AYk8XKAiJyoacXRjDHlehEQgOevO
         mU4hDBjqjEzJCBUXrHFbRRerXT7iqjXf8x1V87WeRlg9gfhYoJZmvu1fKSiQV2nxp3uV
         UMKg==
X-Gm-Message-State: AOAM531/7fANnFsg3uyaJ8uoFNZhxDMHQUkI2sIGcMG7Ahj78zqtMTCt
        eUyxgKEmts3ndQpWPu5lyf9gFPIn9wyKQw==
X-Google-Smtp-Source: ABdhPJwCLivcHs31h7ouoQlKepQByYBG/g0znROFYOVLXzPExrKK/4Nbj28a/8B5AvBbLIQ1Mw3WsQ==
X-Received: by 2002:a05:6512:3890:: with SMTP id n16mr15952003lft.240.1629498408445;
        Fri, 20 Aug 2021 15:26:48 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id z13sm815632lfu.0.2021.08.20.15.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 15:26:48 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: ucb1400: Use proper header
Date:   Sat, 21 Aug 2021 00:24:46 +0200
Message-Id: <20210820222446.56747-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The UCB1400 implements a GPIO driver so it needs to include the
<linux/gpio/driver.h> header, not the legacy <linux/gpio.h> header.
Compile tested on pxa_defconfig.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-ucb1400.c | 1 +
 include/linux/ucb1400.h     | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ucb1400.c b/drivers/gpio/gpio-ucb1400.c
index d2a8644864c3..ab495095e9bc 100644
--- a/drivers/gpio/gpio-ucb1400.c
+++ b/drivers/gpio/gpio-ucb1400.c
@@ -7,6 +7,7 @@
 
 #include <linux/module.h>
 #include <linux/ucb1400.h>
+#include <linux/gpio/driver.h>
 
 static int ucb1400_gpio_dir_in(struct gpio_chip *gc, unsigned off)
 {
diff --git a/include/linux/ucb1400.h b/include/linux/ucb1400.h
index 0968ef458447..3a333652184f 100644
--- a/include/linux/ucb1400.h
+++ b/include/linux/ucb1400.h
@@ -23,7 +23,7 @@
 #include <sound/ac97_codec.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 
 /*
  * UCB1400 AC-link registers
-- 
2.31.1

