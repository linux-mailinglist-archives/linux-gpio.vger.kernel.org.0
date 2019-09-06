Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37E3FAB562
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 12:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbfIFKIG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Sep 2019 06:08:06 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37284 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfIFKIG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Sep 2019 06:08:06 -0400
Received: by mail-lf1-f66.google.com with SMTP id w67so4530805lff.4
        for <linux-gpio@vger.kernel.org>; Fri, 06 Sep 2019 03:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kms00KK7xrS9j+PsdEtET2aQsT/1Gao5klx1Mqds7jQ=;
        b=zq8Ne7JsEEGIlolTC72WD2gU+yulL5Z37xCsgdxRMmarme3nTBLwX6Oi1JpoCMlNz+
         LKSv6l3Cy0N9Qmkhl9rquqV0oemNLId+tXo36ACBxiDpuAEaFasxZjd/dmhy62uWqK0q
         wZDlMYlRXdhTbsEz/Enk4Nk2XoZvHPPXHS8qZgcYPzLMIV4kB6gsEXBQZiPtL5NT9cuV
         PvVVNDNYOoG+BNNV2Pi1gKwxJwy0976bRloh2OwXGm+RjsoOyr99yRCK1425ZvMVm76m
         dr+I6KiO9wAiv+Cn1jqsLhH74G2J0ectZAq7hAMYfLalxIa98oYGIrlXSA9dQYzGAPo0
         BDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kms00KK7xrS9j+PsdEtET2aQsT/1Gao5klx1Mqds7jQ=;
        b=g3OvbvIt+kQuL9E0yNvF99PPVoQL/BlHyYlsooR7u82LlOoNwgHK9BCnAYuXq3Q/j2
         KP3mHikwdkwFKh8MxH0dX4JyN/DOjHLDAdUCSnw/lvuVPpiIgQj90sPU8yc+aA+mAobP
         4rjlF69SdM4leNF5sRwiCEua7gxYF1b/63KZzoJsBlcpV0wUovqNA+hf2AmxQk8vekKP
         LTiW6x3NUTjGG2ohPnmHm/HPb15h8wEYVAqq0eoTKF7i4ljN9bJregQPTCtDyg9c9RBh
         ZsBcLn+Wflc/U7CLMDAP/Wbd+/eO95pSY7dQdV3GGPWcU5XPjumNL3sCR8zhx+4FXLZo
         aqiA==
X-Gm-Message-State: APjAAAX7Zjw3osSYahVxRWwGWKIR8H46p6ZOQ4T25TYCl/yAEPdXO+o7
        DIz5VesFhfZuHOGZfwgJrKTpXrqJhG5uOgKS
X-Google-Smtp-Source: APXvYqzogTs2/j47DUcbrtgTISHABSnGzXlTpfF1Ms/EkTC+iWdJIClgWqOBuBrGx+j9KBLF4YRxGw==
X-Received: by 2002:ac2:5483:: with SMTP id t3mr5834863lfk.39.1567764484348;
        Fri, 06 Sep 2019 03:08:04 -0700 (PDT)
Received: from localhost.localdomain ([185.122.190.73])
        by smtp.gmail.com with ESMTPSA id h21sm846481ljg.34.2019.09.06.03.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 03:08:03 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: Fix further merge errors
Date:   Fri,  6 Sep 2019 12:08:01 +0200
Message-Id: <20190906100801.5752-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The previous merge of v5.3-rc7 was struggle enough, now it
gave rise to new errors and now I fix those too.

Fixes: 151a41014bff ("Merge tag 'v5.3-rc7' into devel")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5b351f87c50a..56d0898d94aa 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1399,12 +1399,12 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 
 	machine_gpiochip_add(chip);
 
-	status = gpiochip_irqchip_init_valid_mask(chip);
-	if (status)
+	ret = gpiochip_irqchip_init_valid_mask(chip);
+	if (ret)
 		goto err_remove_acpi_chip;
 
-	status = gpiochip_add_irqchip(chip, lock_key, request_key);
-	if (status)
+	ret = gpiochip_add_irqchip(chip, lock_key, request_key);
+	if (ret)
 		goto err_remove_irqchip_mask;
 
 	/*
-- 
2.21.0

