Return-Path: <linux-gpio+bounces-17728-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A4AA671EC
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 11:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2384E3B9A13
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 10:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A72E7208993;
	Tue, 18 Mar 2025 10:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HV0koEbW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDF1208981;
	Tue, 18 Mar 2025 10:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742295581; cv=none; b=ZgaZCx2iiIji0kMHMYEwMCS91zIbeJPJVtb5J89pUIIvHlIl4H9XqAY0zrq0SdGv7tIG0g8wHApCIUSsJfLok8BLM0Lwtxf4eBzAVdWoL6tCtfxtunntwIp+/vZuyIZcze7CsCfPJZyoL8ZJjIpQeYVkK7YOrIj0/b0GMtt/xfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742295581; c=relaxed/simple;
	bh=QrndgZbN9z1XtoTGR06yFti0xSwFxjHct0FERYdF7BA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xl1oe6DYYj7GqRqaIf7zwPXc6zprtZG6ZHoZOuyozkTgj0BDCKeQp3xKUfycknPBVg+3m8iGWPDYa/Gz7061UUoXP2HC6QYxv6Yk7j5UkxjWdBMzKIKIglwzTYC6YjOMJmHx17jbiMJSv7MNT678aXAwO+jiHKLgncXYpsN62RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HV0koEbW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742295579; x=1773831579;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QrndgZbN9z1XtoTGR06yFti0xSwFxjHct0FERYdF7BA=;
  b=HV0koEbWYzh849r1Rdxk3Wvul1c0gvLstPlA+oRi0kkn6YLvwM8kz4u2
   2/ItGGaNCt1aCfZ6KE78/vq0K6K4JtU1A33Q+S5sumdN8fiiGxx314PZR
   3U32q58G122tGD2+ucayXpwrkV1/bst5XiVQQAJ1XgRZbSzXUPcZt07EW
   SiaTNULmGNhlMsLjaC7Mx34nksWdoCTu7fimgnWQhvmSunXyXmY8Euuum
   nwO9C44JqslnqO5dcWay0sZOb5SkH0Q2Y60qiJg7r5Fk1IHlZbwgDGUbl
   Tdz6OgMtNlvz7Sa+QzEDKpsC1j2g5HLEXO0tFWTmp6JDLj6/P47cjrjSX
   g==;
X-CSE-ConnectionGUID: yR69g8YbR0qzHs3cGl67qQ==
X-CSE-MsgGUID: q4VwZ5QmTPaijjUU+LYVhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="68781758"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="68781758"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 03:59:38 -0700
X-CSE-ConnectionGUID: epYLmD4nSv++05dKgL+RbQ==
X-CSE-MsgGUID: oAb6QjutR1yMp+GHh+cTwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="153215696"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 18 Mar 2025 03:59:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E65112E2; Tue, 18 Mar 2025 12:59:33 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jacky Huang <ychuang3@nuvoton.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Cc: Shan-Chun Hung <schung@nuvoton.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/5] pinctrl: nuvoton: Convert to use struct pingroup and PINCTRL_PINGROUP()
Date: Tue, 18 Mar 2025 12:57:15 +0200
Message-ID: <20250318105932.2090926-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
References: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 16 ++--------------
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 16 ++--------------
 2 files changed, 4 insertions(+), 28 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 62a46d824b46..2601aacfb976 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -504,17 +504,6 @@ static const int lkgpo2_pins[] = { 9 };
 
 static const int nprd_smi_pins[] = { 190 };
 
-/*
- * pin:	     name, number
- * group:    name, npins,   pins
- * function: name, ngroups, groups
- */
-struct npcm7xx_group {
-	const char *name;
-	const unsigned int *pins;
-	int npins;
-};
-
 #define NPCM7XX_GRPS \
 	NPCM7XX_GRP(smb0), \
 	NPCM7XX_GRP(smb0b), \
@@ -642,9 +631,8 @@ enum {
 #undef NPCM7XX_GRP
 };
 
-static struct npcm7xx_group npcm7xx_groups[] = {
-#define NPCM7XX_GRP(x) { .name = #x, .pins = x ## _pins, \
-			.npins = ARRAY_SIZE(x ## _pins) }
+static struct pingroup npcm7xx_groups[] = {
+#define NPCM7XX_GRP(x) PINCTRL_PINGROUP(#x, x ## _pins, ARRAY_SIZE(x ## _pins))
 	NPCM7XX_GRPS
 #undef NPCM7XX_GRP
 };
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index f6a1e684a386..eac43315a360 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -587,17 +587,6 @@ static const int hgpio5_pins[] = { 25 };
 static const int hgpio6_pins[] = { 59 };
 static const int hgpio7_pins[] = { 60 };
 
-/*
- * pin:	     name, number
- * group:    name, npins,   pins
- * function: name, ngroups, groups
- */
-struct npcm8xx_pingroup {
-	const char *name;
-	const unsigned int *pins;
-	int npins;
-};
-
 #define NPCM8XX_GRPS \
 	NPCM8XX_GRP(gpi36), \
 	NPCM8XX_GRP(gpi35), \
@@ -829,9 +818,8 @@ enum {
 #undef NPCM8XX_GRP
 };
 
-static struct npcm8xx_pingroup npcm8xx_pingroups[] = {
-#define NPCM8XX_GRP(x) { .name = #x, .pins = x ## _pins, \
-			.npins = ARRAY_SIZE(x ## _pins) }
+static struct pingroup npcm8xx_pingroups[] = {
+#define NPCM8XX_GRP(x) PINCTRL_PINGROUP(#x, x ## _pins, ARRAY_SIZE(x ## _pins))
 	NPCM8XX_GRPS
 #undef NPCM8XX_GRP
 };
-- 
2.47.2


