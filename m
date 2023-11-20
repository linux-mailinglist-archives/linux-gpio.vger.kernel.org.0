Return-Path: <linux-gpio+bounces-271-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 278A87F1D94
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 20:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88AEBB2196F
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 19:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E445837146;
	Mon, 20 Nov 2023 19:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EUDN8S+c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACC39AA;
	Mon, 20 Nov 2023 11:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700510185; x=1732046185;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zb7vywnY5jyenAxj9sbtLt+bBMaQnCZHqRqsqRdZ/10=;
  b=EUDN8S+caPxE19UesPiGzk6D3eROcb+BsscwTMzynqbDsarMWljf3mZH
   2KahXLKtGWhw4JSuvJoGY1KZOSbgeYqmNg1g5uOm5W3sGEInSkjwsw7xZ
   i6Xtty00VFnLFrtVabqqcDYPtp81yvKFJmlYkLXKiwYBfKHiyOXUiVrQ3
   g5Y/TQ27YDWwM8MEvBvj+0i6BbMqwdm8Ab5vZu9P0dldtVzsVlnDkefFL
   Y1/E/fgDDrM+wHSLiSpL8LfgTxwmCuu/0wdC603qSHeBuxHha4QVcsvb2
   ydtmnFBd/cuOSkJR2bk7giRKXKYXq5+2qLRptSiGi/B8VV5F+/xmQJyrW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="395622098"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="395622098"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 11:56:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="801298590"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="801298590"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 20 Nov 2023 11:56:05 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 184E813A; Mon, 20 Nov 2023 21:48:05 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] pinctrl: nuvoton: Convert to use struct pingroup and PINCTRL_PINGROUP()
Date: Mon, 20 Nov 2023 21:48:02 +0200
Message-ID: <20231120194802.1675239-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pin control header provides struct pingroup and PINCTRL_PINGROUP() macro.
Utilize them instead of open coded variants in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index 0cff44b07b29..4589900244c7 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -474,9 +474,8 @@ enum {
 #undef WPCM450_GRP
 };
 
-static struct group_desc wpcm450_groups[] = {
-#define WPCM450_GRP(x) { .name = #x, .pins = x ## _pins, \
-			.num_pins = ARRAY_SIZE(x ## _pins) }
+static struct pingroup wpcm450_groups[] = {
+#define WPCM450_GRP(x) PINCTRL_PINGROUP(#x, x ## _pins, ARRAY_SIZE(x ## _pins))
 	WPCM450_GRPS
 #undef WPCM450_GRP
 };
@@ -852,7 +851,7 @@ static int wpcm450_get_group_pins(struct pinctrl_dev *pctldev,
 				  const unsigned int **pins,
 				  unsigned int *npins)
 {
-	*npins = wpcm450_groups[selector].num_pins;
+	*npins = wpcm450_groups[selector].npins;
 	*pins  = wpcm450_groups[selector].pins;
 
 	return 0;
@@ -901,7 +900,7 @@ static int wpcm450_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	struct wpcm450_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
 	wpcm450_setfunc(pctrl->gcr_regmap, wpcm450_groups[group].pins,
-			wpcm450_groups[group].num_pins, function);
+			wpcm450_groups[group].npins, function);
 
 	return 0;
 }
-- 
2.43.0.rc1.1.gbec44491f096


