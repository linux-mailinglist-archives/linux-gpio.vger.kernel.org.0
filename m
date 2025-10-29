Return-Path: <linux-gpio+bounces-27847-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6ADC1BB6A
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 16:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 719576E0C6F
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 15:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9CF338F23;
	Wed, 29 Oct 2025 15:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5MfGFC6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C4C32C941;
	Wed, 29 Oct 2025 15:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761751846; cv=none; b=Y37eKPUr08zQcrfUAVgz9EOMllFdrBhszPaA5rvj1rzhIY0edmp9EGatspUPtb5kdRsg+2ttACteJN1J/eFsgf9anWeBx7byCqd/VbJCHgfzZNpM1ru+oXGyXuEy6jvs1+diJhSwb+EAWa+WBP5q8+VlxgL1uAQMlHATLkSloQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761751846; c=relaxed/simple;
	bh=2hdstVg2puYafsBTOCnoES2CaeIJ0Hw7wVB412L5tmc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NMxV03AFpWSRO2Waz18cq7xrjgDZ3Muaa9lo+1zGBlNrAGxAfW+GL/DYdZ3uTa8vax6eabos1QSsgnvdUDKD/ItGtXwE6a0pvFOKehFRA41OFzmL8K9fURvZ8c/8FRHMW3WVYmRkfHX7egxue1NnpHey9yJGhuCxqWDDMjTTGag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5MfGFC6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A9C0C4CEFF;
	Wed, 29 Oct 2025 15:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761751846;
	bh=2hdstVg2puYafsBTOCnoES2CaeIJ0Hw7wVB412L5tmc=;
	h=From:To:Cc:Subject:Date:From;
	b=F5MfGFC6PNY3c/r+xiQ3oupqq/p5ciVtjbPUIaFLY3o+P54GPUz0NhHfaAkPkkD8B
	 AdtsVuYPAgzo10GgJl/1vqp2zOjie1CsReBn46UotstWVHRTicclQ5Ii0sjOCHiyzO
	 W+Apb+Z07HSjhsfx4DxsYyGCnoFjkBDHVZUOMP/Y4y11cy5SgEZBHf4KIbPm60IVAe
	 epDusAWSZpQynZqm0M2c834iMfWNiDKNdB/ujR1hjWZ6Ki99cY3Y6lvAEyKU3ZRQnW
	 USIC+LAkp//kmaictwnDttOb+D7wdsY/qv/qrqv2l74myOA4OtrDUL3Dsd3NFpZ/ee
	 tpznUKJSs96kg==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v1] pinctrl: mpfs-iomux0: fix compile-time constant warning for LLVM prior to 17
Date: Wed, 29 Oct 2025 15:29:35 +0000
Message-ID: <20251029-isolation-shield-b66aea79a9a4@spud>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3792; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=k5YmnBFs6Pdap83fQ2HuN6cRh1zztlgSjeWri2rbeJQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlMRvdi928S8DXVnSeicjBMIDL5wZ6u84esVDbvff4r7 6G+Q+HqjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzEuZThf+KqVf+Ncl+98yia wfW1lfN+/p5lX3fcnbZP48fEqwrrHQ4x/Hcu2KW29N2No73SjRq7nU0UA5uSPn3oOXhQUOjhnI3 zlnMBAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

With LLVM prior to 17.0.0:

drivers/pinctrl/pinctrl-mpfs-iomux0.c:89:2: error: initializer element is not a compile-time constant
        MPFS_IOMUX0_GROUP(spi0),
        ^~~~~~~~~~~~~~~~~~~~~~~
drivers/pinctrl/pinctrl-mpfs-iomux0.c:79:10: note: expanded from macro 'MPFS_IOMUX0_GROUP'
        .mask = BIT(mpfs_iomux0_##_name##_pins[0]),     \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/vdso/bits.h:7:19: note: expanded from macro 'BIT'
\#define BIT(nr)                 (UL(1) << (nr))
                                ^~~~~~~~~~~~~~~

This is a constant, but LLVM prior to a change from Nick to match the
gcc behaviour did not allow this. The macro isn't really all that much
of an idiot-proofing, just change it to the same sort that's in the
gpio2 driver, where a second argument provides the mask/setting.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Link: https://github.com/ClangBuiltLinux/linux/issues/2140
Fixes: 46397274da22 ("pinctrl: add polarfire soc iomux0 pinmux driver")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---

Not entirely sold on the fixes tag since it's to shut up an old
compiler, but no harm in it I guess.

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
CC: Bill Wendling <morbo@google.com>
CC: Justin Stitt <justinstitt@google.com>
CC: linux-riscv@lists.infradead.org
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: llvm@lists.linux.dev
---
 drivers/pinctrl/pinctrl-mpfs-iomux0.c | 36 +++++++++++++--------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mpfs-iomux0.c b/drivers/pinctrl/pinctrl-mpfs-iomux0.c
index 49d9fcec0a16..cf5b2e4e8f5b 100644
--- a/drivers/pinctrl/pinctrl-mpfs-iomux0.c
+++ b/drivers/pinctrl/pinctrl-mpfs-iomux0.c
@@ -73,33 +73,33 @@ static const unsigned int mpfs_iomux0_uart4_pins[] = { 11 };
 static const unsigned int mpfs_iomux0_mdio0_pins[] = { 12 };
 static const unsigned int mpfs_iomux0_mdio1_pins[] = { 13 };
 
-#define MPFS_IOMUX0_GROUP(_name) { \
+#define MPFS_IOMUX0_GROUP(_name, _mask) { \
 	.name = #_name "_mssio",	\
 	.pins = mpfs_iomux0_##_name##_pins,	\
-	.mask = BIT(mpfs_iomux0_##_name##_pins[0]),	\
+	.mask = _mask,	\
 	.setting = 0x0,	\
 }, { \
 	.name = #_name "_fabric",	\
 	.pins = mpfs_iomux0_##_name##_pins,	\
-	.mask = BIT(mpfs_iomux0_##_name##_pins[0]),	\
-	.setting = BIT(mpfs_iomux0_##_name##_pins[0]),	\
+	.mask = _mask,	\
+	.setting = _mask,	\
 }
 
 static const struct mpfs_iomux0_pin_group mpfs_iomux0_pin_groups[] = {
-	MPFS_IOMUX0_GROUP(spi0),
-	MPFS_IOMUX0_GROUP(spi1),
-	MPFS_IOMUX0_GROUP(i2c0),
-	MPFS_IOMUX0_GROUP(i2c1),
-	MPFS_IOMUX0_GROUP(can0),
-	MPFS_IOMUX0_GROUP(can1),
-	MPFS_IOMUX0_GROUP(qspi),
-	MPFS_IOMUX0_GROUP(uart0),
-	MPFS_IOMUX0_GROUP(uart1),
-	MPFS_IOMUX0_GROUP(uart2),
-	MPFS_IOMUX0_GROUP(uart3),
-	MPFS_IOMUX0_GROUP(uart4),
-	MPFS_IOMUX0_GROUP(mdio0),
-	MPFS_IOMUX0_GROUP(mdio1),
+	MPFS_IOMUX0_GROUP(spi0, BIT(0)),
+	MPFS_IOMUX0_GROUP(spi1, BIT(1)),
+	MPFS_IOMUX0_GROUP(i2c0, BIT(2)),
+	MPFS_IOMUX0_GROUP(i2c1, BIT(3)),
+	MPFS_IOMUX0_GROUP(can0, BIT(4)),
+	MPFS_IOMUX0_GROUP(can1, BIT(5)),
+	MPFS_IOMUX0_GROUP(qspi, BIT(6)),
+	MPFS_IOMUX0_GROUP(uart0, BIT(7)),
+	MPFS_IOMUX0_GROUP(uart1, BIT(8)),
+	MPFS_IOMUX0_GROUP(uart2, BIT(9)),
+	MPFS_IOMUX0_GROUP(uart3, BIT(10)),
+	MPFS_IOMUX0_GROUP(uart4, BIT(11)),
+	MPFS_IOMUX0_GROUP(mdio0, BIT(12)),
+	MPFS_IOMUX0_GROUP(mdio1, BIT(13)),
 };
 
 static const char * const mpfs_iomux0_spi0_groups[] = { "spi0_mssio", "spi0_fabric" };
-- 
2.51.0


