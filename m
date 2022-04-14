Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83738501F16
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Apr 2022 01:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbiDNXdw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Apr 2022 19:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347568AbiDNXdv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Apr 2022 19:33:51 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E78FAD10C
        for <linux-gpio@vger.kernel.org>; Thu, 14 Apr 2022 16:31:23 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 796ED2C0240;
        Thu, 14 Apr 2022 23:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1649979081;
        bh=+ni6kcNriiZblYuvHDSjoOv2n2ptS5SzCoNs/+DSjtE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R4Sk4LDkEJ4PqeNFcY6xSLxoTc3SZdVWu3iY6eI1ACYsZ7AcXWJCMksQFA1mkhX02
         1YwbiKygPMo/C85oD8vwWqC5ksa5Qk3aCFTpcuTqu6gIhiiCZ68TPT0pU8sNCnHhIc
         dCnAft7LBf1IQulez0KAasVgDhqqDOFk1FEMF1jdzZgelwQz9qUY3A7jjoRTnrowC0
         Uo9JamKXW+TiNCfN5Mmspy2R/Q7ck6Kp4Z77J6GlnfQAOtojSseCyMGYn3e5jysZWz
         l3KJXXn32hR4uUhQYAa7hNmzDiarGZBhXjgKAwswbZiahoXjm6B/VHMpYrw14iM02r
         AF25G6w1tlz6Q==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B6258aec90001>; Fri, 15 Apr 2022 11:31:21 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by pat.atlnz.lc (Postfix) with ESMTP id 2262D13EE8E;
        Fri, 15 Apr 2022 11:31:21 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 748C82A003C; Fri, 15 Apr 2022 11:31:16 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     linus.walleij@linaro.org, robh+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, andrew@lunn.ch,
        gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
        kostap@marvell.com, robert.marko@sartura.hr
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v4 2/4] pinctrl: mvebu: pinctrl driver for 98DX2530 SoC
Date:   Fri, 15 Apr 2022 11:30:53 +1200
Message-Id: <20220414233055.586962-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414233055.586962-1-chris.packham@alliedtelesis.co.nz>
References: <20220414233055.586962-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L59jvNb8 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=z0gMJWrwH1QA:10 a=M5GUcnROAAAA:8 a=XOt8PQhkpNQJGvtk3RcA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This pinctrl driver supports the 98DX25xx and 98DX35xx family of chips
from Marvell. It is based on the Marvell SDK with additions for various
(non-gpio) pin configurations based on the datasheet.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---

Notes:
    Changes in v4:
    - None
    Changes in v3:
    - Use mmio instead of syscon
    - Add additional functions based on the datasheet
    Changes in v2:
    - Make pinctrl a child of a syscon node like the armada-7k-pinctrl

 drivers/pinctrl/mvebu/Kconfig       |   4 +
 drivers/pinctrl/mvebu/Makefile      |   1 +
 drivers/pinctrl/mvebu/pinctrl-ac5.c | 261 ++++++++++++++++++++++++++++
 3 files changed, 266 insertions(+)
 create mode 100644 drivers/pinctrl/mvebu/pinctrl-ac5.c

diff --git a/drivers/pinctrl/mvebu/Kconfig b/drivers/pinctrl/mvebu/Kconfi=
g
index 0d12894d3ee1..aa5883f09d7b 100644
--- a/drivers/pinctrl/mvebu/Kconfig
+++ b/drivers/pinctrl/mvebu/Kconfig
@@ -45,6 +45,10 @@ config PINCTRL_ORION
 	bool
 	select PINCTRL_MVEBU
=20
+config PINCTRL_AC5
+	bool
+	select PINCTRL_MVEBU
+
 config PINCTRL_ARMADA_37XX
 	bool
 	select GENERIC_PINCONF
diff --git a/drivers/pinctrl/mvebu/Makefile b/drivers/pinctrl/mvebu/Makef=
ile
index cd082dca4482..23458ab17c53 100644
--- a/drivers/pinctrl/mvebu/Makefile
+++ b/drivers/pinctrl/mvebu/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_PINCTRL_ARMADA_CP110) +=3D pinctrl-armada-=
cp110.o
 obj-$(CONFIG_PINCTRL_ARMADA_XP)  +=3D pinctrl-armada-xp.o
 obj-$(CONFIG_PINCTRL_ARMADA_37XX)  +=3D pinctrl-armada-37xx.o
 obj-$(CONFIG_PINCTRL_ORION)  +=3D pinctrl-orion.o
+obj-$(CONFIG_PINCTRL_AC5) +=3D pinctrl-ac5.o
diff --git a/drivers/pinctrl/mvebu/pinctrl-ac5.c b/drivers/pinctrl/mvebu/=
pinctrl-ac5.c
new file mode 100644
index 000000000000..292633e61129
--- /dev/null
+++ b/drivers/pinctrl/mvebu/pinctrl-ac5.c
@@ -0,0 +1,261 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Marvell ac5 pinctrl driver based on mvebu pinctrl core
+ *
+ * Copyright (C) 2021 Marvell
+ *
+ * Noam Liron <lnoam@marvell.com>
+ */
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-mvebu.h"
+
+static struct mvebu_mpp_mode ac5_mpp_modes[] =3D {
+	MPP_MODE(0,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "sdio",  "d0"),
+		 MPP_FUNCTION(2, "nand",  "io4")),
+	MPP_MODE(1,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "sdio",  "d1"),
+		 MPP_FUNCTION(2, "nand",  "io3")),
+	MPP_MODE(2,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "sdio",  "d2"),
+		 MPP_FUNCTION(2, "nand",  "io2")),
+	MPP_MODE(3,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "sdio",  "d3"),
+		 MPP_FUNCTION(2, "nand",  "io7")),
+	MPP_MODE(4,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "sdio",  "d4"),
+		 MPP_FUNCTION(2, "nand",  "io6"),
+		 MPP_FUNCTION(3, "uart3", "txd"),
+		 MPP_FUNCTION(4, "uart2", "txd")),
+	MPP_MODE(5,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "sdio",  "d5"),
+		 MPP_FUNCTION(2, "nand",  "io5"),
+		 MPP_FUNCTION(3, "uart3", "rxd"),
+		 MPP_FUNCTION(4, "uart2", "rxd")),
+	MPP_MODE(6,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "sdio",  "d6"),
+		 MPP_FUNCTION(2, "nand",  "io0"),
+		 MPP_FUNCTION(3, "i2c1",  "sck")),
+	MPP_MODE(7,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "sdio",  "d7"),
+		 MPP_FUNCTION(2, "nand",  "io1"),
+		 MPP_FUNCTION(3, "i2c1",  "sda")),
+	MPP_MODE(8,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "sdio",  "clk"),
+		 MPP_FUNCTION(2, "nand",  "wen")),
+	MPP_MODE(9,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "sdio",  "cmd"),
+		 MPP_FUNCTION(2, "nand",  "ale")),
+	MPP_MODE(10,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "sdio",  "ds"),
+		 MPP_FUNCTION(2, "nand",  "cle")),
+	MPP_MODE(11,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "sdio",  "rst"),
+		 MPP_FUNCTION(2, "nand",  "cen")),
+	MPP_MODE(12,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "spi0",  "clk")),
+	MPP_MODE(13,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "spi0",  "csn")),
+	MPP_MODE(14,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "spi0",  "mosi")),
+	MPP_MODE(15,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "spi0",  "miso")),
+	MPP_MODE(16,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "spi0",  "wpn"),
+		 MPP_FUNCTION(2, "nand",  "ren"),
+		 MPP_FUNCTION(3, "uart1", "txd")),
+	MPP_MODE(17,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "spi0",  "hold"),
+		 MPP_FUNCTION(2, "nand",  "rb"),
+		 MPP_FUNCTION(3, "uart1", "rxd")),
+	MPP_MODE(18,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "tsen_int", NULL),
+		 MPP_FUNCTION(2, "uart2", "rxd"),
+		 MPP_FUNCTION(3, "wd_int", NULL)),
+	MPP_MODE(19,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "dev_init_done", NULL),
+		 MPP_FUNCTION(2, "uart2", "txd")),
+	MPP_MODE(20,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(2, "i2c1",  "sck"),
+		 MPP_FUNCTION(3, "spi1",  "clk"),
+		 MPP_FUNCTION(4, "uart3", "txd")),
+	MPP_MODE(21,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(2, "i2c1",  "sda"),
+		 MPP_FUNCTION(3, "spi1",  "csn"),
+		 MPP_FUNCTION(4, "uart3", "rxd")),
+	MPP_MODE(22,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(3, "spi1",  "mosi")),
+	MPP_MODE(23,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(3, "spi1",  "miso")),
+	MPP_MODE(24,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "wd_int", NULL),
+		 MPP_FUNCTION(2, "uart2", "txd"),
+		 MPP_FUNCTION(3, "uartsd", "txd")),
+	MPP_MODE(25,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "int_out", NULL),
+		 MPP_FUNCTION(2, "uart2", "rxd"),
+		 MPP_FUNCTION(3, "uartsd", "rxd")),
+	MPP_MODE(26,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "i2c0",  "sck"),
+		 MPP_FUNCTION(2, "ptp", "clk1"),
+		 MPP_FUNCTION(3, "uart3", "txd")),
+	MPP_MODE(27,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "i2c0",  "sda"),
+		 MPP_FUNCTION(2, "ptp", "pulse"),
+		 MPP_FUNCTION(3, "uart3", "rxd")),
+	MPP_MODE(28,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "xg", "mdio"),
+		 MPP_FUNCTION(2, "ge", "mdio"),
+		 MPP_FUNCTION(3, "uart3", "txd")),
+	MPP_MODE(29,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "xg", "mdio"),
+		 MPP_FUNCTION(2, "ge", "mdio"),
+		 MPP_FUNCTION(3, "uart3", "rxd")),
+	MPP_MODE(30,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "xg", "mdio"),
+		 MPP_FUNCTION(2, "ge", "mdio"),
+		 MPP_FUNCTION(3, "ge", "mdio")),
+	MPP_MODE(31,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "xg", "mdio"),
+		 MPP_FUNCTION(2, "ge", "mdio"),
+		 MPP_FUNCTION(3, "ge", "mdio")),
+	MPP_MODE(32,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "uart0", "txd")),
+	MPP_MODE(33,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "uart0", "rxd"),
+		 MPP_FUNCTION(2, "ptp", "clk1"),
+		 MPP_FUNCTION(3, "ptp", "pulse")),
+	MPP_MODE(34,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "ge", "mdio"),
+		 MPP_FUNCTION(2, "uart3", "rxd")),
+	MPP_MODE(35,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "ge", "mdio"),
+		 MPP_FUNCTION(2, "uart3", "txd"),
+		 MPP_FUNCTION(3, "pcie", "rstoutn")),
+	MPP_MODE(36,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "ptp", "clk0_tp"),
+		 MPP_FUNCTION(2, "ptp", "clk1_tp")),
+	MPP_MODE(37,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "ptp", "pulse_tp"),
+		 MPP_FUNCTION(2, "wd_int", NULL)),
+	MPP_MODE(38,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "synce", "clk_out0")),
+	MPP_MODE(39,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "synce", "clk_out1")),
+	MPP_MODE(40,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "ptp", "pclk_out0"),
+		 MPP_FUNCTION(2, "ptp", "pclk_out1")),
+	MPP_MODE(41,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "ptp", "ref_clk"),
+		 MPP_FUNCTION(2, "ptp", "clk1"),
+		 MPP_FUNCTION(3, "ptp", "pulse"),
+		 MPP_FUNCTION(4, "uart2", "txd"),
+		 MPP_FUNCTION(5, "i2c1",  "sck")),
+	MPP_MODE(42,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "ptp", "clk0"),
+		 MPP_FUNCTION(2, "ptp", "clk1"),
+		 MPP_FUNCTION(3, "ptp", "pulse"),
+		 MPP_FUNCTION(4, "uart2", "rxd"),
+		 MPP_FUNCTION(5, "i2c1",  "sda")),
+	MPP_MODE(43,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "led", "clk")),
+	MPP_MODE(44,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "led", "stb")),
+	MPP_MODE(45,
+		 MPP_FUNCTION(0, "gpio",  NULL),
+		 MPP_FUNCTION(1, "led", "data")),
+};
+
+static struct mvebu_pinctrl_soc_info ac5_pinctrl_info;
+
+static const struct of_device_id ac5_pinctrl_of_match[] =3D {
+	{
+		.compatible =3D "marvell,ac5-pinctrl",
+	},
+	{ },
+};
+
+static const struct mvebu_mpp_ctrl ac5_mpp_controls[] =3D {
+	MPP_FUNC_CTRL(0, 45, NULL, mvebu_mmio_mpp_ctrl), };
+
+static struct pinctrl_gpio_range ac5_mpp_gpio_ranges[] =3D {
+	MPP_GPIO_RANGE(0,   0,  0, 46), };
+
+static int ac5_pinctrl_probe(struct platform_device *pdev)
+{
+	struct mvebu_pinctrl_soc_info *soc =3D &ac5_pinctrl_info;
+
+	soc->variant =3D 0; /* no variants for ac5 */
+	soc->controls =3D ac5_mpp_controls;
+	soc->ncontrols =3D ARRAY_SIZE(ac5_mpp_controls);
+	soc->gpioranges =3D ac5_mpp_gpio_ranges;
+	soc->ngpioranges =3D ARRAY_SIZE(ac5_mpp_gpio_ranges);
+	soc->modes =3D ac5_mpp_modes;
+	soc->nmodes =3D ac5_mpp_controls[0].npins;
+
+	pdev->dev.platform_data =3D soc;
+
+	return mvebu_pinctrl_simple_mmio_probe(pdev);
+}
+
+static struct platform_driver ac5_pinctrl_driver =3D {
+	.driver =3D {
+		.name =3D "ac5-pinctrl",
+		.of_match_table =3D of_match_ptr(ac5_pinctrl_of_match),
+	},
+	.probe =3D ac5_pinctrl_probe,
+};
+builtin_platform_driver(ac5_pinctrl_driver);
--=20
2.35.1

