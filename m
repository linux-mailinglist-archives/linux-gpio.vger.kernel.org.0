Return-Path: <linux-gpio+bounces-20015-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 822DCAB4F95
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 11:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CB308C0B27
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 09:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5C421CC5B;
	Tue, 13 May 2025 09:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="mQ75PxIP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F0D205AD0;
	Tue, 13 May 2025 09:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747127992; cv=none; b=p3bvOQPDnG3U3VsjKDc83Gx5f7b37zZy7ZBMchYjniwbdJTg3OE43iwLY/Ce4GbqjPWZTwCLZvs87RX0FEGR+YlAxs5c6ReFdtkegQq3Sol0DwLZcZ6etGS8Cz8P4YwUb0/V6C5VKZSKuY5LiHwIVVqJ0pl8fvcwg7O5oc7HaDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747127992; c=relaxed/simple;
	bh=t/GDeclfUl7VtDnK+Wy8coRC3YS8FQ1bUzgRbg7LO0I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TwFCPcD8EbjFcF+ieg/cp4RUSzohcvpOxERxYukUJFU83P8OpC1Yi+S3k1GgetRY35/vu9BrKLfslqtl5q+sqzIJEotCvrYWbEN7yQwwi30IBcKFW0Rmc/IpgZ91I9OgO7/F4n3qdZlGBJO0QKo1gtrVvZlD40967oIyvrLP210=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=mQ75PxIP; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747127990; x=1778663990;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t/GDeclfUl7VtDnK+Wy8coRC3YS8FQ1bUzgRbg7LO0I=;
  b=mQ75PxIPQbbOulSCfDWVyLK/qfraSbacxgRSBz9vKNOMonro/wYH90Fu
   /TFPPiJglB6Ze1ljKuwYmgWryDVzAoYTq9KndsDZBcdzlCYvJtJQO6+pP
   AmmGFpSyRpVd0qVUFmgsSUymappoaH5uKMwCl+CHKPb3Mmw3znpRf/fql
   rI99WvZGAGOjoF4UHR1M77YLFkBk4sRo0PaKZRDIl2Gl1wJ3PSxy+aWvB
   QeMEYuSqjZsip8WDlVhhwcQ6zEDwV0hbPVDOEnsURmdnync/ge0ZRyR13
   farWg/IR5e2FyVnz7hNCbtQs793obHL+JegAsCpYFULXnX9M2YA6kQ+YX
   w==;
X-CSE-ConnectionGUID: 4la2DOakSDynwZsvbJGMbg==
X-CSE-MsgGUID: 08aqhJ37QAe2MxO+wVss0g==
X-IronPort-AV: E=Sophos;i="6.15,284,1739862000"; 
   d="scan'208";a="209027474"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 May 2025 02:19:48 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 13 May 2025 02:19:22 -0700
Received: from che-ld-unglab06.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 13 May 2025 02:19:19 -0700
From: Rengarajan S <rengarajan.s@microchip.com>
To: <vaibhaavram.tl@microchip.com>, <kumaravel.thiagarajan@microchip.com>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <linus.walleij@linaro.org>,
	<brgl@bgdev.pl>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <unglinuxdriver@microchip.com>
CC: <rengarajan.s@microchip.com>
Subject: [PATCH v1 char-misc-next 1/2] misc: microchip: pci1xxxx: Add PCIe Hot reset disable support for Rev C0 and later devices
Date: Tue, 13 May 2025 14:45:56 +0530
Message-ID: <20250513091557.3660-2-rengarajan.s@microchip.com>
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

Systems that issue PCIe hot reset requests during a suspend/resume
cycle cause PCI1XXXX device revisions prior to C0 to get its GPIO
configuration registers reset to hardware default values. This results
in device inaccessibility and GPIO read/write failure. Starting with
Revision C0, support was added in the device hardware (via the Hot
Reset Disable Bit) to allow resetting only the PCIe interface and its
associated logic, but preserving the GPIO configurations during a hot
reset. This patch enables the hot reset disable feature during suspend/
resume for C0 and later revisions of the device.

mchp_pci1xxxx_gpio is an auxiliary child of mchp_pci1xxxx_gp and does
not have access to system register address space for reading the device
revision. Hence, the device revision is retrieved directly from PCIe
config space.

Signed-off-by: Rengarajan S <rengarajan.s@microchip.com>
---
 .../misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c   | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
index 98d3d123004c..3a2a1a4ef612 100644
--- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
+++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
@@ -7,12 +7,14 @@
 #include <linux/gpio/driver.h>
 #include <linux/bio.h>
 #include <linux/mutex.h>
+#include <linux/pci.h>
 #include <linux/kthread.h>
 #include <linux/interrupt.h>
 
 #include "mchp_pci1xxxx_gp.h"
 
 #define PCI1XXXX_NR_PINS		93
+#define PCI_DEV_REV_OFFSET		0x08
 #define PERI_GEN_RESET			0
 #define OUT_EN_OFFSET(x)		((((x) / 32) * 4) + 0x400)
 #define INP_EN_OFFSET(x)		((((x) / 32) * 4) + 0x400 + 0x10)
@@ -41,8 +43,25 @@ struct pci1xxxx_gpio {
 	struct gpio_chip gpio;
 	spinlock_t lock;
 	int irq_base;
+	u8 dev_rev;
 };
 
+static int pci1xxxx_gpio_get_device_revision(struct pci1xxxx_gpio *priv)
+{
+	struct device *parent = priv->aux_dev->dev.parent;
+	struct pci_dev *pcidev = to_pci_dev(parent);
+	int ret;
+	u32 val;
+
+	ret = pci_read_config_dword(pcidev, PCI_DEV_REV_OFFSET, &val);
+	if (ret)
+		return ret;
+
+	priv->dev_rev = val;
+
+	return 0;
+}
+
 static int pci1xxxx_gpio_get_direction(struct gpio_chip *gpio, unsigned int nr)
 {
 	struct pci1xxxx_gpio *priv = gpiochip_get_data(gpio);
@@ -315,6 +334,10 @@ static int pci1xxxx_gpio_suspend(struct device *dev)
 	pci1xxx_assign_bit(priv->reg_base, PIO_GLOBAL_CONFIG_OFFSET,
 			   17, false);
 	pci1xxx_assign_bit(priv->reg_base, PERI_GEN_RESET, 16, true);
+
+	if (priv->dev_rev >= 0xC0)
+		pci1xxx_assign_bit(priv->reg_base, PERI_GEN_RESET, 17, true);
+
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
@@ -331,6 +354,10 @@ static int pci1xxxx_gpio_resume(struct device *dev)
 	pci1xxx_assign_bit(priv->reg_base, PIO_GLOBAL_CONFIG_OFFSET,
 			   16, false);
 	pci1xxx_assign_bit(priv->reg_base, PERI_GEN_RESET, 16, false);
+
+	if (priv->dev_rev >= 0xC0)
+		pci1xxx_assign_bit(priv->reg_base, PERI_GEN_RESET, 17, false);
+
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
@@ -412,6 +439,10 @@ static int pci1xxxx_gpio_probe(struct auxiliary_device *aux_dev,
 	if (retval < 0)
 		return retval;
 
+	retval = pci1xxxx_gpio_get_device_revision(priv);
+	if (retval)
+		return retval;
+
 	dev_set_drvdata(&aux_dev->dev, priv);
 
 	return devm_gpiochip_add_data(&aux_dev->dev, &priv->gpio, priv);
-- 
2.25.1


