Return-Path: <linux-gpio+bounces-12806-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 237AF9C37A8
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 05:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD62928265A
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 04:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D616514B08E;
	Mon, 11 Nov 2024 04:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="CAhwIL9T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m25477.xmail.ntesmail.com (mail-m25477.xmail.ntesmail.com [103.129.254.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8967C36B;
	Mon, 11 Nov 2024 04:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.129.254.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731301018; cv=none; b=uEGuG9Ug0VcnGkwDJnOVsrkkEpQTcMt1PjZCHqxkQlwSNElAHsMkpUCtiSLogkf4VuVZLs3Q5xtIELVb+ip+BvSVW+SKZs8UMUWbj63gWxJxAe1nL7hH0z85cKgtbr/UBVACBjWh7IdFNZa8nXASS+b8OfQ3Y/Ehx/L8xb26LFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731301018; c=relaxed/simple;
	bh=+pCzj59HmF6uc3ofgxTrGgy8nuo0lXQjwBjROEJTEmk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dpLijNb5tvZ8QodXHP6coNGxa1a7NZi6/9IO6B5o5JgGKZFO8OP/ar3ufzmfNxc/dymSNAInzTlOsmMdhyepkv/lVEvAc3jCo+9CUBT8D0/ZOUpbu9z6Mz7LmY6+VZaOygp09ioSplqjYkV+CR5IYNjzrlJfXtO6bmxaEGfA7wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=CAhwIL9T; arc=none smtp.client-ip=103.129.254.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 258a5842;
	Mon, 11 Nov 2024 10:34:20 +0800 (GMT+08:00)
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
	elaine.zhang@rock-chips.com
Subject: [PATCH v4 1/4] gpio: rockchip: explan the format of the GPIO version ID
Date: Mon, 11 Nov 2024 10:34:09 +0800
Message-Id: <20241111023412.3466161-2-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241111023412.3466161-1-ye.zhang@rock-chips.com>
References: <20241111023412.3466161-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0gaHVZNQk5MQ0xPTUoZHh5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a931912755a09d8kunm258a5842
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NVE6Mio5AzIhNCwiIwgTGDY2
	Sz1PCjJVSlVKTEhKSUJJT01JT0pNVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSktPQzcG
DKIM-Signature:a=rsa-sha256;
	b=CAhwIL9TPSOIgZTHl4UJ5tsTP4/WuxKODyQlakAqUTs/AhGlDQj7pAzT1JeLgzeS5RsfcXWGwYv/oR5SgVMChfrod/cTyNbyCYCkwUm6KKg71BflYlY+GOepVUW5Uv3W7spoH040aVhDobQx1m4DCysnKtvRHTTA4XX3RRyfHtE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=oYOeFEvjF9EiBqY8V2DdoQCpdhmvNoj/sQPxdzZTp+Y=;
	h=date:mime-version:subject:message-id:from;

Remove redundant comments and provide a detailed explanation of the
GPIO version ID.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 365ab947983c..71672d654491 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -26,9 +26,15 @@
 #include "../pinctrl/core.h"
 #include "../pinctrl/pinctrl-rockchip.h"
 
+/*
+ * Version ID Register
+ * Bits [31:24] - Major Version
+ * Bits [23:16] - Minor Version
+ * Bits [15:0]  - SVN Number
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


