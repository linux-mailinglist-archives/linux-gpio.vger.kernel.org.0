Return-Path: <linux-gpio+bounces-12625-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E5E9BE3C7
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 11:10:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DE6E1F24680
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 10:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 089AA1DDC12;
	Wed,  6 Nov 2024 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="acPKt4KI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FD31D5CFA;
	Wed,  6 Nov 2024 10:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730887782; cv=none; b=I6yPHzr4d21ZUSxh/Gmn7Ncjy/s2fJrMG3h2+/Fj3/Kv+04Ts/jbugSmW5ZtcO12415gr+OCrYRzMU56Cj8CdkauWTPe/KldBfPx5F4E+QMuwXAcn5vDqiCcvLPN49m0XbxO6PNVx1LZzuuIbNZBiUx1WOAKuUVoBC5meoZClCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730887782; c=relaxed/simple;
	bh=h9qt/DXk0yg9dY/EfdWn1N0Nz2cWAqCy6/QucUi9g/c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C0r4IW2Xh9/RbEy1Zr0vzFStGj2wxggzQ3sl01Fcx21yE1RzNlHjlkRa/TVmXvZrX9MHafNKRSko1wDUl5zgtAXZOUgCNAk8XyM+aIsN5IHXMuab2eq1rn03RNiWqTW6V5eYZ3G3BkDDl6Lg2bfKsHdW1Ypkctb/nuU1d49kGQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=acPKt4KI; arc=none smtp.client-ip=185.70.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1730887772; x=1731146972;
	bh=/odniP3hOcyWQcJBSoxGA0SIdJyyjRLigJou7xhddeI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=acPKt4KINoeZdaoqCD8nPYIUbntt3qzmaKGkvhw98yyMusSnlk9b0pF9H9yn1VqHD
	 Ty6hOsvIxxEa9/LzuTXmVOwnvovTeRkG4MhcJedRowLw3GJ2rxHlT21jQVvHl9WaoN
	 zNyLCbNyzFHhtTm3mX3I9zrwvj/Fx4dI0VVK5YObD/8/+lVSf39Q34TWNGyQD7GV3w
	 lU2AmUw3aP9K2zcl/5cvmhaSGZBY4fQmMLinzIF+wHM34JDFk1CLdN3LJBnpU4SGys
	 BTjmznZAtqtfhjtsoVD/oQDQQ7js+K+koJB/6v/J453Txo9S+cIz/AN6zMgZnzY9ap
	 t85Is73n4u6rg==
Date: Wed, 06 Nov 2024 10:09:28 +0000
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Teng <andy.teng@mediatek.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, Yassine Oudjana <yassine.oudjana@gmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 7/7] pinctrl: mediatek: Add MT6735 pinctrl driver
Message-ID: <20241106100741.173825-8-y.oudjana@protonmail.com>
In-Reply-To: <20241106100741.173825-1-y.oudjana@protonmail.com>
References: <20241106100741.173825-1-y.oudjana@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 40ab30eb5d5f43f43d65b98a3c1c3179cdeede16
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add a driver for the MediaTek MT6735 SoC pin controller. This driver
also supports the pin controller on MT6735M, which lacks 6 physical
pins (198-203) used for MSDC2 on MT6735.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 MAINTAINERS                                   |    3 +
 drivers/pinctrl/mediatek/Kconfig              |    7 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6735.c     |  881 ++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h | 3993 +++++++++++++++++
 5 files changed, 4885 insertions(+)
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6735.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 5a8ba36128152..3aacaf18b0c37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18303,6 +18303,9 @@ PIN CONTROLLER - MEDIATEK MT6735
 M:=09Yassine Oudjana <y.oudjana@protonmail.com>
 L:=09linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:=09Maintained
+F:=09Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yam=
l
+F:=09drivers/pinctrl/mediatek/pinctrl-mt6735.c
+F:=09drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h
 F:=09include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h
=20
 PIN CONTROLLER - MICROCHIP AT91
diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kc=
onfig
index 7af287252834a..ee034d35966ac 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -133,6 +133,13 @@ config PINCTRL_MT2712
 =09default ARM64 && ARCH_MEDIATEK
 =09select PINCTRL_MTK
=20
+config PINCTRL_MT6735
+=09bool "MediaTek MT6735 and MT6735M pin control"
+=09depends on OF
+=09depends on ARM64 || COMPILE_TEST
+=09default ARM64 && ARCH_MEDIATEK
+=09select PINCTRL_MTK_PARIS
+
 config PINCTRL_MT6765
 =09tristate "MediaTek MT6765 pin control"
 =09depends on OF
diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/M=
akefile
index 680f7e8526e00..f8ea0926b06db 100644
--- a/drivers/pinctrl/mediatek/Makefile
+++ b/drivers/pinctrl/mediatek/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_PINCTRL_MT2701)=09=09+=3D pinctrl-mt2701.o
 obj-$(CONFIG_PINCTRL_MT2712)=09=09+=3D pinctrl-mt2712.o
 obj-$(CONFIG_PINCTRL_MT8135)=09=09+=3D pinctrl-mt8135.o
 obj-$(CONFIG_PINCTRL_MT8127)=09=09+=3D pinctrl-mt8127.o
+obj-$(CONFIG_PINCTRL_MT6735)=09=09+=3D pinctrl-mt6735.o
 obj-$(CONFIG_PINCTRL_MT6765)=09=09+=3D pinctrl-mt6765.o
 obj-$(CONFIG_PINCTRL_MT6779)=09=09+=3D pinctrl-mt6779.o
 obj-$(CONFIG_PINCTRL_MT6795)=09=09+=3D pinctrl-mt6795.o
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6735.c b/drivers/pinctrl/me=
diatek/pinctrl-mt6735.c
new file mode 100644
index 0000000000000..08de65ad34c05
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6735.c
@@ -0,0 +1,881 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022 Yassine Oudjana <y.oudjana@protonmail.com>
+ */
+
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "pinctrl-mtk-mt6735.h"
+#include "pinctrl-paris.h"
+
+/* Common registers */
+#define GPIO_DIR=090x000
+#define GPIO_DOUT=090x100
+#define GPIO_DIN=090x200
+#define GPIO_MODE1=090x300
+#define GPIO_MODE2=090x310
+#define GPIO_MODE3=090x320
+#define GPIO_MODE4=090x330
+#define GPIO_MODE5=090x340
+#define GPIO_MODE6=090x350
+#define GPIO_MODE7=090x360
+#define GPIO_MODE8=090x370
+#define GPIO_MODE9=090x380
+#define GPIO_MODE10=090x390
+#define GPIO_MODE11=090x3a0
+#define GPIO_MODE12=090x3b0
+#define GPIO_MODE13=090x3c0
+#define GPIO_MODE14=090x3d0
+#define GPIO_MODE15=090x3e0
+#define GPIO_MODE16=090x3f0
+#define GPIO_MODE17=090x400
+#define GPIO_MODE18=090x410
+#define GPIO_MODE19=090x420
+#define GPIO_MODE20=090x430
+#define GPIO_MODE21=090x440
+
+/* Pin group registers */
+#define GPIO_IES=090x000=09/* 16-bit */
+#define GPIO_SMT=090x010=09/* 16-bit */
+#define GPIO_TDSEL=090x020=09/* 32-bit */
+#define GPIO_RDSEL=090x028=09/* 32-bit */
+#define GPIO_PULLEN=090x030=09/* 32-bit */
+#define GPIO_PULLSEL=090x050=09/* 32-bit */
+#define GPIO_DRV=090x070=09/* 32-bit */
+#define GPIO_PUPD=090x080=09/* 32-bit */
+
+/* Every pin has its own bit(s) */
+#define PIN_FIELD_BASE(_s_pin, _e_pin, _i_base, _s_addr, _s_width, _x_addr=
s, _s_bit, _x_bits)=09\
+=09PIN_FIELD_CALC(_s_pin, _e_pin, _i_base, _s_addr, _x_addrs, _s_bit,=09\
+=09=09       _x_bits, _s_width, 0)
+
+/* All pins in the range share the same bit(s) */
+#define PINS_FIELD_BASE(_s_pin, _e_pin, _i_base, _s_addr, _s_width, _x_add=
rs, _s_bit, _x_bits)=09\
+=09PIN_FIELD_CALC(_s_pin, _e_pin, _i_base, _s_addr, _x_addrs, _s_bit,=09\
+=09=09      _x_bits, _s_width, 1)
+
+static const struct mtk_pin_field_calc mt6735_pin_dir_range[] =3D {
+=09PIN_FIELD(0, 203, GPIO_DIR, 0x10, 0, 1)
+};
+
+static const struct mtk_pin_field_calc mt6735_pin_di_range[] =3D {
+=09PIN_FIELD(0, 203, GPIO_DIN, 0x10, 0, 1)
+};
+
+static const struct mtk_pin_field_calc mt6735_pin_do_range[] =3D {
+=09PIN_FIELD(0, 203, GPIO_DOUT, 0x10, 0, 1)
+};
+
+static const struct mtk_pin_field_calc mt6735_pin_mode_range[] =3D {
+=09PIN_FIELD(0, 4, GPIO_MODE1, 0, 0, 3),
+=09PIN_FIELD(5, 9, GPIO_MODE1, 0, 16, 3),
+=09PIN_FIELD(10, 14, GPIO_MODE2, 0, 0, 3),
+=09PIN_FIELD(15, 19, GPIO_MODE2, 0, 16, 3),
+=09PIN_FIELD(20, 24, GPIO_MODE3, 0, 0, 3),
+=09PIN_FIELD(25, 29, GPIO_MODE3, 0, 16, 3),
+=09PIN_FIELD(30, 34, GPIO_MODE4, 0, 0, 3),
+=09PIN_FIELD(35, 39, GPIO_MODE4, 0, 16, 3),
+=09PIN_FIELD(40, 44, GPIO_MODE5, 0, 0, 3),
+=09PIN_FIELD(45, 49, GPIO_MODE5, 0, 16, 3),
+=09PIN_FIELD(50, 54, GPIO_MODE6, 0, 0, 3),
+=09PIN_FIELD(55, 59, GPIO_MODE6, 0, 16, 3),
+=09PIN_FIELD(60, 64, GPIO_MODE7, 0, 0, 3),
+=09PIN_FIELD(65, 69, GPIO_MODE7, 0, 16, 3),
+=09PIN_FIELD(70, 74, GPIO_MODE8, 0, 0, 3),
+=09PIN_FIELD(75, 79, GPIO_MODE8, 0, 16, 3),
+=09PIN_FIELD(80, 84, GPIO_MODE9, 0, 0, 3),
+=09PIN_FIELD(85, 89, GPIO_MODE9, 0, 16, 3),
+=09PIN_FIELD(90, 94, GPIO_MODE10, 0, 0, 3),
+=09PIN_FIELD(95, 99, GPIO_MODE10, 0, 16, 3),
+=09PIN_FIELD(100, 104, GPIO_MODE11, 0, 0, 3),
+=09PIN_FIELD(105, 109, GPIO_MODE11, 0, 16, 3),
+=09PIN_FIELD(110, 114, GPIO_MODE12, 0, 0, 3),
+=09PIN_FIELD(115, 119, GPIO_MODE12, 0, 16, 3),
+=09PIN_FIELD(120, 124, GPIO_MODE13, 0, 0, 3),
+=09PIN_FIELD(125, 129, GPIO_MODE13, 0, 16, 3),
+=09PIN_FIELD(130, 134, GPIO_MODE14, 0, 0, 3),
+=09PIN_FIELD(135, 139, GPIO_MODE14, 0, 16, 3),
+=09PIN_FIELD(140, 144, GPIO_MODE15, 0, 0, 3),
+=09PIN_FIELD(145, 149, GPIO_MODE15, 0, 16, 3),
+=09PIN_FIELD(150, 154, GPIO_MODE16, 0, 0, 3),
+=09PIN_FIELD(155, 159, GPIO_MODE16, 0, 16, 3),
+=09PIN_FIELD(160, 164, GPIO_MODE17, 0, 0, 3),
+=09PIN_FIELD(165, 169, GPIO_MODE17, 0, 16, 3),
+=09PIN_FIELD(170, 174, GPIO_MODE18, 0, 0, 3),
+=09PIN_FIELD(175, 179, GPIO_MODE18, 0, 16, 3),
+=09PIN_FIELD(180, 184, GPIO_MODE19, 0, 0, 3),
+=09PIN_FIELD(185, 189, GPIO_MODE19, 0, 16, 3),
+=09PIN_FIELD(190, 194, GPIO_MODE20, 0, 0, 3),
+=09PIN_FIELD(195, 199, GPIO_MODE20, 0, 16, 3),
+=09PIN_FIELD(200, 203, GPIO_MODE21, 0, 0, 3),
+};
+
+
+static const struct mtk_pin_field_calc mt6735_pin_smt_range[] =3D {
+=09PINS_FIELD_BASE(0, 4, 2, GPIO_SMT, 16, 0, 10, 1),=09=09/* EINT0~4 */
+=09PINS_FIELD_BASE(5, 8, 3, GPIO_SMT, 16, 0, 3, 1),=09=09/* EINT5~8 */
+=09PINS_FIELD_BASE(9, 12, 3, GPIO_SMT, 16, 0, 6, 1),=09=09/* EINT9~12 */
+=09PINS_FIELD_BASE(13, 18, 1, GPIO_SMT, 16, 0, 0, 1),=09=09/* WB_CTRL */
+=09PINS_FIELD_BASE(19, 21, 1, GPIO_SMT, 16, 0, 1, 1),=09=09/* ANTSEL */
+=09PINS_FIELD_BASE(45, 46, 2, GPIO_SMT, 16, 0, 1, 1),=09=09/* CMMCLK */
+=09PINS_FIELD_BASE(47, 48, 2, GPIO_SMT, 16, 0, 2, 1),=09=09/* I2C0 */
+=09PINS_FIELD_BASE(49, 50, 2, GPIO_SMT, 16, 0, 3, 1),=09=09/* I2C1 */
+=09PINS_FIELD_BASE(51, 52, 2, GPIO_SMT, 16, 0, 4, 1),=09=09/* I2C2 */
+=09PINS_FIELD_BASE(53, 54, 2, GPIO_SMT, 16, 0, 5, 1),=09=09/* I2C3 */
+=09PINS_FIELD_BASE(55, 55, 2, GPIO_SMT, 16, 0, 6, 1),=09=09/* SRCLKENAI */
+=09PINS_FIELD_BASE(56, 56, 2, GPIO_SMT, 16, 0, 7, 1),=09=09/* SRCLKENA1 */
+=09PINS_FIELD_BASE(57, 60, 2, GPIO_SMT, 16, 0, 8, 1),=09=09/* UART2/3 */
+=09PINS_FIELD_BASE(61, 64, 2, GPIO_SMT, 16, 0, 9, 1),=09=09/* PCM */
+=09PINS_FIELD_BASE(65, 68, 3, GPIO_SMT, 16, 0, 0, 1),=09=09/* SPI */
+=09PINS_FIELD_BASE(69, 69, 3, GPIO_SMT, 16, 0, 1, 1),=09=09/* DISP_PWM */
+=09PINS_FIELD_BASE(70, 73, 3, GPIO_SMT, 16, 0, 2, 1),=09=09/* JTAG */
+=09PINS_FIELD_BASE(74, 77, 3, GPIO_SMT, 16, 0, 4, 1),=09=09/* UART0/1 */
+=09PINS_FIELD_BASE(78, 80, 3, GPIO_SMT, 16, 0, 5, 1),=09=09/* I2S */
+=09PINS_FIELD_BASE(81, 86, 3, GPIO_SMT, 16, 0, 7, 1),=09=09/* KEYPAD */
+=09PINS_FIELD_BASE(87, 103, 3, GPIO_SMT, 16, 0, 8, 1),=09=09/* BPI5~20, C2=
K_TKBPI */
+=09PINS_FIELD_BASE(104, 114, 3, GPIO_SMT, 16, 0, 9, 1),=09=09/* RFIC0/1 */
+=09PINS_FIELD_BASE(118, 136, 4, GPIO_SMT, 16, 0, 0, 1),=09=09/* LTE_TXBPI,=
 BPI0~4, BPI21~27, PAVM */
+=09PINS_FIELD_BASE(137, 137, 4, GPIO_SMT, 16, 0, 1, 1),=09=09/* RTC32K */
+=09PINS_FIELD_BASE(138, 142, 4, GPIO_SMT, 16, 0, 2, 1),=09=09/* PWRAP */
+=09PINS_FIELD_BASE(143, 145, 4, GPIO_SMT, 16, 0, 3, 1),=09=09/* AUD */
+=09PINS_FIELD_BASE(146, 147, 4, GPIO_SMT, 16, 0, 4, 1),=09=09/* LCM_RST, D=
SI_TE */
+=09PINS_FIELD_BASE(148, 148, 4, GPIO_SMT, 16, 0, 5, 1),=09=09/* SRCLKENA0 =
*/
+=09PINS_FIELD_BASE(149, 149, 4, GPIO_SMT, 16, 0, 1, 1),=09=09/* WATCHDOG *=
/
+=09PINS_FIELD_BASE(160, 162, 5, GPIO_SMT, 16, 0, 0, 1),=09=09/* SIM2 */
+=09PINS_FIELD_BASE(163, 165, 4, GPIO_SMT, 16, 0, 1, 1),=09=09/* SIM1 */
+=09PINS_FIELD_BASE(166, 166, 5, GPIO_SMT, 16, 0, 2, 1),=09=09/* MSDC1_CMD =
*/
+=09PINS_FIELD_BASE(167, 167, 5, GPIO_SMT, 16, 0, 3, 1),=09=09/* MSDC1_CLK =
*/
+=09PINS_FIELD_BASE(168, 171, 5, GPIO_SMT, 16, 0, 4, 1),=09=09/* MSDC1_DAT =
*/
+=09PINS_FIELD_BASE(172, 172, 6, GPIO_SMT, 16, 0, 0, 1),=09=09/* MSDC0_CMD =
*/
+=09PINS_FIELD_BASE(173, 173, 6, GPIO_SMT, 16, 0, 1, 1),=09=09/* MSDC0_DSL =
*/
+=09PINS_FIELD_BASE(174, 174, 6, GPIO_SMT, 16, 0, 2, 1),=09=09/* MSDC0_CLK =
*/
+=09PINS_FIELD_BASE(175, 182, 6, GPIO_SMT, 16, 0, 3, 1),=09=09/* MSDC0_DAT =
*/
+=09PINS_FIELD_BASE(183, 183, 6, GPIO_SMT, 16, 0, 4, 1),=09=09/* MSDC0_RSTB=
 */
+=09PINS_FIELD_BASE(184, 185, 6, GPIO_SMT, 16, 0, 5, 1),=09=09/* FM */
+=09PINS_FIELD_BASE(186, 189, 6, GPIO_SMT, 16, 0, 6, 1),=09=09/* WB SPI */
+=09PINS_FIELD_BASE(198, 198, 1, GPIO_SMT, 16, 0, 2, 1),=09=09/* MSDC2_CMD =
*/
+=09PINS_FIELD_BASE(199, 199, 1, GPIO_SMT, 16, 0, 3, 1),=09=09/* MSDC2_CLK =
*/
+=09PINS_FIELD_BASE(200, 203, 1, GPIO_SMT, 16, 0, 4, 1),=09=09/* MSDC2_DAT =
*/
+};
+
+static const struct mtk_pin_field_calc mt6735_pin_ies_range[] =3D {
+=09PINS_FIELD_BASE(0, 4, 2, GPIO_IES, 16, 0, 10, 1),=09=09/* EINT0~4 */
+=09PINS_FIELD_BASE(5, 8, 3, GPIO_IES, 16, 0, 3, 1),=09=09/* EINT5~8 */
+=09PINS_FIELD_BASE(9, 12, 3, GPIO_IES, 16, 0, 6, 1),=09=09/* EINT9~12 */
+=09PINS_FIELD_BASE(13, 18, 1, GPIO_IES, 16, 0, 0, 1),=09=09/* WB_CTRL */
+=09PINS_FIELD_BASE(19, 21, 1, GPIO_IES, 16, 0, 1, 1),=09=09/* ANTSEL */
+=09PINS_FIELD_BASE(45, 46, 2, GPIO_IES, 16, 0, 1, 1),=09=09/* CMMCLK */
+=09PINS_FIELD_BASE(47, 48, 2, GPIO_IES, 16, 0, 2, 1),=09=09/* I2C0 */
+=09PINS_FIELD_BASE(49, 50, 2, GPIO_IES, 16, 0, 3, 1),=09=09/* I2C1 */
+=09PINS_FIELD_BASE(51, 52, 2, GPIO_IES, 16, 0, 4, 1),=09=09/* I2C2 */
+=09PINS_FIELD_BASE(53, 54, 2, GPIO_IES, 16, 0, 5, 1),=09=09/* I2C3 */
+=09PINS_FIELD_BASE(55, 55, 2, GPIO_IES, 16, 0, 6, 1),=09=09/* SRCLKENAI */
+=09PINS_FIELD_BASE(56, 56, 2, GPIO_IES, 16, 0, 7, 1),=09=09/* SRCLKENA1 */
+=09PINS_FIELD_BASE(57, 60, 2, GPIO_IES, 16, 0, 8, 1),=09=09/* UART2/3 */
+=09PINS_FIELD_BASE(61, 64, 2, GPIO_IES, 16, 0, 9, 1),=09=09/* PCM */
+=09PINS_FIELD_BASE(65, 68, 3, GPIO_IES, 16, 0, 0, 1),=09=09/* SPI */
+=09PINS_FIELD_BASE(69, 69, 3, GPIO_IES, 16, 0, 1, 1),=09=09/* DISP_PWM */
+=09PINS_FIELD_BASE(70, 73, 3, GPIO_IES, 16, 0, 2, 1),=09=09/* JTAG */
+=09PINS_FIELD_BASE(74, 77, 3, GPIO_IES, 16, 0, 4, 1),=09=09/* UART0/1 */
+=09PINS_FIELD_BASE(78, 80, 3, GPIO_IES, 16, 0, 5, 1),=09=09/* I2S */
+=09PINS_FIELD_BASE(81, 86, 3, GPIO_IES, 16, 0, 7, 1),=09=09/* KEYPAD */
+=09PINS_FIELD_BASE(87, 103, 3, GPIO_IES, 16, 0, 8, 1),=09=09/* BPI5~20, C2=
K_TKBPI */
+=09PINS_FIELD_BASE(104, 114, 3, GPIO_IES, 16, 0, 9, 1),=09=09/* RFIC0/1 */
+=09PINS_FIELD_BASE(118, 136, 4, GPIO_IES, 16, 0, 0, 1),=09=09/* LTE_TXBPI,=
 BPI0~4, BPI21~27, PAVM */
+=09PINS_FIELD_BASE(137, 137, 4, GPIO_IES, 16, 0, 1, 1),=09=09/* RTC32K */
+=09PINS_FIELD_BASE(138, 142, 4, GPIO_IES, 16, 0, 2, 1),=09=09/* PWRAP */
+=09PINS_FIELD_BASE(143, 145, 4, GPIO_IES, 16, 0, 3, 1),=09=09/* AUD */
+=09PINS_FIELD_BASE(146, 147, 4, GPIO_IES, 16, 0, 4, 1),=09=09/* LCM_RST, D=
SI_TE */
+=09PINS_FIELD_BASE(148, 148, 4, GPIO_IES, 16, 0, 5, 1),=09=09/* SRCLKENA0 =
*/
+=09PINS_FIELD_BASE(149, 149, 4, GPIO_IES, 16, 0, 1, 1),=09=09/* WATCHDOG *=
/
+=09PINS_FIELD_BASE(160, 162, 5, GPIO_IES, 16, 0, 0, 1),=09=09/* SIM2 */
+=09PINS_FIELD_BASE(163, 165, 4, GPIO_IES, 16, 0, 1, 1),=09=09/* SIM1 */
+=09PINS_FIELD_BASE(166, 166, 5, GPIO_IES, 16, 0, 2, 1),=09=09/* MSDC1_CMD =
*/
+=09PINS_FIELD_BASE(167, 167, 5, GPIO_IES, 16, 0, 3, 1),=09=09/* MSDC1_CLK =
*/
+=09PINS_FIELD_BASE(168, 171, 5, GPIO_IES, 16, 0, 4, 1),=09=09/* MSDC1_DAT =
*/
+=09PINS_FIELD_BASE(172, 172, 6, GPIO_IES, 16, 0, 0, 1),=09=09/* MSDC0_CMD =
*/
+=09PINS_FIELD_BASE(173, 173, 6, GPIO_IES, 16, 0, 1, 1),=09=09/* MSDC0_DSL =
*/
+=09PINS_FIELD_BASE(174, 174, 6, GPIO_IES, 16, 0, 2, 1),=09=09/* MSDC0_CLK =
*/
+=09PINS_FIELD_BASE(175, 182, 6, GPIO_IES, 16, 0, 3, 1),=09=09/* MSDC0_DAT =
*/
+=09PINS_FIELD_BASE(183, 183, 6, GPIO_IES, 16, 0, 4, 1),=09=09/* MSDC0_RSTB=
 */
+=09PINS_FIELD_BASE(184, 185, 6, GPIO_IES, 16, 0, 5, 1),=09=09/* FM */
+=09PINS_FIELD_BASE(186, 189, 6, GPIO_IES, 16, 0, 6, 1),=09=09/* WB SPI */
+=09PINS_FIELD_BASE(198, 198, 1, GPIO_IES, 16, 0, 2, 1),=09=09/* MSDC2_CMD =
*/
+=09PINS_FIELD_BASE(199, 199, 1, GPIO_IES, 16, 0, 3, 1),=09=09/* MSDC2_CLK =
*/
+=09PINS_FIELD_BASE(200, 203, 1, GPIO_IES, 16, 0, 4, 1)=09=09/* MSDC2_DAT *=
/
+};
+
+static const struct mtk_pin_field_calc mt6735_pin_tdsel_range[] =3D {
+=09PINS_FIELD_BASE(0, 4, 2, GPIO_TDSEL, 32, 0x04, 40, 4),=09=09/* EINT0~4 =
*/
+=09PINS_FIELD_BASE(5, 8, 3, GPIO_TDSEL, 32, 0x04, 12, 4),=09=09/* EINT5~8 =
*/
+=09PINS_FIELD_BASE(9, 12, 3, GPIO_TDSEL, 32, 0x04, 24, 4),=09=09/* EINT9~1=
2 */
+=09PINS_FIELD_BASE(13, 18, 1, GPIO_TDSEL, 32, 0, 0, 4),=09=09/* WB_CTRL */
+=09PINS_FIELD_BASE(19, 21, 1, GPIO_TDSEL, 32, 0, 4, 4),=09=09/* ANTSEL */
+=09PINS_FIELD_BASE(45, 46, 2, GPIO_TDSEL, 32, 0x04, 4, 4),=09=09/* CMMCLK =
*/
+=09PINS_FIELD_BASE(47, 48, 2, GPIO_TDSEL, 32, 0x04, 8, 4),=09=09/* I2C0 */
+=09PINS_FIELD_BASE(49, 50, 2, GPIO_TDSEL, 32, 0x04, 12, 4),=09/* I2C1 */
+=09PINS_FIELD_BASE(51, 52, 2, GPIO_TDSEL, 32, 0x04, 16, 4),=09/* I2C2 */
+=09PINS_FIELD_BASE(53, 54, 2, GPIO_TDSEL, 32, 0x04, 20, 4),=09/* I2C3 */
+=09PINS_FIELD_BASE(55, 55, 2, GPIO_TDSEL, 32, 0x04, 24, 4),=09/* SRCLKENAI=
 */
+=09PINS_FIELD_BASE(56, 56, 2, GPIO_TDSEL, 32, 0x04, 28, 4),=09/* SRCLKENA1=
 */
+=09PINS_FIELD_BASE(57, 60, 2, GPIO_TDSEL, 32, 0x04, 32, 4),=09/* UART2/3 *=
/
+=09PINS_FIELD_BASE(61, 64, 2, GPIO_TDSEL, 32, 0x04, 36, 4),=09/* PCM */
+=09PINS_FIELD_BASE(65, 68, 3, GPIO_TDSEL, 32, 0x04, 0, 4),=09=09/* SPI */
+=09PINS_FIELD_BASE(69, 69, 3, GPIO_TDSEL, 32, 0x04, 4, 4),=09=09/* DISP_PW=
M */
+=09PINS_FIELD_BASE(70, 73, 3, GPIO_TDSEL, 32, 0x04, 8, 4),=09=09/* JTAG */
+=09PINS_FIELD_BASE(74, 77, 3, GPIO_TDSEL, 32, 0x04, 16, 4),=09/* UART0/1 *=
/
+=09PINS_FIELD_BASE(78, 80, 3, GPIO_TDSEL, 32, 0x04, 20, 4),=09/* I2S */
+=09PINS_FIELD_BASE(81, 86, 3, GPIO_TDSEL, 32, 0x04, 28, 4),=09/* KEYPAD */
+=09PINS_FIELD_BASE(87, 103, 3, GPIO_TDSEL, 32, 0x04, 32, 4),=09/* BPI5~20,=
 C2K_TKBPI */
+=09PINS_FIELD_BASE(104, 114, 3, GPIO_TDSEL, 32, 0x04, 36, 4),=09/* RFIC0/1=
 */
+=09PINS_FIELD_BASE(118, 136, 4, GPIO_TDSEL, 32, 0, 0, 4),=09=09/* LTE_TXBP=
I, BPI0~4, BPI21~27, PAVM */
+=09PINS_FIELD_BASE(137, 137, 4, GPIO_TDSEL, 32, 0, 4, 4),=09=09/* RTC32K *=
/
+=09PINS_FIELD_BASE(138, 142, 4, GPIO_TDSEL, 32, 0, 8, 4),=09=09/* PWRAP */
+=09PINS_FIELD_BASE(143, 145, 4, GPIO_TDSEL, 32, 0, 12, 4),=09=09/* AUD */
+=09PINS_FIELD_BASE(146, 147, 4, GPIO_TDSEL, 32, 0, 16, 4),=09=09/* LCM_RST=
, DSI_TE */
+=09PINS_FIELD_BASE(148, 148, 4, GPIO_TDSEL, 32, 0, 20, 4),=09=09/* SRCLKEN=
A0 */
+=09PINS_FIELD_BASE(149, 149, 4, GPIO_TDSEL, 32, 0, 4, 4),=09=09/* WATCHDOG=
 */
+=09PINS_FIELD_BASE(160, 162, 5, GPIO_TDSEL, 32, 0, 0, 4),=09=09/* SIM2 */
+=09PINS_FIELD_BASE(163, 165, 5, GPIO_TDSEL, 32, 0, 4, 4),=09=09/* SIM1 */
+=09PINS_FIELD_BASE(166, 166, 5, GPIO_TDSEL, 32, 0, 8, 4),=09=09/* MSDC1_CM=
D */
+=09PINS_FIELD_BASE(167, 167, 5, GPIO_TDSEL, 32, 0, 12, 4),=09=09/* MSDC1_C=
LK */
+=09PINS_FIELD_BASE(168, 171, 5, GPIO_TDSEL, 32, 0, 16, 4),=09=09/* MSDC1_D=
AT */
+=09PINS_FIELD_BASE(172, 172, 6, GPIO_TDSEL, 32, 0, 0, 4),=09=09/* MSDC0_CM=
D */
+=09PINS_FIELD_BASE(173, 173, 6, GPIO_TDSEL, 32, 0, 4, 4),=09=09/* MSDC0_DS=
L */
+=09PINS_FIELD_BASE(174, 174, 6, GPIO_TDSEL, 32, 0, 8, 4),=09=09/* MSDC0_CL=
K */
+=09PINS_FIELD_BASE(175, 182, 6, GPIO_TDSEL, 32, 0, 12, 4),=09=09/* MSDC0_D=
AT */
+=09PINS_FIELD_BASE(183, 183, 6, GPIO_TDSEL, 32, 0, 16, 4),=09=09/* MSDC0_R=
STB */
+=09PINS_FIELD_BASE(184, 185, 6, GPIO_TDSEL, 32, 0, 20, 4),=09=09/* FM */
+=09PINS_FIELD_BASE(186, 189, 6, GPIO_TDSEL, 32, 0, 24, 4),=09=09/* WB SPI =
*/
+=09PINS_FIELD_BASE(198, 198, 1, GPIO_TDSEL, 32, 0, 8, 4),=09=09/* MSDC2_CM=
D */
+=09PINS_FIELD_BASE(199, 199, 1, GPIO_TDSEL, 32, 0, 12, 4),=09=09/* MSDC2_C=
LK */
+=09PINS_FIELD_BASE(200, 203, 1, GPIO_TDSEL, 32, 0, 16, 4)=09=09/* MSDC2_DA=
T */
+};
+
+static const struct mtk_pin_field_calc mt6735_pin_rdsel_range[] =3D {
+=09PINS_FIELD_BASE(0, 4, 2, GPIO_RDSEL, 32, 0x04, 24, 2),=09=09/* EINT0~4 =
*/
+=09PINS_FIELD_BASE(5, 8, 3, GPIO_RDSEL, 32, 0, 6, 2),=09=09/* EINT5~8 */
+=09PINS_FIELD_BASE(9, 12, 3, GPIO_RDSEL, 32, 0, 12, 2),=09=09/* EINT9~12 *=
/
+=09PINS_FIELD_BASE(13, 18, 1, GPIO_RDSEL, 32, 0, 0, 2),=09=09/* WB_CTRL */
+=09PINS_FIELD_BASE(19, 21, 1, GPIO_RDSEL, 32, 0, 2, 2),=09=09/* ANTSEL */
+=09PINS_FIELD_BASE(45, 46, 2, GPIO_RDSEL, 32, 0x04, 2, 6),=09=09/* CMMCLK =
*/
+=09PINS_FIELD_BASE(47, 48, 2, GPIO_RDSEL, 32, 0x04, 8, 2),=09=09/* I2C0 */
+=09PINS_FIELD_BASE(49, 50, 2, GPIO_RDSEL, 32, 0x04, 10, 2),=09/* I2C1 */
+=09PINS_FIELD_BASE(51, 52, 2, GPIO_RDSEL, 32, 0x04, 12, 2),=09/* I2C2 */
+=09PINS_FIELD_BASE(53, 54, 2, GPIO_RDSEL, 32, 0x04, 14, 2),=09/* I2C3 */
+=09PINS_FIELD_BASE(55, 55, 2, GPIO_RDSEL, 32, 0x04, 16, 2),=09/* SRCLKENAI=
 */
+=09PINS_FIELD_BASE(56, 56, 2, GPIO_RDSEL, 32, 0x04, 18, 2),=09/* SRCLKENA1=
 */
+=09PINS_FIELD_BASE(57, 60, 2, GPIO_RDSEL, 32, 0x04, 20, 2),=09/* UART2/3 *=
/
+=09PINS_FIELD_BASE(61, 64, 2, GPIO_RDSEL, 32, 0x04, 22, 2),=09/* PCM */
+=09PINS_FIELD_BASE(65, 68, 3, GPIO_RDSEL, 32, 0, 0, 2),=09=09/* SPI */
+=09PINS_FIELD_BASE(69, 69, 3, GPIO_RDSEL, 32, 0, 2, 2),=09=09/* DISP_PWM *=
/
+=09PINS_FIELD_BASE(70, 73, 3, GPIO_RDSEL, 32, 0, 4, 2),=09=09/* JTAG */
+=09PINS_FIELD_BASE(74, 77, 3, GPIO_RDSEL, 32, 0, 8, 2),=09=09/* UART0/1 */
+=09PINS_FIELD_BASE(78, 80, 3, GPIO_RDSEL, 32, 0, 10, 2),=09=09/* I2S */
+=09PINS_FIELD_BASE(81, 86, 3, GPIO_RDSEL, 32, 0, 14, 2),=09=09/* KEYPAD */
+=09PINS_FIELD_BASE(87, 103, 3, GPIO_RDSEL, 32, 0, 16, 2),=09=09/* BPI5~20,=
 C2K_TKBPI */
+=09PINS_FIELD_BASE(104, 114, 3, GPIO_RDSEL, 32, 0, 18, 2),=09=09/* RFIC0/1=
 */
+=09PINS_FIELD_BASE(118, 136, 4, GPIO_RDSEL, 32, 0, 0, 2),=09=09/* LTE_TXBP=
I, BPI0~4, BPI21~27, PAVM */
+=09PINS_FIELD_BASE(137, 137, 4, GPIO_RDSEL, 32, 0, 4, 2),=09=09/* RTC32K *=
/
+=09PINS_FIELD_BASE(138, 142, 4, GPIO_RDSEL, 32, 0, 6, 2),=09=09/* PWRAP */
+=09PINS_FIELD_BASE(143, 145, 4, GPIO_RDSEL, 32, 0, 8, 2),=09=09/* AUD */
+=09PINS_FIELD_BASE(146, 147, 4, GPIO_RDSEL, 32, 0, 10, 2),=09=09/* LCM_RST=
, DSI_TE */
+=09PINS_FIELD_BASE(148, 148, 4, GPIO_RDSEL, 32, 0, 12, 2),=09=09/* SRCLKEN=
A0 */
+=09PINS_FIELD_BASE(149, 149, 4, GPIO_RDSEL, 32, 0, 4, 2),=09=09/* WATCHDOG=
 */
+=09PINS_FIELD_BASE(160, 162, 5, GPIO_RDSEL, 32, 0, 0, 6),=09=09/* SIM2 */
+=09PINS_FIELD_BASE(163, 165, 5, GPIO_RDSEL, 32, 0, 6, 6),=09=09/* SIM1 */
+=09PINS_FIELD_BASE(166, 166, 5, GPIO_RDSEL, 32, 0, 12, 6),=09=09/* MSDC1_C=
MD */
+=09PINS_FIELD_BASE(167, 167, 5, GPIO_RDSEL, 32, 0, 18, 6),=09=09/* MSDC1_C=
LK */
+=09PINS_FIELD_BASE(168, 171, 5, GPIO_RDSEL, 32, 0, 24, 6),=09=09/* MSDC1_D=
AT */
+=09PINS_FIELD_BASE(172, 172, 6, GPIO_RDSEL, 32, 0, 0, 6),=09=09/* MSDC0_CM=
D */
+=09PINS_FIELD_BASE(173, 173, 6, GPIO_RDSEL, 32, 0, 6, 6),=09=09/* MSDC0_DS=
L */
+=09PINS_FIELD_BASE(174, 174, 6, GPIO_RDSEL, 32, 0, 12, 6),=09=09/* MSDC0_C=
LK */
+=09PINS_FIELD_BASE(175, 182, 6, GPIO_RDSEL, 32, 0, 18, 6),=09=09/* MSDC0_D=
AT */
+=09PINS_FIELD_BASE(183, 183, 6, GPIO_RDSEL, 32, 0, 24, 6),=09=09/* MSDC0_R=
STB */
+=09PINS_FIELD_BASE(184, 185, 6, GPIO_RDSEL, 32, 0, 30, 2),=09=09/* FM */
+=09PINS_FIELD_BASE(186, 189, 6, GPIO_RDSEL, 32, 0, 32, 2),=09=09/* WB SPI =
*/
+=09PINS_FIELD_BASE(198, 198, 1, GPIO_RDSEL, 32, 0, 4, 6),=09=09/* MSDC2_CM=
D */
+=09PINS_FIELD_BASE(199, 199, 1, GPIO_RDSEL, 32, 0, 10, 6),=09=09/* MSDC2_C=
LK */
+=09PINS_FIELD_BASE(200, 203, 1, GPIO_RDSEL, 32, 0, 16, 6)=09=09/* MSDC2_DA=
T */
+};
+
+static const struct mtk_pin_field_calc mt6735_pin_drv_range[] =3D {
+=09PINS_FIELD_BASE(0, 4, 2, GPIO_DRV, 32, 0x04, 41, 2),=09=09/* EINT0~4 */
+=09PINS_FIELD_BASE(5, 8, 3, GPIO_DRV, 32, 0x04, 13, 2),=09=09/* EINT5~8 */
+=09PINS_FIELD_BASE(9, 12, 3, GPIO_DRV, 32, 0x04, 25, 2),=09=09/* EINT9~12 =
*/
+=09PINS_FIELD_BASE(13, 18, 1, GPIO_DRV, 32, 0, 1, 2),=09=09/* WB_CTRL */
+=09PINS_FIELD_BASE(19, 21, 1, GPIO_DRV, 32, 0, 5, 2),=09=09/* ANTSEL */
+=09PINS_FIELD_BASE(45, 46, 2, GPIO_DRV, 32, 0x04, 4, 3),=09=09/* CMMCLK */
+=09PINS_FIELD_BASE(55, 55, 2, GPIO_DRV, 32, 0x04, 25, 2),=09=09/* SRCLKENA=
I */
+=09PINS_FIELD_BASE(56, 56, 2, GPIO_DRV, 32, 0x04, 29, 2),=09=09/* SRCLKENA=
1 */
+=09PINS_FIELD_BASE(57, 60, 2, GPIO_DRV, 32, 0x04, 33, 2),=09=09/* UART2/3 =
*/
+=09PINS_FIELD_BASE(61, 64, 2, GPIO_DRV, 32, 0x04, 37, 2),=09=09/* PCM */
+=09PINS_FIELD_BASE(65, 68, 3, GPIO_DRV, 32, 0x04, 1, 2),=09=09/* SPI */
+=09PINS_FIELD_BASE(69, 69, 3, GPIO_DRV, 32, 0x04, 5, 2),=09=09/* DISP_PWM =
*/
+=09PINS_FIELD_BASE(70, 73, 3, GPIO_DRV, 32, 0x04, 9, 2),=09=09/* JTAG */
+=09PINS_FIELD_BASE(74, 77, 3, GPIO_DRV, 32, 0x04, 17, 2),=09=09/* UART0/1 =
*/
+=09PINS_FIELD_BASE(78, 80, 3, GPIO_DRV, 32, 0x04, 21, 2),=09=09/* I2S */
+=09PINS_FIELD_BASE(81, 86, 3, GPIO_DRV, 32, 0x04, 29, 2),=09=09/* KEYPAD *=
/
+=09PINS_FIELD_BASE(87, 103, 3, GPIO_DRV, 32, 0x04, 33, 2),=09=09/* BPI5~20=
, C2K_TKBPI */
+=09PINS_FIELD_BASE(104, 114, 3, GPIO_DRV, 32, 0x04, 37, 2),=09/* RFIC0/1 *=
/
+=09PINS_FIELD_BASE(118, 136, 4, GPIO_DRV, 32, 0, 1, 2),=09=09/* LTE_TXBPI,=
 BPI0~4, BPI21~27, PAVM */
+=09PINS_FIELD_BASE(137, 137, 4, GPIO_DRV, 32, 0, 5, 2),=09=09/* RTC32K */
+=09PINS_FIELD_BASE(138, 142, 4, GPIO_DRV, 32, 0, 9, 2),=09=09/* PWRAP */
+=09PINS_FIELD_BASE(143, 145, 4, GPIO_DRV, 32, 0, 13, 2),=09=09/* AUD */
+=09PINS_FIELD_BASE(146, 147, 4, GPIO_DRV, 32, 0, 17, 2),=09=09/* LCM_RST, =
DSI_TE */
+=09PINS_FIELD_BASE(148, 148, 4, GPIO_DRV, 32, 0, 21, 2),=09=09/* SRCLKENA0=
 */
+=09PINS_FIELD_BASE(149, 149, 4, GPIO_DRV, 32, 0, 5, 2),=09=09/* WATCHDOG *=
/
+=09PINS_FIELD_BASE(160, 162, 5, GPIO_DRV, 32, 0, 1, 2),=09=09/* SIM2 */
+=09PINS_FIELD_BASE(163, 165, 5, GPIO_DRV, 32, 0, 5, 2),=09=09/* SIM1 */
+=09PINS_FIELD_BASE(166, 166, 5, GPIO_DRV, 32, 0, 9, 3),=09=09/* MSDC1_CMD =
*/
+=09PINS_FIELD_BASE(167, 167, 5, GPIO_DRV, 32, 0, 12, 3),=09=09/* MSDC1_CLK=
 */
+=09PINS_FIELD_BASE(168, 171, 5, GPIO_DRV, 32, 0, 16, 3),=09=09/* MSDC1_DAT=
 */
+=09PINS_FIELD_BASE(172, 172, 6, GPIO_DRV, 32, 0, 0, 3),=09=09/* MSDC0_CMD =
*/
+=09PINS_FIELD_BASE(173, 173, 6, GPIO_DRV, 32, 0, 4, 3),=09=09/* MSDC0_DSL =
*/
+=09PINS_FIELD_BASE(174, 174, 6, GPIO_DRV, 32, 0, 8, 3),=09=09/* MSDC0_CLK =
*/
+=09PINS_FIELD_BASE(175, 182, 6, GPIO_DRV, 32, 0, 12, 3),=09=09/* MSDC0_DAT=
 */
+=09PINS_FIELD_BASE(183, 183, 6, GPIO_DRV, 32, 0, 16, 3),=09=09/* MSDC0_RST=
B */
+=09PINS_FIELD_BASE(184, 185, 6, GPIO_DRV, 32, 0, 21, 2),=09=09/* FM */
+=09PINS_FIELD_BASE(186, 189, 6, GPIO_DRV, 32, 0, 25, 2),=09=09/* WB SPI */
+=09PINS_FIELD_BASE(198, 198, 1, GPIO_DRV, 32, 0, 8, 3),=09=09/* MSDC2_CMD =
*/
+=09PINS_FIELD_BASE(199, 199, 1, GPIO_DRV, 32, 0, 12, 3),=09=09/* MSDC2_CLK=
 */
+=09PINS_FIELD_BASE(200, 203, 1, GPIO_DRV, 32, 0, 16, 3)=09=09/* MSDC2_DAT =
*/
+};
+
+static const struct mtk_pin_field_calc mt6735_pin_r0_range[] =3D {
+=09PINS_FIELD_BASE(45, 45, 2, GPIO_PUPD, 32, 0, 0, 1),=09=09/* CMMCLK0 */
+=09PINS_FIELD_BASE(46, 46, 2, GPIO_PUPD, 32, 0, 4, 1),=09=09/* CMMCLK1 */
+=09PINS_FIELD_BASE(81, 81, 3, GPIO_PUPD, 32, 0, 0, 1),=09=09/* KPROW0 */
+=09PINS_FIELD_BASE(82, 82, 3, GPIO_PUPD, 32, 0, 4, 1),=09=09/* KPROW1 */
+=09PINS_FIELD_BASE(83, 83, 3, GPIO_PUPD, 32, 0, 8, 1),=09=09/* KPROW2 */
+=09PINS_FIELD_BASE(84, 84, 3, GPIO_PUPD, 32, 0, 16, 1),=09=09/* KPCOL0 */
+=09PINS_FIELD_BASE(85, 85, 3, GPIO_PUPD, 32, 0, 20, 1),=09=09/* KPCOL1 */
+=09PINS_FIELD_BASE(86, 86, 3, GPIO_PUPD, 32, 0, 24, 1),=09=09/* KPCOL2 */
+=09PINS_FIELD_BASE(160, 160, 5, GPIO_PUPD, 32, 0x10, 32, 1),=09/* SIM2_SCL=
K */
+=09PINS_FIELD_BASE(161, 161, 5, GPIO_PUPD, 32, 0x10, 36, 1),=09/* SIM2_SRS=
T */
+=09PINS_FIELD_BASE(162, 162, 5, GPIO_PUPD, 32, 0x10, 44, 1),=09/* SIM2_SDA=
T */
+=09PINS_FIELD_BASE(163, 163, 5, GPIO_PUPD, 32, 0x10, 48, 1),=09/* SIM1_SCL=
K */
+=09PINS_FIELD_BASE(164, 164, 5, GPIO_PUPD, 32, 0x10, 52, 1),=09/* SIM1_SRS=
T */
+=09PINS_FIELD_BASE(165, 165, 5, GPIO_PUPD, 32, 0x10, 56, 1),=09/* SIM1_SDA=
T */
+=09PINS_FIELD_BASE(166, 166, 5, GPIO_PUPD, 32, 0x10, 0, 1),=09/* MSDC1_CMD=
 */
+=09PINS_FIELD_BASE(167, 167, 5, GPIO_PUPD, 32, 0x10, 4, 1),=09/* MSDC1_CLK=
 */
+=09PINS_FIELD_BASE(168, 168, 5, GPIO_PUPD, 32, 0x10, 8, 1),=09/* MSDC1_DAT=
0 */
+=09PINS_FIELD_BASE(169, 169, 5, GPIO_PUPD, 32, 0x10, 12, 1),=09/* MSDC1_DA=
T1 */
+=09PINS_FIELD_BASE(170, 170, 5, GPIO_PUPD, 32, 0x10, 16, 1),=09/* MSDC1_DA=
T2 */
+=09PINS_FIELD_BASE(171, 171, 5, GPIO_PUPD, 32, 0x10, 20, 1),=09/* MSDC1_DA=
T3 */
+=09PINS_FIELD_BASE(172, 172, 6, GPIO_PUPD, 32, 0x10, 0, 1),=09/* MSDC0_CMD=
 */
+=09PINS_FIELD_BASE(173, 173, 6, GPIO_PUPD, 32, 0x10, 8, 1),=09/* MSDC0_DSL=
 */
+=09PINS_FIELD_BASE(174, 174, 6, GPIO_PUPD, 32, 0x10, 4, 1),=09/* MSDC0_CLK=
 */
+=09PINS_FIELD_BASE(175, 175, 6, GPIO_PUPD, 32, 0x10, 12, 1),=09/* MSDC0_DA=
T0 */
+=09PINS_FIELD_BASE(176, 176, 6, GPIO_PUPD, 32, 0x10, 16, 1),=09/* MSDC0_DA=
T1 */
+=09PINS_FIELD_BASE(177, 177, 6, GPIO_PUPD, 32, 0x10, 20, 1),=09/* MSDC0_DA=
T2 */
+=09PINS_FIELD_BASE(178, 178, 6, GPIO_PUPD, 32, 0x10, 24, 1),=09/* MSDC0_DA=
T3 */
+=09PINS_FIELD_BASE(179, 179, 6, GPIO_PUPD, 32, 0x10, 28, 1),=09/* MSDC0_DA=
T4 */
+=09PINS_FIELD_BASE(180, 180, 6, GPIO_PUPD, 32, 0x10, 32, 1),=09/* MSDC0_DA=
T5 */
+=09PINS_FIELD_BASE(181, 181, 6, GPIO_PUPD, 32, 0x10, 36, 1),=09/* MSDC0_DA=
T6 */
+=09PINS_FIELD_BASE(182, 182, 6, GPIO_PUPD, 32, 0x10, 40, 1),=09/* MSDC0_DA=
T7 */
+=09PINS_FIELD_BASE(183, 183, 6, GPIO_PUPD, 32, 0x10, 44, 1),=09/* MSDC0_RS=
TB */
+=09PINS_FIELD_BASE(198, 198, 1, GPIO_PUPD, 32, 0, 0, 1),=09=09/* MSDC2_CMD=
 */
+=09PINS_FIELD_BASE(199, 199, 1, GPIO_PUPD, 32, 0, 4, 1),=09=09/* MSDC2_CLK=
 */
+=09PINS_FIELD_BASE(200, 200, 1, GPIO_PUPD, 32, 0, 8, 1),=09=09/* MSDC2_DAT=
0 */
+=09PINS_FIELD_BASE(201, 201, 1, GPIO_PUPD, 32, 0, 12, 1),=09=09/* MSDC2_DA=
T1 */
+=09PINS_FIELD_BASE(202, 202, 1, GPIO_PUPD, 32, 0, 16, 1),=09=09/* MSDC2_DA=
T2 */
+=09PINS_FIELD_BASE(203, 203, 1, GPIO_PUPD, 32, 0, 20, 1)=09=09/* MSDC2_DAT=
3 */
+};
+
+static const struct mtk_pin_field_calc mt6735_pin_r1_range[] =3D {
+=09PINS_FIELD_BASE(45, 45, 2, GPIO_PUPD, 32, 0, 1, 1),=09=09/* CMMCLK0 */
+=09PINS_FIELD_BASE(46, 46, 2, GPIO_PUPD, 32, 0, 5, 1),=09=09/* CMMCLK1 */
+=09PINS_FIELD_BASE(81, 81, 3, GPIO_PUPD, 32, 0, 1, 1),=09=09/* KPROW0 */
+=09PINS_FIELD_BASE(82, 82, 3, GPIO_PUPD, 32, 0, 5, 1),=09=09/* KPROW1 */
+=09PINS_FIELD_BASE(83, 83, 3, GPIO_PUPD, 32, 0, 9, 1),=09=09/* KPROW2 */
+=09PINS_FIELD_BASE(84, 84, 3, GPIO_PUPD, 32, 0, 17, 1),=09=09/* KPCOL0 */
+=09PINS_FIELD_BASE(85, 85, 3, GPIO_PUPD, 32, 0, 21, 1),=09=09/* KPCOL1 */
+=09PINS_FIELD_BASE(86, 86, 3, GPIO_PUPD, 32, 0, 25, 1),=09=09/* KPCOL2 */
+=09PINS_FIELD_BASE(160, 160, 5, GPIO_PUPD, 32, 0x10, 33, 1),=09/* SIM2_SCL=
K */
+=09PINS_FIELD_BASE(161, 161, 5, GPIO_PUPD, 32, 0x10, 37, 1),=09/* SIM2_SRS=
T */
+=09PINS_FIELD_BASE(162, 162, 5, GPIO_PUPD, 32, 0x10, 45, 1),=09/* SIM2_SDA=
T */
+=09PINS_FIELD_BASE(163, 163, 5, GPIO_PUPD, 32, 0x10, 49, 1),=09/* SIM1_SCL=
K */
+=09PINS_FIELD_BASE(164, 164, 5, GPIO_PUPD, 32, 0x10, 53, 1),=09/* SIM1_SRS=
T */
+=09PINS_FIELD_BASE(165, 165, 5, GPIO_PUPD, 32, 0x10, 57, 1),=09/* SIM1_SDA=
T */
+=09PINS_FIELD_BASE(166, 166, 5, GPIO_PUPD, 32, 0x10, 1, 1),=09/* MSDC1_CMD=
 */
+=09PINS_FIELD_BASE(167, 167, 5, GPIO_PUPD, 32, 0x10, 5, 1),=09/* MSDC1_CLK=
 */
+=09PINS_FIELD_BASE(168, 168, 5, GPIO_PUPD, 32, 0x10, 9, 1),=09/* MSDC1_DAT=
0 */
+=09PINS_FIELD_BASE(169, 169, 5, GPIO_PUPD, 32, 0x10, 13, 1),=09/* MSDC1_DA=
T1 */
+=09PINS_FIELD_BASE(170, 170, 5, GPIO_PUPD, 32, 0x10, 17, 1),=09/* MSDC1_DA=
T2 */
+=09PINS_FIELD_BASE(171, 171, 5, GPIO_PUPD, 32, 0x10, 21, 1),=09/* MSDC1_DA=
T3 */
+=09PINS_FIELD_BASE(172, 172, 6, GPIO_PUPD, 32, 0x10, 1, 1),=09/* MSDC0_CMD=
 */
+=09PINS_FIELD_BASE(173, 173, 6, GPIO_PUPD, 32, 0x10, 9, 1),=09/* MSDC0_DSL=
 */
+=09PINS_FIELD_BASE(174, 174, 6, GPIO_PUPD, 32, 0x10, 5, 1),=09/* MSDC0_CLK=
 */
+=09PINS_FIELD_BASE(175, 175, 6, GPIO_PUPD, 32, 0x10, 13, 1),=09/* MSDC0_DA=
T0 */
+=09PINS_FIELD_BASE(176, 176, 6, GPIO_PUPD, 32, 0x10, 17, 1),=09/* MSDC0_DA=
T1 */
+=09PINS_FIELD_BASE(177, 177, 6, GPIO_PUPD, 32, 0x10, 21, 1),=09/* MSDC0_DA=
T2 */
+=09PINS_FIELD_BASE(178, 178, 6, GPIO_PUPD, 32, 0x10, 25, 1),=09/* MSDC0_DA=
T3 */
+=09PINS_FIELD_BASE(179, 179, 6, GPIO_PUPD, 32, 0x10, 29, 1),=09/* MSDC0_DA=
T4 */
+=09PINS_FIELD_BASE(180, 180, 6, GPIO_PUPD, 32, 0x10, 33, 1),=09/* MSDC0_DA=
T5 */
+=09PINS_FIELD_BASE(181, 181, 6, GPIO_PUPD, 32, 0x10, 37, 1),=09/* MSDC0_DA=
T6 */
+=09PINS_FIELD_BASE(182, 182, 6, GPIO_PUPD, 32, 0x10, 41, 1),=09/* MSDC0_DA=
T7 */
+=09PINS_FIELD_BASE(183, 183, 6, GPIO_PUPD, 32, 0x10, 45, 1),=09/* MSDC0_RS=
TB */
+=09PINS_FIELD_BASE(198, 198, 1, GPIO_PUPD, 32, 0, 1, 1),=09=09/* MSDC2_CMD=
 */
+=09PINS_FIELD_BASE(199, 199, 1, GPIO_PUPD, 32, 0, 5, 1),=09=09/* MSDC2_CLK=
 */
+=09PINS_FIELD_BASE(200, 200, 1, GPIO_PUPD, 32, 0, 9, 1),=09=09/* MSDC2_DAT=
0 */
+=09PINS_FIELD_BASE(201, 201, 1, GPIO_PUPD, 32, 0, 13, 1),=09=09/* MSDC2_DA=
T1 */
+=09PINS_FIELD_BASE(202, 202, 1, GPIO_PUPD, 32, 0, 17, 1),=09=09/* MSDC2_DA=
T2 */
+=09PINS_FIELD_BASE(203, 203, 1, GPIO_PUPD, 32, 0, 21, 1)=09=09/* MSDC2_DAT=
3 */
+};
+
+static const struct mtk_pin_field_calc mt6735_pin_pupd_range[] =3D {
+=09PINS_FIELD_BASE(45, 45, 2, GPIO_PUPD, 32, 0, 2, 1),=09=09/* CMMCLK0 */
+=09PINS_FIELD_BASE(46, 46, 2, GPIO_PUPD, 32, 0, 6, 1),=09=09/* CMMCLK1 */
+=09PINS_FIELD_BASE(81, 81, 3, GPIO_PUPD, 32, 0, 2, 1),=09=09/* KPROW0 */
+=09PINS_FIELD_BASE(82, 82, 3, GPIO_PUPD, 32, 0, 6, 1),=09=09/* KPROW1 */
+=09PINS_FIELD_BASE(83, 83, 3, GPIO_PUPD, 32, 0, 10, 1),=09=09/* KPROW2 */
+=09PINS_FIELD_BASE(84, 84, 3, GPIO_PUPD, 32, 0, 18, 1),=09=09/* KPCOL0 */
+=09PINS_FIELD_BASE(85, 85, 3, GPIO_PUPD, 32, 0, 22, 1),=09=09/* KPCOL1 */
+=09PINS_FIELD_BASE(86, 86, 3, GPIO_PUPD, 32, 0, 26, 1),=09=09/* KPCOL2 */
+=09PINS_FIELD_BASE(160, 160, 5, GPIO_PUPD, 32, 0x10, 34, 1),=09/* SIM2_SCL=
K */
+=09PINS_FIELD_BASE(161, 161, 5, GPIO_PUPD, 32, 0x10, 38, 1),=09/* SIM2_SRS=
T */
+=09PINS_FIELD_BASE(162, 162, 5, GPIO_PUPD, 32, 0x10, 46, 1),=09/* SIM2_SDA=
T */
+=09PINS_FIELD_BASE(163, 163, 5, GPIO_PUPD, 32, 0x10, 50, 1),=09/* SIM1_SCL=
K */
+=09PINS_FIELD_BASE(164, 164, 5, GPIO_PUPD, 32, 0x10, 54, 1),=09/* SIM1_SRS=
T */
+=09PINS_FIELD_BASE(165, 165, 5, GPIO_PUPD, 32, 0x10, 58, 1),=09/* SIM1_SDA=
T */
+=09PINS_FIELD_BASE(166, 166, 5, GPIO_PUPD, 32, 0x10, 2, 1),=09/* MSDC1_CMD=
 */
+=09PINS_FIELD_BASE(167, 167, 5, GPIO_PUPD, 32, 0x10, 6, 1),=09/* MSDC1_CLK=
 */
+=09PINS_FIELD_BASE(168, 168, 5, GPIO_PUPD, 32, 0x10, 10, 1),=09/* MSDC1_DA=
T0 */
+=09PINS_FIELD_BASE(169, 169, 5, GPIO_PUPD, 32, 0x10, 14, 1),=09/* MSDC1_DA=
T1 */
+=09PINS_FIELD_BASE(170, 170, 5, GPIO_PUPD, 32, 0x10, 18, 1),=09/* MSDC1_DA=
T2 */
+=09PINS_FIELD_BASE(171, 171, 5, GPIO_PUPD, 32, 0x10, 22, 1),=09/* MSDC1_DA=
T3 */
+=09PINS_FIELD_BASE(172, 172, 6, GPIO_PUPD, 32, 0x10, 2, 1),=09/* MSDC0_CMD=
 */
+=09PINS_FIELD_BASE(173, 173, 6, GPIO_PUPD, 32, 0x10, 10, 1),=09/* MSDC0_DS=
L */
+=09PINS_FIELD_BASE(174, 174, 6, GPIO_PUPD, 32, 0x10, 6, 1),=09/* MSDC0_CLK=
 */
+=09PINS_FIELD_BASE(175, 175, 6, GPIO_PUPD, 32, 0x10, 14, 1),=09/* MSDC0_DA=
T0 */
+=09PINS_FIELD_BASE(176, 176, 6, GPIO_PUPD, 32, 0x10, 18, 1),=09/* MSDC0_DA=
T1 */
+=09PINS_FIELD_BASE(177, 177, 6, GPIO_PUPD, 32, 0x10, 22, 1),=09/* MSDC0_DA=
T2 */
+=09PINS_FIELD_BASE(178, 178, 6, GPIO_PUPD, 32, 0x10, 26, 1),=09/* MSDC0_DA=
T3 */
+=09PINS_FIELD_BASE(179, 179, 6, GPIO_PUPD, 32, 0x10, 30, 1),=09/* MSDC0_DA=
T4 */
+=09PINS_FIELD_BASE(180, 180, 6, GPIO_PUPD, 32, 0x10, 34, 1),=09/* MSDC0_DA=
T5 */
+=09PINS_FIELD_BASE(181, 181, 6, GPIO_PUPD, 32, 0x10, 38, 1),=09/* MSDC0_DA=
T6 */
+=09PINS_FIELD_BASE(182, 182, 6, GPIO_PUPD, 32, 0x10, 42, 1),=09/* MSDC0_DA=
T7 */
+=09PINS_FIELD_BASE(183, 183, 6, GPIO_PUPD, 32, 0x10, 46, 1),=09/* MSDC0_RS=
TB */
+=09PINS_FIELD_BASE(198, 198, 1, GPIO_PUPD, 32, 0, 2, 1),=09=09/* MSDC2_CMD=
 */
+=09PINS_FIELD_BASE(199, 199, 1, GPIO_PUPD, 32, 0, 6, 1),=09=09/* MSDC2_CLK=
 */
+=09PINS_FIELD_BASE(200, 200, 1, GPIO_PUPD, 32, 0, 10, 1),=09=09/* MSDC2_DA=
T0 */
+=09PINS_FIELD_BASE(201, 201, 1, GPIO_PUPD, 32, 0, 14, 1),=09=09/* MSDC2_DA=
T1 */
+=09PINS_FIELD_BASE(202, 202, 1, GPIO_PUPD, 32, 0, 18, 1),=09=09/* MSDC2_DA=
T2 */
+=09PINS_FIELD_BASE(203, 203, 1, GPIO_PUPD, 32, 0, 22, 1)=09=09/* MSDC2_DAT=
3 */
+};
+
+static const struct mtk_pin_field_calc mt6735_pin_pullen_range[] =3D {
+=09PIN_FIELD_BASE(0, 4, 2, GPIO_PULLEN, 32, 0, 23, 1),
+=09PIN_FIELD_BASE(5, 8, 3, GPIO_PULLEN, 32, 0x10, 9, 1),
+=09PIN_FIELD_BASE(9, 12, 3, GPIO_PULLEN, 32, 0x10, 20, 1),
+=09PIN_FIELD_BASE(13, 21, 1, GPIO_PULLEN, 32, 0, 0, 1),
+=09PIN_FIELD_BASE(42, 44, 2, GPIO_PULLEN, 32, 0, 0, 1),
+=09PIN_FIELD_BASE(47, 64, 2, GPIO_PULLEN, 32, 0, 5, 1),
+=09PIN_FIELD_BASE(65, 73, 3, GPIO_PULLEN, 32, 0x10, 0, 1),
+=09PIN_FIELD_BASE(74, 80, 3, GPIO_PULLEN, 32, 0x10, 13, 1),
+=09PIN_FIELD_BASE(87, 114, 3, GPIO_PULLEN, 32, 0x10, 30, 1),
+=09PIN_FIELD_BASE(118, 149, 4, GPIO_PULLEN, 32, 0, 0, 1),
+=09PIN_FIELD_BASE(184, 189, 6, GPIO_PULLEN, 32, 0x10, 12, 1)
+};
+
+static const struct mtk_pin_field_calc mt6735_pin_pullsel_range[] =3D {
+=09PIN_FIELD_BASE(0, 4, 2, GPIO_PULLSEL, 32, 0, 23, 1),
+=09PIN_FIELD_BASE(5, 8, 3, GPIO_PULLSEL, 32, 0x10, 9, 1),
+=09PIN_FIELD_BASE(9, 12, 3, GPIO_PULLSEL, 32, 0x10, 20, 1),
+=09PIN_FIELD_BASE(13, 21, 1, GPIO_PULLSEL, 32, 0, 0, 1),
+=09PIN_FIELD_BASE(42, 44, 2, GPIO_PULLSEL, 32, 0, 0, 1),
+=09PIN_FIELD_BASE(47, 64, 2, GPIO_PULLSEL, 32, 0, 5, 1),
+=09PIN_FIELD_BASE(65, 73, 3, GPIO_PULLSEL, 32, 0x10, 0, 1),
+=09PIN_FIELD_BASE(74, 80, 3, GPIO_PULLSEL, 32, 0x10, 13, 1),
+=09PIN_FIELD_BASE(87, 114, 3, GPIO_PULLSEL, 32, 0x10, 30, 1),
+=09PIN_FIELD_BASE(118, 149, 4, GPIO_PULLSEL, 32, 0, 0, 1),
+=09PIN_FIELD_BASE(184, 189, 6, GPIO_PULLSEL, 32, 0x10, 12, 1)
+};
+
+static const struct mtk_pin_reg_calc mt6735_reg_cals[] =3D {
+=09[PINCTRL_PIN_REG_DIR] =3D MTK_RANGE(mt6735_pin_dir_range),
+=09[PINCTRL_PIN_REG_DI] =3D MTK_RANGE(mt6735_pin_di_range),
+=09[PINCTRL_PIN_REG_DO] =3D MTK_RANGE(mt6735_pin_do_range),
+=09[PINCTRL_PIN_REG_MODE] =3D MTK_RANGE(mt6735_pin_mode_range),
+=09[PINCTRL_PIN_REG_SMT] =3D MTK_RANGE(mt6735_pin_smt_range),
+=09[PINCTRL_PIN_REG_IES] =3D MTK_RANGE(mt6735_pin_ies_range),
+=09[PINCTRL_PIN_REG_TDSEL] =3D MTK_RANGE(mt6735_pin_tdsel_range),
+=09[PINCTRL_PIN_REG_RDSEL] =3D MTK_RANGE(mt6735_pin_rdsel_range),
+=09[PINCTRL_PIN_REG_DRV] =3D MTK_RANGE(mt6735_pin_drv_range),
+=09[PINCTRL_PIN_REG_R0] =3D MTK_RANGE(mt6735_pin_r0_range),
+=09[PINCTRL_PIN_REG_R1] =3D MTK_RANGE(mt6735_pin_r1_range),
+=09[PINCTRL_PIN_REG_PUPD] =3D MTK_RANGE(mt6735_pin_pupd_range),
+=09[PINCTRL_PIN_REG_PULLEN] =3D MTK_RANGE(mt6735_pin_pullen_range),
+=09[PINCTRL_PIN_REG_PULLSEL] =3D MTK_RANGE(mt6735_pin_pullsel_range),
+};
+
+static const struct mtk_pin_field_calc mt6735m_pin_dir_range[] =3D {
+=09PIN_FIELD(0, 197, GPIO_DIR, 0x10, 0, 1)
+};
+
+static const struct mtk_pin_field_calc mt6735m_pin_di_range[] =3D {
+=09PIN_FIELD(0, 197, GPIO_DIN, 0x10, 0, 1)
+};
+
+static const struct mtk_pin_field_calc mt6735m_pin_do_range[] =3D {
+=09PIN_FIELD(0, 197, GPIO_DOUT, 0x10, 0, 1)
+};
+
+static const struct mtk_pin_field_calc mt6735m_pin_mode_range[] =3D {
+=09PIN_FIELD(0, 4, GPIO_MODE1, 0, 0, 3),
+=09PIN_FIELD(5, 9, GPIO_MODE1, 0, 16, 3),
+=09PIN_FIELD(10, 14, GPIO_MODE2, 0, 0, 3),
+=09PIN_FIELD(15, 19, GPIO_MODE2, 0, 16, 3),
+=09PIN_FIELD(20, 24, GPIO_MODE3, 0, 0, 3),
+=09PIN_FIELD(25, 29, GPIO_MODE3, 0, 16, 3),
+=09PIN_FIELD(30, 34, GPIO_MODE4, 0, 0, 3),
+=09PIN_FIELD(35, 39, GPIO_MODE4, 0, 16, 3),
+=09PIN_FIELD(40, 44, GPIO_MODE5, 0, 0, 3),
+=09PIN_FIELD(45, 49, GPIO_MODE5, 0, 16, 3),
+=09PIN_FIELD(50, 54, GPIO_MODE6, 0, 0, 3),
+=09PIN_FIELD(55, 59, GPIO_MODE6, 0, 16, 3),
+=09PIN_FIELD(60, 64, GPIO_MODE7, 0, 0, 3),
+=09PIN_FIELD(65, 69, GPIO_MODE7, 0, 16, 3),
+=09PIN_FIELD(70, 74, GPIO_MODE8, 0, 0, 3),
+=09PIN_FIELD(75, 79, GPIO_MODE8, 0, 16, 3),
+=09PIN_FIELD(80, 84, GPIO_MODE9, 0, 0, 3),
+=09PIN_FIELD(85, 89, GPIO_MODE9, 0, 16, 3),
+=09PIN_FIELD(90, 94, GPIO_MODE10, 0, 0, 3),
+=09PIN_FIELD(95, 99, GPIO_MODE10, 0, 16, 3),
+=09PIN_FIELD(100, 104, GPIO_MODE11, 0, 0, 3),
+=09PIN_FIELD(105, 109, GPIO_MODE11, 0, 16, 3),
+=09PIN_FIELD(110, 114, GPIO_MODE12, 0, 0, 3),
+=09PIN_FIELD(115, 119, GPIO_MODE12, 0, 16, 3),
+=09PIN_FIELD(120, 124, GPIO_MODE13, 0, 0, 3),
+=09PIN_FIELD(125, 129, GPIO_MODE13, 0, 16, 3),
+=09PIN_FIELD(130, 134, GPIO_MODE14, 0, 0, 3),
+=09PIN_FIELD(135, 139, GPIO_MODE14, 0, 16, 3),
+=09PIN_FIELD(140, 144, GPIO_MODE15, 0, 0, 3),
+=09PIN_FIELD(145, 149, GPIO_MODE15, 0, 16, 3),
+=09PIN_FIELD(150, 154, GPIO_MODE16, 0, 0, 3),
+=09PIN_FIELD(155, 159, GPIO_MODE16, 0, 16, 3),
+=09PIN_FIELD(160, 164, GPIO_MODE17, 0, 0, 3),
+=09PIN_FIELD(165, 169, GPIO_MODE17, 0, 16, 3),
+=09PIN_FIELD(170, 174, GPIO_MODE18, 0, 0, 3),
+=09PIN_FIELD(175, 179, GPIO_MODE18, 0, 16, 3),
+=09PIN_FIELD(180, 184, GPIO_MODE19, 0, 0, 3),
+=09PIN_FIELD(185, 189, GPIO_MODE19, 0, 16, 3),
+=09PIN_FIELD(190, 194, GPIO_MODE20, 0, 0, 3),
+=09PIN_FIELD(195, 197, GPIO_MODE20, 0, 16, 3),
+};
+
+/*
+ * Rather than redefining all tables for MT6735M just to remove the 6 MSDC=
2
+ * pins at the end, reuse the MT6735 tables and exclude the MSDC2 pin fiel=
ds
+ * by subtracting their count from the array size when possible
+ */
+static const struct mtk_pin_reg_calc mt6735m_reg_cals[] =3D {
+=09[PINCTRL_PIN_REG_DIR] =3D MTK_RANGE(mt6735m_pin_dir_range),
+=09[PINCTRL_PIN_REG_DI] =3D MTK_RANGE(mt6735m_pin_di_range),
+=09[PINCTRL_PIN_REG_DO] =3D MTK_RANGE(mt6735m_pin_do_range),
+=09[PINCTRL_PIN_REG_MODE] =3D MTK_RANGE(mt6735m_pin_mode_range),
+=09[PINCTRL_PIN_REG_SMT] =3D { mt6735_pin_smt_range,
+=09=09ARRAY_SIZE(mt6735_pin_smt_range) - 3 },
+=09[PINCTRL_PIN_REG_IES] =3D { mt6735_pin_ies_range,
+=09=09ARRAY_SIZE(mt6735_pin_ies_range) - 3 },
+=09[PINCTRL_PIN_REG_TDSEL] =3D { mt6735_pin_tdsel_range,
+=09=09ARRAY_SIZE(mt6735_pin_tdsel_range) - 3 },
+=09[PINCTRL_PIN_REG_RDSEL] =3D { mt6735_pin_rdsel_range,
+=09=09ARRAY_SIZE(mt6735_pin_rdsel_range) - 3 },
+=09[PINCTRL_PIN_REG_DRV] =3D { mt6735_pin_drv_range,
+=09=09ARRAY_SIZE(mt6735_pin_drv_range) - 3 },
+=09[PINCTRL_PIN_REG_R0] =3D { mt6735_pin_r0_range,
+=09=09ARRAY_SIZE(mt6735_pin_r0_range) - 6 },
+=09[PINCTRL_PIN_REG_R1] =3D { mt6735_pin_r1_range,
+=09=09ARRAY_SIZE(mt6735_pin_r1_range) - 6 },
+=09[PINCTRL_PIN_REG_PUPD] =3D { mt6735_pin_pupd_range,
+=09=09ARRAY_SIZE(mt6735_pin_pupd_range) - 6 },
+=09[PINCTRL_PIN_REG_PULLEN] =3D MTK_RANGE(mt6735_pin_pullen_range),
+=09[PINCTRL_PIN_REG_PULLSEL] =3D MTK_RANGE(mt6735_pin_pullsel_range),
+};
+
+static const unsigned int mt6735_pull_type[] =3D {
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*   0 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*   1 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*   2 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*   3 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*   4 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*   5 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*   6 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*   7 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*   8 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*   9 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  10 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  11 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  12 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  13 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  14 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  15 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  16 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  17 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  18 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  19 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  20 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  21 */
+=09/* MIPI CSI pins have no configurable pull resistors */
+=090,=09=09=09=09/*  22 RDN0 */
+=090,=09=09=09=09/*  23 RDP0 */
+=090,=09=09=09=09/*  24 RDN1 */
+=090,=09=09=09=09/*  25 RDP1 */
+=090,=09=09=09=09/*  26 RCN */
+=090,=09=09=09=09/*  27 RCP */
+=090,=09=09=09=09/*  28 RDN2 */
+=090,=09=09=09=09/*  29 RDP2 */
+=090,=09=09=09=09/*  30 RDN3 */
+=090,=09=09=09=09/*  31 RDP3 */
+=090,=09=09=09=09/*  32 RDN0_A */
+=090,=09=09=09=09/*  33 RDP0_A */
+=090,=09=09=09=09/*  34 RDN1_A */
+=090,=09=09=09=09/*  35 RDP1_A */
+=090,=09=09=09=09/*  36 RCN_A */
+=090,=09=09=09=09/*  37 RCP_A */
+=090,=09=09=09=09/*  38 RDN2_A */
+=090,=09=09=09=09/*  39 RDP2_A */
+=090,=09=09=09=09/*  40 RDN3_A */
+=090,=09=09=09=09/*  41 RDP3_A */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  42 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  43 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  44 */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/*  45 CMMCLK0 */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/*  46 CMMCLK1 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  47 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  48 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  49 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  50 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  51 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  52 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  53 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  54 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  55 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  56 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  57 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  58 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  60 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  61 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  62 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  63 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  64 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  65 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  66 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  67 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  68 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  69 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  70 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  71 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  72 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  73 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  74 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  75 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  76 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  77 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  78 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  79 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  80 */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/*  81 KROW0 */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/*  82 KROW1 */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/*  83 KROW2 */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/*  84 KCOL0 */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/*  85 KCOL1 */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/*  86 KCOL2 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  87 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  88 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  89 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  90 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  91 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  92 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  93 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  94 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  95 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  96 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  97 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  98 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/*  99 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 100 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 101 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 102 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 103 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 104 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 105 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 106 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 107 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 108 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 109 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 110 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 111 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 112 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 113 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 114 */
+=09/* Configuration for AUXADC pins is set by APMIXEDSYS */
+=090,=09=09=09=09/* 115 AUXIN0 */
+=090,=09=09=09=09/* 116 AUXIN1 */
+=090,=09=09=09=09/* 117 AUXIN2 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 118 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 119 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 120 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 121 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 122 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 123 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 124 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 125 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 126 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 127 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 128 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 129 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 130 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 131 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 132 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 133 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 134 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 135 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 136 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 137 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 138 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 139 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 140 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 141 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 142 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 143 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 144 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 145 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 146 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 147 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 148 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 149 */
+=09/* MIPI DSI pins have no configurable pull resistors */
+=090,=09=09=09=09/* 150 TDP0 */
+=090,=09=09=09=09/* 151 TDN0 */
+=090,=09=09=09=09/* 152 TDP1 */
+=090,=09=09=09=09/* 153 TDN1 */
+=090,=09=09=09=09/* 154 TCP */
+=090,=09=09=09=09/* 155 TCN */
+=090,=09=09=09=09/* 156 TDP2 */
+=090,=09=09=09=09/* 157 TDN2 */
+=090,=09=09=09=09/* 158 TDP3 */
+=090,=09=09=09=09/* 159 TDN3 */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 160 MD_SIM2_SCLK */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 161 MD_SIM2_SRST */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 162 MD_SIM2_SDAT */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 163 MD_SIM1_SCLK */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 164 MD_SIM1_SRST */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 165 MD_SIM1_SDAT */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 166 MSDC1_CMD */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 167 MSDC1_CLK */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 168 MSDC1_DAT0 */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 169 MSDC1_DAT1 */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 170 MSDC1_DAT2 */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 171 MSDC1_DAT3 */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 172 MSDC0_CMD */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 173 MSDC0_DSL */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 174 MSDC0_CLK */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 175 MSDC0_DAT0 */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 176 MSDC0_DAT1 */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 177 MSDC0_DAT2 */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 178 MSDC0_DAT3 */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 179 MSDC0_DAT4 */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 180 MSDC0_DAT5 */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 181 MSDC0_DAT6 */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 182 MSDC0_DAT7 */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 183 MSDC0_RSTB */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 184 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 185 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 186 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 187 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 188 */
+=09MTK_PULL_PULLSEL_TYPE,=09=09/* 189 */
+=09/*
+=09 * GPS/WIFI/BT pins have no pull resistors configurable by the GPIO
+=09 * controller. They might be configured by CONSYS but we can't know
+=09 * for sure due to lack of documentation.
+=09 */
+=090,=09=09=09=09/* 190 GPS_RXQN */
+=090,=09=09=09=09/* 191 GPS_RXQP */
+=090,=09=09=09=09/* 192 GPS_RXIN */
+=090,=09=09=09=09/* 193 GPS_RXIP */
+=090,=09=09=09=09/* 194 WB_RXQN */
+=090,=09=09=09=09/* 195 WB_RXQP */
+=090,=09=09=09=09/* 196 WB_RXIN */
+=090,=09=09=09=09/* 197 WB_RXIP */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 198 MSDC2_CMD */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 199 MSDC2_CLK */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 200 MSDC2_DAT0 */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 201 MSDC2_DAT1 */
+=09MTK_PULL_PUPD_R1R0_TYPE,=09/* 202 MSDC2_DAT2 */
+=09MTK_PULL_PUPD_R1R0_TYPE=09=09/* 203 MSDC2_DAT3 */
+};
+
+static const char * const mt6735_pinctrl_register_base_names[] =3D {
+=09"gpio", "iocfg0", "iocfg1", "iocfg2", "iocfg3", "iocfg4", "iocfg5"
+};
+
+static const struct mtk_eint_hw mt6735_eint_hw =3D {
+=09.port_mask =3D 7,
+=09.ports     =3D 6,
+=09.ap_num    =3D 224,
+=09.db_cnt    =3D 16,
+=09.db_time   =3D debounce_time_mt6765,
+};
+
+static const struct mtk_pin_soc mt6735_data =3D {
+=09.reg_cal =3D mt6735_reg_cals,
+=09.pins =3D mtk_pins_mt6735,
+=09.npins =3D ARRAY_SIZE(mtk_pins_mt6735),
+=09.ngrps =3D ARRAY_SIZE(mtk_pins_mt6735),
+=09.eint_hw =3D &mt6735_eint_hw,
+=09.gpio_m =3D 0,
+=09.ies_present =3D true,
+=09.base_names =3D mt6735_pinctrl_register_base_names,
+=09.nbase_names =3D ARRAY_SIZE(mt6735_pinctrl_register_base_names),
+=09.pull_type =3D mt6735_pull_type,
+=09.bias_set_combo =3D mtk_pinconf_bias_set_combo,
+=09.bias_get_combo =3D mtk_pinconf_bias_get_combo,
+=09.drive_set =3D mtk_pinconf_drive_set_rev1,
+=09.drive_get =3D mtk_pinconf_drive_get_rev1,
+=09.adv_pull_get =3D mtk_pinconf_adv_pull_get,
+=09.adv_pull_set =3D mtk_pinconf_adv_pull_set,
+};
+
+static const struct mtk_pin_soc mt6735m_data =3D {
+=09.reg_cal =3D mt6735m_reg_cals,
+=09.pins =3D mtk_pins_mt6735m,
+=09.npins =3D ARRAY_SIZE(mtk_pins_mt6735m),
+=09.ngrps =3D ARRAY_SIZE(mtk_pins_mt6735m),
+=09.eint_hw =3D &mt6735_eint_hw,
+=09.gpio_m =3D 0,
+=09.ies_present =3D true,
+=09.base_names =3D mt6735_pinctrl_register_base_names,
+=09.nbase_names =3D ARRAY_SIZE(mt6735_pinctrl_register_base_names),
+=09.bias_set_combo =3D mtk_pinconf_bias_set_combo,
+=09.bias_get_combo =3D mtk_pinconf_bias_get_combo,
+=09.drive_set =3D mtk_pinconf_drive_set_rev1,
+=09.drive_get =3D mtk_pinconf_drive_get_rev1,
+=09.adv_pull_get =3D mtk_pinconf_adv_pull_get,
+=09.adv_pull_set =3D mtk_pinconf_adv_pull_set,
+};
+
+static const struct of_device_id mt6735_pinctrl_match[] =3D {
+=09{ .compatible =3D "mediatek,mt6735-pinctrl", .data =3D &mt6735_data },
+=09{ .compatible =3D "mediatek,mt6735m-pinctrl", .data =3D &mt6735m_data }=
,
+=09{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mt6735_pinctrl_match);
+
+static struct platform_driver mt6735_pinctrl_driver =3D {
+=09.probe =3D mtk_paris_pinctrl_probe,
+=09.driver =3D {
+=09=09.name =3D "mt6735-pinctrl",
+=09=09.of_match_table =3D mt6735_pinctrl_match,
+=09=09.pm =3D &mtk_paris_pinctrl_pm_ops,
+=09},
+};
+module_platform_driver(mt6735_pinctrl_driver);
+
+MODULE_AUTHOR("Yassine Oudjana <y.oudjana@protonmail.com>");
+MODULE_DESCRIPTION("MediaTek MT6735 pinctrl driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h b/drivers/pinctr=
l/mediatek/pinctrl-mtk-mt6735.h
new file mode 100644
index 0000000000000..6662dadb5b1bb
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h
@@ -0,0 +1,3993 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022 Yassine Oudjana <y.oudjana@protonmail.com>
+ */
+
+#ifndef __PINCTRL_MTK_MT6735_H
+#define __PINCTRL_MTK_MT6735_H
+
+#include "pinctrl-paris.h"
+
+static const struct mtk_pin_desc mtk_pins_mt6735[] =3D {
+=09MTK_PIN(
+=09=090, "GPIO0",
+=09=09MTK_EINT_FUNCTION(0, 0),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO0"),
+=09=09MTK_FUNCTION(1, "IDDIG"),
+=09=09MTK_FUNCTION(2, "DPI_D4"),
+=09=09MTK_FUNCTION(3, "CLKM4"),
+=09=09MTK_FUNCTION(4, "EXT_FRAME_SYNC"),
+=09=09MTK_FUNCTION(5, "PWM3"),
+=09=09MTK_FUNCTION(6, "KCOL2"),
+=09=09MTK_FUNCTION(7, "C2K_ARM_EINT0")
+=09),
+=09MTK_PIN(
+=09=091, "GPIO1",
+=09=09MTK_EINT_FUNCTION(0, 1),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO1"),
+=09=09MTK_FUNCTION(1, "PWM2"),
+=09=09MTK_FUNCTION(2, "DPI_D5"),
+=09=09MTK_FUNCTION(3, "MD_EINT0"),
+=09=09MTK_FUNCTION(4, "TDD_TDO"),
+=09=09MTK_FUNCTION(5, "CONN_MCU_TDO"),
+=09=09MTK_FUNCTION(6, "PTA_RXD"),
+=09=09MTK_FUNCTION(7, "C2K_ARM_EINT1")
+=09),
+=09MTK_PIN(
+=09=092, "GPIO2",
+=09=09MTK_EINT_FUNCTION(0, 2),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO2"),
+=09=09MTK_FUNCTION(1, "CLKM0"),
+=09=09MTK_FUNCTION(2, "DPI_D6"),
+=09=09MTK_FUNCTION(3, "MD_EINT0"),
+=09=09MTK_FUNCTION(4, "USB_DRVVBUS"),
+=09=09MTK_FUNCTION(5, "CONN_MCU_DBGACK_N"),
+=09=09MTK_FUNCTION(6, "PTA_TXD"),
+=09=09MTK_FUNCTION(7, "C2K_ARM_EINT2")
+=09),
+=09MTK_PIN(
+=09=093, "GPIO3",
+=09=09MTK_EINT_FUNCTION(0, 3),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO3"),
+=09=09MTK_FUNCTION(1, "CLKM1"),
+=09=09MTK_FUNCTION(2, "DPI_D7"),
+=09=09MTK_FUNCTION(3, "SPI_MIB"),
+=09=09MTK_FUNCTION(4, "MD_EINT0"),
+=09=09MTK_FUNCTION(5, "CONN_MCU_DBGI_N"),
+=09=09MTK_FUNCTION(6, "CONN_MCU_AICE_TMSC"),
+=09=09MTK_FUNCTION(7, "C2K_ARM_EINT3")
+=09),
+=09MTK_PIN(
+=09=094, "GPIO4",
+=09=09MTK_EINT_FUNCTION(0, 4),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO4"),
+=09=09MTK_FUNCTION(1, "CLKM2"),
+=09=09MTK_FUNCTION(2, "DPI_D8"),
+=09=09MTK_FUNCTION(3, "SPI_MOB"),
+=09=09MTK_FUNCTION(4, "TDD_TCK"),
+=09=09MTK_FUNCTION(5, "CONN_MCU_TCK[0]"),
+=09=09MTK_FUNCTION(6, "CONN_MCU_AICE_TCKC"),
+=09=09MTK_FUNCTION(7, "C2K_DM_EINT0")
+=09),
+=09MTK_PIN(
+=09=095, "GPIO5",
+=09=09MTK_EINT_FUNCTION(0, 5),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO5"),
+=09=09MTK_FUNCTION(1, "UCTS2"),
+=09=09MTK_FUNCTION(2, "DPI_D9"),
+=09=09MTK_FUNCTION(3, "SPI_CSB"),
+=09=09MTK_FUNCTION(4, "TDD_TDI"),
+=09=09MTK_FUNCTION(5, "CONN_MCU_TDI"),
+=09=09MTK_FUNCTION(6, "I2S1_DO"),
+=09=09MTK_FUNCTION(7, "MD_URXD")
+=09),
+=09MTK_PIN(
+=09=096, "GPIO6",
+=09=09MTK_EINT_FUNCTION(0, 6),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO6"),
+=09=09MTK_FUNCTION(1, "URTS2"),
+=09=09MTK_FUNCTION(2, "DPI_D10"),
+=09=09MTK_FUNCTION(3, "SPI_CKB"),
+=09=09MTK_FUNCTION(4, "TDD_TRSTN"),
+=09=09MTK_FUNCTION(5, "CONN_MCU_TRST_B"),
+=09=09MTK_FUNCTION(6, "I2S1_LRCK"),
+=09=09MTK_FUNCTION(7, "MD_UTXD")
+=09),
+=09MTK_PIN(
+=09=097, "GPIO7",
+=09=09MTK_EINT_FUNCTION(0, 7),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO7"),
+=09=09MTK_FUNCTION(1, "UCTS3"),
+=09=09MTK_FUNCTION(2, "DPI_D11"),
+=09=09MTK_FUNCTION(3, "SDA1"),
+=09=09MTK_FUNCTION(4, "TDD_TMS"),
+=09=09MTK_FUNCTION(5, "CONN_MCU_TMS"),
+=09=09MTK_FUNCTION(6, "I2S1_BCK"),
+=09=09MTK_FUNCTION(7, "TDD_TXD")
+=09),
+=09MTK_PIN(
+=09=098, "GPIO8",
+=09=09MTK_EINT_FUNCTION(0, 8),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO8"),
+=09=09MTK_FUNCTION(1, "URTS3"),
+=09=09MTK_FUNCTION(2, "C2K_UIM0_HOT_PLUG_IN"),
+=09=09MTK_FUNCTION(3, "SCL1"),
+=09=09MTK_FUNCTION(4, "PCM1_DO1"),
+=09=09MTK_FUNCTION(5, "MD_EINT1"),
+=09=09MTK_FUNCTION(6, "KCOL4"),
+=09=09MTK_FUNCTION(7, "UTXD0")
+=09),
+=09MTK_PIN(
+=09=099, "GPIO9",
+=09=09MTK_EINT_FUNCTION(0, 9),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO9"),
+=09=09MTK_FUNCTION(1, "C2K_UIM1_HOT_PLUG_IN"),
+=09=09MTK_FUNCTION(2, "PCM1_DO0"),
+=09=09MTK_FUNCTION(3, "I2S3_MCK"),
+=09=09MTK_FUNCTION(4, "MD_EINT2"),
+=09=09MTK_FUNCTION(5, "CLKM2"),
+=09=09MTK_FUNCTION(6, "I2S1_MCK"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A29")
+=09),
+=09MTK_PIN(
+=09=0910, "GPIO10",
+=09=09MTK_EINT_FUNCTION(0, 10),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO10"),
+=09=09MTK_FUNCTION(1, "PWM1"),
+=09=09MTK_FUNCTION(2, "CLKM1"),
+=09=09MTK_FUNCTION(3, "KROW2"),
+=09=09MTK_FUNCTION(4, "MD_EINT0"),
+=09=09MTK_FUNCTION(5, "I2S1_MCK"),
+=09=09MTK_FUNCTION(6, "SDA3"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A30")
+=09),
+=09MTK_PIN(
+=09=0911, "GPIO11",
+=09=09MTK_EINT_FUNCTION(0, 11),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO11"),
+=09=09MTK_FUNCTION(1, "MD_EINT1"),
+=09=09MTK_FUNCTION(2, "IRTX_OUT"),
+=09=09MTK_FUNCTION(3, "C2K_UIM0_HOT_PLUG_IN"),
+=09=09MTK_FUNCTION(4, "CLKM0"),
+=09=09MTK_FUNCTION(5, "I2S2_MCK"),
+=09=09MTK_FUNCTION(6, "SCL3"),
+=09=09MTK_FUNCTION(7, "URXD0")
+=09),
+=09MTK_PIN(
+=09=0912, "GPIO12",
+=09=09MTK_EINT_FUNCTION(0, 12),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO12"),
+=09=09MTK_FUNCTION(1, "I2S0_MCK"),
+=09=09MTK_FUNCTION(2, "C2K_UIM1_HOT_PLUG_IN"),
+=09=09MTK_FUNCTION(3, "KCOL2"),
+=09=09MTK_FUNCTION(4, "MD_EINT2"),
+=09=09MTK_FUNCTION(5, "IRTX_OUT"),
+=09=09MTK_FUNCTION(6, "SRCLKENAI2"),
+=09=09MTK_FUNCTION(7, "PCM1_DO1")
+=09),
+=09MTK_PIN(
+=09=0913, "GPIO13",
+=09=09MTK_EINT_FUNCTION(0, 13),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO13"),
+=09=09MTK_FUNCTION(1, "WB_CTRL0"),
+=09=09MTK_FUNCTION(3, "C2K_ARM_EINT0"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A0")
+=09),
+=09MTK_PIN(
+=09=0914, "GPIO14",
+=09=09MTK_EINT_FUNCTION(0, 14),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO14"),
+=09=09MTK_FUNCTION(1, "WB_CTRL1"),
+=09=09MTK_FUNCTION(3, "C2K_ARM_EINT1"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A1")
+=09),
+=09MTK_PIN(
+=09=0915, "GPIO15",
+=09=09MTK_EINT_FUNCTION(0, 15),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO15"),
+=09=09MTK_FUNCTION(1, "WB_CTRL2"),
+=09=09MTK_FUNCTION(3, "C2K_ARM_EINT2"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A2")
+=09),
+=09MTK_PIN(
+=09=0916, "GPIO16",
+=09=09MTK_EINT_FUNCTION(0, 16),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO16"),
+=09=09MTK_FUNCTION(1, "WB_CTRL3"),
+=09=09MTK_FUNCTION(3, "C2K_ARM_EINT3"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A3")
+=09),
+=09MTK_PIN(
+=09=0917, "GPIO17",
+=09=09MTK_EINT_FUNCTION(0, 17),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO17"),
+=09=09MTK_FUNCTION(1, "WB_CTRL4"),
+=09=09MTK_FUNCTION(3, "C2K_DM_EINT0"),
+=09=09MTK_FUNCTION(4, "WATCHDOG"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A4")
+=09),
+=09MTK_PIN(
+=09=0918, "GPIO18",
+=09=09MTK_EINT_FUNCTION(0, 18),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO18"),
+=09=09MTK_FUNCTION(1, "WB_CTRL5"),
+=09=09MTK_FUNCTION(3, "C2K_DM_EINT1"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A5")
+=09),
+=09MTK_PIN(
+=09=0919, "GPIO19",
+=09=09MTK_EINT_FUNCTION(0, 19),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO19"),
+=09=09MTK_FUNCTION(1, "ANT_SEL0"),
+=09=09MTK_FUNCTION(2, "IRTX_OUT"),
+=09=09MTK_FUNCTION(3, "IRDA_TX"),
+=09=09MTK_FUNCTION(4, "C2K_UART0_TXD"),
+=09=09MTK_FUNCTION(5, "GPS_FRAME_SYNC"),
+=09=09MTK_FUNCTION(6, "LTE_UTXD"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A6")
+=09),
+=09MTK_PIN(
+=09=0920, "GPIO20",
+=09=09MTK_EINT_FUNCTION(0, 20),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO20"),
+=09=09MTK_FUNCTION(1, "ANT_SEL1"),
+=09=09MTK_FUNCTION(2, "C2K_UIM1_HOT_PLUG_IN"),
+=09=09MTK_FUNCTION(3, "IRDA_RX"),
+=09=09MTK_FUNCTION(4, "C2K_UART0_RXD"),
+=09=09MTK_FUNCTION(5, "MD_EINT2"),
+=09=09MTK_FUNCTION(6, "LTE_URXD"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A7")
+=09),
+=09MTK_PIN(
+=09=0921, "GPIO21",
+=09=09MTK_EINT_FUNCTION(0, 21),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO21"),
+=09=09MTK_FUNCTION(1, "ANT_SEL2"),
+=09=09MTK_FUNCTION(2, "PWM2"),
+=09=09MTK_FUNCTION(3, "IRDA_PDN"),
+=09=09MTK_FUNCTION(4, "CORESONIC_SWCK"),
+=09=09MTK_FUNCTION(5, "MD_EINT1"),
+=09=09MTK_FUNCTION(6, "C2K_UIM0_HOT_PLUG_IN"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A8")
+=09),
+=09MTK_PIN(
+=09=0922, "GPIO22",
+=09=09MTK_EINT_FUNCTION(0, 22),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO22"),
+=09=09MTK_FUNCTION(1, "RDN0")
+=09),
+=09MTK_PIN(
+=09=0923, "GPIO23",
+=09=09MTK_EINT_FUNCTION(0, 23),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO23"),
+=09=09MTK_FUNCTION(1, "RDP0")
+=09),
+=09MTK_PIN(
+=09=0924, "GPIO24",
+=09=09MTK_EINT_FUNCTION(0, 24),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO24"),
+=09=09MTK_FUNCTION(1, "RDN1")
+=09),
+=09MTK_PIN(
+=09=0925, "GPIO25",
+=09=09MTK_EINT_FUNCTION(0, 25),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO25"),
+=09=09MTK_FUNCTION(1, "RDP1")
+=09),
+=09MTK_PIN(
+=09=0926, "GPIO26",
+=09=09MTK_EINT_FUNCTION(0, 26),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO26"),
+=09=09MTK_FUNCTION(1, "RCN")
+=09),
+=09MTK_PIN(
+=09=0927, "GPIO27",
+=09=09MTK_EINT_FUNCTION(0, 27),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO27"),
+=09=09MTK_FUNCTION(1, "RCP")
+=09),
+=09MTK_PIN(
+=09=0928, "GPIO28",
+=09=09MTK_EINT_FUNCTION(0, 28),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO28"),
+=09=09MTK_FUNCTION(1, "RDN2")
+=09),
+=09MTK_PIN(
+=09=0929, "GPIO29",
+=09=09MTK_EINT_FUNCTION(0, 29),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO29"),
+=09=09MTK_FUNCTION(1, "RDP2")
+=09),
+=09MTK_PIN(
+=09=0930, "GPIO30",
+=09=09MTK_EINT_FUNCTION(0, 30),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO30"),
+=09=09MTK_FUNCTION(1, "RDN3")
+=09),
+=09MTK_PIN(
+=09=0931, "GPIO31",
+=09=09MTK_EINT_FUNCTION(0, 31),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO31"),
+=09=09MTK_FUNCTION(1, "RDP3")
+=09),
+=09MTK_PIN(
+=09=0932, "GPIO32",
+=09=09MTK_EINT_FUNCTION(0, 32),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO32"),
+=09=09MTK_FUNCTION(1, "RDN0_A"),
+=09=09MTK_FUNCTION(2, "CMHSYNC"),
+=09=09MTK_FUNCTION(3, "CMCSD0")
+=09),
+=09MTK_PIN(
+=09=0933, "GPIO33",
+=09=09MTK_EINT_FUNCTION(0, 33),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO33"),
+=09=09MTK_FUNCTION(1, "RDP0_A"),
+=09=09MTK_FUNCTION(2, "CMVSYNC"),
+=09=09MTK_FUNCTION(3, "CMCSD1")
+=09),
+=09MTK_PIN(
+=09=0934, "GPIO34",
+=09=09MTK_EINT_FUNCTION(0, 34),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO34"),
+=09=09MTK_FUNCTION(1, "RDN1_A"),
+=09=09MTK_FUNCTION(2, "CMDAT9"),
+=09=09MTK_FUNCTION(3, "CMCSD2")
+=09),
+=09MTK_PIN(
+=09=0935, "GPIO35",
+=09=09MTK_EINT_FUNCTION(0, 35),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO35"),
+=09=09MTK_FUNCTION(1, "RDP1_A"),
+=09=09MTK_FUNCTION(2, "CMDAT8"),
+=09=09MTK_FUNCTION(3, "CMCSD3")
+=09),
+=09MTK_PIN(
+=09=0936, "GPIO36",
+=09=09MTK_EINT_FUNCTION(0, 36),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO36"),
+=09=09MTK_FUNCTION(1, "RCN_A"),
+=09=09MTK_FUNCTION(2, "CMDAT7")
+=09),
+=09MTK_PIN(
+=09=0937, "GPIO37",
+=09=09MTK_EINT_FUNCTION(0, 37),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO37"),
+=09=09MTK_FUNCTION(1, "RCP_A"),
+=09=09MTK_FUNCTION(2, "CMDAT6")
+=09),
+=09MTK_PIN(
+=09=0938, "GPIO38",
+=09=09MTK_EINT_FUNCTION(0, 38),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO38"),
+=09=09MTK_FUNCTION(1, "RDN2_A"),
+=09=09MTK_FUNCTION(2, "CMDAT5")
+=09),
+=09MTK_PIN(
+=09=0939, "GPIO39",
+=09=09MTK_EINT_FUNCTION(0, 39),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO39"),
+=09=09MTK_FUNCTION(1, "RDP2_A"),
+=09=09MTK_FUNCTION(2, "CMDAT4")
+=09),
+=09MTK_PIN(
+=09=0940, "GPIO40",
+=09=09MTK_EINT_FUNCTION(0, 40),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO40"),
+=09=09MTK_FUNCTION(1, "RDN3_A"),
+=09=09MTK_FUNCTION(2, "CMDAT3")
+=09),
+=09MTK_PIN(
+=09=0941, "GPIO41",
+=09=09MTK_EINT_FUNCTION(0, 41),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO41"),
+=09=09MTK_FUNCTION(1, "RDP3_A"),
+=09=09MTK_FUNCTION(2, "CMDAT2")
+=09),
+=09MTK_PIN(
+=09=0942, "GPIO42",
+=09=09MTK_EINT_FUNCTION(0, 42),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO42"),
+=09=09MTK_FUNCTION(1, "CMDAT0"),
+=09=09MTK_FUNCTION(2, "CMCSD0"),
+=09=09MTK_FUNCTION(3, "CMMCLK1"),
+=09=09MTK_FUNCTION(5, "ANT_SEL5"),
+=09=09MTK_FUNCTION(6, "CLKM5"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A9")
+=09),
+=09MTK_PIN(
+=09=0943, "GPIO43",
+=09=09MTK_EINT_FUNCTION(0, 43),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO43"),
+=09=09MTK_FUNCTION(1, "CMDAT1"),
+=09=09MTK_FUNCTION(2, "CMCSD1"),
+=09=09MTK_FUNCTION(3, "CMFLASH"),
+=09=09MTK_FUNCTION(4, "MD_EINT0"),
+=09=09MTK_FUNCTION(5, "CMMCLK1"),
+=09=09MTK_FUNCTION(6, "CLKM4"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A10")
+=09),
+=09MTK_PIN(
+=09=0944, "GPIO44",
+=09=09MTK_EINT_FUNCTION(0, 44),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO44"),
+=09=09MTK_FUNCTION(1, "CMPCLK"),
+=09=09MTK_FUNCTION(2, "CMCSK"),
+=09=09MTK_FUNCTION(3, "CMCSD2"),
+=09=09MTK_FUNCTION(4, "KCOL3"),
+=09=09MTK_FUNCTION(5, "SRCLKENAI2"),
+=09=09MTK_FUNCTION(6, "PWM0"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A11")
+=09),
+=09MTK_PIN(
+=09=0945, "GPIO45",
+=09=09MTK_EINT_FUNCTION(0, 45),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO45"),
+=09=09MTK_FUNCTION(1, "CMMCLK0"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A12")
+=09),
+=09MTK_PIN(
+=09=0946, "GPIO46",
+=09=09MTK_EINT_FUNCTION(0, 46),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO46"),
+=09=09MTK_FUNCTION(1, "CMMCLK1"),
+=09=09MTK_FUNCTION(2, "IDDIG"),
+=09=09MTK_FUNCTION(3, "LTE_MD32_JTAG_TRST"),
+=09=09MTK_FUNCTION(4, "TDD_TRSTN"),
+=09=09MTK_FUNCTION(5, "DM_JTINTP"),
+=09=09MTK_FUNCTION(6, "KCOL6"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A13")
+=09),
+=09MTK_PIN(
+=09=0947, "GPIO47",
+=09=09MTK_EINT_FUNCTION(0, 47),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, "GPIO47"),
+=09=09MTK_FUNCTION(1, "SDA0")
+=09),
+=09MTK_PIN(
+=09=0948, "GPIO48",
+=09=09MTK_EINT_FUNCTION(0, 48),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, "GPIO48"),
+=09=09MTK_FUNCTION(1, "SCL0")
+=09),
+=09MTK_PIN(
+=09=0949, "GPIO49",
+=09=09MTK_EINT_FUNCTION(0, 49),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, "GPIO49"),
+=09=09MTK_FUNCTION(1, "SDA1")
+=09),
+=09MTK_PIN(
+=09=0950, "GPIO50",
+=09=09MTK_EINT_FUNCTION(0, 50),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, "GPIO50"),
+=09=09MTK_FUNCTION(1, "SCL1")
+=09),
+=09MTK_PIN(
+=09=0951, "GPIO51",
+=09=09MTK_EINT_FUNCTION(0, 51),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, "GPIO51"),
+=09=09MTK_FUNCTION(1, "SDA2")
+=09),
+=09MTK_PIN(
+=09=0952, "GPIO52",
+=09=09MTK_EINT_FUNCTION(0, 52),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, "GPIO52"),
+=09=09MTK_FUNCTION(1, "SCL2")
+=09),
+=09MTK_PIN(
+=09=0953, "GPIO53",
+=09=09MTK_EINT_FUNCTION(0, 53),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, "GPIO53"),
+=09=09MTK_FUNCTION(1, "SDA3"),
+=09=09MTK_FUNCTION(3, "IDDIG"),
+=09=09MTK_FUNCTION(5, "MD_EINT2"),
+=09=09MTK_FUNCTION(6, "C2K_UIM1_HOT_PLUG_IN")
+=09),
+=09MTK_PIN(
+=09=0954, "GPIO54",
+=09=09MTK_EINT_FUNCTION(0, 54),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, "GPIO54"),
+=09=09MTK_FUNCTION(1, "SCL3"),
+=09=09MTK_FUNCTION(3, "IDDIG"),
+=09=09MTK_FUNCTION(5, "MD_EINT1"),
+=09=09MTK_FUNCTION(6, "C2K_UIM0_HOT_PLUG_IN")
+=09),
+=09MTK_PIN(
+=09=0955, "GPIO55",
+=09=09MTK_EINT_FUNCTION(0, 55),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO55"),
+=09=09MTK_FUNCTION(1, "SRCLKENAI0"),
+=09=09MTK_FUNCTION(2, "PWM2"),
+=09=09MTK_FUNCTION(3, "CLKM5"),
+=09=09MTK_FUNCTION(4, "CORESONIC_SWD"),
+=09=09MTK_FUNCTION(5, "ANT_SEL6"),
+=09=09MTK_FUNCTION(6, "KROW5"),
+=09=09MTK_FUNCTION(7, "DISP_PWM")
+=09),
+=09MTK_PIN(
+=09=0956, "GPIO56",
+=09=09MTK_EINT_FUNCTION(0, 56),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO56"),
+=09=09MTK_FUNCTION(1, "SRCLKENA1")
+=09),
+=09MTK_PIN(
+=09=0957, "GPIO57",
+=09=09MTK_EINT_FUNCTION(0, 57),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO57"),
+=09=09MTK_FUNCTION(1, "URXD2"),
+=09=09MTK_FUNCTION(2, "DPI_HSYNC0"),
+=09=09MTK_FUNCTION(3, "UTXD2"),
+=09=09MTK_FUNCTION(4, "MD_URXD"),
+=09=09MTK_FUNCTION(5, "SRCLKENAI1"),
+=09=09MTK_FUNCTION(6, "KROW4"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A14")
+=09),
+=09MTK_PIN(
+=09=0958, "GPIO58",
+=09=09MTK_EINT_FUNCTION(0, 58),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO58"),
+=09=09MTK_FUNCTION(1, "UTXD2"),
+=09=09MTK_FUNCTION(2, "DPI_VSYNC0"),
+=09=09MTK_FUNCTION(3, "URXD2"),
+=09=09MTK_FUNCTION(4, "MD_UTXD"),
+=09=09MTK_FUNCTION(5, "TDD_TXD"),
+=09=09MTK_FUNCTION(6, "KROW5"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A15")
+=09),
+=09MTK_PIN(
+=09=0959, "GPIO59",
+=09=09MTK_EINT_FUNCTION(0, 59),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO59"),
+=09=09MTK_FUNCTION(1, "URXD3"),
+=09=09MTK_FUNCTION(2, "DPI_CK0"),
+=09=09MTK_FUNCTION(3, "UTXD3"),
+=09=09MTK_FUNCTION(4, "UCTS2"),
+=09=09MTK_FUNCTION(5, "PWM3"),
+=09=09MTK_FUNCTION(6, "KROW6"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A16")
+=09),
+=09MTK_PIN(
+=09=0960, "GPIO60",
+=09=09MTK_EINT_FUNCTION(0, 60),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO60"),
+=09=09MTK_FUNCTION(1, "UTXD3"),
+=09=09MTK_FUNCTION(2, "DPI_DE0"),
+=09=09MTK_FUNCTION(3, "URXD3"),
+=09=09MTK_FUNCTION(4, "URTS2"),
+=09=09MTK_FUNCTION(5, "PWM4"),
+=09=09MTK_FUNCTION(6, "KROW7"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A17")
+=09),
+=09MTK_PIN(
+=09=0961, "GPIO61",
+=09=09MTK_EINT_FUNCTION(0, 61),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO61"),
+=09=09MTK_FUNCTION(1, "PCM1_CLK"),
+=09=09MTK_FUNCTION(2, "DPI_D0"),
+=09=09MTK_FUNCTION(3, "I2S0_BCK"),
+=09=09MTK_FUNCTION(4, "KROW4"),
+=09=09MTK_FUNCTION(5, "ANT_SEL3"),
+=09=09MTK_FUNCTION(6, "IRTX_OUT"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A18")
+=09),
+=09MTK_PIN(
+=09=0962, "GPIO62",
+=09=09MTK_EINT_FUNCTION(0, 62),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO62"),
+=09=09MTK_FUNCTION(1, "PCM1_SYNC"),
+=09=09MTK_FUNCTION(2, "DPI_D1"),
+=09=09MTK_FUNCTION(3, "I2S0_LRCK"),
+=09=09MTK_FUNCTION(4, "KCOL7"),
+=09=09MTK_FUNCTION(5, "CLKM3"),
+=09=09MTK_FUNCTION(6, "CMFLASH"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A19")
+=09),
+=09MTK_PIN(
+=09=0963, "GPIO63",
+=09=09MTK_EINT_FUNCTION(0, 63),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO63"),
+=09=09MTK_FUNCTION(1, "PCM1_DI"),
+=09=09MTK_FUNCTION(2, "DPI_D2"),
+=09=09MTK_FUNCTION(3, "I2S0_DI"),
+=09=09MTK_FUNCTION(4, "PCM1_DO0"),
+=09=09MTK_FUNCTION(5, "CLKM5"),
+=09=09MTK_FUNCTION(6, "KROW3"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A20")
+=09),
+=09MTK_PIN(
+=09=0964, "GPIO64",
+=09=09MTK_EINT_FUNCTION(0, 64),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO64"),
+=09=09MTK_FUNCTION(1, "PCM1_DO0"),
+=09=09MTK_FUNCTION(2, "DPI_D3"),
+=09=09MTK_FUNCTION(3, "I2S0_MCK"),
+=09=09MTK_FUNCTION(4, "PCM1_DI"),
+=09=09MTK_FUNCTION(5, "SRCLKENAI2"),
+=09=09MTK_FUNCTION(6, "KCOL5"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A21")
+=09),
+=09MTK_PIN(
+=09=0965, "GPIO65",
+=09=09MTK_EINT_FUNCTION(0, 65),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO65"),
+=09=09MTK_FUNCTION(1, "SPI_CSA"),
+=09=09MTK_FUNCTION(2, "EXT_FRAME_SYNC"),
+=09=09MTK_FUNCTION(3, "I2S3_MCK"),
+=09=09MTK_FUNCTION(4, "KROW2"),
+=09=09MTK_FUNCTION(5, "GPS_FRAME_SYNC"),
+=09=09MTK_FUNCTION(6, "PTA_RXD"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A22")
+=09),
+=09MTK_PIN(
+=09=0966, "GPIO66",
+=09=09MTK_EINT_FUNCTION(0, 66),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO66"),
+=09=09MTK_FUNCTION(1, "SPI_CKA"),
+=09=09MTK_FUNCTION(2, "USB_DRVVBUS"),
+=09=09MTK_FUNCTION(3, "I2S3_BCK"),
+=09=09MTK_FUNCTION(4, "KCOL2"),
+=09=09MTK_FUNCTION(6, "PTA_TXD"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A23")
+=09),
+=09MTK_PIN(
+=09=0967, "GPIO67",
+=09=09MTK_EINT_FUNCTION(0, 67),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO67"),
+=09=09MTK_FUNCTION(1, "SPI_MIA"),
+=09=09MTK_FUNCTION(2, "SPI_MOA"),
+=09=09MTK_FUNCTION(3, "I2S3_DO"),
+=09=09MTK_FUNCTION(4, "PTA_RXD"),
+=09=09MTK_FUNCTION(5, "IDDIG"),
+=09=09MTK_FUNCTION(6, "UCTS1"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A24")
+=09),
+=09MTK_PIN(
+=09=0968, "GPIO68",
+=09=09MTK_EINT_FUNCTION(0, 68),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO68"),
+=09=09MTK_FUNCTION(1, "SPI_MOA"),
+=09=09MTK_FUNCTION(2, "SPI_MIA"),
+=09=09MTK_FUNCTION(3, "I2S3_LRCK"),
+=09=09MTK_FUNCTION(4, "PTA_TXD"),
+=09=09MTK_FUNCTION(5, "ANT_SEL4"),
+=09=09MTK_FUNCTION(6, "URTS1"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A25")
+=09),
+=09MTK_PIN(
+=09=0969, "GPIO69",
+=09=09MTK_EINT_FUNCTION(0, 69),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO69"),
+=09=09MTK_FUNCTION(1, "DISP_PWM"),
+=09=09MTK_FUNCTION(2, "PWM1"),
+=09=09MTK_FUNCTION(3, "LTE_MD32_JTAG_TRST"),
+=09=09MTK_FUNCTION(4, "TDD_TRSTN"),
+=09=09MTK_FUNCTION(5, "ANT_SEL7"),
+=09=09MTK_FUNCTION(6, "DM_JTINTP")
+=09),
+=09MTK_PIN(
+=09=0970, "GPIO70",
+=09=09MTK_EINT_FUNCTION(0, 70),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO70"),
+=09=09MTK_FUNCTION(1, "JTMS"),
+=09=09MTK_FUNCTION(2, "CONN_MCU_TMS"),
+=09=09MTK_FUNCTION(3, "LTE_MD32_JTAG_TMS"),
+=09=09MTK_FUNCTION(4, "TDD_TMS"),
+=09=09MTK_FUNCTION(5, "CORESONIC_SWD"),
+=09=09MTK_FUNCTION(6, "DM_OTMS"),
+=09=09MTK_FUNCTION(7, "DFD_TMS")
+=09),
+=09MTK_PIN(
+=09=0971, "GPIO71",
+=09=09MTK_EINT_FUNCTION(0, 71),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO71"),
+=09=09MTK_FUNCTION(1, "JTCK"),
+=09=09MTK_FUNCTION(2, "CONN_MCU_TCK[1]"),
+=09=09MTK_FUNCTION(3, "LTE_MD32_JTAG_TCK"),
+=09=09MTK_FUNCTION(4, "TDD_TCK"),
+=09=09MTK_FUNCTION(5, "CORESONIC_SWCK"),
+=09=09MTK_FUNCTION(6, "DM_OTCK"),
+=09=09MTK_FUNCTION(7, "DFD_TCK_XI")
+=09),
+=09MTK_PIN(
+=09=0972, "GPIO72",
+=09=09MTK_EINT_FUNCTION(0, 72),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO72"),
+=09=09MTK_FUNCTION(1, "JTDI"),
+=09=09MTK_FUNCTION(2, "CONN_MCU_TDI"),
+=09=09MTK_FUNCTION(3, "LTE_MD32_JTAG_TDI"),
+=09=09MTK_FUNCTION(4, "TDD_TDI"),
+=09=09MTK_FUNCTION(6, "DM_OTDI"),
+=09=09MTK_FUNCTION(7, "DFD_TDI")
+=09),
+=09MTK_PIN(
+=09=0973, "GPIO73",
+=09=09MTK_EINT_FUNCTION(0, 73),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO73"),
+=09=09MTK_FUNCTION(1, "JTDO"),
+=09=09MTK_FUNCTION(2, "CONN_MCU_TDO"),
+=09=09MTK_FUNCTION(3, "LTE_MD32_JTAG_TDO"),
+=09=09MTK_FUNCTION(4, "TDD_TDO"),
+=09=09MTK_FUNCTION(6, "DM_OTDO"),
+=09=09MTK_FUNCTION(7, "DFD_TDO")
+=09),
+=09MTK_PIN(
+=09=0974, "GPIO74",
+=09=09MTK_EINT_FUNCTION(0, 74),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO74"),
+=09=09MTK_FUNCTION(1, "URXD0"),
+=09=09MTK_FUNCTION(2, "UTXD0"),
+=09=09MTK_FUNCTION(3, "MD_URXD"),
+=09=09MTK_FUNCTION(4, "SDA3"),
+=09=09MTK_FUNCTION(5, "C2K_UART0_RXD"),
+=09=09MTK_FUNCTION(6, "LTE_URXD"),
+=09=09MTK_FUNCTION(7, "AUXIF_ST")
+=09),
+=09MTK_PIN(
+=09=0975, "GPIO75",
+=09=09MTK_EINT_FUNCTION(0, 75),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO75"),
+=09=09MTK_FUNCTION(1, "UTXD0"),
+=09=09MTK_FUNCTION(2, "URXD0"),
+=09=09MTK_FUNCTION(3, "MD_UTXD"),
+=09=09MTK_FUNCTION(4, "TDD_TXD"),
+=09=09MTK_FUNCTION(5, "C2K_UART0_TXD"),
+=09=09MTK_FUNCTION(6, "LTE_UTXD")
+=09),
+=09MTK_PIN(
+=09=0976, "GPIO76",
+=09=09MTK_EINT_FUNCTION(0, 76),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO76"),
+=09=09MTK_FUNCTION(1, "URXD1"),
+=09=09MTK_FUNCTION(2, "UTXD1"),
+=09=09MTK_FUNCTION(3, "MD_URXD"),
+=09=09MTK_FUNCTION(4, "SCL3"),
+=09=09MTK_FUNCTION(5, "LTE_URXD"),
+=09=09MTK_FUNCTION(6, "C2K_UART0_RXD"),
+=09=09MTK_FUNCTION(7, "AUXIF_CLK")
+=09),
+=09MTK_PIN(
+=09=0977, "GPIO77",
+=09=09MTK_EINT_FUNCTION(0, 77),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO77"),
+=09=09MTK_FUNCTION(1, "UTXD1"),
+=09=09MTK_FUNCTION(2, "URXD1"),
+=09=09MTK_FUNCTION(3, "MD_UTXD"),
+=09=09MTK_FUNCTION(4, "TDD_TXD"),
+=09=09MTK_FUNCTION(5, "LTE_UTXD"),
+=09=09MTK_FUNCTION(6, "C2K_UART0_TXD")
+=09),
+=09MTK_PIN(
+=09=0978, "GPIO78",
+=09=09MTK_EINT_FUNCTION(0, 78),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO78"),
+=09=09MTK_FUNCTION(1, "I2S0_DI"),
+=09=09MTK_FUNCTION(2, "PCM1_DI"),
+=09=09MTK_FUNCTION(3, "I2S3_DO"),
+=09=09MTK_FUNCTION(4, "I2S1_DO"),
+=09=09MTK_FUNCTION(5, "PWM0"),
+=09=09MTK_FUNCTION(6, "I2S2_DI"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A26")
+=09),
+=09MTK_PIN(
+=09=0979, "GPIO79",
+=09=09MTK_EINT_FUNCTION(0, 79),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO79"),
+=09=09MTK_FUNCTION(1, "I2S0_LRCK"),
+=09=09MTK_FUNCTION(2, "PCM1_SYNC"),
+=09=09MTK_FUNCTION(3, "I2S3_LRCK"),
+=09=09MTK_FUNCTION(4, "I2S1_LRCK"),
+=09=09MTK_FUNCTION(5, "PWM3"),
+=09=09MTK_FUNCTION(6, "I2S2_LRCK"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A27")
+=09),
+=09MTK_PIN(
+=09=0980, "GPIO80",
+=09=09MTK_EINT_FUNCTION(0, 80),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO80"),
+=09=09MTK_FUNCTION(1, "I2S0_BCK"),
+=09=09MTK_FUNCTION(2, "PCM1_CLK[1]"),
+=09=09MTK_FUNCTION(3, "I2S3_BCK"),
+=09=09MTK_FUNCTION(4, "I2S1_BCK"),
+=09=09MTK_FUNCTION(5, "PWM4"),
+=09=09MTK_FUNCTION(6, "I2S2_BCK"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A28")
+=09),
+=09MTK_PIN(
+=09=0981, "GPIO81",
+=09=09MTK_EINT_FUNCTION(0, 81),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO81"),
+=09=09MTK_FUNCTION(1, "KROW0"),
+=09=09MTK_FUNCTION(3, "CONN_MCU_DBGI_N"),
+=09=09MTK_FUNCTION(4, "CORESONIC_SWCK"),
+=09=09MTK_FUNCTION(5, "C2K_TCK"),
+=09=09MTK_FUNCTION(7, "C2K_DM_EINT1")
+=09),
+=09MTK_PIN(
+=09=0982, "GPIO82",
+=09=09MTK_EINT_FUNCTION(0, 82),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO82"),
+=09=09MTK_FUNCTION(1, "KROW1"),
+=09=09MTK_FUNCTION(3, "CONN_MCU_TRST_B"),
+=09=09MTK_FUNCTION(4, "CORESONIC_SWD"),
+=09=09MTK_FUNCTION(5, "C2K_NTRST"),
+=09=09MTK_FUNCTION(6, "USB_DRVVBUS"),
+=09=09MTK_FUNCTION(7, "C2K_DM_EINT2")
+=09),
+=09MTK_PIN(
+=09=0983, "GPIO83",
+=09=09MTK_EINT_FUNCTION(0, 83),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO83"),
+=09=09MTK_FUNCTION(1, "KROW2"),
+=09=09MTK_FUNCTION(2, "USB_DRVVBUS"),
+=09=09MTK_FUNCTION(5, "C2K_TDI"),
+=09=09MTK_FUNCTION(7, "C2K_DM_EINT3")
+=09),
+=09MTK_PIN(
+=09=0984, "GPIO84",
+=09=09MTK_EINT_FUNCTION(0, 84),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO84"),
+=09=09MTK_FUNCTION(1, "KCOL0"),
+=09=09MTK_FUNCTION(2, "URTS0"),
+=09=09MTK_FUNCTION(3, "CONN_MCU_DBGACK_N"),
+=09=09MTK_FUNCTION(4, "SCL2"),
+=09=09MTK_FUNCTION(5, "C2K_TDO"),
+=09=09MTK_FUNCTION(6, "AUXIF_CLK")
+=09),
+=09MTK_PIN(
+=09=0985, "GPIO85",
+=09=09MTK_EINT_FUNCTION(0, 85),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO85"),
+=09=09MTK_FUNCTION(1, "KCOL1"),
+=09=09MTK_FUNCTION(2, "UCTS0"),
+=09=09MTK_FUNCTION(3, "UCTS1"),
+=09=09MTK_FUNCTION(4, "SDA2"),
+=09=09MTK_FUNCTION(5, "C2K_TMS"),
+=09=09MTK_FUNCTION(6, "AUXIF_ST"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A31")
+=09),
+=09MTK_PIN(
+=09=0986, "GPIO86",
+=09=09MTK_EINT_FUNCTION(0, 86),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO86"),
+=09=09MTK_FUNCTION(1, "KCOL2"),
+=09=09MTK_FUNCTION(3, "URTS1"),
+=09=09MTK_FUNCTION(5, "C2K_RTCK"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A32")
+=09),
+=09MTK_PIN(
+=09=0987, "GPIO87",
+=09=09MTK_EINT_FUNCTION(0, 87),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO87"),
+=09=09MTK_FUNCTION(1, "BPI_BUS5"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS5"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS5"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B0")
+=09),
+=09MTK_PIN(
+=09=0988, "GPIO88",
+=09=09MTK_EINT_FUNCTION(0, 88),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO88"),
+=09=09MTK_FUNCTION(1, "BPI_BUS6"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS6"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS6"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B1")
+=09),
+=09MTK_PIN(
+=09=0989, "GPIO89",
+=09=09MTK_EINT_FUNCTION(0, 89),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO89"),
+=09=09MTK_FUNCTION(1, "BPI_BUS7"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS7"),
+=09=09MTK_FUNCTION(3, "CLKM0"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS7"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B2")
+=09),
+=09MTK_PIN(
+=09=0990, "GPIO90",
+=09=09MTK_EINT_FUNCTION(0, 90),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO90"),
+=09=09MTK_FUNCTION(1, "BPI_BUS8"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS8"),
+=09=09MTK_FUNCTION(3, "CLKM1"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS8"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B3")
+=09),
+=09MTK_PIN(
+=09=0991, "GPIO91",
+=09=09MTK_EINT_FUNCTION(0, 91),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO91"),
+=09=09MTK_FUNCTION(1, "BPI_BUS9"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS9"),
+=09=09MTK_FUNCTION(3, "CLKM2"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS9"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B4")
+=09),
+=09MTK_PIN(
+=09=0992, "GPIO92",
+=09=09MTK_EINT_FUNCTION(0, 92),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO92"),
+=09=09MTK_FUNCTION(1, "BPI_BUS10"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS10"),
+=09=09MTK_FUNCTION(3, "CLKM3"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS10"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B5")
+=09),
+=09MTK_PIN(
+=09=0993, "GPIO93",
+=09=09MTK_EINT_FUNCTION(0, 93),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO93"),
+=09=09MTK_FUNCTION(1, "BPI_BUS11"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS11"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS11"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B6")
+=09),
+=09MTK_PIN(
+=09=0994, "GPIO94",
+=09=09MTK_EINT_FUNCTION(0, 94),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO94"),
+=09=09MTK_FUNCTION(1, "BPI_BUS12"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS12"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS12"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B7")
+=09),
+=09MTK_PIN(
+=09=0995, "GPIO95",
+=09=09MTK_EINT_FUNCTION(0, 95),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO95"),
+=09=09MTK_FUNCTION(1, "BPI_BUS13"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS13"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS13"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B8")
+=09),
+=09MTK_PIN(
+=09=0996, "GPIO96",
+=09=09MTK_EINT_FUNCTION(0, 96),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO96"),
+=09=09MTK_FUNCTION(1, "BPI_BUS14"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS14"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS14"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B9")
+=09),
+=09MTK_PIN(
+=09=0997, "GPIO97",
+=09=09MTK_EINT_FUNCTION(0, 97),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO97"),
+=09=09MTK_FUNCTION(1, "BPI_BUS15"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS15"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS15"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B10")
+=09),
+=09MTK_PIN(
+=09=0998, "GPIO98",
+=09=09MTK_EINT_FUNCTION(0, 98),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO98"),
+=09=09MTK_FUNCTION(1, "BPI_BUS16"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS16"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS16"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B11")
+=09),
+=09MTK_PIN(
+=09=0999, "GPIO99",
+=09=09MTK_EINT_FUNCTION(0, 99),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO99"),
+=09=09MTK_FUNCTION(1, "BPI_BUS17"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS17"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS17"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B12")
+=09),
+=09MTK_PIN(
+=09=09100, "GPIO100",
+=09=09MTK_EINT_FUNCTION(0, 100),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO100"),
+=09=09MTK_FUNCTION(1, "BPI_BUS18"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS18"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS18"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B13")
+=09),
+=09MTK_PIN(
+=09=09101, "GPIO101",
+=09=09MTK_EINT_FUNCTION(0, 101),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO101"),
+=09=09MTK_FUNCTION(1, "BPI_BUS19"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS19"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS19"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B14")
+=09),
+=09MTK_PIN(
+=09=09102, "GPIO102",
+=09=09MTK_EINT_FUNCTION(0, 102),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO102"),
+=09=09MTK_FUNCTION(1, "BPI_BUS20"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS20"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS20"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B15")
+=09),
+=09MTK_PIN(
+=09=09103, "GPIO103",
+=09=09MTK_EINT_FUNCTION(0, 103),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO103"),
+=09=09MTK_FUNCTION(1, "C2K_TXBPI"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B16")
+=09),
+=09MTK_PIN(
+=09=09104, "GPIO104",
+=09=09MTK_EINT_FUNCTION(0, 104),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO104"),
+=09=09MTK_FUNCTION(1, "RFIC1_BSI_EN"),
+=09=09MTK_FUNCTION(5, "C2K_RX_BSI_EN"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B17")
+=09),
+=09MTK_PIN(
+=09=09105, "GPIO105",
+=09=09MTK_EINT_FUNCTION(0, 105),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO105"),
+=09=09MTK_FUNCTION(1, "RFIC1_BSI_CK"),
+=09=09MTK_FUNCTION(5, "C2K_RX_BSI_CLK"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B18")
+=09),
+=09MTK_PIN(
+=09=09106, "GPIO106",
+=09=09MTK_EINT_FUNCTION(0, 106),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO106"),
+=09=09MTK_FUNCTION(1, "RFIC1_BSI_D0"),
+=09=09MTK_FUNCTION(5, "C2K_RX_BSI_DATA"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B19")
+=09),
+=09MTK_PIN(
+=09=09107, "GPIO107",
+=09=09MTK_EINT_FUNCTION(0, 107),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO107"),
+=09=09MTK_FUNCTION(1, "RFIC1_BSI_D1"),
+=09=09MTK_FUNCTION(5, "C2K_TX_BSI_EN"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B20")
+=09),
+=09MTK_PIN(
+=09=09108, "GPIO108",
+=09=09MTK_EINT_FUNCTION(0, 108),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO108"),
+=09=09MTK_FUNCTION(1, "RFIC1_BSI_D2"),
+=09=09MTK_FUNCTION(5, "C2K_TX_BSI_CLK"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B21")
+=09),
+=09MTK_PIN(
+=09=09109, "GPIO109",
+=09=09MTK_EINT_FUNCTION(0, 109),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO109"),
+=09=09MTK_FUNCTION(5, "C2K_TX_BSI_DATA"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B22")
+=09),
+=09MTK_PIN(
+=09=09110, "GPIO110",
+=09=09MTK_EINT_FUNCTION(0, 110),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO110"),
+=09=09MTK_FUNCTION(1, "RFIC0_BSI_EN"),
+=09=09MTK_FUNCTION(4, "SPM_BSI_EN"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B23")
+=09),
+=09MTK_PIN(
+=09=09111, "GPIO111",
+=09=09MTK_EINT_FUNCTION(0, 111),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO111"),
+=09=09MTK_FUNCTION(1, "RFIC0_BSI_CK"),
+=09=09MTK_FUNCTION(4, "SPM_BSI_CLK"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B24")
+=09),
+=09MTK_PIN(
+=09=09112, "GPIO112",
+=09=09MTK_EINT_FUNCTION(0, 112),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO112"),
+=09=09MTK_FUNCTION(1, "RFIC0_BSI_D2"),
+=09=09MTK_FUNCTION(4, "SPM_BSI_D2"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B25")
+=09),
+=09MTK_PIN(
+=09=09113, "GPIO113",
+=09=09MTK_EINT_FUNCTION(0, 113),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO113"),
+=09=09MTK_FUNCTION(1, "RFIC0_BSI_D1"),
+=09=09MTK_FUNCTION(4, "SPM_BSI_D1"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B26")
+=09),
+=09MTK_PIN(
+=09=09114, "GPIO114",
+=09=09MTK_EINT_FUNCTION(0, 114),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO114"),
+=09=09MTK_FUNCTION(1, "RFIC0_BSI_D0"),
+=09=09MTK_FUNCTION(4, "SPM_BSI_D0"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B27")
+=09),
+=09MTK_PIN(
+=09=09115, "GPIO115",
+=09=09MTK_EINT_FUNCTION(0, 115),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO115"),
+=09=09MTK_FUNCTION(1, "AUXIN0")
+=09),
+=09MTK_PIN(
+=09=09116, "GPIO116",
+=09=09MTK_EINT_FUNCTION(0, 116),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO116"),
+=09=09MTK_FUNCTION(1, "AUXIN1")
+=09),
+=09MTK_PIN(
+=09=09117, "GPIO117",
+=09=09MTK_EINT_FUNCTION(0, 117),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO117"),
+=09=09MTK_FUNCTION(1, "AUXIN2")
+=09),
+=09MTK_PIN(
+=09=09118, "GPIO118",
+=09=09MTK_EINT_FUNCTION(0, 118),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO118"),
+=09=09MTK_FUNCTION(1, "TXBPI")
+=09),
+=09MTK_PIN(
+=09=09119, "GPIO119",
+=09=09MTK_EINT_FUNCTION(0, 119),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO119"),
+=09=09MTK_FUNCTION(1, "BPI_BUS0"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B28")
+=09),
+=09MTK_PIN(
+=09=09120, "GPIO120",
+=09=09MTK_EINT_FUNCTION(0, 120),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO120"),
+=09=09MTK_FUNCTION(1, "BPI_BUS1"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B29")
+=09),
+=09MTK_PIN(
+=09=09121, "GPIO121",
+=09=09MTK_EINT_FUNCTION(0, 121),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO121"),
+=09=09MTK_FUNCTION(1, "BPI_BUS2"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B30")
+=09),
+=09MTK_PIN(
+=09=09122, "GPIO122",
+=09=09MTK_EINT_FUNCTION(0, 122),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO122"),
+=09=09MTK_FUNCTION(1, "BPI_BUS3"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B31")
+=09),
+=09MTK_PIN(
+=09=09123, "GPIO123",
+=09=09MTK_EINT_FUNCTION(0, 123),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO123"),
+=09=09MTK_FUNCTION(1, "BPI_BUS4"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B32")
+=09),
+=09MTK_PIN(
+=09=09124, "GPIO124",
+=09=09MTK_EINT_FUNCTION(0, 124),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO124"),
+=09=09MTK_FUNCTION(1, "BPI_BUS21"),
+=09=09MTK_FUNCTION(5, "DPI_HSYNC1"),
+=09=09MTK_FUNCTION(6, "KCOL2"),
+=09=09MTK_FUNCTION(7, "TDD_TXD")
+=09),
+=09MTK_PIN(
+=09=09125, "GPIO125",
+=09=09MTK_EINT_FUNCTION(0, 125),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO125"),
+=09=09MTK_FUNCTION(1, "BPI_BUS22"),
+=09=09MTK_FUNCTION(5, "DPI_VSYNC1"),
+=09=09MTK_FUNCTION(6, "KROW2"),
+=09=09MTK_FUNCTION(7, "MD_URXD")
+=09),
+=09MTK_PIN(
+=09=09126, "GPIO126",
+=09=09MTK_EINT_FUNCTION(0, 126),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO126"),
+=09=09MTK_FUNCTION(1, "BPI_BUS23"),
+=09=09MTK_FUNCTION(5, "DPI_CK1"),
+=09=09MTK_FUNCTION(6, "I2S2_MCK"),
+=09=09MTK_FUNCTION(7, "MD_UTXD")
+=09),
+=09MTK_PIN(
+=09=09127, "GPIO127",
+=09=09MTK_EINT_FUNCTION(0, 127),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO127"),
+=09=09MTK_FUNCTION(1, "BPI_BUS24"),
+=09=09MTK_FUNCTION(3, "CONN_MCU_DBGI_N"),
+=09=09MTK_FUNCTION(4, "EXT_FRAME_SYNC"),
+=09=09MTK_FUNCTION(5, "DPI_DE1"),
+=09=09MTK_FUNCTION(6, "SRCLKENAI1"),
+=09=09MTK_FUNCTION(7, "URXD0")
+=09),
+=09MTK_PIN(
+=09=09128, "GPIO128",
+=09=09MTK_EINT_FUNCTION(0, 128),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO128"),
+=09=09MTK_FUNCTION(1, "BPI_BUS25"),
+=09=09MTK_FUNCTION(3, "GPS_FRAME_SYNC"),
+=09=09MTK_FUNCTION(5, "I2S2_DI"),
+=09=09MTK_FUNCTION(6, "PTA_RXD"),
+=09=09MTK_FUNCTION(7, "UTXD0")
+=09),
+=09MTK_PIN(
+=09=09129, "GPIO129",
+=09=09MTK_EINT_FUNCTION(0, 129),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO129"),
+=09=09MTK_FUNCTION(1, "BPI_BUS26"),
+=09=09MTK_FUNCTION(2, "DISP_PWM"),
+=09=09MTK_FUNCTION(5, "I2S2_LRCK"),
+=09=09MTK_FUNCTION(6, "PTA_TXD"),
+=09=09MTK_FUNCTION(7, "LTE_URXD")
+=09),
+=09MTK_PIN(
+=09=09130, "GPIO130",
+=09=09MTK_EINT_FUNCTION(0, 130),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO130"),
+=09=09MTK_FUNCTION(1, "BPI_BUS27"),
+=09=09MTK_FUNCTION(5, "I2S2_BCK"),
+=09=09MTK_FUNCTION(6, "IRTX_OUT"),
+=09=09MTK_FUNCTION(7, "LTE_UTXD")
+=09),
+=09MTK_PIN(
+=09=09131, "GPIO131",
+=09=09MTK_EINT_FUNCTION(0, 131),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO131"),
+=09=09MTK_FUNCTION(1, "LTE_PAVM0")
+=09),
+=09MTK_PIN(
+=09=09132, "GPIO132",
+=09=09MTK_EINT_FUNCTION(0, 132),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO132"),
+=09=09MTK_FUNCTION(1, "LTE_PAVM1")
+=09),
+=09MTK_PIN(
+=09=09133, "GPIO133",
+=09=09MTK_EINT_FUNCTION(0, 133),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO133"),
+=09=09MTK_FUNCTION(1, "MIPI1_SCLK")
+=09),
+=09MTK_PIN(
+=09=09134, "GPIO134",
+=09=09MTK_EINT_FUNCTION(0, 134),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO134"),
+=09=09MTK_FUNCTION(1, "MIPI1_SDATA")
+=09),
+=09MTK_PIN(
+=09=09135, "GPIO135",
+=09=09MTK_EINT_FUNCTION(0, 135),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO135"),
+=09=09MTK_FUNCTION(1, "MIPI0_SCLK")
+=09),
+=09MTK_PIN(
+=09=09136, "GPIO136",
+=09=09MTK_EINT_FUNCTION(0, 136),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO136"),
+=09=09MTK_FUNCTION(1, "MIPI0_SDATA")
+=09),
+=09MTK_PIN(
+=09=09137, "GPIO137",
+=09=09MTK_EINT_FUNCTION(0, 137),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO137"),
+=09=09MTK_FUNCTION(1, "RTC32K_CK")
+=09),
+=09MTK_PIN(
+=09=09138, "GPIO138",
+=09=09MTK_EINT_FUNCTION(0, 138),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO138"),
+=09=09MTK_FUNCTION(1, "PWRAP_SPIDO"),
+=09=09MTK_FUNCTION(2, "PWRAP_SPIDI")
+=09),
+=09MTK_PIN(
+=09=09139, "GPIO139",
+=09=09MTK_EINT_FUNCTION(0, 139),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO139"),
+=09=09MTK_FUNCTION(1, "PWRAP_SPIDI"),
+=09=09MTK_FUNCTION(2, "PWRAP_SPIDO")
+=09),
+=09MTK_PIN(
+=09=09140, "GPIO140",
+=09=09MTK_EINT_FUNCTION(0, 140),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO140"),
+=09=09MTK_FUNCTION(3, "LTE_MD32_JTAG_TRST"),
+=09=09MTK_FUNCTION(4, "TDD_TRSTN"),
+=09=09MTK_FUNCTION(5, "DM_JTINTP")
+=09),
+=09MTK_PIN(
+=09=09141, "GPIO141",
+=09=09MTK_EINT_FUNCTION(0, 141),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO141"),
+=09=09MTK_FUNCTION(1, "PWRAP_SPICK_I")
+=09),
+=09MTK_PIN(
+=09=09142, "GPIO142",
+=09=09MTK_EINT_FUNCTION(0, 142),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO142"),
+=09=09MTK_FUNCTION(1, "PWRAP_SPICS_B_I")
+=09),
+=09MTK_PIN(
+=09=09143, "GPIO143",
+=09=09MTK_EINT_FUNCTION(0, 143),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO143"),
+=09=09MTK_FUNCTION(1, "AUD_CLK_MOSI")
+=09),
+=09MTK_PIN(
+=09=09144, "GPIO144",
+=09=09MTK_EINT_FUNCTION(0, 144),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO144"),
+=09=09MTK_FUNCTION(1, "AUD_DAT_MISO"),
+=09=09MTK_FUNCTION(3, "AUD_DAT_MOSI")
+=09),
+=09MTK_PIN(
+=09=09145, "GPIO145",
+=09=09MTK_EINT_FUNCTION(0, 145),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO145"),
+=09=09MTK_FUNCTION(1, "AUD_DAT_MOSI"),
+=09=09MTK_FUNCTION(3, "AUD_DAT_MISO")
+=09),
+=09MTK_PIN(
+=09=09146, "GPIO146",
+=09=09MTK_EINT_FUNCTION(0, 146),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO146"),
+=09=09MTK_FUNCTION(1, "LCM_RST")
+=09),
+=09MTK_PIN(
+=09=09147, "GPIO147",
+=09=09MTK_EINT_FUNCTION(0, 147),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO147"),
+=09=09MTK_FUNCTION(1, "DSI_TE")
+=09),
+=09MTK_PIN(
+=09=09148, "GPIO148",
+=09=09MTK_EINT_FUNCTION(0, 148),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO148"),
+=09=09MTK_FUNCTION(1, "SRCLKENA")
+=09),
+=09MTK_PIN(
+=09=09149, "GPIO149",
+=09=09MTK_EINT_FUNCTION(0, 149),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO149"),
+=09=09MTK_FUNCTION(1, "WATCHDOG")
+=09),
+=09MTK_PIN(
+=09=09150, "GPIO150",
+=09=09MTK_EINT_FUNCTION(0, 150),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO150"),
+=09=09MTK_FUNCTION(1, "TDP0")
+=09),
+=09MTK_PIN(
+=09=09151, "GPIO151",
+=09=09MTK_EINT_FUNCTION(0, 151),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO151"),
+=09=09MTK_FUNCTION(1, "TDN0")
+=09),
+=09MTK_PIN(
+=09=09152, "GPIO152",
+=09=09MTK_EINT_FUNCTION(0, 152),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO152"),
+=09=09MTK_FUNCTION(1, "TDP1")
+=09),
+=09MTK_PIN(
+=09=09153, "GPIO153",
+=09=09MTK_EINT_FUNCTION(0, 153),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO153"),
+=09=09MTK_FUNCTION(1, "TDN1")
+=09),
+=09MTK_PIN(
+=09=09154, "GPIO154",
+=09=09MTK_EINT_FUNCTION(0, 154),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO154"),
+=09=09MTK_FUNCTION(1, "TCP")
+=09),
+=09MTK_PIN(
+=09=09155, "GPIO155",
+=09=09MTK_EINT_FUNCTION(0, 155),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO155"),
+=09=09MTK_FUNCTION(1, "TCN")
+=09),
+=09MTK_PIN(
+=09=09156, "GPIO156",
+=09=09MTK_EINT_FUNCTION(0, 156),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO156"),
+=09=09MTK_FUNCTION(1, "TDP2")
+=09),
+=09MTK_PIN(
+=09=09157, "GPIO157",
+=09=09MTK_EINT_FUNCTION(0, 157),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO157"),
+=09=09MTK_FUNCTION(1, "TDN2")
+=09),
+=09MTK_PIN(
+=09=09158, "GPIO158",
+=09=09MTK_EINT_FUNCTION(0, 158),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO158"),
+=09=09MTK_FUNCTION(1, "TDP3")
+=09),
+=09MTK_PIN(
+=09=09159, "GPIO159",
+=09=09MTK_EINT_FUNCTION(0, 159),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO159"),
+=09=09MTK_FUNCTION(1, "TDN3")
+=09),
+=09MTK_PIN(
+=09=09160, "GPIO160",
+=09=09MTK_EINT_FUNCTION(0, 160),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO160"),
+=09=09MTK_FUNCTION(1, "MD_SIM2_SCLK"),
+=09=09MTK_FUNCTION(2, "MD_SIM1_SCLK"),
+=09=09MTK_FUNCTION(3, "UIM0_CLK"),
+=09=09MTK_FUNCTION(4, "UIM1_CLK")
+=09),
+=09MTK_PIN(
+=09=09161, "GPIO161",
+=09=09MTK_EINT_FUNCTION(0, 161),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO161"),
+=09=09MTK_FUNCTION(1, "MD_SIM2_SRST"),
+=09=09MTK_FUNCTION(2, "MD_SIM1_SRST"),
+=09=09MTK_FUNCTION(3, "UIM0_RST"),
+=09=09MTK_FUNCTION(4, "UIM1_RST")
+=09),
+=09MTK_PIN(
+=09=09162, "GPIO162",
+=09=09MTK_EINT_FUNCTION(0, 162),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO162"),
+=09=09MTK_FUNCTION(1, "MD_SIM2_SDAT"),
+=09=09MTK_FUNCTION(2, "MD_SIM1_SDAT"),
+=09=09MTK_FUNCTION(3, "UIM0_IO"),
+=09=09MTK_FUNCTION(4, "UIM1_IO")
+=09),
+=09MTK_PIN(
+=09=09163, "GPIO163",
+=09=09MTK_EINT_FUNCTION(0, 163),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO163"),
+=09=09MTK_FUNCTION(1, "MD_SIM1_SCLK"),
+=09=09MTK_FUNCTION(2, "MD_SIM2_SCLK"),
+=09=09MTK_FUNCTION(3, "UIM1_CLK"),
+=09=09MTK_FUNCTION(4, "UIM0_CLK")
+=09),
+=09MTK_PIN(
+=09=09164, "GPIO164",
+=09=09MTK_EINT_FUNCTION(0, 164),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO164"),
+=09=09MTK_FUNCTION(1, "MD_SIM1_SRST"),
+=09=09MTK_FUNCTION(2, "MD_SIM2_SRST"),
+=09=09MTK_FUNCTION(3, "UIM1_RST"),
+=09=09MTK_FUNCTION(4, "UIM0_RST")
+=09),
+=09MTK_PIN(
+=09=09165, "GPIO165",
+=09=09MTK_EINT_FUNCTION(0, 165),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO165"),
+=09=09MTK_FUNCTION(1, "MD_SIM1_SDAT"),
+=09=09MTK_FUNCTION(2, "MD_SIM2_SDAT"),
+=09=09MTK_FUNCTION(3, "UIM1_IO"),
+=09=09MTK_FUNCTION(4, "UIM0_IO")
+=09),
+=09MTK_PIN(
+=09=09166, "GPIO166",
+=09=09MTK_EINT_FUNCTION(0, 166),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO166"),
+=09=09MTK_FUNCTION(1, "MSDC1_CMD"),
+=09=09MTK_FUNCTION(2, "LTE_MD32_JTAG_TMS"),
+=09=09MTK_FUNCTION(3, "C2K_TMS"),
+=09=09MTK_FUNCTION(4, "TDD_TMS"),
+=09=09MTK_FUNCTION(5, "CONN_DSP_JMS"),
+=09=09MTK_FUNCTION(6, "JTMS"),
+=09=09MTK_FUNCTION(7, "CONN_MCU_AICE_TMSC")
+=09),
+=09MTK_PIN(
+=09=09167, "GPIO167",
+=09=09MTK_EINT_FUNCTION(0, 167),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO167"),
+=09=09MTK_FUNCTION(1, "MSDC1_CLK"),
+=09=09MTK_FUNCTION(2, "LTE_MD32_JTAG_TCK"),
+=09=09MTK_FUNCTION(3, "C2K_TCK"),
+=09=09MTK_FUNCTION(4, "TDD_TCK"),
+=09=09MTK_FUNCTION(5, "CONN_DSP_JCK"),
+=09=09MTK_FUNCTION(6, "JTCK"),
+=09=09MTK_FUNCTION(7, "CONN_MCU_AICE_TCKC")
+=09),
+=09MTK_PIN(
+=09=09168, "GPIO168",
+=09=09MTK_EINT_FUNCTION(0, 168),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO168"),
+=09=09MTK_FUNCTION(1, "MSDC1_DAT0"),
+=09=09MTK_FUNCTION(2, "LTE_MD32_JTAG_TDI"),
+=09=09MTK_FUNCTION(3, "C2K_TDI"),
+=09=09MTK_FUNCTION(4, "TDD_TDI"),
+=09=09MTK_FUNCTION(5, "CONN_DSP_JDI"),
+=09=09MTK_FUNCTION(6, "JTDI")
+=09),
+=09MTK_PIN(
+=09=09169, "GPIO169",
+=09=09MTK_EINT_FUNCTION(0, 169),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO169"),
+=09=09MTK_FUNCTION(1, "MSDC1_DAT1"),
+=09=09MTK_FUNCTION(2, "LTE_MD32_JTAG_TDO"),
+=09=09MTK_FUNCTION(3, "C2K_TDO"),
+=09=09MTK_FUNCTION(4, "TDD_TDO"),
+=09=09MTK_FUNCTION(5, "CONN_DSP_JDO"),
+=09=09MTK_FUNCTION(6, "JTDO")
+=09),
+=09MTK_PIN(
+=09=09170, "GPIO170",
+=09=09MTK_EINT_FUNCTION(0, 170),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO170"),
+=09=09MTK_FUNCTION(1, "MSDC1_DAT2"),
+=09=09MTK_FUNCTION(2, "LTE_MD32_JTAG_TRST"),
+=09=09MTK_FUNCTION(3, "C2K_NTRST"),
+=09=09MTK_FUNCTION(4, "TDD_TRSTN"),
+=09=09MTK_FUNCTION(5, "CONN_DSP_JINTP"),
+=09=09MTK_FUNCTION(6, "DM_JTINTP")
+=09),
+=09MTK_PIN(
+=09=09171, "GPIO171",
+=09=09MTK_EINT_FUNCTION(0, 171),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO171"),
+=09=09MTK_FUNCTION(1, "MSDC1_DAT3"),
+=09=09MTK_FUNCTION(3, "C2K_RTCK")
+=09),
+=09MTK_PIN(
+=09=09172, "GPIO172",
+=09=09MTK_EINT_FUNCTION(0, 172),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO172"),
+=09=09MTK_FUNCTION(1, "MSDC0_CMD")
+=09),
+=09MTK_PIN(
+=09=09173, "GPIO173",
+=09=09MTK_EINT_FUNCTION(0, 173),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO173"),
+=09=09MTK_FUNCTION(1, "MSDC0_DSL")
+=09),
+=09MTK_PIN(
+=09=09174, "GPIO174",
+=09=09MTK_EINT_FUNCTION(0, 174),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO174"),
+=09=09MTK_FUNCTION(1, "MSDC0_CLK")
+=09),
+=09MTK_PIN(
+=09=09175, "GPIO175",
+=09=09MTK_EINT_FUNCTION(0, 175),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO175"),
+=09=09MTK_FUNCTION(1, "MSDC0_DAT0")
+=09),
+=09MTK_PIN(
+=09=09176, "GPIO176",
+=09=09MTK_EINT_FUNCTION(0, 176),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO176"),
+=09=09MTK_FUNCTION(1, "MSDC0_DAT1")
+=09),
+=09MTK_PIN(
+=09=09177, "GPIO177",
+=09=09MTK_EINT_FUNCTION(0, 177),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO177"),
+=09=09MTK_FUNCTION(1, "MSDC0_DAT2")
+=09),
+=09MTK_PIN(
+=09=09178, "GPIO178",
+=09=09MTK_EINT_FUNCTION(0, 178),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO178"),
+=09=09MTK_FUNCTION(1, "MSDC0_DAT3")
+=09),
+=09MTK_PIN(
+=09=09179, "GPIO179",
+=09=09MTK_EINT_FUNCTION(0, 179),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO179"),
+=09=09MTK_FUNCTION(1, "MSDC0_DAT4")
+=09),
+=09MTK_PIN(
+=09=09180, "GPIO180",
+=09=09MTK_EINT_FUNCTION(0, 180),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO180"),
+=09=09MTK_FUNCTION(1, "MSDC0_DAT5")
+=09),
+=09MTK_PIN(
+=09=09181, "GPIO181",
+=09=09MTK_EINT_FUNCTION(0, 181),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO181"),
+=09=09MTK_FUNCTION(1, "MSDC0_DAT6")
+=09),
+=09MTK_PIN(
+=09=09182, "GPIO182",
+=09=09MTK_EINT_FUNCTION(0, 182),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO182"),
+=09=09MTK_FUNCTION(1, "MSDC0_DAT7")
+=09),
+=09MTK_PIN(
+=09=09183, "GPIO183",
+=09=09MTK_EINT_FUNCTION(0, 183),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO183"),
+=09=09MTK_FUNCTION(1, "MSDC0_RSTB")
+=09),
+=09MTK_PIN(
+=09=09184, "GPIO184",
+=09=09MTK_EINT_FUNCTION(0, 184),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO184"),
+=09=09MTK_FUNCTION(1, "F2W_DATA"),
+=09=09MTK_FUNCTION(2, "MRG_CLK"),
+=09=09MTK_FUNCTION(3, "C2K_DM_EINT2"),
+=09=09MTK_FUNCTION(4, "PCM0_CLK")
+=09),
+=09MTK_PIN(
+=09=09185, "GPIO185",
+=09=09MTK_EINT_FUNCTION(0, 185),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO185"),
+=09=09MTK_FUNCTION(1, "F2W_CK"),
+=09=09MTK_FUNCTION(2, "MRG_DI"),
+=09=09MTK_FUNCTION(3, "C2K_DM_EINT3"),
+=09=09MTK_FUNCTION(4, "PCM0_DI")
+=09),
+=09MTK_PIN(
+=09=09186, "GPIO186",
+=09=09MTK_EINT_FUNCTION(0, 186),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO186"),
+=09=09MTK_FUNCTION(1, "WB_RSTB"),
+=09=09MTK_FUNCTION(4, "URXD3"),
+=09=09MTK_FUNCTION(5, "UTXD3")
+=09),
+=09MTK_PIN(
+=09=09187, "GPIO187",
+=09=09MTK_EINT_FUNCTION(0, 187),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO187"),
+=09=09MTK_FUNCTION(1, "WB_SCLK"),
+=09=09MTK_FUNCTION(2, "MRG_DO"),
+=09=09MTK_FUNCTION(4, "PCM0_DO")
+=09),
+=09MTK_PIN(
+=09=09188, "GPIO188",
+=09=09MTK_EINT_FUNCTION(0, 188),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO188"),
+=09=09MTK_FUNCTION(1, "WB_SDATA"),
+=09=09MTK_FUNCTION(2, "MRG_SYNC"),
+=09=09MTK_FUNCTION(4, "PCM0_SYNC")
+=09),
+=09MTK_PIN(
+=09=09189, "GPIO189",
+=09=09MTK_EINT_FUNCTION(0, 189),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO189"),
+=09=09MTK_FUNCTION(1, "WB_SEN"),
+=09=09MTK_FUNCTION(4, "UTXD3"),
+=09=09MTK_FUNCTION(5, "URXD3")
+=09),
+=09MTK_PIN(
+=09=09190, "GPIO190",
+=09=09MTK_EINT_FUNCTION(0, 190),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO190"),
+=09=09MTK_FUNCTION(1, "GPS_RXQN")
+=09),
+=09MTK_PIN(
+=09=09191, "GPIO191",
+=09=09MTK_EINT_FUNCTION(0, 191),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO191"),
+=09=09MTK_FUNCTION(1, "GPS_RXQP")
+=09),
+=09MTK_PIN(
+=09=09192, "GPIO192",
+=09=09MTK_EINT_FUNCTION(0, 192),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO192"),
+=09=09MTK_FUNCTION(1, "GPS_RXIN")
+=09),
+=09MTK_PIN(
+=09=09193, "GPIO193",
+=09=09MTK_EINT_FUNCTION(0, 193),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO193"),
+=09=09MTK_FUNCTION(1, "GPS_RXIP")
+=09),
+=09MTK_PIN(
+=09=09194, "GPIO194",
+=09=09MTK_EINT_FUNCTION(0, 194),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO194"),
+=09=09MTK_FUNCTION(1, "WB_RXQN")
+=09),
+=09MTK_PIN(
+=09=09195, "GPIO195",
+=09=09MTK_EINT_FUNCTION(0, 195),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO195"),
+=09=09MTK_FUNCTION(1, "WB_RXQP")
+=09),
+=09MTK_PIN(
+=09=09196, "GPIO196",
+=09=09MTK_EINT_FUNCTION(0, 196),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO196"),
+=09=09MTK_FUNCTION(1, "WB_RXIN")
+=09),
+=09MTK_PIN(
+=09=09197, "GPIO197",
+=09=09MTK_EINT_FUNCTION(0, 197),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO197"),
+=09=09MTK_FUNCTION(1, "WB_RXIP")
+=09),
+=09MTK_PIN(
+=09=09198, "GPIO198",
+=09=09MTK_EINT_FUNCTION(0, 198),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO198"),
+=09=09MTK_FUNCTION(1, "MSDC2_CMD"),
+=09=09MTK_FUNCTION(2, "SDA1"),
+=09=09MTK_FUNCTION(3, "C2K_UART0_RXD"),
+=09=09MTK_FUNCTION(4, "C2K_TMS"),
+=09=09MTK_FUNCTION(5, "ANT_SEL6"),
+=09=09MTK_FUNCTION(7, "DM_OTMS")
+=09),
+=09MTK_PIN(
+=09=09199, "GPIO199",
+=09=09MTK_EINT_FUNCTION(0, 199),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO199"),
+=09=09MTK_FUNCTION(1, "MSDC2_CLK"),
+=09=09MTK_FUNCTION(2, "SCL1"),
+=09=09MTK_FUNCTION(3, "C2K_UART0_TXD"),
+=09=09MTK_FUNCTION(4, "C2K_TCK"),
+=09=09MTK_FUNCTION(5, "ANT_SEL7"),
+=09=09MTK_FUNCTION(6, "TDD_TXD"),
+=09=09MTK_FUNCTION(7, "DM_OTCK")
+=09),
+=09MTK_PIN(
+=09=09200, "GPIO200",
+=09=09MTK_EINT_FUNCTION(0, 200),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO200"),
+=09=09MTK_FUNCTION(1, "MSDC2_DAT0"),
+=09=09MTK_FUNCTION(2, "ANT_SEL6"),
+=09=09MTK_FUNCTION(3, "GPS_FRAME_SYNC"),
+=09=09MTK_FUNCTION(4, "C2K_TDI"),
+=09=09MTK_FUNCTION(5, "UTXD0"),
+=09=09MTK_FUNCTION(7, "DM_OTDI")
+=09),
+=09MTK_PIN(
+=09=09201, "GPIO201",
+=09=09MTK_EINT_FUNCTION(0, 201),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO201"),
+=09=09MTK_FUNCTION(1, "MSDC2_DAT1"),
+=09=09MTK_FUNCTION(2, "ANT_SEL3"),
+=09=09MTK_FUNCTION(3, "PWM0"),
+=09=09MTK_FUNCTION(4, "C2K_TDO"),
+=09=09MTK_FUNCTION(5, "URXD0"),
+=09=09MTK_FUNCTION(7, "DM_OTDO")
+=09),
+=09MTK_PIN(
+=09=09202, "GPIO202",
+=09=09MTK_EINT_FUNCTION(0, 202),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO202"),
+=09=09MTK_FUNCTION(1, "MSDC2_DAT2"),
+=09=09MTK_FUNCTION(2, "ANT_SEL4"),
+=09=09MTK_FUNCTION(3, "SDA2"),
+=09=09MTK_FUNCTION(4, "C2K_NTRST"),
+=09=09MTK_FUNCTION(5, "UTXD1"),
+=09=09MTK_FUNCTION(6, "KCOL3"),
+=09=09MTK_FUNCTION(7, "DM_JTINTP")
+=09),
+=09MTK_PIN(
+=09=09203, "GPIO203",
+=09=09MTK_EINT_FUNCTION(0, 203),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO203"),
+=09=09MTK_FUNCTION(1, "MSDC2_DAT3"),
+=09=09MTK_FUNCTION(2, "ANT_SEL5"),
+=09=09MTK_FUNCTION(3, "SCL2"),
+=09=09MTK_FUNCTION(4, "C2K_RTCK"),
+=09=09MTK_FUNCTION(5, "URXD1"),
+=09=09MTK_FUNCTION(6, "KCOL6")
+=09),
+=09MTK_PIN(
+=09=09204, "GPIO204",
+=09=09MTK_EINT_FUNCTION(0, 204),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, NULL)
+=09),
+=09MTK_PIN(
+=09=09205, "GPIO205",
+=09=09MTK_EINT_FUNCTION(0, 205),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, NULL)
+=09),
+=09MTK_PIN(
+=09=09206, "GPIO206",
+=09=09MTK_EINT_FUNCTION(0, 206),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, NULL)
+=09),
+=09MTK_PIN(
+=09=09207, "GPIO207",
+=09=09MTK_EINT_FUNCTION(0, 207),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, NULL)
+=09),
+=09MTK_PIN(
+=09=09208, "GPIO208",
+=09=09MTK_EINT_FUNCTION(0, 208),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, NULL)
+=09),
+=09MTK_PIN(
+=09=09209, "GPIO209",
+=09=09MTK_EINT_FUNCTION(0, 209),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, NULL)
+=09),
+=09MTK_PIN(
+=09=09210, "GPIO210",
+=09=09MTK_EINT_FUNCTION(0, 210),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, NULL)
+=09),
+=09MTK_PIN(
+=09=09211, "GPIO211",
+=09=09MTK_EINT_FUNCTION(0, 211),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, NULL)
+=09),
+=09MTK_PIN(
+=09=09212, "GPIO212",
+=09=09MTK_EINT_FUNCTION(0, 212),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, NULL)
+=09),
+};
+
+static const struct mtk_pin_desc mtk_pins_mt6735m[] =3D {
+=09MTK_PIN(
+=09=090, "GPIO0",
+=09=09MTK_EINT_FUNCTION(0, 0),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO0"),
+=09=09MTK_FUNCTION(1, "IDDIG"),
+=09=09MTK_FUNCTION(2, "DPI_D4"),
+=09=09MTK_FUNCTION(3, "CLKM4"),
+=09=09MTK_FUNCTION(4, "EXT_FRAME_SYNC"),
+=09=09MTK_FUNCTION(5, "PWM3"),
+=09=09MTK_FUNCTION(6, "KCOL2"),
+=09=09MTK_FUNCTION(7, "C2K_ARM_EINT0")
+=09),
+=09MTK_PIN(
+=09=091, "GPIO1",
+=09=09MTK_EINT_FUNCTION(0, 1),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO1"),
+=09=09MTK_FUNCTION(1, "PWM2"),
+=09=09MTK_FUNCTION(2, "DPI_D5"),
+=09=09MTK_FUNCTION(3, "MD_EINT0"),
+=09=09MTK_FUNCTION(4, "TDD_TDO"),
+=09=09MTK_FUNCTION(5, "CONN_MCU_TDO"),
+=09=09MTK_FUNCTION(6, "PTA_RXD"),
+=09=09MTK_FUNCTION(7, "C2K_ARM_EINT1")
+=09),
+=09MTK_PIN(
+=09=092, "GPIO2",
+=09=09MTK_EINT_FUNCTION(0, 2),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO2"),
+=09=09MTK_FUNCTION(1, "CLKM0"),
+=09=09MTK_FUNCTION(2, "DPI_D6"),
+=09=09MTK_FUNCTION(3, "MD_EINT0"),
+=09=09MTK_FUNCTION(4, "USB_DRVVBUS"),
+=09=09MTK_FUNCTION(5, "CONN_MCU_DBGACK_N"),
+=09=09MTK_FUNCTION(6, "PTA_TXD"),
+=09=09MTK_FUNCTION(7, "C2K_ARM_EINT2")
+=09),
+=09MTK_PIN(
+=09=093, "GPIO3",
+=09=09MTK_EINT_FUNCTION(0, 3),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO3"),
+=09=09MTK_FUNCTION(1, "CLKM1"),
+=09=09MTK_FUNCTION(2, "DPI_D7"),
+=09=09MTK_FUNCTION(3, "SPI_MIB"),
+=09=09MTK_FUNCTION(4, "MD_EINT0"),
+=09=09MTK_FUNCTION(5, "CONN_MCU_DBGI_N"),
+=09=09MTK_FUNCTION(6, "CONN_MCU_AICE_TMSC"),
+=09=09MTK_FUNCTION(7, "C2K_ARM_EINT3")
+=09),
+=09MTK_PIN(
+=09=094, "GPIO4",
+=09=09MTK_EINT_FUNCTION(0, 4),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO4"),
+=09=09MTK_FUNCTION(1, "CLKM2"),
+=09=09MTK_FUNCTION(2, "DPI_D8"),
+=09=09MTK_FUNCTION(3, "SPI_MOB"),
+=09=09MTK_FUNCTION(4, "TDD_TCK"),
+=09=09MTK_FUNCTION(5, "CONN_MCU_TCK_0"),
+=09=09MTK_FUNCTION(6, "CONN_MCU_AICE_TCKC"),
+=09=09MTK_FUNCTION(7, "C2K_DM_EINT0")
+=09),
+=09MTK_PIN(
+=09=095, "GPIO5",
+=09=09MTK_EINT_FUNCTION(0, 5),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO5"),
+=09=09MTK_FUNCTION(1, "UCTS2"),
+=09=09MTK_FUNCTION(2, "DPI_D9"),
+=09=09MTK_FUNCTION(3, "SPI_CSB"),
+=09=09MTK_FUNCTION(4, "TDD_TDI"),
+=09=09MTK_FUNCTION(5, "CONN_MCU_TDI"),
+=09=09MTK_FUNCTION(6, "I2S1_DO"),
+=09=09MTK_FUNCTION(7, "MD_URXD")
+=09),
+=09MTK_PIN(
+=09=096, "GPIO6",
+=09=09MTK_EINT_FUNCTION(0, 6),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO6"),
+=09=09MTK_FUNCTION(1, "URTS2"),
+=09=09MTK_FUNCTION(2, "DPI_D10"),
+=09=09MTK_FUNCTION(3, "SPI_CKB"),
+=09=09MTK_FUNCTION(4, "TDD_TRSTN"),
+=09=09MTK_FUNCTION(5, "CONN_MCU_TRST_B"),
+=09=09MTK_FUNCTION(6, "I2S1_LRCK"),
+=09=09MTK_FUNCTION(7, "MD_UTXD")
+=09),
+=09MTK_PIN(
+=09=097, "GPIO7",
+=09=09MTK_EINT_FUNCTION(0, 7),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO7"),
+=09=09MTK_FUNCTION(1, "UCTS3"),
+=09=09MTK_FUNCTION(2, "DPI_D11"),
+=09=09MTK_FUNCTION(3, "SDA1"),
+=09=09MTK_FUNCTION(4, "TDD_TMS"),
+=09=09MTK_FUNCTION(5, "CONN_MCU_TMS"),
+=09=09MTK_FUNCTION(6, "I2S1_BCK"),
+=09=09MTK_FUNCTION(7, "TDD_TXD")
+=09),
+=09MTK_PIN(
+=09=098, "GPIO8",
+=09=09MTK_EINT_FUNCTION(0, 8),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO8"),
+=09=09MTK_FUNCTION(1, "URTS3"),
+=09=09MTK_FUNCTION(2, "C2K_UIM0_HOT_PLUG_IN"),
+=09=09MTK_FUNCTION(3, "SCL1"),
+=09=09MTK_FUNCTION(4, "PCM1_DO1"),
+=09=09MTK_FUNCTION(5, "MD_EINT1"),
+=09=09MTK_FUNCTION(6, "KCOL4"),
+=09=09MTK_FUNCTION(7, "UTXD0")
+=09),
+=09MTK_PIN(
+=09=099, "GPIO9",
+=09=09MTK_EINT_FUNCTION(0, 9),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO9"),
+=09=09MTK_FUNCTION(1, "C2K_UIM1_HOT_PLUG_IN"),
+=09=09MTK_FUNCTION(2, "PCM1_DO0"),
+=09=09MTK_FUNCTION(3, "I2S3_MCK"),
+=09=09MTK_FUNCTION(4, "MD_EINT2"),
+=09=09MTK_FUNCTION(5, "CLKM2"),
+=09=09MTK_FUNCTION(6, "I2S1_MCK"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A29")
+=09),
+=09MTK_PIN(
+=09=0910, "GPIO10",
+=09=09MTK_EINT_FUNCTION(0, 10),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO10"),
+=09=09MTK_FUNCTION(1, "PWM1"),
+=09=09MTK_FUNCTION(2, "CLKM1"),
+=09=09MTK_FUNCTION(3, "KROW2"),
+=09=09MTK_FUNCTION(4, "MD_EINT0"),
+=09=09MTK_FUNCTION(5, "I2S1_MCK"),
+=09=09MTK_FUNCTION(6, "SDA3"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A30")
+=09),
+=09MTK_PIN(
+=09=0911, "GPIO11",
+=09=09MTK_EINT_FUNCTION(0, 11),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO11"),
+=09=09MTK_FUNCTION(1, "MD_EINT1"),
+=09=09MTK_FUNCTION(2, "IRTX_OUT"),
+=09=09MTK_FUNCTION(3, "C2K_UIM0_HOT_PLUG_IN"),
+=09=09MTK_FUNCTION(4, "CLKM0"),
+=09=09MTK_FUNCTION(5, "I2S2_MCK"),
+=09=09MTK_FUNCTION(6, "SCL3"),
+=09=09MTK_FUNCTION(7, "URXD0")
+=09),
+=09MTK_PIN(
+=09=0912, "GPIO12",
+=09=09MTK_EINT_FUNCTION(0, 12),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO12"),
+=09=09MTK_FUNCTION(1, "I2S0_MCK"),
+=09=09MTK_FUNCTION(2, "C2K_UIM1_HOT_PLUG_IN"),
+=09=09MTK_FUNCTION(3, "KCOL2"),
+=09=09MTK_FUNCTION(4, "MD_EINT2"),
+=09=09MTK_FUNCTION(5, "IRTX_OUT"),
+=09=09MTK_FUNCTION(6, "SRCLKENAI2"),
+=09=09MTK_FUNCTION(7, "PCM1_DO1")
+=09),
+=09MTK_PIN(
+=09=0913, "GPIO13",
+=09=09MTK_EINT_FUNCTION(0, 13),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO13"),
+=09=09MTK_FUNCTION(1, "WB_CTRL0"),
+=09=09MTK_FUNCTION(3, "C2K_ARM_EINT0"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A0")
+=09),
+=09MTK_PIN(
+=09=0914, "GPIO14",
+=09=09MTK_EINT_FUNCTION(0, 14),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO14"),
+=09=09MTK_FUNCTION(1, "WB_CTRL1"),
+=09=09MTK_FUNCTION(3, "C2K_ARM_EINT1"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A1")
+=09),
+=09MTK_PIN(
+=09=0915, "GPIO15",
+=09=09MTK_EINT_FUNCTION(0, 15),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO15"),
+=09=09MTK_FUNCTION(1, "WB_CTRL2"),
+=09=09MTK_FUNCTION(3, "C2K_ARM_EINT2"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A2")
+=09),
+=09MTK_PIN(
+=09=0916, "GPIO16",
+=09=09MTK_EINT_FUNCTION(0, 16),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO16"),
+=09=09MTK_FUNCTION(1, "WB_CTRL3"),
+=09=09MTK_FUNCTION(3, "C2K_ARM_EINT3"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A3")
+=09),
+=09MTK_PIN(
+=09=0917, "GPIO17",
+=09=09MTK_EINT_FUNCTION(0, 17),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO17"),
+=09=09MTK_FUNCTION(1, "WB_CTRL4"),
+=09=09MTK_FUNCTION(3, "C2K_DM_EINT0"),
+=09=09MTK_FUNCTION(4, "WATCHDOG"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A4")
+=09),
+=09MTK_PIN(
+=09=0918, "GPIO18",
+=09=09MTK_EINT_FUNCTION(0, 18),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO18"),
+=09=09MTK_FUNCTION(1, "WB_CTRL5"),
+=09=09MTK_FUNCTION(3, "C2K_DM_EINT1"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A5")
+=09),
+=09MTK_PIN(
+=09=0919, "GPIO19",
+=09=09MTK_EINT_FUNCTION(0, 19),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO19"),
+=09=09MTK_FUNCTION(1, "ANT_SEL0"),
+=09=09MTK_FUNCTION(2, "IRTX_OUT"),
+=09=09MTK_FUNCTION(3, "IRDA_TX"),
+=09=09MTK_FUNCTION(4, "C2K_UART0_TXD"),
+=09=09MTK_FUNCTION(5, "GPS_FRAME_SYNC"),
+=09=09MTK_FUNCTION(6, "LTE_UTXD"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A6")
+=09),
+=09MTK_PIN(
+=09=0920, "GPIO20",
+=09=09MTK_EINT_FUNCTION(0, 20),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO20"),
+=09=09MTK_FUNCTION(1, "ANT_SEL1"),
+=09=09MTK_FUNCTION(2, "C2K_UIM1_HOT_PLUG_IN"),
+=09=09MTK_FUNCTION(3, "IRDA_RX"),
+=09=09MTK_FUNCTION(4, "C2K_UART0_RXD"),
+=09=09MTK_FUNCTION(5, "MD_EINT2"),
+=09=09MTK_FUNCTION(6, "LTE_URXD"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A7")
+=09),
+=09MTK_PIN(
+=09=0921, "GPIO21",
+=09=09MTK_EINT_FUNCTION(0, 21),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO21"),
+=09=09MTK_FUNCTION(1, "ANT_SEL2"),
+=09=09MTK_FUNCTION(2, "PWM2"),
+=09=09MTK_FUNCTION(3, "IRDA_PDN"),
+=09=09MTK_FUNCTION(4, "CORESONIC_SWCK"),
+=09=09MTK_FUNCTION(5, "MD_EINT1"),
+=09=09MTK_FUNCTION(6, "C2K_UIM0_HOT_PLUG_IN"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A8")
+=09),
+=09MTK_PIN(
+=09=0922, "GPIO22",
+=09=09MTK_EINT_FUNCTION(0, 22),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO22"),
+=09=09MTK_FUNCTION(1, "RDN0")
+=09),
+=09MTK_PIN(
+=09=0923, "GPIO23",
+=09=09MTK_EINT_FUNCTION(0, 23),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO23"),
+=09=09MTK_FUNCTION(1, "RDP0")
+=09),
+=09MTK_PIN(
+=09=0924, "GPIO24",
+=09=09MTK_EINT_FUNCTION(0, 24),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO24"),
+=09=09MTK_FUNCTION(1, "RDN1")
+=09),
+=09MTK_PIN(
+=09=0925, "GPIO25",
+=09=09MTK_EINT_FUNCTION(0, 25),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO25"),
+=09=09MTK_FUNCTION(1, "RDP1")
+=09),
+=09MTK_PIN(
+=09=0926, "GPIO26",
+=09=09MTK_EINT_FUNCTION(0, 26),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO26"),
+=09=09MTK_FUNCTION(1, "RCN")
+=09),
+=09MTK_PIN(
+=09=0927, "GPIO27",
+=09=09MTK_EINT_FUNCTION(0, 27),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO27"),
+=09=09MTK_FUNCTION(1, "RCP")
+=09),
+=09MTK_PIN(
+=09=0928, "GPIO28",
+=09=09MTK_EINT_FUNCTION(0, 28),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO28"),
+=09=09MTK_FUNCTION(1, "RDN2")
+=09),
+=09MTK_PIN(
+=09=0929, "GPIO29",
+=09=09MTK_EINT_FUNCTION(0, 29),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO29"),
+=09=09MTK_FUNCTION(1, "RDP2")
+=09),
+=09MTK_PIN(
+=09=0930, "GPIO30",
+=09=09MTK_EINT_FUNCTION(0, 30),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO30"),
+=09=09MTK_FUNCTION(1, "RDN3")
+=09),
+=09MTK_PIN(
+=09=0931, "GPIO31",
+=09=09MTK_EINT_FUNCTION(0, 31),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO31"),
+=09=09MTK_FUNCTION(1, "RDP3")
+=09),
+=09MTK_PIN(
+=09=0932, "GPIO32",
+=09=09MTK_EINT_FUNCTION(0, 32),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO32"),
+=09=09MTK_FUNCTION(1, "RDN0_A"),
+=09=09MTK_FUNCTION(2, "CMHSYNC"),
+=09=09MTK_FUNCTION(3, "CMCSD0")
+=09),
+=09MTK_PIN(
+=09=0933, "GPIO33",
+=09=09MTK_EINT_FUNCTION(0, 33),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO33"),
+=09=09MTK_FUNCTION(1, "RDP0_A"),
+=09=09MTK_FUNCTION(2, "CMVSYNC"),
+=09=09MTK_FUNCTION(3, "CMCSD1")
+=09),
+=09MTK_PIN(
+=09=0934, "GPIO34",
+=09=09MTK_EINT_FUNCTION(0, 34),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO34"),
+=09=09MTK_FUNCTION(1, "RDN1_A"),
+=09=09MTK_FUNCTION(2, "CMDAT9"),
+=09=09MTK_FUNCTION(3, "CMCSD2")
+=09),
+=09MTK_PIN(
+=09=0935, "GPIO35",
+=09=09MTK_EINT_FUNCTION(0, 35),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO35"),
+=09=09MTK_FUNCTION(1, "RDP1_A"),
+=09=09MTK_FUNCTION(2, "CMDAT8"),
+=09=09MTK_FUNCTION(3, "CMCSD3")
+=09),
+=09MTK_PIN(
+=09=0936, "GPIO36",
+=09=09MTK_EINT_FUNCTION(0, 36),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO36"),
+=09=09MTK_FUNCTION(1, "RCN_A"),
+=09=09MTK_FUNCTION(2, "CMDAT7")
+=09),
+=09MTK_PIN(
+=09=0937, "GPIO37",
+=09=09MTK_EINT_FUNCTION(0, 37),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO37"),
+=09=09MTK_FUNCTION(1, "RCP_A"),
+=09=09MTK_FUNCTION(2, "CMDAT6")
+=09),
+=09MTK_PIN(
+=09=0938, "GPIO38",
+=09=09MTK_EINT_FUNCTION(0, 38),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO38"),
+=09=09MTK_FUNCTION(1, "RDN2_A"),
+=09=09MTK_FUNCTION(2, "CMDAT5")
+=09),
+=09MTK_PIN(
+=09=0939, "GPIO39",
+=09=09MTK_EINT_FUNCTION(0, 39),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO39"),
+=09=09MTK_FUNCTION(1, "RDP2_A"),
+=09=09MTK_FUNCTION(2, "CMDAT4")
+=09),
+=09MTK_PIN(
+=09=0940, "GPIO40",
+=09=09MTK_EINT_FUNCTION(0, 40),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO40"),
+=09=09MTK_FUNCTION(1, "RDN3_A"),
+=09=09MTK_FUNCTION(2, "CMDAT3")
+=09),
+=09MTK_PIN(
+=09=0941, "GPIO41",
+=09=09MTK_EINT_FUNCTION(0, 41),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO41"),
+=09=09MTK_FUNCTION(1, "RDP3_A"),
+=09=09MTK_FUNCTION(2, "CMDAT2")
+=09),
+=09MTK_PIN(
+=09=0942, "GPIO42",
+=09=09MTK_EINT_FUNCTION(0, 42),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO42"),
+=09=09MTK_FUNCTION(1, "CMDAT0"),
+=09=09MTK_FUNCTION(2, "CMCSD0"),
+=09=09MTK_FUNCTION(3, "CMMCLK1"),
+=09=09MTK_FUNCTION(5, "ANT_SEL5"),
+=09=09MTK_FUNCTION(6, "CLKM5"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A9")
+=09),
+=09MTK_PIN(
+=09=0943, "GPIO43",
+=09=09MTK_EINT_FUNCTION(0, 43),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO43"),
+=09=09MTK_FUNCTION(1, "CMDAT1"),
+=09=09MTK_FUNCTION(2, "CMCSD1"),
+=09=09MTK_FUNCTION(3, "CMFLASH"),
+=09=09MTK_FUNCTION(4, "MD_EINT0"),
+=09=09MTK_FUNCTION(5, "CMMCLK1"),
+=09=09MTK_FUNCTION(6, "CLKM4"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A10")
+=09),
+=09MTK_PIN(
+=09=0944, "GPIO44",
+=09=09MTK_EINT_FUNCTION(0, 44),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO44"),
+=09=09MTK_FUNCTION(1, "CMPCLK"),
+=09=09MTK_FUNCTION(2, "CMCSK"),
+=09=09MTK_FUNCTION(3, "CMCSD2"),
+=09=09MTK_FUNCTION(4, "KCOL3"),
+=09=09MTK_FUNCTION(5, "SRCLKENAI2"),
+=09=09MTK_FUNCTION(6, "PWM0"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A11")
+=09),
+=09MTK_PIN(
+=09=0945, "GPIO45",
+=09=09MTK_EINT_FUNCTION(0, 45),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO45"),
+=09=09MTK_FUNCTION(1, "CMMCLK0"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A12")
+=09),
+=09MTK_PIN(
+=09=0946, "GPIO46",
+=09=09MTK_EINT_FUNCTION(0, 46),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO46"),
+=09=09MTK_FUNCTION(1, "CMMCLK1"),
+=09=09MTK_FUNCTION(2, "IDDIG"),
+=09=09MTK_FUNCTION(3, "LTE_MD32_JTAG_TRST"),
+=09=09MTK_FUNCTION(4, "TDD_TRSTN"),
+=09=09MTK_FUNCTION(5, "DM_JTINTP"),
+=09=09MTK_FUNCTION(6, "KCOL6"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A13")
+=09),
+=09MTK_PIN(
+=09=0947, "GPIO47",
+=09=09MTK_EINT_FUNCTION(0, 47),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, "GPIO47"),
+=09=09MTK_FUNCTION(1, "SDA0")
+=09),
+=09MTK_PIN(
+=09=0948, "GPIO48",
+=09=09MTK_EINT_FUNCTION(0, 48),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, "GPIO48"),
+=09=09MTK_FUNCTION(1, "SCL0")
+=09),
+=09MTK_PIN(
+=09=0949, "GPIO49",
+=09=09MTK_EINT_FUNCTION(0, 49),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, "GPIO49"),
+=09=09MTK_FUNCTION(1, "SDA1")
+=09),
+=09MTK_PIN(
+=09=0950, "GPIO50",
+=09=09MTK_EINT_FUNCTION(0, 50),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, "GPIO50"),
+=09=09MTK_FUNCTION(1, "SCL1")
+=09),
+=09MTK_PIN(
+=09=0951, "GPIO51",
+=09=09MTK_EINT_FUNCTION(0, 51),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, "GPIO51"),
+=09=09MTK_FUNCTION(1, "SDA2")
+=09),
+=09MTK_PIN(
+=09=0952, "GPIO52",
+=09=09MTK_EINT_FUNCTION(0, 52),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, "GPIO52"),
+=09=09MTK_FUNCTION(1, "SCL2")
+=09),
+=09MTK_PIN(
+=09=0953, "GPIO53",
+=09=09MTK_EINT_FUNCTION(0, 53),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, "GPIO53"),
+=09=09MTK_FUNCTION(1, "SDA3"),
+=09=09MTK_FUNCTION(3, "IDDIG"),
+=09=09MTK_FUNCTION(5, "MD_EINT2"),
+=09=09MTK_FUNCTION(6, "C2K_UIM1_HOT_PLUG_IN")
+=09),
+=09MTK_PIN(
+=09=0954, "GPIO54",
+=09=09MTK_EINT_FUNCTION(0, 54),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, "GPIO54"),
+=09=09MTK_FUNCTION(1, "SCL3"),
+=09=09MTK_FUNCTION(3, "IDDIG"),
+=09=09MTK_FUNCTION(5, "MD_EINT1"),
+=09=09MTK_FUNCTION(6, "C2K_UIM0_HOT_PLUG_IN")
+=09),
+=09MTK_PIN(
+=09=0955, "GPIO55",
+=09=09MTK_EINT_FUNCTION(0, 55),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO55"),
+=09=09MTK_FUNCTION(1, "SRCLKENAI0"),
+=09=09MTK_FUNCTION(2, "PWM2"),
+=09=09MTK_FUNCTION(3, "CLKM5"),
+=09=09MTK_FUNCTION(4, "CORESONIC_SWD"),
+=09=09MTK_FUNCTION(5, "ANT_SEL6"),
+=09=09MTK_FUNCTION(6, "KROW5"),
+=09=09MTK_FUNCTION(7, "DISP_PWM")
+=09),
+=09MTK_PIN(
+=09=0956, "GPIO56",
+=09=09MTK_EINT_FUNCTION(0, 56),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO56"),
+=09=09MTK_FUNCTION(1, "SRCLKENA1")
+=09),
+=09MTK_PIN(
+=09=0957, "GPIO57",
+=09=09MTK_EINT_FUNCTION(0, 57),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO57"),
+=09=09MTK_FUNCTION(1, "URXD2"),
+=09=09MTK_FUNCTION(2, "DPI_HSYNC0"),
+=09=09MTK_FUNCTION(3, "UTXD2"),
+=09=09MTK_FUNCTION(4, "MD_URXD"),
+=09=09MTK_FUNCTION(5, "SRCLKENAI1"),
+=09=09MTK_FUNCTION(6, "KROW4"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A14")
+=09),
+=09MTK_PIN(
+=09=0958, "GPIO58",
+=09=09MTK_EINT_FUNCTION(0, 58),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO58"),
+=09=09MTK_FUNCTION(1, "UTXD2"),
+=09=09MTK_FUNCTION(2, "DPI_VSYNC0"),
+=09=09MTK_FUNCTION(3, "URXD2"),
+=09=09MTK_FUNCTION(4, "MD_UTXD"),
+=09=09MTK_FUNCTION(5, "TDD_TXD"),
+=09=09MTK_FUNCTION(6, "KROW5"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A15")
+=09),
+=09MTK_PIN(
+=09=0959, "GPIO59",
+=09=09MTK_EINT_FUNCTION(0, 59),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO59"),
+=09=09MTK_FUNCTION(1, "URXD3"),
+=09=09MTK_FUNCTION(2, "DPI_CK0"),
+=09=09MTK_FUNCTION(3, "UTXD3"),
+=09=09MTK_FUNCTION(4, "UCTS2"),
+=09=09MTK_FUNCTION(5, "PWM3"),
+=09=09MTK_FUNCTION(6, "KROW6"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A16")
+=09),
+=09MTK_PIN(
+=09=0960, "GPIO60",
+=09=09MTK_EINT_FUNCTION(0, 60),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO60"),
+=09=09MTK_FUNCTION(1, "UTXD3"),
+=09=09MTK_FUNCTION(2, "DPI_DE0"),
+=09=09MTK_FUNCTION(3, "URXD3"),
+=09=09MTK_FUNCTION(4, "URTS2"),
+=09=09MTK_FUNCTION(5, "PWM4"),
+=09=09MTK_FUNCTION(6, "KROW7"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A17")
+=09),
+=09MTK_PIN(
+=09=0961, "GPIO61",
+=09=09MTK_EINT_FUNCTION(0, 61),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO61"),
+=09=09MTK_FUNCTION(1, "PCM1_CLK"),
+=09=09MTK_FUNCTION(2, "DPI_D0"),
+=09=09MTK_FUNCTION(3, "I2S0_BCK"),
+=09=09MTK_FUNCTION(4, "KROW4"),
+=09=09MTK_FUNCTION(5, "ANT_SEL3"),
+=09=09MTK_FUNCTION(6, "IRTX_OUT"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A18")
+=09),
+=09MTK_PIN(
+=09=0962, "GPIO62",
+=09=09MTK_EINT_FUNCTION(0, 62),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO62"),
+=09=09MTK_FUNCTION(1, "PCM1_SYNC"),
+=09=09MTK_FUNCTION(2, "DPI_D1"),
+=09=09MTK_FUNCTION(3, "I2S0_LRCK"),
+=09=09MTK_FUNCTION(4, "KCOL7"),
+=09=09MTK_FUNCTION(5, "CLKM3"),
+=09=09MTK_FUNCTION(6, "CMFLASH"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A19")
+=09),
+=09MTK_PIN(
+=09=0963, "GPIO63",
+=09=09MTK_EINT_FUNCTION(0, 63),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO63"),
+=09=09MTK_FUNCTION(1, "PCM1_DI"),
+=09=09MTK_FUNCTION(2, "DPI_D2"),
+=09=09MTK_FUNCTION(3, "I2S0_DI"),
+=09=09MTK_FUNCTION(4, "PCM1_DO0"),
+=09=09MTK_FUNCTION(5, "CLKM5"),
+=09=09MTK_FUNCTION(6, "KROW3"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A20")
+=09),
+=09MTK_PIN(
+=09=0964, "GPIO64",
+=09=09MTK_EINT_FUNCTION(0, 64),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO64"),
+=09=09MTK_FUNCTION(1, "PCM1_DO0"),
+=09=09MTK_FUNCTION(2, "DPI_D3"),
+=09=09MTK_FUNCTION(3, "I2S0_MCK"),
+=09=09MTK_FUNCTION(4, "PCM1_DI"),
+=09=09MTK_FUNCTION(5, "SRCLKENAI2"),
+=09=09MTK_FUNCTION(6, "KCOL5"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A21")
+=09),
+=09MTK_PIN(
+=09=0965, "GPIO65",
+=09=09MTK_EINT_FUNCTION(0, 65),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO65"),
+=09=09MTK_FUNCTION(1, "SPI_CSA"),
+=09=09MTK_FUNCTION(2, "EXT_FRAME_SYNC"),
+=09=09MTK_FUNCTION(3, "I2S3_MCK"),
+=09=09MTK_FUNCTION(4, "KROW2"),
+=09=09MTK_FUNCTION(5, "GPS_FRAME_SYNC"),
+=09=09MTK_FUNCTION(6, "PTA_RXD"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A22")
+=09),
+=09MTK_PIN(
+=09=0966, "GPIO66",
+=09=09MTK_EINT_FUNCTION(0, 66),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO66"),
+=09=09MTK_FUNCTION(1, "SPI_CKA"),
+=09=09MTK_FUNCTION(2, "USB_DRVVBUS"),
+=09=09MTK_FUNCTION(3, "I2S3_BCK"),
+=09=09MTK_FUNCTION(4, "KCOL2"),
+=09=09MTK_FUNCTION(6, "PTA_TXD"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A23")
+=09),
+=09MTK_PIN(
+=09=0967, "GPIO67",
+=09=09MTK_EINT_FUNCTION(0, 67),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO67"),
+=09=09MTK_FUNCTION(1, "SPI_MIA"),
+=09=09MTK_FUNCTION(2, "SPI_MOA"),
+=09=09MTK_FUNCTION(3, "I2S3_DO"),
+=09=09MTK_FUNCTION(4, "PTA_RXD"),
+=09=09MTK_FUNCTION(5, "IDDIG"),
+=09=09MTK_FUNCTION(6, "UCTS1"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A24")
+=09),
+=09MTK_PIN(
+=09=0968, "GPIO68",
+=09=09MTK_EINT_FUNCTION(0, 68),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO68"),
+=09=09MTK_FUNCTION(1, "SPI_MOA"),
+=09=09MTK_FUNCTION(2, "SPI_MIA"),
+=09=09MTK_FUNCTION(3, "I2S3_LRCK"),
+=09=09MTK_FUNCTION(4, "PTA_TXD"),
+=09=09MTK_FUNCTION(5, "ANT_SEL4"),
+=09=09MTK_FUNCTION(6, "URTS1"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A25")
+=09),
+=09MTK_PIN(
+=09=0969, "GPIO69",
+=09=09MTK_EINT_FUNCTION(0, 69),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO69"),
+=09=09MTK_FUNCTION(1, "DISP_PWM"),
+=09=09MTK_FUNCTION(2, "PWM1"),
+=09=09MTK_FUNCTION(3, "LTE_MD32_JTAG_TRST"),
+=09=09MTK_FUNCTION(4, "TDD_TRSTN"),
+=09=09MTK_FUNCTION(5, "ANT_SEL7"),
+=09=09MTK_FUNCTION(6, "DM_JTINTP")
+=09),
+=09MTK_PIN(
+=09=0970, "GPIO70",
+=09=09MTK_EINT_FUNCTION(0, 70),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO70"),
+=09=09MTK_FUNCTION(1, "JTMS"),
+=09=09MTK_FUNCTION(2, "CONN_MCU_TMS"),
+=09=09MTK_FUNCTION(3, "LTE_MD32_JTAG_TMS"),
+=09=09MTK_FUNCTION(4, "TDD_TMS"),
+=09=09MTK_FUNCTION(5, "CORESONIC_SWD"),
+=09=09MTK_FUNCTION(6, "DM_OTMS"),
+=09=09MTK_FUNCTION(7, "DFD_TMS")
+=09),
+=09MTK_PIN(
+=09=0971, "GPIO71",
+=09=09MTK_EINT_FUNCTION(0, 71),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO71"),
+=09=09MTK_FUNCTION(1, "JTCK"),
+=09=09MTK_FUNCTION(2, "CONN_MCU_TCK_1"),
+=09=09MTK_FUNCTION(3, "LTE_MD32_JTAG_TCK"),
+=09=09MTK_FUNCTION(4, "TDD_TCK"),
+=09=09MTK_FUNCTION(5, "CORESONIC_SWCK"),
+=09=09MTK_FUNCTION(6, "DM_OTCK"),
+=09=09MTK_FUNCTION(7, "DFD_TCK_XI")
+=09),
+=09MTK_PIN(
+=09=0972, "GPIO72",
+=09=09MTK_EINT_FUNCTION(0, 72),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO72"),
+=09=09MTK_FUNCTION(1, "JTDI"),
+=09=09MTK_FUNCTION(2, "CONN_MCU_TDI"),
+=09=09MTK_FUNCTION(3, "LTE_MD32_JTAG_TDI"),
+=09=09MTK_FUNCTION(4, "TDD_TDI"),
+=09=09MTK_FUNCTION(6, "DM_OTDI"),
+=09=09MTK_FUNCTION(7, "DFD_TDI")
+=09),
+=09MTK_PIN(
+=09=0973, "GPIO73",
+=09=09MTK_EINT_FUNCTION(0, 73),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO73"),
+=09=09MTK_FUNCTION(1, "JTDO"),
+=09=09MTK_FUNCTION(2, "CONN_MCU_TDO"),
+=09=09MTK_FUNCTION(3, "LTE_MD32_JTAG_TDO"),
+=09=09MTK_FUNCTION(4, "TDD_TDO"),
+=09=09MTK_FUNCTION(6, "DM_OTDO"),
+=09=09MTK_FUNCTION(7, "DFD_TDO")
+=09),
+=09MTK_PIN(
+=09=0974, "GPIO74",
+=09=09MTK_EINT_FUNCTION(0, 74),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO74"),
+=09=09MTK_FUNCTION(1, "URXD0"),
+=09=09MTK_FUNCTION(2, "UTXD0"),
+=09=09MTK_FUNCTION(3, "MD_URXD"),
+=09=09MTK_FUNCTION(4, "SDA3"),
+=09=09MTK_FUNCTION(5, "C2K_UART0_RXD"),
+=09=09MTK_FUNCTION(6, "LTE_URXD"),
+=09=09MTK_FUNCTION(7, "AUXIF_ST")
+=09),
+=09MTK_PIN(
+=09=0975, "GPIO75",
+=09=09MTK_EINT_FUNCTION(0, 75),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO75"),
+=09=09MTK_FUNCTION(1, "UTXD0"),
+=09=09MTK_FUNCTION(2, "URXD0"),
+=09=09MTK_FUNCTION(3, "MD_UTXD"),
+=09=09MTK_FUNCTION(4, "TDD_TXD"),
+=09=09MTK_FUNCTION(5, "C2K_UART0_TXD"),
+=09=09MTK_FUNCTION(6, "LTE_UTXD")
+=09),
+=09MTK_PIN(
+=09=0976, "GPIO76",
+=09=09MTK_EINT_FUNCTION(0, 76),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO76"),
+=09=09MTK_FUNCTION(1, "URXD1"),
+=09=09MTK_FUNCTION(2, "UTXD1"),
+=09=09MTK_FUNCTION(3, "MD_URXD"),
+=09=09MTK_FUNCTION(4, "SCL3"),
+=09=09MTK_FUNCTION(5, "LTE_URXD"),
+=09=09MTK_FUNCTION(6, "C2K_UART0_RXD"),
+=09=09MTK_FUNCTION(7, "AUXIF_CLK")
+=09),
+=09MTK_PIN(
+=09=0977, "GPIO77",
+=09=09MTK_EINT_FUNCTION(0, 77),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO77"),
+=09=09MTK_FUNCTION(1, "UTXD1"),
+=09=09MTK_FUNCTION(2, "URXD1"),
+=09=09MTK_FUNCTION(3, "MD_UTXD"),
+=09=09MTK_FUNCTION(4, "TDD_TXD"),
+=09=09MTK_FUNCTION(5, "LTE_UTXD"),
+=09=09MTK_FUNCTION(6, "C2K_UART0_TXD")
+=09),
+=09MTK_PIN(
+=09=0978, "GPIO78",
+=09=09MTK_EINT_FUNCTION(0, 78),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO78"),
+=09=09MTK_FUNCTION(1, "I2S0_DI"),
+=09=09MTK_FUNCTION(2, "PCM1_DI"),
+=09=09MTK_FUNCTION(3, "I2S3_DO"),
+=09=09MTK_FUNCTION(4, "I2S1_DO"),
+=09=09MTK_FUNCTION(5, "PWM0"),
+=09=09MTK_FUNCTION(6, "I2S2_DI"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A26")
+=09),
+=09MTK_PIN(
+=09=0979, "GPIO79",
+=09=09MTK_EINT_FUNCTION(0, 79),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO79"),
+=09=09MTK_FUNCTION(1, "I2S0_LRCK"),
+=09=09MTK_FUNCTION(2, "PCM1_SYNC"),
+=09=09MTK_FUNCTION(3, "I2S3_LRCK"),
+=09=09MTK_FUNCTION(4, "I2S1_LRCK"),
+=09=09MTK_FUNCTION(5, "PWM3"),
+=09=09MTK_FUNCTION(6, "I2S2_LRCK"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A27")
+=09),
+=09MTK_PIN(
+=09=0980, "GPIO80",
+=09=09MTK_EINT_FUNCTION(0, 80),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO80"),
+=09=09MTK_FUNCTION(1, "I2S0_BCK"),
+=09=09MTK_FUNCTION(2, "PCM1_CLK[1]"),
+=09=09MTK_FUNCTION(3, "I2S3_BCK"),
+=09=09MTK_FUNCTION(4, "I2S1_BCK"),
+=09=09MTK_FUNCTION(5, "PWM4"),
+=09=09MTK_FUNCTION(6, "I2S2_BCK"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A28")
+=09),
+=09MTK_PIN(
+=09=0981, "GPIO81",
+=09=09MTK_EINT_FUNCTION(0, 81),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO81"),
+=09=09MTK_FUNCTION(1, "KROW0"),
+=09=09MTK_FUNCTION(3, "CONN_MCU_DBGI_N"),
+=09=09MTK_FUNCTION(4, "CORESONIC_SWCK"),
+=09=09MTK_FUNCTION(5, "C2K_TCK"),
+=09=09MTK_FUNCTION(7, "C2K_DM_EINT1")
+=09),
+=09MTK_PIN(
+=09=0982, "GPIO82",
+=09=09MTK_EINT_FUNCTION(0, 82),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO82"),
+=09=09MTK_FUNCTION(1, "KROW1"),
+=09=09MTK_FUNCTION(3, "CONN_MCU_TRST_B"),
+=09=09MTK_FUNCTION(4, "CORESONIC_SWD"),
+=09=09MTK_FUNCTION(5, "C2K_NTRST"),
+=09=09MTK_FUNCTION(6, "USB_DRVVBUS"),
+=09=09MTK_FUNCTION(7, "C2K_DM_EINT2")
+=09),
+=09MTK_PIN(
+=09=0983, "GPIO83",
+=09=09MTK_EINT_FUNCTION(0, 83),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO83"),
+=09=09MTK_FUNCTION(1, "KROW2"),
+=09=09MTK_FUNCTION(2, "USB_DRVVBUS"),
+=09=09MTK_FUNCTION(5, "C2K_TDI"),
+=09=09MTK_FUNCTION(7, "C2K_DM_EINT3")
+=09),
+=09MTK_PIN(
+=09=0984, "GPIO84",
+=09=09MTK_EINT_FUNCTION(0, 84),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO84"),
+=09=09MTK_FUNCTION(1, "KCOL0"),
+=09=09MTK_FUNCTION(2, "URTS0"),
+=09=09MTK_FUNCTION(3, "CONN_MCU_DBGACK_N"),
+=09=09MTK_FUNCTION(4, "SCL2"),
+=09=09MTK_FUNCTION(5, "C2K_TDO"),
+=09=09MTK_FUNCTION(6, "AUXIF_CLK")
+=09),
+=09MTK_PIN(
+=09=0985, "GPIO85",
+=09=09MTK_EINT_FUNCTION(0, 85),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO85"),
+=09=09MTK_FUNCTION(1, "KCOL1"),
+=09=09MTK_FUNCTION(2, "UCTS0"),
+=09=09MTK_FUNCTION(3, "UCTS1"),
+=09=09MTK_FUNCTION(4, "SDA2"),
+=09=09MTK_FUNCTION(5, "C2K_TMS"),
+=09=09MTK_FUNCTION(6, "AUXIF_ST"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A31")
+=09),
+=09MTK_PIN(
+=09=0986, "GPIO86",
+=09=09MTK_EINT_FUNCTION(0, 86),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO86"),
+=09=09MTK_FUNCTION(1, "KCOL2"),
+=09=09MTK_FUNCTION(3, "URTS1"),
+=09=09MTK_FUNCTION(5, "C2K_RTCK"),
+=09=09MTK_FUNCTION(7, "DBG_MON_A32")
+=09),
+=09MTK_PIN(
+=09=0987, "GPIO87",
+=09=09MTK_EINT_FUNCTION(0, 87),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO87"),
+=09=09MTK_FUNCTION(1, "BPI_BUS5"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS5"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS5"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B0")
+=09),
+=09MTK_PIN(
+=09=0988, "GPIO88",
+=09=09MTK_EINT_FUNCTION(0, 88),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO88"),
+=09=09MTK_FUNCTION(1, "BPI_BUS6"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS6"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS6"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B1")
+=09),
+=09MTK_PIN(
+=09=0989, "GPIO89",
+=09=09MTK_EINT_FUNCTION(0, 89),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO89"),
+=09=09MTK_FUNCTION(1, "BPI_BUS7"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS7"),
+=09=09MTK_FUNCTION(3, "CLKM0"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS7"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B2")
+=09),
+=09MTK_PIN(
+=09=0990, "GPIO90",
+=09=09MTK_EINT_FUNCTION(0, 90),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO90"),
+=09=09MTK_FUNCTION(1, "BPI_BUS8"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS8"),
+=09=09MTK_FUNCTION(3, "CLKM1"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS8"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B3")
+=09),
+=09MTK_PIN(
+=09=0991, "GPIO91",
+=09=09MTK_EINT_FUNCTION(0, 91),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO91"),
+=09=09MTK_FUNCTION(1, "BPI_BUS9"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS9"),
+=09=09MTK_FUNCTION(3, "CLKM2"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS9"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B4")
+=09),
+=09MTK_PIN(
+=09=0992, "GPIO92",
+=09=09MTK_EINT_FUNCTION(0, 92),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO92"),
+=09=09MTK_FUNCTION(1, "BPI_BUS10"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS10"),
+=09=09MTK_FUNCTION(3, "CLKM3"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS10"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B5")
+=09),
+=09MTK_PIN(
+=09=0993, "GPIO93",
+=09=09MTK_EINT_FUNCTION(0, 93),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO93"),
+=09=09MTK_FUNCTION(1, "BPI_BUS11"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS11"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS11"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B6")
+=09),
+=09MTK_PIN(
+=09=0994, "GPIO94",
+=09=09MTK_EINT_FUNCTION(0, 94),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO94"),
+=09=09MTK_FUNCTION(1, "BPI_BUS12"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS12"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS12"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B7")
+=09),
+=09MTK_PIN(
+=09=0995, "GPIO95",
+=09=09MTK_EINT_FUNCTION(0, 95),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO95"),
+=09=09MTK_FUNCTION(1, "BPI_BUS13"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS13"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS13"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B8")
+=09),
+=09MTK_PIN(
+=09=0996, "GPIO96",
+=09=09MTK_EINT_FUNCTION(0, 96),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO96"),
+=09=09MTK_FUNCTION(1, "BPI_BUS14"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS14"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS14"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B9")
+=09),
+=09MTK_PIN(
+=09=0997, "GPIO97",
+=09=09MTK_EINT_FUNCTION(0, 97),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO97"),
+=09=09MTK_FUNCTION(1, "BPI_BUS15"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS15"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS15"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B10")
+=09),
+=09MTK_PIN(
+=09=0998, "GPIO98",
+=09=09MTK_EINT_FUNCTION(0, 98),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO98"),
+=09=09MTK_FUNCTION(1, "BPI_BUS16"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS16"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS16"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B11")
+=09),
+=09MTK_PIN(
+=09=0999, "GPIO99",
+=09=09MTK_EINT_FUNCTION(0, 99),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO99"),
+=09=09MTK_FUNCTION(1, "BPI_BUS17"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS17"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS17"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B12")
+=09),
+=09MTK_PIN(
+=09=09100, "GPIO100",
+=09=09MTK_EINT_FUNCTION(0, 100),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO100"),
+=09=09MTK_FUNCTION(1, "BPI_BUS18"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS18"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS18"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B13")
+=09),
+=09MTK_PIN(
+=09=09101, "GPIO101",
+=09=09MTK_EINT_FUNCTION(0, 101),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO101"),
+=09=09MTK_FUNCTION(1, "BPI_BUS19"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS19"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS19"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B14")
+=09),
+=09MTK_PIN(
+=09=09102, "GPIO102",
+=09=09MTK_EINT_FUNCTION(0, 102),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO102"),
+=09=09MTK_FUNCTION(1, "BPI_BUS20"),
+=09=09MTK_FUNCTION(2, "LTE_C2K_BPI_BUS20"),
+=09=09MTK_FUNCTION(5, "C2K_BPI_BUS20"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B15")
+=09),
+=09MTK_PIN(
+=09=09103, "GPIO103",
+=09=09MTK_EINT_FUNCTION(0, 103),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO103"),
+=09=09MTK_FUNCTION(1, "C2K_TXBPI"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B16")
+=09),
+=09MTK_PIN(
+=09=09104, "GPIO104",
+=09=09MTK_EINT_FUNCTION(0, 104),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO104"),
+=09=09MTK_FUNCTION(1, "RFIC1_BSI_EN"),
+=09=09MTK_FUNCTION(5, "C2K_RX_BSI_EN"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B17")
+=09),
+=09MTK_PIN(
+=09=09105, "GPIO105",
+=09=09MTK_EINT_FUNCTION(0, 105),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO105"),
+=09=09MTK_FUNCTION(1, "RFIC1_BSI_CK"),
+=09=09MTK_FUNCTION(5, "C2K_RX_BSI_CLK"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B18")
+=09),
+=09MTK_PIN(
+=09=09106, "GPIO106",
+=09=09MTK_EINT_FUNCTION(0, 106),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO106"),
+=09=09MTK_FUNCTION(1, "RFIC1_BSI_D0"),
+=09=09MTK_FUNCTION(5, "C2K_RX_BSI_DATA"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B19")
+=09),
+=09MTK_PIN(
+=09=09107, "GPIO107",
+=09=09MTK_EINT_FUNCTION(0, 107),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO107"),
+=09=09MTK_FUNCTION(1, "RFIC1_BSI_D1"),
+=09=09MTK_FUNCTION(5, "C2K_TX_BSI_EN"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B20")
+=09),
+=09MTK_PIN(
+=09=09108, "GPIO108",
+=09=09MTK_EINT_FUNCTION(0, 108),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO108"),
+=09=09MTK_FUNCTION(1, "RFIC1_BSI_D2"),
+=09=09MTK_FUNCTION(5, "C2K_TX_BSI_CLK"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B21")
+=09),
+=09MTK_PIN(
+=09=09109, "GPIO109",
+=09=09MTK_EINT_FUNCTION(0, 109),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO109"),
+=09=09MTK_FUNCTION(5, "C2K_TX_BSI_DATA"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B22")
+=09),
+=09MTK_PIN(
+=09=09110, "GPIO110",
+=09=09MTK_EINT_FUNCTION(0, 110),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO110"),
+=09=09MTK_FUNCTION(1, "RFIC0_BSI_EN"),
+=09=09MTK_FUNCTION(4, "SPM_BSI_EN"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B23")
+=09),
+=09MTK_PIN(
+=09=09111, "GPIO111",
+=09=09MTK_EINT_FUNCTION(0, 111),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO111"),
+=09=09MTK_FUNCTION(1, "RFIC0_BSI_CK"),
+=09=09MTK_FUNCTION(4, "SPM_BSI_CLK"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B24")
+=09),
+=09MTK_PIN(
+=09=09112, "GPIO112",
+=09=09MTK_EINT_FUNCTION(0, 112),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO112"),
+=09=09MTK_FUNCTION(1, "RFIC0_BSI_D2"),
+=09=09MTK_FUNCTION(4, "SPM_BSI_D2"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B25")
+=09),
+=09MTK_PIN(
+=09=09113, "GPIO113",
+=09=09MTK_EINT_FUNCTION(0, 113),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO113"),
+=09=09MTK_FUNCTION(1, "RFIC0_BSI_D1"),
+=09=09MTK_FUNCTION(4, "SPM_BSI_D1"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B26")
+=09),
+=09MTK_PIN(
+=09=09114, "GPIO114",
+=09=09MTK_EINT_FUNCTION(0, 114),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO114"),
+=09=09MTK_FUNCTION(1, "RFIC0_BSI_D0"),
+=09=09MTK_FUNCTION(4, "SPM_BSI_D0"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B27")
+=09),
+=09MTK_PIN(
+=09=09115, "GPIO115",
+=09=09MTK_EINT_FUNCTION(0, 115),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO115"),
+=09=09MTK_FUNCTION(1, "AUXIN0")
+=09),
+=09MTK_PIN(
+=09=09116, "GPIO116",
+=09=09MTK_EINT_FUNCTION(0, 116),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO116"),
+=09=09MTK_FUNCTION(1, "AUXIN1")
+=09),
+=09MTK_PIN(
+=09=09117, "GPIO117",
+=09=09MTK_EINT_FUNCTION(0, 117),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO117"),
+=09=09MTK_FUNCTION(1, "AUXIN2")
+=09),
+=09MTK_PIN(
+=09=09118, "GPIO118",
+=09=09MTK_EINT_FUNCTION(0, 118),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO118"),
+=09=09MTK_FUNCTION(1, "TXBPI")
+=09),
+=09MTK_PIN(
+=09=09119, "GPIO119",
+=09=09MTK_EINT_FUNCTION(0, 119),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO119"),
+=09=09MTK_FUNCTION(1, "BPI_BUS0"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B28")
+=09),
+=09MTK_PIN(
+=09=09120, "GPIO120",
+=09=09MTK_EINT_FUNCTION(0, 120),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO120"),
+=09=09MTK_FUNCTION(1, "BPI_BUS1"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B29")
+=09),
+=09MTK_PIN(
+=09=09121, "GPIO121",
+=09=09MTK_EINT_FUNCTION(0, 121),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO121"),
+=09=09MTK_FUNCTION(1, "BPI_BUS2"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B30")
+=09),
+=09MTK_PIN(
+=09=09122, "GPIO122",
+=09=09MTK_EINT_FUNCTION(0, 122),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO122"),
+=09=09MTK_FUNCTION(1, "BPI_BUS3"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B31")
+=09),
+=09MTK_PIN(
+=09=09123, "GPIO123",
+=09=09MTK_EINT_FUNCTION(0, 123),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO123"),
+=09=09MTK_FUNCTION(1, "BPI_BUS4"),
+=09=09MTK_FUNCTION(7, "DBG_MON_B32")
+=09),
+=09MTK_PIN(
+=09=09124, "GPIO124",
+=09=09MTK_EINT_FUNCTION(0, 124),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO124"),
+=09=09MTK_FUNCTION(1, "BPI_BUS21"),
+=09=09MTK_FUNCTION(5, "DPI_HSYNC1"),
+=09=09MTK_FUNCTION(6, "KCOL2"),
+=09=09MTK_FUNCTION(7, "TDD_TXD")
+=09),
+=09MTK_PIN(
+=09=09125, "GPIO125",
+=09=09MTK_EINT_FUNCTION(0, 125),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO125"),
+=09=09MTK_FUNCTION(1, "BPI_BUS22"),
+=09=09MTK_FUNCTION(5, "DPI_VSYNC1"),
+=09=09MTK_FUNCTION(6, "KROW2"),
+=09=09MTK_FUNCTION(7, "MD_URXD")
+=09),
+=09MTK_PIN(
+=09=09126, "GPIO126",
+=09=09MTK_EINT_FUNCTION(0, 126),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO126"),
+=09=09MTK_FUNCTION(1, "BPI_BUS23"),
+=09=09MTK_FUNCTION(5, "DPI_CK1"),
+=09=09MTK_FUNCTION(6, "I2S2_MCK"),
+=09=09MTK_FUNCTION(7, "MD_UTXD")
+=09),
+=09MTK_PIN(
+=09=09127, "GPIO127",
+=09=09MTK_EINT_FUNCTION(0, 127),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO127"),
+=09=09MTK_FUNCTION(1, "BPI_BUS24"),
+=09=09MTK_FUNCTION(3, "CONN_MCU_DBGI_N"),
+=09=09MTK_FUNCTION(4, "EXT_FRAME_SYNC"),
+=09=09MTK_FUNCTION(5, "DPI_DE1"),
+=09=09MTK_FUNCTION(6, "SRCLKENAI1"),
+=09=09MTK_FUNCTION(7, "URXD0")
+=09),
+=09MTK_PIN(
+=09=09128, "GPIO128",
+=09=09MTK_EINT_FUNCTION(0, 128),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO128"),
+=09=09MTK_FUNCTION(1, "BPI_BUS25"),
+=09=09MTK_FUNCTION(3, "GPS_FRAME_SYNC"),
+=09=09MTK_FUNCTION(5, "I2S2_DI"),
+=09=09MTK_FUNCTION(6, "PTA_RXD"),
+=09=09MTK_FUNCTION(7, "UTXD0")
+=09),
+=09MTK_PIN(
+=09=09129, "GPIO129",
+=09=09MTK_EINT_FUNCTION(0, 129),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO129"),
+=09=09MTK_FUNCTION(1, "BPI_BUS26"),
+=09=09MTK_FUNCTION(2, "DISP_PWM"),
+=09=09MTK_FUNCTION(5, "I2S2_LRCK"),
+=09=09MTK_FUNCTION(6, "PTA_TXD"),
+=09=09MTK_FUNCTION(7, "LTE_URXD")
+=09),
+=09MTK_PIN(
+=09=09130, "GPIO130",
+=09=09MTK_EINT_FUNCTION(0, 130),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO130"),
+=09=09MTK_FUNCTION(1, "BPI_BUS27"),
+=09=09MTK_FUNCTION(5, "I2S2_BCK"),
+=09=09MTK_FUNCTION(6, "IRTX_OUT"),
+=09=09MTK_FUNCTION(7, "LTE_UTXD")
+=09),
+=09MTK_PIN(
+=09=09131, "GPIO131",
+=09=09MTK_EINT_FUNCTION(0, 131),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO131"),
+=09=09MTK_FUNCTION(1, "LTE_PAVM0")
+=09),
+=09MTK_PIN(
+=09=09132, "GPIO132",
+=09=09MTK_EINT_FUNCTION(0, 132),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO132"),
+=09=09MTK_FUNCTION(1, "LTE_PAVM1")
+=09),
+=09MTK_PIN(
+=09=09133, "GPIO133",
+=09=09MTK_EINT_FUNCTION(0, 133),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO133"),
+=09=09MTK_FUNCTION(1, "MIPI1_SCLK")
+=09),
+=09MTK_PIN(
+=09=09134, "GPIO134",
+=09=09MTK_EINT_FUNCTION(0, 134),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO134"),
+=09=09MTK_FUNCTION(1, "MIPI1_SDATA")
+=09),
+=09MTK_PIN(
+=09=09135, "GPIO135",
+=09=09MTK_EINT_FUNCTION(0, 135),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO135"),
+=09=09MTK_FUNCTION(1, "MIPI0_SCLK")
+=09),
+=09MTK_PIN(
+=09=09136, "GPIO136",
+=09=09MTK_EINT_FUNCTION(0, 136),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO136"),
+=09=09MTK_FUNCTION(1, "MIPI0_SDATA")
+=09),
+=09MTK_PIN(
+=09=09137, "GPIO137",
+=09=09MTK_EINT_FUNCTION(0, 137),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO137"),
+=09=09MTK_FUNCTION(1, "RTC32K_CK")
+=09),
+=09MTK_PIN(
+=09=09138, "GPIO138",
+=09=09MTK_EINT_FUNCTION(0, 138),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO138"),
+=09=09MTK_FUNCTION(1, "PWRAP_SPIDO"),
+=09=09MTK_FUNCTION(2, "PWRAP_SPIDI")
+=09),
+=09MTK_PIN(
+=09=09139, "GPIO139",
+=09=09MTK_EINT_FUNCTION(0, 139),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO139"),
+=09=09MTK_FUNCTION(1, "PWRAP_SPIDI"),
+=09=09MTK_FUNCTION(2, "PWRAP_SPIDO")
+=09),
+=09MTK_PIN(
+=09=09140, "GPIO140",
+=09=09MTK_EINT_FUNCTION(0, 140),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO140"),
+=09=09MTK_FUNCTION(3, "LTE_MD32_JTAG_TRST"),
+=09=09MTK_FUNCTION(4, "TDD_TRSTN"),
+=09=09MTK_FUNCTION(5, "DM_JTINTP")
+=09),
+=09MTK_PIN(
+=09=09141, "GPIO141",
+=09=09MTK_EINT_FUNCTION(0, 141),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO141"),
+=09=09MTK_FUNCTION(1, "PWRAP_SPICK_I")
+=09),
+=09MTK_PIN(
+=09=09142, "GPIO142",
+=09=09MTK_EINT_FUNCTION(0, 142),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO142"),
+=09=09MTK_FUNCTION(1, "PWRAP_SPICS_B_I")
+=09),
+=09MTK_PIN(
+=09=09143, "GPIO143",
+=09=09MTK_EINT_FUNCTION(0, 143),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO143"),
+=09=09MTK_FUNCTION(1, "AUD_CLK_MOSI")
+=09),
+=09MTK_PIN(
+=09=09144, "GPIO144",
+=09=09MTK_EINT_FUNCTION(0, 144),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO144"),
+=09=09MTK_FUNCTION(1, "AUD_DAT_MISO"),
+=09=09MTK_FUNCTION(3, "AUD_DAT_MOSI")
+=09),
+=09MTK_PIN(
+=09=09145, "GPIO145",
+=09=09MTK_EINT_FUNCTION(0, 145),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO145"),
+=09=09MTK_FUNCTION(1, "AUD_DAT_MOSI"),
+=09=09MTK_FUNCTION(3, "AUD_DAT_MISO")
+=09),
+=09MTK_PIN(
+=09=09146, "GPIO146",
+=09=09MTK_EINT_FUNCTION(0, 146),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO146"),
+=09=09MTK_FUNCTION(1, "LCM_RST")
+=09),
+=09MTK_PIN(
+=09=09147, "GPIO147",
+=09=09MTK_EINT_FUNCTION(0, 147),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO147"),
+=09=09MTK_FUNCTION(1, "DSI_TE")
+=09),
+=09MTK_PIN(
+=09=09148, "GPIO148",
+=09=09MTK_EINT_FUNCTION(0, 148),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO148"),
+=09=09MTK_FUNCTION(1, "SRCLKENA")
+=09),
+=09MTK_PIN(
+=09=09149, "GPIO149",
+=09=09MTK_EINT_FUNCTION(0, 149),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO149"),
+=09=09MTK_FUNCTION(1, "WATCHDOG")
+=09),
+=09MTK_PIN(
+=09=09150, "GPIO150",
+=09=09MTK_EINT_FUNCTION(0, 150),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO150"),
+=09=09MTK_FUNCTION(1, "TDP0")
+=09),
+=09MTK_PIN(
+=09=09151, "GPIO151",
+=09=09MTK_EINT_FUNCTION(0, 151),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO151"),
+=09=09MTK_FUNCTION(1, "TDN0")
+=09),
+=09MTK_PIN(
+=09=09152, "GPIO152",
+=09=09MTK_EINT_FUNCTION(0, 152),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO152"),
+=09=09MTK_FUNCTION(1, "TDP1")
+=09),
+=09MTK_PIN(
+=09=09153, "GPIO153",
+=09=09MTK_EINT_FUNCTION(0, 153),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO153"),
+=09=09MTK_FUNCTION(1, "TDN1")
+=09),
+=09MTK_PIN(
+=09=09154, "GPIO154",
+=09=09MTK_EINT_FUNCTION(0, 154),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO154"),
+=09=09MTK_FUNCTION(1, "TCP")
+=09),
+=09MTK_PIN(
+=09=09155, "GPIO155",
+=09=09MTK_EINT_FUNCTION(0, 155),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO155"),
+=09=09MTK_FUNCTION(1, "TCN")
+=09),
+=09MTK_PIN(
+=09=09156, "GPIO156",
+=09=09MTK_EINT_FUNCTION(0, 156),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO156"),
+=09=09MTK_FUNCTION(1, "TDP2")
+=09),
+=09MTK_PIN(
+=09=09157, "GPIO157",
+=09=09MTK_EINT_FUNCTION(0, 157),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO157"),
+=09=09MTK_FUNCTION(1, "TDN2")
+=09),
+=09MTK_PIN(
+=09=09158, "GPIO158",
+=09=09MTK_EINT_FUNCTION(0, 158),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO158"),
+=09=09MTK_FUNCTION(1, "TDP3")
+=09),
+=09MTK_PIN(
+=09=09159, "GPIO159",
+=09=09MTK_EINT_FUNCTION(0, 159),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO159"),
+=09=09MTK_FUNCTION(1, "TDN3")
+=09),
+=09MTK_PIN(
+=09=09160, "GPIO160",
+=09=09MTK_EINT_FUNCTION(0, 160),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO160"),
+=09=09MTK_FUNCTION(1, "MD_SIM2_SCLK"),
+=09=09MTK_FUNCTION(2, "MD_SIM1_SCLK"),
+=09=09MTK_FUNCTION(3, "UIM0_CLK"),
+=09=09MTK_FUNCTION(4, "UIM1_CLK")
+=09),
+=09MTK_PIN(
+=09=09161, "GPIO161",
+=09=09MTK_EINT_FUNCTION(0, 161),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO161"),
+=09=09MTK_FUNCTION(1, "MD_SIM2_SRST"),
+=09=09MTK_FUNCTION(2, "MD_SIM1_SRST"),
+=09=09MTK_FUNCTION(3, "UIM0_RST"),
+=09=09MTK_FUNCTION(4, "UIM1_RST")
+=09),
+=09MTK_PIN(
+=09=09162, "GPIO162",
+=09=09MTK_EINT_FUNCTION(0, 162),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO162"),
+=09=09MTK_FUNCTION(1, "MD_SIM2_SDAT"),
+=09=09MTK_FUNCTION(2, "MD_SIM1_SDAT"),
+=09=09MTK_FUNCTION(3, "UIM0_IO"),
+=09=09MTK_FUNCTION(4, "UIM1_IO")
+=09),
+=09MTK_PIN(
+=09=09163, "GPIO163",
+=09=09MTK_EINT_FUNCTION(0, 163),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO163"),
+=09=09MTK_FUNCTION(1, "MD_SIM1_SCLK"),
+=09=09MTK_FUNCTION(2, "MD_SIM2_SCLK"),
+=09=09MTK_FUNCTION(3, "UIM1_CLK"),
+=09=09MTK_FUNCTION(4, "UIM0_CLK")
+=09),
+=09MTK_PIN(
+=09=09164, "GPIO164",
+=09=09MTK_EINT_FUNCTION(0, 164),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO164"),
+=09=09MTK_FUNCTION(1, "MD_SIM1_SRST"),
+=09=09MTK_FUNCTION(2, "MD_SIM2_SRST"),
+=09=09MTK_FUNCTION(3, "UIM1_RST"),
+=09=09MTK_FUNCTION(4, "UIM0_RST")
+=09),
+=09MTK_PIN(
+=09=09165, "GPIO165",
+=09=09MTK_EINT_FUNCTION(0, 165),
+=09=09DRV_GRP0,
+=09=09MTK_FUNCTION(0, "GPIO165"),
+=09=09MTK_FUNCTION(1, "MD_SIM1_SDAT"),
+=09=09MTK_FUNCTION(2, "MD_SIM2_SDAT"),
+=09=09MTK_FUNCTION(3, "UIM1_IO"),
+=09=09MTK_FUNCTION(4, "UIM0_IO")
+=09),
+=09MTK_PIN(
+=09=09166, "GPIO166",
+=09=09MTK_EINT_FUNCTION(0, 166),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO166"),
+=09=09MTK_FUNCTION(1, "MSDC1_CMD"),
+=09=09MTK_FUNCTION(2, "LTE_MD32_JTAG_TMS"),
+=09=09MTK_FUNCTION(3, "C2K_TMS"),
+=09=09MTK_FUNCTION(4, "TDD_TMS"),
+=09=09MTK_FUNCTION(5, "CONN_DSP_JMS"),
+=09=09MTK_FUNCTION(6, "JTMS"),
+=09=09MTK_FUNCTION(7, "CONN_MCU_AICE_TMSC")
+=09),
+=09MTK_PIN(
+=09=09167, "GPIO167",
+=09=09MTK_EINT_FUNCTION(0, 167),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO167"),
+=09=09MTK_FUNCTION(1, "MSDC1_CLK"),
+=09=09MTK_FUNCTION(2, "LTE_MD32_JTAG_TCK"),
+=09=09MTK_FUNCTION(3, "C2K_TCK"),
+=09=09MTK_FUNCTION(4, "TDD_TCK"),
+=09=09MTK_FUNCTION(5, "CONN_DSP_JCK"),
+=09=09MTK_FUNCTION(6, "JTCK"),
+=09=09MTK_FUNCTION(7, "CONN_MCU_AICE_TCKC")
+=09),
+=09MTK_PIN(
+=09=09168, "GPIO168",
+=09=09MTK_EINT_FUNCTION(0, 168),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO168"),
+=09=09MTK_FUNCTION(1, "MSDC1_DAT0"),
+=09=09MTK_FUNCTION(2, "LTE_MD32_JTAG_TDI"),
+=09=09MTK_FUNCTION(3, "C2K_TDI"),
+=09=09MTK_FUNCTION(4, "TDD_TDI"),
+=09=09MTK_FUNCTION(5, "CONN_DSP_JDI"),
+=09=09MTK_FUNCTION(6, "JTDI")
+=09),
+=09MTK_PIN(
+=09=09169, "GPIO169",
+=09=09MTK_EINT_FUNCTION(0, 169),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO169"),
+=09=09MTK_FUNCTION(1, "MSDC1_DAT1"),
+=09=09MTK_FUNCTION(2, "LTE_MD32_JTAG_TDO"),
+=09=09MTK_FUNCTION(3, "C2K_TDO"),
+=09=09MTK_FUNCTION(4, "TDD_TDO"),
+=09=09MTK_FUNCTION(5, "CONN_DSP_JDO"),
+=09=09MTK_FUNCTION(6, "JTDO")
+=09),
+=09MTK_PIN(
+=09=09170, "GPIO170",
+=09=09MTK_EINT_FUNCTION(0, 170),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO170"),
+=09=09MTK_FUNCTION(1, "MSDC1_DAT2"),
+=09=09MTK_FUNCTION(2, "LTE_MD32_JTAG_TRST"),
+=09=09MTK_FUNCTION(3, "C2K_NTRST"),
+=09=09MTK_FUNCTION(4, "TDD_TRSTN"),
+=09=09MTK_FUNCTION(5, "CONN_DSP_JINTP"),
+=09=09MTK_FUNCTION(6, "DM_JTINTP")
+=09),
+=09MTK_PIN(
+=09=09171, "GPIO171",
+=09=09MTK_EINT_FUNCTION(0, 171),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO171"),
+=09=09MTK_FUNCTION(1, "MSDC1_DAT3"),
+=09=09MTK_FUNCTION(3, "C2K_RTCK")
+=09),
+=09MTK_PIN(
+=09=09172, "GPIO172",
+=09=09MTK_EINT_FUNCTION(0, 172),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO172"),
+=09=09MTK_FUNCTION(1, "MSDC0_CMD")
+=09),
+=09MTK_PIN(
+=09=09173, "GPIO173",
+=09=09MTK_EINT_FUNCTION(0, 173),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO173"),
+=09=09MTK_FUNCTION(1, "MSDC0_DSL")
+=09),
+=09MTK_PIN(
+=09=09174, "GPIO174",
+=09=09MTK_EINT_FUNCTION(0, 174),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO174"),
+=09=09MTK_FUNCTION(1, "MSDC0_CLK")
+=09),
+=09MTK_PIN(
+=09=09175, "GPIO175",
+=09=09MTK_EINT_FUNCTION(0, 175),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO175"),
+=09=09MTK_FUNCTION(1, "MSDC0_DAT0")
+=09),
+=09MTK_PIN(
+=09=09176, "GPIO176",
+=09=09MTK_EINT_FUNCTION(0, 176),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO176"),
+=09=09MTK_FUNCTION(1, "MSDC0_DAT1")
+=09),
+=09MTK_PIN(
+=09=09177, "GPIO177",
+=09=09MTK_EINT_FUNCTION(0, 177),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO177"),
+=09=09MTK_FUNCTION(1, "MSDC0_DAT2")
+=09),
+=09MTK_PIN(
+=09=09178, "GPIO178",
+=09=09MTK_EINT_FUNCTION(0, 178),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO178"),
+=09=09MTK_FUNCTION(1, "MSDC0_DAT3")
+=09),
+=09MTK_PIN(
+=09=09179, "GPIO179",
+=09=09MTK_EINT_FUNCTION(0, 179),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO179"),
+=09=09MTK_FUNCTION(1, "MSDC0_DAT4")
+=09),
+=09MTK_PIN(
+=09=09180, "GPIO180",
+=09=09MTK_EINT_FUNCTION(0, 180),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO180"),
+=09=09MTK_FUNCTION(1, "MSDC0_DAT5")
+=09),
+=09MTK_PIN(
+=09=09181, "GPIO181",
+=09=09MTK_EINT_FUNCTION(0, 181),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO181"),
+=09=09MTK_FUNCTION(1, "MSDC0_DAT6")
+=09),
+=09MTK_PIN(
+=09=09182, "GPIO182",
+=09=09MTK_EINT_FUNCTION(0, 182),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO182"),
+=09=09MTK_FUNCTION(1, "MSDC0_DAT7")
+=09),
+=09MTK_PIN(
+=09=09183, "GPIO183",
+=09=09MTK_EINT_FUNCTION(0, 183),
+=09=09DRV_GRP4,
+=09=09MTK_FUNCTION(0, "GPIO183"),
+=09=09MTK_FUNCTION(1, "MSDC0_RSTB")
+=09),
+=09MTK_PIN(
+=09=09184, "GPIO184",
+=09=09MTK_EINT_FUNCTION(0, 184),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO184"),
+=09=09MTK_FUNCTION(1, "F2W_DATA"),
+=09=09MTK_FUNCTION(2, "MRG_CLK"),
+=09=09MTK_FUNCTION(3, "C2K_DM_EINT2"),
+=09=09MTK_FUNCTION(4, "PCM0_CLK")
+=09),
+=09MTK_PIN(
+=09=09185, "GPIO185",
+=09=09MTK_EINT_FUNCTION(0, 185),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO185"),
+=09=09MTK_FUNCTION(1, "F2W_CK"),
+=09=09MTK_FUNCTION(2, "MRG_DI"),
+=09=09MTK_FUNCTION(3, "C2K_DM_EINT3"),
+=09=09MTK_FUNCTION(4, "PCM0_DI")
+=09),
+=09MTK_PIN(
+=09=09186, "GPIO186",
+=09=09MTK_EINT_FUNCTION(0, 186),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO186"),
+=09=09MTK_FUNCTION(1, "WB_RSTB"),
+=09=09MTK_FUNCTION(4, "URXD3"),
+=09=09MTK_FUNCTION(5, "UTXD3")
+=09),
+=09MTK_PIN(
+=09=09187, "GPIO187",
+=09=09MTK_EINT_FUNCTION(0, 187),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO187"),
+=09=09MTK_FUNCTION(1, "WB_SCLK"),
+=09=09MTK_FUNCTION(2, "MRG_DO"),
+=09=09MTK_FUNCTION(4, "PCM0_DO")
+=09),
+=09MTK_PIN(
+=09=09188, "GPIO188",
+=09=09MTK_EINT_FUNCTION(0, 188),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO188"),
+=09=09MTK_FUNCTION(1, "WB_SDATA"),
+=09=09MTK_FUNCTION(2, "MRG_SYNC"),
+=09=09MTK_FUNCTION(4, "PCM0_SYNC")
+=09),
+=09MTK_PIN(
+=09=09189, "GPIO189",
+=09=09MTK_EINT_FUNCTION(0, 189),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO189"),
+=09=09MTK_FUNCTION(1, "WB_SEN"),
+=09=09MTK_FUNCTION(4, "UTXD3"),
+=09=09MTK_FUNCTION(5, "URXD3")
+=09),
+=09MTK_PIN(
+=09=09190, "GPIO190",
+=09=09MTK_EINT_FUNCTION(0, 190),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO190"),
+=09=09MTK_FUNCTION(1, "GPS_RXQN")
+=09),
+=09MTK_PIN(
+=09=09191, "GPIO191",
+=09=09MTK_EINT_FUNCTION(0, 191),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO191"),
+=09=09MTK_FUNCTION(1, "GPS_RXQP")
+=09),
+=09MTK_PIN(
+=09=09192, "GPIO192",
+=09=09MTK_EINT_FUNCTION(0, 192),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO192"),
+=09=09MTK_FUNCTION(1, "GPS_RXIN")
+=09),
+=09MTK_PIN(
+=09=09193, "GPIO193",
+=09=09MTK_EINT_FUNCTION(0, 193),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO193"),
+=09=09MTK_FUNCTION(1, "GPS_RXIP")
+=09),
+=09MTK_PIN(
+=09=09194, "GPIO194",
+=09=09MTK_EINT_FUNCTION(0, 194),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO194"),
+=09=09MTK_FUNCTION(1, "WB_RXQN")
+=09),
+=09MTK_PIN(
+=09=09195, "GPIO195",
+=09=09MTK_EINT_FUNCTION(0, 195),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO195"),
+=09=09MTK_FUNCTION(1, "WB_RXQP")
+=09),
+=09MTK_PIN(
+=09=09196, "GPIO196",
+=09=09MTK_EINT_FUNCTION(0, 196),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO196"),
+=09=09MTK_FUNCTION(1, "WB_RXIN")
+=09),
+=09MTK_PIN(
+=09=09197, "GPIO197",
+=09=09MTK_EINT_FUNCTION(0, 197),
+=09=09DRV_GRP2,
+=09=09MTK_FUNCTION(0, "GPIO197"),
+=09=09MTK_FUNCTION(1, "WB_RXIP")
+=09),
+=09MTK_PIN(
+=09=09198, "GPIO198",
+=09=09MTK_EINT_FUNCTION(0, 198),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, NULL)
+=09),
+=09MTK_PIN(
+=09=09199, "GPIO199",
+=09=09MTK_EINT_FUNCTION(0, 199),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, NULL)
+=09),
+=09MTK_PIN(
+=09=09200, "GPIO200",
+=09=09MTK_EINT_FUNCTION(0, 200),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, NULL)
+=09),
+=09MTK_PIN(
+=09=09201, "GPIO201",
+=09=09MTK_EINT_FUNCTION(0, 201),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, NULL)
+=09),
+=09MTK_PIN(
+=09=09202, "GPIO202",
+=09=09MTK_EINT_FUNCTION(0, 202),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, NULL)
+=09),
+=09MTK_PIN(
+=09=09203, "GPIO203",
+=09=09MTK_EINT_FUNCTION(0, 203),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, NULL)
+=09),
+=09MTK_PIN(
+=09=09204, "GPIO204",
+=09=09MTK_EINT_FUNCTION(0, 204),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, NULL)
+=09),
+=09MTK_PIN(
+=09=09205, "GPIO205",
+=09=09MTK_EINT_FUNCTION(0, 205),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, NULL)
+=09),
+=09MTK_PIN(
+=09=09206, "GPIO206",
+=09=09MTK_EINT_FUNCTION(0, 206),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, NULL)
+=09),
+=09MTK_PIN(
+=09=09207, "GPIO207",
+=09=09MTK_EINT_FUNCTION(0, 207),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, NULL)
+=09),
+=09MTK_PIN(
+=09=09208, "GPIO208",
+=09=09MTK_EINT_FUNCTION(0, 208),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, NULL)
+=09),
+=09MTK_PIN(
+=09=09209, "GPIO209",
+=09=09MTK_EINT_FUNCTION(0, 209),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, NULL)
+=09),
+=09MTK_PIN(
+=09=09210, "GPIO210",
+=09=09MTK_EINT_FUNCTION(0, 210),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, NULL)
+=09),
+=09MTK_PIN(
+=09=09211, "GPIO211",
+=09=09MTK_EINT_FUNCTION(0, 211),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, NULL)
+=09),
+=09MTK_PIN(
+=09=09212, "GPIO212",
+=09=09MTK_EINT_FUNCTION(0, 212),
+=09=09DRV_FIXED,
+=09=09MTK_FUNCTION(0, NULL)
+=09),
+};
+
+#endif
--=20
2.47.0



