Return-Path: <linux-gpio+bounces-11187-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E74CA99A357
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 14:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE5A11C21DB8
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 12:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C396218588;
	Fri, 11 Oct 2024 12:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+o8ovbB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D05217323;
	Fri, 11 Oct 2024 12:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728648391; cv=none; b=uCqbhmzmfJdvjAbMAcu7rwzHQq6v4GBBqVgQ1SZ5ex0FWn++bpKzHfeTqZK+o6p76xGN8rHnWG39RnDumMQH1fLrr4DZDbvXEt09mOx/A0USgF30yRNlmnKykMlSuOAhOYXpN3f7rJyrp1yKba5+SW/sLzoNaZtlnTMF4h4xHkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728648391; c=relaxed/simple;
	bh=qgGP3Mfwr2gsb23YimrYLeOxu14IBbQf2lZbhUdEsKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=obZPxu3Pcm9u0ZgcRhddK724S5G0wrDcMOkpZ2jxtLmZlzdMhrik4w8XIVOdk96rcw8qw4fcOa+BuhupkEsQWc4wf+W7+9h83PE5BIw77aPEavSqKX4RU+eK3SGPlcPCSbdZohYrQaJFwXWM0mvf3NvEjKcHwqTy3I70mxTdzrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+o8ovbB; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a99cc265e0aso28180266b.3;
        Fri, 11 Oct 2024 05:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728648383; x=1729253183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1KlxBMLnxZwW5Hd+aMx3saq6LEAX+8a+za7H4NhYK8=;
        b=K+o8ovbBF3tjJDn0QbWJsRrHoK4xdRRdG2n9jfxodiy6ICEZj9ujsSEV7dciNLSbw2
         QCpvdutNAQAx7nLciRR8x6SzZMsLunxEzdaenlniEErMJgdZUeORuQqDtJgEnDP+sd8C
         BmU+5nKLOK/pcZRASvk/gvsHXXQxntJsHzaKz0EBQpUdqZzyLAVXOeMS+bHVK5o0wmBA
         oTwMCmJvhPw4W7xEnti7kaPhzuoV9+q4qrBwlbdyCGHxHhgxjA5Pi0Zs6v9dqvjeBEYt
         yWnsqOWJ15Sy7rnwG2o6V9xSEIZ0HjQUlTNLgkBAw+j8OD2f+kjPtBomX2zHMV20rAB5
         AeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728648383; x=1729253183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k1KlxBMLnxZwW5Hd+aMx3saq6LEAX+8a+za7H4NhYK8=;
        b=vvDAiuTl339odKMegVeCts1Yr4LQ68a0m5vqpdRtUFdJGM3IY38mhamwDV68Bvy6Kv
         8e46cstNsb2j7YKWjtxH1PbmnMF0u+IojAEcsf2Y7Q5ovpiLX3z6hyv13gbFnkdQeEC8
         5u/kVj39UQD+NsDCj7Gi5jVXwaKWU/qW5u6kHByxL4o/Hc6jTKVkdkEL/QhoW2Vh8qgN
         cG5rioSYmlycXRXW5YVKYug3YjrpzhLMV1s793/iiy26Tsa7ndQmokug5u5Be/B7jNWV
         mV1nK6Lbo7hkuSTwkB5cdsauvRfOSCKnPTr/I1uJ/VtZERJ59I9A0/16db4HoC3AVaid
         cI6A==
X-Forwarded-Encrypted: i=1; AJvYcCVJClPDw/4UAyMwRjxRFgyOFh/Kan5s1L481W4a4FweWru8/vPYmtkgLM1dv0Ye83R7BPqj0zsFCxrb1w5t@vger.kernel.org, AJvYcCWS4gPE2EZoYhfQu86NddDnUoWbWUOdmO4TbYdgK3d8vLMDqgBnEfZS4cmckj4XBYCow7tPmkIlNz9s@vger.kernel.org, AJvYcCX0MqWHW1ArhgtockCb1qXQwTHkjC9I6eu82PtEJqT3CKCKQaalrY3EtMdJYJKvOqG59piAvTDdBO4+rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPP2wvepyai5ErDOvdKQ9SUoea37fOJQoMHco9nufN9VGYMH/l
	03J7mn/eE1xfeo3+aWxwmmY2nygpUjE9tnj09BXTPYo5pe3Z9ol+
X-Google-Smtp-Source: AGHT+IFuAIVJZPXnSON5S+tdWV59T8u7Mavy6mdKVNMmOkSwywEQk/z+YqIPLSemSpBgPCDTmLLmKQ==
X-Received: by 2002:a17:906:4788:b0:a99:44ef:5e6c with SMTP id a640c23a62f3a-a99b9585dbemr165884766b.48.1728648382387;
        Fri, 11 Oct 2024 05:06:22 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99b804ea59sm88962366b.151.2024.10.11.05.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:06:21 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 8/8] pinctrl: mediatek: Add MT6735 pinctrl driver
Date: Fri, 11 Oct 2024 15:03:53 +0300
Message-ID: <20241011120520.140318-9-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241011120520.140318-1-y.oudjana@protonmail.com>
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add a driver for the MediaTek MT6735 SoC pin controller. This driver
also supports the pin controller on MT6735M, which lacks 6 physical
pins (198-203) used for MSDC2 on MT6735.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 MAINTAINERS                                   |    3 +
 drivers/pinctrl/mediatek/Kconfig              |    6 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6735.c     |  880 ++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h | 3993 +++++++++++++++++
 5 files changed, 4883 insertions(+)
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6735.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h

diff --git a/MAINTAINERS b/MAINTAINERS
index f95ae886f9fd8..28de4a76bc05a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18315,6 +18315,9 @@ PIN CONTROLLER - MEDIATEK MT6735
 M:	Yassine Oudjana <y.oudjana@protonmail.com>
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+F:	drivers/pinctrl/mediatek/pinctrl-mt6735.c
+F:	drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h
 F:	include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h
 
 PIN CONTROLLER - MICROCHIP AT91
diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 7af287252834a..73052dad0e4a1 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -133,6 +133,12 @@ config PINCTRL_MT2712
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK
 
+config PINCTRL_MT6735
+	bool "MediaTek MT6735(M) pin control"
+	depends on OF
+	default ARM64 && ARCH_MEDIATEK
+	select PINCTRL_MTK_PARIS
+
 config PINCTRL_MT6765
 	tristate "MediaTek MT6765 pin control"
 	depends on OF
diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
index 680f7e8526e00..f8ea0926b06db 100644
--- a/drivers/pinctrl/mediatek/Makefile
+++ b/drivers/pinctrl/mediatek/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_PINCTRL_MT2701)		+= pinctrl-mt2701.o
 obj-$(CONFIG_PINCTRL_MT2712)		+= pinctrl-mt2712.o
 obj-$(CONFIG_PINCTRL_MT8135)		+= pinctrl-mt8135.o
 obj-$(CONFIG_PINCTRL_MT8127)		+= pinctrl-mt8127.o
+obj-$(CONFIG_PINCTRL_MT6735)		+= pinctrl-mt6735.o
 obj-$(CONFIG_PINCTRL_MT6765)		+= pinctrl-mt6765.o
 obj-$(CONFIG_PINCTRL_MT6779)		+= pinctrl-mt6779.o
 obj-$(CONFIG_PINCTRL_MT6795)		+= pinctrl-mt6795.o
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6735.c b/drivers/pinctrl/mediatek/pinctrl-mt6735.c
new file mode 100644
index 0000000000000..3366860d8b493
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6735.c
@@ -0,0 +1,880 @@
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
+#define GPIO_DIR	0x000
+#define GPIO_DOUT	0x100
+#define GPIO_DIN	0x200
+#define GPIO_MODE1	0x300
+#define GPIO_MODE2	0x310
+#define GPIO_MODE3	0x320
+#define GPIO_MODE4	0x330
+#define GPIO_MODE5	0x340
+#define GPIO_MODE6	0x350
+#define GPIO_MODE7	0x360
+#define GPIO_MODE8	0x370
+#define GPIO_MODE9	0x380
+#define GPIO_MODE10	0x390
+#define GPIO_MODE11	0x3a0
+#define GPIO_MODE12	0x3b0
+#define GPIO_MODE13	0x3c0
+#define GPIO_MODE14	0x3d0
+#define GPIO_MODE15	0x3e0
+#define GPIO_MODE16	0x3f0
+#define GPIO_MODE17	0x400
+#define GPIO_MODE18	0x410
+#define GPIO_MODE19	0x420
+#define GPIO_MODE20	0x430
+#define GPIO_MODE21	0x440
+
+/* Pin group registers */
+#define GPIO_IES	0x000	/* 16-bit */
+#define GPIO_SMT	0x010	/* 16-bit */
+#define GPIO_TDSEL	0x020	/* 32-bit */
+#define GPIO_RDSEL	0x028	/* 32-bit */
+#define GPIO_PULLEN	0x030	/* 32-bit */
+#define GPIO_PULLSEL	0x050	/* 32-bit */
+#define GPIO_DRV	0x070	/* 32-bit */
+#define GPIO_PUPD	0x080	/* 32-bit */
+
+/* Every pin has its own bit(s) */
+#define PIN_FIELD_BASE(_s_pin, _e_pin, _i_base, _s_addr, _s_width, _x_addrs, _s_bit, _x_bits)	\
+	PIN_FIELD_CALC(_s_pin, _e_pin, _i_base, _s_addr, _x_addrs, _s_bit,	\
+		       _x_bits, _s_width, 0)
+
+/* All pins in the range share the same bit(s) */
+#define PINS_FIELD_BASE(_s_pin, _e_pin, _i_base, _s_addr, _s_width, _x_addrs, _s_bit, _x_bits)	\
+	PIN_FIELD_CALC(_s_pin, _e_pin, _i_base, _s_addr, _x_addrs, _s_bit,	\
+		      _x_bits, _s_width, 1)
+
+static const struct mtk_pin_field_calc mt6735_pin_dir_range[] = {
+	PIN_FIELD(0, 203, GPIO_DIR, 0x10, 0, 1)
+};
+
+static const struct mtk_pin_field_calc mt6735_pin_di_range[] = {
+	PIN_FIELD(0, 203, GPIO_DIN, 0x10, 0, 1)
+};
+
+static const struct mtk_pin_field_calc mt6735_pin_do_range[] = {
+	PIN_FIELD(0, 203, GPIO_DOUT, 0x10, 0, 1)
+};
+
+static const struct mtk_pin_field_calc mt6735_pin_mode_range[] = {
+	PIN_FIELD(0, 4, GPIO_MODE1, 0, 0, 3),
+	PIN_FIELD(5, 9, GPIO_MODE1, 0, 16, 3),
+	PIN_FIELD(10, 14, GPIO_MODE2, 0, 0, 3),
+	PIN_FIELD(15, 19, GPIO_MODE2, 0, 16, 3),
+	PIN_FIELD(20, 24, GPIO_MODE3, 0, 0, 3),
+	PIN_FIELD(25, 29, GPIO_MODE3, 0, 16, 3),
+	PIN_FIELD(30, 34, GPIO_MODE4, 0, 0, 3),
+	PIN_FIELD(35, 39, GPIO_MODE4, 0, 16, 3),
+	PIN_FIELD(40, 44, GPIO_MODE5, 0, 0, 3),
+	PIN_FIELD(45, 49, GPIO_MODE5, 0, 16, 3),
+	PIN_FIELD(50, 54, GPIO_MODE6, 0, 0, 3),
+	PIN_FIELD(55, 59, GPIO_MODE6, 0, 16, 3),
+	PIN_FIELD(60, 64, GPIO_MODE7, 0, 0, 3),
+	PIN_FIELD(65, 69, GPIO_MODE7, 0, 16, 3),
+	PIN_FIELD(70, 74, GPIO_MODE8, 0, 0, 3),
+	PIN_FIELD(75, 79, GPIO_MODE8, 0, 16, 3),
+	PIN_FIELD(80, 84, GPIO_MODE9, 0, 0, 3),
+	PIN_FIELD(85, 89, GPIO_MODE9, 0, 16, 3),
+	PIN_FIELD(90, 94, GPIO_MODE10, 0, 0, 3),
+	PIN_FIELD(95, 99, GPIO_MODE10, 0, 16, 3),
+	PIN_FIELD(100, 104, GPIO_MODE11, 0, 0, 3),
+	PIN_FIELD(105, 109, GPIO_MODE11, 0, 16, 3),
+	PIN_FIELD(110, 114, GPIO_MODE12, 0, 0, 3),
+	PIN_FIELD(115, 119, GPIO_MODE12, 0, 16, 3),
+	PIN_FIELD(120, 124, GPIO_MODE13, 0, 0, 3),
+	PIN_FIELD(125, 129, GPIO_MODE13, 0, 16, 3),
+	PIN_FIELD(130, 134, GPIO_MODE14, 0, 0, 3),
+	PIN_FIELD(135, 139, GPIO_MODE14, 0, 16, 3),
+	PIN_FIELD(140, 144, GPIO_MODE15, 0, 0, 3),
+	PIN_FIELD(145, 149, GPIO_MODE15, 0, 16, 3),
+	PIN_FIELD(150, 154, GPIO_MODE16, 0, 0, 3),
+	PIN_FIELD(155, 159, GPIO_MODE16, 0, 16, 3),
+	PIN_FIELD(160, 164, GPIO_MODE17, 0, 0, 3),
+	PIN_FIELD(165, 169, GPIO_MODE17, 0, 16, 3),
+	PIN_FIELD(170, 174, GPIO_MODE18, 0, 0, 3),
+	PIN_FIELD(175, 179, GPIO_MODE18, 0, 16, 3),
+	PIN_FIELD(180, 184, GPIO_MODE19, 0, 0, 3),
+	PIN_FIELD(185, 189, GPIO_MODE19, 0, 16, 3),
+	PIN_FIELD(190, 194, GPIO_MODE20, 0, 0, 3),
+	PIN_FIELD(195, 199, GPIO_MODE20, 0, 16, 3),
+	PIN_FIELD(200, 203, GPIO_MODE21, 0, 0, 3),
+};
+
+
+static const struct mtk_pin_field_calc mt6735_pin_smt_range[] = {
+	PINS_FIELD_BASE(0, 4, 2, GPIO_SMT, 16, 0, 10, 1),		/* EINT0~4 */
+	PINS_FIELD_BASE(5, 8, 3, GPIO_SMT, 16, 0, 3, 1),		/* EINT5~8 */
+	PINS_FIELD_BASE(9, 12, 3, GPIO_SMT, 16, 0, 6, 1),		/* EINT9~12 */
+	PINS_FIELD_BASE(13, 18, 1, GPIO_SMT, 16, 0, 0, 1),		/* WB_CTRL */
+	PINS_FIELD_BASE(19, 21, 1, GPIO_SMT, 16, 0, 1, 1),		/* ANTSEL */
+	PINS_FIELD_BASE(45, 46, 2, GPIO_SMT, 16, 0, 1, 1),		/* CMMCLK */
+	PINS_FIELD_BASE(47, 48, 2, GPIO_SMT, 16, 0, 2, 1),		/* I2C0 */
+	PINS_FIELD_BASE(49, 50, 2, GPIO_SMT, 16, 0, 3, 1),		/* I2C1 */
+	PINS_FIELD_BASE(51, 52, 2, GPIO_SMT, 16, 0, 4, 1),		/* I2C2 */
+	PINS_FIELD_BASE(53, 54, 2, GPIO_SMT, 16, 0, 5, 1),		/* I2C3 */
+	PINS_FIELD_BASE(55, 55, 2, GPIO_SMT, 16, 0, 6, 1),		/* SRCLKENAI */
+	PINS_FIELD_BASE(56, 56, 2, GPIO_SMT, 16, 0, 7, 1),		/* SRCLKENA1 */
+	PINS_FIELD_BASE(57, 60, 2, GPIO_SMT, 16, 0, 8, 1),		/* UART2/3 */
+	PINS_FIELD_BASE(61, 64, 2, GPIO_SMT, 16, 0, 9, 1),		/* PCM */
+	PINS_FIELD_BASE(65, 68, 3, GPIO_SMT, 16, 0, 0, 1),		/* SPI */
+	PINS_FIELD_BASE(69, 69, 3, GPIO_SMT, 16, 0, 1, 1),		/* DISP_PWM */
+	PINS_FIELD_BASE(70, 73, 3, GPIO_SMT, 16, 0, 2, 1),		/* JTAG */
+	PINS_FIELD_BASE(74, 77, 3, GPIO_SMT, 16, 0, 4, 1),		/* UART0/1 */
+	PINS_FIELD_BASE(78, 80, 3, GPIO_SMT, 16, 0, 5, 1),		/* I2S */
+	PINS_FIELD_BASE(81, 86, 3, GPIO_SMT, 16, 0, 7, 1),		/* KEYPAD */
+	PINS_FIELD_BASE(87, 103, 3, GPIO_SMT, 16, 0, 8, 1),		/* BPI5~20, C2K_TKBPI */
+	PINS_FIELD_BASE(104, 114, 3, GPIO_SMT, 16, 0, 9, 1),		/* RFIC0/1 */
+	PINS_FIELD_BASE(118, 136, 4, GPIO_SMT, 16, 0, 0, 1),		/* LTE_TXBPI, BPI0~4, BPI21~27, PAVM */
+	PINS_FIELD_BASE(137, 137, 4, GPIO_SMT, 16, 0, 1, 1),		/* RTC32K */
+	PINS_FIELD_BASE(138, 142, 4, GPIO_SMT, 16, 0, 2, 1),		/* PWRAP */
+	PINS_FIELD_BASE(143, 145, 4, GPIO_SMT, 16, 0, 3, 1),		/* AUD */
+	PINS_FIELD_BASE(146, 147, 4, GPIO_SMT, 16, 0, 4, 1),		/* LCM_RST, DSI_TE */
+	PINS_FIELD_BASE(148, 148, 4, GPIO_SMT, 16, 0, 5, 1),		/* SRCLKENA0 */
+	PINS_FIELD_BASE(149, 149, 4, GPIO_SMT, 16, 0, 1, 1),		/* WATCHDOG */
+	PINS_FIELD_BASE(160, 162, 5, GPIO_SMT, 16, 0, 0, 1),		/* SIM2 */
+	PINS_FIELD_BASE(163, 165, 4, GPIO_SMT, 16, 0, 1, 1),		/* SIM1 */
+	PINS_FIELD_BASE(166, 166, 5, GPIO_SMT, 16, 0, 2, 1),		/* MSDC1_CMD */
+	PINS_FIELD_BASE(167, 167, 5, GPIO_SMT, 16, 0, 3, 1),		/* MSDC1_CLK */
+	PINS_FIELD_BASE(168, 171, 5, GPIO_SMT, 16, 0, 4, 1),		/* MSDC1_DAT */
+	PINS_FIELD_BASE(172, 172, 6, GPIO_SMT, 16, 0, 0, 1),		/* MSDC0_CMD */
+	PINS_FIELD_BASE(173, 173, 6, GPIO_SMT, 16, 0, 1, 1),		/* MSDC0_DSL */
+	PINS_FIELD_BASE(174, 174, 6, GPIO_SMT, 16, 0, 2, 1),		/* MSDC0_CLK */
+	PINS_FIELD_BASE(175, 182, 6, GPIO_SMT, 16, 0, 3, 1),		/* MSDC0_DAT */
+	PINS_FIELD_BASE(183, 183, 6, GPIO_SMT, 16, 0, 4, 1),		/* MSDC0_RSTB */
+	PINS_FIELD_BASE(184, 185, 6, GPIO_SMT, 16, 0, 5, 1),		/* FM */
+	PINS_FIELD_BASE(186, 189, 6, GPIO_SMT, 16, 0, 6, 1),		/* WB SPI */
+	PINS_FIELD_BASE(198, 198, 1, GPIO_SMT, 16, 0, 2, 1),		/* MSDC2_CMD */
+	PINS_FIELD_BASE(199, 199, 1, GPIO_SMT, 16, 0, 3, 1),		/* MSDC2_CLK */
+	PINS_FIELD_BASE(200, 203, 1, GPIO_SMT, 16, 0, 4, 1),		/* MSDC2_DAT */
+};
+
+static const struct mtk_pin_field_calc mt6735_pin_ies_range[] = {
+	PINS_FIELD_BASE(0, 4, 2, GPIO_IES, 16, 0, 10, 1),		/* EINT0~4 */
+	PINS_FIELD_BASE(5, 8, 3, GPIO_IES, 16, 0, 3, 1),		/* EINT5~8 */
+	PINS_FIELD_BASE(9, 12, 3, GPIO_IES, 16, 0, 6, 1),		/* EINT9~12 */
+	PINS_FIELD_BASE(13, 18, 1, GPIO_IES, 16, 0, 0, 1),		/* WB_CTRL */
+	PINS_FIELD_BASE(19, 21, 1, GPIO_IES, 16, 0, 1, 1),		/* ANTSEL */
+	PINS_FIELD_BASE(45, 46, 2, GPIO_IES, 16, 0, 1, 1),		/* CMMCLK */
+	PINS_FIELD_BASE(47, 48, 2, GPIO_IES, 16, 0, 2, 1),		/* I2C0 */
+	PINS_FIELD_BASE(49, 50, 2, GPIO_IES, 16, 0, 3, 1),		/* I2C1 */
+	PINS_FIELD_BASE(51, 52, 2, GPIO_IES, 16, 0, 4, 1),		/* I2C2 */
+	PINS_FIELD_BASE(53, 54, 2, GPIO_IES, 16, 0, 5, 1),		/* I2C3 */
+	PINS_FIELD_BASE(55, 55, 2, GPIO_IES, 16, 0, 6, 1),		/* SRCLKENAI */
+	PINS_FIELD_BASE(56, 56, 2, GPIO_IES, 16, 0, 7, 1),		/* SRCLKENA1 */
+	PINS_FIELD_BASE(57, 60, 2, GPIO_IES, 16, 0, 8, 1),		/* UART2/3 */
+	PINS_FIELD_BASE(61, 64, 2, GPIO_IES, 16, 0, 9, 1),		/* PCM */
+	PINS_FIELD_BASE(65, 68, 3, GPIO_IES, 16, 0, 0, 1),		/* SPI */
+	PINS_FIELD_BASE(69, 69, 3, GPIO_IES, 16, 0, 1, 1),		/* DISP_PWM */
+	PINS_FIELD_BASE(70, 73, 3, GPIO_IES, 16, 0, 2, 1),		/* JTAG */
+	PINS_FIELD_BASE(74, 77, 3, GPIO_IES, 16, 0, 4, 1),		/* UART0/1 */
+	PINS_FIELD_BASE(78, 80, 3, GPIO_IES, 16, 0, 5, 1),		/* I2S */
+	PINS_FIELD_BASE(81, 86, 3, GPIO_IES, 16, 0, 7, 1),		/* KEYPAD */
+	PINS_FIELD_BASE(87, 103, 3, GPIO_IES, 16, 0, 8, 1),		/* BPI5~20, C2K_TKBPI */
+	PINS_FIELD_BASE(104, 114, 3, GPIO_IES, 16, 0, 9, 1),		/* RFIC0/1 */
+	PINS_FIELD_BASE(118, 136, 4, GPIO_IES, 16, 0, 0, 1),		/* LTE_TXBPI, BPI0~4, BPI21~27, PAVM */
+	PINS_FIELD_BASE(137, 137, 4, GPIO_IES, 16, 0, 1, 1),		/* RTC32K */
+	PINS_FIELD_BASE(138, 142, 4, GPIO_IES, 16, 0, 2, 1),		/* PWRAP */
+	PINS_FIELD_BASE(143, 145, 4, GPIO_IES, 16, 0, 3, 1),		/* AUD */
+	PINS_FIELD_BASE(146, 147, 4, GPIO_IES, 16, 0, 4, 1),		/* LCM_RST, DSI_TE */
+	PINS_FIELD_BASE(148, 148, 4, GPIO_IES, 16, 0, 5, 1),		/* SRCLKENA0 */
+	PINS_FIELD_BASE(149, 149, 4, GPIO_IES, 16, 0, 1, 1),		/* WATCHDOG */
+	PINS_FIELD_BASE(160, 162, 5, GPIO_IES, 16, 0, 0, 1),		/* SIM2 */
+	PINS_FIELD_BASE(163, 165, 4, GPIO_IES, 16, 0, 1, 1),		/* SIM1 */
+	PINS_FIELD_BASE(166, 166, 5, GPIO_IES, 16, 0, 2, 1),		/* MSDC1_CMD */
+	PINS_FIELD_BASE(167, 167, 5, GPIO_IES, 16, 0, 3, 1),		/* MSDC1_CLK */
+	PINS_FIELD_BASE(168, 171, 5, GPIO_IES, 16, 0, 4, 1),		/* MSDC1_DAT */
+	PINS_FIELD_BASE(172, 172, 6, GPIO_IES, 16, 0, 0, 1),		/* MSDC0_CMD */
+	PINS_FIELD_BASE(173, 173, 6, GPIO_IES, 16, 0, 1, 1),		/* MSDC0_DSL */
+	PINS_FIELD_BASE(174, 174, 6, GPIO_IES, 16, 0, 2, 1),		/* MSDC0_CLK */
+	PINS_FIELD_BASE(175, 182, 6, GPIO_IES, 16, 0, 3, 1),		/* MSDC0_DAT */
+	PINS_FIELD_BASE(183, 183, 6, GPIO_IES, 16, 0, 4, 1),		/* MSDC0_RSTB */
+	PINS_FIELD_BASE(184, 185, 6, GPIO_IES, 16, 0, 5, 1),		/* FM */
+	PINS_FIELD_BASE(186, 189, 6, GPIO_IES, 16, 0, 6, 1),		/* WB SPI */
+	PINS_FIELD_BASE(198, 198, 1, GPIO_IES, 16, 0, 2, 1),		/* MSDC2_CMD */
+	PINS_FIELD_BASE(199, 199, 1, GPIO_IES, 16, 0, 3, 1),		/* MSDC2_CLK */
+	PINS_FIELD_BASE(200, 203, 1, GPIO_IES, 16, 0, 4, 1)		/* MSDC2_DAT */
+};
+
+static const struct mtk_pin_field_calc mt6735_pin_tdsel_range[] = {
+	PINS_FIELD_BASE(0, 4, 2, GPIO_TDSEL, 32, 0x04, 40, 4),		/* EINT0~4 */
+	PINS_FIELD_BASE(5, 8, 3, GPIO_TDSEL, 32, 0x04, 12, 4),		/* EINT5~8 */
+	PINS_FIELD_BASE(9, 12, 3, GPIO_TDSEL, 32, 0x04, 24, 4),		/* EINT9~12 */
+	PINS_FIELD_BASE(13, 18, 1, GPIO_TDSEL, 32, 0, 0, 4),		/* WB_CTRL */
+	PINS_FIELD_BASE(19, 21, 1, GPIO_TDSEL, 32, 0, 4, 4),		/* ANTSEL */
+	PINS_FIELD_BASE(45, 46, 2, GPIO_TDSEL, 32, 0x04, 4, 4),		/* CMMCLK */
+	PINS_FIELD_BASE(47, 48, 2, GPIO_TDSEL, 32, 0x04, 8, 4),		/* I2C0 */
+	PINS_FIELD_BASE(49, 50, 2, GPIO_TDSEL, 32, 0x04, 12, 4),	/* I2C1 */
+	PINS_FIELD_BASE(51, 52, 2, GPIO_TDSEL, 32, 0x04, 16, 4),	/* I2C2 */
+	PINS_FIELD_BASE(53, 54, 2, GPIO_TDSEL, 32, 0x04, 20, 4),	/* I2C3 */
+	PINS_FIELD_BASE(55, 55, 2, GPIO_TDSEL, 32, 0x04, 24, 4),	/* SRCLKENAI */
+	PINS_FIELD_BASE(56, 56, 2, GPIO_TDSEL, 32, 0x04, 28, 4),	/* SRCLKENA1 */
+	PINS_FIELD_BASE(57, 60, 2, GPIO_TDSEL, 32, 0x04, 32, 4),	/* UART2/3 */
+	PINS_FIELD_BASE(61, 64, 2, GPIO_TDSEL, 32, 0x04, 36, 4),	/* PCM */
+	PINS_FIELD_BASE(65, 68, 3, GPIO_TDSEL, 32, 0x04, 0, 4),		/* SPI */
+	PINS_FIELD_BASE(69, 69, 3, GPIO_TDSEL, 32, 0x04, 4, 4),		/* DISP_PWM */
+	PINS_FIELD_BASE(70, 73, 3, GPIO_TDSEL, 32, 0x04, 8, 4),		/* JTAG */
+	PINS_FIELD_BASE(74, 77, 3, GPIO_TDSEL, 32, 0x04, 16, 4),	/* UART0/1 */
+	PINS_FIELD_BASE(78, 80, 3, GPIO_TDSEL, 32, 0x04, 20, 4),	/* I2S */
+	PINS_FIELD_BASE(81, 86, 3, GPIO_TDSEL, 32, 0x04, 28, 4),	/* KEYPAD */
+	PINS_FIELD_BASE(87, 103, 3, GPIO_TDSEL, 32, 0x04, 32, 4),	/* BPI5~20, C2K_TKBPI */
+	PINS_FIELD_BASE(104, 114, 3, GPIO_TDSEL, 32, 0x04, 36, 4),	/* RFIC0/1 */
+	PINS_FIELD_BASE(118, 136, 4, GPIO_TDSEL, 32, 0, 0, 4),		/* LTE_TXBPI, BPI0~4, BPI21~27, PAVM */
+	PINS_FIELD_BASE(137, 137, 4, GPIO_TDSEL, 32, 0, 4, 4),		/* RTC32K */
+	PINS_FIELD_BASE(138, 142, 4, GPIO_TDSEL, 32, 0, 8, 4),		/* PWRAP */
+	PINS_FIELD_BASE(143, 145, 4, GPIO_TDSEL, 32, 0, 12, 4),		/* AUD */
+	PINS_FIELD_BASE(146, 147, 4, GPIO_TDSEL, 32, 0, 16, 4),		/* LCM_RST, DSI_TE */
+	PINS_FIELD_BASE(148, 148, 4, GPIO_TDSEL, 32, 0, 20, 4),		/* SRCLKENA0 */
+	PINS_FIELD_BASE(149, 149, 4, GPIO_TDSEL, 32, 0, 4, 4),		/* WATCHDOG */
+	PINS_FIELD_BASE(160, 162, 5, GPIO_TDSEL, 32, 0, 0, 4),		/* SIM2 */
+	PINS_FIELD_BASE(163, 165, 5, GPIO_TDSEL, 32, 0, 4, 4),		/* SIM1 */
+	PINS_FIELD_BASE(166, 166, 5, GPIO_TDSEL, 32, 0, 8, 4),		/* MSDC1_CMD */
+	PINS_FIELD_BASE(167, 167, 5, GPIO_TDSEL, 32, 0, 12, 4),		/* MSDC1_CLK */
+	PINS_FIELD_BASE(168, 171, 5, GPIO_TDSEL, 32, 0, 16, 4),		/* MSDC1_DAT */
+	PINS_FIELD_BASE(172, 172, 6, GPIO_TDSEL, 32, 0, 0, 4),		/* MSDC0_CMD */
+	PINS_FIELD_BASE(173, 173, 6, GPIO_TDSEL, 32, 0, 4, 4),		/* MSDC0_DSL */
+	PINS_FIELD_BASE(174, 174, 6, GPIO_TDSEL, 32, 0, 8, 4),		/* MSDC0_CLK */
+	PINS_FIELD_BASE(175, 182, 6, GPIO_TDSEL, 32, 0, 12, 4),		/* MSDC0_DAT */
+	PINS_FIELD_BASE(183, 183, 6, GPIO_TDSEL, 32, 0, 16, 4),		/* MSDC0_RSTB */
+	PINS_FIELD_BASE(184, 185, 6, GPIO_TDSEL, 32, 0, 20, 4),		/* FM */
+	PINS_FIELD_BASE(186, 189, 6, GPIO_TDSEL, 32, 0, 24, 4),		/* WB SPI */
+	PINS_FIELD_BASE(198, 198, 1, GPIO_TDSEL, 32, 0, 8, 4),		/* MSDC2_CMD */
+	PINS_FIELD_BASE(199, 199, 1, GPIO_TDSEL, 32, 0, 12, 4),		/* MSDC2_CLK */
+	PINS_FIELD_BASE(200, 203, 1, GPIO_TDSEL, 32, 0, 16, 4)		/* MSDC2_DAT */
+};
+
+static const struct mtk_pin_field_calc mt6735_pin_rdsel_range[] = {
+	PINS_FIELD_BASE(0, 4, 2, GPIO_RDSEL, 32, 0x04, 24, 2),		/* EINT0~4 */
+	PINS_FIELD_BASE(5, 8, 3, GPIO_RDSEL, 32, 0, 6, 2),		/* EINT5~8 */
+	PINS_FIELD_BASE(9, 12, 3, GPIO_RDSEL, 32, 0, 12, 2),		/* EINT9~12 */
+	PINS_FIELD_BASE(13, 18, 1, GPIO_RDSEL, 32, 0, 0, 2),		/* WB_CTRL */
+	PINS_FIELD_BASE(19, 21, 1, GPIO_RDSEL, 32, 0, 2, 2),		/* ANTSEL */
+	PINS_FIELD_BASE(45, 46, 2, GPIO_RDSEL, 32, 0x04, 2, 6),		/* CMMCLK */
+	PINS_FIELD_BASE(47, 48, 2, GPIO_RDSEL, 32, 0x04, 8, 2),		/* I2C0 */
+	PINS_FIELD_BASE(49, 50, 2, GPIO_RDSEL, 32, 0x04, 10, 2),	/* I2C1 */
+	PINS_FIELD_BASE(51, 52, 2, GPIO_RDSEL, 32, 0x04, 12, 2),	/* I2C2 */
+	PINS_FIELD_BASE(53, 54, 2, GPIO_RDSEL, 32, 0x04, 14, 2),	/* I2C3 */
+	PINS_FIELD_BASE(55, 55, 2, GPIO_RDSEL, 32, 0x04, 16, 2),	/* SRCLKENAI */
+	PINS_FIELD_BASE(56, 56, 2, GPIO_RDSEL, 32, 0x04, 18, 2),	/* SRCLKENA1 */
+	PINS_FIELD_BASE(57, 60, 2, GPIO_RDSEL, 32, 0x04, 20, 2),	/* UART2/3 */
+	PINS_FIELD_BASE(61, 64, 2, GPIO_RDSEL, 32, 0x04, 22, 2),	/* PCM */
+	PINS_FIELD_BASE(65, 68, 3, GPIO_RDSEL, 32, 0, 0, 2),		/* SPI */
+	PINS_FIELD_BASE(69, 69, 3, GPIO_RDSEL, 32, 0, 2, 2),		/* DISP_PWM */
+	PINS_FIELD_BASE(70, 73, 3, GPIO_RDSEL, 32, 0, 4, 2),		/* JTAG */
+	PINS_FIELD_BASE(74, 77, 3, GPIO_RDSEL, 32, 0, 8, 2),		/* UART0/1 */
+	PINS_FIELD_BASE(78, 80, 3, GPIO_RDSEL, 32, 0, 10, 2),		/* I2S */
+	PINS_FIELD_BASE(81, 86, 3, GPIO_RDSEL, 32, 0, 14, 2),		/* KEYPAD */
+	PINS_FIELD_BASE(87, 103, 3, GPIO_RDSEL, 32, 0, 16, 2),		/* BPI5~20, C2K_TKBPI */
+	PINS_FIELD_BASE(104, 114, 3, GPIO_RDSEL, 32, 0, 18, 2),		/* RFIC0/1 */
+	PINS_FIELD_BASE(118, 136, 4, GPIO_RDSEL, 32, 0, 0, 2),		/* LTE_TXBPI, BPI0~4, BPI21~27, PAVM */
+	PINS_FIELD_BASE(137, 137, 4, GPIO_RDSEL, 32, 0, 4, 2),		/* RTC32K */
+	PINS_FIELD_BASE(138, 142, 4, GPIO_RDSEL, 32, 0, 6, 2),		/* PWRAP */
+	PINS_FIELD_BASE(143, 145, 4, GPIO_RDSEL, 32, 0, 8, 2),		/* AUD */
+	PINS_FIELD_BASE(146, 147, 4, GPIO_RDSEL, 32, 0, 10, 2),		/* LCM_RST, DSI_TE */
+	PINS_FIELD_BASE(148, 148, 4, GPIO_RDSEL, 32, 0, 12, 2),		/* SRCLKENA0 */
+	PINS_FIELD_BASE(149, 149, 4, GPIO_RDSEL, 32, 0, 4, 2),		/* WATCHDOG */
+	PINS_FIELD_BASE(160, 162, 5, GPIO_RDSEL, 32, 0, 0, 6),		/* SIM2 */
+	PINS_FIELD_BASE(163, 165, 5, GPIO_RDSEL, 32, 0, 6, 6),		/* SIM1 */
+	PINS_FIELD_BASE(166, 166, 5, GPIO_RDSEL, 32, 0, 12, 6),		/* MSDC1_CMD */
+	PINS_FIELD_BASE(167, 167, 5, GPIO_RDSEL, 32, 0, 18, 6),		/* MSDC1_CLK */
+	PINS_FIELD_BASE(168, 171, 5, GPIO_RDSEL, 32, 0, 24, 6),		/* MSDC1_DAT */
+	PINS_FIELD_BASE(172, 172, 6, GPIO_RDSEL, 32, 0, 0, 6),		/* MSDC0_CMD */
+	PINS_FIELD_BASE(173, 173, 6, GPIO_RDSEL, 32, 0, 6, 6),		/* MSDC0_DSL */
+	PINS_FIELD_BASE(174, 174, 6, GPIO_RDSEL, 32, 0, 12, 6),		/* MSDC0_CLK */
+	PINS_FIELD_BASE(175, 182, 6, GPIO_RDSEL, 32, 0, 18, 6),		/* MSDC0_DAT */
+	PINS_FIELD_BASE(183, 183, 6, GPIO_RDSEL, 32, 0, 24, 6),		/* MSDC0_RSTB */
+	PINS_FIELD_BASE(184, 185, 6, GPIO_RDSEL, 32, 0, 30, 2),		/* FM */
+	PINS_FIELD_BASE(186, 189, 6, GPIO_RDSEL, 32, 0, 32, 2),		/* WB SPI */
+	PINS_FIELD_BASE(198, 198, 1, GPIO_RDSEL, 32, 0, 4, 6),		/* MSDC2_CMD */
+	PINS_FIELD_BASE(199, 199, 1, GPIO_RDSEL, 32, 0, 10, 6),		/* MSDC2_CLK */
+	PINS_FIELD_BASE(200, 203, 1, GPIO_RDSEL, 32, 0, 16, 6)		/* MSDC2_DAT */
+};
+
+static const struct mtk_pin_field_calc mt6735_pin_drv_range[] = {
+	PINS_FIELD_BASE(0, 4, 2, GPIO_DRV, 32, 0x04, 41, 2),		/* EINT0~4 */
+	PINS_FIELD_BASE(5, 8, 3, GPIO_DRV, 32, 0x04, 13, 2),		/* EINT5~8 */
+	PINS_FIELD_BASE(9, 12, 3, GPIO_DRV, 32, 0x04, 25, 2),		/* EINT9~12 */
+	PINS_FIELD_BASE(13, 18, 1, GPIO_DRV, 32, 0, 1, 2),		/* WB_CTRL */
+	PINS_FIELD_BASE(19, 21, 1, GPIO_DRV, 32, 0, 5, 2),		/* ANTSEL */
+	PINS_FIELD_BASE(45, 46, 2, GPIO_DRV, 32, 0x04, 4, 3),		/* CMMCLK */
+	PINS_FIELD_BASE(55, 55, 2, GPIO_DRV, 32, 0x04, 25, 2),		/* SRCLKENAI */
+	PINS_FIELD_BASE(56, 56, 2, GPIO_DRV, 32, 0x04, 29, 2),		/* SRCLKENA1 */
+	PINS_FIELD_BASE(57, 60, 2, GPIO_DRV, 32, 0x04, 33, 2),		/* UART2/3 */
+	PINS_FIELD_BASE(61, 64, 2, GPIO_DRV, 32, 0x04, 37, 2),		/* PCM */
+	PINS_FIELD_BASE(65, 68, 3, GPIO_DRV, 32, 0x04, 1, 2),		/* SPI */
+	PINS_FIELD_BASE(69, 69, 3, GPIO_DRV, 32, 0x04, 5, 2),		/* DISP_PWM */
+	PINS_FIELD_BASE(70, 73, 3, GPIO_DRV, 32, 0x04, 9, 2),		/* JTAG */
+	PINS_FIELD_BASE(74, 77, 3, GPIO_DRV, 32, 0x04, 17, 2),		/* UART0/1 */
+	PINS_FIELD_BASE(78, 80, 3, GPIO_DRV, 32, 0x04, 21, 2),		/* I2S */
+	PINS_FIELD_BASE(81, 86, 3, GPIO_DRV, 32, 0x04, 29, 2),		/* KEYPAD */
+	PINS_FIELD_BASE(87, 103, 3, GPIO_DRV, 32, 0x04, 33, 2),		/* BPI5~20, C2K_TKBPI */
+	PINS_FIELD_BASE(104, 114, 3, GPIO_DRV, 32, 0x04, 37, 2),	/* RFIC0/1 */
+	PINS_FIELD_BASE(118, 136, 4, GPIO_DRV, 32, 0, 1, 2),		/* LTE_TXBPI, BPI0~4, BPI21~27, PAVM */
+	PINS_FIELD_BASE(137, 137, 4, GPIO_DRV, 32, 0, 5, 2),		/* RTC32K */
+	PINS_FIELD_BASE(138, 142, 4, GPIO_DRV, 32, 0, 9, 2),		/* PWRAP */
+	PINS_FIELD_BASE(143, 145, 4, GPIO_DRV, 32, 0, 13, 2),		/* AUD */
+	PINS_FIELD_BASE(146, 147, 4, GPIO_DRV, 32, 0, 17, 2),		/* LCM_RST, DSI_TE */
+	PINS_FIELD_BASE(148, 148, 4, GPIO_DRV, 32, 0, 21, 2),		/* SRCLKENA0 */
+	PINS_FIELD_BASE(149, 149, 4, GPIO_DRV, 32, 0, 5, 2),		/* WATCHDOG */
+	PINS_FIELD_BASE(160, 162, 5, GPIO_DRV, 32, 0, 1, 2),		/* SIM2 */
+	PINS_FIELD_BASE(163, 165, 5, GPIO_DRV, 32, 0, 5, 2),		/* SIM1 */
+	PINS_FIELD_BASE(166, 166, 5, GPIO_DRV, 32, 0, 9, 3),		/* MSDC1_CMD */
+	PINS_FIELD_BASE(167, 167, 5, GPIO_DRV, 32, 0, 12, 3),		/* MSDC1_CLK */
+	PINS_FIELD_BASE(168, 171, 5, GPIO_DRV, 32, 0, 16, 3),		/* MSDC1_DAT */
+	PINS_FIELD_BASE(172, 172, 6, GPIO_DRV, 32, 0, 0, 3),		/* MSDC0_CMD */
+	PINS_FIELD_BASE(173, 173, 6, GPIO_DRV, 32, 0, 4, 3),		/* MSDC0_DSL */
+	PINS_FIELD_BASE(174, 174, 6, GPIO_DRV, 32, 0, 8, 3),		/* MSDC0_CLK */
+	PINS_FIELD_BASE(175, 182, 6, GPIO_DRV, 32, 0, 12, 3),		/* MSDC0_DAT */
+	PINS_FIELD_BASE(183, 183, 6, GPIO_DRV, 32, 0, 16, 3),		/* MSDC0_RSTB */
+	PINS_FIELD_BASE(184, 185, 6, GPIO_DRV, 32, 0, 21, 2),		/* FM */
+	PINS_FIELD_BASE(186, 189, 6, GPIO_DRV, 32, 0, 25, 2),		/* WB SPI */
+	PINS_FIELD_BASE(198, 198, 1, GPIO_DRV, 32, 0, 8, 3),		/* MSDC2_CMD */
+	PINS_FIELD_BASE(199, 199, 1, GPIO_DRV, 32, 0, 12, 3),		/* MSDC2_CLK */
+	PINS_FIELD_BASE(200, 203, 1, GPIO_DRV, 32, 0, 16, 3)		/* MSDC2_DAT */
+};
+
+static const struct mtk_pin_field_calc mt6735_pin_r0_range[] = {
+	PINS_FIELD_BASE(45, 45, 2, GPIO_PUPD, 32, 0, 0, 1),		/* CMMCLK0 */
+	PINS_FIELD_BASE(46, 46, 2, GPIO_PUPD, 32, 0, 4, 1),		/* CMMCLK1 */
+	PINS_FIELD_BASE(81, 81, 3, GPIO_PUPD, 32, 0, 0, 1),		/* KPROW0 */
+	PINS_FIELD_BASE(82, 82, 3, GPIO_PUPD, 32, 0, 4, 1),		/* KPROW1 */
+	PINS_FIELD_BASE(83, 83, 3, GPIO_PUPD, 32, 0, 8, 1),		/* KPROW2 */
+	PINS_FIELD_BASE(84, 84, 3, GPIO_PUPD, 32, 0, 16, 1),		/* KPCOL0 */
+	PINS_FIELD_BASE(85, 85, 3, GPIO_PUPD, 32, 0, 20, 1),		/* KPCOL1 */
+	PINS_FIELD_BASE(86, 86, 3, GPIO_PUPD, 32, 0, 24, 1),		/* KPCOL2 */
+	PINS_FIELD_BASE(160, 160, 5, GPIO_PUPD, 32, 0x10, 32, 1),	/* SIM2_SCLK */
+	PINS_FIELD_BASE(161, 161, 5, GPIO_PUPD, 32, 0x10, 36, 1),	/* SIM2_SRST */
+	PINS_FIELD_BASE(162, 162, 5, GPIO_PUPD, 32, 0x10, 44, 1),	/* SIM2_SDAT */
+	PINS_FIELD_BASE(163, 163, 5, GPIO_PUPD, 32, 0x10, 48, 1),	/* SIM1_SCLK */
+	PINS_FIELD_BASE(164, 164, 5, GPIO_PUPD, 32, 0x10, 52, 1),	/* SIM1_SRST */
+	PINS_FIELD_BASE(165, 165, 5, GPIO_PUPD, 32, 0x10, 56, 1),	/* SIM1_SDAT */
+	PINS_FIELD_BASE(166, 166, 5, GPIO_PUPD, 32, 0x10, 0, 1),	/* MSDC1_CMD */
+	PINS_FIELD_BASE(167, 167, 5, GPIO_PUPD, 32, 0x10, 4, 1),	/* MSDC1_CLK */
+	PINS_FIELD_BASE(168, 168, 5, GPIO_PUPD, 32, 0x10, 8, 1),	/* MSDC1_DAT0 */
+	PINS_FIELD_BASE(169, 169, 5, GPIO_PUPD, 32, 0x10, 12, 1),	/* MSDC1_DAT1 */
+	PINS_FIELD_BASE(170, 170, 5, GPIO_PUPD, 32, 0x10, 16, 1),	/* MSDC1_DAT2 */
+	PINS_FIELD_BASE(171, 171, 5, GPIO_PUPD, 32, 0x10, 20, 1),	/* MSDC1_DAT3 */
+	PINS_FIELD_BASE(172, 172, 6, GPIO_PUPD, 32, 0x10, 0, 1),	/* MSDC0_CMD */
+	PINS_FIELD_BASE(173, 173, 6, GPIO_PUPD, 32, 0x10, 8, 1),	/* MSDC0_DSL */
+	PINS_FIELD_BASE(174, 174, 6, GPIO_PUPD, 32, 0x10, 4, 1),	/* MSDC0_CLK */
+	PINS_FIELD_BASE(175, 175, 6, GPIO_PUPD, 32, 0x10, 12, 1),	/* MSDC0_DAT0 */
+	PINS_FIELD_BASE(176, 176, 6, GPIO_PUPD, 32, 0x10, 16, 1),	/* MSDC0_DAT1 */
+	PINS_FIELD_BASE(177, 177, 6, GPIO_PUPD, 32, 0x10, 20, 1),	/* MSDC0_DAT2 */
+	PINS_FIELD_BASE(178, 178, 6, GPIO_PUPD, 32, 0x10, 24, 1),	/* MSDC0_DAT3 */
+	PINS_FIELD_BASE(179, 179, 6, GPIO_PUPD, 32, 0x10, 28, 1),	/* MSDC0_DAT4 */
+	PINS_FIELD_BASE(180, 180, 6, GPIO_PUPD, 32, 0x10, 32, 1),	/* MSDC0_DAT5 */
+	PINS_FIELD_BASE(181, 181, 6, GPIO_PUPD, 32, 0x10, 36, 1),	/* MSDC0_DAT6 */
+	PINS_FIELD_BASE(182, 182, 6, GPIO_PUPD, 32, 0x10, 40, 1),	/* MSDC0_DAT7 */
+	PINS_FIELD_BASE(183, 183, 6, GPIO_PUPD, 32, 0x10, 44, 1),	/* MSDC0_RSTB */
+	PINS_FIELD_BASE(198, 198, 1, GPIO_PUPD, 32, 0, 0, 1),		/* MSDC2_CMD */
+	PINS_FIELD_BASE(199, 199, 1, GPIO_PUPD, 32, 0, 4, 1),		/* MSDC2_CLK */
+	PINS_FIELD_BASE(200, 200, 1, GPIO_PUPD, 32, 0, 8, 1),		/* MSDC2_DAT0 */
+	PINS_FIELD_BASE(201, 201, 1, GPIO_PUPD, 32, 0, 12, 1),		/* MSDC2_DAT1 */
+	PINS_FIELD_BASE(202, 202, 1, GPIO_PUPD, 32, 0, 16, 1),		/* MSDC2_DAT2 */
+	PINS_FIELD_BASE(203, 203, 1, GPIO_PUPD, 32, 0, 20, 1)		/* MSDC2_DAT3 */
+};
+
+static const struct mtk_pin_field_calc mt6735_pin_r1_range[] = {
+	PINS_FIELD_BASE(45, 45, 2, GPIO_PUPD, 32, 0, 1, 1),		/* CMMCLK0 */
+	PINS_FIELD_BASE(46, 46, 2, GPIO_PUPD, 32, 0, 5, 1),		/* CMMCLK1 */
+	PINS_FIELD_BASE(81, 81, 3, GPIO_PUPD, 32, 0, 1, 1),		/* KPROW0 */
+	PINS_FIELD_BASE(82, 82, 3, GPIO_PUPD, 32, 0, 5, 1),		/* KPROW1 */
+	PINS_FIELD_BASE(83, 83, 3, GPIO_PUPD, 32, 0, 9, 1),		/* KPROW2 */
+	PINS_FIELD_BASE(84, 84, 3, GPIO_PUPD, 32, 0, 17, 1),		/* KPCOL0 */
+	PINS_FIELD_BASE(85, 85, 3, GPIO_PUPD, 32, 0, 21, 1),		/* KPCOL1 */
+	PINS_FIELD_BASE(86, 86, 3, GPIO_PUPD, 32, 0, 25, 1),		/* KPCOL2 */
+	PINS_FIELD_BASE(160, 160, 5, GPIO_PUPD, 32, 0x10, 33, 1),	/* SIM2_SCLK */
+	PINS_FIELD_BASE(161, 161, 5, GPIO_PUPD, 32, 0x10, 37, 1),	/* SIM2_SRST */
+	PINS_FIELD_BASE(162, 162, 5, GPIO_PUPD, 32, 0x10, 45, 1),	/* SIM2_SDAT */
+	PINS_FIELD_BASE(163, 163, 5, GPIO_PUPD, 32, 0x10, 49, 1),	/* SIM1_SCLK */
+	PINS_FIELD_BASE(164, 164, 5, GPIO_PUPD, 32, 0x10, 53, 1),	/* SIM1_SRST */
+	PINS_FIELD_BASE(165, 165, 5, GPIO_PUPD, 32, 0x10, 57, 1),	/* SIM1_SDAT */
+	PINS_FIELD_BASE(166, 166, 5, GPIO_PUPD, 32, 0x10, 1, 1),	/* MSDC1_CMD */
+	PINS_FIELD_BASE(167, 167, 5, GPIO_PUPD, 32, 0x10, 5, 1),	/* MSDC1_CLK */
+	PINS_FIELD_BASE(168, 168, 5, GPIO_PUPD, 32, 0x10, 9, 1),	/* MSDC1_DAT0 */
+	PINS_FIELD_BASE(169, 169, 5, GPIO_PUPD, 32, 0x10, 13, 1),	/* MSDC1_DAT1 */
+	PINS_FIELD_BASE(170, 170, 5, GPIO_PUPD, 32, 0x10, 17, 1),	/* MSDC1_DAT2 */
+	PINS_FIELD_BASE(171, 171, 5, GPIO_PUPD, 32, 0x10, 21, 1),	/* MSDC1_DAT3 */
+	PINS_FIELD_BASE(172, 172, 6, GPIO_PUPD, 32, 0x10, 1, 1),	/* MSDC0_CMD */
+	PINS_FIELD_BASE(173, 173, 6, GPIO_PUPD, 32, 0x10, 9, 1),	/* MSDC0_DSL */
+	PINS_FIELD_BASE(174, 174, 6, GPIO_PUPD, 32, 0x10, 5, 1),	/* MSDC0_CLK */
+	PINS_FIELD_BASE(175, 175, 6, GPIO_PUPD, 32, 0x10, 13, 1),	/* MSDC0_DAT0 */
+	PINS_FIELD_BASE(176, 176, 6, GPIO_PUPD, 32, 0x10, 17, 1),	/* MSDC0_DAT1 */
+	PINS_FIELD_BASE(177, 177, 6, GPIO_PUPD, 32, 0x10, 21, 1),	/* MSDC0_DAT2 */
+	PINS_FIELD_BASE(178, 178, 6, GPIO_PUPD, 32, 0x10, 25, 1),	/* MSDC0_DAT3 */
+	PINS_FIELD_BASE(179, 179, 6, GPIO_PUPD, 32, 0x10, 29, 1),	/* MSDC0_DAT4 */
+	PINS_FIELD_BASE(180, 180, 6, GPIO_PUPD, 32, 0x10, 33, 1),	/* MSDC0_DAT5 */
+	PINS_FIELD_BASE(181, 181, 6, GPIO_PUPD, 32, 0x10, 37, 1),	/* MSDC0_DAT6 */
+	PINS_FIELD_BASE(182, 182, 6, GPIO_PUPD, 32, 0x10, 41, 1),	/* MSDC0_DAT7 */
+	PINS_FIELD_BASE(183, 183, 6, GPIO_PUPD, 32, 0x10, 45, 1),	/* MSDC0_RSTB */
+	PINS_FIELD_BASE(198, 198, 1, GPIO_PUPD, 32, 0, 1, 1),		/* MSDC2_CMD */
+	PINS_FIELD_BASE(199, 199, 1, GPIO_PUPD, 32, 0, 5, 1),		/* MSDC2_CLK */
+	PINS_FIELD_BASE(200, 200, 1, GPIO_PUPD, 32, 0, 9, 1),		/* MSDC2_DAT0 */
+	PINS_FIELD_BASE(201, 201, 1, GPIO_PUPD, 32, 0, 13, 1),		/* MSDC2_DAT1 */
+	PINS_FIELD_BASE(202, 202, 1, GPIO_PUPD, 32, 0, 17, 1),		/* MSDC2_DAT2 */
+	PINS_FIELD_BASE(203, 203, 1, GPIO_PUPD, 32, 0, 21, 1)		/* MSDC2_DAT3 */
+};
+
+static const struct mtk_pin_field_calc mt6735_pin_pupd_range[] = {
+	PINS_FIELD_BASE(45, 45, 2, GPIO_PUPD, 32, 0, 2, 1),		/* CMMCLK0 */
+	PINS_FIELD_BASE(46, 46, 2, GPIO_PUPD, 32, 0, 6, 1),		/* CMMCLK1 */
+	PINS_FIELD_BASE(81, 81, 3, GPIO_PUPD, 32, 0, 2, 1),		/* KPROW0 */
+	PINS_FIELD_BASE(82, 82, 3, GPIO_PUPD, 32, 0, 6, 1),		/* KPROW1 */
+	PINS_FIELD_BASE(83, 83, 3, GPIO_PUPD, 32, 0, 10, 1),		/* KPROW2 */
+	PINS_FIELD_BASE(84, 84, 3, GPIO_PUPD, 32, 0, 18, 1),		/* KPCOL0 */
+	PINS_FIELD_BASE(85, 85, 3, GPIO_PUPD, 32, 0, 22, 1),		/* KPCOL1 */
+	PINS_FIELD_BASE(86, 86, 3, GPIO_PUPD, 32, 0, 26, 1),		/* KPCOL2 */
+	PINS_FIELD_BASE(160, 160, 5, GPIO_PUPD, 32, 0x10, 34, 1),	/* SIM2_SCLK */
+	PINS_FIELD_BASE(161, 161, 5, GPIO_PUPD, 32, 0x10, 38, 1),	/* SIM2_SRST */
+	PINS_FIELD_BASE(162, 162, 5, GPIO_PUPD, 32, 0x10, 46, 1),	/* SIM2_SDAT */
+	PINS_FIELD_BASE(163, 163, 5, GPIO_PUPD, 32, 0x10, 50, 1),	/* SIM1_SCLK */
+	PINS_FIELD_BASE(164, 164, 5, GPIO_PUPD, 32, 0x10, 54, 1),	/* SIM1_SRST */
+	PINS_FIELD_BASE(165, 165, 5, GPIO_PUPD, 32, 0x10, 58, 1),	/* SIM1_SDAT */
+	PINS_FIELD_BASE(166, 166, 5, GPIO_PUPD, 32, 0x10, 2, 1),	/* MSDC1_CMD */
+	PINS_FIELD_BASE(167, 167, 5, GPIO_PUPD, 32, 0x10, 6, 1),	/* MSDC1_CLK */
+	PINS_FIELD_BASE(168, 168, 5, GPIO_PUPD, 32, 0x10, 10, 1),	/* MSDC1_DAT0 */
+	PINS_FIELD_BASE(169, 169, 5, GPIO_PUPD, 32, 0x10, 14, 1),	/* MSDC1_DAT1 */
+	PINS_FIELD_BASE(170, 170, 5, GPIO_PUPD, 32, 0x10, 18, 1),	/* MSDC1_DAT2 */
+	PINS_FIELD_BASE(171, 171, 5, GPIO_PUPD, 32, 0x10, 22, 1),	/* MSDC1_DAT3 */
+	PINS_FIELD_BASE(172, 172, 6, GPIO_PUPD, 32, 0x10, 2, 1),	/* MSDC0_CMD */
+	PINS_FIELD_BASE(173, 173, 6, GPIO_PUPD, 32, 0x10, 10, 1),	/* MSDC0_DSL */
+	PINS_FIELD_BASE(174, 174, 6, GPIO_PUPD, 32, 0x10, 6, 1),	/* MSDC0_CLK */
+	PINS_FIELD_BASE(175, 175, 6, GPIO_PUPD, 32, 0x10, 14, 1),	/* MSDC0_DAT0 */
+	PINS_FIELD_BASE(176, 176, 6, GPIO_PUPD, 32, 0x10, 18, 1),	/* MSDC0_DAT1 */
+	PINS_FIELD_BASE(177, 177, 6, GPIO_PUPD, 32, 0x10, 22, 1),	/* MSDC0_DAT2 */
+	PINS_FIELD_BASE(178, 178, 6, GPIO_PUPD, 32, 0x10, 26, 1),	/* MSDC0_DAT3 */
+	PINS_FIELD_BASE(179, 179, 6, GPIO_PUPD, 32, 0x10, 30, 1),	/* MSDC0_DAT4 */
+	PINS_FIELD_BASE(180, 180, 6, GPIO_PUPD, 32, 0x10, 34, 1),	/* MSDC0_DAT5 */
+	PINS_FIELD_BASE(181, 181, 6, GPIO_PUPD, 32, 0x10, 38, 1),	/* MSDC0_DAT6 */
+	PINS_FIELD_BASE(182, 182, 6, GPIO_PUPD, 32, 0x10, 42, 1),	/* MSDC0_DAT7 */
+	PINS_FIELD_BASE(183, 183, 6, GPIO_PUPD, 32, 0x10, 46, 1),	/* MSDC0_RSTB */
+	PINS_FIELD_BASE(198, 198, 1, GPIO_PUPD, 32, 0, 2, 1),		/* MSDC2_CMD */
+	PINS_FIELD_BASE(199, 199, 1, GPIO_PUPD, 32, 0, 6, 1),		/* MSDC2_CLK */
+	PINS_FIELD_BASE(200, 200, 1, GPIO_PUPD, 32, 0, 10, 1),		/* MSDC2_DAT0 */
+	PINS_FIELD_BASE(201, 201, 1, GPIO_PUPD, 32, 0, 14, 1),		/* MSDC2_DAT1 */
+	PINS_FIELD_BASE(202, 202, 1, GPIO_PUPD, 32, 0, 18, 1),		/* MSDC2_DAT2 */
+	PINS_FIELD_BASE(203, 203, 1, GPIO_PUPD, 32, 0, 22, 1)		/* MSDC2_DAT3 */
+};
+
+static const struct mtk_pin_field_calc mt6735_pin_pullen_range[] = {
+	PIN_FIELD_BASE(0, 4, 2, GPIO_PULLEN, 32, 0, 23, 1),
+	PIN_FIELD_BASE(5, 8, 3, GPIO_PULLEN, 32, 0x10, 9, 1),
+	PIN_FIELD_BASE(9, 12, 3, GPIO_PULLEN, 32, 0x10, 20, 1),
+	PIN_FIELD_BASE(13, 21, 1, GPIO_PULLEN, 32, 0, 0, 1),
+	PIN_FIELD_BASE(42, 44, 2, GPIO_PULLEN, 32, 0, 0, 1),
+	PIN_FIELD_BASE(47, 64, 2, GPIO_PULLEN, 32, 0, 5, 1),
+	PIN_FIELD_BASE(65, 73, 3, GPIO_PULLEN, 32, 0x10, 0, 1),
+	PIN_FIELD_BASE(74, 80, 3, GPIO_PULLEN, 32, 0x10, 13, 1),
+	PIN_FIELD_BASE(87, 114, 3, GPIO_PULLEN, 32, 0x10, 30, 1),
+	PIN_FIELD_BASE(118, 149, 4, GPIO_PULLEN, 32, 0, 0, 1),
+	PIN_FIELD_BASE(184, 189, 6, GPIO_PULLEN, 32, 0x10, 12, 1)
+};
+
+static const struct mtk_pin_field_calc mt6735_pin_pullsel_range[] = {
+	PIN_FIELD_BASE(0, 4, 2, GPIO_PULLSEL, 32, 0, 23, 1),
+	PIN_FIELD_BASE(5, 8, 3, GPIO_PULLSEL, 32, 0x10, 9, 1),
+	PIN_FIELD_BASE(9, 12, 3, GPIO_PULLSEL, 32, 0x10, 20, 1),
+	PIN_FIELD_BASE(13, 21, 1, GPIO_PULLSEL, 32, 0, 0, 1),
+	PIN_FIELD_BASE(42, 44, 2, GPIO_PULLSEL, 32, 0, 0, 1),
+	PIN_FIELD_BASE(47, 64, 2, GPIO_PULLSEL, 32, 0, 5, 1),
+	PIN_FIELD_BASE(65, 73, 3, GPIO_PULLSEL, 32, 0x10, 0, 1),
+	PIN_FIELD_BASE(74, 80, 3, GPIO_PULLSEL, 32, 0x10, 13, 1),
+	PIN_FIELD_BASE(87, 114, 3, GPIO_PULLSEL, 32, 0x10, 30, 1),
+	PIN_FIELD_BASE(118, 149, 4, GPIO_PULLSEL, 32, 0, 0, 1),
+	PIN_FIELD_BASE(184, 189, 6, GPIO_PULLSEL, 32, 0x10, 12, 1)
+};
+
+static const struct mtk_pin_reg_calc mt6735_reg_cals[] = {
+	[PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt6735_pin_dir_range),
+	[PINCTRL_PIN_REG_DI] = MTK_RANGE(mt6735_pin_di_range),
+	[PINCTRL_PIN_REG_DO] = MTK_RANGE(mt6735_pin_do_range),
+	[PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt6735_pin_mode_range),
+	[PINCTRL_PIN_REG_SMT] = MTK_RANGE(mt6735_pin_smt_range),
+	[PINCTRL_PIN_REG_IES] = MTK_RANGE(mt6735_pin_ies_range),
+	[PINCTRL_PIN_REG_TDSEL] = MTK_RANGE(mt6735_pin_tdsel_range),
+	[PINCTRL_PIN_REG_RDSEL] = MTK_RANGE(mt6735_pin_rdsel_range),
+	[PINCTRL_PIN_REG_DRV] = MTK_RANGE(mt6735_pin_drv_range),
+	[PINCTRL_PIN_REG_R0] = MTK_RANGE(mt6735_pin_r0_range),
+	[PINCTRL_PIN_REG_R1] = MTK_RANGE(mt6735_pin_r1_range),
+	[PINCTRL_PIN_REG_PUPD] = MTK_RANGE(mt6735_pin_pupd_range),
+	[PINCTRL_PIN_REG_PULLEN] = MTK_RANGE(mt6735_pin_pullen_range),
+	[PINCTRL_PIN_REG_PULLSEL] = MTK_RANGE(mt6735_pin_pullsel_range),
+};
+
+static const struct mtk_pin_field_calc mt6735m_pin_dir_range[] = {
+	PIN_FIELD(0, 197, GPIO_DIR, 0x10, 0, 1)
+};
+
+static const struct mtk_pin_field_calc mt6735m_pin_di_range[] = {
+	PIN_FIELD(0, 197, GPIO_DIN, 0x10, 0, 1)
+};
+
+static const struct mtk_pin_field_calc mt6735m_pin_do_range[] = {
+	PIN_FIELD(0, 197, GPIO_DOUT, 0x10, 0, 1)
+};
+
+static const struct mtk_pin_field_calc mt6735m_pin_mode_range[] = {
+	PIN_FIELD(0, 4, GPIO_MODE1, 0, 0, 3),
+	PIN_FIELD(5, 9, GPIO_MODE1, 0, 16, 3),
+	PIN_FIELD(10, 14, GPIO_MODE2, 0, 0, 3),
+	PIN_FIELD(15, 19, GPIO_MODE2, 0, 16, 3),
+	PIN_FIELD(20, 24, GPIO_MODE3, 0, 0, 3),
+	PIN_FIELD(25, 29, GPIO_MODE3, 0, 16, 3),
+	PIN_FIELD(30, 34, GPIO_MODE4, 0, 0, 3),
+	PIN_FIELD(35, 39, GPIO_MODE4, 0, 16, 3),
+	PIN_FIELD(40, 44, GPIO_MODE5, 0, 0, 3),
+	PIN_FIELD(45, 49, GPIO_MODE5, 0, 16, 3),
+	PIN_FIELD(50, 54, GPIO_MODE6, 0, 0, 3),
+	PIN_FIELD(55, 59, GPIO_MODE6, 0, 16, 3),
+	PIN_FIELD(60, 64, GPIO_MODE7, 0, 0, 3),
+	PIN_FIELD(65, 69, GPIO_MODE7, 0, 16, 3),
+	PIN_FIELD(70, 74, GPIO_MODE8, 0, 0, 3),
+	PIN_FIELD(75, 79, GPIO_MODE8, 0, 16, 3),
+	PIN_FIELD(80, 84, GPIO_MODE9, 0, 0, 3),
+	PIN_FIELD(85, 89, GPIO_MODE9, 0, 16, 3),
+	PIN_FIELD(90, 94, GPIO_MODE10, 0, 0, 3),
+	PIN_FIELD(95, 99, GPIO_MODE10, 0, 16, 3),
+	PIN_FIELD(100, 104, GPIO_MODE11, 0, 0, 3),
+	PIN_FIELD(105, 109, GPIO_MODE11, 0, 16, 3),
+	PIN_FIELD(110, 114, GPIO_MODE12, 0, 0, 3),
+	PIN_FIELD(115, 119, GPIO_MODE12, 0, 16, 3),
+	PIN_FIELD(120, 124, GPIO_MODE13, 0, 0, 3),
+	PIN_FIELD(125, 129, GPIO_MODE13, 0, 16, 3),
+	PIN_FIELD(130, 134, GPIO_MODE14, 0, 0, 3),
+	PIN_FIELD(135, 139, GPIO_MODE14, 0, 16, 3),
+	PIN_FIELD(140, 144, GPIO_MODE15, 0, 0, 3),
+	PIN_FIELD(145, 149, GPIO_MODE15, 0, 16, 3),
+	PIN_FIELD(150, 154, GPIO_MODE16, 0, 0, 3),
+	PIN_FIELD(155, 159, GPIO_MODE16, 0, 16, 3),
+	PIN_FIELD(160, 164, GPIO_MODE17, 0, 0, 3),
+	PIN_FIELD(165, 169, GPIO_MODE17, 0, 16, 3),
+	PIN_FIELD(170, 174, GPIO_MODE18, 0, 0, 3),
+	PIN_FIELD(175, 179, GPIO_MODE18, 0, 16, 3),
+	PIN_FIELD(180, 184, GPIO_MODE19, 0, 0, 3),
+	PIN_FIELD(185, 189, GPIO_MODE19, 0, 16, 3),
+	PIN_FIELD(190, 194, GPIO_MODE20, 0, 0, 3),
+	PIN_FIELD(195, 197, GPIO_MODE20, 0, 16, 3),
+};
+
+/*
+ * Rather than redefining all tables for MT6735M just to remove the 6 MSDC2
+ * pins at the end, reuse the MT6735 tables and exclude the MSDC2 pin fields
+ * by subtracting their count from the array size when possible
+ */
+static const struct mtk_pin_reg_calc mt6735m_reg_cals[] = {
+	[PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt6735m_pin_dir_range),
+	[PINCTRL_PIN_REG_DI] = MTK_RANGE(mt6735m_pin_di_range),
+	[PINCTRL_PIN_REG_DO] = MTK_RANGE(mt6735m_pin_do_range),
+	[PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt6735m_pin_mode_range),
+	[PINCTRL_PIN_REG_SMT] = { mt6735_pin_smt_range,
+		ARRAY_SIZE(mt6735_pin_smt_range) - 3 },
+	[PINCTRL_PIN_REG_IES] = { mt6735_pin_ies_range,
+		ARRAY_SIZE(mt6735_pin_ies_range) - 3 },
+	[PINCTRL_PIN_REG_TDSEL] = { mt6735_pin_tdsel_range,
+		ARRAY_SIZE(mt6735_pin_tdsel_range) - 3 },
+	[PINCTRL_PIN_REG_RDSEL] = { mt6735_pin_rdsel_range,
+		ARRAY_SIZE(mt6735_pin_rdsel_range) - 3 },
+	[PINCTRL_PIN_REG_DRV] = { mt6735_pin_drv_range,
+		ARRAY_SIZE(mt6735_pin_drv_range) - 3 },
+	[PINCTRL_PIN_REG_R0] = { mt6735_pin_r0_range,
+		ARRAY_SIZE(mt6735_pin_r0_range) - 6 },
+	[PINCTRL_PIN_REG_R1] = { mt6735_pin_r1_range,
+		ARRAY_SIZE(mt6735_pin_r1_range) - 6 },
+	[PINCTRL_PIN_REG_PUPD] = { mt6735_pin_pupd_range,
+		ARRAY_SIZE(mt6735_pin_pupd_range) - 6 },
+	[PINCTRL_PIN_REG_PULLEN] = MTK_RANGE(mt6735_pin_pullen_range),
+	[PINCTRL_PIN_REG_PULLSEL] = MTK_RANGE(mt6735_pin_pullsel_range),
+};
+
+static const unsigned int mt6735_pull_type[] = {
+	MTK_PULL_PULLSEL_TYPE,		/*   0 */
+	MTK_PULL_PULLSEL_TYPE,		/*   1 */
+	MTK_PULL_PULLSEL_TYPE,		/*   2 */
+	MTK_PULL_PULLSEL_TYPE,		/*   3 */
+	MTK_PULL_PULLSEL_TYPE,		/*   4 */
+	MTK_PULL_PULLSEL_TYPE,		/*   5 */
+	MTK_PULL_PULLSEL_TYPE,		/*   6 */
+	MTK_PULL_PULLSEL_TYPE,		/*   7 */
+	MTK_PULL_PULLSEL_TYPE,		/*   8 */
+	MTK_PULL_PULLSEL_TYPE,		/*   9 */
+	MTK_PULL_PULLSEL_TYPE,		/*  10 */
+	MTK_PULL_PULLSEL_TYPE,		/*  11 */
+	MTK_PULL_PULLSEL_TYPE,		/*  12 */
+	MTK_PULL_PULLSEL_TYPE,		/*  13 */
+	MTK_PULL_PULLSEL_TYPE,		/*  14 */
+	MTK_PULL_PULLSEL_TYPE,		/*  15 */
+	MTK_PULL_PULLSEL_TYPE,		/*  16 */
+	MTK_PULL_PULLSEL_TYPE,		/*  17 */
+	MTK_PULL_PULLSEL_TYPE,		/*  18 */
+	MTK_PULL_PULLSEL_TYPE,		/*  19 */
+	MTK_PULL_PULLSEL_TYPE,		/*  20 */
+	MTK_PULL_PULLSEL_TYPE,		/*  21 */
+	/* MIPI CSI pins have no configurable pull resistors */
+	0,				/*  22 RDN0 */
+	0,				/*  23 RDP0 */
+	0,				/*  24 RDN1 */
+	0,				/*  25 RDP1 */
+	0,				/*  26 RCN */
+	0,				/*  27 RCP */
+	0,				/*  28 RDN2 */
+	0,				/*  29 RDP2 */
+	0,				/*  30 RDN3 */
+	0,				/*  31 RDP3 */
+	0,				/*  32 RDN0_A */
+	0,				/*  33 RDP0_A */
+	0,				/*  34 RDN1_A */
+	0,				/*  35 RDP1_A */
+	0,				/*  36 RCN_A */
+	0,				/*  37 RCP_A */
+	0,				/*  38 RDN2_A */
+	0,				/*  39 RDP2_A */
+	0,				/*  40 RDN3_A */
+	0,				/*  41 RDP3_A */
+	MTK_PULL_PULLSEL_TYPE,		/*  42 */
+	MTK_PULL_PULLSEL_TYPE,		/*  43 */
+	MTK_PULL_PULLSEL_TYPE,		/*  44 */
+	MTK_PULL_PUPD_R1R0_TYPE,	/*  45 CMMCLK0 */
+	MTK_PULL_PUPD_R1R0_TYPE,	/*  46 CMMCLK1 */
+	MTK_PULL_PULLSEL_TYPE,		/*  47 */
+	MTK_PULL_PULLSEL_TYPE,		/*  48 */
+	MTK_PULL_PULLSEL_TYPE,		/*  49 */
+	MTK_PULL_PULLSEL_TYPE,		/*  50 */
+	MTK_PULL_PULLSEL_TYPE,		/*  51 */
+	MTK_PULL_PULLSEL_TYPE,		/*  52 */
+	MTK_PULL_PULLSEL_TYPE,		/*  53 */
+	MTK_PULL_PULLSEL_TYPE,		/*  54 */
+	MTK_PULL_PULLSEL_TYPE,		/*  55 */
+	MTK_PULL_PULLSEL_TYPE,		/*  56 */
+	MTK_PULL_PULLSEL_TYPE,		/*  57 */
+	MTK_PULL_PULLSEL_TYPE,		/*  58 */
+	MTK_PULL_PULLSEL_TYPE,		/*  60 */
+	MTK_PULL_PULLSEL_TYPE,		/*  61 */
+	MTK_PULL_PULLSEL_TYPE,		/*  62 */
+	MTK_PULL_PULLSEL_TYPE,		/*  63 */
+	MTK_PULL_PULLSEL_TYPE,		/*  64 */
+	MTK_PULL_PULLSEL_TYPE,		/*  65 */
+	MTK_PULL_PULLSEL_TYPE,		/*  66 */
+	MTK_PULL_PULLSEL_TYPE,		/*  67 */
+	MTK_PULL_PULLSEL_TYPE,		/*  68 */
+	MTK_PULL_PULLSEL_TYPE,		/*  69 */
+	MTK_PULL_PULLSEL_TYPE,		/*  70 */
+	MTK_PULL_PULLSEL_TYPE,		/*  71 */
+	MTK_PULL_PULLSEL_TYPE,		/*  72 */
+	MTK_PULL_PULLSEL_TYPE,		/*  73 */
+	MTK_PULL_PULLSEL_TYPE,		/*  74 */
+	MTK_PULL_PULLSEL_TYPE,		/*  75 */
+	MTK_PULL_PULLSEL_TYPE,		/*  76 */
+	MTK_PULL_PULLSEL_TYPE,		/*  77 */
+	MTK_PULL_PULLSEL_TYPE,		/*  78 */
+	MTK_PULL_PULLSEL_TYPE,		/*  79 */
+	MTK_PULL_PULLSEL_TYPE,		/*  80 */
+	MTK_PULL_PUPD_R1R0_TYPE,	/*  81 KROW0 */
+	MTK_PULL_PUPD_R1R0_TYPE,	/*  82 KROW1 */
+	MTK_PULL_PUPD_R1R0_TYPE,	/*  83 KROW2 */
+	MTK_PULL_PUPD_R1R0_TYPE,	/*  84 KCOL0 */
+	MTK_PULL_PUPD_R1R0_TYPE,	/*  85 KCOL1 */
+	MTK_PULL_PUPD_R1R0_TYPE,	/*  86 KCOL2 */
+	MTK_PULL_PULLSEL_TYPE,		/*  87 */
+	MTK_PULL_PULLSEL_TYPE,		/*  88 */
+	MTK_PULL_PULLSEL_TYPE,		/*  89 */
+	MTK_PULL_PULLSEL_TYPE,		/*  90 */
+	MTK_PULL_PULLSEL_TYPE,		/*  91 */
+	MTK_PULL_PULLSEL_TYPE,		/*  92 */
+	MTK_PULL_PULLSEL_TYPE,		/*  93 */
+	MTK_PULL_PULLSEL_TYPE,		/*  94 */
+	MTK_PULL_PULLSEL_TYPE,		/*  95 */
+	MTK_PULL_PULLSEL_TYPE,		/*  96 */
+	MTK_PULL_PULLSEL_TYPE,		/*  97 */
+	MTK_PULL_PULLSEL_TYPE,		/*  98 */
+	MTK_PULL_PULLSEL_TYPE,		/*  99 */
+	MTK_PULL_PULLSEL_TYPE,		/* 100 */
+	MTK_PULL_PULLSEL_TYPE,		/* 101 */
+	MTK_PULL_PULLSEL_TYPE,		/* 102 */
+	MTK_PULL_PULLSEL_TYPE,		/* 103 */
+	MTK_PULL_PULLSEL_TYPE,		/* 104 */
+	MTK_PULL_PULLSEL_TYPE,		/* 105 */
+	MTK_PULL_PULLSEL_TYPE,		/* 106 */
+	MTK_PULL_PULLSEL_TYPE,		/* 107 */
+	MTK_PULL_PULLSEL_TYPE,		/* 108 */
+	MTK_PULL_PULLSEL_TYPE,		/* 109 */
+	MTK_PULL_PULLSEL_TYPE,		/* 110 */
+	MTK_PULL_PULLSEL_TYPE,		/* 111 */
+	MTK_PULL_PULLSEL_TYPE,		/* 112 */
+	MTK_PULL_PULLSEL_TYPE,		/* 113 */
+	MTK_PULL_PULLSEL_TYPE,		/* 114 */
+	/* Configuration for AUXADC pins is set by APMIXEDSYS */
+	0,				/* 115 AUXIN0 */
+	0,				/* 116 AUXIN1 */
+	0,				/* 117 AUXIN2 */
+	MTK_PULL_PULLSEL_TYPE,		/* 118 */
+	MTK_PULL_PULLSEL_TYPE,		/* 119 */
+	MTK_PULL_PULLSEL_TYPE,		/* 120 */
+	MTK_PULL_PULLSEL_TYPE,		/* 121 */
+	MTK_PULL_PULLSEL_TYPE,		/* 122 */
+	MTK_PULL_PULLSEL_TYPE,		/* 123 */
+	MTK_PULL_PULLSEL_TYPE,		/* 124 */
+	MTK_PULL_PULLSEL_TYPE,		/* 125 */
+	MTK_PULL_PULLSEL_TYPE,		/* 126 */
+	MTK_PULL_PULLSEL_TYPE,		/* 127 */
+	MTK_PULL_PULLSEL_TYPE,		/* 128 */
+	MTK_PULL_PULLSEL_TYPE,		/* 129 */
+	MTK_PULL_PULLSEL_TYPE,		/* 130 */
+	MTK_PULL_PULLSEL_TYPE,		/* 131 */
+	MTK_PULL_PULLSEL_TYPE,		/* 132 */
+	MTK_PULL_PULLSEL_TYPE,		/* 133 */
+	MTK_PULL_PULLSEL_TYPE,		/* 134 */
+	MTK_PULL_PULLSEL_TYPE,		/* 135 */
+	MTK_PULL_PULLSEL_TYPE,		/* 136 */
+	MTK_PULL_PULLSEL_TYPE,		/* 137 */
+	MTK_PULL_PULLSEL_TYPE,		/* 138 */
+	MTK_PULL_PULLSEL_TYPE,		/* 139 */
+	MTK_PULL_PULLSEL_TYPE,		/* 140 */
+	MTK_PULL_PULLSEL_TYPE,		/* 141 */
+	MTK_PULL_PULLSEL_TYPE,		/* 142 */
+	MTK_PULL_PULLSEL_TYPE,		/* 143 */
+	MTK_PULL_PULLSEL_TYPE,		/* 144 */
+	MTK_PULL_PULLSEL_TYPE,		/* 145 */
+	MTK_PULL_PULLSEL_TYPE,		/* 146 */
+	MTK_PULL_PULLSEL_TYPE,		/* 147 */
+	MTK_PULL_PULLSEL_TYPE,		/* 148 */
+	MTK_PULL_PULLSEL_TYPE,		/* 149 */
+	/* MIPI DSI pins have no configurable pull resistors */
+	0,				/* 150 TDP0 */
+	0,				/* 151 TDN0 */
+	0,				/* 152 TDP1 */
+	0,				/* 153 TDN1 */
+	0,				/* 154 TCP */
+	0,				/* 155 TCN */
+	0,				/* 156 TDP2 */
+	0,				/* 157 TDN2 */
+	0,				/* 158 TDP3 */
+	0,				/* 159 TDN3 */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 160 MD_SIM2_SCLK */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 161 MD_SIM2_SRST */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 162 MD_SIM2_SDAT */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 163 MD_SIM1_SCLK */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 164 MD_SIM1_SRST */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 165 MD_SIM1_SDAT */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 166 MSDC1_CMD */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 167 MSDC1_CLK */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 168 MSDC1_DAT0 */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 169 MSDC1_DAT1 */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 170 MSDC1_DAT2 */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 171 MSDC1_DAT3 */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 172 MSDC0_CMD */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 173 MSDC0_DSL */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 174 MSDC0_CLK */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 175 MSDC0_DAT0 */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 176 MSDC0_DAT1 */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 177 MSDC0_DAT2 */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 178 MSDC0_DAT3 */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 179 MSDC0_DAT4 */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 180 MSDC0_DAT5 */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 181 MSDC0_DAT6 */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 182 MSDC0_DAT7 */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 183 MSDC0_RSTB */
+	MTK_PULL_PULLSEL_TYPE,		/* 184 */
+	MTK_PULL_PULLSEL_TYPE,		/* 185 */
+	MTK_PULL_PULLSEL_TYPE,		/* 186 */
+	MTK_PULL_PULLSEL_TYPE,		/* 187 */
+	MTK_PULL_PULLSEL_TYPE,		/* 188 */
+	MTK_PULL_PULLSEL_TYPE,		/* 189 */
+	/*
+	 * GPS/WIFI/BT pins have no pull resistors configurable by the GPIO
+	 * controller. They might be configured by CONSYS but we can't know
+	 * for sure due to lack of documentation.
+	 */
+	0,				/* 190 GPS_RXQN */
+	0,				/* 191 GPS_RXQP */
+	0,				/* 192 GPS_RXIN */
+	0,				/* 193 GPS_RXIP */
+	0,				/* 194 WB_RXQN */
+	0,				/* 195 WB_RXQP */
+	0,				/* 196 WB_RXIN */
+	0,				/* 197 WB_RXIP */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 198 MSDC2_CMD */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 199 MSDC2_CLK */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 200 MSDC2_DAT0 */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 201 MSDC2_DAT1 */
+	MTK_PULL_PUPD_R1R0_TYPE,	/* 202 MSDC2_DAT2 */
+	MTK_PULL_PUPD_R1R0_TYPE		/* 203 MSDC2_DAT3 */
+};
+
+static const char * const mt6735_pinctrl_register_base_names[] = {
+	"gpio", "iocfg0", "iocfg1", "iocfg2", "iocfg3", "iocfg4", "iocfg5"
+};
+
+static const struct mtk_eint_hw mt6735_eint_hw = {
+	.port_mask = 7,
+	.ports     = 6,
+	.ap_num    = 224,
+	.db_cnt    = 16,
+};
+
+static const struct mtk_pin_soc mt6735_data = {
+	.reg_cal = mt6735_reg_cals,
+	.pins = mtk_pins_mt6735,
+	.npins = ARRAY_SIZE(mtk_pins_mt6735),
+	.ngrps = ARRAY_SIZE(mtk_pins_mt6735),
+	.eint_hw = &mt6735_eint_hw,
+	.gpio_m = 0,
+	.ies_present = true,
+	.base_names = mt6735_pinctrl_register_base_names,
+	.nbase_names = ARRAY_SIZE(mt6735_pinctrl_register_base_names),
+	.pull_type = mt6735_pull_type,
+	.bias_set_combo = mtk_pinconf_bias_set_combo,
+	.bias_get_combo = mtk_pinconf_bias_get_combo,
+	.drive_set = mtk_pinconf_drive_set_rev1,
+	.drive_get = mtk_pinconf_drive_get_rev1,
+	.adv_pull_get = mtk_pinconf_adv_pull_get,
+	.adv_pull_set = mtk_pinconf_adv_pull_set,
+};
+
+static const struct mtk_pin_soc mt6735m_data = {
+	.reg_cal = mt6735m_reg_cals,
+	.pins = mtk_pins_mt6735m,
+	.npins = ARRAY_SIZE(mtk_pins_mt6735m),
+	.ngrps = ARRAY_SIZE(mtk_pins_mt6735m),
+	.eint_hw = &mt6735_eint_hw,
+	.gpio_m = 0,
+	.ies_present = true,
+	.base_names = mt6735_pinctrl_register_base_names,
+	.nbase_names = ARRAY_SIZE(mt6735_pinctrl_register_base_names),
+	.bias_set_combo = mtk_pinconf_bias_set_combo,
+	.bias_get_combo = mtk_pinconf_bias_get_combo,
+	.drive_set = mtk_pinconf_drive_set_rev1,
+	.drive_get = mtk_pinconf_drive_get_rev1,
+	.adv_pull_get = mtk_pinconf_adv_pull_get,
+	.adv_pull_set = mtk_pinconf_adv_pull_set,
+};
+
+static const struct of_device_id mt6735_pinctrl_match[] = {
+	{ .compatible = "mediatek,mt6735-pinctrl", .data = &mt6735_data },
+	{ .compatible = "mediatek,mt6735m-pinctrl", .data = &mt6735m_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mt6735_pinctrl_match);
+
+static struct platform_driver mt6735_pinctrl_driver = {
+	.probe = mtk_paris_pinctrl_probe,
+	.driver = {
+		.name = "mt6735-pinctrl",
+		.of_match_table = mt6735_pinctrl_match,
+		.pm = &mtk_paris_pinctrl_pm_ops,
+	},
+};
+module_platform_driver(mt6735_pinctrl_driver);
+
+MODULE_AUTHOR("Yassine Oudjana <y.oudjana@protonmail.com>");
+MODULE_DESCRIPTION("MediaTek MT6735 pinctrl driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h
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
+static const struct mtk_pin_desc mtk_pins_mt6735[] = {
+	MTK_PIN(
+		0, "GPIO0",
+		MTK_EINT_FUNCTION(0, 0),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO0"),
+		MTK_FUNCTION(1, "IDDIG"),
+		MTK_FUNCTION(2, "DPI_D4"),
+		MTK_FUNCTION(3, "CLKM4"),
+		MTK_FUNCTION(4, "EXT_FRAME_SYNC"),
+		MTK_FUNCTION(5, "PWM3"),
+		MTK_FUNCTION(6, "KCOL2"),
+		MTK_FUNCTION(7, "C2K_ARM_EINT0")
+	),
+	MTK_PIN(
+		1, "GPIO1",
+		MTK_EINT_FUNCTION(0, 1),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO1"),
+		MTK_FUNCTION(1, "PWM2"),
+		MTK_FUNCTION(2, "DPI_D5"),
+		MTK_FUNCTION(3, "MD_EINT0"),
+		MTK_FUNCTION(4, "TDD_TDO"),
+		MTK_FUNCTION(5, "CONN_MCU_TDO"),
+		MTK_FUNCTION(6, "PTA_RXD"),
+		MTK_FUNCTION(7, "C2K_ARM_EINT1")
+	),
+	MTK_PIN(
+		2, "GPIO2",
+		MTK_EINT_FUNCTION(0, 2),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO2"),
+		MTK_FUNCTION(1, "CLKM0"),
+		MTK_FUNCTION(2, "DPI_D6"),
+		MTK_FUNCTION(3, "MD_EINT0"),
+		MTK_FUNCTION(4, "USB_DRVVBUS"),
+		MTK_FUNCTION(5, "CONN_MCU_DBGACK_N"),
+		MTK_FUNCTION(6, "PTA_TXD"),
+		MTK_FUNCTION(7, "C2K_ARM_EINT2")
+	),
+	MTK_PIN(
+		3, "GPIO3",
+		MTK_EINT_FUNCTION(0, 3),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO3"),
+		MTK_FUNCTION(1, "CLKM1"),
+		MTK_FUNCTION(2, "DPI_D7"),
+		MTK_FUNCTION(3, "SPI_MIB"),
+		MTK_FUNCTION(4, "MD_EINT0"),
+		MTK_FUNCTION(5, "CONN_MCU_DBGI_N"),
+		MTK_FUNCTION(6, "CONN_MCU_AICE_TMSC"),
+		MTK_FUNCTION(7, "C2K_ARM_EINT3")
+	),
+	MTK_PIN(
+		4, "GPIO4",
+		MTK_EINT_FUNCTION(0, 4),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO4"),
+		MTK_FUNCTION(1, "CLKM2"),
+		MTK_FUNCTION(2, "DPI_D8"),
+		MTK_FUNCTION(3, "SPI_MOB"),
+		MTK_FUNCTION(4, "TDD_TCK"),
+		MTK_FUNCTION(5, "CONN_MCU_TCK[0]"),
+		MTK_FUNCTION(6, "CONN_MCU_AICE_TCKC"),
+		MTK_FUNCTION(7, "C2K_DM_EINT0")
+	),
+	MTK_PIN(
+		5, "GPIO5",
+		MTK_EINT_FUNCTION(0, 5),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO5"),
+		MTK_FUNCTION(1, "UCTS2"),
+		MTK_FUNCTION(2, "DPI_D9"),
+		MTK_FUNCTION(3, "SPI_CSB"),
+		MTK_FUNCTION(4, "TDD_TDI"),
+		MTK_FUNCTION(5, "CONN_MCU_TDI"),
+		MTK_FUNCTION(6, "I2S1_DO"),
+		MTK_FUNCTION(7, "MD_URXD")
+	),
+	MTK_PIN(
+		6, "GPIO6",
+		MTK_EINT_FUNCTION(0, 6),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO6"),
+		MTK_FUNCTION(1, "URTS2"),
+		MTK_FUNCTION(2, "DPI_D10"),
+		MTK_FUNCTION(3, "SPI_CKB"),
+		MTK_FUNCTION(4, "TDD_TRSTN"),
+		MTK_FUNCTION(5, "CONN_MCU_TRST_B"),
+		MTK_FUNCTION(6, "I2S1_LRCK"),
+		MTK_FUNCTION(7, "MD_UTXD")
+	),
+	MTK_PIN(
+		7, "GPIO7",
+		MTK_EINT_FUNCTION(0, 7),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO7"),
+		MTK_FUNCTION(1, "UCTS3"),
+		MTK_FUNCTION(2, "DPI_D11"),
+		MTK_FUNCTION(3, "SDA1"),
+		MTK_FUNCTION(4, "TDD_TMS"),
+		MTK_FUNCTION(5, "CONN_MCU_TMS"),
+		MTK_FUNCTION(6, "I2S1_BCK"),
+		MTK_FUNCTION(7, "TDD_TXD")
+	),
+	MTK_PIN(
+		8, "GPIO8",
+		MTK_EINT_FUNCTION(0, 8),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO8"),
+		MTK_FUNCTION(1, "URTS3"),
+		MTK_FUNCTION(2, "C2K_UIM0_HOT_PLUG_IN"),
+		MTK_FUNCTION(3, "SCL1"),
+		MTK_FUNCTION(4, "PCM1_DO1"),
+		MTK_FUNCTION(5, "MD_EINT1"),
+		MTK_FUNCTION(6, "KCOL4"),
+		MTK_FUNCTION(7, "UTXD0")
+	),
+	MTK_PIN(
+		9, "GPIO9",
+		MTK_EINT_FUNCTION(0, 9),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO9"),
+		MTK_FUNCTION(1, "C2K_UIM1_HOT_PLUG_IN"),
+		MTK_FUNCTION(2, "PCM1_DO0"),
+		MTK_FUNCTION(3, "I2S3_MCK"),
+		MTK_FUNCTION(4, "MD_EINT2"),
+		MTK_FUNCTION(5, "CLKM2"),
+		MTK_FUNCTION(6, "I2S1_MCK"),
+		MTK_FUNCTION(7, "DBG_MON_A29")
+	),
+	MTK_PIN(
+		10, "GPIO10",
+		MTK_EINT_FUNCTION(0, 10),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO10"),
+		MTK_FUNCTION(1, "PWM1"),
+		MTK_FUNCTION(2, "CLKM1"),
+		MTK_FUNCTION(3, "KROW2"),
+		MTK_FUNCTION(4, "MD_EINT0"),
+		MTK_FUNCTION(5, "I2S1_MCK"),
+		MTK_FUNCTION(6, "SDA3"),
+		MTK_FUNCTION(7, "DBG_MON_A30")
+	),
+	MTK_PIN(
+		11, "GPIO11",
+		MTK_EINT_FUNCTION(0, 11),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO11"),
+		MTK_FUNCTION(1, "MD_EINT1"),
+		MTK_FUNCTION(2, "IRTX_OUT"),
+		MTK_FUNCTION(3, "C2K_UIM0_HOT_PLUG_IN"),
+		MTK_FUNCTION(4, "CLKM0"),
+		MTK_FUNCTION(5, "I2S2_MCK"),
+		MTK_FUNCTION(6, "SCL3"),
+		MTK_FUNCTION(7, "URXD0")
+	),
+	MTK_PIN(
+		12, "GPIO12",
+		MTK_EINT_FUNCTION(0, 12),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO12"),
+		MTK_FUNCTION(1, "I2S0_MCK"),
+		MTK_FUNCTION(2, "C2K_UIM1_HOT_PLUG_IN"),
+		MTK_FUNCTION(3, "KCOL2"),
+		MTK_FUNCTION(4, "MD_EINT2"),
+		MTK_FUNCTION(5, "IRTX_OUT"),
+		MTK_FUNCTION(6, "SRCLKENAI2"),
+		MTK_FUNCTION(7, "PCM1_DO1")
+	),
+	MTK_PIN(
+		13, "GPIO13",
+		MTK_EINT_FUNCTION(0, 13),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO13"),
+		MTK_FUNCTION(1, "WB_CTRL0"),
+		MTK_FUNCTION(3, "C2K_ARM_EINT0"),
+		MTK_FUNCTION(7, "DBG_MON_A0")
+	),
+	MTK_PIN(
+		14, "GPIO14",
+		MTK_EINT_FUNCTION(0, 14),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO14"),
+		MTK_FUNCTION(1, "WB_CTRL1"),
+		MTK_FUNCTION(3, "C2K_ARM_EINT1"),
+		MTK_FUNCTION(7, "DBG_MON_A1")
+	),
+	MTK_PIN(
+		15, "GPIO15",
+		MTK_EINT_FUNCTION(0, 15),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO15"),
+		MTK_FUNCTION(1, "WB_CTRL2"),
+		MTK_FUNCTION(3, "C2K_ARM_EINT2"),
+		MTK_FUNCTION(7, "DBG_MON_A2")
+	),
+	MTK_PIN(
+		16, "GPIO16",
+		MTK_EINT_FUNCTION(0, 16),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO16"),
+		MTK_FUNCTION(1, "WB_CTRL3"),
+		MTK_FUNCTION(3, "C2K_ARM_EINT3"),
+		MTK_FUNCTION(7, "DBG_MON_A3")
+	),
+	MTK_PIN(
+		17, "GPIO17",
+		MTK_EINT_FUNCTION(0, 17),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO17"),
+		MTK_FUNCTION(1, "WB_CTRL4"),
+		MTK_FUNCTION(3, "C2K_DM_EINT0"),
+		MTK_FUNCTION(4, "WATCHDOG"),
+		MTK_FUNCTION(7, "DBG_MON_A4")
+	),
+	MTK_PIN(
+		18, "GPIO18",
+		MTK_EINT_FUNCTION(0, 18),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO18"),
+		MTK_FUNCTION(1, "WB_CTRL5"),
+		MTK_FUNCTION(3, "C2K_DM_EINT1"),
+		MTK_FUNCTION(7, "DBG_MON_A5")
+	),
+	MTK_PIN(
+		19, "GPIO19",
+		MTK_EINT_FUNCTION(0, 19),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO19"),
+		MTK_FUNCTION(1, "ANT_SEL0"),
+		MTK_FUNCTION(2, "IRTX_OUT"),
+		MTK_FUNCTION(3, "IRDA_TX"),
+		MTK_FUNCTION(4, "C2K_UART0_TXD"),
+		MTK_FUNCTION(5, "GPS_FRAME_SYNC"),
+		MTK_FUNCTION(6, "LTE_UTXD"),
+		MTK_FUNCTION(7, "DBG_MON_A6")
+	),
+	MTK_PIN(
+		20, "GPIO20",
+		MTK_EINT_FUNCTION(0, 20),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO20"),
+		MTK_FUNCTION(1, "ANT_SEL1"),
+		MTK_FUNCTION(2, "C2K_UIM1_HOT_PLUG_IN"),
+		MTK_FUNCTION(3, "IRDA_RX"),
+		MTK_FUNCTION(4, "C2K_UART0_RXD"),
+		MTK_FUNCTION(5, "MD_EINT2"),
+		MTK_FUNCTION(6, "LTE_URXD"),
+		MTK_FUNCTION(7, "DBG_MON_A7")
+	),
+	MTK_PIN(
+		21, "GPIO21",
+		MTK_EINT_FUNCTION(0, 21),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO21"),
+		MTK_FUNCTION(1, "ANT_SEL2"),
+		MTK_FUNCTION(2, "PWM2"),
+		MTK_FUNCTION(3, "IRDA_PDN"),
+		MTK_FUNCTION(4, "CORESONIC_SWCK"),
+		MTK_FUNCTION(5, "MD_EINT1"),
+		MTK_FUNCTION(6, "C2K_UIM0_HOT_PLUG_IN"),
+		MTK_FUNCTION(7, "DBG_MON_A8")
+	),
+	MTK_PIN(
+		22, "GPIO22",
+		MTK_EINT_FUNCTION(0, 22),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO22"),
+		MTK_FUNCTION(1, "RDN0")
+	),
+	MTK_PIN(
+		23, "GPIO23",
+		MTK_EINT_FUNCTION(0, 23),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO23"),
+		MTK_FUNCTION(1, "RDP0")
+	),
+	MTK_PIN(
+		24, "GPIO24",
+		MTK_EINT_FUNCTION(0, 24),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO24"),
+		MTK_FUNCTION(1, "RDN1")
+	),
+	MTK_PIN(
+		25, "GPIO25",
+		MTK_EINT_FUNCTION(0, 25),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO25"),
+		MTK_FUNCTION(1, "RDP1")
+	),
+	MTK_PIN(
+		26, "GPIO26",
+		MTK_EINT_FUNCTION(0, 26),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO26"),
+		MTK_FUNCTION(1, "RCN")
+	),
+	MTK_PIN(
+		27, "GPIO27",
+		MTK_EINT_FUNCTION(0, 27),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO27"),
+		MTK_FUNCTION(1, "RCP")
+	),
+	MTK_PIN(
+		28, "GPIO28",
+		MTK_EINT_FUNCTION(0, 28),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO28"),
+		MTK_FUNCTION(1, "RDN2")
+	),
+	MTK_PIN(
+		29, "GPIO29",
+		MTK_EINT_FUNCTION(0, 29),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO29"),
+		MTK_FUNCTION(1, "RDP2")
+	),
+	MTK_PIN(
+		30, "GPIO30",
+		MTK_EINT_FUNCTION(0, 30),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO30"),
+		MTK_FUNCTION(1, "RDN3")
+	),
+	MTK_PIN(
+		31, "GPIO31",
+		MTK_EINT_FUNCTION(0, 31),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO31"),
+		MTK_FUNCTION(1, "RDP3")
+	),
+	MTK_PIN(
+		32, "GPIO32",
+		MTK_EINT_FUNCTION(0, 32),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO32"),
+		MTK_FUNCTION(1, "RDN0_A"),
+		MTK_FUNCTION(2, "CMHSYNC"),
+		MTK_FUNCTION(3, "CMCSD0")
+	),
+	MTK_PIN(
+		33, "GPIO33",
+		MTK_EINT_FUNCTION(0, 33),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO33"),
+		MTK_FUNCTION(1, "RDP0_A"),
+		MTK_FUNCTION(2, "CMVSYNC"),
+		MTK_FUNCTION(3, "CMCSD1")
+	),
+	MTK_PIN(
+		34, "GPIO34",
+		MTK_EINT_FUNCTION(0, 34),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO34"),
+		MTK_FUNCTION(1, "RDN1_A"),
+		MTK_FUNCTION(2, "CMDAT9"),
+		MTK_FUNCTION(3, "CMCSD2")
+	),
+	MTK_PIN(
+		35, "GPIO35",
+		MTK_EINT_FUNCTION(0, 35),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO35"),
+		MTK_FUNCTION(1, "RDP1_A"),
+		MTK_FUNCTION(2, "CMDAT8"),
+		MTK_FUNCTION(3, "CMCSD3")
+	),
+	MTK_PIN(
+		36, "GPIO36",
+		MTK_EINT_FUNCTION(0, 36),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO36"),
+		MTK_FUNCTION(1, "RCN_A"),
+		MTK_FUNCTION(2, "CMDAT7")
+	),
+	MTK_PIN(
+		37, "GPIO37",
+		MTK_EINT_FUNCTION(0, 37),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO37"),
+		MTK_FUNCTION(1, "RCP_A"),
+		MTK_FUNCTION(2, "CMDAT6")
+	),
+	MTK_PIN(
+		38, "GPIO38",
+		MTK_EINT_FUNCTION(0, 38),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO38"),
+		MTK_FUNCTION(1, "RDN2_A"),
+		MTK_FUNCTION(2, "CMDAT5")
+	),
+	MTK_PIN(
+		39, "GPIO39",
+		MTK_EINT_FUNCTION(0, 39),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO39"),
+		MTK_FUNCTION(1, "RDP2_A"),
+		MTK_FUNCTION(2, "CMDAT4")
+	),
+	MTK_PIN(
+		40, "GPIO40",
+		MTK_EINT_FUNCTION(0, 40),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO40"),
+		MTK_FUNCTION(1, "RDN3_A"),
+		MTK_FUNCTION(2, "CMDAT3")
+	),
+	MTK_PIN(
+		41, "GPIO41",
+		MTK_EINT_FUNCTION(0, 41),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO41"),
+		MTK_FUNCTION(1, "RDP3_A"),
+		MTK_FUNCTION(2, "CMDAT2")
+	),
+	MTK_PIN(
+		42, "GPIO42",
+		MTK_EINT_FUNCTION(0, 42),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO42"),
+		MTK_FUNCTION(1, "CMDAT0"),
+		MTK_FUNCTION(2, "CMCSD0"),
+		MTK_FUNCTION(3, "CMMCLK1"),
+		MTK_FUNCTION(5, "ANT_SEL5"),
+		MTK_FUNCTION(6, "CLKM5"),
+		MTK_FUNCTION(7, "DBG_MON_A9")
+	),
+	MTK_PIN(
+		43, "GPIO43",
+		MTK_EINT_FUNCTION(0, 43),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO43"),
+		MTK_FUNCTION(1, "CMDAT1"),
+		MTK_FUNCTION(2, "CMCSD1"),
+		MTK_FUNCTION(3, "CMFLASH"),
+		MTK_FUNCTION(4, "MD_EINT0"),
+		MTK_FUNCTION(5, "CMMCLK1"),
+		MTK_FUNCTION(6, "CLKM4"),
+		MTK_FUNCTION(7, "DBG_MON_A10")
+	),
+	MTK_PIN(
+		44, "GPIO44",
+		MTK_EINT_FUNCTION(0, 44),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO44"),
+		MTK_FUNCTION(1, "CMPCLK"),
+		MTK_FUNCTION(2, "CMCSK"),
+		MTK_FUNCTION(3, "CMCSD2"),
+		MTK_FUNCTION(4, "KCOL3"),
+		MTK_FUNCTION(5, "SRCLKENAI2"),
+		MTK_FUNCTION(6, "PWM0"),
+		MTK_FUNCTION(7, "DBG_MON_A11")
+	),
+	MTK_PIN(
+		45, "GPIO45",
+		MTK_EINT_FUNCTION(0, 45),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO45"),
+		MTK_FUNCTION(1, "CMMCLK0"),
+		MTK_FUNCTION(7, "DBG_MON_A12")
+	),
+	MTK_PIN(
+		46, "GPIO46",
+		MTK_EINT_FUNCTION(0, 46),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO46"),
+		MTK_FUNCTION(1, "CMMCLK1"),
+		MTK_FUNCTION(2, "IDDIG"),
+		MTK_FUNCTION(3, "LTE_MD32_JTAG_TRST"),
+		MTK_FUNCTION(4, "TDD_TRSTN"),
+		MTK_FUNCTION(5, "DM_JTINTP"),
+		MTK_FUNCTION(6, "KCOL6"),
+		MTK_FUNCTION(7, "DBG_MON_A13")
+	),
+	MTK_PIN(
+		47, "GPIO47",
+		MTK_EINT_FUNCTION(0, 47),
+		DRV_FIXED,
+		MTK_FUNCTION(0, "GPIO47"),
+		MTK_FUNCTION(1, "SDA0")
+	),
+	MTK_PIN(
+		48, "GPIO48",
+		MTK_EINT_FUNCTION(0, 48),
+		DRV_FIXED,
+		MTK_FUNCTION(0, "GPIO48"),
+		MTK_FUNCTION(1, "SCL0")
+	),
+	MTK_PIN(
+		49, "GPIO49",
+		MTK_EINT_FUNCTION(0, 49),
+		DRV_FIXED,
+		MTK_FUNCTION(0, "GPIO49"),
+		MTK_FUNCTION(1, "SDA1")
+	),
+	MTK_PIN(
+		50, "GPIO50",
+		MTK_EINT_FUNCTION(0, 50),
+		DRV_FIXED,
+		MTK_FUNCTION(0, "GPIO50"),
+		MTK_FUNCTION(1, "SCL1")
+	),
+	MTK_PIN(
+		51, "GPIO51",
+		MTK_EINT_FUNCTION(0, 51),
+		DRV_FIXED,
+		MTK_FUNCTION(0, "GPIO51"),
+		MTK_FUNCTION(1, "SDA2")
+	),
+	MTK_PIN(
+		52, "GPIO52",
+		MTK_EINT_FUNCTION(0, 52),
+		DRV_FIXED,
+		MTK_FUNCTION(0, "GPIO52"),
+		MTK_FUNCTION(1, "SCL2")
+	),
+	MTK_PIN(
+		53, "GPIO53",
+		MTK_EINT_FUNCTION(0, 53),
+		DRV_FIXED,
+		MTK_FUNCTION(0, "GPIO53"),
+		MTK_FUNCTION(1, "SDA3"),
+		MTK_FUNCTION(3, "IDDIG"),
+		MTK_FUNCTION(5, "MD_EINT2"),
+		MTK_FUNCTION(6, "C2K_UIM1_HOT_PLUG_IN")
+	),
+	MTK_PIN(
+		54, "GPIO54",
+		MTK_EINT_FUNCTION(0, 54),
+		DRV_FIXED,
+		MTK_FUNCTION(0, "GPIO54"),
+		MTK_FUNCTION(1, "SCL3"),
+		MTK_FUNCTION(3, "IDDIG"),
+		MTK_FUNCTION(5, "MD_EINT1"),
+		MTK_FUNCTION(6, "C2K_UIM0_HOT_PLUG_IN")
+	),
+	MTK_PIN(
+		55, "GPIO55",
+		MTK_EINT_FUNCTION(0, 55),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO55"),
+		MTK_FUNCTION(1, "SRCLKENAI0"),
+		MTK_FUNCTION(2, "PWM2"),
+		MTK_FUNCTION(3, "CLKM5"),
+		MTK_FUNCTION(4, "CORESONIC_SWD"),
+		MTK_FUNCTION(5, "ANT_SEL6"),
+		MTK_FUNCTION(6, "KROW5"),
+		MTK_FUNCTION(7, "DISP_PWM")
+	),
+	MTK_PIN(
+		56, "GPIO56",
+		MTK_EINT_FUNCTION(0, 56),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO56"),
+		MTK_FUNCTION(1, "SRCLKENA1")
+	),
+	MTK_PIN(
+		57, "GPIO57",
+		MTK_EINT_FUNCTION(0, 57),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO57"),
+		MTK_FUNCTION(1, "URXD2"),
+		MTK_FUNCTION(2, "DPI_HSYNC0"),
+		MTK_FUNCTION(3, "UTXD2"),
+		MTK_FUNCTION(4, "MD_URXD"),
+		MTK_FUNCTION(5, "SRCLKENAI1"),
+		MTK_FUNCTION(6, "KROW4"),
+		MTK_FUNCTION(7, "DBG_MON_A14")
+	),
+	MTK_PIN(
+		58, "GPIO58",
+		MTK_EINT_FUNCTION(0, 58),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO58"),
+		MTK_FUNCTION(1, "UTXD2"),
+		MTK_FUNCTION(2, "DPI_VSYNC0"),
+		MTK_FUNCTION(3, "URXD2"),
+		MTK_FUNCTION(4, "MD_UTXD"),
+		MTK_FUNCTION(5, "TDD_TXD"),
+		MTK_FUNCTION(6, "KROW5"),
+		MTK_FUNCTION(7, "DBG_MON_A15")
+	),
+	MTK_PIN(
+		59, "GPIO59",
+		MTK_EINT_FUNCTION(0, 59),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO59"),
+		MTK_FUNCTION(1, "URXD3"),
+		MTK_FUNCTION(2, "DPI_CK0"),
+		MTK_FUNCTION(3, "UTXD3"),
+		MTK_FUNCTION(4, "UCTS2"),
+		MTK_FUNCTION(5, "PWM3"),
+		MTK_FUNCTION(6, "KROW6"),
+		MTK_FUNCTION(7, "DBG_MON_A16")
+	),
+	MTK_PIN(
+		60, "GPIO60",
+		MTK_EINT_FUNCTION(0, 60),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO60"),
+		MTK_FUNCTION(1, "UTXD3"),
+		MTK_FUNCTION(2, "DPI_DE0"),
+		MTK_FUNCTION(3, "URXD3"),
+		MTK_FUNCTION(4, "URTS2"),
+		MTK_FUNCTION(5, "PWM4"),
+		MTK_FUNCTION(6, "KROW7"),
+		MTK_FUNCTION(7, "DBG_MON_A17")
+	),
+	MTK_PIN(
+		61, "GPIO61",
+		MTK_EINT_FUNCTION(0, 61),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO61"),
+		MTK_FUNCTION(1, "PCM1_CLK"),
+		MTK_FUNCTION(2, "DPI_D0"),
+		MTK_FUNCTION(3, "I2S0_BCK"),
+		MTK_FUNCTION(4, "KROW4"),
+		MTK_FUNCTION(5, "ANT_SEL3"),
+		MTK_FUNCTION(6, "IRTX_OUT"),
+		MTK_FUNCTION(7, "DBG_MON_A18")
+	),
+	MTK_PIN(
+		62, "GPIO62",
+		MTK_EINT_FUNCTION(0, 62),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO62"),
+		MTK_FUNCTION(1, "PCM1_SYNC"),
+		MTK_FUNCTION(2, "DPI_D1"),
+		MTK_FUNCTION(3, "I2S0_LRCK"),
+		MTK_FUNCTION(4, "KCOL7"),
+		MTK_FUNCTION(5, "CLKM3"),
+		MTK_FUNCTION(6, "CMFLASH"),
+		MTK_FUNCTION(7, "DBG_MON_A19")
+	),
+	MTK_PIN(
+		63, "GPIO63",
+		MTK_EINT_FUNCTION(0, 63),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO63"),
+		MTK_FUNCTION(1, "PCM1_DI"),
+		MTK_FUNCTION(2, "DPI_D2"),
+		MTK_FUNCTION(3, "I2S0_DI"),
+		MTK_FUNCTION(4, "PCM1_DO0"),
+		MTK_FUNCTION(5, "CLKM5"),
+		MTK_FUNCTION(6, "KROW3"),
+		MTK_FUNCTION(7, "DBG_MON_A20")
+	),
+	MTK_PIN(
+		64, "GPIO64",
+		MTK_EINT_FUNCTION(0, 64),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO64"),
+		MTK_FUNCTION(1, "PCM1_DO0"),
+		MTK_FUNCTION(2, "DPI_D3"),
+		MTK_FUNCTION(3, "I2S0_MCK"),
+		MTK_FUNCTION(4, "PCM1_DI"),
+		MTK_FUNCTION(5, "SRCLKENAI2"),
+		MTK_FUNCTION(6, "KCOL5"),
+		MTK_FUNCTION(7, "DBG_MON_A21")
+	),
+	MTK_PIN(
+		65, "GPIO65",
+		MTK_EINT_FUNCTION(0, 65),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO65"),
+		MTK_FUNCTION(1, "SPI_CSA"),
+		MTK_FUNCTION(2, "EXT_FRAME_SYNC"),
+		MTK_FUNCTION(3, "I2S3_MCK"),
+		MTK_FUNCTION(4, "KROW2"),
+		MTK_FUNCTION(5, "GPS_FRAME_SYNC"),
+		MTK_FUNCTION(6, "PTA_RXD"),
+		MTK_FUNCTION(7, "DBG_MON_A22")
+	),
+	MTK_PIN(
+		66, "GPIO66",
+		MTK_EINT_FUNCTION(0, 66),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO66"),
+		MTK_FUNCTION(1, "SPI_CKA"),
+		MTK_FUNCTION(2, "USB_DRVVBUS"),
+		MTK_FUNCTION(3, "I2S3_BCK"),
+		MTK_FUNCTION(4, "KCOL2"),
+		MTK_FUNCTION(6, "PTA_TXD"),
+		MTK_FUNCTION(7, "DBG_MON_A23")
+	),
+	MTK_PIN(
+		67, "GPIO67",
+		MTK_EINT_FUNCTION(0, 67),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO67"),
+		MTK_FUNCTION(1, "SPI_MIA"),
+		MTK_FUNCTION(2, "SPI_MOA"),
+		MTK_FUNCTION(3, "I2S3_DO"),
+		MTK_FUNCTION(4, "PTA_RXD"),
+		MTK_FUNCTION(5, "IDDIG"),
+		MTK_FUNCTION(6, "UCTS1"),
+		MTK_FUNCTION(7, "DBG_MON_A24")
+	),
+	MTK_PIN(
+		68, "GPIO68",
+		MTK_EINT_FUNCTION(0, 68),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO68"),
+		MTK_FUNCTION(1, "SPI_MOA"),
+		MTK_FUNCTION(2, "SPI_MIA"),
+		MTK_FUNCTION(3, "I2S3_LRCK"),
+		MTK_FUNCTION(4, "PTA_TXD"),
+		MTK_FUNCTION(5, "ANT_SEL4"),
+		MTK_FUNCTION(6, "URTS1"),
+		MTK_FUNCTION(7, "DBG_MON_A25")
+	),
+	MTK_PIN(
+		69, "GPIO69",
+		MTK_EINT_FUNCTION(0, 69),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO69"),
+		MTK_FUNCTION(1, "DISP_PWM"),
+		MTK_FUNCTION(2, "PWM1"),
+		MTK_FUNCTION(3, "LTE_MD32_JTAG_TRST"),
+		MTK_FUNCTION(4, "TDD_TRSTN"),
+		MTK_FUNCTION(5, "ANT_SEL7"),
+		MTK_FUNCTION(6, "DM_JTINTP")
+	),
+	MTK_PIN(
+		70, "GPIO70",
+		MTK_EINT_FUNCTION(0, 70),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO70"),
+		MTK_FUNCTION(1, "JTMS"),
+		MTK_FUNCTION(2, "CONN_MCU_TMS"),
+		MTK_FUNCTION(3, "LTE_MD32_JTAG_TMS"),
+		MTK_FUNCTION(4, "TDD_TMS"),
+		MTK_FUNCTION(5, "CORESONIC_SWD"),
+		MTK_FUNCTION(6, "DM_OTMS"),
+		MTK_FUNCTION(7, "DFD_TMS")
+	),
+	MTK_PIN(
+		71, "GPIO71",
+		MTK_EINT_FUNCTION(0, 71),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO71"),
+		MTK_FUNCTION(1, "JTCK"),
+		MTK_FUNCTION(2, "CONN_MCU_TCK[1]"),
+		MTK_FUNCTION(3, "LTE_MD32_JTAG_TCK"),
+		MTK_FUNCTION(4, "TDD_TCK"),
+		MTK_FUNCTION(5, "CORESONIC_SWCK"),
+		MTK_FUNCTION(6, "DM_OTCK"),
+		MTK_FUNCTION(7, "DFD_TCK_XI")
+	),
+	MTK_PIN(
+		72, "GPIO72",
+		MTK_EINT_FUNCTION(0, 72),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO72"),
+		MTK_FUNCTION(1, "JTDI"),
+		MTK_FUNCTION(2, "CONN_MCU_TDI"),
+		MTK_FUNCTION(3, "LTE_MD32_JTAG_TDI"),
+		MTK_FUNCTION(4, "TDD_TDI"),
+		MTK_FUNCTION(6, "DM_OTDI"),
+		MTK_FUNCTION(7, "DFD_TDI")
+	),
+	MTK_PIN(
+		73, "GPIO73",
+		MTK_EINT_FUNCTION(0, 73),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO73"),
+		MTK_FUNCTION(1, "JTDO"),
+		MTK_FUNCTION(2, "CONN_MCU_TDO"),
+		MTK_FUNCTION(3, "LTE_MD32_JTAG_TDO"),
+		MTK_FUNCTION(4, "TDD_TDO"),
+		MTK_FUNCTION(6, "DM_OTDO"),
+		MTK_FUNCTION(7, "DFD_TDO")
+	),
+	MTK_PIN(
+		74, "GPIO74",
+		MTK_EINT_FUNCTION(0, 74),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO74"),
+		MTK_FUNCTION(1, "URXD0"),
+		MTK_FUNCTION(2, "UTXD0"),
+		MTK_FUNCTION(3, "MD_URXD"),
+		MTK_FUNCTION(4, "SDA3"),
+		MTK_FUNCTION(5, "C2K_UART0_RXD"),
+		MTK_FUNCTION(6, "LTE_URXD"),
+		MTK_FUNCTION(7, "AUXIF_ST")
+	),
+	MTK_PIN(
+		75, "GPIO75",
+		MTK_EINT_FUNCTION(0, 75),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO75"),
+		MTK_FUNCTION(1, "UTXD0"),
+		MTK_FUNCTION(2, "URXD0"),
+		MTK_FUNCTION(3, "MD_UTXD"),
+		MTK_FUNCTION(4, "TDD_TXD"),
+		MTK_FUNCTION(5, "C2K_UART0_TXD"),
+		MTK_FUNCTION(6, "LTE_UTXD")
+	),
+	MTK_PIN(
+		76, "GPIO76",
+		MTK_EINT_FUNCTION(0, 76),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO76"),
+		MTK_FUNCTION(1, "URXD1"),
+		MTK_FUNCTION(2, "UTXD1"),
+		MTK_FUNCTION(3, "MD_URXD"),
+		MTK_FUNCTION(4, "SCL3"),
+		MTK_FUNCTION(5, "LTE_URXD"),
+		MTK_FUNCTION(6, "C2K_UART0_RXD"),
+		MTK_FUNCTION(7, "AUXIF_CLK")
+	),
+	MTK_PIN(
+		77, "GPIO77",
+		MTK_EINT_FUNCTION(0, 77),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO77"),
+		MTK_FUNCTION(1, "UTXD1"),
+		MTK_FUNCTION(2, "URXD1"),
+		MTK_FUNCTION(3, "MD_UTXD"),
+		MTK_FUNCTION(4, "TDD_TXD"),
+		MTK_FUNCTION(5, "LTE_UTXD"),
+		MTK_FUNCTION(6, "C2K_UART0_TXD")
+	),
+	MTK_PIN(
+		78, "GPIO78",
+		MTK_EINT_FUNCTION(0, 78),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO78"),
+		MTK_FUNCTION(1, "I2S0_DI"),
+		MTK_FUNCTION(2, "PCM1_DI"),
+		MTK_FUNCTION(3, "I2S3_DO"),
+		MTK_FUNCTION(4, "I2S1_DO"),
+		MTK_FUNCTION(5, "PWM0"),
+		MTK_FUNCTION(6, "I2S2_DI"),
+		MTK_FUNCTION(7, "DBG_MON_A26")
+	),
+	MTK_PIN(
+		79, "GPIO79",
+		MTK_EINT_FUNCTION(0, 79),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO79"),
+		MTK_FUNCTION(1, "I2S0_LRCK"),
+		MTK_FUNCTION(2, "PCM1_SYNC"),
+		MTK_FUNCTION(3, "I2S3_LRCK"),
+		MTK_FUNCTION(4, "I2S1_LRCK"),
+		MTK_FUNCTION(5, "PWM3"),
+		MTK_FUNCTION(6, "I2S2_LRCK"),
+		MTK_FUNCTION(7, "DBG_MON_A27")
+	),
+	MTK_PIN(
+		80, "GPIO80",
+		MTK_EINT_FUNCTION(0, 80),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO80"),
+		MTK_FUNCTION(1, "I2S0_BCK"),
+		MTK_FUNCTION(2, "PCM1_CLK[1]"),
+		MTK_FUNCTION(3, "I2S3_BCK"),
+		MTK_FUNCTION(4, "I2S1_BCK"),
+		MTK_FUNCTION(5, "PWM4"),
+		MTK_FUNCTION(6, "I2S2_BCK"),
+		MTK_FUNCTION(7, "DBG_MON_A28")
+	),
+	MTK_PIN(
+		81, "GPIO81",
+		MTK_EINT_FUNCTION(0, 81),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO81"),
+		MTK_FUNCTION(1, "KROW0"),
+		MTK_FUNCTION(3, "CONN_MCU_DBGI_N"),
+		MTK_FUNCTION(4, "CORESONIC_SWCK"),
+		MTK_FUNCTION(5, "C2K_TCK"),
+		MTK_FUNCTION(7, "C2K_DM_EINT1")
+	),
+	MTK_PIN(
+		82, "GPIO82",
+		MTK_EINT_FUNCTION(0, 82),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO82"),
+		MTK_FUNCTION(1, "KROW1"),
+		MTK_FUNCTION(3, "CONN_MCU_TRST_B"),
+		MTK_FUNCTION(4, "CORESONIC_SWD"),
+		MTK_FUNCTION(5, "C2K_NTRST"),
+		MTK_FUNCTION(6, "USB_DRVVBUS"),
+		MTK_FUNCTION(7, "C2K_DM_EINT2")
+	),
+	MTK_PIN(
+		83, "GPIO83",
+		MTK_EINT_FUNCTION(0, 83),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO83"),
+		MTK_FUNCTION(1, "KROW2"),
+		MTK_FUNCTION(2, "USB_DRVVBUS"),
+		MTK_FUNCTION(5, "C2K_TDI"),
+		MTK_FUNCTION(7, "C2K_DM_EINT3")
+	),
+	MTK_PIN(
+		84, "GPIO84",
+		MTK_EINT_FUNCTION(0, 84),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO84"),
+		MTK_FUNCTION(1, "KCOL0"),
+		MTK_FUNCTION(2, "URTS0"),
+		MTK_FUNCTION(3, "CONN_MCU_DBGACK_N"),
+		MTK_FUNCTION(4, "SCL2"),
+		MTK_FUNCTION(5, "C2K_TDO"),
+		MTK_FUNCTION(6, "AUXIF_CLK")
+	),
+	MTK_PIN(
+		85, "GPIO85",
+		MTK_EINT_FUNCTION(0, 85),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO85"),
+		MTK_FUNCTION(1, "KCOL1"),
+		MTK_FUNCTION(2, "UCTS0"),
+		MTK_FUNCTION(3, "UCTS1"),
+		MTK_FUNCTION(4, "SDA2"),
+		MTK_FUNCTION(5, "C2K_TMS"),
+		MTK_FUNCTION(6, "AUXIF_ST"),
+		MTK_FUNCTION(7, "DBG_MON_A31")
+	),
+	MTK_PIN(
+		86, "GPIO86",
+		MTK_EINT_FUNCTION(0, 86),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO86"),
+		MTK_FUNCTION(1, "KCOL2"),
+		MTK_FUNCTION(3, "URTS1"),
+		MTK_FUNCTION(5, "C2K_RTCK"),
+		MTK_FUNCTION(7, "DBG_MON_A32")
+	),
+	MTK_PIN(
+		87, "GPIO87",
+		MTK_EINT_FUNCTION(0, 87),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO87"),
+		MTK_FUNCTION(1, "BPI_BUS5"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS5"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS5"),
+		MTK_FUNCTION(7, "DBG_MON_B0")
+	),
+	MTK_PIN(
+		88, "GPIO88",
+		MTK_EINT_FUNCTION(0, 88),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO88"),
+		MTK_FUNCTION(1, "BPI_BUS6"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS6"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS6"),
+		MTK_FUNCTION(7, "DBG_MON_B1")
+	),
+	MTK_PIN(
+		89, "GPIO89",
+		MTK_EINT_FUNCTION(0, 89),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO89"),
+		MTK_FUNCTION(1, "BPI_BUS7"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS7"),
+		MTK_FUNCTION(3, "CLKM0"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS7"),
+		MTK_FUNCTION(7, "DBG_MON_B2")
+	),
+	MTK_PIN(
+		90, "GPIO90",
+		MTK_EINT_FUNCTION(0, 90),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO90"),
+		MTK_FUNCTION(1, "BPI_BUS8"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS8"),
+		MTK_FUNCTION(3, "CLKM1"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS8"),
+		MTK_FUNCTION(7, "DBG_MON_B3")
+	),
+	MTK_PIN(
+		91, "GPIO91",
+		MTK_EINT_FUNCTION(0, 91),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO91"),
+		MTK_FUNCTION(1, "BPI_BUS9"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS9"),
+		MTK_FUNCTION(3, "CLKM2"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS9"),
+		MTK_FUNCTION(7, "DBG_MON_B4")
+	),
+	MTK_PIN(
+		92, "GPIO92",
+		MTK_EINT_FUNCTION(0, 92),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO92"),
+		MTK_FUNCTION(1, "BPI_BUS10"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS10"),
+		MTK_FUNCTION(3, "CLKM3"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS10"),
+		MTK_FUNCTION(7, "DBG_MON_B5")
+	),
+	MTK_PIN(
+		93, "GPIO93",
+		MTK_EINT_FUNCTION(0, 93),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO93"),
+		MTK_FUNCTION(1, "BPI_BUS11"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS11"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS11"),
+		MTK_FUNCTION(7, "DBG_MON_B6")
+	),
+	MTK_PIN(
+		94, "GPIO94",
+		MTK_EINT_FUNCTION(0, 94),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO94"),
+		MTK_FUNCTION(1, "BPI_BUS12"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS12"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS12"),
+		MTK_FUNCTION(7, "DBG_MON_B7")
+	),
+	MTK_PIN(
+		95, "GPIO95",
+		MTK_EINT_FUNCTION(0, 95),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO95"),
+		MTK_FUNCTION(1, "BPI_BUS13"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS13"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS13"),
+		MTK_FUNCTION(7, "DBG_MON_B8")
+	),
+	MTK_PIN(
+		96, "GPIO96",
+		MTK_EINT_FUNCTION(0, 96),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO96"),
+		MTK_FUNCTION(1, "BPI_BUS14"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS14"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS14"),
+		MTK_FUNCTION(7, "DBG_MON_B9")
+	),
+	MTK_PIN(
+		97, "GPIO97",
+		MTK_EINT_FUNCTION(0, 97),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO97"),
+		MTK_FUNCTION(1, "BPI_BUS15"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS15"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS15"),
+		MTK_FUNCTION(7, "DBG_MON_B10")
+	),
+	MTK_PIN(
+		98, "GPIO98",
+		MTK_EINT_FUNCTION(0, 98),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO98"),
+		MTK_FUNCTION(1, "BPI_BUS16"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS16"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS16"),
+		MTK_FUNCTION(7, "DBG_MON_B11")
+	),
+	MTK_PIN(
+		99, "GPIO99",
+		MTK_EINT_FUNCTION(0, 99),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO99"),
+		MTK_FUNCTION(1, "BPI_BUS17"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS17"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS17"),
+		MTK_FUNCTION(7, "DBG_MON_B12")
+	),
+	MTK_PIN(
+		100, "GPIO100",
+		MTK_EINT_FUNCTION(0, 100),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO100"),
+		MTK_FUNCTION(1, "BPI_BUS18"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS18"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS18"),
+		MTK_FUNCTION(7, "DBG_MON_B13")
+	),
+	MTK_PIN(
+		101, "GPIO101",
+		MTK_EINT_FUNCTION(0, 101),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO101"),
+		MTK_FUNCTION(1, "BPI_BUS19"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS19"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS19"),
+		MTK_FUNCTION(7, "DBG_MON_B14")
+	),
+	MTK_PIN(
+		102, "GPIO102",
+		MTK_EINT_FUNCTION(0, 102),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO102"),
+		MTK_FUNCTION(1, "BPI_BUS20"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS20"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS20"),
+		MTK_FUNCTION(7, "DBG_MON_B15")
+	),
+	MTK_PIN(
+		103, "GPIO103",
+		MTK_EINT_FUNCTION(0, 103),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO103"),
+		MTK_FUNCTION(1, "C2K_TXBPI"),
+		MTK_FUNCTION(7, "DBG_MON_B16")
+	),
+	MTK_PIN(
+		104, "GPIO104",
+		MTK_EINT_FUNCTION(0, 104),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO104"),
+		MTK_FUNCTION(1, "RFIC1_BSI_EN"),
+		MTK_FUNCTION(5, "C2K_RX_BSI_EN"),
+		MTK_FUNCTION(7, "DBG_MON_B17")
+	),
+	MTK_PIN(
+		105, "GPIO105",
+		MTK_EINT_FUNCTION(0, 105),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO105"),
+		MTK_FUNCTION(1, "RFIC1_BSI_CK"),
+		MTK_FUNCTION(5, "C2K_RX_BSI_CLK"),
+		MTK_FUNCTION(7, "DBG_MON_B18")
+	),
+	MTK_PIN(
+		106, "GPIO106",
+		MTK_EINT_FUNCTION(0, 106),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO106"),
+		MTK_FUNCTION(1, "RFIC1_BSI_D0"),
+		MTK_FUNCTION(5, "C2K_RX_BSI_DATA"),
+		MTK_FUNCTION(7, "DBG_MON_B19")
+	),
+	MTK_PIN(
+		107, "GPIO107",
+		MTK_EINT_FUNCTION(0, 107),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO107"),
+		MTK_FUNCTION(1, "RFIC1_BSI_D1"),
+		MTK_FUNCTION(5, "C2K_TX_BSI_EN"),
+		MTK_FUNCTION(7, "DBG_MON_B20")
+	),
+	MTK_PIN(
+		108, "GPIO108",
+		MTK_EINT_FUNCTION(0, 108),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO108"),
+		MTK_FUNCTION(1, "RFIC1_BSI_D2"),
+		MTK_FUNCTION(5, "C2K_TX_BSI_CLK"),
+		MTK_FUNCTION(7, "DBG_MON_B21")
+	),
+	MTK_PIN(
+		109, "GPIO109",
+		MTK_EINT_FUNCTION(0, 109),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO109"),
+		MTK_FUNCTION(5, "C2K_TX_BSI_DATA"),
+		MTK_FUNCTION(7, "DBG_MON_B22")
+	),
+	MTK_PIN(
+		110, "GPIO110",
+		MTK_EINT_FUNCTION(0, 110),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO110"),
+		MTK_FUNCTION(1, "RFIC0_BSI_EN"),
+		MTK_FUNCTION(4, "SPM_BSI_EN"),
+		MTK_FUNCTION(7, "DBG_MON_B23")
+	),
+	MTK_PIN(
+		111, "GPIO111",
+		MTK_EINT_FUNCTION(0, 111),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO111"),
+		MTK_FUNCTION(1, "RFIC0_BSI_CK"),
+		MTK_FUNCTION(4, "SPM_BSI_CLK"),
+		MTK_FUNCTION(7, "DBG_MON_B24")
+	),
+	MTK_PIN(
+		112, "GPIO112",
+		MTK_EINT_FUNCTION(0, 112),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO112"),
+		MTK_FUNCTION(1, "RFIC0_BSI_D2"),
+		MTK_FUNCTION(4, "SPM_BSI_D2"),
+		MTK_FUNCTION(7, "DBG_MON_B25")
+	),
+	MTK_PIN(
+		113, "GPIO113",
+		MTK_EINT_FUNCTION(0, 113),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO113"),
+		MTK_FUNCTION(1, "RFIC0_BSI_D1"),
+		MTK_FUNCTION(4, "SPM_BSI_D1"),
+		MTK_FUNCTION(7, "DBG_MON_B26")
+	),
+	MTK_PIN(
+		114, "GPIO114",
+		MTK_EINT_FUNCTION(0, 114),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO114"),
+		MTK_FUNCTION(1, "RFIC0_BSI_D0"),
+		MTK_FUNCTION(4, "SPM_BSI_D0"),
+		MTK_FUNCTION(7, "DBG_MON_B27")
+	),
+	MTK_PIN(
+		115, "GPIO115",
+		MTK_EINT_FUNCTION(0, 115),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO115"),
+		MTK_FUNCTION(1, "AUXIN0")
+	),
+	MTK_PIN(
+		116, "GPIO116",
+		MTK_EINT_FUNCTION(0, 116),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO116"),
+		MTK_FUNCTION(1, "AUXIN1")
+	),
+	MTK_PIN(
+		117, "GPIO117",
+		MTK_EINT_FUNCTION(0, 117),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO117"),
+		MTK_FUNCTION(1, "AUXIN2")
+	),
+	MTK_PIN(
+		118, "GPIO118",
+		MTK_EINT_FUNCTION(0, 118),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO118"),
+		MTK_FUNCTION(1, "TXBPI")
+	),
+	MTK_PIN(
+		119, "GPIO119",
+		MTK_EINT_FUNCTION(0, 119),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO119"),
+		MTK_FUNCTION(1, "BPI_BUS0"),
+		MTK_FUNCTION(7, "DBG_MON_B28")
+	),
+	MTK_PIN(
+		120, "GPIO120",
+		MTK_EINT_FUNCTION(0, 120),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO120"),
+		MTK_FUNCTION(1, "BPI_BUS1"),
+		MTK_FUNCTION(7, "DBG_MON_B29")
+	),
+	MTK_PIN(
+		121, "GPIO121",
+		MTK_EINT_FUNCTION(0, 121),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO121"),
+		MTK_FUNCTION(1, "BPI_BUS2"),
+		MTK_FUNCTION(7, "DBG_MON_B30")
+	),
+	MTK_PIN(
+		122, "GPIO122",
+		MTK_EINT_FUNCTION(0, 122),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO122"),
+		MTK_FUNCTION(1, "BPI_BUS3"),
+		MTK_FUNCTION(7, "DBG_MON_B31")
+	),
+	MTK_PIN(
+		123, "GPIO123",
+		MTK_EINT_FUNCTION(0, 123),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO123"),
+		MTK_FUNCTION(1, "BPI_BUS4"),
+		MTK_FUNCTION(7, "DBG_MON_B32")
+	),
+	MTK_PIN(
+		124, "GPIO124",
+		MTK_EINT_FUNCTION(0, 124),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO124"),
+		MTK_FUNCTION(1, "BPI_BUS21"),
+		MTK_FUNCTION(5, "DPI_HSYNC1"),
+		MTK_FUNCTION(6, "KCOL2"),
+		MTK_FUNCTION(7, "TDD_TXD")
+	),
+	MTK_PIN(
+		125, "GPIO125",
+		MTK_EINT_FUNCTION(0, 125),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO125"),
+		MTK_FUNCTION(1, "BPI_BUS22"),
+		MTK_FUNCTION(5, "DPI_VSYNC1"),
+		MTK_FUNCTION(6, "KROW2"),
+		MTK_FUNCTION(7, "MD_URXD")
+	),
+	MTK_PIN(
+		126, "GPIO126",
+		MTK_EINT_FUNCTION(0, 126),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO126"),
+		MTK_FUNCTION(1, "BPI_BUS23"),
+		MTK_FUNCTION(5, "DPI_CK1"),
+		MTK_FUNCTION(6, "I2S2_MCK"),
+		MTK_FUNCTION(7, "MD_UTXD")
+	),
+	MTK_PIN(
+		127, "GPIO127",
+		MTK_EINT_FUNCTION(0, 127),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO127"),
+		MTK_FUNCTION(1, "BPI_BUS24"),
+		MTK_FUNCTION(3, "CONN_MCU_DBGI_N"),
+		MTK_FUNCTION(4, "EXT_FRAME_SYNC"),
+		MTK_FUNCTION(5, "DPI_DE1"),
+		MTK_FUNCTION(6, "SRCLKENAI1"),
+		MTK_FUNCTION(7, "URXD0")
+	),
+	MTK_PIN(
+		128, "GPIO128",
+		MTK_EINT_FUNCTION(0, 128),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO128"),
+		MTK_FUNCTION(1, "BPI_BUS25"),
+		MTK_FUNCTION(3, "GPS_FRAME_SYNC"),
+		MTK_FUNCTION(5, "I2S2_DI"),
+		MTK_FUNCTION(6, "PTA_RXD"),
+		MTK_FUNCTION(7, "UTXD0")
+	),
+	MTK_PIN(
+		129, "GPIO129",
+		MTK_EINT_FUNCTION(0, 129),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO129"),
+		MTK_FUNCTION(1, "BPI_BUS26"),
+		MTK_FUNCTION(2, "DISP_PWM"),
+		MTK_FUNCTION(5, "I2S2_LRCK"),
+		MTK_FUNCTION(6, "PTA_TXD"),
+		MTK_FUNCTION(7, "LTE_URXD")
+	),
+	MTK_PIN(
+		130, "GPIO130",
+		MTK_EINT_FUNCTION(0, 130),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO130"),
+		MTK_FUNCTION(1, "BPI_BUS27"),
+		MTK_FUNCTION(5, "I2S2_BCK"),
+		MTK_FUNCTION(6, "IRTX_OUT"),
+		MTK_FUNCTION(7, "LTE_UTXD")
+	),
+	MTK_PIN(
+		131, "GPIO131",
+		MTK_EINT_FUNCTION(0, 131),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO131"),
+		MTK_FUNCTION(1, "LTE_PAVM0")
+	),
+	MTK_PIN(
+		132, "GPIO132",
+		MTK_EINT_FUNCTION(0, 132),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO132"),
+		MTK_FUNCTION(1, "LTE_PAVM1")
+	),
+	MTK_PIN(
+		133, "GPIO133",
+		MTK_EINT_FUNCTION(0, 133),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO133"),
+		MTK_FUNCTION(1, "MIPI1_SCLK")
+	),
+	MTK_PIN(
+		134, "GPIO134",
+		MTK_EINT_FUNCTION(0, 134),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO134"),
+		MTK_FUNCTION(1, "MIPI1_SDATA")
+	),
+	MTK_PIN(
+		135, "GPIO135",
+		MTK_EINT_FUNCTION(0, 135),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO135"),
+		MTK_FUNCTION(1, "MIPI0_SCLK")
+	),
+	MTK_PIN(
+		136, "GPIO136",
+		MTK_EINT_FUNCTION(0, 136),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO136"),
+		MTK_FUNCTION(1, "MIPI0_SDATA")
+	),
+	MTK_PIN(
+		137, "GPIO137",
+		MTK_EINT_FUNCTION(0, 137),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO137"),
+		MTK_FUNCTION(1, "RTC32K_CK")
+	),
+	MTK_PIN(
+		138, "GPIO138",
+		MTK_EINT_FUNCTION(0, 138),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO138"),
+		MTK_FUNCTION(1, "PWRAP_SPIDO"),
+		MTK_FUNCTION(2, "PWRAP_SPIDI")
+	),
+	MTK_PIN(
+		139, "GPIO139",
+		MTK_EINT_FUNCTION(0, 139),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO139"),
+		MTK_FUNCTION(1, "PWRAP_SPIDI"),
+		MTK_FUNCTION(2, "PWRAP_SPIDO")
+	),
+	MTK_PIN(
+		140, "GPIO140",
+		MTK_EINT_FUNCTION(0, 140),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO140"),
+		MTK_FUNCTION(3, "LTE_MD32_JTAG_TRST"),
+		MTK_FUNCTION(4, "TDD_TRSTN"),
+		MTK_FUNCTION(5, "DM_JTINTP")
+	),
+	MTK_PIN(
+		141, "GPIO141",
+		MTK_EINT_FUNCTION(0, 141),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO141"),
+		MTK_FUNCTION(1, "PWRAP_SPICK_I")
+	),
+	MTK_PIN(
+		142, "GPIO142",
+		MTK_EINT_FUNCTION(0, 142),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO142"),
+		MTK_FUNCTION(1, "PWRAP_SPICS_B_I")
+	),
+	MTK_PIN(
+		143, "GPIO143",
+		MTK_EINT_FUNCTION(0, 143),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO143"),
+		MTK_FUNCTION(1, "AUD_CLK_MOSI")
+	),
+	MTK_PIN(
+		144, "GPIO144",
+		MTK_EINT_FUNCTION(0, 144),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO144"),
+		MTK_FUNCTION(1, "AUD_DAT_MISO"),
+		MTK_FUNCTION(3, "AUD_DAT_MOSI")
+	),
+	MTK_PIN(
+		145, "GPIO145",
+		MTK_EINT_FUNCTION(0, 145),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO145"),
+		MTK_FUNCTION(1, "AUD_DAT_MOSI"),
+		MTK_FUNCTION(3, "AUD_DAT_MISO")
+	),
+	MTK_PIN(
+		146, "GPIO146",
+		MTK_EINT_FUNCTION(0, 146),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO146"),
+		MTK_FUNCTION(1, "LCM_RST")
+	),
+	MTK_PIN(
+		147, "GPIO147",
+		MTK_EINT_FUNCTION(0, 147),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO147"),
+		MTK_FUNCTION(1, "DSI_TE")
+	),
+	MTK_PIN(
+		148, "GPIO148",
+		MTK_EINT_FUNCTION(0, 148),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO148"),
+		MTK_FUNCTION(1, "SRCLKENA")
+	),
+	MTK_PIN(
+		149, "GPIO149",
+		MTK_EINT_FUNCTION(0, 149),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO149"),
+		MTK_FUNCTION(1, "WATCHDOG")
+	),
+	MTK_PIN(
+		150, "GPIO150",
+		MTK_EINT_FUNCTION(0, 150),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO150"),
+		MTK_FUNCTION(1, "TDP0")
+	),
+	MTK_PIN(
+		151, "GPIO151",
+		MTK_EINT_FUNCTION(0, 151),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO151"),
+		MTK_FUNCTION(1, "TDN0")
+	),
+	MTK_PIN(
+		152, "GPIO152",
+		MTK_EINT_FUNCTION(0, 152),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO152"),
+		MTK_FUNCTION(1, "TDP1")
+	),
+	MTK_PIN(
+		153, "GPIO153",
+		MTK_EINT_FUNCTION(0, 153),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO153"),
+		MTK_FUNCTION(1, "TDN1")
+	),
+	MTK_PIN(
+		154, "GPIO154",
+		MTK_EINT_FUNCTION(0, 154),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO154"),
+		MTK_FUNCTION(1, "TCP")
+	),
+	MTK_PIN(
+		155, "GPIO155",
+		MTK_EINT_FUNCTION(0, 155),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO155"),
+		MTK_FUNCTION(1, "TCN")
+	),
+	MTK_PIN(
+		156, "GPIO156",
+		MTK_EINT_FUNCTION(0, 156),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO156"),
+		MTK_FUNCTION(1, "TDP2")
+	),
+	MTK_PIN(
+		157, "GPIO157",
+		MTK_EINT_FUNCTION(0, 157),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO157"),
+		MTK_FUNCTION(1, "TDN2")
+	),
+	MTK_PIN(
+		158, "GPIO158",
+		MTK_EINT_FUNCTION(0, 158),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO158"),
+		MTK_FUNCTION(1, "TDP3")
+	),
+	MTK_PIN(
+		159, "GPIO159",
+		MTK_EINT_FUNCTION(0, 159),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO159"),
+		MTK_FUNCTION(1, "TDN3")
+	),
+	MTK_PIN(
+		160, "GPIO160",
+		MTK_EINT_FUNCTION(0, 160),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO160"),
+		MTK_FUNCTION(1, "MD_SIM2_SCLK"),
+		MTK_FUNCTION(2, "MD_SIM1_SCLK"),
+		MTK_FUNCTION(3, "UIM0_CLK"),
+		MTK_FUNCTION(4, "UIM1_CLK")
+	),
+	MTK_PIN(
+		161, "GPIO161",
+		MTK_EINT_FUNCTION(0, 161),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO161"),
+		MTK_FUNCTION(1, "MD_SIM2_SRST"),
+		MTK_FUNCTION(2, "MD_SIM1_SRST"),
+		MTK_FUNCTION(3, "UIM0_RST"),
+		MTK_FUNCTION(4, "UIM1_RST")
+	),
+	MTK_PIN(
+		162, "GPIO162",
+		MTK_EINT_FUNCTION(0, 162),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO162"),
+		MTK_FUNCTION(1, "MD_SIM2_SDAT"),
+		MTK_FUNCTION(2, "MD_SIM1_SDAT"),
+		MTK_FUNCTION(3, "UIM0_IO"),
+		MTK_FUNCTION(4, "UIM1_IO")
+	),
+	MTK_PIN(
+		163, "GPIO163",
+		MTK_EINT_FUNCTION(0, 163),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO163"),
+		MTK_FUNCTION(1, "MD_SIM1_SCLK"),
+		MTK_FUNCTION(2, "MD_SIM2_SCLK"),
+		MTK_FUNCTION(3, "UIM1_CLK"),
+		MTK_FUNCTION(4, "UIM0_CLK")
+	),
+	MTK_PIN(
+		164, "GPIO164",
+		MTK_EINT_FUNCTION(0, 164),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO164"),
+		MTK_FUNCTION(1, "MD_SIM1_SRST"),
+		MTK_FUNCTION(2, "MD_SIM2_SRST"),
+		MTK_FUNCTION(3, "UIM1_RST"),
+		MTK_FUNCTION(4, "UIM0_RST")
+	),
+	MTK_PIN(
+		165, "GPIO165",
+		MTK_EINT_FUNCTION(0, 165),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO165"),
+		MTK_FUNCTION(1, "MD_SIM1_SDAT"),
+		MTK_FUNCTION(2, "MD_SIM2_SDAT"),
+		MTK_FUNCTION(3, "UIM1_IO"),
+		MTK_FUNCTION(4, "UIM0_IO")
+	),
+	MTK_PIN(
+		166, "GPIO166",
+		MTK_EINT_FUNCTION(0, 166),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO166"),
+		MTK_FUNCTION(1, "MSDC1_CMD"),
+		MTK_FUNCTION(2, "LTE_MD32_JTAG_TMS"),
+		MTK_FUNCTION(3, "C2K_TMS"),
+		MTK_FUNCTION(4, "TDD_TMS"),
+		MTK_FUNCTION(5, "CONN_DSP_JMS"),
+		MTK_FUNCTION(6, "JTMS"),
+		MTK_FUNCTION(7, "CONN_MCU_AICE_TMSC")
+	),
+	MTK_PIN(
+		167, "GPIO167",
+		MTK_EINT_FUNCTION(0, 167),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO167"),
+		MTK_FUNCTION(1, "MSDC1_CLK"),
+		MTK_FUNCTION(2, "LTE_MD32_JTAG_TCK"),
+		MTK_FUNCTION(3, "C2K_TCK"),
+		MTK_FUNCTION(4, "TDD_TCK"),
+		MTK_FUNCTION(5, "CONN_DSP_JCK"),
+		MTK_FUNCTION(6, "JTCK"),
+		MTK_FUNCTION(7, "CONN_MCU_AICE_TCKC")
+	),
+	MTK_PIN(
+		168, "GPIO168",
+		MTK_EINT_FUNCTION(0, 168),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO168"),
+		MTK_FUNCTION(1, "MSDC1_DAT0"),
+		MTK_FUNCTION(2, "LTE_MD32_JTAG_TDI"),
+		MTK_FUNCTION(3, "C2K_TDI"),
+		MTK_FUNCTION(4, "TDD_TDI"),
+		MTK_FUNCTION(5, "CONN_DSP_JDI"),
+		MTK_FUNCTION(6, "JTDI")
+	),
+	MTK_PIN(
+		169, "GPIO169",
+		MTK_EINT_FUNCTION(0, 169),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO169"),
+		MTK_FUNCTION(1, "MSDC1_DAT1"),
+		MTK_FUNCTION(2, "LTE_MD32_JTAG_TDO"),
+		MTK_FUNCTION(3, "C2K_TDO"),
+		MTK_FUNCTION(4, "TDD_TDO"),
+		MTK_FUNCTION(5, "CONN_DSP_JDO"),
+		MTK_FUNCTION(6, "JTDO")
+	),
+	MTK_PIN(
+		170, "GPIO170",
+		MTK_EINT_FUNCTION(0, 170),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO170"),
+		MTK_FUNCTION(1, "MSDC1_DAT2"),
+		MTK_FUNCTION(2, "LTE_MD32_JTAG_TRST"),
+		MTK_FUNCTION(3, "C2K_NTRST"),
+		MTK_FUNCTION(4, "TDD_TRSTN"),
+		MTK_FUNCTION(5, "CONN_DSP_JINTP"),
+		MTK_FUNCTION(6, "DM_JTINTP")
+	),
+	MTK_PIN(
+		171, "GPIO171",
+		MTK_EINT_FUNCTION(0, 171),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO171"),
+		MTK_FUNCTION(1, "MSDC1_DAT3"),
+		MTK_FUNCTION(3, "C2K_RTCK")
+	),
+	MTK_PIN(
+		172, "GPIO172",
+		MTK_EINT_FUNCTION(0, 172),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO172"),
+		MTK_FUNCTION(1, "MSDC0_CMD")
+	),
+	MTK_PIN(
+		173, "GPIO173",
+		MTK_EINT_FUNCTION(0, 173),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO173"),
+		MTK_FUNCTION(1, "MSDC0_DSL")
+	),
+	MTK_PIN(
+		174, "GPIO174",
+		MTK_EINT_FUNCTION(0, 174),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO174"),
+		MTK_FUNCTION(1, "MSDC0_CLK")
+	),
+	MTK_PIN(
+		175, "GPIO175",
+		MTK_EINT_FUNCTION(0, 175),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO175"),
+		MTK_FUNCTION(1, "MSDC0_DAT0")
+	),
+	MTK_PIN(
+		176, "GPIO176",
+		MTK_EINT_FUNCTION(0, 176),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO176"),
+		MTK_FUNCTION(1, "MSDC0_DAT1")
+	),
+	MTK_PIN(
+		177, "GPIO177",
+		MTK_EINT_FUNCTION(0, 177),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO177"),
+		MTK_FUNCTION(1, "MSDC0_DAT2")
+	),
+	MTK_PIN(
+		178, "GPIO178",
+		MTK_EINT_FUNCTION(0, 178),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO178"),
+		MTK_FUNCTION(1, "MSDC0_DAT3")
+	),
+	MTK_PIN(
+		179, "GPIO179",
+		MTK_EINT_FUNCTION(0, 179),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO179"),
+		MTK_FUNCTION(1, "MSDC0_DAT4")
+	),
+	MTK_PIN(
+		180, "GPIO180",
+		MTK_EINT_FUNCTION(0, 180),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO180"),
+		MTK_FUNCTION(1, "MSDC0_DAT5")
+	),
+	MTK_PIN(
+		181, "GPIO181",
+		MTK_EINT_FUNCTION(0, 181),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO181"),
+		MTK_FUNCTION(1, "MSDC0_DAT6")
+	),
+	MTK_PIN(
+		182, "GPIO182",
+		MTK_EINT_FUNCTION(0, 182),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO182"),
+		MTK_FUNCTION(1, "MSDC0_DAT7")
+	),
+	MTK_PIN(
+		183, "GPIO183",
+		MTK_EINT_FUNCTION(0, 183),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO183"),
+		MTK_FUNCTION(1, "MSDC0_RSTB")
+	),
+	MTK_PIN(
+		184, "GPIO184",
+		MTK_EINT_FUNCTION(0, 184),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO184"),
+		MTK_FUNCTION(1, "F2W_DATA"),
+		MTK_FUNCTION(2, "MRG_CLK"),
+		MTK_FUNCTION(3, "C2K_DM_EINT2"),
+		MTK_FUNCTION(4, "PCM0_CLK")
+	),
+	MTK_PIN(
+		185, "GPIO185",
+		MTK_EINT_FUNCTION(0, 185),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO185"),
+		MTK_FUNCTION(1, "F2W_CK"),
+		MTK_FUNCTION(2, "MRG_DI"),
+		MTK_FUNCTION(3, "C2K_DM_EINT3"),
+		MTK_FUNCTION(4, "PCM0_DI")
+	),
+	MTK_PIN(
+		186, "GPIO186",
+		MTK_EINT_FUNCTION(0, 186),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO186"),
+		MTK_FUNCTION(1, "WB_RSTB"),
+		MTK_FUNCTION(4, "URXD3"),
+		MTK_FUNCTION(5, "UTXD3")
+	),
+	MTK_PIN(
+		187, "GPIO187",
+		MTK_EINT_FUNCTION(0, 187),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO187"),
+		MTK_FUNCTION(1, "WB_SCLK"),
+		MTK_FUNCTION(2, "MRG_DO"),
+		MTK_FUNCTION(4, "PCM0_DO")
+	),
+	MTK_PIN(
+		188, "GPIO188",
+		MTK_EINT_FUNCTION(0, 188),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO188"),
+		MTK_FUNCTION(1, "WB_SDATA"),
+		MTK_FUNCTION(2, "MRG_SYNC"),
+		MTK_FUNCTION(4, "PCM0_SYNC")
+	),
+	MTK_PIN(
+		189, "GPIO189",
+		MTK_EINT_FUNCTION(0, 189),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO189"),
+		MTK_FUNCTION(1, "WB_SEN"),
+		MTK_FUNCTION(4, "UTXD3"),
+		MTK_FUNCTION(5, "URXD3")
+	),
+	MTK_PIN(
+		190, "GPIO190",
+		MTK_EINT_FUNCTION(0, 190),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO190"),
+		MTK_FUNCTION(1, "GPS_RXQN")
+	),
+	MTK_PIN(
+		191, "GPIO191",
+		MTK_EINT_FUNCTION(0, 191),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO191"),
+		MTK_FUNCTION(1, "GPS_RXQP")
+	),
+	MTK_PIN(
+		192, "GPIO192",
+		MTK_EINT_FUNCTION(0, 192),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO192"),
+		MTK_FUNCTION(1, "GPS_RXIN")
+	),
+	MTK_PIN(
+		193, "GPIO193",
+		MTK_EINT_FUNCTION(0, 193),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO193"),
+		MTK_FUNCTION(1, "GPS_RXIP")
+	),
+	MTK_PIN(
+		194, "GPIO194",
+		MTK_EINT_FUNCTION(0, 194),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO194"),
+		MTK_FUNCTION(1, "WB_RXQN")
+	),
+	MTK_PIN(
+		195, "GPIO195",
+		MTK_EINT_FUNCTION(0, 195),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO195"),
+		MTK_FUNCTION(1, "WB_RXQP")
+	),
+	MTK_PIN(
+		196, "GPIO196",
+		MTK_EINT_FUNCTION(0, 196),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO196"),
+		MTK_FUNCTION(1, "WB_RXIN")
+	),
+	MTK_PIN(
+		197, "GPIO197",
+		MTK_EINT_FUNCTION(0, 197),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO197"),
+		MTK_FUNCTION(1, "WB_RXIP")
+	),
+	MTK_PIN(
+		198, "GPIO198",
+		MTK_EINT_FUNCTION(0, 198),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO198"),
+		MTK_FUNCTION(1, "MSDC2_CMD"),
+		MTK_FUNCTION(2, "SDA1"),
+		MTK_FUNCTION(3, "C2K_UART0_RXD"),
+		MTK_FUNCTION(4, "C2K_TMS"),
+		MTK_FUNCTION(5, "ANT_SEL6"),
+		MTK_FUNCTION(7, "DM_OTMS")
+	),
+	MTK_PIN(
+		199, "GPIO199",
+		MTK_EINT_FUNCTION(0, 199),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO199"),
+		MTK_FUNCTION(1, "MSDC2_CLK"),
+		MTK_FUNCTION(2, "SCL1"),
+		MTK_FUNCTION(3, "C2K_UART0_TXD"),
+		MTK_FUNCTION(4, "C2K_TCK"),
+		MTK_FUNCTION(5, "ANT_SEL7"),
+		MTK_FUNCTION(6, "TDD_TXD"),
+		MTK_FUNCTION(7, "DM_OTCK")
+	),
+	MTK_PIN(
+		200, "GPIO200",
+		MTK_EINT_FUNCTION(0, 200),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO200"),
+		MTK_FUNCTION(1, "MSDC2_DAT0"),
+		MTK_FUNCTION(2, "ANT_SEL6"),
+		MTK_FUNCTION(3, "GPS_FRAME_SYNC"),
+		MTK_FUNCTION(4, "C2K_TDI"),
+		MTK_FUNCTION(5, "UTXD0"),
+		MTK_FUNCTION(7, "DM_OTDI")
+	),
+	MTK_PIN(
+		201, "GPIO201",
+		MTK_EINT_FUNCTION(0, 201),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO201"),
+		MTK_FUNCTION(1, "MSDC2_DAT1"),
+		MTK_FUNCTION(2, "ANT_SEL3"),
+		MTK_FUNCTION(3, "PWM0"),
+		MTK_FUNCTION(4, "C2K_TDO"),
+		MTK_FUNCTION(5, "URXD0"),
+		MTK_FUNCTION(7, "DM_OTDO")
+	),
+	MTK_PIN(
+		202, "GPIO202",
+		MTK_EINT_FUNCTION(0, 202),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO202"),
+		MTK_FUNCTION(1, "MSDC2_DAT2"),
+		MTK_FUNCTION(2, "ANT_SEL4"),
+		MTK_FUNCTION(3, "SDA2"),
+		MTK_FUNCTION(4, "C2K_NTRST"),
+		MTK_FUNCTION(5, "UTXD1"),
+		MTK_FUNCTION(6, "KCOL3"),
+		MTK_FUNCTION(7, "DM_JTINTP")
+	),
+	MTK_PIN(
+		203, "GPIO203",
+		MTK_EINT_FUNCTION(0, 203),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO203"),
+		MTK_FUNCTION(1, "MSDC2_DAT3"),
+		MTK_FUNCTION(2, "ANT_SEL5"),
+		MTK_FUNCTION(3, "SCL2"),
+		MTK_FUNCTION(4, "C2K_RTCK"),
+		MTK_FUNCTION(5, "URXD1"),
+		MTK_FUNCTION(6, "KCOL6")
+	),
+	MTK_PIN(
+		204, "GPIO204",
+		MTK_EINT_FUNCTION(0, 204),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		205, "GPIO205",
+		MTK_EINT_FUNCTION(0, 205),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		206, "GPIO206",
+		MTK_EINT_FUNCTION(0, 206),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		207, "GPIO207",
+		MTK_EINT_FUNCTION(0, 207),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		208, "GPIO208",
+		MTK_EINT_FUNCTION(0, 208),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		209, "GPIO209",
+		MTK_EINT_FUNCTION(0, 209),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		210, "GPIO210",
+		MTK_EINT_FUNCTION(0, 210),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		211, "GPIO211",
+		MTK_EINT_FUNCTION(0, 211),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		212, "GPIO212",
+		MTK_EINT_FUNCTION(0, 212),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+};
+
+static const struct mtk_pin_desc mtk_pins_mt6735m[] = {
+	MTK_PIN(
+		0, "GPIO0",
+		MTK_EINT_FUNCTION(0, 0),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO0"),
+		MTK_FUNCTION(1, "IDDIG"),
+		MTK_FUNCTION(2, "DPI_D4"),
+		MTK_FUNCTION(3, "CLKM4"),
+		MTK_FUNCTION(4, "EXT_FRAME_SYNC"),
+		MTK_FUNCTION(5, "PWM3"),
+		MTK_FUNCTION(6, "KCOL2"),
+		MTK_FUNCTION(7, "C2K_ARM_EINT0")
+	),
+	MTK_PIN(
+		1, "GPIO1",
+		MTK_EINT_FUNCTION(0, 1),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO1"),
+		MTK_FUNCTION(1, "PWM2"),
+		MTK_FUNCTION(2, "DPI_D5"),
+		MTK_FUNCTION(3, "MD_EINT0"),
+		MTK_FUNCTION(4, "TDD_TDO"),
+		MTK_FUNCTION(5, "CONN_MCU_TDO"),
+		MTK_FUNCTION(6, "PTA_RXD"),
+		MTK_FUNCTION(7, "C2K_ARM_EINT1")
+	),
+	MTK_PIN(
+		2, "GPIO2",
+		MTK_EINT_FUNCTION(0, 2),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO2"),
+		MTK_FUNCTION(1, "CLKM0"),
+		MTK_FUNCTION(2, "DPI_D6"),
+		MTK_FUNCTION(3, "MD_EINT0"),
+		MTK_FUNCTION(4, "USB_DRVVBUS"),
+		MTK_FUNCTION(5, "CONN_MCU_DBGACK_N"),
+		MTK_FUNCTION(6, "PTA_TXD"),
+		MTK_FUNCTION(7, "C2K_ARM_EINT2")
+	),
+	MTK_PIN(
+		3, "GPIO3",
+		MTK_EINT_FUNCTION(0, 3),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO3"),
+		MTK_FUNCTION(1, "CLKM1"),
+		MTK_FUNCTION(2, "DPI_D7"),
+		MTK_FUNCTION(3, "SPI_MIB"),
+		MTK_FUNCTION(4, "MD_EINT0"),
+		MTK_FUNCTION(5, "CONN_MCU_DBGI_N"),
+		MTK_FUNCTION(6, "CONN_MCU_AICE_TMSC"),
+		MTK_FUNCTION(7, "C2K_ARM_EINT3")
+	),
+	MTK_PIN(
+		4, "GPIO4",
+		MTK_EINT_FUNCTION(0, 4),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO4"),
+		MTK_FUNCTION(1, "CLKM2"),
+		MTK_FUNCTION(2, "DPI_D8"),
+		MTK_FUNCTION(3, "SPI_MOB"),
+		MTK_FUNCTION(4, "TDD_TCK"),
+		MTK_FUNCTION(5, "CONN_MCU_TCK_0"),
+		MTK_FUNCTION(6, "CONN_MCU_AICE_TCKC"),
+		MTK_FUNCTION(7, "C2K_DM_EINT0")
+	),
+	MTK_PIN(
+		5, "GPIO5",
+		MTK_EINT_FUNCTION(0, 5),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO5"),
+		MTK_FUNCTION(1, "UCTS2"),
+		MTK_FUNCTION(2, "DPI_D9"),
+		MTK_FUNCTION(3, "SPI_CSB"),
+		MTK_FUNCTION(4, "TDD_TDI"),
+		MTK_FUNCTION(5, "CONN_MCU_TDI"),
+		MTK_FUNCTION(6, "I2S1_DO"),
+		MTK_FUNCTION(7, "MD_URXD")
+	),
+	MTK_PIN(
+		6, "GPIO6",
+		MTK_EINT_FUNCTION(0, 6),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO6"),
+		MTK_FUNCTION(1, "URTS2"),
+		MTK_FUNCTION(2, "DPI_D10"),
+		MTK_FUNCTION(3, "SPI_CKB"),
+		MTK_FUNCTION(4, "TDD_TRSTN"),
+		MTK_FUNCTION(5, "CONN_MCU_TRST_B"),
+		MTK_FUNCTION(6, "I2S1_LRCK"),
+		MTK_FUNCTION(7, "MD_UTXD")
+	),
+	MTK_PIN(
+		7, "GPIO7",
+		MTK_EINT_FUNCTION(0, 7),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO7"),
+		MTK_FUNCTION(1, "UCTS3"),
+		MTK_FUNCTION(2, "DPI_D11"),
+		MTK_FUNCTION(3, "SDA1"),
+		MTK_FUNCTION(4, "TDD_TMS"),
+		MTK_FUNCTION(5, "CONN_MCU_TMS"),
+		MTK_FUNCTION(6, "I2S1_BCK"),
+		MTK_FUNCTION(7, "TDD_TXD")
+	),
+	MTK_PIN(
+		8, "GPIO8",
+		MTK_EINT_FUNCTION(0, 8),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO8"),
+		MTK_FUNCTION(1, "URTS3"),
+		MTK_FUNCTION(2, "C2K_UIM0_HOT_PLUG_IN"),
+		MTK_FUNCTION(3, "SCL1"),
+		MTK_FUNCTION(4, "PCM1_DO1"),
+		MTK_FUNCTION(5, "MD_EINT1"),
+		MTK_FUNCTION(6, "KCOL4"),
+		MTK_FUNCTION(7, "UTXD0")
+	),
+	MTK_PIN(
+		9, "GPIO9",
+		MTK_EINT_FUNCTION(0, 9),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO9"),
+		MTK_FUNCTION(1, "C2K_UIM1_HOT_PLUG_IN"),
+		MTK_FUNCTION(2, "PCM1_DO0"),
+		MTK_FUNCTION(3, "I2S3_MCK"),
+		MTK_FUNCTION(4, "MD_EINT2"),
+		MTK_FUNCTION(5, "CLKM2"),
+		MTK_FUNCTION(6, "I2S1_MCK"),
+		MTK_FUNCTION(7, "DBG_MON_A29")
+	),
+	MTK_PIN(
+		10, "GPIO10",
+		MTK_EINT_FUNCTION(0, 10),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO10"),
+		MTK_FUNCTION(1, "PWM1"),
+		MTK_FUNCTION(2, "CLKM1"),
+		MTK_FUNCTION(3, "KROW2"),
+		MTK_FUNCTION(4, "MD_EINT0"),
+		MTK_FUNCTION(5, "I2S1_MCK"),
+		MTK_FUNCTION(6, "SDA3"),
+		MTK_FUNCTION(7, "DBG_MON_A30")
+	),
+	MTK_PIN(
+		11, "GPIO11",
+		MTK_EINT_FUNCTION(0, 11),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO11"),
+		MTK_FUNCTION(1, "MD_EINT1"),
+		MTK_FUNCTION(2, "IRTX_OUT"),
+		MTK_FUNCTION(3, "C2K_UIM0_HOT_PLUG_IN"),
+		MTK_FUNCTION(4, "CLKM0"),
+		MTK_FUNCTION(5, "I2S2_MCK"),
+		MTK_FUNCTION(6, "SCL3"),
+		MTK_FUNCTION(7, "URXD0")
+	),
+	MTK_PIN(
+		12, "GPIO12",
+		MTK_EINT_FUNCTION(0, 12),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO12"),
+		MTK_FUNCTION(1, "I2S0_MCK"),
+		MTK_FUNCTION(2, "C2K_UIM1_HOT_PLUG_IN"),
+		MTK_FUNCTION(3, "KCOL2"),
+		MTK_FUNCTION(4, "MD_EINT2"),
+		MTK_FUNCTION(5, "IRTX_OUT"),
+		MTK_FUNCTION(6, "SRCLKENAI2"),
+		MTK_FUNCTION(7, "PCM1_DO1")
+	),
+	MTK_PIN(
+		13, "GPIO13",
+		MTK_EINT_FUNCTION(0, 13),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO13"),
+		MTK_FUNCTION(1, "WB_CTRL0"),
+		MTK_FUNCTION(3, "C2K_ARM_EINT0"),
+		MTK_FUNCTION(7, "DBG_MON_A0")
+	),
+	MTK_PIN(
+		14, "GPIO14",
+		MTK_EINT_FUNCTION(0, 14),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO14"),
+		MTK_FUNCTION(1, "WB_CTRL1"),
+		MTK_FUNCTION(3, "C2K_ARM_EINT1"),
+		MTK_FUNCTION(7, "DBG_MON_A1")
+	),
+	MTK_PIN(
+		15, "GPIO15",
+		MTK_EINT_FUNCTION(0, 15),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO15"),
+		MTK_FUNCTION(1, "WB_CTRL2"),
+		MTK_FUNCTION(3, "C2K_ARM_EINT2"),
+		MTK_FUNCTION(7, "DBG_MON_A2")
+	),
+	MTK_PIN(
+		16, "GPIO16",
+		MTK_EINT_FUNCTION(0, 16),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO16"),
+		MTK_FUNCTION(1, "WB_CTRL3"),
+		MTK_FUNCTION(3, "C2K_ARM_EINT3"),
+		MTK_FUNCTION(7, "DBG_MON_A3")
+	),
+	MTK_PIN(
+		17, "GPIO17",
+		MTK_EINT_FUNCTION(0, 17),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO17"),
+		MTK_FUNCTION(1, "WB_CTRL4"),
+		MTK_FUNCTION(3, "C2K_DM_EINT0"),
+		MTK_FUNCTION(4, "WATCHDOG"),
+		MTK_FUNCTION(7, "DBG_MON_A4")
+	),
+	MTK_PIN(
+		18, "GPIO18",
+		MTK_EINT_FUNCTION(0, 18),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO18"),
+		MTK_FUNCTION(1, "WB_CTRL5"),
+		MTK_FUNCTION(3, "C2K_DM_EINT1"),
+		MTK_FUNCTION(7, "DBG_MON_A5")
+	),
+	MTK_PIN(
+		19, "GPIO19",
+		MTK_EINT_FUNCTION(0, 19),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO19"),
+		MTK_FUNCTION(1, "ANT_SEL0"),
+		MTK_FUNCTION(2, "IRTX_OUT"),
+		MTK_FUNCTION(3, "IRDA_TX"),
+		MTK_FUNCTION(4, "C2K_UART0_TXD"),
+		MTK_FUNCTION(5, "GPS_FRAME_SYNC"),
+		MTK_FUNCTION(6, "LTE_UTXD"),
+		MTK_FUNCTION(7, "DBG_MON_A6")
+	),
+	MTK_PIN(
+		20, "GPIO20",
+		MTK_EINT_FUNCTION(0, 20),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO20"),
+		MTK_FUNCTION(1, "ANT_SEL1"),
+		MTK_FUNCTION(2, "C2K_UIM1_HOT_PLUG_IN"),
+		MTK_FUNCTION(3, "IRDA_RX"),
+		MTK_FUNCTION(4, "C2K_UART0_RXD"),
+		MTK_FUNCTION(5, "MD_EINT2"),
+		MTK_FUNCTION(6, "LTE_URXD"),
+		MTK_FUNCTION(7, "DBG_MON_A7")
+	),
+	MTK_PIN(
+		21, "GPIO21",
+		MTK_EINT_FUNCTION(0, 21),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO21"),
+		MTK_FUNCTION(1, "ANT_SEL2"),
+		MTK_FUNCTION(2, "PWM2"),
+		MTK_FUNCTION(3, "IRDA_PDN"),
+		MTK_FUNCTION(4, "CORESONIC_SWCK"),
+		MTK_FUNCTION(5, "MD_EINT1"),
+		MTK_FUNCTION(6, "C2K_UIM0_HOT_PLUG_IN"),
+		MTK_FUNCTION(7, "DBG_MON_A8")
+	),
+	MTK_PIN(
+		22, "GPIO22",
+		MTK_EINT_FUNCTION(0, 22),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO22"),
+		MTK_FUNCTION(1, "RDN0")
+	),
+	MTK_PIN(
+		23, "GPIO23",
+		MTK_EINT_FUNCTION(0, 23),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO23"),
+		MTK_FUNCTION(1, "RDP0")
+	),
+	MTK_PIN(
+		24, "GPIO24",
+		MTK_EINT_FUNCTION(0, 24),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO24"),
+		MTK_FUNCTION(1, "RDN1")
+	),
+	MTK_PIN(
+		25, "GPIO25",
+		MTK_EINT_FUNCTION(0, 25),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO25"),
+		MTK_FUNCTION(1, "RDP1")
+	),
+	MTK_PIN(
+		26, "GPIO26",
+		MTK_EINT_FUNCTION(0, 26),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO26"),
+		MTK_FUNCTION(1, "RCN")
+	),
+	MTK_PIN(
+		27, "GPIO27",
+		MTK_EINT_FUNCTION(0, 27),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO27"),
+		MTK_FUNCTION(1, "RCP")
+	),
+	MTK_PIN(
+		28, "GPIO28",
+		MTK_EINT_FUNCTION(0, 28),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO28"),
+		MTK_FUNCTION(1, "RDN2")
+	),
+	MTK_PIN(
+		29, "GPIO29",
+		MTK_EINT_FUNCTION(0, 29),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO29"),
+		MTK_FUNCTION(1, "RDP2")
+	),
+	MTK_PIN(
+		30, "GPIO30",
+		MTK_EINT_FUNCTION(0, 30),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO30"),
+		MTK_FUNCTION(1, "RDN3")
+	),
+	MTK_PIN(
+		31, "GPIO31",
+		MTK_EINT_FUNCTION(0, 31),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO31"),
+		MTK_FUNCTION(1, "RDP3")
+	),
+	MTK_PIN(
+		32, "GPIO32",
+		MTK_EINT_FUNCTION(0, 32),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO32"),
+		MTK_FUNCTION(1, "RDN0_A"),
+		MTK_FUNCTION(2, "CMHSYNC"),
+		MTK_FUNCTION(3, "CMCSD0")
+	),
+	MTK_PIN(
+		33, "GPIO33",
+		MTK_EINT_FUNCTION(0, 33),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO33"),
+		MTK_FUNCTION(1, "RDP0_A"),
+		MTK_FUNCTION(2, "CMVSYNC"),
+		MTK_FUNCTION(3, "CMCSD1")
+	),
+	MTK_PIN(
+		34, "GPIO34",
+		MTK_EINT_FUNCTION(0, 34),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO34"),
+		MTK_FUNCTION(1, "RDN1_A"),
+		MTK_FUNCTION(2, "CMDAT9"),
+		MTK_FUNCTION(3, "CMCSD2")
+	),
+	MTK_PIN(
+		35, "GPIO35",
+		MTK_EINT_FUNCTION(0, 35),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO35"),
+		MTK_FUNCTION(1, "RDP1_A"),
+		MTK_FUNCTION(2, "CMDAT8"),
+		MTK_FUNCTION(3, "CMCSD3")
+	),
+	MTK_PIN(
+		36, "GPIO36",
+		MTK_EINT_FUNCTION(0, 36),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO36"),
+		MTK_FUNCTION(1, "RCN_A"),
+		MTK_FUNCTION(2, "CMDAT7")
+	),
+	MTK_PIN(
+		37, "GPIO37",
+		MTK_EINT_FUNCTION(0, 37),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO37"),
+		MTK_FUNCTION(1, "RCP_A"),
+		MTK_FUNCTION(2, "CMDAT6")
+	),
+	MTK_PIN(
+		38, "GPIO38",
+		MTK_EINT_FUNCTION(0, 38),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO38"),
+		MTK_FUNCTION(1, "RDN2_A"),
+		MTK_FUNCTION(2, "CMDAT5")
+	),
+	MTK_PIN(
+		39, "GPIO39",
+		MTK_EINT_FUNCTION(0, 39),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO39"),
+		MTK_FUNCTION(1, "RDP2_A"),
+		MTK_FUNCTION(2, "CMDAT4")
+	),
+	MTK_PIN(
+		40, "GPIO40",
+		MTK_EINT_FUNCTION(0, 40),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO40"),
+		MTK_FUNCTION(1, "RDN3_A"),
+		MTK_FUNCTION(2, "CMDAT3")
+	),
+	MTK_PIN(
+		41, "GPIO41",
+		MTK_EINT_FUNCTION(0, 41),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO41"),
+		MTK_FUNCTION(1, "RDP3_A"),
+		MTK_FUNCTION(2, "CMDAT2")
+	),
+	MTK_PIN(
+		42, "GPIO42",
+		MTK_EINT_FUNCTION(0, 42),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO42"),
+		MTK_FUNCTION(1, "CMDAT0"),
+		MTK_FUNCTION(2, "CMCSD0"),
+		MTK_FUNCTION(3, "CMMCLK1"),
+		MTK_FUNCTION(5, "ANT_SEL5"),
+		MTK_FUNCTION(6, "CLKM5"),
+		MTK_FUNCTION(7, "DBG_MON_A9")
+	),
+	MTK_PIN(
+		43, "GPIO43",
+		MTK_EINT_FUNCTION(0, 43),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO43"),
+		MTK_FUNCTION(1, "CMDAT1"),
+		MTK_FUNCTION(2, "CMCSD1"),
+		MTK_FUNCTION(3, "CMFLASH"),
+		MTK_FUNCTION(4, "MD_EINT0"),
+		MTK_FUNCTION(5, "CMMCLK1"),
+		MTK_FUNCTION(6, "CLKM4"),
+		MTK_FUNCTION(7, "DBG_MON_A10")
+	),
+	MTK_PIN(
+		44, "GPIO44",
+		MTK_EINT_FUNCTION(0, 44),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO44"),
+		MTK_FUNCTION(1, "CMPCLK"),
+		MTK_FUNCTION(2, "CMCSK"),
+		MTK_FUNCTION(3, "CMCSD2"),
+		MTK_FUNCTION(4, "KCOL3"),
+		MTK_FUNCTION(5, "SRCLKENAI2"),
+		MTK_FUNCTION(6, "PWM0"),
+		MTK_FUNCTION(7, "DBG_MON_A11")
+	),
+	MTK_PIN(
+		45, "GPIO45",
+		MTK_EINT_FUNCTION(0, 45),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO45"),
+		MTK_FUNCTION(1, "CMMCLK0"),
+		MTK_FUNCTION(7, "DBG_MON_A12")
+	),
+	MTK_PIN(
+		46, "GPIO46",
+		MTK_EINT_FUNCTION(0, 46),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO46"),
+		MTK_FUNCTION(1, "CMMCLK1"),
+		MTK_FUNCTION(2, "IDDIG"),
+		MTK_FUNCTION(3, "LTE_MD32_JTAG_TRST"),
+		MTK_FUNCTION(4, "TDD_TRSTN"),
+		MTK_FUNCTION(5, "DM_JTINTP"),
+		MTK_FUNCTION(6, "KCOL6"),
+		MTK_FUNCTION(7, "DBG_MON_A13")
+	),
+	MTK_PIN(
+		47, "GPIO47",
+		MTK_EINT_FUNCTION(0, 47),
+		DRV_FIXED,
+		MTK_FUNCTION(0, "GPIO47"),
+		MTK_FUNCTION(1, "SDA0")
+	),
+	MTK_PIN(
+		48, "GPIO48",
+		MTK_EINT_FUNCTION(0, 48),
+		DRV_FIXED,
+		MTK_FUNCTION(0, "GPIO48"),
+		MTK_FUNCTION(1, "SCL0")
+	),
+	MTK_PIN(
+		49, "GPIO49",
+		MTK_EINT_FUNCTION(0, 49),
+		DRV_FIXED,
+		MTK_FUNCTION(0, "GPIO49"),
+		MTK_FUNCTION(1, "SDA1")
+	),
+	MTK_PIN(
+		50, "GPIO50",
+		MTK_EINT_FUNCTION(0, 50),
+		DRV_FIXED,
+		MTK_FUNCTION(0, "GPIO50"),
+		MTK_FUNCTION(1, "SCL1")
+	),
+	MTK_PIN(
+		51, "GPIO51",
+		MTK_EINT_FUNCTION(0, 51),
+		DRV_FIXED,
+		MTK_FUNCTION(0, "GPIO51"),
+		MTK_FUNCTION(1, "SDA2")
+	),
+	MTK_PIN(
+		52, "GPIO52",
+		MTK_EINT_FUNCTION(0, 52),
+		DRV_FIXED,
+		MTK_FUNCTION(0, "GPIO52"),
+		MTK_FUNCTION(1, "SCL2")
+	),
+	MTK_PIN(
+		53, "GPIO53",
+		MTK_EINT_FUNCTION(0, 53),
+		DRV_FIXED,
+		MTK_FUNCTION(0, "GPIO53"),
+		MTK_FUNCTION(1, "SDA3"),
+		MTK_FUNCTION(3, "IDDIG"),
+		MTK_FUNCTION(5, "MD_EINT2"),
+		MTK_FUNCTION(6, "C2K_UIM1_HOT_PLUG_IN")
+	),
+	MTK_PIN(
+		54, "GPIO54",
+		MTK_EINT_FUNCTION(0, 54),
+		DRV_FIXED,
+		MTK_FUNCTION(0, "GPIO54"),
+		MTK_FUNCTION(1, "SCL3"),
+		MTK_FUNCTION(3, "IDDIG"),
+		MTK_FUNCTION(5, "MD_EINT1"),
+		MTK_FUNCTION(6, "C2K_UIM0_HOT_PLUG_IN")
+	),
+	MTK_PIN(
+		55, "GPIO55",
+		MTK_EINT_FUNCTION(0, 55),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO55"),
+		MTK_FUNCTION(1, "SRCLKENAI0"),
+		MTK_FUNCTION(2, "PWM2"),
+		MTK_FUNCTION(3, "CLKM5"),
+		MTK_FUNCTION(4, "CORESONIC_SWD"),
+		MTK_FUNCTION(5, "ANT_SEL6"),
+		MTK_FUNCTION(6, "KROW5"),
+		MTK_FUNCTION(7, "DISP_PWM")
+	),
+	MTK_PIN(
+		56, "GPIO56",
+		MTK_EINT_FUNCTION(0, 56),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO56"),
+		MTK_FUNCTION(1, "SRCLKENA1")
+	),
+	MTK_PIN(
+		57, "GPIO57",
+		MTK_EINT_FUNCTION(0, 57),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO57"),
+		MTK_FUNCTION(1, "URXD2"),
+		MTK_FUNCTION(2, "DPI_HSYNC0"),
+		MTK_FUNCTION(3, "UTXD2"),
+		MTK_FUNCTION(4, "MD_URXD"),
+		MTK_FUNCTION(5, "SRCLKENAI1"),
+		MTK_FUNCTION(6, "KROW4"),
+		MTK_FUNCTION(7, "DBG_MON_A14")
+	),
+	MTK_PIN(
+		58, "GPIO58",
+		MTK_EINT_FUNCTION(0, 58),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO58"),
+		MTK_FUNCTION(1, "UTXD2"),
+		MTK_FUNCTION(2, "DPI_VSYNC0"),
+		MTK_FUNCTION(3, "URXD2"),
+		MTK_FUNCTION(4, "MD_UTXD"),
+		MTK_FUNCTION(5, "TDD_TXD"),
+		MTK_FUNCTION(6, "KROW5"),
+		MTK_FUNCTION(7, "DBG_MON_A15")
+	),
+	MTK_PIN(
+		59, "GPIO59",
+		MTK_EINT_FUNCTION(0, 59),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO59"),
+		MTK_FUNCTION(1, "URXD3"),
+		MTK_FUNCTION(2, "DPI_CK0"),
+		MTK_FUNCTION(3, "UTXD3"),
+		MTK_FUNCTION(4, "UCTS2"),
+		MTK_FUNCTION(5, "PWM3"),
+		MTK_FUNCTION(6, "KROW6"),
+		MTK_FUNCTION(7, "DBG_MON_A16")
+	),
+	MTK_PIN(
+		60, "GPIO60",
+		MTK_EINT_FUNCTION(0, 60),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO60"),
+		MTK_FUNCTION(1, "UTXD3"),
+		MTK_FUNCTION(2, "DPI_DE0"),
+		MTK_FUNCTION(3, "URXD3"),
+		MTK_FUNCTION(4, "URTS2"),
+		MTK_FUNCTION(5, "PWM4"),
+		MTK_FUNCTION(6, "KROW7"),
+		MTK_FUNCTION(7, "DBG_MON_A17")
+	),
+	MTK_PIN(
+		61, "GPIO61",
+		MTK_EINT_FUNCTION(0, 61),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO61"),
+		MTK_FUNCTION(1, "PCM1_CLK"),
+		MTK_FUNCTION(2, "DPI_D0"),
+		MTK_FUNCTION(3, "I2S0_BCK"),
+		MTK_FUNCTION(4, "KROW4"),
+		MTK_FUNCTION(5, "ANT_SEL3"),
+		MTK_FUNCTION(6, "IRTX_OUT"),
+		MTK_FUNCTION(7, "DBG_MON_A18")
+	),
+	MTK_PIN(
+		62, "GPIO62",
+		MTK_EINT_FUNCTION(0, 62),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO62"),
+		MTK_FUNCTION(1, "PCM1_SYNC"),
+		MTK_FUNCTION(2, "DPI_D1"),
+		MTK_FUNCTION(3, "I2S0_LRCK"),
+		MTK_FUNCTION(4, "KCOL7"),
+		MTK_FUNCTION(5, "CLKM3"),
+		MTK_FUNCTION(6, "CMFLASH"),
+		MTK_FUNCTION(7, "DBG_MON_A19")
+	),
+	MTK_PIN(
+		63, "GPIO63",
+		MTK_EINT_FUNCTION(0, 63),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO63"),
+		MTK_FUNCTION(1, "PCM1_DI"),
+		MTK_FUNCTION(2, "DPI_D2"),
+		MTK_FUNCTION(3, "I2S0_DI"),
+		MTK_FUNCTION(4, "PCM1_DO0"),
+		MTK_FUNCTION(5, "CLKM5"),
+		MTK_FUNCTION(6, "KROW3"),
+		MTK_FUNCTION(7, "DBG_MON_A20")
+	),
+	MTK_PIN(
+		64, "GPIO64",
+		MTK_EINT_FUNCTION(0, 64),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO64"),
+		MTK_FUNCTION(1, "PCM1_DO0"),
+		MTK_FUNCTION(2, "DPI_D3"),
+		MTK_FUNCTION(3, "I2S0_MCK"),
+		MTK_FUNCTION(4, "PCM1_DI"),
+		MTK_FUNCTION(5, "SRCLKENAI2"),
+		MTK_FUNCTION(6, "KCOL5"),
+		MTK_FUNCTION(7, "DBG_MON_A21")
+	),
+	MTK_PIN(
+		65, "GPIO65",
+		MTK_EINT_FUNCTION(0, 65),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO65"),
+		MTK_FUNCTION(1, "SPI_CSA"),
+		MTK_FUNCTION(2, "EXT_FRAME_SYNC"),
+		MTK_FUNCTION(3, "I2S3_MCK"),
+		MTK_FUNCTION(4, "KROW2"),
+		MTK_FUNCTION(5, "GPS_FRAME_SYNC"),
+		MTK_FUNCTION(6, "PTA_RXD"),
+		MTK_FUNCTION(7, "DBG_MON_A22")
+	),
+	MTK_PIN(
+		66, "GPIO66",
+		MTK_EINT_FUNCTION(0, 66),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO66"),
+		MTK_FUNCTION(1, "SPI_CKA"),
+		MTK_FUNCTION(2, "USB_DRVVBUS"),
+		MTK_FUNCTION(3, "I2S3_BCK"),
+		MTK_FUNCTION(4, "KCOL2"),
+		MTK_FUNCTION(6, "PTA_TXD"),
+		MTK_FUNCTION(7, "DBG_MON_A23")
+	),
+	MTK_PIN(
+		67, "GPIO67",
+		MTK_EINT_FUNCTION(0, 67),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO67"),
+		MTK_FUNCTION(1, "SPI_MIA"),
+		MTK_FUNCTION(2, "SPI_MOA"),
+		MTK_FUNCTION(3, "I2S3_DO"),
+		MTK_FUNCTION(4, "PTA_RXD"),
+		MTK_FUNCTION(5, "IDDIG"),
+		MTK_FUNCTION(6, "UCTS1"),
+		MTK_FUNCTION(7, "DBG_MON_A24")
+	),
+	MTK_PIN(
+		68, "GPIO68",
+		MTK_EINT_FUNCTION(0, 68),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO68"),
+		MTK_FUNCTION(1, "SPI_MOA"),
+		MTK_FUNCTION(2, "SPI_MIA"),
+		MTK_FUNCTION(3, "I2S3_LRCK"),
+		MTK_FUNCTION(4, "PTA_TXD"),
+		MTK_FUNCTION(5, "ANT_SEL4"),
+		MTK_FUNCTION(6, "URTS1"),
+		MTK_FUNCTION(7, "DBG_MON_A25")
+	),
+	MTK_PIN(
+		69, "GPIO69",
+		MTK_EINT_FUNCTION(0, 69),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO69"),
+		MTK_FUNCTION(1, "DISP_PWM"),
+		MTK_FUNCTION(2, "PWM1"),
+		MTK_FUNCTION(3, "LTE_MD32_JTAG_TRST"),
+		MTK_FUNCTION(4, "TDD_TRSTN"),
+		MTK_FUNCTION(5, "ANT_SEL7"),
+		MTK_FUNCTION(6, "DM_JTINTP")
+	),
+	MTK_PIN(
+		70, "GPIO70",
+		MTK_EINT_FUNCTION(0, 70),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO70"),
+		MTK_FUNCTION(1, "JTMS"),
+		MTK_FUNCTION(2, "CONN_MCU_TMS"),
+		MTK_FUNCTION(3, "LTE_MD32_JTAG_TMS"),
+		MTK_FUNCTION(4, "TDD_TMS"),
+		MTK_FUNCTION(5, "CORESONIC_SWD"),
+		MTK_FUNCTION(6, "DM_OTMS"),
+		MTK_FUNCTION(7, "DFD_TMS")
+	),
+	MTK_PIN(
+		71, "GPIO71",
+		MTK_EINT_FUNCTION(0, 71),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO71"),
+		MTK_FUNCTION(1, "JTCK"),
+		MTK_FUNCTION(2, "CONN_MCU_TCK_1"),
+		MTK_FUNCTION(3, "LTE_MD32_JTAG_TCK"),
+		MTK_FUNCTION(4, "TDD_TCK"),
+		MTK_FUNCTION(5, "CORESONIC_SWCK"),
+		MTK_FUNCTION(6, "DM_OTCK"),
+		MTK_FUNCTION(7, "DFD_TCK_XI")
+	),
+	MTK_PIN(
+		72, "GPIO72",
+		MTK_EINT_FUNCTION(0, 72),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO72"),
+		MTK_FUNCTION(1, "JTDI"),
+		MTK_FUNCTION(2, "CONN_MCU_TDI"),
+		MTK_FUNCTION(3, "LTE_MD32_JTAG_TDI"),
+		MTK_FUNCTION(4, "TDD_TDI"),
+		MTK_FUNCTION(6, "DM_OTDI"),
+		MTK_FUNCTION(7, "DFD_TDI")
+	),
+	MTK_PIN(
+		73, "GPIO73",
+		MTK_EINT_FUNCTION(0, 73),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO73"),
+		MTK_FUNCTION(1, "JTDO"),
+		MTK_FUNCTION(2, "CONN_MCU_TDO"),
+		MTK_FUNCTION(3, "LTE_MD32_JTAG_TDO"),
+		MTK_FUNCTION(4, "TDD_TDO"),
+		MTK_FUNCTION(6, "DM_OTDO"),
+		MTK_FUNCTION(7, "DFD_TDO")
+	),
+	MTK_PIN(
+		74, "GPIO74",
+		MTK_EINT_FUNCTION(0, 74),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO74"),
+		MTK_FUNCTION(1, "URXD0"),
+		MTK_FUNCTION(2, "UTXD0"),
+		MTK_FUNCTION(3, "MD_URXD"),
+		MTK_FUNCTION(4, "SDA3"),
+		MTK_FUNCTION(5, "C2K_UART0_RXD"),
+		MTK_FUNCTION(6, "LTE_URXD"),
+		MTK_FUNCTION(7, "AUXIF_ST")
+	),
+	MTK_PIN(
+		75, "GPIO75",
+		MTK_EINT_FUNCTION(0, 75),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO75"),
+		MTK_FUNCTION(1, "UTXD0"),
+		MTK_FUNCTION(2, "URXD0"),
+		MTK_FUNCTION(3, "MD_UTXD"),
+		MTK_FUNCTION(4, "TDD_TXD"),
+		MTK_FUNCTION(5, "C2K_UART0_TXD"),
+		MTK_FUNCTION(6, "LTE_UTXD")
+	),
+	MTK_PIN(
+		76, "GPIO76",
+		MTK_EINT_FUNCTION(0, 76),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO76"),
+		MTK_FUNCTION(1, "URXD1"),
+		MTK_FUNCTION(2, "UTXD1"),
+		MTK_FUNCTION(3, "MD_URXD"),
+		MTK_FUNCTION(4, "SCL3"),
+		MTK_FUNCTION(5, "LTE_URXD"),
+		MTK_FUNCTION(6, "C2K_UART0_RXD"),
+		MTK_FUNCTION(7, "AUXIF_CLK")
+	),
+	MTK_PIN(
+		77, "GPIO77",
+		MTK_EINT_FUNCTION(0, 77),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO77"),
+		MTK_FUNCTION(1, "UTXD1"),
+		MTK_FUNCTION(2, "URXD1"),
+		MTK_FUNCTION(3, "MD_UTXD"),
+		MTK_FUNCTION(4, "TDD_TXD"),
+		MTK_FUNCTION(5, "LTE_UTXD"),
+		MTK_FUNCTION(6, "C2K_UART0_TXD")
+	),
+	MTK_PIN(
+		78, "GPIO78",
+		MTK_EINT_FUNCTION(0, 78),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO78"),
+		MTK_FUNCTION(1, "I2S0_DI"),
+		MTK_FUNCTION(2, "PCM1_DI"),
+		MTK_FUNCTION(3, "I2S3_DO"),
+		MTK_FUNCTION(4, "I2S1_DO"),
+		MTK_FUNCTION(5, "PWM0"),
+		MTK_FUNCTION(6, "I2S2_DI"),
+		MTK_FUNCTION(7, "DBG_MON_A26")
+	),
+	MTK_PIN(
+		79, "GPIO79",
+		MTK_EINT_FUNCTION(0, 79),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO79"),
+		MTK_FUNCTION(1, "I2S0_LRCK"),
+		MTK_FUNCTION(2, "PCM1_SYNC"),
+		MTK_FUNCTION(3, "I2S3_LRCK"),
+		MTK_FUNCTION(4, "I2S1_LRCK"),
+		MTK_FUNCTION(5, "PWM3"),
+		MTK_FUNCTION(6, "I2S2_LRCK"),
+		MTK_FUNCTION(7, "DBG_MON_A27")
+	),
+	MTK_PIN(
+		80, "GPIO80",
+		MTK_EINT_FUNCTION(0, 80),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO80"),
+		MTK_FUNCTION(1, "I2S0_BCK"),
+		MTK_FUNCTION(2, "PCM1_CLK[1]"),
+		MTK_FUNCTION(3, "I2S3_BCK"),
+		MTK_FUNCTION(4, "I2S1_BCK"),
+		MTK_FUNCTION(5, "PWM4"),
+		MTK_FUNCTION(6, "I2S2_BCK"),
+		MTK_FUNCTION(7, "DBG_MON_A28")
+	),
+	MTK_PIN(
+		81, "GPIO81",
+		MTK_EINT_FUNCTION(0, 81),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO81"),
+		MTK_FUNCTION(1, "KROW0"),
+		MTK_FUNCTION(3, "CONN_MCU_DBGI_N"),
+		MTK_FUNCTION(4, "CORESONIC_SWCK"),
+		MTK_FUNCTION(5, "C2K_TCK"),
+		MTK_FUNCTION(7, "C2K_DM_EINT1")
+	),
+	MTK_PIN(
+		82, "GPIO82",
+		MTK_EINT_FUNCTION(0, 82),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO82"),
+		MTK_FUNCTION(1, "KROW1"),
+		MTK_FUNCTION(3, "CONN_MCU_TRST_B"),
+		MTK_FUNCTION(4, "CORESONIC_SWD"),
+		MTK_FUNCTION(5, "C2K_NTRST"),
+		MTK_FUNCTION(6, "USB_DRVVBUS"),
+		MTK_FUNCTION(7, "C2K_DM_EINT2")
+	),
+	MTK_PIN(
+		83, "GPIO83",
+		MTK_EINT_FUNCTION(0, 83),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO83"),
+		MTK_FUNCTION(1, "KROW2"),
+		MTK_FUNCTION(2, "USB_DRVVBUS"),
+		MTK_FUNCTION(5, "C2K_TDI"),
+		MTK_FUNCTION(7, "C2K_DM_EINT3")
+	),
+	MTK_PIN(
+		84, "GPIO84",
+		MTK_EINT_FUNCTION(0, 84),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO84"),
+		MTK_FUNCTION(1, "KCOL0"),
+		MTK_FUNCTION(2, "URTS0"),
+		MTK_FUNCTION(3, "CONN_MCU_DBGACK_N"),
+		MTK_FUNCTION(4, "SCL2"),
+		MTK_FUNCTION(5, "C2K_TDO"),
+		MTK_FUNCTION(6, "AUXIF_CLK")
+	),
+	MTK_PIN(
+		85, "GPIO85",
+		MTK_EINT_FUNCTION(0, 85),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO85"),
+		MTK_FUNCTION(1, "KCOL1"),
+		MTK_FUNCTION(2, "UCTS0"),
+		MTK_FUNCTION(3, "UCTS1"),
+		MTK_FUNCTION(4, "SDA2"),
+		MTK_FUNCTION(5, "C2K_TMS"),
+		MTK_FUNCTION(6, "AUXIF_ST"),
+		MTK_FUNCTION(7, "DBG_MON_A31")
+	),
+	MTK_PIN(
+		86, "GPIO86",
+		MTK_EINT_FUNCTION(0, 86),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO86"),
+		MTK_FUNCTION(1, "KCOL2"),
+		MTK_FUNCTION(3, "URTS1"),
+		MTK_FUNCTION(5, "C2K_RTCK"),
+		MTK_FUNCTION(7, "DBG_MON_A32")
+	),
+	MTK_PIN(
+		87, "GPIO87",
+		MTK_EINT_FUNCTION(0, 87),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO87"),
+		MTK_FUNCTION(1, "BPI_BUS5"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS5"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS5"),
+		MTK_FUNCTION(7, "DBG_MON_B0")
+	),
+	MTK_PIN(
+		88, "GPIO88",
+		MTK_EINT_FUNCTION(0, 88),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO88"),
+		MTK_FUNCTION(1, "BPI_BUS6"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS6"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS6"),
+		MTK_FUNCTION(7, "DBG_MON_B1")
+	),
+	MTK_PIN(
+		89, "GPIO89",
+		MTK_EINT_FUNCTION(0, 89),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO89"),
+		MTK_FUNCTION(1, "BPI_BUS7"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS7"),
+		MTK_FUNCTION(3, "CLKM0"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS7"),
+		MTK_FUNCTION(7, "DBG_MON_B2")
+	),
+	MTK_PIN(
+		90, "GPIO90",
+		MTK_EINT_FUNCTION(0, 90),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO90"),
+		MTK_FUNCTION(1, "BPI_BUS8"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS8"),
+		MTK_FUNCTION(3, "CLKM1"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS8"),
+		MTK_FUNCTION(7, "DBG_MON_B3")
+	),
+	MTK_PIN(
+		91, "GPIO91",
+		MTK_EINT_FUNCTION(0, 91),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO91"),
+		MTK_FUNCTION(1, "BPI_BUS9"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS9"),
+		MTK_FUNCTION(3, "CLKM2"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS9"),
+		MTK_FUNCTION(7, "DBG_MON_B4")
+	),
+	MTK_PIN(
+		92, "GPIO92",
+		MTK_EINT_FUNCTION(0, 92),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO92"),
+		MTK_FUNCTION(1, "BPI_BUS10"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS10"),
+		MTK_FUNCTION(3, "CLKM3"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS10"),
+		MTK_FUNCTION(7, "DBG_MON_B5")
+	),
+	MTK_PIN(
+		93, "GPIO93",
+		MTK_EINT_FUNCTION(0, 93),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO93"),
+		MTK_FUNCTION(1, "BPI_BUS11"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS11"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS11"),
+		MTK_FUNCTION(7, "DBG_MON_B6")
+	),
+	MTK_PIN(
+		94, "GPIO94",
+		MTK_EINT_FUNCTION(0, 94),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO94"),
+		MTK_FUNCTION(1, "BPI_BUS12"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS12"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS12"),
+		MTK_FUNCTION(7, "DBG_MON_B7")
+	),
+	MTK_PIN(
+		95, "GPIO95",
+		MTK_EINT_FUNCTION(0, 95),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO95"),
+		MTK_FUNCTION(1, "BPI_BUS13"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS13"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS13"),
+		MTK_FUNCTION(7, "DBG_MON_B8")
+	),
+	MTK_PIN(
+		96, "GPIO96",
+		MTK_EINT_FUNCTION(0, 96),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO96"),
+		MTK_FUNCTION(1, "BPI_BUS14"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS14"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS14"),
+		MTK_FUNCTION(7, "DBG_MON_B9")
+	),
+	MTK_PIN(
+		97, "GPIO97",
+		MTK_EINT_FUNCTION(0, 97),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO97"),
+		MTK_FUNCTION(1, "BPI_BUS15"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS15"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS15"),
+		MTK_FUNCTION(7, "DBG_MON_B10")
+	),
+	MTK_PIN(
+		98, "GPIO98",
+		MTK_EINT_FUNCTION(0, 98),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO98"),
+		MTK_FUNCTION(1, "BPI_BUS16"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS16"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS16"),
+		MTK_FUNCTION(7, "DBG_MON_B11")
+	),
+	MTK_PIN(
+		99, "GPIO99",
+		MTK_EINT_FUNCTION(0, 99),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO99"),
+		MTK_FUNCTION(1, "BPI_BUS17"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS17"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS17"),
+		MTK_FUNCTION(7, "DBG_MON_B12")
+	),
+	MTK_PIN(
+		100, "GPIO100",
+		MTK_EINT_FUNCTION(0, 100),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO100"),
+		MTK_FUNCTION(1, "BPI_BUS18"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS18"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS18"),
+		MTK_FUNCTION(7, "DBG_MON_B13")
+	),
+	MTK_PIN(
+		101, "GPIO101",
+		MTK_EINT_FUNCTION(0, 101),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO101"),
+		MTK_FUNCTION(1, "BPI_BUS19"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS19"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS19"),
+		MTK_FUNCTION(7, "DBG_MON_B14")
+	),
+	MTK_PIN(
+		102, "GPIO102",
+		MTK_EINT_FUNCTION(0, 102),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO102"),
+		MTK_FUNCTION(1, "BPI_BUS20"),
+		MTK_FUNCTION(2, "LTE_C2K_BPI_BUS20"),
+		MTK_FUNCTION(5, "C2K_BPI_BUS20"),
+		MTK_FUNCTION(7, "DBG_MON_B15")
+	),
+	MTK_PIN(
+		103, "GPIO103",
+		MTK_EINT_FUNCTION(0, 103),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO103"),
+		MTK_FUNCTION(1, "C2K_TXBPI"),
+		MTK_FUNCTION(7, "DBG_MON_B16")
+	),
+	MTK_PIN(
+		104, "GPIO104",
+		MTK_EINT_FUNCTION(0, 104),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO104"),
+		MTK_FUNCTION(1, "RFIC1_BSI_EN"),
+		MTK_FUNCTION(5, "C2K_RX_BSI_EN"),
+		MTK_FUNCTION(7, "DBG_MON_B17")
+	),
+	MTK_PIN(
+		105, "GPIO105",
+		MTK_EINT_FUNCTION(0, 105),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO105"),
+		MTK_FUNCTION(1, "RFIC1_BSI_CK"),
+		MTK_FUNCTION(5, "C2K_RX_BSI_CLK"),
+		MTK_FUNCTION(7, "DBG_MON_B18")
+	),
+	MTK_PIN(
+		106, "GPIO106",
+		MTK_EINT_FUNCTION(0, 106),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO106"),
+		MTK_FUNCTION(1, "RFIC1_BSI_D0"),
+		MTK_FUNCTION(5, "C2K_RX_BSI_DATA"),
+		MTK_FUNCTION(7, "DBG_MON_B19")
+	),
+	MTK_PIN(
+		107, "GPIO107",
+		MTK_EINT_FUNCTION(0, 107),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO107"),
+		MTK_FUNCTION(1, "RFIC1_BSI_D1"),
+		MTK_FUNCTION(5, "C2K_TX_BSI_EN"),
+		MTK_FUNCTION(7, "DBG_MON_B20")
+	),
+	MTK_PIN(
+		108, "GPIO108",
+		MTK_EINT_FUNCTION(0, 108),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO108"),
+		MTK_FUNCTION(1, "RFIC1_BSI_D2"),
+		MTK_FUNCTION(5, "C2K_TX_BSI_CLK"),
+		MTK_FUNCTION(7, "DBG_MON_B21")
+	),
+	MTK_PIN(
+		109, "GPIO109",
+		MTK_EINT_FUNCTION(0, 109),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO109"),
+		MTK_FUNCTION(5, "C2K_TX_BSI_DATA"),
+		MTK_FUNCTION(7, "DBG_MON_B22")
+	),
+	MTK_PIN(
+		110, "GPIO110",
+		MTK_EINT_FUNCTION(0, 110),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO110"),
+		MTK_FUNCTION(1, "RFIC0_BSI_EN"),
+		MTK_FUNCTION(4, "SPM_BSI_EN"),
+		MTK_FUNCTION(7, "DBG_MON_B23")
+	),
+	MTK_PIN(
+		111, "GPIO111",
+		MTK_EINT_FUNCTION(0, 111),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO111"),
+		MTK_FUNCTION(1, "RFIC0_BSI_CK"),
+		MTK_FUNCTION(4, "SPM_BSI_CLK"),
+		MTK_FUNCTION(7, "DBG_MON_B24")
+	),
+	MTK_PIN(
+		112, "GPIO112",
+		MTK_EINT_FUNCTION(0, 112),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO112"),
+		MTK_FUNCTION(1, "RFIC0_BSI_D2"),
+		MTK_FUNCTION(4, "SPM_BSI_D2"),
+		MTK_FUNCTION(7, "DBG_MON_B25")
+	),
+	MTK_PIN(
+		113, "GPIO113",
+		MTK_EINT_FUNCTION(0, 113),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO113"),
+		MTK_FUNCTION(1, "RFIC0_BSI_D1"),
+		MTK_FUNCTION(4, "SPM_BSI_D1"),
+		MTK_FUNCTION(7, "DBG_MON_B26")
+	),
+	MTK_PIN(
+		114, "GPIO114",
+		MTK_EINT_FUNCTION(0, 114),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO114"),
+		MTK_FUNCTION(1, "RFIC0_BSI_D0"),
+		MTK_FUNCTION(4, "SPM_BSI_D0"),
+		MTK_FUNCTION(7, "DBG_MON_B27")
+	),
+	MTK_PIN(
+		115, "GPIO115",
+		MTK_EINT_FUNCTION(0, 115),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO115"),
+		MTK_FUNCTION(1, "AUXIN0")
+	),
+	MTK_PIN(
+		116, "GPIO116",
+		MTK_EINT_FUNCTION(0, 116),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO116"),
+		MTK_FUNCTION(1, "AUXIN1")
+	),
+	MTK_PIN(
+		117, "GPIO117",
+		MTK_EINT_FUNCTION(0, 117),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO117"),
+		MTK_FUNCTION(1, "AUXIN2")
+	),
+	MTK_PIN(
+		118, "GPIO118",
+		MTK_EINT_FUNCTION(0, 118),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO118"),
+		MTK_FUNCTION(1, "TXBPI")
+	),
+	MTK_PIN(
+		119, "GPIO119",
+		MTK_EINT_FUNCTION(0, 119),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO119"),
+		MTK_FUNCTION(1, "BPI_BUS0"),
+		MTK_FUNCTION(7, "DBG_MON_B28")
+	),
+	MTK_PIN(
+		120, "GPIO120",
+		MTK_EINT_FUNCTION(0, 120),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO120"),
+		MTK_FUNCTION(1, "BPI_BUS1"),
+		MTK_FUNCTION(7, "DBG_MON_B29")
+	),
+	MTK_PIN(
+		121, "GPIO121",
+		MTK_EINT_FUNCTION(0, 121),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO121"),
+		MTK_FUNCTION(1, "BPI_BUS2"),
+		MTK_FUNCTION(7, "DBG_MON_B30")
+	),
+	MTK_PIN(
+		122, "GPIO122",
+		MTK_EINT_FUNCTION(0, 122),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO122"),
+		MTK_FUNCTION(1, "BPI_BUS3"),
+		MTK_FUNCTION(7, "DBG_MON_B31")
+	),
+	MTK_PIN(
+		123, "GPIO123",
+		MTK_EINT_FUNCTION(0, 123),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO123"),
+		MTK_FUNCTION(1, "BPI_BUS4"),
+		MTK_FUNCTION(7, "DBG_MON_B32")
+	),
+	MTK_PIN(
+		124, "GPIO124",
+		MTK_EINT_FUNCTION(0, 124),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO124"),
+		MTK_FUNCTION(1, "BPI_BUS21"),
+		MTK_FUNCTION(5, "DPI_HSYNC1"),
+		MTK_FUNCTION(6, "KCOL2"),
+		MTK_FUNCTION(7, "TDD_TXD")
+	),
+	MTK_PIN(
+		125, "GPIO125",
+		MTK_EINT_FUNCTION(0, 125),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO125"),
+		MTK_FUNCTION(1, "BPI_BUS22"),
+		MTK_FUNCTION(5, "DPI_VSYNC1"),
+		MTK_FUNCTION(6, "KROW2"),
+		MTK_FUNCTION(7, "MD_URXD")
+	),
+	MTK_PIN(
+		126, "GPIO126",
+		MTK_EINT_FUNCTION(0, 126),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO126"),
+		MTK_FUNCTION(1, "BPI_BUS23"),
+		MTK_FUNCTION(5, "DPI_CK1"),
+		MTK_FUNCTION(6, "I2S2_MCK"),
+		MTK_FUNCTION(7, "MD_UTXD")
+	),
+	MTK_PIN(
+		127, "GPIO127",
+		MTK_EINT_FUNCTION(0, 127),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO127"),
+		MTK_FUNCTION(1, "BPI_BUS24"),
+		MTK_FUNCTION(3, "CONN_MCU_DBGI_N"),
+		MTK_FUNCTION(4, "EXT_FRAME_SYNC"),
+		MTK_FUNCTION(5, "DPI_DE1"),
+		MTK_FUNCTION(6, "SRCLKENAI1"),
+		MTK_FUNCTION(7, "URXD0")
+	),
+	MTK_PIN(
+		128, "GPIO128",
+		MTK_EINT_FUNCTION(0, 128),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO128"),
+		MTK_FUNCTION(1, "BPI_BUS25"),
+		MTK_FUNCTION(3, "GPS_FRAME_SYNC"),
+		MTK_FUNCTION(5, "I2S2_DI"),
+		MTK_FUNCTION(6, "PTA_RXD"),
+		MTK_FUNCTION(7, "UTXD0")
+	),
+	MTK_PIN(
+		129, "GPIO129",
+		MTK_EINT_FUNCTION(0, 129),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO129"),
+		MTK_FUNCTION(1, "BPI_BUS26"),
+		MTK_FUNCTION(2, "DISP_PWM"),
+		MTK_FUNCTION(5, "I2S2_LRCK"),
+		MTK_FUNCTION(6, "PTA_TXD"),
+		MTK_FUNCTION(7, "LTE_URXD")
+	),
+	MTK_PIN(
+		130, "GPIO130",
+		MTK_EINT_FUNCTION(0, 130),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO130"),
+		MTK_FUNCTION(1, "BPI_BUS27"),
+		MTK_FUNCTION(5, "I2S2_BCK"),
+		MTK_FUNCTION(6, "IRTX_OUT"),
+		MTK_FUNCTION(7, "LTE_UTXD")
+	),
+	MTK_PIN(
+		131, "GPIO131",
+		MTK_EINT_FUNCTION(0, 131),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO131"),
+		MTK_FUNCTION(1, "LTE_PAVM0")
+	),
+	MTK_PIN(
+		132, "GPIO132",
+		MTK_EINT_FUNCTION(0, 132),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO132"),
+		MTK_FUNCTION(1, "LTE_PAVM1")
+	),
+	MTK_PIN(
+		133, "GPIO133",
+		MTK_EINT_FUNCTION(0, 133),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO133"),
+		MTK_FUNCTION(1, "MIPI1_SCLK")
+	),
+	MTK_PIN(
+		134, "GPIO134",
+		MTK_EINT_FUNCTION(0, 134),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO134"),
+		MTK_FUNCTION(1, "MIPI1_SDATA")
+	),
+	MTK_PIN(
+		135, "GPIO135",
+		MTK_EINT_FUNCTION(0, 135),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO135"),
+		MTK_FUNCTION(1, "MIPI0_SCLK")
+	),
+	MTK_PIN(
+		136, "GPIO136",
+		MTK_EINT_FUNCTION(0, 136),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO136"),
+		MTK_FUNCTION(1, "MIPI0_SDATA")
+	),
+	MTK_PIN(
+		137, "GPIO137",
+		MTK_EINT_FUNCTION(0, 137),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO137"),
+		MTK_FUNCTION(1, "RTC32K_CK")
+	),
+	MTK_PIN(
+		138, "GPIO138",
+		MTK_EINT_FUNCTION(0, 138),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO138"),
+		MTK_FUNCTION(1, "PWRAP_SPIDO"),
+		MTK_FUNCTION(2, "PWRAP_SPIDI")
+	),
+	MTK_PIN(
+		139, "GPIO139",
+		MTK_EINT_FUNCTION(0, 139),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO139"),
+		MTK_FUNCTION(1, "PWRAP_SPIDI"),
+		MTK_FUNCTION(2, "PWRAP_SPIDO")
+	),
+	MTK_PIN(
+		140, "GPIO140",
+		MTK_EINT_FUNCTION(0, 140),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO140"),
+		MTK_FUNCTION(3, "LTE_MD32_JTAG_TRST"),
+		MTK_FUNCTION(4, "TDD_TRSTN"),
+		MTK_FUNCTION(5, "DM_JTINTP")
+	),
+	MTK_PIN(
+		141, "GPIO141",
+		MTK_EINT_FUNCTION(0, 141),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO141"),
+		MTK_FUNCTION(1, "PWRAP_SPICK_I")
+	),
+	MTK_PIN(
+		142, "GPIO142",
+		MTK_EINT_FUNCTION(0, 142),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO142"),
+		MTK_FUNCTION(1, "PWRAP_SPICS_B_I")
+	),
+	MTK_PIN(
+		143, "GPIO143",
+		MTK_EINT_FUNCTION(0, 143),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO143"),
+		MTK_FUNCTION(1, "AUD_CLK_MOSI")
+	),
+	MTK_PIN(
+		144, "GPIO144",
+		MTK_EINT_FUNCTION(0, 144),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO144"),
+		MTK_FUNCTION(1, "AUD_DAT_MISO"),
+		MTK_FUNCTION(3, "AUD_DAT_MOSI")
+	),
+	MTK_PIN(
+		145, "GPIO145",
+		MTK_EINT_FUNCTION(0, 145),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO145"),
+		MTK_FUNCTION(1, "AUD_DAT_MOSI"),
+		MTK_FUNCTION(3, "AUD_DAT_MISO")
+	),
+	MTK_PIN(
+		146, "GPIO146",
+		MTK_EINT_FUNCTION(0, 146),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO146"),
+		MTK_FUNCTION(1, "LCM_RST")
+	),
+	MTK_PIN(
+		147, "GPIO147",
+		MTK_EINT_FUNCTION(0, 147),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO147"),
+		MTK_FUNCTION(1, "DSI_TE")
+	),
+	MTK_PIN(
+		148, "GPIO148",
+		MTK_EINT_FUNCTION(0, 148),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO148"),
+		MTK_FUNCTION(1, "SRCLKENA")
+	),
+	MTK_PIN(
+		149, "GPIO149",
+		MTK_EINT_FUNCTION(0, 149),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO149"),
+		MTK_FUNCTION(1, "WATCHDOG")
+	),
+	MTK_PIN(
+		150, "GPIO150",
+		MTK_EINT_FUNCTION(0, 150),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO150"),
+		MTK_FUNCTION(1, "TDP0")
+	),
+	MTK_PIN(
+		151, "GPIO151",
+		MTK_EINT_FUNCTION(0, 151),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO151"),
+		MTK_FUNCTION(1, "TDN0")
+	),
+	MTK_PIN(
+		152, "GPIO152",
+		MTK_EINT_FUNCTION(0, 152),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO152"),
+		MTK_FUNCTION(1, "TDP1")
+	),
+	MTK_PIN(
+		153, "GPIO153",
+		MTK_EINT_FUNCTION(0, 153),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO153"),
+		MTK_FUNCTION(1, "TDN1")
+	),
+	MTK_PIN(
+		154, "GPIO154",
+		MTK_EINT_FUNCTION(0, 154),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO154"),
+		MTK_FUNCTION(1, "TCP")
+	),
+	MTK_PIN(
+		155, "GPIO155",
+		MTK_EINT_FUNCTION(0, 155),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO155"),
+		MTK_FUNCTION(1, "TCN")
+	),
+	MTK_PIN(
+		156, "GPIO156",
+		MTK_EINT_FUNCTION(0, 156),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO156"),
+		MTK_FUNCTION(1, "TDP2")
+	),
+	MTK_PIN(
+		157, "GPIO157",
+		MTK_EINT_FUNCTION(0, 157),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO157"),
+		MTK_FUNCTION(1, "TDN2")
+	),
+	MTK_PIN(
+		158, "GPIO158",
+		MTK_EINT_FUNCTION(0, 158),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO158"),
+		MTK_FUNCTION(1, "TDP3")
+	),
+	MTK_PIN(
+		159, "GPIO159",
+		MTK_EINT_FUNCTION(0, 159),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO159"),
+		MTK_FUNCTION(1, "TDN3")
+	),
+	MTK_PIN(
+		160, "GPIO160",
+		MTK_EINT_FUNCTION(0, 160),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO160"),
+		MTK_FUNCTION(1, "MD_SIM2_SCLK"),
+		MTK_FUNCTION(2, "MD_SIM1_SCLK"),
+		MTK_FUNCTION(3, "UIM0_CLK"),
+		MTK_FUNCTION(4, "UIM1_CLK")
+	),
+	MTK_PIN(
+		161, "GPIO161",
+		MTK_EINT_FUNCTION(0, 161),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO161"),
+		MTK_FUNCTION(1, "MD_SIM2_SRST"),
+		MTK_FUNCTION(2, "MD_SIM1_SRST"),
+		MTK_FUNCTION(3, "UIM0_RST"),
+		MTK_FUNCTION(4, "UIM1_RST")
+	),
+	MTK_PIN(
+		162, "GPIO162",
+		MTK_EINT_FUNCTION(0, 162),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO162"),
+		MTK_FUNCTION(1, "MD_SIM2_SDAT"),
+		MTK_FUNCTION(2, "MD_SIM1_SDAT"),
+		MTK_FUNCTION(3, "UIM0_IO"),
+		MTK_FUNCTION(4, "UIM1_IO")
+	),
+	MTK_PIN(
+		163, "GPIO163",
+		MTK_EINT_FUNCTION(0, 163),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO163"),
+		MTK_FUNCTION(1, "MD_SIM1_SCLK"),
+		MTK_FUNCTION(2, "MD_SIM2_SCLK"),
+		MTK_FUNCTION(3, "UIM1_CLK"),
+		MTK_FUNCTION(4, "UIM0_CLK")
+	),
+	MTK_PIN(
+		164, "GPIO164",
+		MTK_EINT_FUNCTION(0, 164),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO164"),
+		MTK_FUNCTION(1, "MD_SIM1_SRST"),
+		MTK_FUNCTION(2, "MD_SIM2_SRST"),
+		MTK_FUNCTION(3, "UIM1_RST"),
+		MTK_FUNCTION(4, "UIM0_RST")
+	),
+	MTK_PIN(
+		165, "GPIO165",
+		MTK_EINT_FUNCTION(0, 165),
+		DRV_GRP0,
+		MTK_FUNCTION(0, "GPIO165"),
+		MTK_FUNCTION(1, "MD_SIM1_SDAT"),
+		MTK_FUNCTION(2, "MD_SIM2_SDAT"),
+		MTK_FUNCTION(3, "UIM1_IO"),
+		MTK_FUNCTION(4, "UIM0_IO")
+	),
+	MTK_PIN(
+		166, "GPIO166",
+		MTK_EINT_FUNCTION(0, 166),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO166"),
+		MTK_FUNCTION(1, "MSDC1_CMD"),
+		MTK_FUNCTION(2, "LTE_MD32_JTAG_TMS"),
+		MTK_FUNCTION(3, "C2K_TMS"),
+		MTK_FUNCTION(4, "TDD_TMS"),
+		MTK_FUNCTION(5, "CONN_DSP_JMS"),
+		MTK_FUNCTION(6, "JTMS"),
+		MTK_FUNCTION(7, "CONN_MCU_AICE_TMSC")
+	),
+	MTK_PIN(
+		167, "GPIO167",
+		MTK_EINT_FUNCTION(0, 167),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO167"),
+		MTK_FUNCTION(1, "MSDC1_CLK"),
+		MTK_FUNCTION(2, "LTE_MD32_JTAG_TCK"),
+		MTK_FUNCTION(3, "C2K_TCK"),
+		MTK_FUNCTION(4, "TDD_TCK"),
+		MTK_FUNCTION(5, "CONN_DSP_JCK"),
+		MTK_FUNCTION(6, "JTCK"),
+		MTK_FUNCTION(7, "CONN_MCU_AICE_TCKC")
+	),
+	MTK_PIN(
+		168, "GPIO168",
+		MTK_EINT_FUNCTION(0, 168),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO168"),
+		MTK_FUNCTION(1, "MSDC1_DAT0"),
+		MTK_FUNCTION(2, "LTE_MD32_JTAG_TDI"),
+		MTK_FUNCTION(3, "C2K_TDI"),
+		MTK_FUNCTION(4, "TDD_TDI"),
+		MTK_FUNCTION(5, "CONN_DSP_JDI"),
+		MTK_FUNCTION(6, "JTDI")
+	),
+	MTK_PIN(
+		169, "GPIO169",
+		MTK_EINT_FUNCTION(0, 169),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO169"),
+		MTK_FUNCTION(1, "MSDC1_DAT1"),
+		MTK_FUNCTION(2, "LTE_MD32_JTAG_TDO"),
+		MTK_FUNCTION(3, "C2K_TDO"),
+		MTK_FUNCTION(4, "TDD_TDO"),
+		MTK_FUNCTION(5, "CONN_DSP_JDO"),
+		MTK_FUNCTION(6, "JTDO")
+	),
+	MTK_PIN(
+		170, "GPIO170",
+		MTK_EINT_FUNCTION(0, 170),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO170"),
+		MTK_FUNCTION(1, "MSDC1_DAT2"),
+		MTK_FUNCTION(2, "LTE_MD32_JTAG_TRST"),
+		MTK_FUNCTION(3, "C2K_NTRST"),
+		MTK_FUNCTION(4, "TDD_TRSTN"),
+		MTK_FUNCTION(5, "CONN_DSP_JINTP"),
+		MTK_FUNCTION(6, "DM_JTINTP")
+	),
+	MTK_PIN(
+		171, "GPIO171",
+		MTK_EINT_FUNCTION(0, 171),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO171"),
+		MTK_FUNCTION(1, "MSDC1_DAT3"),
+		MTK_FUNCTION(3, "C2K_RTCK")
+	),
+	MTK_PIN(
+		172, "GPIO172",
+		MTK_EINT_FUNCTION(0, 172),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO172"),
+		MTK_FUNCTION(1, "MSDC0_CMD")
+	),
+	MTK_PIN(
+		173, "GPIO173",
+		MTK_EINT_FUNCTION(0, 173),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO173"),
+		MTK_FUNCTION(1, "MSDC0_DSL")
+	),
+	MTK_PIN(
+		174, "GPIO174",
+		MTK_EINT_FUNCTION(0, 174),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO174"),
+		MTK_FUNCTION(1, "MSDC0_CLK")
+	),
+	MTK_PIN(
+		175, "GPIO175",
+		MTK_EINT_FUNCTION(0, 175),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO175"),
+		MTK_FUNCTION(1, "MSDC0_DAT0")
+	),
+	MTK_PIN(
+		176, "GPIO176",
+		MTK_EINT_FUNCTION(0, 176),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO176"),
+		MTK_FUNCTION(1, "MSDC0_DAT1")
+	),
+	MTK_PIN(
+		177, "GPIO177",
+		MTK_EINT_FUNCTION(0, 177),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO177"),
+		MTK_FUNCTION(1, "MSDC0_DAT2")
+	),
+	MTK_PIN(
+		178, "GPIO178",
+		MTK_EINT_FUNCTION(0, 178),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO178"),
+		MTK_FUNCTION(1, "MSDC0_DAT3")
+	),
+	MTK_PIN(
+		179, "GPIO179",
+		MTK_EINT_FUNCTION(0, 179),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO179"),
+		MTK_FUNCTION(1, "MSDC0_DAT4")
+	),
+	MTK_PIN(
+		180, "GPIO180",
+		MTK_EINT_FUNCTION(0, 180),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO180"),
+		MTK_FUNCTION(1, "MSDC0_DAT5")
+	),
+	MTK_PIN(
+		181, "GPIO181",
+		MTK_EINT_FUNCTION(0, 181),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO181"),
+		MTK_FUNCTION(1, "MSDC0_DAT6")
+	),
+	MTK_PIN(
+		182, "GPIO182",
+		MTK_EINT_FUNCTION(0, 182),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO182"),
+		MTK_FUNCTION(1, "MSDC0_DAT7")
+	),
+	MTK_PIN(
+		183, "GPIO183",
+		MTK_EINT_FUNCTION(0, 183),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO183"),
+		MTK_FUNCTION(1, "MSDC0_RSTB")
+	),
+	MTK_PIN(
+		184, "GPIO184",
+		MTK_EINT_FUNCTION(0, 184),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO184"),
+		MTK_FUNCTION(1, "F2W_DATA"),
+		MTK_FUNCTION(2, "MRG_CLK"),
+		MTK_FUNCTION(3, "C2K_DM_EINT2"),
+		MTK_FUNCTION(4, "PCM0_CLK")
+	),
+	MTK_PIN(
+		185, "GPIO185",
+		MTK_EINT_FUNCTION(0, 185),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO185"),
+		MTK_FUNCTION(1, "F2W_CK"),
+		MTK_FUNCTION(2, "MRG_DI"),
+		MTK_FUNCTION(3, "C2K_DM_EINT3"),
+		MTK_FUNCTION(4, "PCM0_DI")
+	),
+	MTK_PIN(
+		186, "GPIO186",
+		MTK_EINT_FUNCTION(0, 186),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO186"),
+		MTK_FUNCTION(1, "WB_RSTB"),
+		MTK_FUNCTION(4, "URXD3"),
+		MTK_FUNCTION(5, "UTXD3")
+	),
+	MTK_PIN(
+		187, "GPIO187",
+		MTK_EINT_FUNCTION(0, 187),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO187"),
+		MTK_FUNCTION(1, "WB_SCLK"),
+		MTK_FUNCTION(2, "MRG_DO"),
+		MTK_FUNCTION(4, "PCM0_DO")
+	),
+	MTK_PIN(
+		188, "GPIO188",
+		MTK_EINT_FUNCTION(0, 188),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO188"),
+		MTK_FUNCTION(1, "WB_SDATA"),
+		MTK_FUNCTION(2, "MRG_SYNC"),
+		MTK_FUNCTION(4, "PCM0_SYNC")
+	),
+	MTK_PIN(
+		189, "GPIO189",
+		MTK_EINT_FUNCTION(0, 189),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO189"),
+		MTK_FUNCTION(1, "WB_SEN"),
+		MTK_FUNCTION(4, "UTXD3"),
+		MTK_FUNCTION(5, "URXD3")
+	),
+	MTK_PIN(
+		190, "GPIO190",
+		MTK_EINT_FUNCTION(0, 190),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO190"),
+		MTK_FUNCTION(1, "GPS_RXQN")
+	),
+	MTK_PIN(
+		191, "GPIO191",
+		MTK_EINT_FUNCTION(0, 191),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO191"),
+		MTK_FUNCTION(1, "GPS_RXQP")
+	),
+	MTK_PIN(
+		192, "GPIO192",
+		MTK_EINT_FUNCTION(0, 192),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO192"),
+		MTK_FUNCTION(1, "GPS_RXIN")
+	),
+	MTK_PIN(
+		193, "GPIO193",
+		MTK_EINT_FUNCTION(0, 193),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO193"),
+		MTK_FUNCTION(1, "GPS_RXIP")
+	),
+	MTK_PIN(
+		194, "GPIO194",
+		MTK_EINT_FUNCTION(0, 194),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO194"),
+		MTK_FUNCTION(1, "WB_RXQN")
+	),
+	MTK_PIN(
+		195, "GPIO195",
+		MTK_EINT_FUNCTION(0, 195),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO195"),
+		MTK_FUNCTION(1, "WB_RXQP")
+	),
+	MTK_PIN(
+		196, "GPIO196",
+		MTK_EINT_FUNCTION(0, 196),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO196"),
+		MTK_FUNCTION(1, "WB_RXIN")
+	),
+	MTK_PIN(
+		197, "GPIO197",
+		MTK_EINT_FUNCTION(0, 197),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO197"),
+		MTK_FUNCTION(1, "WB_RXIP")
+	),
+	MTK_PIN(
+		198, "GPIO198",
+		MTK_EINT_FUNCTION(0, 198),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		199, "GPIO199",
+		MTK_EINT_FUNCTION(0, 199),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		200, "GPIO200",
+		MTK_EINT_FUNCTION(0, 200),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		201, "GPIO201",
+		MTK_EINT_FUNCTION(0, 201),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		202, "GPIO202",
+		MTK_EINT_FUNCTION(0, 202),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		203, "GPIO203",
+		MTK_EINT_FUNCTION(0, 203),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		204, "GPIO204",
+		MTK_EINT_FUNCTION(0, 204),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		205, "GPIO205",
+		MTK_EINT_FUNCTION(0, 205),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		206, "GPIO206",
+		MTK_EINT_FUNCTION(0, 206),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		207, "GPIO207",
+		MTK_EINT_FUNCTION(0, 207),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		208, "GPIO208",
+		MTK_EINT_FUNCTION(0, 208),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		209, "GPIO209",
+		MTK_EINT_FUNCTION(0, 209),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		210, "GPIO210",
+		MTK_EINT_FUNCTION(0, 210),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		211, "GPIO211",
+		MTK_EINT_FUNCTION(0, 211),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		212, "GPIO212",
+		MTK_EINT_FUNCTION(0, 212),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+};
+
+#endif
-- 
2.46.2


