Return-Path: <linux-gpio+bounces-713-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D127FDC7F
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 17:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC6822829F3
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 16:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4543B297;
	Wed, 29 Nov 2023 16:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YwNlYr1d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97A90D7D;
	Wed, 29 Nov 2023 08:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701274526; x=1732810526;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tsj37wyW7nCXgooQSC3UG4Yz4bb4c6+0Qg8IYdX3FB0=;
  b=YwNlYr1d7zY0MhvEQ1g9TEJ+9W7AjcpRx3RmWhESwBI9rH2ZOfGpsbYU
   /MzR+UPZurseeKBP2h4j3eTtK1E0bD4niN+x0xF6N1WOVPBLmtQ3fIp1w
   2sSH+j4HD9ZfcIO9lw3ipideG3VcTr9XX3Anq1WoJyz+PG6piAT5HrloL
   ew1y5azTAK198G9XaqgJCEtZY5fO0B2Cc2RpSW6QfE9X8VOX4mSt16J8O
   GCyGumWZbplDa8e3XHKThBUuAl8Bx0SAwNEwLPCrcZa8H3GWyIm52r1YO
   dT8mcKhm1v/LqoBfhgitCa2dB3vdhTvg4rrGi2nR4NQYHM6rzduoU6x6y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="373372702"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="373372702"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 08:15:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="892498878"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="892498878"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 29 Nov 2023 08:15:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BC9B9AA2; Wed, 29 Nov 2023 18:15:01 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	linux-mips@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
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
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v4 10/23] pinctrl: core: Add a convenient define PINCTRL_GROUP_DESC()
Date: Wed, 29 Nov 2023 18:06:33 +0200
Message-ID: <20231129161459.1002323-11-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PINCTRL_GROUP_DESC() macro for inline use.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/core.c | 5 +----
 drivers/pinctrl/core.h | 9 +++++++++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 7040d8cea0c3..1e44682db355 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -658,10 +658,7 @@ int pinctrl_generic_add_group(struct pinctrl_dev *pctldev, const char *name,
 	if (!group)
 		return -ENOMEM;
 
-	group->name = name;
-	group->pins = pins;
-	group->num_pins = num_pins;
-	group->data = data;
+	*group = PINCTRL_GROUP_DESC(name, pins, num_pins, data);
 
 	error = radix_tree_insert(&pctldev->pin_group_tree, selector, group);
 	if (error)
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 75797c0b4fde..4689b24e40f0 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -208,6 +208,15 @@ struct group_desc {
 	void *data;
 };
 
+/* Convenience macro to define a generic pin group descriptor */
+#define PINCTRL_GROUP_DESC(_name, _pins, _num_pins, _data)	\
+(struct group_desc) {						\
+	.name = _name,						\
+	.pins = _pins,						\
+	.num_pins = _num_pins,					\
+	.data = _data,						\
+}
+
 int pinctrl_generic_get_group_count(struct pinctrl_dev *pctldev);
 
 const char *pinctrl_generic_get_group_name(struct pinctrl_dev *pctldev,
-- 
2.43.0.rc1.1.gbec44491f096


