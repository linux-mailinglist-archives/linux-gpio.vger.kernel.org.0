Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD0195C7A
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2019 12:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728842AbfHTKpA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Aug 2019 06:45:00 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42379 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728426AbfHTKpA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Aug 2019 06:45:00 -0400
Received: by mail-lj1-f193.google.com with SMTP id l14so4643469ljj.9
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2019 03:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VS2A/MGxcv136Tyz3Wg2LYYCQiqddtxRKAPYDKMz2v8=;
        b=zUk8Yov031bCYvyNw4aC5Zb/GdsfSwJuDlPJzbyDRYY2J2gcjzR879aooluntnVJXV
         my++2cA2g2R6SopJIugaAHOCuaYO0O89Hcsf1ZzyyQ9M7ChC6YQ8L+udNuk0MZF7aS0K
         c0FSQEKDQYC66tXEGHTMIUy4g6wLkFoR35pXY1JOtNEDIAvz7tCKV4FA5GSZNOy09YfJ
         KyylY3ek7w8puWYYEsu7NoCnlMLRudinLVWcR3pzomDuNJ8xb+ZYeT9W/q5ZwG29Fjuv
         G2jn/dKhfw/BGy2aEcCRf/Cd8KG9YD5IwkUMbE6I0K8f97AOPUd3Flgk1x2kdV6YLdSD
         kn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VS2A/MGxcv136Tyz3Wg2LYYCQiqddtxRKAPYDKMz2v8=;
        b=dYideNyspdYTiIGeh7R02jCGs0ChUQ8wChPmMOoaC7pnu/GobgwEZwV/eWSTJ+aK9a
         pEGMq/CHz9SMsK6JbGsdH7K4XBlPCF1RoeT5V7C7YZesjGR3PX/veHlXytvm87EyDJMh
         mLLRiSm2xWk1BmkoW12j74TM8I4BMOxJQ7aRAw4lyAZrb2e2dii1zJllEs5KSZ5Pyn3h
         pg1xY1WrHmMfyNvkrpYjl34J8CJPtuw0sZFd54bZbg4ryWWgd3l56hLlLKkdha8/JfFx
         tZjvq5FYDnwMm9ZV6/1quCBY0A1WUc7cOZ0FyNNaye37qXOq7W6CvkkY1ochuvbBoesH
         9pKQ==
X-Gm-Message-State: APjAAAVaxdp36G6+ZJJaI2i8kMGOqQ5+ptSorwhiO114NA7T2dHzFkjp
        Xhb2ClOuEq7VtmzC2HBTLTTnjrTWdQafUg==
X-Google-Smtp-Source: APXvYqwkZEY0jPfqs1YTm1+Zh8i2/iaxcv0HwDvu+osfqk1z8H1LPYFX0Da+mujWexI0MCVN0AZ29g==
X-Received: by 2002:a2e:980d:: with SMTP id a13mr15314254ljj.145.1566297897906;
        Tue, 20 Aug 2019 03:44:57 -0700 (PDT)
Received: from localhost.localdomain (c-79c8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.200.121])
        by smtp.gmail.com with ESMTPSA id v16sm2773322lje.58.2019.08.20.03.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 03:44:56 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: rza2: Include the appropriate headers
Date:   Tue, 20 Aug 2019 12:42:52 +0200
Message-Id: <20190820104252.8255-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver is implementing a GPIO driver so include
<linux/gpio/driver.h> and not the legacy API <linux/gpio.h>.
When testing it turns out it also relies on implicit
inclusion of <linux/io.h> (readw etc) so make sure to
include that as well.

Cc: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Geert: assuming you will pick this up if you're happy
with it.
---
 drivers/pinctrl/pinctrl-rza2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rza2.c b/drivers/pinctrl/pinctrl-rza2.c
index 5b951c7422cc..a39e1c35724e 100644
--- a/drivers/pinctrl/pinctrl-rza2.c
+++ b/drivers/pinctrl/pinctrl-rza2.c
@@ -11,7 +11,8 @@
  */
 
 #include <linux/bitops.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/pinmux.h>
-- 
2.21.0

