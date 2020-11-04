Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD6B02A6794
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 16:25:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730370AbgKDPZY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 10:25:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730582AbgKDPZW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 10:25:22 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8CC8C0613D3;
        Wed,  4 Nov 2020 07:25:21 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id s9so22457129wro.8;
        Wed, 04 Nov 2020 07:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NzUdG7O5plJLltDdQaAt7vQkier8SQMoP2Kz4KWpJtg=;
        b=HTy3QjZ6WeEHGWiVybXAWLAbazQm6t1Jx8qkfY8ajPoYCY66rZlKj9XOWS8b3RvnWF
         hXmUAOmPOOwBzd1uDQ/r55JsN1GuoNWTvDIS0woWukbJERH7HEf9PFL1kP+HMOzu1qfK
         dyW2oR6AM1jHNBNkc8pxvoN7xHaWvpsZvP7P+nppSDwjAbtXpsa2uLWcBniRZyPqe6Gk
         HTfOhvwuCXH4xDsHEDftgcfbuUFWS0O6jn5lUbMeDLpwZIDy9pqn+66te/tyUQQhbzRP
         NilI7jbP9mhUv1TgK1GniLP0HuIVmcF1YjS2gzp8zmnk1o/zRFVjmkVdx+50DrEb36Xt
         PSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NzUdG7O5plJLltDdQaAt7vQkier8SQMoP2Kz4KWpJtg=;
        b=cuiF8FWxrsm0kJDK1PbIb4NSmahO9brR/Fo01Gy/84DMWnOQkKNx7EseFqPYLZE1h7
         7BDo4QjiUMNQv17Y5g43fQZ13swtjqugfwxsZY0TQE0f+D9G/SiPP9m28McE6FymmqL2
         Sd/gQaIFiruGX2DBnGWErC4FVmW89w72Eped1svy2fJKRlN1vn7IP1Xm6vq71vgC8dgD
         Gj4okcJVm4BKWU2UwPW3eZ6PBB+8M1jHpc/mNU1baxEXtafA0ReHTrOG4SqVP4FBfZvF
         /xJ4skhguemSHQmrfU0qWLNDHOzVxC0yse7uLjWZH5DfG5RgUiS4YIjdP7J0GR6f5iPP
         wC0w==
X-Gm-Message-State: AOAM532ecoEOhtapV5b7pPGJOT6KgqrPahdrcKe1VzHFhEpn/NGv+evT
        M+W37qcBHooW6UuIio/hWyQ=
X-Google-Smtp-Source: ABdhPJwBKP7XMdHOEzKCA1aoTL/727GoUgoWuR5MxDyKScNUGQHAWCVtseN7CzPg+T7lgVeIhFjqPw==
X-Received: by 2002:adf:f7c3:: with SMTP id a3mr34879862wrq.254.1604503520488;
        Wed, 04 Nov 2020 07:25:20 -0800 (PST)
Received: from srv-dev.mgt.openheadend.tv (aob-ovh-4.easytools.tv. [51.210.1.153])
        by smtp.gmail.com with ESMTPSA id t2sm3050077wrw.95.2020.11.04.07.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 07:25:19 -0800 (PST)
From:   Arnaud de Turckheim <quarium@gmail.com>
To:     linus.walleij@linaro.org
Cc:     bgolaszewski@baylibre.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, vilhelm.gray@gmail.com,
        Arnaud de Turckheim <quarium@gmail.com>
Subject: [PATCH 3/3] gpio: pcie-idio-24: Enable PEX8311 interrupts
Date:   Wed,  4 Nov 2020 16:24:55 +0100
Message-Id: <20201104152455.40627-4-quarium@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104152455.40627-1-quarium@gmail.com>
References: <20201104152455.40627-1-quarium@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This enables the PEX8311 internal PCI wire interrupt and the PEX8311
local interrupt input so the local interrupts are forwarded to the PCI.

Fixes: 585562046628 ("gpio: Add GPIO support for the ACCES PCIe-IDIO-24 family")
Signed-off-by: Arnaud de Turckheim <quarium@gmail.com>
---
 drivers/gpio/gpio-pcie-idio-24.c | 52 +++++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pcie-idio-24.c b/drivers/gpio/gpio-pcie-idio-24.c
index a61de14d09b6..2a07fd96707e 100644
--- a/drivers/gpio/gpio-pcie-idio-24.c
+++ b/drivers/gpio/gpio-pcie-idio-24.c
@@ -28,6 +28,47 @@
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
+/*
+ * PLX PEX8311 PCI LCS_INTCSR Interrupt Control/Status
+ *
+ * Bit: Description
+ *   0: Enable Interrupt Sources (Bit 0)
+ *   1: Enable Interrupt Sources (Bit 1)
+ *   2: Generate Internal PCI Bus Internal SERR# Interrupt
+ *   3: Mailbox Interrupt Enable
+ *   4: Power Management Interrupt Enable
+ *   5: Power Management Interrupt
+ *   6: Slave Read Local Data Parity Check Error Enable
+ *   7: Slave Read Local Data Parity Check Error Status
+ *   8: Internal PCI Wire Interrupt Enable
+ *   9: PCI Express Doorbell Interrupt Enable
+ *  10: PCI Abort Interrupt Enable
+ *  11: Local Interrupt Input Enable
+ *  12: Retry Abort Enable
+ *  13: PCI Express Doorbell Interrupt Active
+ *  14: PCI Abort Interrupt Active
+ *  15: Local Interrupt Input Active
+ *  16: Local Interrupt Output Enable
+ *  17: Local Doorbell Interrupt Enable
+ *  18: DMA Channel 0 Interrupt Enable
+ *  19: DMA Channel 1 Interrupt Enable
+ *  20: Local Doorbell Interrupt Active
+ *  21: DMA Channel 0 Interrupt Active
+ *  22: DMA Channel 1 Interrupt Active
+ *  23: Built-In Self-Test (BIST) Interrupt Active
+ *  24: Direct Master was the Bus Master during a Master or Target Abort
+ *  25: DMA Channel 0 was the Bus Master during a Master or Target Abort
+ *  26: DMA Channel 1 was the Bus Master during a Master or Target Abort
+ *  27: Target Abort after internal 256 consecutive Master Retrys
+ *  28: PCI Bus wrote data to LCS_MBOX0
+ *  29: PCI Bus wrote data to LCS_MBOX1
+ *  30: PCI Bus wrote data to LCS_MBOX2
+ *  31: PCI Bus wrote data to LCS_MBOX3
+ */
+#define PLX_PEX8311_PCI_LCS_INTCSR  0x68
+#define INTCSR_INTERNAL_PCI_WIRE    BIT(8)
+#define INTCSR_LOCAL_INPUT          BIT(11)
+
 /**
  * struct idio_24_gpio_reg - GPIO device registers structure
  * @out0_7:	Read: FET Outputs 0-7
@@ -92,6 +133,7 @@ struct idio_24_gpio_reg {
 struct idio_24_gpio {
 	struct gpio_chip chip;
 	raw_spinlock_t lock;
+	__u8 __iomem *plx;
 	struct idio_24_gpio_reg __iomem *reg;
 	unsigned long irq_mask;
 };
@@ -455,6 +497,7 @@ static int idio_24_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct device *const dev = &pdev->dev;
 	struct idio_24_gpio *idio24gpio;
 	int err;
+	const size_t pci_plx_bar_index = 1;
 	const size_t pci_bar_index = 2;
 	const char *const name = pci_name(pdev);
 	struct gpio_irq_chip *girq;
@@ -469,12 +512,13 @@ static int idio_24_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return err;
 	}
 
-	err = pcim_iomap_regions(pdev, BIT(pci_bar_index), name);
+	err = pcim_iomap_regions(pdev, BIT(pci_plx_bar_index) | BIT(pci_bar_index), name);
 	if (err) {
 		dev_err(dev, "Unable to map PCI I/O addresses (%d)\n", err);
 		return err;
 	}
 
+	idio24gpio->plx = pcim_iomap_table(pdev)[pci_plx_bar_index];
 	idio24gpio->reg = pcim_iomap_table(pdev)[pci_bar_index];
 
 	idio24gpio->chip.label = name;
@@ -504,6 +548,12 @@ static int idio_24_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	/* Software board reset */
 	iowrite8(0, &idio24gpio->reg->soft_reset);
+	/*
+	 * enable PLX PEX8311 internal PCI wire interrupt and local interrupt
+	 * input
+	 */
+	iowrite8((INTCSR_INTERNAL_PCI_WIRE | INTCSR_LOCAL_INPUT) >> 8,
+		 idio24gpio->plx + PLX_PEX8311_PCI_LCS_INTCSR + 1);
 
 	err = devm_gpiochip_add_data(dev, &idio24gpio->chip, idio24gpio);
 	if (err) {
-- 
2.25.1

