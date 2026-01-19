Return-Path: <linux-gpio+bounces-30726-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D98D3A630
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 12:05:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB2C83073B26
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 11:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD073590B9;
	Mon, 19 Jan 2026 11:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="udJA7E11"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC3D358D39;
	Mon, 19 Jan 2026 11:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768820671; cv=none; b=ePByQLv8mgW5ZqtUMI2Nj546/xoUHtKp9nZHIe0TGEJYMJz+AtGGPJ68HmBTcmhzRBoFLwjrt8WzZEZquvlNENaI3+6zDf6Ct5yLdCfLWjXilfZJICg6xoNDy3VUsVMyWtrefolh5NfH+lXqm5f6cC2w8Lyv9NCibBWboT24/T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768820671; c=relaxed/simple;
	bh=t+HEgcYqSVx6VH3le68bpHdiW7bK5vJALDZRuYvOFIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oj5fpJ6bL85BOd18dgKD4+8WtdJAr95YZqmhspyz5axgS/aDh8jNN4t69qLLTaDrxn79a9CMPCSsf99B9wMpO7vmRFJWMxp0CXDMKhQdjW0AP1nJI7x9k6SXgyGreYJh40F4U8ITQfREHgzNG1RZYNo7P27WNMyzoqewzh2kkwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=udJA7E11; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC451C19424;
	Mon, 19 Jan 2026 11:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820668;
	bh=t+HEgcYqSVx6VH3le68bpHdiW7bK5vJALDZRuYvOFIU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=udJA7E110dVNVZUCHMsPgNzlLnI67qN5u7Jt8FI1I5eEGeWZrmZXVTBunvV1ocqWr
	 oEITIPRu1nGYTfKLz651HcXxDjgIv2v6TUPn3hoDNtDW1ucY/yoJZ301xcyzVkkxYo
	 1Y1xB8+8PRvP34ke8w126tHys+CNFbWlNbQrYeaTG2fRlPqSSFwYvlskxR+DE+y7aM
	 PWzGGBz0KLNTUZ7mbHnsb6ccG7ojF+Ci7y4Bf7jGl3eCeradsTIf2nwNrniZDJkirr
	 uACIf1tPlsXgHhYjW3/G81tA41Fo0ZBAlxYLUqKcOR9xMNJzPf1d19kVhrDuzGjSfm
	 hZlcNzk0LVbuA==
From: Conor Dooley <conor@kernel.org>
To: linusw@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com
Subject: [PATCH v3 1/6] pinctrl: move microchip riscv pinctrl drivers to a folder
Date: Mon, 19 Jan 2026 11:03:52 +0000
Message-ID: <20260119-reformist-snowstorm-ba618fa0b135@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260119-rearrange-germproof-3e3096cc0da4@spud>
References: <20260119-rearrange-germproof-3e3096cc0da4@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6364; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=hwxNMUvxWKcT8KjSjfbfz0OBIr/CxNlBuZegafSpDh4=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJl5/Bskn271E+Z6Kb1R8vfjqz8advKL3PumvTiuvuKKm X1ng2hvRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZybx4jw8I43747U49xb50r L3e2eW2zyXeRizK2MtKsrOf+fF/+8z8jw/+NjbdXqzl1XH83X/rf+ayOR6zpt+SUZxXe1TGyMZG p5gYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

There's three of these drivers now for the same platforms, move them
together with other microchip drivers to follow.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS                                   |  4 ++--
 drivers/pinctrl/Kconfig                       | 19 +------------------
 drivers/pinctrl/Makefile                      |  3 +--
 drivers/pinctrl/microchip/Kconfig             | 19 +++++++++++++++++++
 drivers/pinctrl/microchip/Makefile            |  4 ++++
 .../{ => microchip}/pinctrl-mpfs-iomux0.c     |  8 ++++----
 .../{ => microchip}/pinctrl-pic64gx-gpio2.c   |  2 +-
 7 files changed, 32 insertions(+), 27 deletions(-)
 create mode 100644 drivers/pinctrl/microchip/Kconfig
 create mode 100644 drivers/pinctrl/microchip/Makefile
 rename drivers/pinctrl/{ => microchip}/pinctrl-mpfs-iomux0.c (98%)
 rename drivers/pinctrl/{ => microchip}/pinctrl-pic64gx-gpio2.c (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..ff6084cb5797 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22472,8 +22472,8 @@ F:	drivers/gpio/gpio-mpfs.c
 F:	drivers/i2c/busses/i2c-microchip-corei2c.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/pci/controller/plda/pcie-microchip-host.c
-F:	drivers/pinctrl/pinctrl-mpfs-iomux0.c
-F:	drivers/pinctrl/pinctrl-pic64gx-gpio2.c
+F:	drivers/pinctrl/microchip/pinctrl-mpfs-iomux0.c
+F:	drivers/pinctrl/microchip/pinctrl-pic64gx-gpio2.c
 F:	drivers/pwm/pwm-microchip-core.c
 F:	drivers/reset/reset-mpfs.c
 F:	drivers/rtc/rtc-mpfs.c
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index bc7f37afc48b..d2a414450c16 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -486,15 +486,6 @@ config PINCTRL_PIC32MZDA
 	def_bool y if PIC32MZDA
 	select PINCTRL_PIC32
 
-config PINCTRL_PIC64GX
-	bool "pic64gx gpio2 pinctrl driver"
-	depends on ARCH_MICROCHIP || COMPILE_TEST
-	depends on OF
-	select GENERIC_PINCONF
-	default y
-	help
-	  This selects the pinctrl driver for gpio2 on pic64gx.
-
 config PINCTRL_PISTACHIO
 	bool "IMG Pistachio SoC pinctrl driver"
 	depends on OF && (MIPS || COMPILE_TEST)
@@ -506,15 +497,6 @@ config PINCTRL_PISTACHIO
 	help
 	  This support pinctrl and GPIO driver for IMG Pistachio SoC.
 
-config PINCTRL_POLARFIRE_SOC
-	bool "Polarfire SoC pinctrl driver"
-	depends on ARCH_MICROCHIP || COMPILE_TEST
-	depends on OF
-	select GENERIC_PINCONF
-	default y
-	help
-	  This selects the pinctrl driver for Microchip Polarfire SoC.
-
 config PINCTRL_RK805
 	tristate "Pinctrl and GPIO driver for RK805 PMIC"
 	depends on MFD_RK8XX
@@ -709,6 +691,7 @@ source "drivers/pinctrl/freescale/Kconfig"
 source "drivers/pinctrl/intel/Kconfig"
 source "drivers/pinctrl/mediatek/Kconfig"
 source "drivers/pinctrl/meson/Kconfig"
+source "drivers/pinctrl/microchip/Kconfig"
 source "drivers/pinctrl/mvebu/Kconfig"
 source "drivers/pinctrl/nomadik/Kconfig"
 source "drivers/pinctrl/nuvoton/Kconfig"
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index be5200c23e60..05737b1afec9 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -48,9 +48,7 @@ obj-$(CONFIG_PINCTRL_OCELOT)	+= pinctrl-ocelot.o
 obj-$(CONFIG_PINCTRL_PALMAS)	+= pinctrl-palmas.o
 obj-$(CONFIG_PINCTRL_PEF2256)	+= pinctrl-pef2256.o
 obj-$(CONFIG_PINCTRL_PIC32)	+= pinctrl-pic32.o
-obj-$(CONFIG_PINCTRL_PIC64GX)	+= pinctrl-pic64gx-gpio2.o
 obj-$(CONFIG_PINCTRL_PISTACHIO)	+= pinctrl-pistachio.o
-obj-$(CONFIG_PINCTRL_POLARFIRE_SOC)	+= pinctrl-mpfs-iomux0.o
 obj-$(CONFIG_PINCTRL_RK805)	+= pinctrl-rk805.o
 obj-$(CONFIG_PINCTRL_ROCKCHIP)	+= pinctrl-rockchip.o
 obj-$(CONFIG_PINCTRL_RP1)       += pinctrl-rp1.o
@@ -76,6 +74,7 @@ obj-y				+= freescale/
 obj-$(CONFIG_X86)		+= intel/
 obj-y				+= mediatek/
 obj-$(CONFIG_PINCTRL_MESON)	+= meson/
+obj-y				+= microchip/
 obj-y				+= mvebu/
 obj-y				+= nomadik/
 obj-y				+= nuvoton/
diff --git a/drivers/pinctrl/microchip/Kconfig b/drivers/pinctrl/microchip/Kconfig
new file mode 100644
index 000000000000..f7536d94a8cf
--- /dev/null
+++ b/drivers/pinctrl/microchip/Kconfig
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config PINCTRL_PIC64GX
+	bool "pic64gx gpio2 pinctrl driver"
+	depends on ARCH_MICROCHIP || COMPILE_TEST
+	depends on OF
+	select GENERIC_PINCONF
+	default y
+	help
+	  This selects the pinctrl driver for gpio2 on pic64gx.
+
+config PINCTRL_POLARFIRE_SOC
+	bool "Polarfire SoC pinctrl driver"
+	depends on ARCH_MICROCHIP || COMPILE_TEST
+	depends on OF
+	select GENERIC_PINCONF
+	default y
+	help
+	  This selects the pinctrl driver for Microchip Polarfire SoC.
diff --git a/drivers/pinctrl/microchip/Makefile b/drivers/pinctrl/microchip/Makefile
new file mode 100644
index 000000000000..584d48e7be3b
--- /dev/null
+++ b/drivers/pinctrl/microchip/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_PINCTRL_PIC64GX)	+= pinctrl-pic64gx-gpio2.o
+obj-$(CONFIG_PINCTRL_POLARFIRE_SOC)	+= pinctrl-mpfs-iomux0.o
diff --git a/drivers/pinctrl/pinctrl-mpfs-iomux0.c b/drivers/pinctrl/microchip/pinctrl-mpfs-iomux0.c
similarity index 98%
rename from drivers/pinctrl/pinctrl-mpfs-iomux0.c
rename to drivers/pinctrl/microchip/pinctrl-mpfs-iomux0.c
index cf5b2e4e8f5b..1b060a038920 100644
--- a/drivers/pinctrl/pinctrl-mpfs-iomux0.c
+++ b/drivers/pinctrl/microchip/pinctrl-mpfs-iomux0.c
@@ -15,10 +15,10 @@
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 
-#include "core.h"
-#include "pinctrl-utils.h"
-#include "pinconf.h"
-#include "pinmux.h"
+#include "../core.h"
+#include "../pinctrl-utils.h"
+#include "../pinconf.h"
+#include "../pinmux.h"
 
 #define MPFS_IOMUX0_REG 0x200
 
diff --git a/drivers/pinctrl/pinctrl-pic64gx-gpio2.c b/drivers/pinctrl/microchip/pinctrl-pic64gx-gpio2.c
similarity index 99%
rename from drivers/pinctrl/pinctrl-pic64gx-gpio2.c
rename to drivers/pinctrl/microchip/pinctrl-pic64gx-gpio2.c
index f322bb5e6181..a0b3e839cf3b 100644
--- a/drivers/pinctrl/pinctrl-pic64gx-gpio2.c
+++ b/drivers/pinctrl/microchip/pinctrl-pic64gx-gpio2.c
@@ -14,7 +14,7 @@
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 
-#include "pinctrl-utils.h"
+#include "../pinctrl-utils.h"
 
 #define PIC64GX_PINMUX_REG 0x0
 
-- 
2.51.0


