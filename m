Return-Path: <linux-gpio+bounces-12842-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8F09C4D15
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 04:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2B281F217A9
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 03:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCFB205E22;
	Tue, 12 Nov 2024 03:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="f+N5aUGC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m1973173.qiye.163.com (mail-m1973173.qiye.163.com [220.197.31.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5590020512A;
	Tue, 12 Nov 2024 03:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731381000; cv=none; b=BWFVz2nTXPKCzuJA8V0XKqJvwqgvS8P5fzwKmF4HMAztMxWxW5YyL59P/biME8UjnNWvEs7hPae9ooCRBrgVusF2N21uwU9n+LzQKlUF2gNhtXx8mVAHD7b5wJakJtEanNrB1rJxWJulg/qLdvOwgkE362lyDTTYkOSM0zVsnHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731381000; c=relaxed/simple;
	bh=ANf6993tejPqzHmhVSsxoxdVhoMu/HJ3RWBKUAdLn9M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qm+eO/Z6YbzTu8pBhMdFyqf3F03y6VCUqNRPLA0dG9vO80mIBB5C2ivVyzlyi9m2x+tmO2BhYhxJrsPujzO1T4zRN8IJ+9uZZYereFN6uVBZLJ/hEzXFCJdGvkFIOuM5N3x5TctzzSdtO7iu8RmQjSlytseyh1ej3c2mMvZ47Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=f+N5aUGC; arc=none smtp.client-ip=220.197.31.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 275d3f1d;
	Tue, 12 Nov 2024 09:54:13 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	heiko@sntech.de,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com,
	tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v5 1/4] gpio: rockchip: explan the format of the GPIO version ID
Date: Tue, 12 Nov 2024 09:54:05 +0800
Message-Id: <20241112015408.3139996-2-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
References: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUkZHlZDGB0ZQ0gaGkhOGRhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a931e14163509d8kunm275d3f1d
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NQw6Sww5HDIoMBoWPysZSRpL
	Mw8aC0JVSlVKTEhKSExNT05PTkJIVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSkpDTjcG
DKIM-Signature:a=rsa-sha256;
	b=f+N5aUGCj+VLxIOLvKP23n978ZTd+BlIfa0hCJ9vp5lR/8Zf/aiF7anhUIdCXdvaBUd3/3lj4o+EtKERejIfmr2T5G7zTzZUK1B4HBM3JgOzsQUvQo6J3/WY37/5j0uUHiyfKP86nDaa/YcS4hOTa0Ojl1Cv03hxjUi5yJkERaM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=W3+qCrfZTihYEk4pDOtbMVILileo3xKIzptsJVcIneM=;
	h=date:mime-version:subject:message-id:from;

Remove redundant comments and provide a detailed explanation of the
GPIO version ID.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpio/gpio-rockchip.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 365ab947983c..702e711f9c23 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -26,9 +26,15 @@
 #include "../pinctrl/core.h"
 #include "../pinctrl/pinctrl-rockchip.h"
 
+/*
+ * Version ID Register
+ * Bits [31:24] - Major Version
+ * Bits [23:16] - Minor Version
+ * Bits [15:0]  - Revision Number
+ */
 #define GPIO_TYPE_V1		(0)           /* GPIO Version ID reserved */
-#define GPIO_TYPE_V2		(0x01000C2B)  /* GPIO Version ID 0x01000C2B */
-#define GPIO_TYPE_V2_1		(0x0101157C)  /* GPIO Version ID 0x0101157C */
+#define GPIO_TYPE_V2		(0x01000C2B)
+#define GPIO_TYPE_V2_1		(0x0101157C)
 
 static const struct rockchip_gpio_regs gpio_regs_v1 = {
 	.port_dr = 0x00,
-- 
2.34.1


