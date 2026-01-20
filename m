Return-Path: <linux-gpio+bounces-30819-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAtiDKjUb2mgMQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30819-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 20:16:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 917434A269
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 20:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 69D32A0EEAD
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 18:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773C945105E;
	Tue, 20 Jan 2026 18:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+GMykx9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA89451056;
	Tue, 20 Jan 2026 18:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932974; cv=none; b=T+N9oB56Z14ynuaTU63onw8hef9O53GYtB2bdI1zLnQAwCy98FSultjIvLBjKUfb8ff8oqvQTcVO2ztERb5oGqlhQnhvOqhmMRyRxcpdg+JykWLWPcKZuUzlaFOpFpJD4RUTKFssZ1+keaaGPFP+b9UPhB+ewcFdcwwzWtLBvTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932974; c=relaxed/simple;
	bh=QhE7IgG3YaYV4J3d1geP3x2zMhRXUWVpXXqpJCRiJyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rJCi/3j7yezGq/imo94BegsREfEUrBP9MY33e+74TKdnxBqioiaAMxxSXf4yMSDPIShcfnI+7/Umkna1rX/G/WPyc2xeNNwasSTpj0TviXlC3t+r5sX7zClvJuf5rNUisD8bu7iEjRWAqaf89CBcvE9iI+nNkAj/Ei4t1GkWB/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+GMykx9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D39CFC19421;
	Tue, 20 Jan 2026 18:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768932971;
	bh=QhE7IgG3YaYV4J3d1geP3x2zMhRXUWVpXXqpJCRiJyE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g+GMykx9c2E3+/z019B53XywfS3OhbDxydCJQaRpATfZutk4n3m0fc/U3drbD+Ve+
	 YoeXDv3buSskhRr3aKcUl09b2b/6SPEZid+Ncp9CfzjY/hAm1vmiFuGcS/IBwcsIK8
	 DADOMfOZpQMqaX73xJoZIIkJhzrH/JBFRL0hRl7MZQcB5iejRxxLGbXoK5F/M/Cz6j
	 yX4so76DJ2wJTtsnau82hJuASkSM8qxqYt9vhZrQUK4cmhxfvnbqEFRbVju7BFWzww
	 +grytebv7TQpRqkFTNPowjDVmpqDOIpIIukFvsiqBGYrGCWDqtjQH7bfjrptL/aDm3
	 d05S+xGthaabQ==
From: Conor Dooley <conor@kernel.org>
To: linusw@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com
Subject: [PATCH v4 1/5] pinctrl: move microchip riscv pinctrl drivers to a folder
Date: Tue, 20 Jan 2026 18:15:39 +0000
Message-ID: <20260120-placidly-agony-5b3d6153f741@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260120-elixir-salute-dd6ec3d9f5fe@spud>
References: <20260120-elixir-salute-dd6ec3d9f5fe@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6322; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=T6ZpfIeFj2gU5ICTb55BmLDk3XsKOzV0vQmxeqWTAW0=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJn5x7zsjOenBK6vnv2I8djP+Ecu6h+yul9Uxrd/+nQ3J Xz5kbb3HaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZhIjyvD/2D7ZeJ7w0+FtB77 U9wcH/aZ66l8KvPv4uoLXK2PnkslRTEybKoNSrUIS4m2lBb+4nIz+UDV9nmh2x+aMDvrTAncmSH PDwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-30819-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 917434A269
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Conor Dooley <conor.dooley@microchip.com>

There's three of these drivers now for the same platforms, move them
together with other microchip drivers to follow.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS                                     |  4 ++--
 drivers/pinctrl/Kconfig                         | 17 +----------------
 drivers/pinctrl/Makefile                        |  3 +--
 drivers/pinctrl/microchip/Kconfig               | 17 +++++++++++++++++
 drivers/pinctrl/microchip/Makefile              |  4 ++++
 .../{ => microchip}/pinctrl-mpfs-iomux0.c       |  8 ++++----
 .../{ => microchip}/pinctrl-pic64gx-gpio2.c     |  2 +-
 7 files changed, 30 insertions(+), 25 deletions(-)
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
index 0ea117581bde..d2a414450c16 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -486,14 +486,6 @@ config PINCTRL_PIC32MZDA
 	def_bool y if PIC32MZDA
 	select PINCTRL_PIC32
 
-config PINCTRL_PIC64GX
-	bool "pic64gx gpio2 pinctrl driver"
-	depends on ARCH_MICROCHIP || COMPILE_TEST
-	depends on OF
-	select GENERIC_PINCONF
-	help
-	  This selects the pinctrl driver for gpio2 on pic64gx.
-
 config PINCTRL_PISTACHIO
 	bool "IMG Pistachio SoC pinctrl driver"
 	depends on OF && (MIPS || COMPILE_TEST)
@@ -505,14 +497,6 @@ config PINCTRL_PISTACHIO
 	help
 	  This support pinctrl and GPIO driver for IMG Pistachio SoC.
 
-config PINCTRL_POLARFIRE_SOC
-	bool "Polarfire SoC pinctrl driver"
-	depends on ARCH_MICROCHIP || COMPILE_TEST
-	depends on OF
-	select GENERIC_PINCONF
-	help
-	  This selects the pinctrl driver for Microchip Polarfire SoC.
-
 config PINCTRL_RK805
 	tristate "Pinctrl and GPIO driver for RK805 PMIC"
 	depends on MFD_RK8XX
@@ -707,6 +691,7 @@ source "drivers/pinctrl/freescale/Kconfig"
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
index 000000000000..bdefe6541445
--- /dev/null
+++ b/drivers/pinctrl/microchip/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config PINCTRL_PIC64GX
+	bool "pic64gx gpio2 pinctrl driver"
+	depends on ARCH_MICROCHIP || COMPILE_TEST
+	depends on OF
+	select GENERIC_PINCONF
+	help
+	  This selects the pinctrl driver for gpio2 on pic64gx.
+
+config PINCTRL_POLARFIRE_SOC
+	bool "Polarfire SoC pinctrl driver"
+	depends on ARCH_MICROCHIP || COMPILE_TEST
+	depends on OF
+	select GENERIC_PINCONF
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


