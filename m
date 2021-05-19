Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFA738939E
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 18:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355220AbhESQZj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 12:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355237AbhESQZi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 May 2021 12:25:38 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C84DC0613CE
        for <linux-gpio@vger.kernel.org>; Wed, 19 May 2021 09:24:18 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id c14so12876972wrx.3
        for <linux-gpio@vger.kernel.org>; Wed, 19 May 2021 09:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fnI9iV0KJUsu1wmQfP1tqp0WWyvOWU5FVzIXanJKq7w=;
        b=AsPEhPkAt+Pu3G/F2nBGkzgo1o71rKDAXbMq7WSfeWEPldzcHj2DmHFzSaoYlqwDv0
         PjU7qcrJLFvJuyFPze/UcYB0qZvXvszGOOPqc/bdHOYR3q0VEkygLKBnFjVYpWze3XxZ
         uS3m28g69ehVmH+b5kuaoskUldSi8OTCB3YxisWnRvZSUyTch6BgPwJl/e4Cevo2Opte
         BAFRuzmd5DCHoBmJUyLDM/2Ak2zF1I2EfTrjlof+rG2iXNUUqEwbo1072JOLG5ygR0o3
         dwgV0oR9h4Ezz7jVg1JnBOVBOkcozV8dzr0CR5XwdGy0bStCTeuCl34iQmTRrs15AYb2
         P0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fnI9iV0KJUsu1wmQfP1tqp0WWyvOWU5FVzIXanJKq7w=;
        b=G6ZwV3FNdcKrCTUax4w42T1jnd51Znd5owY5ZnH4GFbkI5B3TQn/LCurF+yabcKOOW
         modxXm7jlxLHwI338/sqW04F4lYzUgc5Jw9JiGRWoFQhEHsgag5b8wkIm4JSLQWM5bhF
         5mwvBV1tqm7WEeAIBgrkJI7zQcEHTGe20Qy7EfppQRA8Ramo7uA2UqWiAByIAQtDCVYe
         wY9ljaew8ruPcb/tbeBdadNDHF2UmH4m6N5zZ2V2Y232BO3KONUfmu7bllRg0DCb5YzW
         I3HGZrBB260ukbNEvdO2I2RCJdVIA7OmAk277t9uoMNwIFf1KEZJDcwh5+X2uPv2AOZ8
         T5MA==
X-Gm-Message-State: AOAM530TmhmPK2yF+fltZN2CiGlL3dJgw3u1SDDT/ylaPfup807tyw5f
        HBbxk/44nA6+1Rye7nJQYm3RVg==
X-Google-Smtp-Source: ABdhPJy9Qrl8SOrOAHuQjOISvT7djfToGiTAft621qr/EUYsQIxHrsnxjSk92vmu0jib3Ax1yfoDqg==
X-Received: by 2002:adf:f043:: with SMTP id t3mr15717621wro.344.1621441456641;
        Wed, 19 May 2021 09:24:16 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id p10sm24489710wrr.58.2021.05.19.09.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 09:24:16 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] pinctrl: mediatek: add support for mt8365 SoC
Date:   Wed, 19 May 2021 18:24:08 +0200
Message-Id: <20210519162409.3755679-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519162409.3755679-1-fparent@baylibre.com>
References: <20210519162409.3755679-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pinctrl driver for MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/pinctrl/mediatek/Kconfig              |    6 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8365.c     |  502 ++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8365.h | 1511 +++++++++++++++++
 4 files changed, 2020 insertions(+)
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8365.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8365.h

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 90f0c8255eaf..b27c2070559a 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -153,6 +153,12 @@ config PINCTRL_MT8195
 	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MTK_PARIS
 
+config PINCTRL_MT8365
+	bool "Mediatek MT8365 pin control"
+	depends on OF
+	depends on ARM64 || COMPILE_TEST
+	default ARM64 && ARCH_MEDIATEK
+
 config PINCTRL_MT8516
 	bool "Mediatek MT8516 pin control"
 	depends on OF
diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
index 06fde993ace2..1bb7f9c65bc2 100644
--- a/drivers/pinctrl/mediatek/Makefile
+++ b/drivers/pinctrl/mediatek/Makefile
@@ -22,5 +22,6 @@ obj-$(CONFIG_PINCTRL_MT8173)	+= pinctrl-mt8173.o
 obj-$(CONFIG_PINCTRL_MT8183)	+= pinctrl-mt8183.o
 obj-$(CONFIG_PINCTRL_MT8192)	+= pinctrl-mt8192.o
 obj-$(CONFIG_PINCTRL_MT8195)    += pinctrl-mt8195.o
+obj-$(CONFIG_PINCTRL_MT8365)	+= pinctrl-mt8365.o
 obj-$(CONFIG_PINCTRL_MT8516)	+= pinctrl-mt8516.o
 obj-$(CONFIG_PINCTRL_MT6397)	+= pinctrl-mt6397.o
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8365.c b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
new file mode 100644
index 000000000000..22c33c3cb581
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
@@ -0,0 +1,502 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ * Author: Zhiyong Tao <zhiyong.tao@mediatek.com>
+ */
+
+#include <dt-bindings/pinctrl/mt65xx.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/module.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "pinctrl-mtk-common.h"
+#include "pinctrl-mtk-mt8365.h"
+
+static const struct mtk_drv_group_desc mt8365_drv_grp[] = {
+	/* 0E4E8SR 4/8/12/16 */
+	MTK_DRV_GRP(4, 16, 1, 2, 4),
+	/* 0E2E4SR  2/4/6/8 */
+	MTK_DRV_GRP(2, 8, 1, 2, 2),
+	/* E8E4E2  2/4/6/8/10/12/14/16 */
+	MTK_DRV_GRP(2, 16, 0, 2, 2)
+};
+
+static const struct mtk_pin_drv_grp mt8365_pin_drv[] = {
+
+	MTK_PIN_DRV_GRP(0, 0x710, 0, 2),
+	MTK_PIN_DRV_GRP(1, 0x710, 0, 2),
+	MTK_PIN_DRV_GRP(2, 0x710, 0, 2),
+	MTK_PIN_DRV_GRP(3, 0x710, 0, 2),
+	MTK_PIN_DRV_GRP(4, 0x710, 4, 2),
+	MTK_PIN_DRV_GRP(5, 0x710, 4, 2),
+	MTK_PIN_DRV_GRP(6, 0x710, 4, 2),
+	MTK_PIN_DRV_GRP(7, 0x710, 4, 2),
+	MTK_PIN_DRV_GRP(8, 0x710, 8, 2),
+	MTK_PIN_DRV_GRP(9, 0x710, 8, 2),
+	MTK_PIN_DRV_GRP(10, 0x710, 8, 2),
+	MTK_PIN_DRV_GRP(11, 0x710, 8, 2),
+	MTK_PIN_DRV_GRP(12, 0x710, 12, 2),
+	MTK_PIN_DRV_GRP(13, 0x710, 12, 2),
+	MTK_PIN_DRV_GRP(14, 0x710, 12, 2),
+	MTK_PIN_DRV_GRP(15, 0x710, 12, 2),
+	MTK_PIN_DRV_GRP(16, 0x710, 16, 2),
+	MTK_PIN_DRV_GRP(17, 0x710, 16, 2),
+	MTK_PIN_DRV_GRP(18, 0x710, 16, 2),
+	MTK_PIN_DRV_GRP(19, 0x710, 20, 2),
+	MTK_PIN_DRV_GRP(20, 0x710, 24, 2),
+	MTK_PIN_DRV_GRP(21, 0x710, 24, 2),
+	MTK_PIN_DRV_GRP(22, 0x710, 28, 2),
+	MTK_PIN_DRV_GRP(23, 0x720, 0, 2),
+	MTK_PIN_DRV_GRP(24, 0x720, 0, 2),
+	MTK_PIN_DRV_GRP(25, 0x720, 0, 2),
+	MTK_PIN_DRV_GRP(26, 0x720, 4, 2),
+	MTK_PIN_DRV_GRP(27, 0x720, 4, 2),
+	MTK_PIN_DRV_GRP(28, 0x720, 4, 2),
+	MTK_PIN_DRV_GRP(29, 0x720, 4, 2),
+	MTK_PIN_DRV_GRP(30, 0x720, 8, 2),
+	MTK_PIN_DRV_GRP(31, 0x720, 8, 2),
+	MTK_PIN_DRV_GRP(32, 0x720, 8, 2),
+	MTK_PIN_DRV_GRP(33, 0x720, 8, 2),
+	MTK_PIN_DRV_GRP(34, 0x720, 8, 2),
+	MTK_PIN_DRV_GRP(35, 0x720, 12, 2),
+	MTK_PIN_DRV_GRP(36, 0x720, 12, 2),
+	MTK_PIN_DRV_GRP(37, 0x720, 12, 2),
+	MTK_PIN_DRV_GRP(38, 0x720, 12, 2),
+	MTK_PIN_DRV_GRP(39, 0x720, 12, 2),
+	MTK_PIN_DRV_GRP(40, 0x720, 12, 2),
+	MTK_PIN_DRV_GRP(41, 0x720, 16, 2),
+	MTK_PIN_DRV_GRP(42, 0x720, 16, 2),
+	MTK_PIN_DRV_GRP(43, 0x720, 16, 2),
+	MTK_PIN_DRV_GRP(44, 0x720, 16, 2),
+	MTK_PIN_DRV_GRP(45, 0x720, 20, 2),
+	MTK_PIN_DRV_GRP(46, 0x720, 20, 2),
+	MTK_PIN_DRV_GRP(47, 0x720, 20, 2),
+	MTK_PIN_DRV_GRP(48, 0x720, 20, 2),
+	MTK_PIN_DRV_GRP(49, 0x720, 24, 2),
+	MTK_PIN_DRV_GRP(50, 0x720, 24, 2),
+	MTK_PIN_DRV_GRP(51, 0x720, 24, 2),
+	MTK_PIN_DRV_GRP(52, 0x720, 24, 2),
+	MTK_PIN_DRV_GRP(53, 0x720, 24, 2),
+	MTK_PIN_DRV_GRP(54, 0x720, 24, 2),
+	MTK_PIN_DRV_GRP(55, 0x720, 24, 2),
+	MTK_PIN_DRV_GRP(56, 0x720, 24, 2),
+	MTK_PIN_DRV_GRP(57, 0x720, 28, 2),
+	MTK_PIN_DRV_GRP(58, 0x720, 28, 2),
+	MTK_PIN_DRV_GRP(59, 0x730, 0, 2),
+	MTK_PIN_DRV_GRP(60, 0x730, 0, 2),
+	MTK_PIN_DRV_GRP(61, 0x730, 4, 2),
+	MTK_PIN_DRV_GRP(62, 0x730, 4, 2),
+	MTK_PIN_DRV_GRP(63, 0x730, 8, 2),
+	MTK_PIN_DRV_GRP(64, 0x730, 8, 2),
+	MTK_PIN_DRV_GRP(65, 0x730, 12, 2),
+	MTK_PIN_DRV_GRP(66, 0x730, 12, 2),
+	MTK_PIN_DRV_GRP(67, 0x730, 12, 2),
+	MTK_PIN_DRV_GRP(68, 0x730, 12, 2),
+	MTK_PIN_DRV_GRP(69, 0x730, 12, 2),
+	MTK_PIN_DRV_GRP(70, 0x730, 12, 2),
+	MTK_PIN_DRV_GRP(71, 0x730, 16, 2),
+	MTK_PIN_DRV_GRP(72, 0x730, 16, 2),
+	MTK_PIN_DRV_GRP(73, 0x730, 16, 2),
+	MTK_PIN_DRV_GRP(74, 0x730, 16, 2),
+	MTK_PIN_DRV_GRP(75, 0x730, 16, 2),
+	MTK_PIN_DRV_GRP(76, 0x730, 16, 2),
+	MTK_PIN_DRV_GRP(77, 0x730, 16, 2),
+	MTK_PIN_DRV_GRP(78, 0x730, 16, 2),
+	MTK_PIN_DRV_GRP(79, 0x730, 16, 2),
+	MTK_PIN_DRV_GRP(80, 0x730, 20, 2),
+	MTK_PIN_DRV_GRP(81, 0x730, 24, 2),
+	MTK_PIN_DRV_GRP(82, 0x730, 28, 2),
+	MTK_PIN_DRV_GRP(83, 0x730, 28, 2),
+	MTK_PIN_DRV_GRP(84, 0x730, 28, 2),
+	MTK_PIN_DRV_GRP(85, 0x730, 28, 2),
+	MTK_PIN_DRV_GRP(86, 0x740, 12, 2),
+	MTK_PIN_DRV_GRP(87, 0x740, 16, 2),
+	MTK_PIN_DRV_GRP(88, 0x740, 20, 2),
+	MTK_PIN_DRV_GRP(89, 0x740, 24, 2),
+	MTK_PIN_DRV_GRP(90, 0x740, 24, 2),
+	MTK_PIN_DRV_GRP(91, 0x740, 24, 2),
+	MTK_PIN_DRV_GRP(92, 0x740, 24, 2),
+	MTK_PIN_DRV_GRP(93, 0x750, 8, 2),
+	MTK_PIN_DRV_GRP(94, 0x750, 8, 2),
+	MTK_PIN_DRV_GRP(95, 0x750, 8, 2),
+	MTK_PIN_DRV_GRP(96, 0x750, 8, 2),
+	MTK_PIN_DRV_GRP(97, 0x750, 24, 2),
+	MTK_PIN_DRV_GRP(98, 0x750, 28, 2),
+	MTK_PIN_DRV_GRP(99, 0x760, 0, 2),
+	MTK_PIN_DRV_GRP(100, 0x750, 8, 2),
+	MTK_PIN_DRV_GRP(101, 0x750, 8, 2),
+	MTK_PIN_DRV_GRP(102, 0x750, 8, 2),
+	MTK_PIN_DRV_GRP(103, 0x750, 8, 2),
+	MTK_PIN_DRV_GRP(104, 0x760, 20, 2),
+	MTK_PIN_DRV_GRP(105, 0x760, 24, 2),
+	MTK_PIN_DRV_GRP(106, 0x760, 24, 2),
+	MTK_PIN_DRV_GRP(107, 0x760, 24, 2),
+	MTK_PIN_DRV_GRP(108, 0x760, 24, 2),
+	MTK_PIN_DRV_GRP(109, 0x760, 24, 2),
+	MTK_PIN_DRV_GRP(110, 0x760, 28, 2),
+	MTK_PIN_DRV_GRP(111, 0x760, 28, 2),
+	MTK_PIN_DRV_GRP(112, 0x760, 28, 2),
+	MTK_PIN_DRV_GRP(113, 0x760, 28, 2),
+	MTK_PIN_DRV_GRP(114, 0x770, 0, 2),
+	MTK_PIN_DRV_GRP(115, 0x770, 0, 2),
+	MTK_PIN_DRV_GRP(116, 0x770, 0, 2),
+	MTK_PIN_DRV_GRP(117, 0x770, 4, 2),
+	MTK_PIN_DRV_GRP(118, 0x770, 4, 2),
+	MTK_PIN_DRV_GRP(119, 0x770, 4, 2),
+	MTK_PIN_DRV_GRP(120, 0x770, 8, 2),
+	MTK_PIN_DRV_GRP(121, 0x770, 8, 2),
+	MTK_PIN_DRV_GRP(122, 0x770, 8, 2),
+	MTK_PIN_DRV_GRP(123, 0x770, 12, 2),
+	MTK_PIN_DRV_GRP(124, 0x770, 12, 2),
+	MTK_PIN_DRV_GRP(125, 0x770, 12, 2),
+	MTK_PIN_DRV_GRP(126, 0x770, 16, 2),
+	MTK_PIN_DRV_GRP(127, 0x770, 16, 2),
+	MTK_PIN_DRV_GRP(128, 0x770, 16, 2),
+	MTK_PIN_DRV_GRP(129, 0x770, 20, 2),
+	MTK_PIN_DRV_GRP(130, 0x770, 20, 2),
+	MTK_PIN_DRV_GRP(131, 0x770, 20, 2),
+	MTK_PIN_DRV_GRP(132, 0x770, 20, 2),
+	MTK_PIN_DRV_GRP(133, 0x770, 20, 2),
+	MTK_PIN_DRV_GRP(134, 0x770, 20, 2),
+	MTK_PIN_DRV_GRP(135, 0x770, 20, 2),
+	MTK_PIN_DRV_GRP(136, 0x770, 24, 2),
+	MTK_PIN_DRV_GRP(137, 0x770, 24, 2),
+	MTK_PIN_DRV_GRP(138, 0x770, 24, 2),
+	MTK_PIN_DRV_GRP(139, 0x770, 24, 2),
+	MTK_PIN_DRV_GRP(140, 0x770, 24, 2),
+	MTK_PIN_DRV_GRP(141, 0x770, 24, 2),
+	MTK_PIN_DRV_GRP(142, 0x770, 24, 2),
+	MTK_PIN_DRV_GRP(143, 0x770, 24, 2),
+	MTK_PIN_DRV_GRP(144, 0x770, 24, 2),
+};
+
+static const struct mtk_pin_spec_pupd_set_samereg mt8365_spec_pupd[] = {
+	MTK_PIN_PUPD_SPEC_SR(22, 0x070, 0, 2, 1),
+	MTK_PIN_PUPD_SPEC_SR(23, 0x070, 3, 5, 4),
+	MTK_PIN_PUPD_SPEC_SR(24, 0x070, 6, 8, 7),
+	MTK_PIN_PUPD_SPEC_SR(25, 0x070, 9, 11, 10),
+	MTK_PIN_PUPD_SPEC_SR(80, 0x070, 14, 13, 12),
+	MTK_PIN_PUPD_SPEC_SR(81, 0x070, 17, 16, 15),
+	MTK_PIN_PUPD_SPEC_SR(82, 0x070, 20, 19, 18),
+	MTK_PIN_PUPD_SPEC_SR(83, 0x070, 23, 22, 21),
+	MTK_PIN_PUPD_SPEC_SR(84, 0x070, 26, 25, 24),
+	MTK_PIN_PUPD_SPEC_SR(85, 0x070, 29, 28, 27),
+	MTK_PIN_PUPD_SPEC_SR(86, 0x080, 2, 1, 0),
+	MTK_PIN_PUPD_SPEC_SR(87, 0x080, 5, 4, 3),
+	MTK_PIN_PUPD_SPEC_SR(88, 0x080, 8, 7, 6),
+	MTK_PIN_PUPD_SPEC_SR(89, 0x080, 11, 10, 9),
+	MTK_PIN_PUPD_SPEC_SR(90, 0x080, 14, 13, 12),
+	MTK_PIN_PUPD_SPEC_SR(91, 0x080, 17, 16, 15),
+	MTK_PIN_PUPD_SPEC_SR(92, 0x080, 20, 19, 18),
+	MTK_PIN_PUPD_SPEC_SR(93, 0x080, 23, 22, 21),
+	MTK_PIN_PUPD_SPEC_SR(94, 0x080, 26, 25, 24),
+	MTK_PIN_PUPD_SPEC_SR(95, 0x080, 29, 28, 27),
+	MTK_PIN_PUPD_SPEC_SR(96, 0x090, 2, 1, 0),
+	MTK_PIN_PUPD_SPEC_SR(97, 0x090, 5, 4, 3),
+	MTK_PIN_PUPD_SPEC_SR(98, 0x090, 8, 7, 6),
+	MTK_PIN_PUPD_SPEC_SR(99, 0x090, 11, 10, 9),
+	MTK_PIN_PUPD_SPEC_SR(100, 0x090, 14, 13, 12),
+	MTK_PIN_PUPD_SPEC_SR(101, 0x090, 17, 16, 15),
+	MTK_PIN_PUPD_SPEC_SR(102, 0x090, 20, 19, 18),
+	MTK_PIN_PUPD_SPEC_SR(103, 0x090, 23, 22, 21),
+	MTK_PIN_PUPD_SPEC_SR(104, 0x090, 26, 25, 24),
+	MTK_PIN_PUPD_SPEC_SR(105, 0x090, 29, 28, 27),
+	MTK_PIN_PUPD_SPEC_SR(106, 0x0F0, 2, 1, 0),
+	MTK_PIN_PUPD_SPEC_SR(107, 0x0F0, 5, 4, 3),
+	MTK_PIN_PUPD_SPEC_SR(108, 0x0F0, 8, 7, 6),
+	MTK_PIN_PUPD_SPEC_SR(109, 0x0F0, 11, 10, 9),
+};
+
+static const struct mtk_pin_ies_smt_set mt8365_ies_set[] = {
+	MTK_PIN_IES_SMT_SPEC(0, 3, 0x410, 0),
+	MTK_PIN_IES_SMT_SPEC(4, 7, 0x410, 1),
+	MTK_PIN_IES_SMT_SPEC(8, 11, 0x410, 2),
+	MTK_PIN_IES_SMT_SPEC(12, 15, 0x410, 3),
+	MTK_PIN_IES_SMT_SPEC(16, 18, 0x410, 4),
+	MTK_PIN_IES_SMT_SPEC(19, 19, 0x410, 5),
+	MTK_PIN_IES_SMT_SPEC(20, 21, 0x410, 6),
+	MTK_PIN_IES_SMT_SPEC(22, 22, 0x410, 7),
+	MTK_PIN_IES_SMT_SPEC(23, 25, 0x410, 8),
+	MTK_PIN_IES_SMT_SPEC(26, 29, 0x410, 9),
+	MTK_PIN_IES_SMT_SPEC(30, 34, 0x410, 10),
+	MTK_PIN_IES_SMT_SPEC(35, 40, 0x410, 11),
+	MTK_PIN_IES_SMT_SPEC(41, 44, 0x410, 12),
+	MTK_PIN_IES_SMT_SPEC(45, 48, 0x410, 13),
+	MTK_PIN_IES_SMT_SPEC(49, 56, 0x410, 14),
+	MTK_PIN_IES_SMT_SPEC(57, 58, 0x410, 15),
+	MTK_PIN_IES_SMT_SPEC(59, 60, 0x410, 16),
+	MTK_PIN_IES_SMT_SPEC(61, 62, 0x410, 17),
+	MTK_PIN_IES_SMT_SPEC(63, 64, 0x410, 18),
+	MTK_PIN_IES_SMT_SPEC(65, 70, 0x410, 19),
+	MTK_PIN_IES_SMT_SPEC(71, 79, 0x410, 20),
+	MTK_PIN_IES_SMT_SPEC(80, 80, 0x410, 21),
+	MTK_PIN_IES_SMT_SPEC(81, 81, 0x410, 22),
+	MTK_PIN_IES_SMT_SPEC(82, 82, 0x410, 23),
+	MTK_PIN_IES_SMT_SPEC(83, 83, 0x410, 24),
+	MTK_PIN_IES_SMT_SPEC(84, 84, 0x410, 25),
+	MTK_PIN_IES_SMT_SPEC(85, 85, 0x410, 26),
+	MTK_PIN_IES_SMT_SPEC(86, 86, 0x410, 27),
+	MTK_PIN_IES_SMT_SPEC(87, 87, 0x410, 28),
+	MTK_PIN_IES_SMT_SPEC(88, 88, 0x410, 29),
+	MTK_PIN_IES_SMT_SPEC(89, 89, 0x410, 30),
+	MTK_PIN_IES_SMT_SPEC(90, 90, 0x410, 31),
+	MTK_PIN_IES_SMT_SPEC(91, 91, 0x420, 0),
+	MTK_PIN_IES_SMT_SPEC(92, 92, 0x420, 1),
+	MTK_PIN_IES_SMT_SPEC(93, 93, 0x420, 2),
+	MTK_PIN_IES_SMT_SPEC(94, 94, 0x420, 3),
+	MTK_PIN_IES_SMT_SPEC(95, 95, 0x420, 4),
+	MTK_PIN_IES_SMT_SPEC(96, 96, 0x420, 5),
+	MTK_PIN_IES_SMT_SPEC(97, 97, 0x420, 6),
+	MTK_PIN_IES_SMT_SPEC(98, 98, 0x420, 7),
+	MTK_PIN_IES_SMT_SPEC(99, 99, 0x420, 8),
+	MTK_PIN_IES_SMT_SPEC(100, 100, 0x420, 9),
+	MTK_PIN_IES_SMT_SPEC(101, 101, 0x420, 10),
+	MTK_PIN_IES_SMT_SPEC(102, 102, 0x420, 11),
+	MTK_PIN_IES_SMT_SPEC(103, 103, 0x420, 12),
+	MTK_PIN_IES_SMT_SPEC(104, 104, 0x420, 13),
+	MTK_PIN_IES_SMT_SPEC(105, 109, 0x420, 14),
+	MTK_PIN_IES_SMT_SPEC(110, 113, 0x420, 15),
+	MTK_PIN_IES_SMT_SPEC(114, 112, 0x420, 16),
+	MTK_PIN_IES_SMT_SPEC(117, 119, 0x420, 17),
+	MTK_PIN_IES_SMT_SPEC(120, 122, 0x420, 18),
+	MTK_PIN_IES_SMT_SPEC(123, 125, 0x420, 19),
+	MTK_PIN_IES_SMT_SPEC(126, 128, 0x420, 20),
+	MTK_PIN_IES_SMT_SPEC(129, 135, 0x420, 21),
+	MTK_PIN_IES_SMT_SPEC(136, 144, 0x420, 22),
+};
+
+static const struct mtk_pin_ies_smt_set mt8365_smt_set[] = {
+	MTK_PIN_IES_SMT_SPEC(0, 0, 0x470, 0),
+	MTK_PIN_IES_SMT_SPEC(1, 1, 0x470, 0),
+	MTK_PIN_IES_SMT_SPEC(2, 2, 0x470, 0),
+	MTK_PIN_IES_SMT_SPEC(3, 3, 0x470, 0),
+	MTK_PIN_IES_SMT_SPEC(4, 4, 0x470, 1),
+	MTK_PIN_IES_SMT_SPEC(5, 5, 0x470, 1),
+	MTK_PIN_IES_SMT_SPEC(6, 6, 0x470, 1),
+	MTK_PIN_IES_SMT_SPEC(7, 7, 0x470, 1),
+	MTK_PIN_IES_SMT_SPEC(8, 8, 0x470, 2),
+	MTK_PIN_IES_SMT_SPEC(9, 9, 0x470, 2),
+	MTK_PIN_IES_SMT_SPEC(10, 10, 0x470, 2),
+	MTK_PIN_IES_SMT_SPEC(11, 11, 0x470, 2),
+	MTK_PIN_IES_SMT_SPEC(12, 12, 0x470, 3),
+	MTK_PIN_IES_SMT_SPEC(13, 13, 0x470, 3),
+	MTK_PIN_IES_SMT_SPEC(14, 14, 0x470, 3),
+	MTK_PIN_IES_SMT_SPEC(15, 15, 0x470, 3),
+	MTK_PIN_IES_SMT_SPEC(16, 16, 0x470, 4),
+	MTK_PIN_IES_SMT_SPEC(17, 17, 0x470, 4),
+	MTK_PIN_IES_SMT_SPEC(18, 18, 0x470, 4),
+	MTK_PIN_IES_SMT_SPEC(19, 19, 0x470, 5),
+	MTK_PIN_IES_SMT_SPEC(20, 20, 0x470, 6),
+	MTK_PIN_IES_SMT_SPEC(21, 21, 0x470, 6),
+	MTK_PIN_IES_SMT_SPEC(22, 22, 0x470, 7),
+	MTK_PIN_IES_SMT_SPEC(23, 23, 0x470, 8),
+	MTK_PIN_IES_SMT_SPEC(24, 24, 0x470, 8),
+	MTK_PIN_IES_SMT_SPEC(25, 25, 0x470, 8),
+	MTK_PIN_IES_SMT_SPEC(26, 26, 0x470, 9),
+	MTK_PIN_IES_SMT_SPEC(27, 27, 0x470, 9),
+	MTK_PIN_IES_SMT_SPEC(28, 28, 0x470, 9),
+	MTK_PIN_IES_SMT_SPEC(29, 29, 0x470, 9),
+	MTK_PIN_IES_SMT_SPEC(30, 30, 0x470, 10),
+	MTK_PIN_IES_SMT_SPEC(31, 31, 0x470, 10),
+	MTK_PIN_IES_SMT_SPEC(32, 32, 0x470, 10),
+	MTK_PIN_IES_SMT_SPEC(33, 33, 0x470, 10),
+	MTK_PIN_IES_SMT_SPEC(34, 34, 0x470, 10),
+	MTK_PIN_IES_SMT_SPEC(35, 35, 0x470, 11),
+	MTK_PIN_IES_SMT_SPEC(36, 36, 0x470, 11),
+	MTK_PIN_IES_SMT_SPEC(37, 37, 0x470, 11),
+	MTK_PIN_IES_SMT_SPEC(38, 38, 0x470, 11),
+	MTK_PIN_IES_SMT_SPEC(39, 39, 0x470, 11),
+	MTK_PIN_IES_SMT_SPEC(40, 40, 0x470, 11),
+	MTK_PIN_IES_SMT_SPEC(41, 41, 0x470, 12),
+	MTK_PIN_IES_SMT_SPEC(42, 42, 0x470, 12),
+	MTK_PIN_IES_SMT_SPEC(43, 43, 0x470, 12),
+	MTK_PIN_IES_SMT_SPEC(44, 44, 0x470, 12),
+	MTK_PIN_IES_SMT_SPEC(45, 45, 0x470, 13),
+	MTK_PIN_IES_SMT_SPEC(46, 46, 0x470, 13),
+	MTK_PIN_IES_SMT_SPEC(47, 47, 0x470, 13),
+	MTK_PIN_IES_SMT_SPEC(48, 48, 0x470, 13),
+	MTK_PIN_IES_SMT_SPEC(49, 49, 0x470, 14),
+	MTK_PIN_IES_SMT_SPEC(50, 50, 0x470, 14),
+	MTK_PIN_IES_SMT_SPEC(51, 51, 0x470, 14),
+	MTK_PIN_IES_SMT_SPEC(52, 52, 0x470, 14),
+	MTK_PIN_IES_SMT_SPEC(53, 53, 0x470, 14),
+	MTK_PIN_IES_SMT_SPEC(54, 54, 0x470, 14),
+	MTK_PIN_IES_SMT_SPEC(55, 55, 0x470, 14),
+	MTK_PIN_IES_SMT_SPEC(56, 56, 0x470, 14),
+	MTK_PIN_IES_SMT_SPEC(57, 57, 0x470, 15),
+	MTK_PIN_IES_SMT_SPEC(58, 58, 0x470, 15),
+	MTK_PIN_IES_SMT_SPEC(59, 59, 0x470, 16),
+	MTK_PIN_IES_SMT_SPEC(60, 60, 0x470, 16),
+	MTK_PIN_IES_SMT_SPEC(61, 61, 0x470, 17),
+	MTK_PIN_IES_SMT_SPEC(62, 62, 0x470, 17),
+	MTK_PIN_IES_SMT_SPEC(63, 63, 0x470, 18),
+	MTK_PIN_IES_SMT_SPEC(64, 64, 0x470, 18),
+	MTK_PIN_IES_SMT_SPEC(65, 65, 0x470, 19),
+	MTK_PIN_IES_SMT_SPEC(66, 66, 0x470, 19),
+	MTK_PIN_IES_SMT_SPEC(67, 67, 0x470, 19),
+	MTK_PIN_IES_SMT_SPEC(68, 68, 0x470, 19),
+	MTK_PIN_IES_SMT_SPEC(69, 69, 0x470, 19),
+	MTK_PIN_IES_SMT_SPEC(70, 70, 0x470, 19),
+	MTK_PIN_IES_SMT_SPEC(71, 71, 0x470, 20),
+	MTK_PIN_IES_SMT_SPEC(72, 72, 0x470, 20),
+	MTK_PIN_IES_SMT_SPEC(73, 73, 0x470, 20),
+	MTK_PIN_IES_SMT_SPEC(74, 74, 0x470, 20),
+	MTK_PIN_IES_SMT_SPEC(75, 75, 0x470, 20),
+	MTK_PIN_IES_SMT_SPEC(76, 76, 0x470, 20),
+	MTK_PIN_IES_SMT_SPEC(77, 77, 0x470, 20),
+	MTK_PIN_IES_SMT_SPEC(78, 78, 0x470, 20),
+	MTK_PIN_IES_SMT_SPEC(79, 79, 0x470, 20),
+	MTK_PIN_IES_SMT_SPEC(80, 80, 0x470, 21),
+	MTK_PIN_IES_SMT_SPEC(81, 81, 0x470, 22),
+	MTK_PIN_IES_SMT_SPEC(82, 82, 0x470, 23),
+	MTK_PIN_IES_SMT_SPEC(83, 83, 0x470, 24),
+	MTK_PIN_IES_SMT_SPEC(84, 84, 0x470, 25),
+	MTK_PIN_IES_SMT_SPEC(85, 85, 0x470, 26),
+	MTK_PIN_IES_SMT_SPEC(86, 86, 0x470, 27),
+	MTK_PIN_IES_SMT_SPEC(87, 87, 0x470, 28),
+	MTK_PIN_IES_SMT_SPEC(88, 88, 0x470, 29),
+	MTK_PIN_IES_SMT_SPEC(89, 89, 0x470, 30),
+	MTK_PIN_IES_SMT_SPEC(90, 90, 0x470, 31),
+	MTK_PIN_IES_SMT_SPEC(91, 91, 0x480, 0),
+	MTK_PIN_IES_SMT_SPEC(92, 92, 0x480, 1),
+	MTK_PIN_IES_SMT_SPEC(93, 93, 0x480, 2),
+	MTK_PIN_IES_SMT_SPEC(94, 94, 0x480, 3),
+	MTK_PIN_IES_SMT_SPEC(95, 95, 0x480, 4),
+	MTK_PIN_IES_SMT_SPEC(96, 96, 0x480, 5),
+	MTK_PIN_IES_SMT_SPEC(97, 97, 0x480, 6),
+	MTK_PIN_IES_SMT_SPEC(98, 98, 0x480, 7),
+	MTK_PIN_IES_SMT_SPEC(99, 99, 0x480, 8),
+	MTK_PIN_IES_SMT_SPEC(100, 100, 0x480, 9),
+	MTK_PIN_IES_SMT_SPEC(101, 101, 0x480, 10),
+	MTK_PIN_IES_SMT_SPEC(102, 102, 0x480, 11),
+	MTK_PIN_IES_SMT_SPEC(103, 103, 0x480, 12),
+	MTK_PIN_IES_SMT_SPEC(104, 104, 0x480, 13),
+	MTK_PIN_IES_SMT_SPEC(105, 105, 0x480, 14),
+	MTK_PIN_IES_SMT_SPEC(106, 106, 0x480, 14),
+	MTK_PIN_IES_SMT_SPEC(107, 107, 0x480, 14),
+	MTK_PIN_IES_SMT_SPEC(108, 108, 0x480, 14),
+	MTK_PIN_IES_SMT_SPEC(109, 109, 0x480, 14),
+	MTK_PIN_IES_SMT_SPEC(110, 110, 0x480, 15),
+	MTK_PIN_IES_SMT_SPEC(111, 111, 0x480, 15),
+	MTK_PIN_IES_SMT_SPEC(112, 112, 0x480, 15),
+	MTK_PIN_IES_SMT_SPEC(113, 113, 0x480, 15),
+	MTK_PIN_IES_SMT_SPEC(114, 114, 0x480, 16),
+	MTK_PIN_IES_SMT_SPEC(115, 115, 0x480, 16),
+	MTK_PIN_IES_SMT_SPEC(116, 116, 0x480, 16),
+	MTK_PIN_IES_SMT_SPEC(117, 117, 0x480, 17),
+	MTK_PIN_IES_SMT_SPEC(118, 118, 0x480, 17),
+	MTK_PIN_IES_SMT_SPEC(119, 119, 0x480, 17),
+	MTK_PIN_IES_SMT_SPEC(120, 120, 0x480, 18),
+	MTK_PIN_IES_SMT_SPEC(121, 121, 0x480, 18),
+	MTK_PIN_IES_SMT_SPEC(122, 122, 0x480, 18),
+	MTK_PIN_IES_SMT_SPEC(123, 123, 0x480, 19),
+	MTK_PIN_IES_SMT_SPEC(124, 124, 0x480, 19),
+	MTK_PIN_IES_SMT_SPEC(125, 125, 0x480, 19),
+	MTK_PIN_IES_SMT_SPEC(126, 126, 0x480, 20),
+	MTK_PIN_IES_SMT_SPEC(127, 127, 0x480, 20),
+	MTK_PIN_IES_SMT_SPEC(128, 128, 0x480, 20),
+	MTK_PIN_IES_SMT_SPEC(129, 129, 0x480, 21),
+	MTK_PIN_IES_SMT_SPEC(130, 130, 0x480, 21),
+	MTK_PIN_IES_SMT_SPEC(131, 131, 0x480, 21),
+	MTK_PIN_IES_SMT_SPEC(132, 132, 0x480, 21),
+	MTK_PIN_IES_SMT_SPEC(133, 133, 0x480, 21),
+	MTK_PIN_IES_SMT_SPEC(134, 134, 0x480, 21),
+	MTK_PIN_IES_SMT_SPEC(135, 135, 0x480, 21),
+	MTK_PIN_IES_SMT_SPEC(136, 136, 0x480, 22),
+	MTK_PIN_IES_SMT_SPEC(137, 137, 0x480, 22),
+	MTK_PIN_IES_SMT_SPEC(138, 138, 0x480, 22),
+	MTK_PIN_IES_SMT_SPEC(139, 139, 0x480, 22),
+	MTK_PIN_IES_SMT_SPEC(140, 140, 0x480, 22),
+	MTK_PIN_IES_SMT_SPEC(141, 141, 0x480, 22),
+	MTK_PIN_IES_SMT_SPEC(142, 142, 0x480, 22),
+	MTK_PIN_IES_SMT_SPEC(143, 143, 0x480, 22),
+	MTK_PIN_IES_SMT_SPEC(144, 144, 0x480, 22),
+};
+
+static int mt8365_spec_pull_set(struct regmap *regmap, unsigned int pin,
+			unsigned char align, bool isup, unsigned int r1r0)
+{
+	return mtk_pctrl_spec_pull_set_samereg(regmap, mt8365_spec_pupd,
+		ARRAY_SIZE(mt8365_spec_pupd), pin, align, isup, r1r0);
+}
+
+static int mt8365_ies_smt_set(struct regmap *regmap, unsigned int pin,
+		unsigned char align, int value, enum pin_config_param arg)
+{
+	if (arg == PIN_CONFIG_INPUT_ENABLE)
+		return mtk_pconf_spec_set_ies_smt_range(regmap, mt8365_ies_set,
+			ARRAY_SIZE(mt8365_ies_set), pin, align, value);
+	else if (arg == PIN_CONFIG_INPUT_SCHMITT_ENABLE)
+		return mtk_pconf_spec_set_ies_smt_range(regmap, mt8365_smt_set,
+			ARRAY_SIZE(mt8365_smt_set), pin, align, value);
+	return -EINVAL;
+}
+
+static const struct mtk_pinctrl_devdata mt8365_pinctrl_data = {
+	.pins = mtk_pins_mt8365,
+	.npins = ARRAY_SIZE(mtk_pins_mt8365),
+	.grp_desc = mt8365_drv_grp,
+	.n_grp_cls = ARRAY_SIZE(mt8365_drv_grp),
+	.pin_drv_grp = mt8365_pin_drv,
+	.n_pin_drv_grps = ARRAY_SIZE(mt8365_pin_drv),
+	.spec_pull_set = mt8365_spec_pull_set,
+	.spec_ies_smt_set = mt8365_ies_smt_set,
+	.dir_offset = 0x0140,
+	.dout_offset = 0x00A0,
+	.din_offset = 0x0000,
+	.pinmux_offset = 0x01E0,
+	.ies_offset = 0x0410,
+	.smt_offset = 0x0470,
+	.pullen_offset = 0x0860,
+	.pullsel_offset = 0x0900,
+	.drv_offset = 0x0710,
+	.type1_start = 145,
+	.type1_end = 145,
+	.port_shf = 4,
+	.port_mask = 0x1f,
+	.port_align = 4,
+	.mode_mask = 0x1f,
+	.mode_per_reg = 10,
+	.mode_shf = 5,
+	.eint_hw = {
+		.port_mask = 7,
+		.ports     = 5,
+		.ap_num = 160,
+		.db_cnt = 160,
+	},
+};
+
+static int mtk_pinctrl_probe(struct platform_device *pdev)
+{
+	return mtk_pctrl_init(pdev, &mt8365_pinctrl_data, NULL);
+}
+
+static const struct of_device_id mt8365_pctrl_match[] = {
+	{
+		.compatible = "mediatek,mt8365-pinctrl",
+	},
+	{}
+};
+
+static struct platform_driver mtk_pinctrl_driver = {
+	.probe = mtk_pinctrl_probe,
+	.driver = {
+		.name = "mediatek-mt8365-pinctrl",
+		.owner = THIS_MODULE,
+		.of_match_table = mt8365_pctrl_match,
+		.pm = &mtk_eint_pm_ops,
+	},
+};
+
+static int __init mtk_pinctrl_init(void)
+{
+	return platform_driver_register(&mtk_pinctrl_driver);
+}
+arch_initcall(mtk_pinctrl_init);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MediaTek MT8365 Pinctrl Driver");
+MODULE_AUTHOR("Zhiyong Tao <zhiyong.tao@mediatek.com>");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8365.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8365.h
new file mode 100644
index 000000000000..39e17532c460
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8365.h
@@ -0,0 +1,1511 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2018 MediaTek Inc.
+ * Author: Zhiyong Tao <zhiyong.tao@mediatek.com>
+ *
+ */
+
+#ifndef __PINCTRL_MTK_MT8365_H
+#define __PINCTRL_MTK_MT8365_H
+
+#include <linux/pinctrl/pinctrl.h>
+#include "pinctrl-mtk-common.h"
+
+static const struct mtk_desc_pin mtk_pins_mt8365[] = {
+	MTK_PIN(
+		PINCTRL_PIN(0, "GPIO0"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 0),
+		MTK_FUNCTION(0, "GPIO0"),
+		MTK_FUNCTION(1, "DPI_D0"),
+		MTK_FUNCTION(2, "PWM_A"),
+		MTK_FUNCTION(3, "I2S2_BCK"),
+		MTK_FUNCTION(4, "EXT_TXD0"),
+		MTK_FUNCTION(5, "CONN_MCU_TDO"),
+		MTK_FUNCTION(7, "DBG_MON_A0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(1, "GPIO1"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 1),
+		MTK_FUNCTION(0, "GPIO1"),
+		MTK_FUNCTION(1, "DPI_D1"),
+		MTK_FUNCTION(2, "PWM_B"),
+		MTK_FUNCTION(3, "I2S2_LRCK"),
+		MTK_FUNCTION(4, "EXT_TXD1"),
+		MTK_FUNCTION(5, "CONN_MCU_DBGACK_N"),
+		MTK_FUNCTION(7, "DBG_MON_A1")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(2, "GPIO2"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 2),
+		MTK_FUNCTION(0, "GPIO2"),
+		MTK_FUNCTION(1, "DPI_D2"),
+		MTK_FUNCTION(2, "PWM_C"),
+		MTK_FUNCTION(3, "I2S2_MCK"),
+		MTK_FUNCTION(4, "EXT_TXD2"),
+		MTK_FUNCTION(5, "CONN_MCU_DBGI_N"),
+		MTK_FUNCTION(7, "DBG_MON_A2")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(3, "GPIO3"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 3),
+		MTK_FUNCTION(0, "GPIO3"),
+		MTK_FUNCTION(1, "DPI_D3"),
+		MTK_FUNCTION(2, "CLKM0"),
+		MTK_FUNCTION(3, "I2S2_DI"),
+		MTK_FUNCTION(4, "EXT_TXD3"),
+		MTK_FUNCTION(5, "CONN_MCU_TCK"),
+		MTK_FUNCTION(6, "CONN_MCU_AICE_TCKC"),
+		MTK_FUNCTION(7, "DBG_MON_A3")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(4, "GPIO4"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 4),
+		MTK_FUNCTION(0, "GPIO4"),
+		MTK_FUNCTION(1, "DPI_D4"),
+		MTK_FUNCTION(2, "CLKM1"),
+		MTK_FUNCTION(3, "I2S1_BCK"),
+		MTK_FUNCTION(4, "EXT_TXC"),
+		MTK_FUNCTION(5, "CONN_MCU_TDI"),
+		MTK_FUNCTION(6, "VDEC_TEST_CK"),
+		MTK_FUNCTION(7, "DBG_MON_A4")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(5, "GPIO5"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 5),
+		MTK_FUNCTION(0, "GPIO5"),
+		MTK_FUNCTION(1, "DPI_D5"),
+		MTK_FUNCTION(2, "CLKM2"),
+		MTK_FUNCTION(3, "I2S1_LRCK"),
+		MTK_FUNCTION(4, "EXT_RXER"),
+		MTK_FUNCTION(5, "CONN_MCU_TRST_B"),
+		MTK_FUNCTION(6, "MM_TEST_CK"),
+		MTK_FUNCTION(7, "DBG_MON_A5")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(6, "GPIO6"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 6),
+		MTK_FUNCTION(0, "GPIO6"),
+		MTK_FUNCTION(1, "DPI_D6"),
+		MTK_FUNCTION(2, "CLKM3"),
+		MTK_FUNCTION(3, "I2S1_MCK"),
+		MTK_FUNCTION(4, "EXT_RXC"),
+		MTK_FUNCTION(5, "CONN_MCU_TMS"),
+		MTK_FUNCTION(6, "CONN_MCU_AICE_TMSC"),
+		MTK_FUNCTION(7, "DBG_MON_A6")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(7, "GPIO7"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 7),
+		MTK_FUNCTION(0, "GPIO7"),
+		MTK_FUNCTION(1, "DPI_D7"),
+		MTK_FUNCTION(3, "I2S1_DO"),
+		MTK_FUNCTION(4, "EXT_RXDV"),
+		MTK_FUNCTION(5, "CONN_DSP_JCK"),
+		MTK_FUNCTION(7, "DBG_MON_A7")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(8, "GPIO8"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 8),
+		MTK_FUNCTION(0, "GPIO8"),
+		MTK_FUNCTION(1, "DPI_D8"),
+		MTK_FUNCTION(2, "SPI_CLK"),
+		MTK_FUNCTION(3, "I2S0_BCK"),
+		MTK_FUNCTION(4, "EXT_RXD0"),
+		MTK_FUNCTION(5, "CONN_DSP_JINTP"),
+		MTK_FUNCTION(7, "DBG_MON_A8")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(9, "GPIO9"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 9),
+		MTK_FUNCTION(0, "GPIO9"),
+		MTK_FUNCTION(1, "DPI_D9"),
+		MTK_FUNCTION(2, "SPI_CSB"),
+		MTK_FUNCTION(3, "I2S0_LRCK"),
+		MTK_FUNCTION(4, "EXT_RXD1"),
+		MTK_FUNCTION(5, "CONN_DSP_JDI"),
+		MTK_FUNCTION(7, "DBG_MON_A9")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(10, "GPIO10"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 10),
+		MTK_FUNCTION(0, "GPIO10"),
+		MTK_FUNCTION(1, "DPI_D10"),
+		MTK_FUNCTION(2, "SPI_MI"),
+		MTK_FUNCTION(3, "I2S0_MCK"),
+		MTK_FUNCTION(4, "EXT_RXD2"),
+		MTK_FUNCTION(5, "CONN_DSP_JMS"),
+		MTK_FUNCTION(7, "DBG_MON_A10")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(11, "GPIO11"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 11),
+		MTK_FUNCTION(0, "GPIO11"),
+		MTK_FUNCTION(1, "DPI_D11"),
+		MTK_FUNCTION(2, "SPI_MO"),
+		MTK_FUNCTION(3, "I2S0_DI"),
+		MTK_FUNCTION(4, "EXT_RXD3"),
+		MTK_FUNCTION(5, "CONN_DSP_JDO"),
+		MTK_FUNCTION(7, "DBG_MON_A11")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(12, "GPIO12"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 12),
+		MTK_FUNCTION(0, "GPIO12"),
+		MTK_FUNCTION(1, "DPI_DE"),
+		MTK_FUNCTION(2, "UCTS1"),
+		MTK_FUNCTION(3, "I2S3_BCK"),
+		MTK_FUNCTION(4, "EXT_TXEN"),
+		MTK_FUNCTION(5, "O_WIFI_TXD"),
+		MTK_FUNCTION(7, "DBG_MON_A12")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(13, "GPIO13"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 13),
+		MTK_FUNCTION(0, "GPIO13"),
+		MTK_FUNCTION(1, "DPI_VSYNC"),
+		MTK_FUNCTION(2, "URTS1"),
+		MTK_FUNCTION(3, "I2S3_LRCK"),
+		MTK_FUNCTION(4, "EXT_COL"),
+		MTK_FUNCTION(5, "SPDIF_IN"),
+		MTK_FUNCTION(7, "DBG_MON_A13")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(14, "GPIO14"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 14),
+		MTK_FUNCTION(0, "GPIO14"),
+		MTK_FUNCTION(1, "DPI_CK"),
+		MTK_FUNCTION(2, "UCTS2"),
+		MTK_FUNCTION(3, "I2S3_MCK"),
+		MTK_FUNCTION(4, "EXT_MDIO"),
+		MTK_FUNCTION(5, "SPDIF_OUT"),
+		MTK_FUNCTION(6, "DVFSRC_EXT_REQ"),
+		MTK_FUNCTION(7, "DBG_MON_A14")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(15, "GPIO15"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 15),
+		MTK_FUNCTION(0, "GPIO15"),
+		MTK_FUNCTION(1, "DPI_HSYNC"),
+		MTK_FUNCTION(2, "URTS2"),
+		MTK_FUNCTION(3, "I2S3_DO"),
+		MTK_FUNCTION(4, "EXT_MDC"),
+		MTK_FUNCTION(5, "IRRX"),
+		MTK_FUNCTION(6, "EXT_FRAME_SYNC"),
+		MTK_FUNCTION(7, "DBG_MON_A15")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(16, "GPIO16"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 16),
+		MTK_FUNCTION(0, "GPIO16"),
+		MTK_FUNCTION(1, "DPI_D12"),
+		MTK_FUNCTION(2, "USB_DRVVBUS"),
+		MTK_FUNCTION(3, "PWM_A"),
+		MTK_FUNCTION(4, "CLKM0"),
+		MTK_FUNCTION(5, "ANT_SEL0"),
+		MTK_FUNCTION(6, "TSF_IN"),
+		MTK_FUNCTION(7, "DBG_MON_A16")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(17, "GPIO17"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 17),
+		MTK_FUNCTION(0, "GPIO17"),
+		MTK_FUNCTION(1, "DPI_D13"),
+		MTK_FUNCTION(2, "IDDIG"),
+		MTK_FUNCTION(3, "PWM_B"),
+		MTK_FUNCTION(4, "CLKM1"),
+		MTK_FUNCTION(5, "ANT_SEL1"),
+		MTK_FUNCTION(6, "DVFSRC_EXT_REQ"),
+		MTK_FUNCTION(7, "DBG_MON_A17")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(18, "GPIO18"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 18),
+		MTK_FUNCTION(0, "GPIO18"),
+		MTK_FUNCTION(1, "DPI_D14"),
+		MTK_FUNCTION(2, "EXT_FRAME_SYNC"),
+		MTK_FUNCTION(3, "PWM_C"),
+		MTK_FUNCTION(4, "CLKM2"),
+		MTK_FUNCTION(5, "ANT_SEL2"),
+		MTK_FUNCTION(6, "MFG_TEST_CK"),
+		MTK_FUNCTION(7, "DBG_MON_A18")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(19, "DISP_PWM"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 19),
+		MTK_FUNCTION(0, "GPIO19"),
+		MTK_FUNCTION(1, "DISP_PWM"),
+		MTK_FUNCTION(2, "PWM_A"),
+		MTK_FUNCTION(7, "DBG_MON_A19")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(20, "LCM_RST"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 20),
+		MTK_FUNCTION(0, "GPIO20"),
+		MTK_FUNCTION(1, "LCM_RST"),
+		MTK_FUNCTION(2, "PWM_B"),
+		MTK_FUNCTION(7, "DBG_MON_A20")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(21, "DSI_TE"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 21),
+		MTK_FUNCTION(0, "GPIO21"),
+		MTK_FUNCTION(1, "DSI_TE"),
+		MTK_FUNCTION(2, "PWM_C"),
+		MTK_FUNCTION(3, "ANT_SEL0"),
+		MTK_FUNCTION(4, "DVFSRC_EXT_REQ"),
+		MTK_FUNCTION(7, "DBG_MON_A21")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(22, "KPROW0"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 22),
+		MTK_FUNCTION(0, "GPIO22"),
+		MTK_FUNCTION(1, "KPROW0"),
+		MTK_FUNCTION(7, "DBG_MON_A22")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(23, "KPROW1"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 23),
+		MTK_FUNCTION(0, "GPIO23"),
+		MTK_FUNCTION(1, "KPROW1"),
+		MTK_FUNCTION(2, "IDDIG"),
+		MTK_FUNCTION(3, "WIFI_TXD"),
+		MTK_FUNCTION(4, "CLKM3"),
+		MTK_FUNCTION(5, "ANT_SEL1"),
+		MTK_FUNCTION(6, "EXT_FRAME_SYNC"),
+		MTK_FUNCTION(7, "DBG_MON_B0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(24, "KPCOL0"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 24),
+		MTK_FUNCTION(0, "GPIO24"),
+		MTK_FUNCTION(1, "KPCOL0"),
+		MTK_FUNCTION(7, "DBG_MON_A23")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(25, "KPCOL1"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 25),
+		MTK_FUNCTION(0, "GPIO25"),
+		MTK_FUNCTION(1, "KPCOL1"),
+		MTK_FUNCTION(2, "USB_DRVVBUS"),
+		MTK_FUNCTION(3, "APU_JTAG_TRST"),
+		MTK_FUNCTION(4, "UDI_NTRST_XI"),
+		MTK_FUNCTION(5, "DFD_NTRST_XI"),
+		MTK_FUNCTION(6, "CONN_TEST_CK"),
+		MTK_FUNCTION(7, "DBG_MON_B1")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(26, "SPI_CS"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 26),
+		MTK_FUNCTION(0, "GPIO26"),
+		MTK_FUNCTION(1, "SPI_CSB"),
+		MTK_FUNCTION(3, "APU_JTAG_TMS"),
+		MTK_FUNCTION(4, "UDI_TMS_XI"),
+		MTK_FUNCTION(5, "DFD_TMS_XI"),
+		MTK_FUNCTION(6, "CONN_TEST_CK"),
+		MTK_FUNCTION(7, "DBG_MON_A24")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(27, "SPI_CK"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 27),
+		MTK_FUNCTION(0, "GPIO27"),
+		MTK_FUNCTION(1, "SPI_CLK"),
+		MTK_FUNCTION(3, "APU_JTAG_TCK"),
+		MTK_FUNCTION(4, "UDI_TCK_XI"),
+		MTK_FUNCTION(5, "DFD_TCK_XI"),
+		MTK_FUNCTION(6, "APU_TEST_CK"),
+		MTK_FUNCTION(7, "DBG_MON_A25")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(28, "SPI_MI"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 28),
+		MTK_FUNCTION(0, "GPIO28"),
+		MTK_FUNCTION(1, "SPI_MI"),
+		MTK_FUNCTION(2, "SPI_MO"),
+		MTK_FUNCTION(3, "APU_JTAG_TDI"),
+		MTK_FUNCTION(4, "UDI_TDI_XI"),
+		MTK_FUNCTION(5, "DFD_TDI_XI"),
+		MTK_FUNCTION(6, "DSP_TEST_CK"),
+		MTK_FUNCTION(7, "DBG_MON_A26")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(29, "SPI_MO"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 29),
+		MTK_FUNCTION(0, "GPIO29"),
+		MTK_FUNCTION(1, "SPI_MO"),
+		MTK_FUNCTION(2, "SPI_MI"),
+		MTK_FUNCTION(3, "APU_JTAG_TDO"),
+		MTK_FUNCTION(4, "UDI_TDO"),
+		MTK_FUNCTION(5, "DFD_TDO"),
+		MTK_FUNCTION(6, "DVFSRC_EXT_REQ"),
+		MTK_FUNCTION(7, "DBG_MON_A27")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(30, "JTMS"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 30),
+		MTK_FUNCTION(0, "GPIO30"),
+		MTK_FUNCTION(1, "JTMS"),
+		MTK_FUNCTION(2, "DFD_TMS_XI"),
+		MTK_FUNCTION(3, "UDI_TMS_XI"),
+		MTK_FUNCTION(4, "MCU_SPM_TMS"),
+		MTK_FUNCTION(5, "CONN_MCU_TMS"),
+		MTK_FUNCTION(6, "CONN_MCU_AICE_TMSC")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(31, "JTCK"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 31),
+		MTK_FUNCTION(0, "GPIO31"),
+		MTK_FUNCTION(1, "JTCK"),
+		MTK_FUNCTION(2, "DFD_TCK_XI"),
+		MTK_FUNCTION(3, "UDI_TCK_XI"),
+		MTK_FUNCTION(4, "MCU_SPM_TCK"),
+		MTK_FUNCTION(5, "CONN_MCU_TCK"),
+		MTK_FUNCTION(6, "CONN_MCU_AICE_TCKC")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(32, "JTDI"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 32),
+		MTK_FUNCTION(0, "GPIO32"),
+		MTK_FUNCTION(1, "JTDI"),
+		MTK_FUNCTION(2, "DFD_TDI_XI"),
+		MTK_FUNCTION(3, "UDI_TDI_XI"),
+		MTK_FUNCTION(4, "MCU_SPM_TDI"),
+		MTK_FUNCTION(5, "CONN_MCU_TDI")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(33, "JTDO"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 33),
+		MTK_FUNCTION(0, "GPIO33"),
+		MTK_FUNCTION(1, "JTDO"),
+		MTK_FUNCTION(2, "DFD_TDO"),
+		MTK_FUNCTION(3, "UDI_TDO"),
+		MTK_FUNCTION(4, "MCU_SPM_TDO"),
+		MTK_FUNCTION(5, "CONN_MCU_TDO")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(34, "JTRST"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 34),
+		MTK_FUNCTION(0, "GPIO34"),
+		MTK_FUNCTION(1, "JTRST"),
+		MTK_FUNCTION(2, "DFD_NTRST_XI"),
+		MTK_FUNCTION(3, "UDI_NTRST_XI"),
+		MTK_FUNCTION(4, "MCU_SPM_NTRST"),
+		MTK_FUNCTION(5, "CONN_MCU_TRST_B")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(35, "URXD0"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 35),
+		MTK_FUNCTION(0, "GPIO35"),
+		MTK_FUNCTION(1, "URXD0"),
+		MTK_FUNCTION(2, "UTXD0"),
+		MTK_FUNCTION(7, "DSP_URXD0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(36, "UTXD0"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 36),
+		MTK_FUNCTION(0, "GPIO36"),
+		MTK_FUNCTION(1, "UTXD0"),
+		MTK_FUNCTION(2, "URXD0"),
+		MTK_FUNCTION(7, "DSP_UTXD0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(37, "URXD1"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 37),
+		MTK_FUNCTION(0, "GPIO37"),
+		MTK_FUNCTION(1, "URXD1"),
+		MTK_FUNCTION(2, "UTXD1"),
+		MTK_FUNCTION(3, "UCTS2"),
+		MTK_FUNCTION(4, "DVFSRC_EXT_REQ"),
+		MTK_FUNCTION(5, "CONN_UART0_RXD"),
+		MTK_FUNCTION(6, "I2S0_MCK"),
+		MTK_FUNCTION(7, "DSP_URXD0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(38, "UTXD1"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 38),
+		MTK_FUNCTION(0, "GPIO38"),
+		MTK_FUNCTION(1, "UTXD1"),
+		MTK_FUNCTION(2, "URXD1"),
+		MTK_FUNCTION(3, "URTS2"),
+		MTK_FUNCTION(4, "ANT_SEL2"),
+		MTK_FUNCTION(5, "CONN_UART0_TXD"),
+		MTK_FUNCTION(6, "I2S1_MCK"),
+		MTK_FUNCTION(7, "DSP_UTXD0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(39, "URXD2"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 39),
+		MTK_FUNCTION(0, "GPIO39"),
+		MTK_FUNCTION(1, "URXD2"),
+		MTK_FUNCTION(2, "UTXD2"),
+		MTK_FUNCTION(3, "UCTS1"),
+		MTK_FUNCTION(4, "IDDIG"),
+		MTK_FUNCTION(5, "CONN_MCU_DBGACK_N"),
+		MTK_FUNCTION(6, "I2S2_MCK"),
+		MTK_FUNCTION(7, "DSP_URXD0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(40, "UTXD2"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 40),
+		MTK_FUNCTION(0, "GPIO40"),
+		MTK_FUNCTION(1, "UTXD2"),
+		MTK_FUNCTION(2, "URXD2"),
+		MTK_FUNCTION(3, "URTS1"),
+		MTK_FUNCTION(4, "USB_DRVVBUS"),
+		MTK_FUNCTION(5, "CONN_MCU_DBGI_N"),
+		MTK_FUNCTION(6, "I2S3_MCK"),
+		MTK_FUNCTION(7, "DSP_UTXD0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(41, "PWRAP_SPI0_MI"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 41),
+		MTK_FUNCTION(0, "GPIO41"),
+		MTK_FUNCTION(1, "PWRAP_SPI0_MI"),
+		MTK_FUNCTION(2, "PWRAP_SPI0_MO")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(42, "PWRAP_SPI0_MO"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 42),
+		MTK_FUNCTION(0, "GPIO42"),
+		MTK_FUNCTION(1, "PWRAP_SPI0_MO"),
+		MTK_FUNCTION(2, "PWRAP_SPI0_MI")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(43, "PWRAP_SPI0_CK"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 43),
+		MTK_FUNCTION(0, "GPIO43"),
+		MTK_FUNCTION(1, "PWRAP_SPI0_CK")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(44, "PWRAP_SPI0_CSN"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 44),
+		MTK_FUNCTION(0, "GPIO44"),
+		MTK_FUNCTION(1, "PWRAP_SPI0_CSN")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(45, "RTC32K_CK"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 45),
+		MTK_FUNCTION(0, "GPIO45"),
+		MTK_FUNCTION(1, "RTC32K_CK")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(46, "WATCHDOG"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 46),
+		MTK_FUNCTION(0, "GPIO46"),
+		MTK_FUNCTION(1, "WATCHDOG")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(47, "SRCLKENA0"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 47),
+		MTK_FUNCTION(0, "GPIO47"),
+		MTK_FUNCTION(1, "SRCLKENA0"),
+		MTK_FUNCTION(2, "SRCLKENA1")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(48, "SRCLKENA1"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 48),
+		MTK_FUNCTION(0, "GPIO48"),
+		MTK_FUNCTION(1, "SRCLKENA1")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(49, "AUD_CLK_MOSI"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 49),
+		MTK_FUNCTION(0, "GPIO49"),
+		MTK_FUNCTION(1, "AUD_CLK_MOSI"),
+		MTK_FUNCTION(2, "AUD_CLK_MISO"),
+		MTK_FUNCTION(3, "I2S1_MCK")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(50, "AUD_SYNC_MOSI"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 50),
+		MTK_FUNCTION(0, "GPIO50"),
+		MTK_FUNCTION(1, "AUD_SYNC_MOSI"),
+		MTK_FUNCTION(2, "AUD_SYNC_MISO"),
+		MTK_FUNCTION(3, "I2S1_BCK")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(51, "AUD_DAT_MOSI0"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 51),
+		MTK_FUNCTION(0, "GPIO51"),
+		MTK_FUNCTION(1, "AUD_DAT_MOSI0"),
+		MTK_FUNCTION(2, "AUD_DAT_MISO0"),
+		MTK_FUNCTION(3, "I2S1_LRCK")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(52, "AUD_DAT_MOSI1"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 52),
+		MTK_FUNCTION(0, "GPIO52"),
+		MTK_FUNCTION(1, "AUD_DAT_MOSI1"),
+		MTK_FUNCTION(2, "AUD_DAT_MISO1"),
+		MTK_FUNCTION(3, "I2S1_DO")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(53, "AUD_CLK_MISO"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 53),
+		MTK_FUNCTION(0, "GPIO53"),
+		MTK_FUNCTION(1, "AUD_CLK_MISO"),
+		MTK_FUNCTION(2, "AUD_CLK_MOSI"),
+		MTK_FUNCTION(3, "I2S2_MCK")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(54, "AUD_SYNC_MISO"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 54),
+		MTK_FUNCTION(0, "GPIO54"),
+		MTK_FUNCTION(1, "AUD_SYNC_MISO"),
+		MTK_FUNCTION(2, "AUD_SYNC_MOSI"),
+		MTK_FUNCTION(3, "I2S2_BCK")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(55, "AUD_DAT_MISO0"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 55),
+		MTK_FUNCTION(0, "GPIO55"),
+		MTK_FUNCTION(1, "AUD_DAT_MISO0"),
+		MTK_FUNCTION(2, "AUD_DAT_MOSI0"),
+		MTK_FUNCTION(3, "I2S2_LRCK")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(56, "AUD_DAT_MISO1"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 56),
+		MTK_FUNCTION(0, "GPIO56"),
+		MTK_FUNCTION(1, "AUD_DAT_MISO1"),
+		MTK_FUNCTION(2, "AUD_DAT_MOSI1"),
+		MTK_FUNCTION(3, "I2S2_DI")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(57, "SDA0"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 57),
+		MTK_FUNCTION(0, "GPIO57"),
+		MTK_FUNCTION(1, "SDA0_0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(58, "SCL0"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 58),
+		MTK_FUNCTION(0, "GPIO58"),
+		MTK_FUNCTION(1, "SCL0_0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(59, "SDA1"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 59),
+		MTK_FUNCTION(0, "GPIO59"),
+		MTK_FUNCTION(1, "SDA1_0"),
+		MTK_FUNCTION(6, "USB_SDA"),
+		MTK_FUNCTION(7, "DBG_SDA")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(60, "SCL1"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 60),
+		MTK_FUNCTION(0, "GPIO60"),
+		MTK_FUNCTION(1, "SCL1_0"),
+		MTK_FUNCTION(6, "USB_SCL"),
+		MTK_FUNCTION(7, "DBG_SCL")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(61, "SDA2"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 61),
+		MTK_FUNCTION(0, "GPIO61"),
+		MTK_FUNCTION(1, "SDA2_0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(62, "SCL2"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 62),
+		MTK_FUNCTION(0, "GPIO62"),
+		MTK_FUNCTION(1, "SCL2_0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(63, "SDA3"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 63),
+		MTK_FUNCTION(0, "GPIO63"),
+		MTK_FUNCTION(1, "SDA3_0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(64, "SCL3"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 64),
+		MTK_FUNCTION(0, "GPIO64"),
+		MTK_FUNCTION(1, "SCL3_0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(65, "CMMCLK0"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 65),
+		MTK_FUNCTION(0, "GPIO65"),
+		MTK_FUNCTION(1, "CMMCLK0"),
+		MTK_FUNCTION(2, "CMMCLK1"),
+		MTK_FUNCTION(7, "DBG_MON_A28")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(66, "CMMCLK1"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 66),
+		MTK_FUNCTION(0, "GPIO66"),
+		MTK_FUNCTION(1, "CMMCLK1"),
+		MTK_FUNCTION(2, "CMMCLK0"),
+		MTK_FUNCTION(7, "DBG_MON_B2")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(67, "CMPCLK"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 67),
+		MTK_FUNCTION(0, "GPIO67"),
+		MTK_FUNCTION(1, "CMPCLK"),
+		MTK_FUNCTION(2, "ANT_SEL0"),
+		MTK_FUNCTION(4, "TDM_RX_BCK"),
+		MTK_FUNCTION(5, "I2S0_BCK"),
+		MTK_FUNCTION(7, "DBG_MON_B3")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(68, "CMDAT0"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 68),
+		MTK_FUNCTION(0, "GPIO68"),
+		MTK_FUNCTION(1, "CMDAT0"),
+		MTK_FUNCTION(2, "ANT_SEL1"),
+		MTK_FUNCTION(4, "TDM_RX_LRCK"),
+		MTK_FUNCTION(5, "I2S0_LRCK"),
+		MTK_FUNCTION(7, "DBG_MON_B4")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(69, "CMDAT1"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 69),
+		MTK_FUNCTION(0, "GPIO69"),
+		MTK_FUNCTION(1, "CMDAT1"),
+		MTK_FUNCTION(2, "ANT_SEL2"),
+		MTK_FUNCTION(3, "DVFSRC_EXT_REQ"),
+		MTK_FUNCTION(4, "TDM_RX_MCK"),
+		MTK_FUNCTION(5, "I2S0_MCK"),
+		MTK_FUNCTION(7, "DBG_MON_B5")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(70, "CMDAT2"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 70),
+		MTK_FUNCTION(0, "GPIO70"),
+		MTK_FUNCTION(1, "CMDAT2"),
+		MTK_FUNCTION(2, "ANT_SEL3"),
+		MTK_FUNCTION(4, "TDM_RX_DI"),
+		MTK_FUNCTION(5, "I2S0_DI"),
+		MTK_FUNCTION(7, "DBG_MON_B6")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(71, "CMDAT3"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 71),
+		MTK_FUNCTION(0, "GPIO71"),
+		MTK_FUNCTION(1, "CMDAT3"),
+		MTK_FUNCTION(2, "ANT_SEL4"),
+		MTK_FUNCTION(7, "DBG_MON_B7")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(72, "CMDAT4"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 72),
+		MTK_FUNCTION(0, "GPIO72"),
+		MTK_FUNCTION(1, "CMDAT4"),
+		MTK_FUNCTION(2, "ANT_SEL5"),
+		MTK_FUNCTION(5, "I2S3_BCK"),
+		MTK_FUNCTION(7, "DBG_MON_B8")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(73, "CMDAT5"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 73),
+		MTK_FUNCTION(0, "GPIO73"),
+		MTK_FUNCTION(1, "CMDAT5"),
+		MTK_FUNCTION(2, "ANT_SEL6"),
+		MTK_FUNCTION(5, "I2S3_LRCK"),
+		MTK_FUNCTION(7, "DBG_MON_B9")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(74, "CMDAT6"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 74),
+		MTK_FUNCTION(0, "GPIO74"),
+		MTK_FUNCTION(1, "CMDAT6"),
+		MTK_FUNCTION(2, "ANT_SEL7"),
+		MTK_FUNCTION(5, "I2S3_MCK"),
+		MTK_FUNCTION(7, "DBG_MON_B10")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(75, "CMDAT7"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 75),
+		MTK_FUNCTION(0, "GPIO75"),
+		MTK_FUNCTION(1, "CMDAT7"),
+		MTK_FUNCTION(5, "I2S3_DO"),
+		MTK_FUNCTION(7, "DBG_MON_B11")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(76, "CMDAT8"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 76),
+		MTK_FUNCTION(0, "GPIO76"),
+		MTK_FUNCTION(1, "CMDAT8"),
+		MTK_FUNCTION(5, "PCM_CLK"),
+		MTK_FUNCTION(7, "DBG_MON_A29")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(77, "CMDAT9"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 77),
+		MTK_FUNCTION(0, "GPIO77"),
+		MTK_FUNCTION(1, "CMDAT9"),
+		MTK_FUNCTION(5, "PCM_SYNC"),
+		MTK_FUNCTION(7, "DBG_MON_A30")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(78, "CMHSYNC"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 78),
+		MTK_FUNCTION(0, "GPIO78"),
+		MTK_FUNCTION(1, "CMHSYNC"),
+		MTK_FUNCTION(5, "PCM_RX"),
+		MTK_FUNCTION(7, "DBG_MON_A31")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(79, "CMVSYNC"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 79),
+		MTK_FUNCTION(0, "GPIO79"),
+		MTK_FUNCTION(1, "CMVSYNC"),
+		MTK_FUNCTION(5, "PCM_TX"),
+		MTK_FUNCTION(7, "DBG_MON_A32")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(80, "MSDC2_CMD"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 80),
+		MTK_FUNCTION(0, "GPIO80"),
+		MTK_FUNCTION(1, "MSDC2_CMD"),
+		MTK_FUNCTION(2, "TDM_TX_LRCK"),
+		MTK_FUNCTION(3, "UTXD1"),
+		MTK_FUNCTION(4, "DPI_D19"),
+		MTK_FUNCTION(5, "UDI_TMS_XI"),
+		MTK_FUNCTION(6, "ADSP_JTAG_TMS")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(81, "MSDC2_CLK"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 81),
+		MTK_FUNCTION(0, "GPIO81"),
+		MTK_FUNCTION(1, "MSDC2_CLK"),
+		MTK_FUNCTION(2, "TDM_TX_BCK"),
+		MTK_FUNCTION(3, "URXD1"),
+		MTK_FUNCTION(4, "DPI_D20"),
+		MTK_FUNCTION(5, "UDI_TCK_XI"),
+		MTK_FUNCTION(6, "ADSP_JTAG_TCK")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(82, "MSDC2_DAT0"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 82),
+		MTK_FUNCTION(0, "GPIO82"),
+		MTK_FUNCTION(1, "MSDC2_DAT0"),
+		MTK_FUNCTION(2, "TDM_TX_DATA0"),
+		MTK_FUNCTION(3, "UTXD2"),
+		MTK_FUNCTION(4, "DPI_D21"),
+		MTK_FUNCTION(5, "UDI_TDI_XI"),
+		MTK_FUNCTION(6, "ADSP_JTAG_TDI")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(83, "MSDC2_DAT1"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 83),
+		MTK_FUNCTION(0, "GPIO83"),
+		MTK_FUNCTION(1, "MSDC2_DAT1"),
+		MTK_FUNCTION(2, "TDM_TX_DATA1"),
+		MTK_FUNCTION(3, "URXD2"),
+		MTK_FUNCTION(4, "DPI_D22"),
+		MTK_FUNCTION(5, "UDI_TDO"),
+		MTK_FUNCTION(6, "ADSP_JTAG_TDO")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(84, "MSDC2_DAT2"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 84),
+		MTK_FUNCTION(0, "GPIO84"),
+		MTK_FUNCTION(1, "MSDC2_DAT2"),
+		MTK_FUNCTION(2, "TDM_TX_DATA2"),
+		MTK_FUNCTION(3, "PWM_A"),
+		MTK_FUNCTION(4, "DPI_D23"),
+		MTK_FUNCTION(5, "UDI_NTRST_XI"),
+		MTK_FUNCTION(6, "ADSP_JTAG_TRST")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(85, "MSDC2_DAT3"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 85),
+		MTK_FUNCTION(0, "GPIO85"),
+		MTK_FUNCTION(1, "MSDC2_DAT3"),
+		MTK_FUNCTION(2, "TDM_TX_DATA3"),
+		MTK_FUNCTION(3, "PWM_B"),
+		MTK_FUNCTION(5, "EXT_FRAME_SYNC")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(86, "MSDC2_DSL"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 86),
+		MTK_FUNCTION(0, "GPIO86"),
+		MTK_FUNCTION(1, "MSDC2_DSL"),
+		MTK_FUNCTION(2, "TDM_TX_MCK"),
+		MTK_FUNCTION(3, "PWM_C")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(87, "MSDC1_CMD"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 87),
+		MTK_FUNCTION(0, "GPIO87"),
+		MTK_FUNCTION(1, "MSDC1_CMD"),
+		MTK_FUNCTION(2, "CONN_MCU_AICE_TMSC"),
+		MTK_FUNCTION(3, "DFD_TMS_XI"),
+		MTK_FUNCTION(4, "APU_JTAG_TMS"),
+		MTK_FUNCTION(5, "MCU_SPM_TMS"),
+		MTK_FUNCTION(6, "CONN_DSP_JMS"),
+		MTK_FUNCTION(7, "ADSP_JTAG_TMS")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(88, "MSDC1_CLK"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 88),
+		MTK_FUNCTION(0, "GPIO88"),
+		MTK_FUNCTION(1, "MSDC1_CLK"),
+		MTK_FUNCTION(2, "CONN_MCU_AICE_TCKC"),
+		MTK_FUNCTION(3, "DFD_TCK_XI"),
+		MTK_FUNCTION(4, "APU_JTAG_TCK"),
+		MTK_FUNCTION(5, "MCU_SPM_TCK"),
+		MTK_FUNCTION(6, "CONN_DSP_JCK"),
+		MTK_FUNCTION(7, "ADSP_JTAG_TCK")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(89, "MSDC1_DAT0"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 89),
+		MTK_FUNCTION(0, "GPIO89"),
+		MTK_FUNCTION(1, "MSDC1_DAT0"),
+		MTK_FUNCTION(2, "PWM_C"),
+		MTK_FUNCTION(3, "DFD_TDI_XI"),
+		MTK_FUNCTION(4, "APU_JTAG_TDI"),
+		MTK_FUNCTION(5, "MCU_SPM_TDI"),
+		MTK_FUNCTION(6, "CONN_DSP_JDI"),
+		MTK_FUNCTION(7, "ADSP_JTAG_TDI")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(90, "MSDC1_DAT1"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 90),
+		MTK_FUNCTION(0, "GPIO90"),
+		MTK_FUNCTION(1, "MSDC1_DAT1"),
+		MTK_FUNCTION(2, "SPDIF_IN"),
+		MTK_FUNCTION(3, "DFD_TDO"),
+		MTK_FUNCTION(4, "APU_JTAG_TDO"),
+		MTK_FUNCTION(5, "MCU_SPM_TDO"),
+		MTK_FUNCTION(6, "CONN_DSP_JDO"),
+		MTK_FUNCTION(7, "ADSP_JTAG_TDO")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(91, "MSDC1_DAT2"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 91),
+		MTK_FUNCTION(0, "GPIO91"),
+		MTK_FUNCTION(1, "MSDC1_DAT2"),
+		MTK_FUNCTION(2, "SPDIF_OUT"),
+		MTK_FUNCTION(3, "DFD_NTRST_XI"),
+		MTK_FUNCTION(4, "APU_JTAG_TRST"),
+		MTK_FUNCTION(5, "MCU_SPM_NTRST"),
+		MTK_FUNCTION(6, "CONN_DSP_JINTP"),
+		MTK_FUNCTION(7, "ADSP_JTAG_TRST")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(92, "MSDC1_DAT3"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 92),
+		MTK_FUNCTION(0, "GPIO92"),
+		MTK_FUNCTION(1, "MSDC1_DAT3"),
+		MTK_FUNCTION(2, "IRRX"),
+		MTK_FUNCTION(3, "PWM_A")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(93, "MSDC0_DAT7"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 93),
+		MTK_FUNCTION(0, "GPIO93"),
+		MTK_FUNCTION(1, "MSDC0_DAT7"),
+		MTK_FUNCTION(2, "NLD7")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(94, "MSDC0_DAT6"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 94),
+		MTK_FUNCTION(0, "GPIO94"),
+		MTK_FUNCTION(1, "MSDC0_DAT6"),
+		MTK_FUNCTION(2, "NLD6")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(95, "MSDC0_DAT5"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 95),
+		MTK_FUNCTION(0, "GPIO95"),
+		MTK_FUNCTION(1, "MSDC0_DAT5"),
+		MTK_FUNCTION(2, "NLD4")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(96, "MSDC0_DAT4"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 96),
+		MTK_FUNCTION(0, "GPIO96"),
+		MTK_FUNCTION(1, "MSDC0_DAT4"),
+		MTK_FUNCTION(2, "NLD3")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(97, "MSDC0_RSTB"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 97),
+		MTK_FUNCTION(0, "GPIO97"),
+		MTK_FUNCTION(1, "MSDC0_RSTB"),
+		MTK_FUNCTION(2, "NLD0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(98, "MSDC0_CMD"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 98),
+		MTK_FUNCTION(0, "GPIO98"),
+		MTK_FUNCTION(1, "MSDC0_CMD"),
+		MTK_FUNCTION(2, "NALE")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(99, "MSDC0_CLK"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 99),
+		MTK_FUNCTION(0, "GPIO99"),
+		MTK_FUNCTION(1, "MSDC0_CLK"),
+		MTK_FUNCTION(2, "NWEB")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(100, "MSDC0_DAT3"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 100),
+		MTK_FUNCTION(0, "GPIO100"),
+		MTK_FUNCTION(1, "MSDC0_DAT3"),
+		MTK_FUNCTION(2, "NLD1")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(101, "MSDC0_DAT2"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 101),
+		MTK_FUNCTION(0, "GPIO101"),
+		MTK_FUNCTION(1, "MSDC0_DAT2"),
+		MTK_FUNCTION(2, "NLD5")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(102, "MSDC0_DAT1"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 102),
+		MTK_FUNCTION(0, "GPIO102"),
+		MTK_FUNCTION(1, "MSDC0_DAT1"),
+		MTK_FUNCTION(2, "NDQS")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(103, "MSDC0_DAT0"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 103),
+		MTK_FUNCTION(0, "GPIO103"),
+		MTK_FUNCTION(1, "MSDC0_DAT0"),
+		MTK_FUNCTION(2, "NLD2")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(104, "MSDC0_DSL"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 104),
+		MTK_FUNCTION(0, "GPIO104"),
+		MTK_FUNCTION(1, "MSDC0_DSL")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(105, "NCLE"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 105),
+		MTK_FUNCTION(0, "GPIO105"),
+		MTK_FUNCTION(1, "NCLE"),
+		MTK_FUNCTION(2, "TDM_RX_MCK"),
+		MTK_FUNCTION(7, "DBG_MON_B12")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(106, "NCEB1"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 106),
+		MTK_FUNCTION(0, "GPIO106"),
+		MTK_FUNCTION(1, "NCEB1"),
+		MTK_FUNCTION(2, "TDM_RX_BCK"),
+		MTK_FUNCTION(7, "DBG_MON_B13")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(107, "NCEB0"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 107),
+		MTK_FUNCTION(0, "GPIO107"),
+		MTK_FUNCTION(1, "NCEB0"),
+		MTK_FUNCTION(2, "TDM_RX_LRCK"),
+		MTK_FUNCTION(7, "DBG_MON_B14")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(108, "NREB"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 108),
+		MTK_FUNCTION(0, "GPIO108"),
+		MTK_FUNCTION(1, "NREB"),
+		MTK_FUNCTION(2, "TDM_RX_DI"),
+		MTK_FUNCTION(7, "DBG_MON_B15")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(109, "NRNB"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 109),
+		MTK_FUNCTION(0, "GPIO109"),
+		MTK_FUNCTION(1, "NRNB"),
+		MTK_FUNCTION(2, "TSF_IN"),
+		MTK_FUNCTION(7, "DBG_MON_B16")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(110, "PCM_CLK"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 110),
+		MTK_FUNCTION(0, "GPIO110"),
+		MTK_FUNCTION(1, "PCM_CLK"),
+		MTK_FUNCTION(2, "I2S0_BCK"),
+		MTK_FUNCTION(3, "I2S3_BCK"),
+		MTK_FUNCTION(4, "SPDIF_IN"),
+		MTK_FUNCTION(5, "DPI_D15")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(111, "PCM_SYNC"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 111),
+		MTK_FUNCTION(0, "GPIO111"),
+		MTK_FUNCTION(1, "PCM_SYNC"),
+		MTK_FUNCTION(2, "I2S0_LRCK"),
+		MTK_FUNCTION(3, "I2S3_LRCK"),
+		MTK_FUNCTION(4, "SPDIF_OUT"),
+		MTK_FUNCTION(5, "DPI_D16")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(112, "PCM_RX"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 112),
+		MTK_FUNCTION(0, "GPIO112"),
+		MTK_FUNCTION(1, "PCM_RX"),
+		MTK_FUNCTION(2, "I2S0_DI"),
+		MTK_FUNCTION(3, "I2S3_MCK"),
+		MTK_FUNCTION(4, "IRRX"),
+		MTK_FUNCTION(5, "DPI_D17")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(113, "PCM_TX"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 113),
+		MTK_FUNCTION(0, "GPIO113"),
+		MTK_FUNCTION(1, "PCM_TX"),
+		MTK_FUNCTION(2, "I2S0_MCK"),
+		MTK_FUNCTION(3, "I2S3_DO"),
+		MTK_FUNCTION(4, "PWM_B"),
+		MTK_FUNCTION(5, "DPI_D18")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(114, "I2S_DATA_IN"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 114),
+		MTK_FUNCTION(0, "GPIO114"),
+		MTK_FUNCTION(1, "I2S0_DI"),
+		MTK_FUNCTION(2, "I2S1_DO"),
+		MTK_FUNCTION(3, "I2S2_DI"),
+		MTK_FUNCTION(4, "I2S3_DO"),
+		MTK_FUNCTION(5, "PWM_A"),
+		MTK_FUNCTION(6, "SPDIF_IN"),
+		MTK_FUNCTION(7, "DBG_MON_B17")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(115, "I2S_LRCK"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 115),
+		MTK_FUNCTION(0, "GPIO115"),
+		MTK_FUNCTION(1, "I2S0_LRCK"),
+		MTK_FUNCTION(2, "I2S1_LRCK"),
+		MTK_FUNCTION(3, "I2S2_LRCK"),
+		MTK_FUNCTION(4, "I2S3_LRCK"),
+		MTK_FUNCTION(5, "PWM_B"),
+		MTK_FUNCTION(6, "SPDIF_OUT"),
+		MTK_FUNCTION(7, "DBG_MON_B18")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(116, "I2S_BCK"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 116),
+		MTK_FUNCTION(0, "GPIO116"),
+		MTK_FUNCTION(1, "I2S0_BCK"),
+		MTK_FUNCTION(2, "I2S1_BCK"),
+		MTK_FUNCTION(3, "I2S2_BCK"),
+		MTK_FUNCTION(4, "I2S3_BCK"),
+		MTK_FUNCTION(5, "PWM_C"),
+		MTK_FUNCTION(6, "IRRX"),
+		MTK_FUNCTION(7, "DBG_MON_B19")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(117, "DMIC0_CLK"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 117),
+		MTK_FUNCTION(0, "GPIO117"),
+		MTK_FUNCTION(1, "DMIC0_CLK"),
+		MTK_FUNCTION(2, "I2S2_BCK"),
+		MTK_FUNCTION(7, "DBG_MON_B20")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(118, "DMIC0_DAT0"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 118),
+		MTK_FUNCTION(0, "GPIO118"),
+		MTK_FUNCTION(1, "DMIC0_DAT0"),
+		MTK_FUNCTION(2, "I2S2_DI"),
+		MTK_FUNCTION(7, "DBG_MON_B21")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(119, "DMIC0_DAT1"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 119),
+		MTK_FUNCTION(0, "GPIO119"),
+		MTK_FUNCTION(1, "DMIC0_DAT1"),
+		MTK_FUNCTION(2, "I2S2_LRCK"),
+		MTK_FUNCTION(7, "DBG_MON_B22")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(120, "DMIC1_CLK"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 120),
+		MTK_FUNCTION(0, "GPIO120"),
+		MTK_FUNCTION(1, "DMIC1_CLK"),
+		MTK_FUNCTION(2, "I2S2_MCK"),
+		MTK_FUNCTION(7, "DBG_MON_B23")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(121, "DMIC1_DAT0"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 121),
+		MTK_FUNCTION(0, "GPIO121"),
+		MTK_FUNCTION(1, "DMIC1_DAT0"),
+		MTK_FUNCTION(2, "I2S1_BCK"),
+		MTK_FUNCTION(7, "DBG_MON_B24")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(122, "DMIC1_DAT1"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 122),
+		MTK_FUNCTION(0, "GPIO122"),
+		MTK_FUNCTION(1, "DMIC1_DAT1"),
+		MTK_FUNCTION(2, "I2S1_LRCK"),
+		MTK_FUNCTION(7, "DBG_MON_B25")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(123, "DMIC2_CLK"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 123),
+		MTK_FUNCTION(0, "GPIO123"),
+		MTK_FUNCTION(1, "DMIC2_CLK"),
+		MTK_FUNCTION(2, "I2S1_MCK"),
+		MTK_FUNCTION(7, "DBG_MON_B26")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(124, "DMIC2_DAT0"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 124),
+		MTK_FUNCTION(0, "GPIO124"),
+		MTK_FUNCTION(1, "DMIC2_DAT0"),
+		MTK_FUNCTION(2, "I2S1_DO"),
+		MTK_FUNCTION(7, "DBG_MON_B27")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(125, "DMIC2_DAT1"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 125),
+		MTK_FUNCTION(0, "GPIO125"),
+		MTK_FUNCTION(1, "DMIC2_DAT1"),
+		MTK_FUNCTION(2, "TDM_RX_BCK"),
+		MTK_FUNCTION(7, "DBG_MON_B28")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(126, "DMIC3_CLK"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 126),
+		MTK_FUNCTION(0, "GPIO126"),
+		MTK_FUNCTION(1, "DMIC3_CLK"),
+		MTK_FUNCTION(2, "TDM_RX_LRCK")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(127, "DMIC3_DAT0"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 127),
+		MTK_FUNCTION(0, "GPIO127"),
+		MTK_FUNCTION(1, "DMIC3_DAT0"),
+		MTK_FUNCTION(2, "TDM_RX_DI")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(128, "DMIC3_DAT1"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 128),
+		MTK_FUNCTION(0, "GPIO128"),
+		MTK_FUNCTION(1, "DMIC3_DAT1"),
+		MTK_FUNCTION(2, "TDM_RX_MCK"),
+		MTK_FUNCTION(3, "VAD_CLK")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(129, "TDM_TX_BCK"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 129),
+		MTK_FUNCTION(0, "GPIO129"),
+		MTK_FUNCTION(1, "TDM_TX_BCK"),
+		MTK_FUNCTION(2, "I2S3_BCK"),
+		MTK_FUNCTION(3, "ckmon1_ck")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(130, "TDM_TX_LRCK"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 130),
+		MTK_FUNCTION(0, "GPIO130"),
+		MTK_FUNCTION(1, "TDM_TX_LRCK"),
+		MTK_FUNCTION(2, "I2S3_LRCK"),
+		MTK_FUNCTION(3, "ckmon2_ck")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(131, "TDM_TX_MCK"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 131),
+		MTK_FUNCTION(0, "GPIO131"),
+		MTK_FUNCTION(1, "TDM_TX_MCK"),
+		MTK_FUNCTION(2, "I2S3_MCK"),
+		MTK_FUNCTION(3, "ckmon3_ck")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(132, "TDM_TX_DATA0"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 132),
+		MTK_FUNCTION(0, "GPIO132"),
+		MTK_FUNCTION(1, "TDM_TX_DATA0"),
+		MTK_FUNCTION(2, "I2S3_DO"),
+		MTK_FUNCTION(3, "ckmon4_ck"),
+		MTK_FUNCTION(7, "DBG_MON_B29")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(133, "TDM_TX_DATA1"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 133),
+		MTK_FUNCTION(0, "GPIO133"),
+		MTK_FUNCTION(1, "TDM_TX_DATA1"),
+		MTK_FUNCTION(7, "DBG_MON_B30")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(134, "TDM_TX_DATA2"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 134),
+		MTK_FUNCTION(0, "GPIO134"),
+		MTK_FUNCTION(1, "TDM_TX_DATA2"),
+		MTK_FUNCTION(7, "DBG_MON_B31")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(135, "TDM_TX_DATA3"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 135),
+		MTK_FUNCTION(0, "GPIO135"),
+		MTK_FUNCTION(1, "TDM_TX_DATA3"),
+		MTK_FUNCTION(7, "DBG_MON_B32")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(136, "CONN_TOP_CLK"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 136),
+		MTK_FUNCTION(0, "GPIO136"),
+		MTK_FUNCTION(1, "CONN_TOP_CLK")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(137, "CONN_TOP_DATA"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 137),
+		MTK_FUNCTION(0, "GPIO137"),
+		MTK_FUNCTION(1, "CONN_TOP_DATA")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(138, "CONN_HRST_B"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 138),
+		MTK_FUNCTION(0, "GPIO138"),
+		MTK_FUNCTION(1, "CONN_HRST_B")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(139, "CONN_WB_PTA"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 139),
+		MTK_FUNCTION(0, "GPIO139"),
+		MTK_FUNCTION(1, "CONN_WB_PTA")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(140, "CONN_BT_CLK"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 140),
+		MTK_FUNCTION(0, "GPIO140"),
+		MTK_FUNCTION(1, "CONN_BT_CLK")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(141, "CONN_BT_DATA"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 141),
+		MTK_FUNCTION(0, "GPIO141"),
+		MTK_FUNCTION(1, "CONN_BT_DATA")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(142, "CONN_WF_CTRL0"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 142),
+		MTK_FUNCTION(0, "GPIO142"),
+		MTK_FUNCTION(1, "CONN_WF_CTRL0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(143, "CONN_WF_CTRL1"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 143),
+		MTK_FUNCTION(0, "GPIO143"),
+		MTK_FUNCTION(1, "CONN_WF_CTRL1")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(144, "CONN_WF_CTRL2"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 144),
+		MTK_FUNCTION(0, "GPIO144"),
+		MTK_FUNCTION(1, "CONN_WF_CTRL2")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(145, "TESTMODE"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 145),
+		MTK_FUNCTION(0, "GPIO145")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(146, "SYSRSTB"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 146),
+		MTK_FUNCTION(0, "GPIO146")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(147, "BIAS_MSDC0"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 147),
+		MTK_FUNCTION(0, "GPIO147")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(148, "BIAS_IO0"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 148),
+		MTK_FUNCTION(0, "GPIO148")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(149, "BIAS1_IO1"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 149),
+		MTK_FUNCTION(0, "GPIO149")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(150, "BIAS2_IO1"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 150),
+		MTK_FUNCTION(0, "GPIO150")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(151, "BIAS_DPI"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 151),
+		MTK_FUNCTION(0, "GPIO151")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(152, "BIAS_MSDC2"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 152),
+		MTK_FUNCTION(0, "GPIO152")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(153, "BIAS_IO2"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 153),
+		MTK_FUNCTION(0, "GPIO153")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(154, "BIAS_IO3"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 154),
+		MTK_FUNCTION(0, "GPIO154")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(155, "BIAS1_MSDC1"),
+		NULL, "mt8365",
+		MTK_EINT_FUNCTION(0, 155),
+		MTK_FUNCTION(0, "GPIO155")
+	),
+};
+
+#endif /* __PINCTRL_MTK_MT8365_H */
-- 
2.31.1

