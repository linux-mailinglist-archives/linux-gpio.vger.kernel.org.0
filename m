Return-Path: <linux-gpio+bounces-6820-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6838D3313
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 11:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01FC0B238FA
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 09:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CFA1175570;
	Wed, 29 May 2024 09:29:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5586B175571
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 09:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716974993; cv=none; b=X6eTCXbrCfCtBI1j4B1JJ1is9EBB2sXp2hap6ro4M/i9t6hgOZJz5Usaw5ns/ladYn4WnQtwg2S1PCpdyYkcrAXC25cXk9c7agrzwuWL7zWK54I0OAJK+oX99K3+V0KGVMeyIcXE0w+GUm86YZSv8l7uKxb/+Q9qJ30bU9GZ6bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716974993; c=relaxed/simple;
	bh=4sedTVgxKSPnpGacsDR35PoCYTA0Qn5EQG3bHabnoLI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dcl6ZBE9kdidmvLWpNtNkfcDEX1kSoMpyQw2S2CVGF1GdM5iwgdtKYhaY3tmr57Skj/fucyFgS1mBt8wbQAxjbP51+95OSnlaaCQqqeOOz9IO3OtbBRhcjJd0CYVr05pCs4j4edkm/HbSLfK8LUzsdZcjKcPFqrEcwxU9RMItls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1b01:1838:131c:4de4])
	by xavier.telenet-ops.be with bizsmtp
	id UxVg2C00c3VPV9V01xVg5G; Wed, 29 May 2024 11:29:43 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFbu-00GHKm-1G;
	Wed, 29 May 2024 11:29:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFcq-008wS6-Ei;
	Wed, 29 May 2024 11:29:40 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 4/8] pinctrl: renesas: Add R-Car Gen3 fuse support
Date: Wed, 29 May 2024 11:29:33 +0200
Message-Id: <a30fa2c5e0d07752692c5a69f5a5fc57ae719c1b.1716974502.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716974502.git.geert+renesas@glider.be>
References: <cover.1716974502.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On R-Car Gen3 SoCs, the fuse registers are tightly integrated into the
Pin Function Controller.  Add support for them by providing the
rcar-fuse driver with all needed info through a platform device and
platform data.

Note that the number of fuse registers on R-Car V3H and V3H2 differs,
while their PFC blocks use the same compatible value, hence this is
handled by checking the top-level compatible value.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by.

FUSE_MON[1-3] on R-Car V3M were only briefly documented in Hardware
User's Manual Rev. 0.52/0.53
---
 drivers/pinctrl/renesas/core.c         | 18 ++++++++++++++++++
 drivers/pinctrl/renesas/pfc-r8a77951.c |  2 ++
 drivers/pinctrl/renesas/pfc-r8a7796.c  |  4 ++++
 drivers/pinctrl/renesas/pfc-r8a77965.c |  2 ++
 drivers/pinctrl/renesas/pfc-r8a77970.c |  2 ++
 drivers/pinctrl/renesas/pfc-r8a77980.c | 14 +++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a77990.c |  2 ++
 drivers/pinctrl/renesas/pfc-r8a77995.c |  2 ++
 drivers/pinctrl/renesas/sh_pfc.h       |  4 +++-
 9 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index 96d6040a8871419b..1c8447fcfb1180e3 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -20,6 +20,7 @@
 #include <linux/math.h>
 #include <linux/of.h>
 #include <linux/pinctrl/machine.h>
+#include <linux/platform_data/rcar_fuse.h>
 #include <linux/platform_device.h>
 #include <linux/psci.h>
 #include <linux/slab.h>
@@ -27,6 +28,8 @@
 
 #include "core.h"
 
+#define FUSE_MON0	0x3e4		/* R-Car Gen3 */
+
 static int sh_pfc_map_resources(struct sh_pfc *pfc,
 				struct platform_device *pdev)
 {
@@ -1372,6 +1375,21 @@ static int sh_pfc_probe(struct platform_device *pdev)
 	}
 #endif
 
+	if (pfc->info->nr_fuse_regs) {
+		struct rcar_fuse_platform_data pdata = {
+			.base = pfc->windows[0].virt,
+			.offset = FUSE_MON0,
+			.nregs = pfc->info->nr_fuse_regs,
+		};
+		struct platform_device *fdev;
+
+		fdev = platform_device_register_data(pfc->dev, "rcar_fuse", -1,
+						     &pdata, sizeof(pdata));
+		if (IS_ERR(fdev))
+			dev_err_probe(pfc->dev, PTR_ERR(fdev),
+				      "failed to register fuses, ignoring\n");
+	}
+
 	platform_set_drvdata(pdev, pfc);
 
 	dev_info(pfc->dev, "%s support registered\n", info->name);
diff --git a/drivers/pinctrl/renesas/pfc-r8a77951.c b/drivers/pinctrl/renesas/pfc-r8a77951.c
index a1d74f61fd8cce64..ae60bc5f70f0c223 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77951.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77951.c
@@ -6187,5 +6187,7 @@ const struct sh_pfc_soc_info r8a77951_pinmux_info = {
 
 	.pinmux_data = pinmux_data,
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
+
+	.nr_fuse_regs = 1,
 };
 #endif
diff --git a/drivers/pinctrl/renesas/pfc-r8a7796.c b/drivers/pinctrl/renesas/pfc-r8a7796.c
index 807834f319f07d8c..b1ebd9a0b612e5b8 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7796.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7796.c
@@ -6139,6 +6139,8 @@ const struct sh_pfc_soc_info r8a77960_pinmux_info = {
 
 	.pinmux_data = pinmux_data,
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
+
+	.nr_fuse_regs = 1,
 };
 #endif
 
@@ -6166,5 +6168,7 @@ const struct sh_pfc_soc_info r8a77961_pinmux_info = {
 
 	.pinmux_data = pinmux_data,
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
+
+	.nr_fuse_regs = 1,
 };
 #endif
diff --git a/drivers/pinctrl/renesas/pfc-r8a77965.c b/drivers/pinctrl/renesas/pfc-r8a77965.c
index e7c88a5d983f4343..47f9843a336225ac 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77965.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77965.c
@@ -6380,5 +6380,7 @@ const struct sh_pfc_soc_info r8a77965_pinmux_info = {
 
 	.pinmux_data = pinmux_data,
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
+
+	.nr_fuse_regs = 1,
 };
 #endif
diff --git a/drivers/pinctrl/renesas/pfc-r8a77970.c b/drivers/pinctrl/renesas/pfc-r8a77970.c
index e1b3e3b38ec3b864..688fe31c5b98ac14 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77970.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77970.c
@@ -2557,4 +2557,6 @@ const struct sh_pfc_soc_info r8a77970_pinmux_info = {
 
 	.pinmux_data = pinmux_data,
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
+
+	.nr_fuse_regs = 4,
 };
diff --git a/drivers/pinctrl/renesas/pfc-r8a77980.c b/drivers/pinctrl/renesas/pfc-r8a77980.c
index 877134d78c7e50c6..085eb6090420d013 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77980.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77980.c
@@ -15,6 +15,7 @@
 #include <linux/errno.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/of.h>
 
 #include "sh_pfc.h"
 
@@ -3048,13 +3049,22 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ /* sentinel */ }
 };
 
+static int r8a77980_pinmux_init(struct sh_pfc *pfc)
+{
+	if (of_machine_is_compatible("renesas,r8a77980a"))
+		r8a77980_pinmux_info.nr_fuse_regs = 5;
+
+	return 0;
+}
+
 static const struct sh_pfc_soc_operations r8a77980_pfc_ops = {
+	.init = r8a77980_pinmux_init,
 	.pin_to_pocctrl = r8a77980_pin_to_pocctrl,
 	.get_bias = rcar_pinmux_get_bias,
 	.set_bias = rcar_pinmux_set_bias,
 };
 
-const struct sh_pfc_soc_info r8a77980_pinmux_info = {
+struct sh_pfc_soc_info r8a77980_pinmux_info = {
 	.name = "r8a77980_pfc",
 	.ops = &r8a77980_pfc_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
@@ -3074,4 +3084,6 @@ const struct sh_pfc_soc_info r8a77980_pinmux_info = {
 
 	.pinmux_data = pinmux_data,
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
+
+	.nr_fuse_regs = 1,
 };
diff --git a/drivers/pinctrl/renesas/pfc-r8a77990.c b/drivers/pinctrl/renesas/pfc-r8a77990.c
index 262390dd7d67a101..748b9198d1efd820 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77990.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77990.c
@@ -5336,5 +5336,7 @@ const struct sh_pfc_soc_info r8a77990_pinmux_info = {
 
 	.pinmux_data = pinmux_data,
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
+
+	.nr_fuse_regs = 1,
 };
 #endif
diff --git a/drivers/pinctrl/renesas/pfc-r8a77995.c b/drivers/pinctrl/renesas/pfc-r8a77995.c
index 298e7a07e4934e67..f9003b8236a8881e 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77995.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77995.c
@@ -3193,4 +3193,6 @@ const struct sh_pfc_soc_info r8a77995_pinmux_info = {
 
 	.pinmux_data = pinmux_data,
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
+
+	.nr_fuse_regs = 1,
 };
diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index 0061e96400598e49..ce9b591a275ffbd3 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -290,6 +290,8 @@ struct sh_pfc_soc_info {
 	unsigned int pinmux_data_size;
 
 	u32 unlock_reg;		/* can be literal address or mask */
+
+	unsigned int nr_fuse_regs;
 };
 
 extern const struct sh_pfc_soc_info emev2_pinmux_info;
@@ -316,7 +318,7 @@ extern const struct sh_pfc_soc_info r8a77960_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77961_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77965_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77970_pinmux_info;
-extern const struct sh_pfc_soc_info r8a77980_pinmux_info;
+extern struct sh_pfc_soc_info r8a77980_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77990_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77995_pinmux_info;
 extern const struct sh_pfc_soc_info r8a779a0_pinmux_info;
-- 
2.34.1


