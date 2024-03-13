Return-Path: <linux-gpio+bounces-4305-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DE787B570
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Mar 2024 00:55:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B791928249A
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Mar 2024 23:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D202360253;
	Wed, 13 Mar 2024 23:54:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037185F473
	for <linux-gpio@vger.kernel.org>; Wed, 13 Mar 2024 23:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710374079; cv=none; b=Tj7x3pClB4+4bZ53U1yYh8xxERzBd4R9args+k/xrbagjp0Zn0dH/ZJ0snF7UtM5wQYBFFJxrfVIo6l46Lryu1pRHPV7ajIxLVMr2qS1T2YppSo9f+w+TWDil7VSDPd06vPX55DEhS380PGEC9bgiRWt9D1/mniUvb0kfSMGVGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710374079; c=relaxed/simple;
	bh=EZ78oLcHeMZki7oJrS99GWqnNnBIlAKS0pn12DtquGU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ax+sFf24yyYORlEGHiCI1O4BbI9xmtN7mH5G+qqVtCtncQ95Jcm3c2ksk5kgp97be6CX9NouwfkCGWwx9z8mZREaBwiKBIOVClBaNZ4jXHYTnrjJwSY8bRJ+apvY2k60p4xTZTBlhn0oPPM3FSTeFEauLpuXoRj0+QN+1zmcZHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-217.elisa-laajakaista.fi [88.113.26.217])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 0a584e33-e195-11ee-b972-005056bdfda7;
	Thu, 14 Mar 2024 01:54:33 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 09/11] pinctrl: aw9523: Sort headers and group pinctrl/*
Date: Thu, 14 Mar 2024 01:52:12 +0200
Message-ID: <20240313235422.180075-10-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313235422.180075-1-andy.shevchenko@gmail.com>
References: <20240313235422.180075-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One header was misplaced and group pinctrl/* ones to show the relation
with the pin control subsystem.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-aw9523.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
index 17c359f9c45c0..50e2a94f59892 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -13,17 +13,18 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/mutex.h>
 #include <linux/module.h>
-#include <linux/pinctrl/pinconf.h>
-#include <linux/pinctrl/pinctrl.h>
-#include <linux/pinctrl/pinmux.h>
-#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/mutex.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+
 #define AW9523_MAX_FUNCS		2
 #define AW9523_NUM_PORTS		2
 #define AW9523_PINS_PER_PORT		8
-- 
2.44.0


