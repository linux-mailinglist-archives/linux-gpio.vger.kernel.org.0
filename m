Return-Path: <linux-gpio+bounces-20016-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAACFAB4F90
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 11:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E79A466EAE
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 09:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E46121D3EF;
	Tue, 13 May 2025 09:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="EgJIASSY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A69C21C190;
	Tue, 13 May 2025 09:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747127993; cv=none; b=KT2wsYS4pxGi/ASyiHHfWOujCkMvs2k9YdjzAoJesnghTxBkNheteVjHJAF6u/2iUykNL2pdTxQnS84IgKahK2SU//kdLA18emxuXR/GPihpOWXSSKar+AhFXUu+x/u0nvJuC+/CZDGQ1JlrHxnmAtYgNjjL/1dzX7f37AuADco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747127993; c=relaxed/simple;
	bh=rtSyRjTECZ5Et9M3bDmL4vpi8VcFKKqiV8JKoAZieVU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m0umdEs7wE03lTDuQc0SZXkAZcgW4z9HqDSUAqjNyy4gioV7xRGITQc4AqXADbw32dY7t0nKaEFMEYjTYixR6uzquxUXNrmOHGnQ0Kg1KR7p+EAP8hgluy1flHxlc7NBXx/Ch5HKwuJBQus2VI07E2++FpqV2Rs+vO4EPBA0OoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=EgJIASSY; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747127991; x=1778663991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rtSyRjTECZ5Et9M3bDmL4vpi8VcFKKqiV8JKoAZieVU=;
  b=EgJIASSYMWF5qb2D5RQ+4VrSXEqKASGVt0r+ZCBFyQGv/tFvMx05fRKY
   VsmpjJIuql4ONTSZURRqswU/aGEgRUUmCchwOJ9ik16Q3F00v1SRKSnD4
   4KuKPqI+WusbNrnyDzEzQFnJZvc4RLBSQovyeZVczRd2PsDcmvSun7lJ0
   hfadqFpZ9KBHxgUSNC7aY0C9HWsKM0miEM3ofQM+fm4eutr/va/0HVQ9Z
   YGLHvyHAAKkhmzrCtwKM2N2UEYT3hMFnRaYuv02DLfsNdg+QeG2Ttl/FY
   YDf4SHd8qoudUaMBA0uBurtrbOBt3E112th7xCNkTE8auhr9dEqrXib0p
   A==;
X-CSE-ConnectionGUID: 4la2DOakSDynwZsvbJGMbg==
X-CSE-MsgGUID: auJ8YDCYTGmt0RUCe8/urw==
X-IronPort-AV: E=Sophos;i="6.15,284,1739862000"; 
   d="scan'208";a="209027475"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 May 2025 02:19:48 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 13 May 2025 02:19:28 -0700
Received: from che-ld-unglab06.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 13 May 2025 02:19:24 -0700
From: Rengarajan S <rengarajan.s@microchip.com>
To: <vaibhaavram.tl@microchip.com>, <kumaravel.thiagarajan@microchip.com>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <linus.walleij@linaro.org>,
	<brgl@bgdev.pl>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <unglinuxdriver@microchip.com>
CC: <rengarajan.s@microchip.com>
Subject: [PATCH v1 char-misc-next 2/2] misc: microchip: pci1xxxx: Add GPIO Wakeup Support
Date: Tue, 13 May 2025 14:45:57 +0530
Message-ID: <20250513091557.3660-3-rengarajan.s@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513091557.3660-1-rengarajan.s@microchip.com>
References: <20250513091557.3660-1-rengarajan.s@microchip.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The patch adds PIO asynchronous wakeup support while PIO PCIe Endpoint
function is in D3 state. When such a wakeup event occurs, the PIO
asserts a PIO_WAKE signal, which in turn triggers PCIe Wake signaling.
This wake request should trigger the PCIe Host to take the PIO PCIe
Endpoint function into the D0 device state.

The device supports up to 96 PIOs distributed across three GPIO banks.
During suspend and resume, the driver checks the status of each GPIO bank
to determine if any GPIOs with wake masking enabled have triggered an
event. Upon resume, PIOxx_STATUS register must be cleared by software
explicitly to enable the detection of the next transition.

Signed-off-by: Rengarajan S <rengarajan.s@microchip.com>
---
 .../misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c   | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
index 3a2a1a4ef612..847f77792f3e 100644
--- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
+++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
@@ -42,6 +42,7 @@ struct pci1xxxx_gpio {
 	raw_spinlock_t wa_lock;
 	struct gpio_chip gpio;
 	spinlock_t lock;
+	u32 gpio_wake_mask[3];
 	int irq_base;
 	u8 dev_rev;
 };
@@ -272,6 +273,22 @@ static int pci1xxxx_gpio_set_type(struct irq_data *data, unsigned int trigger_ty
 	return true;
 }
 
+static int pci1xxxx_gpio_set_wake(struct irq_data *data, unsigned int enable)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct pci1xxxx_gpio *priv = gpiochip_get_data(chip);
+	unsigned int gpio = irqd_to_hwirq(data);
+	unsigned int bitpos = gpio % 32;
+	unsigned int bank = gpio / 32;
+
+	if (enable)
+		priv->gpio_wake_mask[bank] |= (1 << bitpos);
+	else
+		priv->gpio_wake_mask[bank] &= ~(1 << bitpos);
+
+	return 0;
+}
+
 static irqreturn_t pci1xxxx_gpio_irq_handler(int irq, void *dev_id)
 {
 	struct pci1xxxx_gpio *priv = dev_id;
@@ -319,6 +336,7 @@ static const struct irq_chip pci1xxxx_gpio_irqchip = {
 	.irq_mask = pci1xxxx_gpio_irq_mask,
 	.irq_unmask = pci1xxxx_gpio_irq_unmask,
 	.irq_set_type = pci1xxxx_gpio_set_type,
+	.irq_set_wake = pci1xxxx_gpio_set_wake,
 	.flags = IRQCHIP_IMMUTABLE,
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
@@ -326,8 +344,26 @@ static const struct irq_chip pci1xxxx_gpio_irqchip = {
 static int pci1xxxx_gpio_suspend(struct device *dev)
 {
 	struct pci1xxxx_gpio *priv = dev_get_drvdata(dev);
+	struct device *parent = priv->aux_dev->dev.parent;
+	struct pci_dev *pcidev = to_pci_dev(parent);
+	unsigned int gpio_bank_base;
+	unsigned int wake_mask;
+	unsigned int gpiobank;
 	unsigned long flags;
 
+	for (gpiobank = 0; gpiobank < 3; gpiobank++) {
+		wake_mask = priv->gpio_wake_mask[gpiobank];
+
+		if (wake_mask) {
+			gpio_bank_base = gpiobank * 32;
+
+			pci1xxx_assign_bit(priv->reg_base,
+					   PIO_PCI_CTRL_REG_OFFSET, 0, true);
+			writel(~wake_mask, priv->reg_base +
+			       WAKEMASK_OFFSET(gpio_bank_base));
+		}
+	}
+
 	spin_lock_irqsave(&priv->lock, flags);
 	pci1xxx_assign_bit(priv->reg_base, PIO_GLOBAL_CONFIG_OFFSET,
 			   16, true);
@@ -340,14 +376,37 @@ static int pci1xxxx_gpio_suspend(struct device *dev)
 
 	spin_unlock_irqrestore(&priv->lock, flags);
 
+	device_set_wakeup_enable(&pcidev->dev, true);
+	pci_wake_from_d3(pcidev, true);
+
 	return 0;
 }
 
 static int pci1xxxx_gpio_resume(struct device *dev)
 {
 	struct pci1xxxx_gpio *priv = dev_get_drvdata(dev);
+	struct device *parent = priv->aux_dev->dev.parent;
+	struct pci_dev *pcidev = to_pci_dev(parent);
+	unsigned int gpio_bank_base;
+	unsigned int wake_mask;
+	unsigned int gpiobank;
 	unsigned long flags;
 
+	for (gpiobank = 0; gpiobank < 3; gpiobank++) {
+		wake_mask = priv->gpio_wake_mask[gpiobank];
+
+		if (wake_mask) {
+			gpio_bank_base = gpiobank * 32;
+
+			writel(wake_mask, priv->reg_base +
+			       INTR_STAT_OFFSET(gpio_bank_base));
+			pci1xxx_assign_bit(priv->reg_base,
+					   PIO_PCI_CTRL_REG_OFFSET, 0, false);
+			writel(0xffffffff, priv->reg_base +
+			       WAKEMASK_OFFSET(gpio_bank_base));
+		}
+	}
+
 	spin_lock_irqsave(&priv->lock, flags);
 	pci1xxx_assign_bit(priv->reg_base, PIO_GLOBAL_CONFIG_OFFSET,
 			   17, true);
@@ -360,6 +419,8 @@ static int pci1xxxx_gpio_resume(struct device *dev)
 
 	spin_unlock_irqrestore(&priv->lock, flags);
 
+	pci_wake_from_d3(pcidev, false);
+
 	return 0;
 }
 
-- 
2.25.1


