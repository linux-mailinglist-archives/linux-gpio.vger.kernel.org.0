Return-Path: <linux-gpio+bounces-1255-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E2680DA59
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 20:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E741A1F21CFA
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 19:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70367524C4;
	Mon, 11 Dec 2023 19:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VN0VLnBk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C13CCF;
	Mon, 11 Dec 2023 11:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702321414; x=1733857414;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ACcmTJgIefDIVYbDCBBfrcMa7Src+AAIG2eWNqY+244=;
  b=VN0VLnBkLVZd56vDxcQq35CzDxiJWdp4aU8EM06q3n+QIa3nbovwOyFd
   xfrrOjl+7dlXsQa0K/HmqksZWPqB3j0a1ozVC464hqDOgTkwYpgJb4rmK
   3ZGpMsrleOAP0Q0NmLAT96A2dkFnLaX9QtmmKa88yW4SOhS14DGkGcmCn
   cZXGcCuC14nDlD45+1lIX/BqsIcDxjWZSMEUr8TxfV/lIH6RbjOXbYr9N
   JSgVfHBoCLJEaj2bELxuYAgLCKAUWT51oWLxiVKMGyUctLnqkzOWVEYl+
   V1FZKG9aE3HJCksGUlilIKPM569wrDvCRcukAFe1t4DV67Q6vnG1kIDBD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="379692511"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="379692511"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 11:03:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="946445054"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="946445054"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 11 Dec 2023 11:03:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7601E3AE; Mon, 11 Dec 2023 21:03:23 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v5 03/13] pinctrl: ingenic: Use C99 initializers in PINCTRL_PIN_GROUP()
Date: Mon, 11 Dec 2023 20:57:56 +0200
Message-ID: <20231211190321.307330-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231211190321.307330-1-andriy.shevchenko@linux.intel.com>
References: <20231211190321.307330-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the better flexibility use C99 initializers in PINCTRL_PIN_GROUP().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index ee718f6e2556..f5661dcdedf5 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -82,16 +82,21 @@
 #define PINS_PER_GPIO_CHIP			32
 #define JZ4730_PINS_PER_PAIRED_REG	16
 
-#define INGENIC_PIN_GROUP_FUNCS(name, id, funcs)		\
-	{						\
-		name,					\
-		id##_pins,				\
-		ARRAY_SIZE(id##_pins),			\
-		funcs,					\
+#define INGENIC_PIN_GROUP_FUNCS(_name_, id, funcs)					\
+	{										\
+		.name = _name_,								\
+		.pins = id##_pins,							\
+		.num_pins = ARRAY_SIZE(id##_pins),					\
+		.data = funcs,								\
 	}
 
-#define INGENIC_PIN_GROUP(name, id, func)		\
-	INGENIC_PIN_GROUP_FUNCS(name, id, (void *)(func))
+#define INGENIC_PIN_GROUP(_name_, id, func)						\
+	{										\
+		.name = _name_,								\
+		.pins = id##_pins,							\
+		.num_pins = ARRAY_SIZE(id##_pins),					\
+		.data = (void *)func,							\
+	}
 
 enum jz_version {
 	ID_JZ4730,
-- 
2.43.0.rc1.1.gbec44491f096


