Return-Path: <linux-gpio+bounces-442-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BE17F676D
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Nov 2023 20:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53C41281E2D
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Nov 2023 19:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A17B4D10C;
	Thu, 23 Nov 2023 19:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ONhcjsi5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E2AF10F8;
	Thu, 23 Nov 2023 11:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700768060; x=1732304060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AdFjMuClohqBUYL/nDsewEobDAXp1hIEsDTJLpD8JyY=;
  b=ONhcjsi56p7zR7Yvz4Kp/vdtP8XAMrNpJKPO3p688uG8wfbt8MwxfOgu
   OwI6zZKWXx5dBw4J2/dCEWA51XM15r8+xA4BuSjZkO6QP2BjfsfEy3I13
   5wW0FHt/eSzV8d+pdPVbVIB6o8RFGe6Yxt7m10TDNGhXXNPuxBkwzyvM2
   RSF8wUC2ke8ruf2obRbq5b/tpdBVlinQRP7Nurcqls7FRk7Ogbb2wpO7/
   LoHEVBxccKdHdtZFk4zZpV59KKSXedkV7loaoPgVs2FaeuWZVfZq1x7pw
   pZEY0V96djOgvNWVF0DYzv1fWAyJygtEx8Pn8G41qSFnr06ACv6bndpMn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="372482191"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="372482191"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 11:34:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="833506170"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="833506170"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 23 Nov 2023 11:34:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0F0B9592; Thu, 23 Nov 2023 21:33:59 +0200 (EET)
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
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v2 09/21] pinctrl: core: Add a convenient define PINCTRL_GROUP_DESC()
Date: Thu, 23 Nov 2023 21:31:37 +0200
Message-ID: <20231123193355.3400852-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231123193355.3400852-1-andriy.shevchenko@linux.intel.com>
References: <20231123193355.3400852-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PINCTRL_GROUP_DESC() macro for inline use.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/core.c | 5 +----
 drivers/pinctrl/core.h | 9 +++++++++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index d20e3aad923e..3f1fd50fbb10 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -660,10 +660,7 @@ int pinctrl_generic_add_group(struct pinctrl_dev *pctldev, const char *name,
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
index 01ea1ce99fe8..276a631fd49c 100644
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


