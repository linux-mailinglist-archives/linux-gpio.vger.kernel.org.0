Return-Path: <linux-gpio+bounces-15266-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9790DA25A93
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 14:16:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC1F93A7951
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7361205AD7;
	Mon,  3 Feb 2025 13:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FxwrgVQS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CA1205502;
	Mon,  3 Feb 2025 13:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588516; cv=none; b=vDtKjfs3vDH1y1K6eajYTQil4QHMY28vZ7S2aXLI0+JvvCqRQuTbVde8nbM1XzSApyNUjCSozerixO5kxvf0MZjPxojzGyyJE7ahK/C36JjZt8k8wvUCfrLio89fR5x8iyr47y8BJNfKPPSjPgcK8n1oWD+uA/tAFnzwi69ykC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588516; c=relaxed/simple;
	bh=1qaeu4/7lVPNsuJyFSKzK+LZhY0Btpn+7+eFmjWn5VI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KXaJWvct5R5RXbOzIH/E7ayXeTEhOBM9CtZO+PRnbYPkDucBE0aFjf4Yl8U95B1JoPJMMb9F9M0p8swPaWZDRC7zMkjinzJ+nmoqROruclrtlSKQOJWnrwD1gduEkXnikhhVz3oFNsNMYO++fwEXUvi62XACXLY0ipmWVXbs/QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FxwrgVQS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738588514; x=1770124514;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1qaeu4/7lVPNsuJyFSKzK+LZhY0Btpn+7+eFmjWn5VI=;
  b=FxwrgVQS/7FE5COuoISbQZqcPwuXAAHRCUUJhmOZTXMU/bHipMFARWC+
   qfjIwjjMArCjMnyxq8c/FHzYh1JM0paBbyx/J4eUAnwFfzMRUzyc5jnb4
   siOOJ8U8S+d8K5MrNSYl1Tupuo1OBW8vRHDOrv5hEeOknkSqHIMXt18y6
   pQJeIHRf6cb6jHbNFru6yEwUrPrEpmxpwKojk2HgxEsyWhjFdp7C7EIQd
   xu6xUhIfTY68IvPbhaIVyN8mbhL+LiMdsQPgQ+nM01pccwErMDaVYFVzD
   Fp26RasH7Uz3vigkA4IaIBlF4TGZhR5/fE6hKPHvWE4RM1ej4uDaYgv1R
   w==;
X-CSE-ConnectionGUID: q3ZrtpRkST6YK35P11TQqg==
X-CSE-MsgGUID: +q0q7RppQQGTh7yGOSDVMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39217683"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="39217683"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:15:12 -0800
X-CSE-ConnectionGUID: ywa9axWKSZWhOwO/8HVCnA==
X-CSE-MsgGUID: 3LDrgOdUTRSRXxgObAutKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="115287399"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 03 Feb 2025 05:15:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 01FD857C; Mon, 03 Feb 2025 15:15:08 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 08/14] pinctrl: cy8c95x0: Remove redundant check in cy8c95x0_regmap_update_bits_base()
Date: Mon,  3 Feb 2025 15:10:34 +0200
Message-ID: <20250203131506.3318201-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250203131506.3318201-1-andriy.shevchenko@linux.intel.com>
References: <20250203131506.3318201-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function is never called with the PORTSEL register in the argument.
Drop unneeded check, but rescue a comment. While at it, drop inline
and allow any compiler to choose better stragy (note, that inline in
C code is only a recomendation to most of the modern compilers anyway).

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 02b692118cb2..cd191cb1101e 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -477,20 +477,14 @@ static const struct regmap_config cy8c9520_i2c_regmap = {
 #endif
 };
 
-static inline int cy8c95x0_regmap_update_bits_base(struct cy8c95x0_pinctrl *chip,
-						   unsigned int reg,
-						   unsigned int port,
-						   unsigned int mask,
-						   unsigned int val,
-						   bool *change, bool async,
-						   bool force)
+/* Caller should never modify PORTSEL directly */
+static int cy8c95x0_regmap_update_bits_base(struct cy8c95x0_pinctrl *chip,
+					    unsigned int reg, unsigned int port,
+					    unsigned int mask, unsigned int val,
+					    bool *change, bool async, bool force)
 {
 	int ret, off, i;
 
-	/* Caller should never modify PORTSEL directly */
-	if (reg == CY8C95X0_PORTSEL)
-		return -EINVAL;
-
 	/* Registers behind the PORTSEL mux have their own range in regmap */
 	if (cy8c95x0_muxed_register(reg)) {
 		off = CY8C95X0_MUX_REGMAP_TO_OFFSET(reg, port);
-- 
2.43.0.rc1.1336.g36b5255a03ac


