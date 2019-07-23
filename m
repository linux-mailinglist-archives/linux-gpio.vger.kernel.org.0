Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34D1971415
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2019 10:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731834AbfGWIjj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jul 2019 04:39:39 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34544 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727801AbfGWIjj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jul 2019 04:39:39 -0400
Received: by mail-pf1-f194.google.com with SMTP id b13so18781451pfo.1;
        Tue, 23 Jul 2019 01:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MXuSO8C78Thqek5HVrq9sZ6W3x/wd9TaOh5di666YdI=;
        b=SSF3E2/lYS8/CMoVqJYqxxzXPXMDA9I+XQuTqpHAFBLxKrufQ3IGz2aZblnzQBLika
         1ogfFi0TMf+aplXSvsG39XWlBsvgZ5DSvNmviI+tBm+UILMiWYAfO4btlLqO9S3ilesI
         WjBryXSDJe4EMBlIzEtytK5ryC1fiK7U8oB7hHd9aYQ0kbZlmGdGGQqu1OWrn0jaLP/t
         VSUCdpw/F7ZyzOlSYoQ7LS/Psncza0J+soSyOZkhndgB4rmnoXD/ahltvHaZjBJnqJaL
         M5owRKrcCOwENTvk5t7z1fKtPAyugdMh8vvDCMrIWq0K/sFb8/nINQvS7Sm8vlLXbDJa
         pJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MXuSO8C78Thqek5HVrq9sZ6W3x/wd9TaOh5di666YdI=;
        b=AqAj9MT89iETRKGMsmRFFsfVuW4mNe1jl0M5KUBYPB+pPIucIhHvNy7X6TSWdbKdgV
         PXprNuJF8P5yPYMNbgf+eK0PoirZWEgP2+Q04Tg36g1fSWKPPO15u+rJw5qYFKHcphWl
         sjuKj+yPCMZU811u9jahqn5vtgYChgbysfIB7sFYw6Lu/XgYTFyyqm/aV8jcLHzlX2yc
         7QP9rivh2sji/2ONudfN7loEFF3afcb1uiykLTHZpwzpwX+xzZKMl70yhlOopECGkMWJ
         8p1xV9jYogh7itrqlSba4diUpgmYDKRrn+GGT00FaroQg/gsPqWC4KkWGdTvXB+UBcBk
         vVPQ==
X-Gm-Message-State: APjAAAVYXBodpujJKOIWtrNbGGwZdSMkM9V9QB4j0xveanWTbLbAaG0I
        +um52FHGLl+mGLrFaPwJOiGfKGCL9z4=
X-Google-Smtp-Source: APXvYqy4dN6gWUnNmpcw5DoXNLcA7Y61qUdabRPhV8nynroLsZLnpPv9n/syu9vIoFNzGkG9hBw4Uw==
X-Received: by 2002:a63:b20f:: with SMTP id x15mr77767920pge.453.1563871178555;
        Tue, 23 Jul 2019 01:39:38 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
        by smtp.gmail.com with ESMTPSA id f7sm41653329pfd.43.2019.07.23.01.39.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 23 Jul 2019 01:39:37 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH v2] gpio: pch: Use dev_get_drvdata
Date:   Tue, 23 Jul 2019 16:39:24 +0800
Message-Id: <20190723083923.21392-1-hslester96@gmail.com>
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
Changes in v2:
  - Change the subject line to gpio: pch: ...

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

