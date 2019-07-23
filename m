Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17BF8713FD
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2019 10:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731206AbfGWI3q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jul 2019 04:29:46 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41840 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729876AbfGWI3q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jul 2019 04:29:46 -0400
Received: by mail-pl1-f196.google.com with SMTP id m9so20233495pls.8;
        Tue, 23 Jul 2019 01:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P/IhrnANi+2O2v80X4s3O9Ae0AOuA4HxAuKTn1SEfO4=;
        b=Or7q/736P9pmrzN0Z4uGLSF7JdsOo1NktSjHRB2KsG3UsdxMu/L2XlHIJemSmmVJ+W
         7nfgtIOwQh38wllJvbdagP/c9rKPiqZwN7IZy+9+vFNKCB75SbDcWhg6golzgaki6og1
         aSMI+NJ06RTVxBxoNw+hCkzQHbTfrihpkCwlKxbMatdwHmqHd8QjUvhavnBivYez7j/R
         AhZ5MgrN8ic//q/Mi3HEs/QJWmTMGtIk9v5YMrLiiFU+D2PLFqHS2QKKwM4y03QC/v/o
         0XD5tgNCIhO2kjXVnYn1JJDKlT9bCA1ZAFVIlYa5QgRY4m5XDN539LeWwS5XGUh5SRHS
         UiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P/IhrnANi+2O2v80X4s3O9Ae0AOuA4HxAuKTn1SEfO4=;
        b=JfejHGcAvcj7HT7WBMLFv7pcVguyYRiVIJNG/jgy4VTJRbvkifdQrU3+pN24fqU6YH
         eIl04z2mK+u0tfGNanql1KY0GlZXl1Tpx/jwu8Z/myeJCBaSHBJvx2zoNUjrF3EWkbk2
         XOw1SeY8yDd68RmJZvzEo5Dd/5BV83xLPyZVzZgQs3RJk+4/pyE0t+JXuHUP5fLoZeck
         Sj5dCwXmLPXJEkdG0GFiRqcsHMXSfyg4Igs7zYvA6wXioxZodpBRBKzTa8J03hPTkppa
         6uAkaJa8HHXZ46YziBGIWD3rx1JhBbrrvgdKjPn3w2HRwra3xCi4LqkU/tqYOsMAYzfE
         7zIA==
X-Gm-Message-State: APjAAAXlRVMh8oLib8c0LQB2Yqw8tQTyEWX1CP6i3jP/nS2WFamT7xux
        CZgA25tKMs+W7HOawlhOgzU=
X-Google-Smtp-Source: APXvYqyv6dsz+elxIm8kD+P8AyzZBUjM/IBZoGn8CNknZYA0S4H9CyodEx6N6ghGKBNx5E/kFBP8sg==
X-Received: by 2002:a17:902:24b:: with SMTP id 69mr76138487plc.250.1563870585552;
        Tue, 23 Jul 2019 01:29:45 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
        by smtp.gmail.com with ESMTPSA id x22sm46780579pff.5.2019.07.23.01.29.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 23 Jul 2019 01:29:45 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] gpio: Use dev_get_drvdata
Date:   Tue, 23 Jul 2019 16:29:34 +0800
Message-Id: <20190723082933.21134-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Instead of using to_pci_dev + pci_get_drvdata,
use dev_get_drvdata to make code simpler.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/gpio/gpio-pch.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index 1d99293096f2..3f3d9a94b709 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -409,8 +409,7 @@ static int pch_gpio_probe(struct pci_dev *pdev,
 
 static int __maybe_unused pch_gpio_suspend(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct pch_gpio *chip = pci_get_drvdata(pdev);
+	struct pch_gpio *chip = dev_get_drvdata(dev);
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->spinlock, flags);
@@ -422,8 +421,7 @@ static int __maybe_unused pch_gpio_suspend(struct device *dev)
 
 static int __maybe_unused pch_gpio_resume(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct pch_gpio *chip = pci_get_drvdata(pdev);
+	struct pch_gpio *chip = dev_get_drvdata(dev);
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->spinlock, flags);
-- 
2.20.1

