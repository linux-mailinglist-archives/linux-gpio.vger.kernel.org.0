Return-Path: <linux-gpio+bounces-17557-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA882A5FD2D
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 18:13:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FDA717A648
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 17:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8602426A0AD;
	Thu, 13 Mar 2025 17:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="1HqRIU1j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1252269D1A;
	Thu, 13 Mar 2025 17:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741885994; cv=none; b=YEojLU1oMY9adMkDFF+CVOUPZbEvgtpTD2+q6iF/weGDh2CxNKtfLuN/DkQxplBBCMjyLz00QiAuRx59XwlGIjJ+u4kh+EER1XuHdui615KyZVCnpszFNX0PsLCLmsJkUB3a9lz5R1NeNIOgomFVKzfe2KayqjXD6FW4XcT75Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741885994; c=relaxed/simple;
	bh=oN3lr369097XZZEimfLGRaRCyLxlM5TEvGwm2d4Eeh0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E7g+4lhyxbK2QkmGYaZHehpQ2IdTLXVzT7p3anXBpSa8hRmdDJllD269adF9mU2OHWbG44HGr1XMqYgsUMiw3VyBBryFFlUUp0RKCzhBYEqNeQcGMd0XqKgNdiI2MXfCrHA0wmA1wnuXROD65x6wQBPgBMYpRaisWN5aPE89ZbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=1HqRIU1j; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1741885992; x=1773421992;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oN3lr369097XZZEimfLGRaRCyLxlM5TEvGwm2d4Eeh0=;
  b=1HqRIU1jUNVaoF4MYZ6+T2sIO+ktTLJJNWQhiNzIQ+cuDc0lk8R2JEjQ
   gMxiKGAdYd9JUhPBZoogkhTBka+mguM6YoBID9Ldiht20zpq3YUN0rJh1
   UJRhqa1SLxvl3LBRyOYC4xspHU/5SuQthTkyU5pe+601AyYUd3LJZgfuc
   rXs8SfLfQKEjEPKFSN2M7UMi8A0oxgwAuSz/CkC0eMIyD+Y5FQulPJHPv
   N9A13Nz4PfSJWvoCf4iemUK9aL84EaQHo74kBiKbCa4FvnkjDVANBTQWt
   Q4PzOivG2wgpANVpCElXnJkrRvpO8FYSzFOT/wbYT4e6beHhx0mbGkM3Z
   A==;
X-CSE-ConnectionGUID: NuBGJSZZTvSJoh/JmS1Gyg==
X-CSE-MsgGUID: aSKl4O3NRQGZ5S+gc52NRA==
X-IronPort-AV: E=Sophos;i="6.14,245,1736838000"; 
   d="scan'208";a="39421684"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Mar 2025 10:13:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Mar 2025 10:12:39 -0700
Received: from che-dk-ungapp03lx.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 13 Mar 2025 10:12:37 -0700
From: Rengarajan S <rengarajan.s@microchip.com>
To: <vaibhaavram.tl@microchip.com>, <kumaravel.thiagarajan@microchip.com>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <unglinuxdriver@microchip.com>
CC: <rengarajan.s@microchip.com>
Subject: [PATCH v1 char-misc-linus 1/2] misc: microchip: pci1xxxx: Fix Kernel panic during IRQ handler registration
Date: Thu, 13 Mar 2025 22:38:55 +0530
Message-ID: <20250313170856.20868-2-rengarajan.s@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250313170856.20868-1-rengarajan.s@microchip.com>
References: <20250313170856.20868-1-rengarajan.s@microchip.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Resolve kernel panic while accessing IRQ handler associated with the
generated IRQ. This is done by acquiring the spinlock and storing the
current interrupt state before handling the interrupt request using
generic_handle_irq.

A previous fix patch was submitted where 'generic_handle_irq' was
replaced with 'handle_nested_irq'. However, this change also causes
the kernel panic where after determining which GPIO triggered the
interrupt and attempting to call handle_nested_irq with the mapped
IRQ number, leads to a failure in locating the registered handler.

Fixes: 194f9f94a516 ("misc: microchip: pci1xxxx: Resolve kernel panic during GPIO IRQ handling")
Signed-off-by: Rengarajan S <rengarajan.s@microchip.com>
---
 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
index 3c1359d8d4e6..88a405b72125 100644
--- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
+++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
@@ -37,6 +37,7 @@
 struct pci1xxxx_gpio {
 	struct auxiliary_device *aux_dev;
 	void __iomem *reg_base;
+	raw_spinlock_t wa_lock;
 	struct gpio_chip gpio;
 	spinlock_t lock;
 	int irq_base;
@@ -254,6 +255,7 @@ static irqreturn_t pci1xxxx_gpio_irq_handler(int irq, void *dev_id)
 	struct pci1xxxx_gpio *priv = dev_id;
 	struct gpio_chip *gc =  &priv->gpio;
 	unsigned long int_status = 0;
+	unsigned long wa_flags;
 	unsigned long flags;
 	u8 pincount;
 	int bit;
@@ -277,7 +279,9 @@ static irqreturn_t pci1xxxx_gpio_irq_handler(int irq, void *dev_id)
 			writel(BIT(bit), priv->reg_base + INTR_STATUS_OFFSET(gpiobank));
 			spin_unlock_irqrestore(&priv->lock, flags);
 			irq = irq_find_mapping(gc->irq.domain, (bit + (gpiobank * 32)));
-			handle_nested_irq(irq);
+			raw_spin_lock_irqsave(&priv->wa_lock, wa_flags);
+			generic_handle_irq(irq);
+			raw_spin_unlock_irqrestore(&priv->wa_lock, wa_flags);
 		}
 	}
 	spin_lock_irqsave(&priv->lock, flags);
-- 
2.25.1


