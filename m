Return-Path: <linux-gpio+bounces-9168-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D53AB95EDD3
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 11:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 136581C215F7
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 09:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C026146A61;
	Mon, 26 Aug 2024 09:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c20exh8U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24B514659D;
	Mon, 26 Aug 2024 09:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724666249; cv=none; b=RF2lFjF6jDT3aWwJpF8Nw9sGkkTffkBzaoSKV6qQCglppHlSUxyDtUTsVA6K0II3Wx2qm5kRQWX2tFuuI5uJM46r/59OLuQnBZoTqOjPH+EiYT2iwB6g9TyIiVuiNAu5KHk9SLBS3DDDIuyRuqS/p2ZZwaG3IPIGlcdrZSKV77A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724666249; c=relaxed/simple;
	bh=KEMMQDtGNxlzkDadYBGaL1mVngh6rKo9Hls0idoSS2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MWrm8KgkvAgYKbute/GCQO6E6Z0loDQoF1wSKdOX4LMvAU4BbZxQr6ZvuhhXb2kd6dBh0zun3oviwE+xumLQKw1sCrW4Yo4fF58RhQrNM4jZ2UCFkY05WASlNZPc0RjCr/1FvZFfrObk3GGoOmtMiG5aJQPAeZ9I5C6V87Vqq80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c20exh8U; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724666248; x=1756202248;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KEMMQDtGNxlzkDadYBGaL1mVngh6rKo9Hls0idoSS2M=;
  b=c20exh8UFAumXnLAeEjg6vkDD/StzwSFr4cOXSP6gMSiMuVcB+JkMISk
   DVacj7BTqe9hZ4q5WqL+yK9OThpqAQn4GYp73Sn2iTvboZZpmsMbA46J4
   xcZhkXMJ5l/kMYsmhUUMs0XDH/a1xGJyKguWlCoHoAmlpzWzeo8LLHl3u
   PgY+kxvOJ+Ued+hRcfjwPAgcfBrOFL+hpkdicAntqs3bhlBnELEL4jiYU
   ffc688C6JXPzSRAm2MiPOdoceyBHIWTkIgcYHlE6I21JPIJAnk8zBCrdD
   bAZ88w+HSlOGp2/oGrGE03uYL5jp5bSbhGVyiP9iNgXAG/gK5NdG6JstJ
   A==;
X-CSE-ConnectionGUID: WEJ/VE/eRLCyeJPHW4OJTQ==
X-CSE-MsgGUID: zqZfGqX4S1Gfoze5BxOSxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="23259023"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="23259023"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 02:57:27 -0700
X-CSE-ConnectionGUID: ibd0HonmTjKkmk3k18WkGQ==
X-CSE-MsgGUID: xGAhSbUSQz241oRUmdEckw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="67388644"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 26 Aug 2024 02:57:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2D224502; Mon, 26 Aug 2024 12:57:24 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] pinctrl: nomadik: Use string_choices API instead of ternary operator
Date: Mon, 26 Aug 2024 12:57:23 +0300
Message-ID: <20240826095723.1421065-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use modern string_choices API instead of manually determining the
output using ternary operator.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index fa78d5ecc685..9cc64547730a 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -28,6 +28,7 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 #include <linux/types.h>
 
 /* Since we request GPIOs from ourself */
@@ -1105,17 +1106,16 @@ static int nmk_pin_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 				"pin %d: sleep pull %s, dir %s, val %s\n",
 				pin,
 				slpm_pull ? pullnames[pull] : "same",
-				slpm_output ? (output ? "output" : "input")
-				: "same",
-				slpm_val ? (val ? "high" : "low") : "same");
+				slpm_output ? (output ? "output" : "input") : "same",
+				slpm_val ? str_high_low(val) : "same");
 		}
 
 		dev_dbg(nmk_chip->chip.parent,
 			"pin %d [%#lx]: pull %s, slpm %s (%s%s), lowemi %s\n",
 			pin, cfg, pullnames[pull], slpmnames[slpm],
 			output ? "output " : "input",
-			output ? (val ? "high" : "low") : "",
-			lowemi ? "on" : "off");
+			output ? str_high_low(val) : "",
+			str_on_off(lowemi));
 
 		clk_enable(nmk_chip->clk);
 		if (gpiomode)
-- 
2.43.0.rc1.1336.g36b5255a03ac


