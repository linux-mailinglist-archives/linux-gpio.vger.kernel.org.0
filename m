Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0DDA9E88
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2019 11:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730973AbfIEJhI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Sep 2019 05:37:08 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33291 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730872AbfIEJhI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Sep 2019 05:37:08 -0400
Received: by mail-lj1-f195.google.com with SMTP id a22so1751641ljd.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Sep 2019 02:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HWok8ESvn5oUHq6DzXKB4zSS6zdB8hO20Hir6TileN0=;
        b=MZ52O5mt1xvE4vL7dbHocbpjJxocnJxNULhtx0+H4DKNuuq4qsZ+uQpDzdhoSCbY+s
         55tHaZ6JFcurGXVIEsGiYPyYjaAwo4r6CpowvqhqB7kEAhlmuvU6XEXyd622eIz44L2l
         KUQIqgCewHjB1Cc1NWuPVr9EmQabmyPAtUkOjb2rflNrohdAn2aMdN1c5sWwEGvCsoB+
         FuU/N2VDC7ZyLbfD76bKY/bg3iqVD2mUS+MzpNnSOihhzEtdMpo0y6smCkOGfBuXVW9x
         AXi0U9S1Mv2WoiGml8IMkL+G9SyTS1lJ9r0D38idA7QnHtoVgfStk93eaY5caiS62e6R
         FKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HWok8ESvn5oUHq6DzXKB4zSS6zdB8hO20Hir6TileN0=;
        b=CLi65ru6dTVz/lQ3oZ0bG83EX+uFzZnzhOxskhV1WMpL1dCkbLdpTlBEZtQTkoDUCR
         Q2jqR4r3cH6FrBPIKE0glVF7cC5fhpUOmBt6RBpB51humc+IIM8aWL5KAkA8+6ij4vJl
         HGMPbr/ce+vRz+2JEFebY7Ct1nHEhyDWf1Tu9RkMmfQVOqE9XUJH0W0aQi2vOhVThenm
         SLdTEIo6I/1GXqtIO83dJGDKI9jBAoDVF+yMgbfNNTLnrT3D57VUnscDcLIXxrwgm2Vi
         WqAnl5KIuJ6Y7OqOeWsQ5QSvNovmtH2mlnlhHBMXo4G5OaNEKUH5wcBI4nKTwj4HCJOO
         APLg==
X-Gm-Message-State: APjAAAVUoYvytYCNfFhx8yU401bOrccdakCAhs55lRn+tWLe4eZ9fNs9
        w/2Emu4ulIS+tUoC1Bwo41fgMHWOw9A=
X-Google-Smtp-Source: APXvYqzY+ndmBVyhTMXkh19Ml7KPoZglCosmtycYNdVYRd/GI2JhFxujKotOJhlRRGZJpSQzwMTzvw==
X-Received: by 2002:a2e:8591:: with SMTP id b17mr1373230lji.200.1567676225838;
        Thu, 05 Sep 2019 02:37:05 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id u8sm361352lfb.36.2019.09.05.02.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 02:37:04 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        YueHaibing <yuehaibing@huawei.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH] gpio: Fix up merge collision in include file
Date:   Thu,  5 Sep 2019 11:37:03 +0200
Message-Id: <20190905093703.8958-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The merge of two different patch sets cleaning around in the
main driver include file collided making the function
declarations for gpiochip_[un]lock_as_irq() be defined twice
when gpiolib was unselected. Fix it up.

Cc: YueHaibing <yuehaibing@huawei.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/linux/gpio/driver.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index b74a3bee85e5..c667ad0c099d 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -702,11 +702,12 @@ void gpiochip_free_own_desc(struct gpio_desc *desc);
 void devprop_gpiochip_set_names(struct gpio_chip *chip,
 				const struct fwnode_handle *fwnode);
 
+#ifdef CONFIG_GPIOLIB
+
 /* lock/unlock as IRQ */
 int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset);
 void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);
 
-#ifdef CONFIG_GPIOLIB
 
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
 
-- 
2.21.0

