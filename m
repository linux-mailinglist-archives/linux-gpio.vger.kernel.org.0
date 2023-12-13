Return-Path: <linux-gpio+bounces-1265-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B20080DA7B
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 20:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36CB2281A39
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 19:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67CE524C9;
	Mon, 11 Dec 2023 19:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8ZcbaZO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40A9B10C;
	Mon, 11 Dec 2023 11:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702321423; x=1733857423;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=stiM9aExenYBLsXThMdeP0DZZbWSelPRFbvz2eZsYe4=;
  b=A8ZcbaZOU0mWbb1Vq2CDuwty02OwVVQRFWy94mmYAAfZA6PyIh6fwwPF
   hkTYb0vaCRWxl5juwwaDIzFQcAdnVkFhv/5lsw2L4TPMLk5kBnOLjl+ZO
   lcj7Mt9XI8PLVK3F9Pog2eMuxFmhQeO4uI4hFQrXQCB1FNIbtvYFFZoyR
   DRDwo2xtC6VAOJJrl0KMtpgnoPBPzKH+aPcT76ZIugQ/u8PdcHz484o7A
   E0mIoGywiI2KHxVIwtlWFRxwCnDqsaRQz0uQTFfSB6MueabMAX4OLwqr8
   nGnwcW9zD3PeGBxx1aOa8G6j3/HyNHtCEV+dNv/pm3G52rjFq7yACTn6T
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="379692591"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="379692591"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 11:03:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="946445111"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="946445111"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 11 Dec 2023 11:03:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0B5D5A22; Mon, 11 Dec 2023 21:03:24 +0200 (EET)
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
Subject: [PATCH v5 13/13] pinctrl: core: Remove unused members from struct group_desc
Date: Mon, 11 Dec 2023 20:58:06 +0200
Message-ID: <20231211190321.307330-14-andriy.shevchenko@linux.intel.com>
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

All drivers are converted to use embedded struct pingroup.
Remove unused members from struct group_desc.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/core.c | 9 ---------
 drivers/pinctrl/core.h | 9 ---------
 2 files changed, 18 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 48cc5571dea6..ee56856cb80c 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -557,9 +557,6 @@ const char *pinctrl_generic_get_group_name(struct pinctrl_dev *pctldev,
 	if (!group)
 		return NULL;
 
-	if (group->name)
-		return group->name;
-
 	return group->grp.name;
 }
 EXPORT_SYMBOL_GPL(pinctrl_generic_get_group_name);
@@ -586,12 +583,6 @@ int pinctrl_generic_get_group_pins(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 	}
 
-	if (group->pins) {
-		*pins = group->pins;
-		*num_pins = group->num_pins;
-		return 0;
-	}
-
 	*pins = group->grp.pins;
 	*num_pins = group->grp.npins;
 
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index a3b75ec7b54b..837fd5bd903d 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -199,16 +199,10 @@ struct pinctrl_maps {
 /**
  * struct group_desc - generic pin group descriptor
  * @grp: generic data of the pin group (name and pins)
- * @name: name of the pin group
- * @pins: array of pins that belong to the group
- * @num_pins: number of pins in the group
  * @data: pin controller driver specific data
  */
 struct group_desc {
 	struct pingroup grp;
-	const char *name;
-	const unsigned int *pins;
-	int num_pins;
 	void *data;
 };
 
@@ -216,9 +210,6 @@ struct group_desc {
 #define PINCTRL_GROUP_DESC(_name, _pins, _num_pins, _data)	\
 (struct group_desc) {						\
 	.grp = PINCTRL_PINGROUP(_name, _pins, _num_pins),	\
-	.name = _name,						\
-	.pins = _pins,						\
-	.num_pins = _num_pins,					\
 	.data = _data,						\
 }
 
-- 
2.43.0.rc1.1.gbec44491f096


