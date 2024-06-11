Return-Path: <linux-gpio+bounces-7347-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C151C9037D9
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 11:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76B7B1F24DB6
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 09:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64865178380;
	Tue, 11 Jun 2024 09:31:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9210117623D
	for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2024 09:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718098297; cv=none; b=UDm7P3a+iqGxh9XbJD8OGk9e89CkcUmPKDbCm3ZaiNwLd8YhU+Cg1spmdaSLZASPUbRTen4evK7qBMKvWbjUrMWxrDsmhJISzH0bebIZesgHOAoww4KvPhl9lISlE53SYPIGVEngzF+DPmo68mvdFhgPFZkqnU55ZgJPqqBBfcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718098297; c=relaxed/simple;
	bh=//KiX0A3+2T6SNbx64RCCt5vplrvtiOsRUETqQE7Uw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f8ZzihNeK6wVHE694wDDPphZCAeOMKw3VLqzJ9NnaTc0Y/pzUHhrRrp6uoEgmHkTbhARIlVg0DvCs5rKlAS2smHgslU80KcWam5a/3uU/erSiIAqxKmiexSBNlyKz4PPaCovwVAsPSBrtFYup0bdz8y5eBEswNgLsd39Z/lUPlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 63bf090d-27d5-11ef-8d69-005056bd6ce9;
	Tue, 11 Jun 2024 12:31:33 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Cc: Shan-Chun Hung <schung@nuvoton.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/4] pinctrl: nuvoton: Convert to use struct pingroup and PINCTRL_PINGROUP()
Date: Tue, 11 Jun 2024 12:30:22 +0300
Message-ID: <20240611093127.90210-2-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240611093127.90210-1-andy.shevchenko@gmail.com>
References: <20240611093127.90210-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The pin control header provides struct pingroup and PINCTRL_PINGROUP() macro.
Utilize them instead of open coded variants in the driver.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
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
index a377d36b0eb0..9834a13cf5c9 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -588,17 +588,6 @@ static const int hgpio5_pins[] = { 25 };
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
@@ -832,9 +821,8 @@ enum {
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
2.45.2


