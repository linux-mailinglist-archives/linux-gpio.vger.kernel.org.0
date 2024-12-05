Return-Path: <linux-gpio+bounces-13556-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF7A9E57E7
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 14:53:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4CF22844E4
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 13:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CE3219A65;
	Thu,  5 Dec 2024 13:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="2TJ3bdqC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A15218AD1;
	Thu,  5 Dec 2024 13:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733406830; cv=none; b=pxhXTplKAFcb98jO6mcWuRN8Xq9ouUaDjP85YrXQimlxuFf94pcV4ETZbsPHhXb4eAHYve22+vTNh/lxV4knaTWhKCXIZcZEg+Pcyj1G+hlQ4h3HS420Mx7PDzDuWp5bZp+NdbMIT7E7YZaJEJIt/p1uRBItLBBlr5ltPnOAd7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733406830; c=relaxed/simple;
	bh=87CtAFswNqX8OzkNCWJ31kn/Mx2fGShPdAZ4M+NEuFw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MZKKFFpbiQCaBXOdUbUv6iN4PVQnGFltY7lsXLVaEQ8Aou94J3fRomYgdTlIKJ7bYjA6HyPepO5qbSdbY2W0c0F5yQ1Ih9b47fJZlGUFLzKyA3DB19nv+qiCI4Ebhog7H4N8gaS+l79/5AwCEbvVoMl98dVhv40vkzbjmC7SJoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=2TJ3bdqC; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733406829; x=1764942829;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=87CtAFswNqX8OzkNCWJ31kn/Mx2fGShPdAZ4M+NEuFw=;
  b=2TJ3bdqCBv6uXDBBAoOeKMMm8YYe1Wz5sATbOKeC2hHwcdh4RRAMdSQQ
   ZN/0dpWtOodaBIH7SW8I1oQEix113tKIxhx4E3ULLlku3kDxV4kE0hhjv
   etXfqlpBT0cyiQyCDrjLAu8rzGSWUX4njIze02ESu3krGnyvzH9ywCnUY
   u3f4S/xsXL3l0+yWUtsroZk9Ew09kKU+I6KjBe79CqjTpuRAdiEI/ZJ8V
   m1N3CcKqCdltD3p+U/Ic1C6QWWQ+Dd7ImPurIXbs0fzxN+DyJ6waS0GM0
   haf8ammsraqK+KrmwOdkLhtIEVX+5NwiPsInF3kB+kd38+g69sE/as2JD
   g==;
X-CSE-ConnectionGUID: 51PJrYFFSXOalleqFAFaug==
X-CSE-MsgGUID: wcojJ4enTFaRZGWKLDsWqQ==
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="35177635"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Dec 2024 06:53:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 5 Dec 2024 06:53:24 -0700
Received: from che-dk-ungapp03lx.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 5 Dec 2024 06:53:22 -0700
From: Rengarajan S <rengarajan.s@microchip.com>
To: <vaibhaavram.tl@microchip.com>, <kumaravel.thiagarajan@microchip.com>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <unglinuxdriver@microchip.com>
CC: <rengarajan.s@microchip.com>
Subject: [PATCH v1 char-misc-next] misc: microchip: pci1xxxx: Add push-pull drive support for GPIO
Date: Thu, 5 Dec 2024 19:19:56 +0530
Message-ID: <20241205134956.1493091-1-rengarajan.s@microchip.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add support to configure GPIO pins for push-pull drive mode.

Signed-off-by: Rengarajan S <rengarajan.s@microchip.com>
---
 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
index e616e3ec2b42..97c7dbe43377 100644
--- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
+++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
@@ -147,6 +147,9 @@ static int pci1xxxx_gpio_set_config(struct gpio_chip *gpio, unsigned int offset,
 	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
 		pci1xxx_assign_bit(priv->reg_base, OPENDRAIN_OFFSET(offset), (offset % 32), true);
 		break;
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		pci1xxx_assign_bit(priv->reg_base, OPENDRAIN_OFFSET(offset), (offset % 32), false);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
-- 
2.25.1


