Return-Path: <linux-gpio+bounces-13555-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A7B9E5768
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 14:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8961B188379A
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 13:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77283219A85;
	Thu,  5 Dec 2024 13:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="OM21bqk4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98711218EBB;
	Thu,  5 Dec 2024 13:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733406036; cv=none; b=ZgFWiCx6qmkOG4ZjDtjMzGooRH5KWJva2Y9E/VJVdkcKVVHxQMBz3+1Ke9sQ02sh2Pw07OcadTLCVtSwv5G8gzB46hj0kkGouRBboJJe1z0CmyXeR7F9SXK005s/eGfbEW3cT7QDBnFORD4NDve/Cv9FWEqZP5O9hygCSPo0UqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733406036; c=relaxed/simple;
	bh=GpOFl2zYdq+Y3eiR8HOHWHZevOpENKyeGb2ihkdEP6g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OuWgn3FScLMrcwbqipH15lTK12WS8oKyEn0jHkzMT+e+0K21GiWSCz0oxtLzopvPa8sI9d9dBJtbQc8ehrTqxQkeW3cvCVDl6jeIqTJF0rvn5F9l6m4nGyqSNn4Em5b/XORcd1QnQrTjwRu5URDJnEInCpjbp8ejEnbsAMiYAew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=OM21bqk4; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733406034; x=1764942034;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GpOFl2zYdq+Y3eiR8HOHWHZevOpENKyeGb2ihkdEP6g=;
  b=OM21bqk44kM7DVSbM7vJ4CKV5YzCgCXOz9PTG109hcBedfWyaKn4sLTq
   TH+Mn6eByIgsacqTG+P2EPWlew1PiB/qYw/lJx8lUatVYFRlfbuAIfMJ3
   xUi7x8SRiN9YBDsKbGvxU01+xJtaosSF8k25k5+MDsk7A6f2oX7WObej8
   UcjcbhST6ntogEqLAHeKELHkVz+NnnA9Hl/7IP5zxf9MwrDJztSyR34IK
   Oaxnbl/6J8ilGL2urZl71Vqo8/tuGb7sEw3lCHtQedJNMpUox3tcUCXpD
   JJhu4wI3O+M9G/ZaiBdqfSRim6YNJ4j1WbjUkA8MRfVI4RGmTlNb43IIo
   w==;
X-CSE-ConnectionGUID: pwzK5/P8TFGnVo0ml5dWew==
X-CSE-MsgGUID: xu+d4Zx7TPGqrP++lBoeiQ==
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="38836229"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Dec 2024 06:40:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 5 Dec 2024 06:40:03 -0700
Received: from che-dk-ungapp03lx.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 5 Dec 2024 06:40:01 -0700
From: Rengarajan S <rengarajan.s@microchip.com>
To: <vaibhaavram.tl@microchip.com>, <kumaravel.thiagarajan@microchip.com>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <unglinuxdriver@microchip.com>
CC: <rengarajan.s@microchip.com>
Subject: [PATCH v1 char-misc-linus 2/2] misc: microchip: pci1xxxx: Resolve return code mismatch during GPIO set config
Date: Thu, 5 Dec 2024 19:06:26 +0530
Message-ID: <20241205133626.1483499-3-rengarajan.s@microchip.com>
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

Driver returns -EOPNOTSUPPORTED on unsupported parameters case in set
config. Upper level driver checks for -ENOTSUPP. Because of the return
code mismatch, the ioctls from userspace fail. Resolve the issue by
passing -ENOTSUPP during unsupported case.

Fixes: 7d3e4d807df2 ("misc: microchip: pci1xxxx: load gpio driver for the gpio controller auxiliary device enumerated by the auxiliary bus driver.")
Signed-off-by: Rengarajan S <rengarajan.s@microchip.com>
---
 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
index 558290bdb938..3c1359d8d4e6 100644
--- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
+++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
@@ -148,7 +148,7 @@ static int pci1xxxx_gpio_set_config(struct gpio_chip *gpio, unsigned int offset,
 		pci1xxx_assign_bit(priv->reg_base, OPENDRAIN_OFFSET(offset), (offset % 32), true);
 		break;
 	default:
-		ret = -EOPNOTSUPP;
+		ret = -ENOTSUPP;
 		break;
 	}
 	spin_unlock_irqrestore(&priv->lock, flags);
-- 
2.25.1


