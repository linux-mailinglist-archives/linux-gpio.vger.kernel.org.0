Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91BF125F9FE
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 13:57:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728984AbgIGLYQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Sep 2020 07:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728913AbgIGLW4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Sep 2020 07:22:56 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48706C061797
        for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2020 04:02:31 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id a9so13791292wmm.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2020 04:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TVHBmU0L6OaReZydmCeXpd/6cFhGtY3E16N7B5ahDro=;
        b=n7zEgV1DMSyNZY9jz3PTSbv2XVK8HXwI/MxqXb0j3v3WobR7YevUaNGXkIwVYp5dFI
         n6Fy04Zyh+5AMNr8kT9SLGuWpmnTjBzsSWYfT2eWvdgsONSTNoLbNcxSyU+1ZiwWDS8P
         r5rzBb+kbSLKMILctbFi/KzBhMUgxlWD5uLgudGbWCAB2QJ2t1uDO11hPzrDixX59NRw
         NWwAzDw1dmvz6YBzCrt0eQLS6OYl0kv2lzNk6OSXMSWuBEl12hnXnAbTT+VR4PGbcE6J
         Lw3mOK4Non0BvJEkmTnPPNiDwpbR0OkTE+jl0uGXGOxDvmgYUo/dQUTBconTGfM/y2wi
         NQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TVHBmU0L6OaReZydmCeXpd/6cFhGtY3E16N7B5ahDro=;
        b=O/6PgDDT8scTWuLH+Z8QZZz9uT7kKc3aVAAhy5RUq5FcnrW+l85MB4hqpLGYkTTP50
         NA1hGt5OvX1ZQ5Et3P4yNvj7pi+dnCHNqgdm8Y4Tc/K2Vqdijxwptz8nsRJqufyk1lXj
         c3bI3gwM65EQMAc/1Btmrt7bIvj6dCDjtZbz1BFlCYE4YBy9gUdI3k9u5j1IRClh1rpk
         xVUJ4V7NLkjIoqbSa7JOAeHpVwFpuIzVbEMCskwmYGaS1MbWV34hGcLSIFufC9Cq38s3
         WpACPS81iC0aHd0mCvXaEh9EPrbsfIx48LaJ2vvz3cFOSX49WSYkLkQ0CYfe8RyY0slO
         BEkg==
X-Gm-Message-State: AOAM530PhdmX9Sl5veFoOUu2wRPdFzrjtIUVI9STANgeTFYp1B2sQI4I
        AxXihjrNKIphoghVNkxHWuBLxw==
X-Google-Smtp-Source: ABdhPJwc+F688KAxrNFmsh8kzpDCyEmhoQgwfulubw4+LY0kcihmDyf6B76Q4vMsdifc+fdGbfqJig==
X-Received: by 2002:a1c:2501:: with SMTP id l1mr21921013wml.16.1599476548336;
        Mon, 07 Sep 2020 04:02:28 -0700 (PDT)
Received: from localhost.localdomain (122.105.23.93.rev.sfr.net. [93.23.105.122])
        by smtp.gmail.com with ESMTPSA id 2sm28909545wrs.64.2020.09.07.04.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 04:02:27 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Cc:     matthias.bgg@gmail.com, robh+dt@kernel.org,
        linus.walleij@linaro.org, sean.wang@kernel.org,
        Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 2/2] pinctrl: mediatek: Add MT8167 Pinctrl driver
Date:   Mon,  7 Sep 2020 13:02:21 +0200
Message-Id: <20200907110221.1691168-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907110221.1691168-1-fparent@baylibre.com>
References: <20200907110221.1691168-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This commit adds the pinctrl driver for the MediaTek's MT8167 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/pinctrl/mediatek/Kconfig              |    7 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8167.c     |  362 +++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8167.h | 1248 +++++++++++++++++
 4 files changed, 1618 insertions(+)
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8167.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8167.h

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 1cedc5f2aadb..dc5a2be2e415 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -119,6 +119,13 @@ config PINCTRL_MT7622
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK_MOORE
 
+config PINCTRL_MT8167
+	bool "Mediatek MT8167 pin control"
+	depends on OF
+	depends on ARM64 || COMPILE_TEST
+	default ARM64 && ARCH_MEDIATEK
+	select PINCTRL_MTK
+
 config PINCTRL_MT8173
 	bool "Mediatek MT8173 pin control"
 	depends on OF
diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
index b0b07c541d11..94db8cdc999d 100644
--- a/drivers/pinctrl/mediatek/Makefile
+++ b/drivers/pinctrl/mediatek/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_PINCTRL_MT6797)	+= pinctrl-mt6797.o
 obj-$(CONFIG_PINCTRL_MT7622)	+= pinctrl-mt7622.o
 obj-$(CONFIG_PINCTRL_MT7623)	+= pinctrl-mt7623.o
 obj-$(CONFIG_PINCTRL_MT7629)	+= pinctrl-mt7629.o
+obj-$(CONFIG_PINCTRL_MT8167)	+= pinctrl-mt8167.o
 obj-$(CONFIG_PINCTRL_MT8173)	+= pinctrl-mt8173.o
 obj-$(CONFIG_PINCTRL_MT8183)	+= pinctrl-mt8183.o
 obj-$(CONFIG_PINCTRL_MT8516)	+= pinctrl-mt8516.o
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8167.c b/drivers/pinctrl/mediatek/pinctrl-mt8167.c
new file mode 100644
index 000000000000..7b68886bad16
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8167.c
@@ -0,0 +1,362 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ * Author: Min.Guo <min.guo@mediatek.com>
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
+#include "pinctrl-mtk-mt8167.h"
+
+static const struct mtk_drv_group_desc mt8167_drv_grp[] = {
+	/* 0E4E8SR 4/8/12/16 */
+	MTK_DRV_GRP(4, 16, 1, 2, 4),
+	/* 0E2E4SR  2/4/6/8 */
+	MTK_DRV_GRP(2, 8, 1, 2, 2),
+	/* E8E4E2  2/4/6/8/10/12/14/16 */
+	MTK_DRV_GRP(2, 16, 0, 2, 2)
+};
+
+static const struct mtk_pin_drv_grp mt8167_pin_drv[] = {
+	MTK_PIN_DRV_GRP(0, 0xd00, 0, 0),
+	MTK_PIN_DRV_GRP(1, 0xd00, 0, 0),
+	MTK_PIN_DRV_GRP(2, 0xd00, 0, 0),
+	MTK_PIN_DRV_GRP(3, 0xd00, 0, 0),
+	MTK_PIN_DRV_GRP(4, 0xd00, 0, 0),
+
+	MTK_PIN_DRV_GRP(5, 0xd00, 4, 0),
+	MTK_PIN_DRV_GRP(6, 0xd00, 4, 0),
+	MTK_PIN_DRV_GRP(7, 0xd00, 4, 0),
+	MTK_PIN_DRV_GRP(8, 0xd00, 4, 0),
+	MTK_PIN_DRV_GRP(9, 0xd00, 4, 0),
+	MTK_PIN_DRV_GRP(10, 0xd00, 4, 0),
+
+	MTK_PIN_DRV_GRP(11, 0xd00, 8, 0),
+	MTK_PIN_DRV_GRP(12, 0xd00, 8, 0),
+	MTK_PIN_DRV_GRP(13, 0xd00, 8, 0),
+
+	MTK_PIN_DRV_GRP(14, 0xd00, 12, 2),
+	MTK_PIN_DRV_GRP(15, 0xd00, 12, 2),
+	MTK_PIN_DRV_GRP(16, 0xd00, 12, 2),
+	MTK_PIN_DRV_GRP(17, 0xd00, 12, 2),
+
+	MTK_PIN_DRV_GRP(18, 0xd10, 0, 0),
+	MTK_PIN_DRV_GRP(19, 0xd10, 0, 0),
+	MTK_PIN_DRV_GRP(20, 0xd10, 0, 0),
+
+	MTK_PIN_DRV_GRP(21, 0xd00, 12, 2),
+	MTK_PIN_DRV_GRP(22, 0xd00, 12, 2),
+	MTK_PIN_DRV_GRP(23, 0xd00, 12, 2),
+
+	MTK_PIN_DRV_GRP(24, 0xd00, 8, 0),
+	MTK_PIN_DRV_GRP(25, 0xd00, 8, 0),
+
+	MTK_PIN_DRV_GRP(26, 0xd10, 4, 1),
+	MTK_PIN_DRV_GRP(27, 0xd10, 4, 1),
+	MTK_PIN_DRV_GRP(28, 0xd10, 4, 1),
+	MTK_PIN_DRV_GRP(29, 0xd10, 4, 1),
+	MTK_PIN_DRV_GRP(30, 0xd10, 4, 1),
+
+	MTK_PIN_DRV_GRP(31, 0xd10, 8, 1),
+	MTK_PIN_DRV_GRP(32, 0xd10, 8, 1),
+	MTK_PIN_DRV_GRP(33, 0xd10, 8, 1),
+
+	MTK_PIN_DRV_GRP(34, 0xd10, 12, 0),
+	MTK_PIN_DRV_GRP(35, 0xd10, 12, 0),
+
+	MTK_PIN_DRV_GRP(36, 0xd20, 0, 0),
+	MTK_PIN_DRV_GRP(37, 0xd20, 0, 0),
+	MTK_PIN_DRV_GRP(38, 0xd20, 0, 0),
+	MTK_PIN_DRV_GRP(39, 0xd20, 0, 0),
+
+	MTK_PIN_DRV_GRP(40, 0xd20, 4, 1),
+
+	MTK_PIN_DRV_GRP(41, 0xd20, 8, 1),
+	MTK_PIN_DRV_GRP(42, 0xd20, 8, 1),
+	MTK_PIN_DRV_GRP(43, 0xd20, 8, 1),
+
+	MTK_PIN_DRV_GRP(44, 0xd20, 12, 1),
+	MTK_PIN_DRV_GRP(45, 0xd20, 12, 1),
+	MTK_PIN_DRV_GRP(46, 0xd20, 12, 1),
+	MTK_PIN_DRV_GRP(47, 0xd20, 12, 1),
+
+	MTK_PIN_DRV_GRP(48, 0xd30, 0, 1),
+	MTK_PIN_DRV_GRP(49, 0xd30, 0, 1),
+	MTK_PIN_DRV_GRP(50, 0xd30, 0, 1),
+	MTK_PIN_DRV_GRP(51, 0xd30, 0, 1),
+
+	MTK_PIN_DRV_GRP(54, 0xd30, 8, 1),
+
+	MTK_PIN_DRV_GRP(55, 0xd30, 12, 1),
+	MTK_PIN_DRV_GRP(56, 0xd30, 12, 1),
+	MTK_PIN_DRV_GRP(57, 0xd30, 12, 1),
+
+	MTK_PIN_DRV_GRP(62, 0xd40, 8, 1),
+	MTK_PIN_DRV_GRP(63, 0xd40, 8, 1),
+	MTK_PIN_DRV_GRP(64, 0xd40, 8, 1),
+	MTK_PIN_DRV_GRP(65, 0xd40, 8, 1),
+	MTK_PIN_DRV_GRP(66, 0xd40, 8, 1),
+	MTK_PIN_DRV_GRP(67, 0xd40, 8, 1),
+
+	MTK_PIN_DRV_GRP(68, 0xd40, 12, 2),
+
+	MTK_PIN_DRV_GRP(69, 0xd50, 0, 2),
+
+	MTK_PIN_DRV_GRP(70, 0xd50, 4, 2),
+	MTK_PIN_DRV_GRP(71, 0xd50, 4, 2),
+	MTK_PIN_DRV_GRP(72, 0xd50, 4, 2),
+	MTK_PIN_DRV_GRP(73, 0xd50, 4, 2),
+
+	MTK_PIN_DRV_GRP(100, 0xd50, 8, 1),
+	MTK_PIN_DRV_GRP(101, 0xd50, 8, 1),
+	MTK_PIN_DRV_GRP(102, 0xd50, 8, 1),
+	MTK_PIN_DRV_GRP(103, 0xd50, 8, 1),
+
+	MTK_PIN_DRV_GRP(104, 0xd50, 12, 2),
+
+	MTK_PIN_DRV_GRP(105, 0xd60, 0, 2),
+
+	MTK_PIN_DRV_GRP(106, 0xd60, 4, 2),
+	MTK_PIN_DRV_GRP(107, 0xd60, 4, 2),
+	MTK_PIN_DRV_GRP(108, 0xd60, 4, 2),
+	MTK_PIN_DRV_GRP(109, 0xd60, 4, 2),
+
+	MTK_PIN_DRV_GRP(110, 0xd70, 0, 2),
+	MTK_PIN_DRV_GRP(111, 0xd70, 0, 2),
+	MTK_PIN_DRV_GRP(112, 0xd70, 0, 2),
+	MTK_PIN_DRV_GRP(113, 0xd70, 0, 2),
+
+	MTK_PIN_DRV_GRP(114, 0xd70, 4, 2),
+
+	MTK_PIN_DRV_GRP(115, 0xd60, 12, 2),
+
+	MTK_PIN_DRV_GRP(116, 0xd60, 8, 2),
+
+	MTK_PIN_DRV_GRP(117, 0xd70, 0, 2),
+	MTK_PIN_DRV_GRP(118, 0xd70, 0, 2),
+	MTK_PIN_DRV_GRP(119, 0xd70, 0, 2),
+	MTK_PIN_DRV_GRP(120, 0xd70, 0, 2),
+};
+
+static const struct mtk_pin_spec_pupd_set_samereg mt8167_spec_pupd[] = {
+	MTK_PIN_PUPD_SPEC_SR(14, 0xe50, 14, 13, 12),
+	MTK_PIN_PUPD_SPEC_SR(15, 0xe60, 2, 1, 0),
+	MTK_PIN_PUPD_SPEC_SR(16, 0xe60, 6, 5, 4),
+	MTK_PIN_PUPD_SPEC_SR(17, 0xe60, 10, 9, 8),
+
+	MTK_PIN_PUPD_SPEC_SR(21, 0xe60, 14, 13, 12),
+	MTK_PIN_PUPD_SPEC_SR(22, 0xe70, 2, 1, 0),
+	MTK_PIN_PUPD_SPEC_SR(23, 0xe70, 6, 5, 4),
+
+	MTK_PIN_PUPD_SPEC_SR(40, 0xe80, 2, 1, 0),
+	MTK_PIN_PUPD_SPEC_SR(41, 0xe80, 6, 5, 4),
+	MTK_PIN_PUPD_SPEC_SR(42, 0xe90, 2, 1, 0),
+	MTK_PIN_PUPD_SPEC_SR(43, 0xe90, 6, 5, 4),
+
+	MTK_PIN_PUPD_SPEC_SR(68, 0xe50, 10, 9, 8),
+	MTK_PIN_PUPD_SPEC_SR(69, 0xe50, 6, 5, 4),
+	MTK_PIN_PUPD_SPEC_SR(70, 0xe40, 6, 5, 4),
+	MTK_PIN_PUPD_SPEC_SR(71, 0xe40, 10, 9, 8),
+	MTK_PIN_PUPD_SPEC_SR(72, 0xe40, 14, 13, 12),
+	MTK_PIN_PUPD_SPEC_SR(73, 0xe50, 2, 1, 0),
+
+	MTK_PIN_PUPD_SPEC_SR(104, 0xe40, 2, 1, 0),
+	MTK_PIN_PUPD_SPEC_SR(105, 0xe30, 14, 13, 12),
+	MTK_PIN_PUPD_SPEC_SR(106, 0xe20, 14, 13, 12),
+	MTK_PIN_PUPD_SPEC_SR(107, 0xe30, 2, 1, 0),
+	MTK_PIN_PUPD_SPEC_SR(108, 0xe30, 6, 5, 4),
+	MTK_PIN_PUPD_SPEC_SR(109, 0xe30, 10, 9, 8),
+	MTK_PIN_PUPD_SPEC_SR(110, 0xe10, 14, 13, 12),
+	MTK_PIN_PUPD_SPEC_SR(111, 0xe10, 10, 9, 8),
+	MTK_PIN_PUPD_SPEC_SR(112, 0xe10, 6, 5, 4),
+	MTK_PIN_PUPD_SPEC_SR(113, 0xe10, 2, 1, 0),
+	MTK_PIN_PUPD_SPEC_SR(114, 0xe20, 10, 9, 8),
+	MTK_PIN_PUPD_SPEC_SR(115, 0xe20, 2, 1, 0),
+	MTK_PIN_PUPD_SPEC_SR(116, 0xe20, 6, 5, 4),
+	MTK_PIN_PUPD_SPEC_SR(117, 0xe00, 14, 13, 12),
+	MTK_PIN_PUPD_SPEC_SR(118, 0xe00, 10, 9, 8),
+	MTK_PIN_PUPD_SPEC_SR(119, 0xe00, 6, 5, 4),
+	MTK_PIN_PUPD_SPEC_SR(120, 0xe00, 2, 1, 0),
+};
+
+static int mt8167_spec_pull_set(struct regmap *regmap, unsigned int pin,
+			unsigned char align, bool isup, unsigned int r1r0)
+{
+	return mtk_pctrl_spec_pull_set_samereg(regmap, mt8167_spec_pupd,
+		ARRAY_SIZE(mt8167_spec_pupd), pin, align, isup, r1r0);
+}
+
+static const struct mtk_pin_ies_smt_set mt8167_ies_set[] = {
+	MTK_PIN_IES_SMT_SPEC(0, 6, 0x900, 2),
+	MTK_PIN_IES_SMT_SPEC(7, 10, 0x900, 3),
+	MTK_PIN_IES_SMT_SPEC(11, 13, 0x900, 12),
+	MTK_PIN_IES_SMT_SPEC(14, 17, 0x900, 13),
+	MTK_PIN_IES_SMT_SPEC(18, 20, 0x910, 10),
+	MTK_PIN_IES_SMT_SPEC(21, 23, 0x900, 13),
+	MTK_PIN_IES_SMT_SPEC(24, 25, 0x900, 12),
+	MTK_PIN_IES_SMT_SPEC(26, 30, 0x900, 0),
+	MTK_PIN_IES_SMT_SPEC(31, 33, 0x900, 1),
+	MTK_PIN_IES_SMT_SPEC(34, 39, 0x900, 2),
+	MTK_PIN_IES_SMT_SPEC(40, 40, 0x910, 11),
+	MTK_PIN_IES_SMT_SPEC(41, 43, 0x900, 10),
+	MTK_PIN_IES_SMT_SPEC(44, 47, 0x900, 11),
+	MTK_PIN_IES_SMT_SPEC(48, 51, 0x900, 14),
+	MTK_PIN_IES_SMT_SPEC(52, 53, 0x910, 0),
+	MTK_PIN_IES_SMT_SPEC(54, 54, 0x910, 2),
+	MTK_PIN_IES_SMT_SPEC(55, 57, 0x910, 4),
+	MTK_PIN_IES_SMT_SPEC(58, 59, 0x900, 15),
+	MTK_PIN_IES_SMT_SPEC(60, 61, 0x910, 1),
+	MTK_PIN_IES_SMT_SPEC(62, 65, 0x910, 5),
+	MTK_PIN_IES_SMT_SPEC(66, 67, 0x910, 6),
+	MTK_PIN_IES_SMT_SPEC(68, 68, 0x930, 2),
+	MTK_PIN_IES_SMT_SPEC(69, 69, 0x930, 1),
+	MTK_PIN_IES_SMT_SPEC(70, 70, 0x930, 6),
+	MTK_PIN_IES_SMT_SPEC(71, 71, 0x930, 5),
+	MTK_PIN_IES_SMT_SPEC(72, 72, 0x930, 4),
+	MTK_PIN_IES_SMT_SPEC(73, 73, 0x930, 3),
+	MTK_PIN_IES_SMT_SPEC(100, 103, 0x910, 7),
+	MTK_PIN_IES_SMT_SPEC(104, 104, 0x920, 12),
+	MTK_PIN_IES_SMT_SPEC(105, 105, 0x920, 11),
+	MTK_PIN_IES_SMT_SPEC(106, 106, 0x930, 0),
+	MTK_PIN_IES_SMT_SPEC(107, 107, 0x920, 15),
+	MTK_PIN_IES_SMT_SPEC(108, 108, 0x920, 14),
+	MTK_PIN_IES_SMT_SPEC(109, 109, 0x920, 13),
+	MTK_PIN_IES_SMT_SPEC(110, 110, 0x920, 9),
+	MTK_PIN_IES_SMT_SPEC(111, 111, 0x920, 8),
+	MTK_PIN_IES_SMT_SPEC(112, 112, 0x920, 7),
+	MTK_PIN_IES_SMT_SPEC(113, 113, 0x920, 6),
+	MTK_PIN_IES_SMT_SPEC(114, 114, 0x920, 10),
+	MTK_PIN_IES_SMT_SPEC(115, 115, 0x920, 1),
+	MTK_PIN_IES_SMT_SPEC(116, 116, 0x920, 0),
+	MTK_PIN_IES_SMT_SPEC(117, 117, 0x920, 5),
+	MTK_PIN_IES_SMT_SPEC(118, 118, 0x920, 4),
+	MTK_PIN_IES_SMT_SPEC(119, 119, 0x920, 3),
+	MTK_PIN_IES_SMT_SPEC(120, 120, 0x920, 2),
+	MTK_PIN_IES_SMT_SPEC(121, 124, 0x910, 9),
+};
+
+static const struct mtk_pin_ies_smt_set mt8167_smt_set[] = {
+	MTK_PIN_IES_SMT_SPEC(0, 6, 0xA00, 2),
+	MTK_PIN_IES_SMT_SPEC(7, 10, 0xA00, 3),
+	MTK_PIN_IES_SMT_SPEC(11, 13, 0xA00, 12),
+	MTK_PIN_IES_SMT_SPEC(14, 17, 0xA00, 13),
+	MTK_PIN_IES_SMT_SPEC(18, 20, 0xA10, 10),
+	MTK_PIN_IES_SMT_SPEC(21, 23, 0xA00, 13),
+	MTK_PIN_IES_SMT_SPEC(24, 25, 0xA00, 12),
+	MTK_PIN_IES_SMT_SPEC(26, 30, 0xA00, 0),
+	MTK_PIN_IES_SMT_SPEC(31, 33, 0xA00, 1),
+	MTK_PIN_IES_SMT_SPEC(34, 39, 0xA900, 2),
+	MTK_PIN_IES_SMT_SPEC(40, 40, 0xA10, 11),
+	MTK_PIN_IES_SMT_SPEC(41, 43, 0xA00, 10),
+	MTK_PIN_IES_SMT_SPEC(44, 47, 0xA00, 11),
+	MTK_PIN_IES_SMT_SPEC(48, 51, 0xA00, 14),
+	MTK_PIN_IES_SMT_SPEC(52, 53, 0xA10, 0),
+	MTK_PIN_IES_SMT_SPEC(54, 54, 0xA10, 2),
+	MTK_PIN_IES_SMT_SPEC(55, 57, 0xA10, 4),
+	MTK_PIN_IES_SMT_SPEC(58, 59, 0xA00, 15),
+	MTK_PIN_IES_SMT_SPEC(60, 61, 0xA10, 1),
+	MTK_PIN_IES_SMT_SPEC(62, 65, 0xA10, 5),
+	MTK_PIN_IES_SMT_SPEC(66, 67, 0xA10, 6),
+	MTK_PIN_IES_SMT_SPEC(68, 68, 0xA30, 2),
+	MTK_PIN_IES_SMT_SPEC(69, 69, 0xA30, 1),
+	MTK_PIN_IES_SMT_SPEC(70, 70, 0xA30, 3),
+	MTK_PIN_IES_SMT_SPEC(71, 71, 0xA30, 4),
+	MTK_PIN_IES_SMT_SPEC(72, 72, 0xA30, 5),
+	MTK_PIN_IES_SMT_SPEC(73, 73, 0xA30, 6),
+
+	MTK_PIN_IES_SMT_SPEC(100, 103, 0xA10, 7),
+	MTK_PIN_IES_SMT_SPEC(104, 104, 0xA20, 12),
+	MTK_PIN_IES_SMT_SPEC(105, 105, 0xA20, 11),
+	MTK_PIN_IES_SMT_SPEC(106, 106, 0xA30, 13),
+	MTK_PIN_IES_SMT_SPEC(107, 107, 0xA20, 14),
+	MTK_PIN_IES_SMT_SPEC(108, 108, 0xA20, 15),
+	MTK_PIN_IES_SMT_SPEC(109, 109, 0xA30, 0),
+	MTK_PIN_IES_SMT_SPEC(110, 110, 0xA20, 9),
+	MTK_PIN_IES_SMT_SPEC(111, 111, 0xA20, 8),
+	MTK_PIN_IES_SMT_SPEC(112, 112, 0xA20, 7),
+	MTK_PIN_IES_SMT_SPEC(113, 113, 0xA20, 6),
+	MTK_PIN_IES_SMT_SPEC(114, 114, 0xA20, 10),
+	MTK_PIN_IES_SMT_SPEC(115, 115, 0xA20, 1),
+	MTK_PIN_IES_SMT_SPEC(116, 116, 0xA20, 0),
+	MTK_PIN_IES_SMT_SPEC(117, 117, 0xA20, 5),
+	MTK_PIN_IES_SMT_SPEC(118, 118, 0xA20, 4),
+	MTK_PIN_IES_SMT_SPEC(119, 119, 0xA20, 3),
+	MTK_PIN_IES_SMT_SPEC(120, 120, 0xA20, 2),
+	MTK_PIN_IES_SMT_SPEC(121, 124, 0xA10, 9),
+};
+
+static int mt8167_ies_smt_set(struct regmap *regmap, unsigned int pin,
+		unsigned char align, int value, enum pin_config_param arg)
+{
+	if (arg == PIN_CONFIG_INPUT_ENABLE)
+		return mtk_pconf_spec_set_ies_smt_range(regmap, mt8167_ies_set,
+			ARRAY_SIZE(mt8167_ies_set), pin, align, value);
+	else if (arg == PIN_CONFIG_INPUT_SCHMITT_ENABLE)
+		return mtk_pconf_spec_set_ies_smt_range(regmap, mt8167_smt_set,
+			ARRAY_SIZE(mt8167_smt_set), pin, align, value);
+	return -EINVAL;
+}
+
+static const struct mtk_pinctrl_devdata mt8167_pinctrl_data = {
+	.pins = mtk_pins_mt8167,
+	.npins = ARRAY_SIZE(mtk_pins_mt8167),
+	.grp_desc = mt8167_drv_grp,
+	.n_grp_cls = ARRAY_SIZE(mt8167_drv_grp),
+	.pin_drv_grp = mt8167_pin_drv,
+	.n_pin_drv_grps = ARRAY_SIZE(mt8167_pin_drv),
+	.spec_pull_set = mt8167_spec_pull_set,
+	.spec_ies_smt_set = mt8167_ies_smt_set,
+	.dir_offset = 0x0000,
+	.pullen_offset = 0x0500,
+	.pullsel_offset = 0x0600,
+	.dout_offset = 0x0100,
+	.din_offset = 0x0200,
+	.pinmux_offset = 0x0300,
+	.type1_start = 125,
+	.type1_end = 125,
+	.port_shf = 4,
+	.port_mask = 0xf,
+	.port_align = 4,
+	.eint_hw = {
+		.port_mask = 7,
+		.ports     = 6,
+		.ap_num    = 169,
+		.db_cnt    = 64,
+	},
+};
+
+static int mt8167_pinctrl_probe(struct platform_device *pdev)
+{
+	return mtk_pctrl_init(pdev, &mt8167_pinctrl_data, NULL);
+}
+
+static const struct of_device_id mt8167_pctrl_match[] = {
+	{
+		.compatible = "mediatek,mt8167-pinctrl",
+	},
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, mt8167_pctrl_match);
+
+static struct platform_driver mtk_pinctrl_driver = {
+	.probe = mt8167_pinctrl_probe,
+	.driver = {
+		.name = "mediatek-mt8167-pinctrl",
+		.of_match_table = mt8167_pctrl_match,
+		.pm = &mtk_eint_pm_ops,
+	},
+};
+
+static int __init mtk_pinctrl_init(void)
+{
+	return platform_driver_register(&mtk_pinctrl_driver);
+}
+arch_initcall(mtk_pinctrl_init);
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8167.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8167.h
new file mode 100644
index 000000000000..225c41fc9b75
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8167.h
@@ -0,0 +1,1248 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 MediaTek Inc.
+ */
+#ifndef __PINCTRL_MTK_MT8167_H
+#define __PINCTRL_MTK_MT8167_H
+
+#include <linux/pinctrl/pinctrl.h>
+#include "pinctrl-mtk-common.h"
+
+static const struct mtk_desc_pin mtk_pins_mt8167[] = {
+	MTK_PIN(
+		PINCTRL_PIN(0, "EINT0"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 0),
+		MTK_FUNCTION(0, "GPIO0"),
+		MTK_FUNCTION(1, "PWM_B"),
+		MTK_FUNCTION(2, "DPI_CK"),
+		MTK_FUNCTION(3, "I2S2_BCK"),
+		MTK_FUNCTION(4, "EXT_TXD0"),
+		MTK_FUNCTION(6, "SQICS"),
+		MTK_FUNCTION(7, "DBG_MON_A[6]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(1, "EINT1"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 1),
+		MTK_FUNCTION(0, "GPIO1"),
+		MTK_FUNCTION(1, "PWM_C"),
+		MTK_FUNCTION(2, "DPI_D12"),
+		MTK_FUNCTION(3, "I2S2_DI"),
+		MTK_FUNCTION(4, "EXT_TXD1"),
+		MTK_FUNCTION(5, "CONN_MCU_TDO"),
+		MTK_FUNCTION(6, "SQISO"),
+		MTK_FUNCTION(7, "DBG_MON_A[7]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(2, "EINT2"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 2),
+		MTK_FUNCTION(0, "GPIO2"),
+		MTK_FUNCTION(1, "CLKM0"),
+		MTK_FUNCTION(2, "DPI_D13"),
+		MTK_FUNCTION(3, "I2S2_LRCK"),
+		MTK_FUNCTION(4, "EXT_TXD2"),
+		MTK_FUNCTION(5, "CONN_MCU_DBGACK_N"),
+		MTK_FUNCTION(6, "SQISI"),
+		MTK_FUNCTION(7, "DBG_MON_A[8]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(3, "EINT3"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 3),
+		MTK_FUNCTION(0, "GPIO3"),
+		MTK_FUNCTION(1, "CLKM1"),
+		MTK_FUNCTION(2, "DPI_D14"),
+		MTK_FUNCTION(3, "SPI_MI"),
+		MTK_FUNCTION(4, "EXT_TXD3"),
+		MTK_FUNCTION(5, "CONN_MCU_DBGI_N"),
+		MTK_FUNCTION(6, "SQIWP"),
+		MTK_FUNCTION(7, "DBG_MON_A[9]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(4, "EINT4"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 4),
+		MTK_FUNCTION(0, "GPIO4"),
+		MTK_FUNCTION(1, "CLKM2"),
+		MTK_FUNCTION(2, "DPI_D15"),
+		MTK_FUNCTION(3, "SPI_MO"),
+		MTK_FUNCTION(4, "EXT_TXC"),
+		MTK_FUNCTION(5, "CONN_MCU_TCK"),
+		MTK_FUNCTION(6, "CONN_MCU_AICE_JCKC"),
+		MTK_FUNCTION(7, "DBG_MON_A[10]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(5, "EINT5"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 5),
+		MTK_FUNCTION(0, "GPIO5"),
+		MTK_FUNCTION(1, "UCTS2"),
+		MTK_FUNCTION(2, "DPI_D16"),
+		MTK_FUNCTION(3, "SPI_CSB"),
+		MTK_FUNCTION(4, "EXT_RXER"),
+		MTK_FUNCTION(5, "CONN_MCU_TDI"),
+		MTK_FUNCTION(6, "CONN_TEST_CK"),
+		MTK_FUNCTION(7, "DBG_MON_A[11]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(6, "EINT6"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 6),
+		MTK_FUNCTION(0, "GPIO6"),
+		MTK_FUNCTION(1, "URTS2"),
+		MTK_FUNCTION(2, "DPI_D17"),
+		MTK_FUNCTION(3, "SPI_CLK"),
+		MTK_FUNCTION(4, "EXT_RXC"),
+		MTK_FUNCTION(5, "CONN_MCU_TRST_B"),
+		MTK_FUNCTION(6, "MM_TEST_CK"),
+		MTK_FUNCTION(7, "DBG_MON_A[12]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(7, "EINT7"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 7),
+		MTK_FUNCTION(0, "GPIO7"),
+		MTK_FUNCTION(1, "SQIRST"),
+		MTK_FUNCTION(2, "DPI_D6"),
+		MTK_FUNCTION(3, "SDA1_0"),
+		MTK_FUNCTION(4, "EXT_RXDV"),
+		MTK_FUNCTION(5, "CONN_MCU_TMS"),
+		MTK_FUNCTION(6, "CONN_MCU_AICE_JMSC"),
+		MTK_FUNCTION(7, "DBG_MON_A[13]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(8, "EINT8"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 8),
+		MTK_FUNCTION(0, "GPIO8"),
+		MTK_FUNCTION(1, "SQICK"),
+		MTK_FUNCTION(2, "CLKM3"),
+		MTK_FUNCTION(3, "SCL1_0"),
+		MTK_FUNCTION(4, "EXT_RXD0"),
+		MTK_FUNCTION(5, "ANT_SEL0"),
+		MTK_FUNCTION(6, "DPI_D7"),
+		MTK_FUNCTION(7, "DBG_MON_A[14]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(9, "EINT9"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 9),
+		MTK_FUNCTION(0, "GPIO9"),
+		MTK_FUNCTION(1, "CLKM4"),
+		MTK_FUNCTION(2, "SDA2_0"),
+		MTK_FUNCTION(3, "EXT_FRAME_SYNC"),
+		MTK_FUNCTION(4, "EXT_RXD1"),
+		MTK_FUNCTION(5, "ANT_SEL1"),
+		MTK_FUNCTION(6, "DPI_D8"),
+		MTK_FUNCTION(7, "DBG_MON_A[15]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(10, "EINT10"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 10),
+		MTK_FUNCTION(0, "GPIO10"),
+		MTK_FUNCTION(1, "CLKM5"),
+		MTK_FUNCTION(2, "SCL2_0"),
+		MTK_FUNCTION(3, "EXT_FRAME_SYNC"),
+		MTK_FUNCTION(4, "EXT_RXD2"),
+		MTK_FUNCTION(5, "ANT_SEL2"),
+		MTK_FUNCTION(6, "DPI_D9"),
+		MTK_FUNCTION(7, "DBG_MON_A[16]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(11, "EINT11"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 11),
+		MTK_FUNCTION(0, "GPIO11"),
+		MTK_FUNCTION(1, "CLKM4"),
+		MTK_FUNCTION(2, "PWM_C"),
+		MTK_FUNCTION(3, "CONN_TEST_CK"),
+		MTK_FUNCTION(4, "ANT_SEL3"),
+		MTK_FUNCTION(5, "DPI_D10"),
+		MTK_FUNCTION(6, "EXT_RXD3"),
+		MTK_FUNCTION(7, "DBG_MON_A[17]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(12, "EINT12"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 12),
+		MTK_FUNCTION(0, "GPIO12"),
+		MTK_FUNCTION(1, "CLKM5"),
+		MTK_FUNCTION(2, "PWM_A"),
+		MTK_FUNCTION(3, "SPDIF_OUT"),
+		MTK_FUNCTION(4, "ANT_SEL4"),
+		MTK_FUNCTION(5, "DPI_D11"),
+		MTK_FUNCTION(6, "EXT_TXEN"),
+		MTK_FUNCTION(7, "DBG_MON_A[18]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(13, "EINT13"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 13),
+		MTK_FUNCTION(0, "GPIO13"),
+		MTK_FUNCTION(3, "TSF_IN"),
+		MTK_FUNCTION(4, "ANT_SEL5"),
+		MTK_FUNCTION(5, "DPI_D0"),
+		MTK_FUNCTION(6, "SPDIF_IN"),
+		MTK_FUNCTION(7, "DBG_MON_A[19]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(14, "EINT14"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 14),
+		MTK_FUNCTION(0, "GPIO14"),
+		MTK_FUNCTION(2, "I2S_8CH_DO1"),
+		MTK_FUNCTION(3, "TDM_RX_MCK"),
+		MTK_FUNCTION(4, "ANT_SEL1"),
+		MTK_FUNCTION(5, "CONN_MCU_DBGACK_N"),
+		MTK_FUNCTION(6, "NCLE"),
+		MTK_FUNCTION(7, "DBG_MON_B[8]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(15, "EINT15"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 15),
+		MTK_FUNCTION(0, "GPIO15"),
+		MTK_FUNCTION(2, "I2S_8CH_LRCK"),
+		MTK_FUNCTION(3, "TDM_RX_BCK"),
+		MTK_FUNCTION(4, "ANT_SEL2"),
+		MTK_FUNCTION(5, "CONN_MCU_DBGI_N"),
+		MTK_FUNCTION(6, "NCEB1"),
+		MTK_FUNCTION(7, "DBG_MON_B[9]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(16, "EINT16"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 16),
+		MTK_FUNCTION(0, "GPIO16"),
+		MTK_FUNCTION(2, "I2S_8CH_BCK"),
+		MTK_FUNCTION(3, "TDM_RX_LRCK"),
+		MTK_FUNCTION(4, "ANT_SEL3"),
+		MTK_FUNCTION(5, "CONN_MCU_TRST_B"),
+		MTK_FUNCTION(6, "NCEB0"),
+		MTK_FUNCTION(7, "DBG_MON_B[10]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(17, "EINT17"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 17),
+		MTK_FUNCTION(0, "GPIO17"),
+		MTK_FUNCTION(2, "I2S_8CH_MCK"),
+		MTK_FUNCTION(3, "TDM_RX_DI"),
+		MTK_FUNCTION(4, "IDDIG"),
+		MTK_FUNCTION(5, "ANT_SEL4"),
+		MTK_FUNCTION(6, "NREB"),
+		MTK_FUNCTION(7, "DBG_MON_B[11]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(18, "EINT18"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 18),
+		MTK_FUNCTION(0, "GPIO18"),
+		MTK_FUNCTION(2, "USB_DRVVBUS"),
+		MTK_FUNCTION(3, "I2S3_LRCK"),
+		MTK_FUNCTION(4, "CLKM1"),
+		MTK_FUNCTION(5, "ANT_SEL3"),
+		MTK_FUNCTION(6, "I2S2_BCK"),
+		MTK_FUNCTION(7, "DBG_MON_A[20]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(19, "EINT19"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 19),
+		MTK_FUNCTION(0, "GPIO19"),
+		MTK_FUNCTION(1, "UCTS1"),
+		MTK_FUNCTION(2, "IDDIG"),
+		MTK_FUNCTION(3, "I2S3_BCK"),
+		MTK_FUNCTION(4, "CLKM2"),
+		MTK_FUNCTION(5, "ANT_SEL4"),
+		MTK_FUNCTION(6, "I2S2_DI"),
+		MTK_FUNCTION(7, "DBG_MON_A[21]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(20, "EINT20"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 20),
+		MTK_FUNCTION(0, "GPIO20"),
+		MTK_FUNCTION(1, "URTS1"),
+		MTK_FUNCTION(3, "I2S3_DO"),
+		MTK_FUNCTION(4, "CLKM3"),
+		MTK_FUNCTION(5, "ANT_SEL5"),
+		MTK_FUNCTION(6, "I2S2_LRCK"),
+		MTK_FUNCTION(7, "DBG_MON_A[22]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(21, "EINT21"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 21),
+		MTK_FUNCTION(0, "GPIO21"),
+		MTK_FUNCTION(1, "NRNB"),
+		MTK_FUNCTION(2, "ANT_SEL0"),
+		MTK_FUNCTION(3, "I2S_8CH_DO4"),
+		MTK_FUNCTION(7, "DBG_MON_B[31]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(22, "EINT22"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 22),
+		MTK_FUNCTION(0, "GPIO22"),
+		MTK_FUNCTION(2, "I2S_8CH_DO2"),
+		MTK_FUNCTION(3, "TSF_IN"),
+		MTK_FUNCTION(4, "USB_DRVVBUS"),
+		MTK_FUNCTION(5, "SPDIF_OUT"),
+		MTK_FUNCTION(6, "NRE_C"),
+		MTK_FUNCTION(7, "DBG_MON_B[12]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(23, "EINT23"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 23),
+		MTK_FUNCTION(0, "GPIO23"),
+		MTK_FUNCTION(2, "I2S_8CH_DO3"),
+		MTK_FUNCTION(3, "CLKM0"),
+		MTK_FUNCTION(4, "IR"),
+		MTK_FUNCTION(5, "SPDIF_IN"),
+		MTK_FUNCTION(6, "NDQS_C"),
+		MTK_FUNCTION(7, "DBG_MON_B[13]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(24, "EINT24"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 24),
+		MTK_FUNCTION(0, "GPIO24"),
+		MTK_FUNCTION(1, "DPI_D20"),
+		MTK_FUNCTION(2, "DPI_DE"),
+		MTK_FUNCTION(3, "ANT_SEL1"),
+		MTK_FUNCTION(4, "UCTS2"),
+		MTK_FUNCTION(5, "PWM_A"),
+		MTK_FUNCTION(6, "I2S0_MCK"),
+		MTK_FUNCTION(7, "DBG_MON_A[0]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(25, "EINT25"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 25),
+		MTK_FUNCTION(0, "GPIO25"),
+		MTK_FUNCTION(1, "DPI_D19"),
+		MTK_FUNCTION(2, "DPI_VSYNC"),
+		MTK_FUNCTION(3, "ANT_SEL0"),
+		MTK_FUNCTION(4, "URTS2"),
+		MTK_FUNCTION(5, "PWM_B"),
+		MTK_FUNCTION(6, "I2S_8CH_MCK"),
+		MTK_FUNCTION(7, "DBG_MON_A[1]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(26, "PWRAP_SPI0_MI"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 26),
+		MTK_FUNCTION(0, "GPIO26"),
+		MTK_FUNCTION(1, "PWRAP_SPI0_MO"),
+		MTK_FUNCTION(2, "PWRAP_SPI0_MI")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(27, "PWRAP_SPI0_MO"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 27),
+		MTK_FUNCTION(0, "GPIO27"),
+		MTK_FUNCTION(1, "PWRAP_SPI0_MI"),
+		MTK_FUNCTION(2, "PWRAP_SPI0_MO")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(28, "PWRAP_INT"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 28),
+		MTK_FUNCTION(0, "GPIO28"),
+		MTK_FUNCTION(1, "I2S0_MCK"),
+		MTK_FUNCTION(4, "I2S_8CH_MCK"),
+		MTK_FUNCTION(5, "I2S2_MCK"),
+		MTK_FUNCTION(6, "I2S3_MCK")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(29, "PWRAP_SPI0_CK"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 29),
+		MTK_FUNCTION(0, "GPIO29"),
+		MTK_FUNCTION(1, "PWRAP_SPI0_CK")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(30, "PWRAP_SPI0_CSN"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 30),
+		MTK_FUNCTION(0, "GPIO30"),
+		MTK_FUNCTION(1, "PWRAP_SPI0_CSN")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(31, "RTC32K_CK"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 31),
+		MTK_FUNCTION(0, "GPIO31"),
+		MTK_FUNCTION(1, "RTC32K_CK")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(32, "WATCHDOG"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 32),
+		MTK_FUNCTION(0, "GPIO32"),
+		MTK_FUNCTION(1, "WATCHDOG")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(33, "SRCLKENA"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 33),
+		MTK_FUNCTION(0, "GPIO33"),
+		MTK_FUNCTION(1, "SRCLKENA0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(34, "URXD2"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 34),
+		MTK_FUNCTION(0, "GPIO34"),
+		MTK_FUNCTION(1, "URXD2"),
+		MTK_FUNCTION(2, "DPI_D5"),
+		MTK_FUNCTION(3, "UTXD2"),
+		MTK_FUNCTION(4, "DBG_SCL"),
+		MTK_FUNCTION(6, "I2S2_MCK"),
+		MTK_FUNCTION(7, "DBG_MON_B[0]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(35, "UTXD2"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 35),
+		MTK_FUNCTION(0, "GPIO35"),
+		MTK_FUNCTION(1, "UTXD2"),
+		MTK_FUNCTION(2, "DPI_HSYNC"),
+		MTK_FUNCTION(3, "URXD2"),
+		MTK_FUNCTION(4, "DBG_SDA"),
+		MTK_FUNCTION(5, "DPI_D18"),
+		MTK_FUNCTION(6, "I2S3_MCK"),
+		MTK_FUNCTION(7, "DBG_MON_B[1]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(36, "MRG_CLK"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 36),
+		MTK_FUNCTION(0, "GPIO36"),
+		MTK_FUNCTION(1, "MRG_CLK"),
+		MTK_FUNCTION(2, "DPI_D4"),
+		MTK_FUNCTION(3, "I2S0_BCK"),
+		MTK_FUNCTION(4, "I2S3_BCK"),
+		MTK_FUNCTION(5, "PCM0_CLK"),
+		MTK_FUNCTION(6, "IR"),
+		MTK_FUNCTION(7, "DBG_MON_A[2]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(37, "MRG_SYNC"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 37),
+		MTK_FUNCTION(0, "GPIO37"),
+		MTK_FUNCTION(1, "MRG_SYNC"),
+		MTK_FUNCTION(2, "DPI_D3"),
+		MTK_FUNCTION(3, "I2S0_LRCK"),
+		MTK_FUNCTION(4, "I2S3_LRCK"),
+		MTK_FUNCTION(5, "PCM0_SYNC"),
+		MTK_FUNCTION(6, "EXT_COL"),
+		MTK_FUNCTION(7, "DBG_MON_A[3]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(38, "MRG_DI"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 38),
+		MTK_FUNCTION(0, "GPIO38"),
+		MTK_FUNCTION(1, "MRG_DI"),
+		MTK_FUNCTION(2, "DPI_D1"),
+		MTK_FUNCTION(3, "I2S0_DI"),
+		MTK_FUNCTION(4, "I2S3_DO"),
+		MTK_FUNCTION(5, "PCM0_DI"),
+		MTK_FUNCTION(6, "EXT_MDIO"),
+		MTK_FUNCTION(7, "DBG_MON_A[4]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(39, "MRG_DO"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 39),
+		MTK_FUNCTION(0, "GPIO39"),
+		MTK_FUNCTION(1, "MRG_DO"),
+		MTK_FUNCTION(2, "DPI_D2"),
+		MTK_FUNCTION(3, "I2S0_MCK"),
+		MTK_FUNCTION(4, "I2S3_MCK"),
+		MTK_FUNCTION(5, "PCM0_DO"),
+		MTK_FUNCTION(6, "EXT_MDC"),
+		MTK_FUNCTION(7, "DBG_MON_A[5]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(40, "KPROW0"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 40),
+		MTK_FUNCTION(0, "GPIO40"),
+		MTK_FUNCTION(1, "KPROW0"),
+		MTK_FUNCTION(4, "IMG_TEST_CK"),
+		MTK_FUNCTION(7, "DBG_MON_B[4]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(41, "KPROW1"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 41),
+		MTK_FUNCTION(0, "GPIO41"),
+		MTK_FUNCTION(1, "KPROW1"),
+		MTK_FUNCTION(2, "IDDIG"),
+		MTK_FUNCTION(3, "EXT_FRAME_SYNC"),
+		MTK_FUNCTION(4, "MFG_TEST_CK"),
+		MTK_FUNCTION(7, "DBG_MON_B[5]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(42, "KPCOL0"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 42),
+		MTK_FUNCTION(0, "GPIO42"),
+		MTK_FUNCTION(1, "KPCOL0"),
+		MTK_FUNCTION(7, "DBG_MON_B[6]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(43, "KPCOL1"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 43),
+		MTK_FUNCTION(0, "GPIO43"),
+		MTK_FUNCTION(1, "KPCOL1"),
+		MTK_FUNCTION(2, "USB_DRVVBUS"),
+		MTK_FUNCTION(3, "EXT_FRAME_SYNC"),
+		MTK_FUNCTION(4, "TSF_IN"),
+		MTK_FUNCTION(5, "DFD_NTRST_XI"),
+		MTK_FUNCTION(6, "UDI_NTRST_XI"),
+		MTK_FUNCTION(7, "DBG_MON_B[7]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(44, "JTMS"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 44),
+		MTK_FUNCTION(0, "GPIO44"),
+		MTK_FUNCTION(1, "JTMS"),
+		MTK_FUNCTION(2, "CONN_MCU_TMS"),
+		MTK_FUNCTION(3, "CONN_MCU_AICE_JMSC"),
+		MTK_FUNCTION(4, "GPUDFD_TMS_XI"),
+		MTK_FUNCTION(5, "DFD_TMS_XI"),
+		MTK_FUNCTION(6, "UDI_TMS_XI")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(45, "JTCK"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 45),
+		MTK_FUNCTION(0, "GPIO45"),
+		MTK_FUNCTION(1, "JTCK"),
+		MTK_FUNCTION(2, "CONN_MCU_TCK"),
+		MTK_FUNCTION(3, "CONN_MCU_AICE_JCKC"),
+		MTK_FUNCTION(4, "GPUDFD_TCK_XI"),
+		MTK_FUNCTION(5, "DFD_TCK_XI"),
+		MTK_FUNCTION(6, "UDI_TCK_XI")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(46, "JTDI"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 46),
+		MTK_FUNCTION(0, "GPIO46"),
+		MTK_FUNCTION(1, "JTDI"),
+		MTK_FUNCTION(2, "CONN_MCU_TDI"),
+		MTK_FUNCTION(4, "GPUDFD_TDI_XI"),
+		MTK_FUNCTION(5, "DFD_TDI_XI"),
+		MTK_FUNCTION(6, "UDI_TDI_XI")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(47, "JTDO"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 47),
+		MTK_FUNCTION(0, "GPIO47"),
+		MTK_FUNCTION(1, "JTDO"),
+		MTK_FUNCTION(2, "CONN_MCU_TDO"),
+		MTK_FUNCTION(4, "GPUDFD_TDO"),
+		MTK_FUNCTION(5, "DFD_TDO"),
+		MTK_FUNCTION(6, "UDI_TDO")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(48, "SPI_CS"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 48),
+		MTK_FUNCTION(0, "GPIO48"),
+		MTK_FUNCTION(1, "SPI_CSB"),
+		MTK_FUNCTION(3, "I2S0_DI"),
+		MTK_FUNCTION(4, "I2S2_BCK"),
+		MTK_FUNCTION(7, "DBG_MON_A[23]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(49, "SPI_CK"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 49),
+		MTK_FUNCTION(0, "GPIO49"),
+		MTK_FUNCTION(1, "SPI_CLK"),
+		MTK_FUNCTION(3, "I2S0_LRCK"),
+		MTK_FUNCTION(4, "I2S2_DI"),
+		MTK_FUNCTION(7, "DBG_MON_A[24]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(50, "SPI_MI"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 50),
+		MTK_FUNCTION(0, "GPIO50"),
+		MTK_FUNCTION(1, "SPI_MI"),
+		MTK_FUNCTION(2, "SPI_MO"),
+		MTK_FUNCTION(3, "I2S0_BCK"),
+		MTK_FUNCTION(4, "I2S2_LRCK"),
+		MTK_FUNCTION(7, "DBG_MON_A[25]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(51, "SPI_MO"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 51),
+		MTK_FUNCTION(0, "GPIO51"),
+		MTK_FUNCTION(1, "SPI_MO"),
+		MTK_FUNCTION(2, "SPI_MI"),
+		MTK_FUNCTION(3, "I2S0_MCK"),
+		MTK_FUNCTION(4, "I2S2_MCK"),
+		MTK_FUNCTION(7, "DBG_MON_A[26]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(52, "SDA1"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 52),
+		MTK_FUNCTION(0, "GPIO52"),
+		MTK_FUNCTION(1, "SDA1_0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(53, "SCL1"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 53),
+		MTK_FUNCTION(0, "GPIO53"),
+		MTK_FUNCTION(1, "SCL1_0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(54, "DISP_PWM"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 54),
+		MTK_FUNCTION(0, "GPIO54"),
+		MTK_FUNCTION(1, "DISP_PWM"),
+		MTK_FUNCTION(2, "PWM_B"),
+		MTK_FUNCTION(7, "DBG_MON_B[2]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(55, "I2S_DATA_IN"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 55),
+		MTK_FUNCTION(0, "GPIO55"),
+		MTK_FUNCTION(1, "I2S0_DI"),
+		MTK_FUNCTION(2, "UCTS0"),
+		MTK_FUNCTION(3, "I2S3_DO"),
+		MTK_FUNCTION(4, "I2S_8CH_DO1"),
+		MTK_FUNCTION(5, "PWM_A"),
+		MTK_FUNCTION(6, "I2S2_BCK"),
+		MTK_FUNCTION(7, "DBG_MON_A[28]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(56, "I2S_LRCK"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 56),
+		MTK_FUNCTION(0, "GPIO56"),
+		MTK_FUNCTION(1, "I2S0_LRCK"),
+		MTK_FUNCTION(3, "I2S3_LRCK"),
+		MTK_FUNCTION(4, "I2S_8CH_LRCK"),
+		MTK_FUNCTION(5, "PWM_B"),
+		MTK_FUNCTION(6, "I2S2_DI"),
+		MTK_FUNCTION(7, "DBG_MON_A[29]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(57, "I2S_BCK"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 57),
+		MTK_FUNCTION(0, "GPIO57"),
+		MTK_FUNCTION(1, "I2S0_BCK"),
+		MTK_FUNCTION(2, "URTS0"),
+		MTK_FUNCTION(3, "I2S3_BCK"),
+		MTK_FUNCTION(4, "I2S_8CH_BCK"),
+		MTK_FUNCTION(5, "PWM_C"),
+		MTK_FUNCTION(6, "I2S2_LRCK"),
+		MTK_FUNCTION(7, "DBG_MON_A[30]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(58, "SDA0"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 58),
+		MTK_FUNCTION(0, "GPIO58"),
+		MTK_FUNCTION(1, "SDA0_0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(59, "SCL0"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 59),
+		MTK_FUNCTION(0, "GPIO59"),
+		MTK_FUNCTION(1, "SCL0_0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(60, "SDA2"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 60),
+		MTK_FUNCTION(0, "GPIO60"),
+		MTK_FUNCTION(1, "SDA2_0"),
+		MTK_FUNCTION(2, "PWM_B")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(61, "SCL2"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 61),
+		MTK_FUNCTION(0, "GPIO61"),
+		MTK_FUNCTION(1, "SCL2_0"),
+		MTK_FUNCTION(2, "PWM_C")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(62, "URXD0"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 62),
+		MTK_FUNCTION(0, "GPIO62"),
+		MTK_FUNCTION(1, "URXD0"),
+		MTK_FUNCTION(2, "UTXD0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(63, "UTXD0"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 63),
+		MTK_FUNCTION(0, "GPIO63"),
+		MTK_FUNCTION(1, "UTXD0"),
+		MTK_FUNCTION(2, "URXD0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(64, "URXD1"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 64),
+		MTK_FUNCTION(0, "GPIO64"),
+		MTK_FUNCTION(1, "URXD1"),
+		MTK_FUNCTION(2, "UTXD1"),
+		MTK_FUNCTION(7, "DBG_MON_A[27]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(65, "UTXD1"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 65),
+		MTK_FUNCTION(0, "GPIO65"),
+		MTK_FUNCTION(1, "UTXD1"),
+		MTK_FUNCTION(2, "URXD1"),
+		MTK_FUNCTION(7, "DBG_MON_A[31]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(66, "LCM_RST"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 66),
+		MTK_FUNCTION(0, "GPIO66"),
+		MTK_FUNCTION(1, "LCM_RST"),
+		MTK_FUNCTION(3, "I2S0_MCK"),
+		MTK_FUNCTION(7, "DBG_MON_B[3]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(67, "DSI_TE"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 67),
+		MTK_FUNCTION(0, "GPIO67"),
+		MTK_FUNCTION(1, "DSI_TE"),
+		MTK_FUNCTION(3, "I2S_8CH_MCK"),
+		MTK_FUNCTION(7, "DBG_MON_B[14]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(68, "MSDC2_CMD"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 68),
+		MTK_FUNCTION(0, "GPIO68"),
+		MTK_FUNCTION(1, "MSDC2_CMD"),
+		MTK_FUNCTION(2, "I2S_8CH_DO4"),
+		MTK_FUNCTION(3, "SDA1_0"),
+		MTK_FUNCTION(5, "USB_SDA"),
+		MTK_FUNCTION(6, "I2S3_BCK"),
+		MTK_FUNCTION(7, "DBG_MON_B[15]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(69, "MSDC2_CLK"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 69),
+		MTK_FUNCTION(0, "GPIO69"),
+		MTK_FUNCTION(1, "MSDC2_CLK"),
+		MTK_FUNCTION(2, "I2S_8CH_DO3"),
+		MTK_FUNCTION(3, "SCL1_0"),
+		MTK_FUNCTION(4, "DPI_D21"),
+		MTK_FUNCTION(5, "USB_SCL"),
+		MTK_FUNCTION(6, "I2S3_LRCK"),
+		MTK_FUNCTION(7, "DBG_MON_B[16]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(70, "MSDC2_DAT0"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 70),
+		MTK_FUNCTION(0, "GPIO70"),
+		MTK_FUNCTION(1, "MSDC2_DAT0"),
+		MTK_FUNCTION(2, "I2S_8CH_DO2"),
+		MTK_FUNCTION(4, "DPI_D22"),
+		MTK_FUNCTION(5, "UTXD0"),
+		MTK_FUNCTION(6, "I2S3_DO"),
+		MTK_FUNCTION(7, "DBG_MON_B[17]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(71, "MSDC2_DAT1"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 71),
+		MTK_FUNCTION(0, "GPIO71"),
+		MTK_FUNCTION(1, "MSDC2_DAT1"),
+		MTK_FUNCTION(2, "I2S_8CH_DO1"),
+		MTK_FUNCTION(3, "PWM_A"),
+		MTK_FUNCTION(4, "I2S3_MCK"),
+		MTK_FUNCTION(5, "URXD0"),
+		MTK_FUNCTION(6, "PWM_B"),
+		MTK_FUNCTION(7, "DBG_MON_B[18]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(72, "MSDC2_DAT2"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 72),
+		MTK_FUNCTION(0, "GPIO72"),
+		MTK_FUNCTION(1, "MSDC2_DAT2"),
+		MTK_FUNCTION(2, "I2S_8CH_LRCK"),
+		MTK_FUNCTION(3, "SDA2_0"),
+		MTK_FUNCTION(4, "DPI_D23"),
+		MTK_FUNCTION(5, "UTXD1"),
+		MTK_FUNCTION(6, "PWM_C"),
+		MTK_FUNCTION(7, "DBG_MON_B[19]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(73, "MSDC2_DAT3"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 73),
+		MTK_FUNCTION(0, "GPIO73"),
+		MTK_FUNCTION(1, "MSDC2_DAT3"),
+		MTK_FUNCTION(2, "I2S_8CH_BCK"),
+		MTK_FUNCTION(3, "SCL2_0"),
+		MTK_FUNCTION(4, "EXT_FRAME_SYNC"),
+		MTK_FUNCTION(5, "URXD1"),
+		MTK_FUNCTION(6, "PWM_A"),
+		MTK_FUNCTION(7, "DBG_MON_B[20]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(74, "TDN3"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 74),
+		MTK_FUNCTION(0, "GPI74"),
+		MTK_FUNCTION(1, "TDN3")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(75, "TDP3"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 75),
+		MTK_FUNCTION(0, "GPI75"),
+		MTK_FUNCTION(1, "TDP3")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(76, "TDN2"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 76),
+		MTK_FUNCTION(0, "GPI76"),
+		MTK_FUNCTION(1, "TDN2")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(77, "TDP2"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 77),
+		MTK_FUNCTION(0, "GPI77"),
+		MTK_FUNCTION(1, "TDP2")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(78, "TCN"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 78),
+		MTK_FUNCTION(0, "GPI78"),
+		MTK_FUNCTION(1, "TCN")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(79, "TCP"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 79),
+		MTK_FUNCTION(0, "GPI79"),
+		MTK_FUNCTION(1, "TCP")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(80, "TDN1"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 80),
+		MTK_FUNCTION(0, "GPI80"),
+		MTK_FUNCTION(1, "TDN1")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(81, "TDP1"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 81),
+		MTK_FUNCTION(0, "GPI81"),
+		MTK_FUNCTION(1, "TDP1")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(82, "TDN0"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 82),
+		MTK_FUNCTION(0, "GPI82"),
+		MTK_FUNCTION(1, "TDN0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(83, "TDP0"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 83),
+		MTK_FUNCTION(0, "GPI83"),
+		MTK_FUNCTION(1, "TDP0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(84, "RDN0"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 84),
+		MTK_FUNCTION(0, "GPI84"),
+		MTK_FUNCTION(1, "RDN0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(85, "RDP0"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 85),
+		MTK_FUNCTION(0, "GPI85"),
+		MTK_FUNCTION(1, "RDP0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(86, "RDN1"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 86),
+		MTK_FUNCTION(0, "GPI86"),
+		MTK_FUNCTION(1, "RDN1")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(87, "RDP1"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 87),
+		MTK_FUNCTION(0, "GPI87"),
+		MTK_FUNCTION(1, "RDP1")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(88, "RCN"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 88),
+		MTK_FUNCTION(0, "GPI88"),
+		MTK_FUNCTION(1, "RCN")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(89, "RCP"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 89),
+		MTK_FUNCTION(0, "GPI89"),
+		MTK_FUNCTION(1, "RCP")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(90, "RDN2"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 90),
+		MTK_FUNCTION(0, "GPI90"),
+		MTK_FUNCTION(1, "RDN2"),
+		MTK_FUNCTION(2, "CMDAT8")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(91, "RDP2"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 91),
+		MTK_FUNCTION(0, "GPI91"),
+		MTK_FUNCTION(1, "RDP2"),
+		MTK_FUNCTION(2, "CMDAT9")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(92, "RDN3"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 92),
+		MTK_FUNCTION(0, "GPI92"),
+		MTK_FUNCTION(1, "RDN3"),
+		MTK_FUNCTION(2, "CMDAT4")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(93, "RDP3"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 93),
+		MTK_FUNCTION(0, "GPI93"),
+		MTK_FUNCTION(1, "RDP3"),
+		MTK_FUNCTION(2, "CMDAT5")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(94, "RCN_A"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 94),
+		MTK_FUNCTION(0, "GPI94"),
+		MTK_FUNCTION(1, "RCN_A"),
+		MTK_FUNCTION(2, "CMDAT6")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(95, "RCP_A"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 95),
+		MTK_FUNCTION(0, "GPI95"),
+		MTK_FUNCTION(1, "RCP_A"),
+		MTK_FUNCTION(2, "CMDAT7")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(96, "RDN1_A"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 96),
+		MTK_FUNCTION(0, "GPI96"),
+		MTK_FUNCTION(1, "RDN1_A"),
+		MTK_FUNCTION(2, "CMDAT2"),
+		MTK_FUNCTION(3, "CMCSD2")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(97, "RDP1_A"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 97),
+		MTK_FUNCTION(0, "GPI97"),
+		MTK_FUNCTION(1, "RDP1_A"),
+		MTK_FUNCTION(2, "CMDAT3"),
+		MTK_FUNCTION(3, "CMCSD3")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(98, "RDN0_A"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 98),
+		MTK_FUNCTION(0, "GPI98"),
+		MTK_FUNCTION(1, "RDN0_A"),
+		MTK_FUNCTION(2, "CMHSYNC")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(99, "RDP0_A"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 99),
+		MTK_FUNCTION(0, "GPI99"),
+		MTK_FUNCTION(1, "RDP0_A"),
+		MTK_FUNCTION(2, "CMVSYNC")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(100, "CMDAT0"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 100),
+		MTK_FUNCTION(0, "GPIO100"),
+		MTK_FUNCTION(1, "CMDAT0"),
+		MTK_FUNCTION(2, "CMCSD0"),
+		MTK_FUNCTION(3, "ANT_SEL2"),
+		MTK_FUNCTION(5, "TDM_RX_MCK"),
+		MTK_FUNCTION(7, "DBG_MON_B[21]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(101, "CMDAT1"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 101),
+		MTK_FUNCTION(0, "GPIO101"),
+		MTK_FUNCTION(1, "CMDAT1"),
+		MTK_FUNCTION(2, "CMCSD1"),
+		MTK_FUNCTION(3, "ANT_SEL3"),
+		MTK_FUNCTION(4, "CMFLASH"),
+		MTK_FUNCTION(5, "TDM_RX_BCK"),
+		MTK_FUNCTION(7, "DBG_MON_B[22]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(102, "CMMCLK"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 102),
+		MTK_FUNCTION(0, "GPIO102"),
+		MTK_FUNCTION(1, "CMMCLK"),
+		MTK_FUNCTION(3, "ANT_SEL4"),
+		MTK_FUNCTION(5, "TDM_RX_LRCK"),
+		MTK_FUNCTION(7, "DBG_MON_B[23]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(103, "CMPCLK"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 103),
+		MTK_FUNCTION(0, "GPIO103"),
+		MTK_FUNCTION(1, "CMPCLK"),
+		MTK_FUNCTION(2, "CMCSK"),
+		MTK_FUNCTION(3, "ANT_SEL5"),
+		MTK_FUNCTION(5, " TDM_RX_DI"),
+		MTK_FUNCTION(7, "DBG_MON_B[24]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(104, "MSDC1_CMD"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 104),
+		MTK_FUNCTION(0, "GPIO104"),
+		MTK_FUNCTION(1, "MSDC1_CMD"),
+		MTK_FUNCTION(4, "SQICS"),
+		MTK_FUNCTION(7, "DBG_MON_B[25]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(105, "MSDC1_CLK"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 105),
+		MTK_FUNCTION(0, "GPIO105"),
+		MTK_FUNCTION(1, "MSDC1_CLK"),
+		MTK_FUNCTION(2, "UDI_NTRST_XI"),
+		MTK_FUNCTION(3, "DFD_NTRST_XI"),
+		MTK_FUNCTION(4, "SQISO"),
+		MTK_FUNCTION(5, "GPUEJ_NTRST_XI"),
+		MTK_FUNCTION(7, "DBG_MON_B[26]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(106, "MSDC1_DAT0"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 106),
+		MTK_FUNCTION(0, "GPIO106"),
+		MTK_FUNCTION(1, "MSDC1_DAT0"),
+		MTK_FUNCTION(2, "UDI_TMS_XI"),
+		MTK_FUNCTION(3, "DFD_TMS_XI"),
+		MTK_FUNCTION(4, "SQISI"),
+		MTK_FUNCTION(5, "GPUEJ_TMS_XI"),
+		MTK_FUNCTION(7, "DBG_MON_B[27]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(107, "MSDC1_DAT1"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 107),
+		MTK_FUNCTION(0, "GPIO107"),
+		MTK_FUNCTION(1, "MSDC1_DAT1"),
+		MTK_FUNCTION(2, "UDI_TCK_XI"),
+		MTK_FUNCTION(3, "DFD_TCK_XI"),
+		MTK_FUNCTION(4, "SQIWP"),
+		MTK_FUNCTION(5, "GPUEJ_TCK_XI"),
+		MTK_FUNCTION(7, "DBG_MON_B[28]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(108, "MSDC1_DAT2"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 108),
+		MTK_FUNCTION(0, "GPIO108"),
+		MTK_FUNCTION(1, "MSDC1_DAT2"),
+		MTK_FUNCTION(2, "UDI_TDI_XI"),
+		MTK_FUNCTION(3, "DFD_TDI_XI"),
+		MTK_FUNCTION(4, "SQIRST"),
+		MTK_FUNCTION(5, "GPUEJ_TDI_XI"),
+		MTK_FUNCTION(7, "DBG_MON_B[29]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(109, "MSDC1_DAT3"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 109),
+		MTK_FUNCTION(0, "GPIO109"),
+		MTK_FUNCTION(1, "MSDC1_DAT3"),
+		MTK_FUNCTION(2, "UDI_TDO"),
+		MTK_FUNCTION(3, "DFD_TDO"),
+		MTK_FUNCTION(4, "SQICK"),
+		MTK_FUNCTION(5, "GPUEJ_TDO"),
+		MTK_FUNCTION(7, "DBG_MON_B[30]")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(110, "MSDC0_DAT7"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 110),
+		MTK_FUNCTION(0, "GPIO110"),
+		MTK_FUNCTION(1, "MSDC0_DAT7"),
+		MTK_FUNCTION(4, "NLD7")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(111, "MSDC0_DAT6"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 111),
+		MTK_FUNCTION(0, "GPIO111"),
+		MTK_FUNCTION(1, "MSDC0_DAT6"),
+		MTK_FUNCTION(4, "NLD6")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(112, "MSDC0_DAT5"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 112),
+		MTK_FUNCTION(0, "GPIO112"),
+		MTK_FUNCTION(1, "MSDC0_DAT5"),
+		MTK_FUNCTION(4, "NLD4")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(113, "MSDC0_DAT4"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 113),
+		MTK_FUNCTION(0, "GPIO113"),
+		MTK_FUNCTION(1, "MSDC0_DAT4"),
+		MTK_FUNCTION(4, "NLD3")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(114, "MSDC0_RSTB"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 114),
+		MTK_FUNCTION(0, "GPIO114"),
+		MTK_FUNCTION(1, "MSDC0_RSTB"),
+		MTK_FUNCTION(4, "NLD0")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(115, "MSDC0_CMD"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 115),
+		MTK_FUNCTION(0, "GPIO115"),
+		MTK_FUNCTION(1, "MSDC0_CMD"),
+		MTK_FUNCTION(4, "NALE")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(116, "MSDC0_CLK"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 116),
+		MTK_FUNCTION(0, "GPIO116"),
+		MTK_FUNCTION(1, "MSDC0_CLK"),
+		MTK_FUNCTION(4, "NWEB")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(117, "MSDC0_DAT3"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 117),
+		MTK_FUNCTION(0, "GPIO117"),
+		MTK_FUNCTION(1, "MSDC0_DAT3"),
+		MTK_FUNCTION(4, "NLD1")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(118, "MSDC0_DAT2"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 118),
+		MTK_FUNCTION(0, "GPIO118"),
+		MTK_FUNCTION(1, "MSDC0_DAT2"),
+		MTK_FUNCTION(4, "NLD5")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(119, "MSDC0_DAT1"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 119),
+		MTK_FUNCTION(0, "GPIO119"),
+		MTK_FUNCTION(1, "MSDC0_DAT1"),
+		MTK_FUNCTION(4, "NLD8")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(120, "MSDC0_DAT0"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 120),
+		MTK_FUNCTION(0, "GPIO120"),
+		MTK_FUNCTION(1, "MSDC0_DAT0"),
+		MTK_FUNCTION(4, "WATCHDOG"),
+		MTK_FUNCTION(5, "NLD2")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(121, "CEC"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 121),
+		MTK_FUNCTION(0, "GPIO121"),
+		MTK_FUNCTION(1, "CEC")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(122, "HTPLG"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 122),
+		MTK_FUNCTION(0, "GPIO122"),
+		MTK_FUNCTION(1, "HTPLG")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(123, "HDMISCK"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 123),
+		MTK_FUNCTION(0, "GPIO123"),
+		MTK_FUNCTION(1, "HDMISCK")
+	),
+	MTK_PIN(
+		PINCTRL_PIN(124, "HDMISD"),
+		NULL, "mt8167",
+		MTK_EINT_FUNCTION(0, 124),
+		MTK_FUNCTION(0, "GPIO124"),
+		MTK_FUNCTION(1, "HDMISD")
+	),
+};
+
+#endif /* __PINCTRL_MTK_MT8167_H */
-- 
2.28.0

