Return-Path: <linux-gpio+bounces-17558-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39058A5FD30
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 18:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4149A3BD3B8
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 17:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBA8269D1A;
	Thu, 13 Mar 2025 17:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="a9vhazHK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E270E269D17;
	Thu, 13 Mar 2025 17:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741886012; cv=none; b=pFpxWDjlg7CLWVW47DJ/GjQoR72oYA4drui1sMhaTX6QbfN2zry5n3EGTfGthWj3mKF9kdn4tKIXCIvsUScWhCwCSuYLumWspxoGYWWbY1GGYmp1P4yjp/0A+cxbPL4c4Vfn+Anw2tF8UeiGcIGZbgO8Oi9/Z30Moe5n1OUyCAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741886012; c=relaxed/simple;
	bh=diJSF/CFhzF4mpOrg6/v7b4ce8q9oyNGZxy8T2BQuRg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NOQsqYfnuBgKpHuh/UHSExcoHu0CfSPa3KuIzrrZIEwjcZ8WVDYQojPD1obIYMOtslnr/d6WKP+ZHETk2afQOdUdoznA3Ij6TTbM39ShFNZyEU16cWv9kmoFjKTP+wX8dBX4VwGFyOOAck5EAgeSxWur9qlL6MalXI8wXBgyq3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=a9vhazHK; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1741886011; x=1773422011;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=diJSF/CFhzF4mpOrg6/v7b4ce8q9oyNGZxy8T2BQuRg=;
  b=a9vhazHKFcWQKu5XWOuM+XfRj4t+LTZZzKaQubvZRvguwUda5qqBt4U8
   LyACL4Ku+s+JxrNEQD8C7l03t48d5C4uRv569Q2sZm6Osswa2NHvkHv8k
   UO6lQvHahSmayhYFtLjPYeTSt1vthW1C7ckiZO3grm5fP3Mj7xRNvTNqV
   uRliVLatyvJO8k4sK4n3gDf9ujKho6aFmREoy9aCsqOe4HSziwNSmVKFY
   fD3Xr5dUOoM1eFDwZqTiK1Re1dGBK0Vr07n0EfS9pV3K0ZFJ5utcAyBJi
   0sdoVM9gWTXrbX+1CWOzEkfREPmEyZgK5dHOokL5r2ielrgLWZTC93FSS
   Q==;
X-CSE-ConnectionGUID: B9TUKtqzRIeSJmjgupUrQg==
X-CSE-MsgGUID: QJk0X681TY6O0QMV/WcuYA==
X-IronPort-AV: E=Sophos;i="6.14,245,1736838000"; 
   d="scan'208";a="38975338"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Mar 2025 10:13:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Mar 2025 10:12:43 -0700
Received: from che-dk-ungapp03lx.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 13 Mar 2025 10:12:40 -0700
From: Rengarajan S <rengarajan.s@microchip.com>
To: <vaibhaavram.tl@microchip.com>, <kumaravel.thiagarajan@microchip.com>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <unglinuxdriver@microchip.com>
CC: <rengarajan.s@microchip.com>
Subject: [PATCH v1 char-misc-linus 2/2] misc: microchip: pci1xxxx: Fix incorrect IRQ status handling during ack
Date: Thu, 13 Mar 2025 22:38:56 +0530
Message-ID: <20250313170856.20868-3-rengarajan.s@microchip.com>
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

Under irq_ack, pci1xxxx_assign_bit reads the current interrupt status,
modifies and writes the entire value back. Since, the IRQ status bit
gets cleared on writing back, the better approach is to directly write
the bitmask to the register in order to preserve the value.

Fixes: 1f4d8ae231f4 ("misc: microchip: pci1xxxx: Add gpio irq handler and irq helper functions irq_ack, irq_mask, irq_unmask and irq_
set_type of irq_chip.")
Signed-off-by: Rengarajan S <rengarajan.s@microchip.com>
---
 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
index 88a405b72125..55b892f982e9 100644
--- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
+++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
@@ -165,7 +165,7 @@ static void pci1xxxx_gpio_irq_ack(struct irq_data *data)
 	unsigned long flags;
 
 	spin_lock_irqsave(&priv->lock, flags);
-	pci1xxx_assign_bit(priv->reg_base, INTR_STAT_OFFSET(gpio), (gpio % 32), true);
+	writel(BIT(gpio % 32), priv->reg_base + INTR_STAT_OFFSET(gpio));
 	spin_unlock_irqrestore(&priv->lock, flags);
 }
 
-- 
2.25.1


