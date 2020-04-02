Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86DEB19C673
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2020 17:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389464AbgDBPwX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Apr 2020 11:52:23 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43626 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389458AbgDBPwX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Apr 2020 11:52:23 -0400
Received: by mail-pl1-f194.google.com with SMTP id v23so1476624ply.10;
        Thu, 02 Apr 2020 08:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YDQwK1TXt5sWyVygN27BJPsqEZEizoEJ06ZdjMc3obs=;
        b=rH5FCmzfe6B+QtmKjBaCdfYPRFdbe2UG3anSu/9XKBOcO78EwTu5Q3KoAkp1A4N21N
         zxRFMchWx+9jfDcNq+3FRmv9JkK2AVl64iiYq1QisrweuDrI+3qF9sX7MKYUOlDhNKTm
         1k/dr2SM0CoP/E8sj2fKAEsly1E4gXzWfp4ydzYZzFJlvvf9NjMt4nDeNULejlUFEnsh
         JZjEt/GEyI1PmaO9vMd66pSZUWyoPz6ntuobG45NcSuB0eaxs70Y4It4p9gJuUsWfWDF
         q4mbRa6IgOVHBKQBpX9xtaFZSz7ZB6EnJNToidczW3QE1FKrG+Xy088zZSdoidh4BWhJ
         Wa8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YDQwK1TXt5sWyVygN27BJPsqEZEizoEJ06ZdjMc3obs=;
        b=bxX+ViKEGobN2z9Xm5aIl8xSZT0Fp+LJj/ReWU+9N2G/qj/8uiiwUFjSdhcYrBcjhX
         0i5JAVy0R9f7ZRb/GwhqBj6t1e9bTSLc9Ic4W3J3G7EEwUbzycEaWkgvbMM3MvpJB2Nr
         fgEASoYkrcmF0YC3xfyF4bYNl+EbbnwzCtRZ2ASei0XbmrjGogrt8KN9LpW59YbseC6c
         jzjQxBtqMMFIYEms/2sN65JwcBtMcX0hlStMiOwn/ZUun5l+SdDflo4KjKlqLtxhlxIk
         9Px1KPg6lpzAoTQnbawXqaPW+sraW5owmoinILQJiXZZn/+eYnXhkzV0FNmIf/mwy9M1
         5UTg==
X-Gm-Message-State: AGi0PuZCnX82/P8m3Lng5G61Li7cqHqp0EN9dZaan6h6yE/BWKToNbfi
        IPOt65KgSv/ZyX1gnoQrQ2WQwfpLZ1iNvQ==
X-Google-Smtp-Source: APiQypI3uFZr08x4KA3MmKiD9YqKQdV7UWSih4YpgxRNM2nRujlRgRxuIASbzfGrUs8KztbEX7s1Fw==
X-Received: by 2002:a17:90a:218b:: with SMTP id q11mr4431693pjc.163.1585842741171;
        Thu, 02 Apr 2020 08:52:21 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.63])
        by smtp.gmail.com with ESMTPSA id y4sm4051489pfo.39.2020.04.02.08.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 08:52:20 -0700 (PDT)
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     linux-kernel-mentees@lists.linuxfoundation.org,
        skhan@linuxfoundation.org, bjorn@helgaas.com, andy@kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        rjw@rjwysocki.net
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1] gpio: ml: ioh: Convert to dev_pm_ops
Date:   Thu,  2 Apr 2020 21:20:58 +0530
Message-Id: <20200402155057.30667-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the legacy callback .suspend() and .resume()
to the generic ones.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/gpio/gpio-ml-ioh.c | 47 +++++++++-----------------------------
 1 file changed, 11 insertions(+), 36 deletions(-)

diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index 92b6e958cfed..bb71dccac315 100644
--- a/drivers/gpio/gpio-ml-ioh.c
+++ b/drivers/gpio/gpio-ml-ioh.c
@@ -155,11 +155,10 @@ static int ioh_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 /*
  * Save register configuration and disable interrupts.
  */
-static void ioh_gpio_save_reg_conf(struct ioh_gpio *chip)
+static void __maybe_unused ioh_gpio_save_reg_conf(struct ioh_gpio *chip)
 {
 	int i;
 
@@ -185,7 +184,7 @@ static void ioh_gpio_save_reg_conf(struct ioh_gpio *chip)
 /*
  * This function restores the register configuration of the GPIO device.
  */
-static void ioh_gpio_restore_reg_conf(struct ioh_gpio *chip)
+static void __maybe_unused ioh_gpio_restore_reg_conf(struct ioh_gpio *chip)
 {
 	int i;
 
@@ -207,7 +206,6 @@ static void ioh_gpio_restore_reg_conf(struct ioh_gpio *chip)
 				  &chip->reg->ioh_sel_reg[i]);
 	}
 }
-#endif
 
 static int ioh_gpio_to_irq(struct gpio_chip *gpio, unsigned offset)
 {
@@ -522,10 +520,9 @@ static void ioh_gpio_remove(struct pci_dev *pdev)
 	kfree(chip);
 }
 
-#ifdef CONFIG_PM
-static int ioh_gpio_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused ioh_gpio_suspend(struct device *dev)
 {
-	s32 ret;
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct ioh_gpio *chip = pci_get_drvdata(pdev);
 	unsigned long flags;
 
@@ -533,36 +530,15 @@ static int ioh_gpio_suspend(struct pci_dev *pdev, pm_message_t state)
 	ioh_gpio_save_reg_conf(chip);
 	spin_unlock_irqrestore(&chip->spinlock, flags);
 
-	ret = pci_save_state(pdev);
-	if (ret) {
-		dev_err(&pdev->dev, "pci_save_state Failed-%d\n", ret);
-		return ret;
-	}
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, PCI_D0);
-	ret = pci_enable_wake(pdev, PCI_D0, 1);
-	if (ret)
-		dev_err(&pdev->dev, "pci_enable_wake Failed -%d\n", ret);
-
 	return 0;
 }
 
-static int ioh_gpio_resume(struct pci_dev *pdev)
+static int __maybe_unused ioh_gpio_resume(struct device *dev)
 {
-	s32 ret;
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct ioh_gpio *chip = pci_get_drvdata(pdev);
 	unsigned long flags;
 
-	ret = pci_enable_wake(pdev, PCI_D0, 0);
-
-	pci_set_power_state(pdev, PCI_D0);
-	ret = pci_enable_device(pdev);
-	if (ret) {
-		dev_err(&pdev->dev, "pci_enable_device Failed-%d ", ret);
-		return ret;
-	}
-	pci_restore_state(pdev);
-
 	spin_lock_irqsave(&chip->spinlock, flags);
 	iowrite32(0x01, &chip->reg->srst);
 	iowrite32(0x00, &chip->reg->srst);
@@ -571,10 +547,8 @@ static int ioh_gpio_resume(struct pci_dev *pdev)
 
 	return 0;
 }
-#else
-#define ioh_gpio_suspend NULL
-#define ioh_gpio_resume NULL
-#endif
+
+static SIMPLE_DEV_PM_OPS(ioh_gpio_pm_ops, ioh_gpio_suspend, ioh_gpio_resume);
 
 static const struct pci_device_id ioh_gpio_pcidev_id[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_ROHM, 0x802E) },
@@ -587,8 +561,9 @@ static struct pci_driver ioh_gpio_driver = {
 	.id_table = ioh_gpio_pcidev_id,
 	.probe = ioh_gpio_probe,
 	.remove = ioh_gpio_remove,
-	.suspend = ioh_gpio_suspend,
-	.resume = ioh_gpio_resume
+	.driver = {
+		.pm = &ioh_gpio_pm_ops,
+	},
 };
 
 module_pci_driver(ioh_gpio_driver);
-- 
2.26.0

