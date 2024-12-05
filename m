Return-Path: <linux-gpio+bounces-13554-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB419E5767
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 14:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EEAC1883572
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 13:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB5A219A79;
	Thu,  5 Dec 2024 13:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="vKNPMwLT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD54199FBB;
	Thu,  5 Dec 2024 13:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733406036; cv=none; b=lV5IjuIU9eumA7LZ+M5PZBCkR9uDuPtOe9SFKHIIy3keSiL1OR7M1QifGQueMNCXmLXTuOfa7F1MXYI360oU5Ltq8Y/lps7Isi6u7yBxX3GlraVPVb2zVvkN0vMNsHE1F42u/Cn/zXyEyIkC6rOwG2ffLWZosug9XlvQPhYo0oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733406036; c=relaxed/simple;
	bh=WGu4eAM0Bn9VFRlXtPqGjg9NC/nn4G8A99Sd0iuwgJo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PlgDzqhAW5qJ3lWfJtC+6nCVfSiqYb6e7/ZEdaAIwuuBUpniP9ZSDVbq42uT6qVUqxto/tRM1JW+0t5sp5gUUcSl2B9kIwbcUHOzYDQyNprx0GhOzsnYs37+Qj4sSmyOFiQ+R9DUfbRu9ULzOw2BrPm2RyHyTawxOFH00gS2yfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=vKNPMwLT; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733406033; x=1764942033;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WGu4eAM0Bn9VFRlXtPqGjg9NC/nn4G8A99Sd0iuwgJo=;
  b=vKNPMwLTFhzQzdAo+xviB9Wx+PrQuDN+TPg/HI4JSDGh8eN4OQtmBoPH
   MF7wdgNjZV4gVR0+vf/lO2Rm/LYg6sFsT3D4t/M+kN4mMBe9bFL3mLTx3
   dO2aJIdPquqETZ+Ghs0dnFyAlWARUxrMc4AhApLVDJZkhET8zLLOmeL2W
   rpH2ntRRjcpRer2GpaPeTRUKpcvUXQO4NVKGZAWMkpYSWn4N2QugpXoEc
   T0KqP6JXK7S1bo19JgP7sxqGuSzFGXdCu7igAIFeR6lptt0SLJ25jeZjm
   gBkMX0GtTem9e64hq97+HbuJyI7OBzUGDEJVcTFyLMUnWXyJS63UBAEvf
   g==;
X-CSE-ConnectionGUID: pwzK5/P8TFGnVo0ml5dWew==
X-CSE-MsgGUID: mESNSH4JTd6/AeNbyiPisQ==
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="38836228"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Dec 2024 06:40:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 5 Dec 2024 06:39:59 -0700
Received: from che-dk-ungapp03lx.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 5 Dec 2024 06:39:56 -0700
From: Rengarajan S <rengarajan.s@microchip.com>
To: <vaibhaavram.tl@microchip.com>, <kumaravel.thiagarajan@microchip.com>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <unglinuxdriver@microchip.com>
CC: <rengarajan.s@microchip.com>
Subject: [PATCH v1 char-misc-linus 1/2] misc: microchip: pci1xxxx: Resolve kernel panic during GPIO IRQ handling
Date: Thu, 5 Dec 2024 19:06:25 +0530
Message-ID: <20241205133626.1483499-2-rengarajan.s@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241205133626.1483499-1-rengarajan.s@microchip.com>
References: <20241205133626.1483499-1-rengarajan.s@microchip.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Resolve kernel panic caused by improper handling of IRQs while
accessing GPIO values. This is done by replacing generic_handle_irq with
handle_nested_irq.

Fixes: 1f4d8ae231f4 ("misc: microchip: pci1xxxx: Add gpio irq handler and irq helper functions irq_ack, irq_mask, irq_unmask and irq_set_type of irq_chip.") 
Signed-off-by: Rengarajan S <rengarajan.s@microchip.com>
---
 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
index e616e3ec2b42..558290bdb938 100644
--- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
+++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
@@ -277,7 +277,7 @@ static irqreturn_t pci1xxxx_gpio_irq_handler(int irq, void *dev_id)
 			writel(BIT(bit), priv->reg_base + INTR_STATUS_OFFSET(gpiobank));
 			spin_unlock_irqrestore(&priv->lock, flags);
 			irq = irq_find_mapping(gc->irq.domain, (bit + (gpiobank * 32)));
-			generic_handle_irq(irq);
+			handle_nested_irq(irq);
 		}
 	}
 	spin_lock_irqsave(&priv->lock, flags);
-- 
2.25.1


