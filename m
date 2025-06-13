Return-Path: <linux-gpio+bounces-21529-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25012AD8B39
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 13:53:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B083F189FF2E
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 11:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45ACD2E6D29;
	Fri, 13 Jun 2025 11:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMT7TU+t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BFF2E6D1C;
	Fri, 13 Jun 2025 11:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749815137; cv=none; b=c/PMF/Snqhiy4byHHelDgzvk7v68nhp4Pmj/NeA6CaMhlYO/PM28Ji2EfhR9J/HO/Mo4aygHiYhPmOlUemtrVDT+Xep6Jo2C5EGz5kVM6WWlfpnDqeDoV6h6Zf5G3Qfb5fYlKiw/ttAFVQWBKoan8UIQdZlU7MYP8cTcOpCx3kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749815137; c=relaxed/simple;
	bh=t3yyyPtYSSN5S7rDQcxHS9f6gCwsZYMm59++llawt4E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aZ5motLN6x2snv2KBZcjo1xOgGAcl1d86oFRDWtfjbFQeCKOJhn5PnuSuNkIwUTDMHd0o8zSEwNyfKjQmbd6nW9rfDpieb5LUW7ibPbF9xgg0v7lUZJqFSZksE+yhAA55teGD9qpOxalqe4r2mDo5aFzHE1v8KbAEmiZCXU5nEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMT7TU+t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AEDAC4CEE3;
	Fri, 13 Jun 2025 11:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749815136;
	bh=t3yyyPtYSSN5S7rDQcxHS9f6gCwsZYMm59++llawt4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DMT7TU+tDuL0CUTEGvxI0MoC7zxiL0ZLGtdOfhmypjTBvwdR8pVhd5Z+V8Gfyv8rr
	 JyUynB8lie1U/EZNsNQBCh2bwtuIEJuGai8iuvPNdD0uaBQ51JDgAmlNw8LErjtL7G
	 EHiLPaMzeJT4jkdzBIgBc0IopqQZTV30pTTvvsZrWRwCkzEbXUR/VvEeBRpqkcYQea
	 ysn3TuYx86JzzE1q7tTpVyi6R/EmYpaMdD1ZA4b5Key9Xaocvh0np42TpCm12VSlxU
	 /fAX7XOSNdrxS7j5UagayPDDLsksQVxgtc64QTWVJCs3bwbYScTX/PEEzrL0eDaQmu
	 vHoJwAOHd/oBQ==
From: Michael Walle <mwalle@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Panis <jpanis@baylibre.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v2 2/7] misc: tps6594-pfsm: Add TI TPS652G1 PMIC PFSM
Date: Fri, 13 Jun 2025 13:45:13 +0200
Message-Id: <20250613114518.1772109-3-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250613114518.1772109-1-mwalle@kernel.org>
References: <20250613114518.1772109-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TPS652G1 is a stripped down TPS65224, but the PFSM is the same.
Thus, handle it the same way as the TPS65224 in the driver.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/misc/tps6594-pfsm.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/misc/tps6594-pfsm.c b/drivers/misc/tps6594-pfsm.c
index 6db1c9d48f8f..44fa81d6cec2 100644
--- a/drivers/misc/tps6594-pfsm.c
+++ b/drivers/misc/tps6594-pfsm.c
@@ -1,6 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * PFSM (Pre-configurable Finite State Machine) driver for TI TPS65224/TPS6594/TPS6593/LP8764 PMICs
+ * PFSM (Pre-configurable Finite State Machine) driver for the following
+ * PMICs:
+ * - LP8764
+ * - TPS65224
+ * - TPS652G1
+ * - TPS6594
+ * - TPS6593
  *
  * Copyright (C) 2023 BayLibre Incorporated - https://www.baylibre.com/
  */
@@ -141,7 +147,7 @@ static long tps6594_pfsm_ioctl(struct file *f, unsigned int cmd, unsigned long a
 	switch (cmd) {
 	case PMIC_GOTO_STANDBY:
 		/* Disable LP mode on TPS6594 Family PMIC */
-		if (pfsm->chip_id != TPS65224) {
+		if (pfsm->chip_id != TPS65224 && pfsm->chip_id != TPS652G1) {
 			ret = regmap_clear_bits(pfsm->regmap, TPS6594_REG_RTC_CTRL_2,
 						TPS6594_BIT_LP_STANDBY_SEL);
 
@@ -154,8 +160,8 @@ static long tps6594_pfsm_ioctl(struct file *f, unsigned int cmd, unsigned long a
 					TPS6594_BIT_TRIGGER_I2C(0), TPS6594_BIT_TRIGGER_I2C(0));
 		break;
 	case PMIC_GOTO_LP_STANDBY:
-		/* TPS65224 does not support LP STANDBY */
-		if (pfsm->chip_id == TPS65224)
+		/* TPS65224/TPS652G1 does not support LP STANDBY */
+		if (pfsm->chip_id == TPS65224 || pfsm->chip_id == TPS652G1)
 			return ret;
 
 		/* Enable LP mode */
@@ -179,8 +185,8 @@ static long tps6594_pfsm_ioctl(struct file *f, unsigned int cmd, unsigned long a
 				      TPS6594_BIT_NSLEEP1B | TPS6594_BIT_NSLEEP2B);
 		break;
 	case PMIC_SET_MCU_ONLY_STATE:
-		/* TPS65224 does not support MCU_ONLY_STATE */
-		if (pfsm->chip_id == TPS65224)
+		/* TPS65224/TPS652G1 does not support MCU_ONLY_STATE */
+		if (pfsm->chip_id == TPS65224 || pfsm->chip_id == TPS652G1)
 			return ret;
 
 		if (copy_from_user(&state_opt, argp, sizeof(state_opt)))
@@ -206,7 +212,7 @@ static long tps6594_pfsm_ioctl(struct file *f, unsigned int cmd, unsigned long a
 			return -EFAULT;
 
 		/* Configure wake-up destination */
-		if (pfsm->chip_id == TPS65224) {
+		if (pfsm->chip_id == TPS65224 || pfsm->chip_id == TPS652G1) {
 			regmap_reg = TPS65224_REG_STARTUP_CTRL;
 			mask = TPS65224_MASK_STARTUP_DEST;
 		} else {
@@ -230,9 +236,14 @@ static long tps6594_pfsm_ioctl(struct file *f, unsigned int cmd, unsigned long a
 			return ret;
 
 		/* Modify NSLEEP1-2 bits */
-		ret = regmap_clear_bits(pfsm->regmap, TPS6594_REG_FSM_NSLEEP_TRIGGERS,
-					pfsm->chip_id == TPS65224 ?
-					TPS6594_BIT_NSLEEP1B : TPS6594_BIT_NSLEEP2B);
+		if (pfsm->chip_id == TPS65224 || pfsm->chip_id == TPS652G1)
+			ret = regmap_clear_bits(pfsm->regmap,
+						TPS6594_REG_FSM_NSLEEP_TRIGGERS,
+						TPS6594_BIT_NSLEEP1B);
+		else
+			ret = regmap_clear_bits(pfsm->regmap,
+						TPS6594_REG_FSM_NSLEEP_TRIGGERS,
+						TPS6594_BIT_NSLEEP2B);
 		break;
 	}
 
-- 
2.39.5


