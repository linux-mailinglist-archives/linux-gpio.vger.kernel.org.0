Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B881A22EE4
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2019 10:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727572AbfETIbi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 May 2019 04:31:38 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33018 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731153AbfETIbe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 May 2019 04:31:34 -0400
Received: by mail-pg1-f194.google.com with SMTP id h17so6452764pgv.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 May 2019 01:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Si56RYW0rDfcSDqNug0vtP93R/nK3dxtiVT54Kdd1dY=;
        b=bZIN8dUi+6eyNtKyt78Diu6rM48ITAzE9t3Aw9BfX0IZleiHbCYbVzt77+o352lDqj
         tOrBepTN8Zl43i8WVs377jsTQC8JpeN2UKVor1oS+LX1tdNn8uale8BGVbgdmf/qO8Xy
         azFiE6NMQIdYDdKvKdNk3UyWKzjOl7njNb9K1JibaS2ZVPLInz7nA8dZLs/ETKNaeQJS
         7cyDfPddQxmXxmirkyLGZA8BoI13Tqmxmbd9igyfRl0dvQhYS2nD0HkxBtLAreq+/iR0
         VclaBsjIs7VBWxAzxB/BCpHEgftOT3QydBz3k/YHks/pJ+RtAt5szBWItGirp9GYaOVP
         iF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Si56RYW0rDfcSDqNug0vtP93R/nK3dxtiVT54Kdd1dY=;
        b=EbbuxKfeLhQ5GHb2su83Mz71HmKlP6ft+YNMZX9VoDkpH1qvdAhIMvD8HDx2I+4urs
         HpPizxnkY7bi59wiVpmyhRQ6NHPQgF8UmsElD+FDQP9oS7mqsQKFLpiGrgHFaxRycSrd
         7pfs1D/+dgKfMsGfmHNeYbPgOFtsZTOKDsInemMzW0rX7T70TFNiQwBKikg7aiMwc54V
         WUWGGMrae+0QEYYXT3a61761de7Lzt9Es6vo4L4Ii13ySEG026XYwOId6M5WwKimD45h
         pjPSKgdI4aZ/Ex4dkw61d/wepSIdOu9BfO5eGjXDW95U+6BMWU8F2Zuad3cZBqRGJ9fj
         hBiA==
X-Gm-Message-State: APjAAAUwC6hW6gXfftTuS6hqOwz9LB01Keg6q0Bl0l+VvIOBWfnTYUF6
        OBoeyNhHSIPR+EZofaQB8+nZ
X-Google-Smtp-Source: APXvYqxAHZiNQs06FzMcON/FZ1IGTEzy70/qPNePj4tc5VVBAHYNGtKcCQNnnf5BsLeu5RxKvYfm0w==
X-Received: by 2002:a05:6a00:43:: with SMTP id i3mr599628pfk.113.1558341093415;
        Mon, 20 May 2019 01:31:33 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:7203:2717:7d22:7fdb:b76e:242c])
        by smtp.gmail.com with ESMTPSA id s72sm24068220pgc.65.2019.05.20.01.31.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 01:31:32 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     linus.walleij@linaro.org, robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        linux-gpio@vger.kernel.org, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/5] pinctrl: Rework the pinmux handling for BM1880 SoC
Date:   Mon, 20 May 2019 14:00:59 +0530
Message-Id: <20190520083101.10229-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520083101.10229-1-manivannan.sadhasivam@linaro.org>
References: <20190520083101.10229-1-manivannan.sadhasivam@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rework the BM1880 SoC pinmux handling by removing the
BM1880_PINMUX_FUNCTION_MUX define and merging it with the
BM1880_PINMUX_FUNCTION definition. Since the PWM muxing is handled by
generic pin controller in the SoC itself, there is no need to have a
dedicated code to do the muxing in PWM registers. So, lets club all
pinmux handling in the same per pin mux handling code.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pinctrl/pinctrl-bm1880.c | 323 ++++++++++++++-----------------
 1 file changed, 149 insertions(+), 174 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-bm1880.c b/drivers/pinctrl/pinctrl-bm1880.c
index 446b07d8fbfc..bddb705ea142 100644
--- a/drivers/pinctrl/pinctrl-bm1880.c
+++ b/drivers/pinctrl/pinctrl-bm1880.c
@@ -55,7 +55,6 @@ struct bm1880_pctrl_group {
  * @groups:	List of pingroups for this function.
  * @ngroups:	Number of entries in @groups.
  * @mux_val:	Selector for this function
- * @mux_mask:   Mask for function specific selector
  * @mux:	Offset of function specific mux
  * @mux_shift:	Shift for function specific selector
  */
@@ -64,7 +63,6 @@ struct bm1880_pinmux_function {
 	const char * const *groups;
 	unsigned int ngroups;
 	u32 mux_val;
-	u32 mux_mask;
 	u32 mux;
 	u8 mux_shift;
 };
@@ -636,165 +634,153 @@ static const char * const i2s1_group[] = { "i2s1_grp" };
 static const char * const i2s1_mclkin_group[] = { "i2s1_mclkin_grp" };
 static const char * const spi0_group[] = { "spi0_grp" };
 
-#define BM1880_PINMUX_FUNCTION(fname, mval, mask)	\
+#define BM1880_PINMUX_FUNCTION(fname, mval)		\
 	[F_##fname] = {					\
 		.name = #fname,				\
 		.groups = fname##_group,		\
 		.ngroups = ARRAY_SIZE(fname##_group),	\
 		.mux_val = mval,			\
-		.mux_mask = mask,			\
-	}
-
-#define BM1880_PINMUX_FUNCTION_MUX(fname, mval, mask, offset, shift)\
-	[F_##fname] = {					\
-		.name = #fname,				\
-		.groups = fname##_group,		\
-		.ngroups = ARRAY_SIZE(fname##_group),	\
-		.mux_val = mval,			\
-		.mux_mask = mask,			\
-		.mux = offset,				\
-		.mux_shift = shift,			\
 	}
 
 static const struct bm1880_pinmux_function bm1880_pmux_functions[] = {
-	BM1880_PINMUX_FUNCTION(nand, 2, 0x03),
-	BM1880_PINMUX_FUNCTION(spi, 0, 0x03),
-	BM1880_PINMUX_FUNCTION(emmc, 1, 0x03),
-	BM1880_PINMUX_FUNCTION(sdio, 0, 0x03),
-	BM1880_PINMUX_FUNCTION(eth0, 0, 0x03),
-	BM1880_PINMUX_FUNCTION_MUX(pwm0, 2, 0x0F, 0x50, 0x00),
-	BM1880_PINMUX_FUNCTION_MUX(pwm1, 2, 0x0F, 0x50, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(pwm2, 2, 0x0F, 0x50, 0x08),
-	BM1880_PINMUX_FUNCTION_MUX(pwm3, 2, 0x0F, 0x50, 0x0C),
-	BM1880_PINMUX_FUNCTION_MUX(pwm4, 2, 0x0F, 0x50, 0x10),
-	BM1880_PINMUX_FUNCTION_MUX(pwm5, 2, 0x0F, 0x50, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(pwm6, 2, 0x0F, 0x50, 0x18),
-	BM1880_PINMUX_FUNCTION_MUX(pwm7, 2, 0x0F, 0x50, 0x1C),
-	BM1880_PINMUX_FUNCTION_MUX(pwm8, 2, 0x0F, 0x54, 0x00),
-	BM1880_PINMUX_FUNCTION_MUX(pwm9, 2, 0x0F, 0x54, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(pwm10, 2, 0x0F, 0x54, 0x08),
-	BM1880_PINMUX_FUNCTION_MUX(pwm11, 2, 0x0F, 0x54, 0x0C),
-	BM1880_PINMUX_FUNCTION_MUX(pwm12, 2, 0x0F, 0x54, 0x10),
-	BM1880_PINMUX_FUNCTION_MUX(pwm13, 2, 0x0F, 0x54, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(pwm14, 2, 0x0F, 0x54, 0x18),
-	BM1880_PINMUX_FUNCTION_MUX(pwm15, 2, 0x0F, 0x54, 0x1C),
-	BM1880_PINMUX_FUNCTION_MUX(pwm16, 2, 0x0F, 0x58, 0x00),
-	BM1880_PINMUX_FUNCTION_MUX(pwm17, 2, 0x0F, 0x58, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(pwm18, 2, 0x0F, 0x58, 0x08),
-	BM1880_PINMUX_FUNCTION_MUX(pwm19, 2, 0x0F, 0x58, 0x0C),
-	BM1880_PINMUX_FUNCTION_MUX(pwm20, 2, 0x0F, 0x58, 0x10),
-	BM1880_PINMUX_FUNCTION_MUX(pwm21, 2, 0x0F, 0x58, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(pwm22, 2, 0x0F, 0x58, 0x18),
-	BM1880_PINMUX_FUNCTION_MUX(pwm23, 2, 0x0F, 0x58, 0x1C),
-	BM1880_PINMUX_FUNCTION_MUX(pwm24, 2, 0x0F, 0x5C, 0x00),
-	BM1880_PINMUX_FUNCTION_MUX(pwm25, 2, 0x0F, 0x5C, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(pwm26, 2, 0x0F, 0x5C, 0x08),
-	BM1880_PINMUX_FUNCTION_MUX(pwm27, 2, 0x0F, 0x5C, 0x0C),
-	BM1880_PINMUX_FUNCTION_MUX(pwm28, 2, 0x0F, 0x5C, 0x10),
-	BM1880_PINMUX_FUNCTION_MUX(pwm29, 2, 0x0F, 0x5C, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(pwm30, 2, 0x0F, 0x5C, 0x18),
-	BM1880_PINMUX_FUNCTION_MUX(pwm31, 2, 0x0F, 0x5C, 0x1C),
-	BM1880_PINMUX_FUNCTION_MUX(pwm32, 2, 0x0F, 0x60, 0x00),
-	BM1880_PINMUX_FUNCTION_MUX(pwm33, 2, 0x0F, 0x60, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(pwm34, 2, 0x0F, 0x60, 0x08),
-	BM1880_PINMUX_FUNCTION_MUX(pwm35, 2, 0x0F, 0x60, 0x0C),
-	BM1880_PINMUX_FUNCTION_MUX(pwm36, 2, 0x0F, 0x60, 0x10),
-	BM1880_PINMUX_FUNCTION_MUX(pwm37, 2, 0x0F, 0x60, 0x1C),
-	BM1880_PINMUX_FUNCTION(i2c0, 1, 0x03),
-	BM1880_PINMUX_FUNCTION(i2c1, 1, 0x03),
-	BM1880_PINMUX_FUNCTION(i2c2, 1, 0x03),
-	BM1880_PINMUX_FUNCTION(i2c3, 1, 0x03),
-	BM1880_PINMUX_FUNCTION(i2c4, 1, 0x03),
-	BM1880_PINMUX_FUNCTION(uart0, 1, 0x03),
-	BM1880_PINMUX_FUNCTION(uart1, 1, 0x03),
-	BM1880_PINMUX_FUNCTION(uart2, 1, 0x03),
-	BM1880_PINMUX_FUNCTION(uart3, 1, 0x03),
-	BM1880_PINMUX_FUNCTION(uart4, 1, 0x03),
-	BM1880_PINMUX_FUNCTION(uart5, 1, 0x03),
-	BM1880_PINMUX_FUNCTION(uart6, 1, 0x03),
-	BM1880_PINMUX_FUNCTION(uart7, 1, 0x03),
-	BM1880_PINMUX_FUNCTION(uart8, 1, 0x03),
-	BM1880_PINMUX_FUNCTION(uart9, 1, 0x03),
-	BM1880_PINMUX_FUNCTION(uart10, 1, 0x03),
-	BM1880_PINMUX_FUNCTION(uart11, 1, 0x03),
-	BM1880_PINMUX_FUNCTION(uart12, 3, 0x03),
-	BM1880_PINMUX_FUNCTION(uart13, 3, 0x03),
-	BM1880_PINMUX_FUNCTION(uart14, 3, 0x03),
-	BM1880_PINMUX_FUNCTION(uart15, 3, 0x03),
-	BM1880_PINMUX_FUNCTION_MUX(gpio0, 0, 0x03, 0x4E0, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio1, 0, 0x03, 0x4E4, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio2, 0, 0x03, 0x4E4, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio3, 0, 0x03, 0x4E8, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio4, 0, 0x03, 0x4E8, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio5, 0, 0x03, 0x4EC, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio6, 0, 0x03, 0x4EC, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio7, 0, 0x03, 0x4F0, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio8, 0, 0x03, 0x4F0, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio9, 0, 0x03, 0x4F4, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio10, 0, 0x03, 0x4F4, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio11, 0, 0x03, 0x4F8, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio12, 1, 0x03, 0x4F8, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio13, 1, 0x03, 0x4FC, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio14, 0, 0x03, 0x474, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio15, 0, 0x03, 0x478, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio16, 0, 0x03, 0x478, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio17, 0, 0x03, 0x47C, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio18, 0, 0x03, 0x47C, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio19, 0, 0x03, 0x480, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio20, 0, 0x03, 0x480, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio21, 0, 0x03, 0x484, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio22, 0, 0x03, 0x484, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio23, 0, 0x03, 0x488, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio24, 0, 0x03, 0x488, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio25, 0, 0x03, 0x48C, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio26, 0, 0x03, 0x48C, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio27, 0, 0x03, 0x490, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio28, 0, 0x03, 0x490, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio29, 0, 0x03, 0x494, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio30, 0, 0x03, 0x494, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio31, 0, 0x03, 0x498, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio32, 0, 0x03, 0x498, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio33, 0, 0x03, 0x49C, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio34, 0, 0x03, 0x49C, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio35, 0, 0x03, 0x4A0, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio36, 0, 0x03, 0x4A0, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio37, 0, 0x03, 0x4A4, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio38, 0, 0x03, 0x4A4, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio39, 0, 0x03, 0x4A8, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio40, 0, 0x03, 0x4A8, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio41, 0, 0x03, 0x4AC, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio42, 0, 0x03, 0x4AC, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio43, 0, 0x03, 0x4B0, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio44, 0, 0x03, 0x4B0, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio45, 0, 0x03, 0x4B4, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio46, 0, 0x03, 0x4B4, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio47, 0, 0x03, 0x4B8, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio48, 0, 0x03, 0x4B8, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio49, 0, 0x03, 0x4BC, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio50, 0, 0x03, 0x4BC, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio51, 0, 0x03, 0x4C0, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio52, 0, 0x03, 0x4C0, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio53, 0, 0x03, 0x4C4, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio54, 0, 0x03, 0x4C4, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio55, 0, 0x03, 0x4C8, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio56, 0, 0x03, 0x4C8, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio57, 0, 0x03, 0x4CC, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio58, 0, 0x03, 0x4CC, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio59, 0, 0x03, 0x4D0, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio60, 0, 0x03, 0x4D0, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio61, 0, 0x03, 0x4D4, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio62, 0, 0x03, 0x4D4, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio63, 0, 0x03, 0x4D8, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio64, 0, 0x03, 0x4D8, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio65, 0, 0x03, 0x4DC, 0x04),
-	BM1880_PINMUX_FUNCTION_MUX(gpio66, 0, 0x03, 0x4DC, 0x14),
-	BM1880_PINMUX_FUNCTION_MUX(gpio67, 0, 0x03, 0x4E0, 0x04),
-	BM1880_PINMUX_FUNCTION(eth1, 1, 0x03),
-	BM1880_PINMUX_FUNCTION(i2s0, 2, 0x03),
-	BM1880_PINMUX_FUNCTION(i2s0_mclkin, 1, 0x03),
-	BM1880_PINMUX_FUNCTION(i2s1, 2, 0x03),
-	BM1880_PINMUX_FUNCTION(i2s1_mclkin, 1, 0x03),
-	BM1880_PINMUX_FUNCTION(spi0, 1, 0x03),
+	BM1880_PINMUX_FUNCTION(nand, 2),
+	BM1880_PINMUX_FUNCTION(spi, 0),
+	BM1880_PINMUX_FUNCTION(emmc, 1),
+	BM1880_PINMUX_FUNCTION(sdio, 0),
+	BM1880_PINMUX_FUNCTION(eth0, 0),
+	BM1880_PINMUX_FUNCTION(pwm0, 2),
+	BM1880_PINMUX_FUNCTION(pwm1, 2),
+	BM1880_PINMUX_FUNCTION(pwm2, 2),
+	BM1880_PINMUX_FUNCTION(pwm3, 2),
+	BM1880_PINMUX_FUNCTION(pwm4, 2),
+	BM1880_PINMUX_FUNCTION(pwm5, 2),
+	BM1880_PINMUX_FUNCTION(pwm6, 2),
+	BM1880_PINMUX_FUNCTION(pwm7, 2),
+	BM1880_PINMUX_FUNCTION(pwm8, 2),
+	BM1880_PINMUX_FUNCTION(pwm9, 2),
+	BM1880_PINMUX_FUNCTION(pwm10, 2),
+	BM1880_PINMUX_FUNCTION(pwm11, 2),
+	BM1880_PINMUX_FUNCTION(pwm12, 2),
+	BM1880_PINMUX_FUNCTION(pwm13, 2),
+	BM1880_PINMUX_FUNCTION(pwm14, 2),
+	BM1880_PINMUX_FUNCTION(pwm15, 2),
+	BM1880_PINMUX_FUNCTION(pwm16, 2),
+	BM1880_PINMUX_FUNCTION(pwm17, 2),
+	BM1880_PINMUX_FUNCTION(pwm18, 2),
+	BM1880_PINMUX_FUNCTION(pwm19, 2),
+	BM1880_PINMUX_FUNCTION(pwm20, 2),
+	BM1880_PINMUX_FUNCTION(pwm21, 2),
+	BM1880_PINMUX_FUNCTION(pwm22, 2),
+	BM1880_PINMUX_FUNCTION(pwm23, 2),
+	BM1880_PINMUX_FUNCTION(pwm24, 2),
+	BM1880_PINMUX_FUNCTION(pwm25, 2),
+	BM1880_PINMUX_FUNCTION(pwm26, 2),
+	BM1880_PINMUX_FUNCTION(pwm27, 2),
+	BM1880_PINMUX_FUNCTION(pwm28, 2),
+	BM1880_PINMUX_FUNCTION(pwm29, 2),
+	BM1880_PINMUX_FUNCTION(pwm30, 2),
+	BM1880_PINMUX_FUNCTION(pwm31, 2),
+	BM1880_PINMUX_FUNCTION(pwm32, 2),
+	BM1880_PINMUX_FUNCTION(pwm33, 2),
+	BM1880_PINMUX_FUNCTION(pwm34, 2),
+	BM1880_PINMUX_FUNCTION(pwm35, 2),
+	BM1880_PINMUX_FUNCTION(pwm36, 2),
+	BM1880_PINMUX_FUNCTION(pwm37, 2),
+	BM1880_PINMUX_FUNCTION(i2c0, 1),
+	BM1880_PINMUX_FUNCTION(i2c1, 1),
+	BM1880_PINMUX_FUNCTION(i2c2, 1),
+	BM1880_PINMUX_FUNCTION(i2c3, 1),
+	BM1880_PINMUX_FUNCTION(i2c4, 1),
+	BM1880_PINMUX_FUNCTION(uart0, 3),
+	BM1880_PINMUX_FUNCTION(uart1, 3),
+	BM1880_PINMUX_FUNCTION(uart2, 3),
+	BM1880_PINMUX_FUNCTION(uart3, 3),
+	BM1880_PINMUX_FUNCTION(uart4, 1),
+	BM1880_PINMUX_FUNCTION(uart5, 1),
+	BM1880_PINMUX_FUNCTION(uart6, 1),
+	BM1880_PINMUX_FUNCTION(uart7, 1),
+	BM1880_PINMUX_FUNCTION(uart8, 1),
+	BM1880_PINMUX_FUNCTION(uart9, 1),
+	BM1880_PINMUX_FUNCTION(uart10, 1),
+	BM1880_PINMUX_FUNCTION(uart11, 1),
+	BM1880_PINMUX_FUNCTION(uart12, 3),
+	BM1880_PINMUX_FUNCTION(uart13, 3),
+	BM1880_PINMUX_FUNCTION(uart14, 3),
+	BM1880_PINMUX_FUNCTION(uart15, 3),
+	BM1880_PINMUX_FUNCTION(gpio0, 0),
+	BM1880_PINMUX_FUNCTION(gpio1, 0),
+	BM1880_PINMUX_FUNCTION(gpio2, 0),
+	BM1880_PINMUX_FUNCTION(gpio3, 0),
+	BM1880_PINMUX_FUNCTION(gpio4, 0),
+	BM1880_PINMUX_FUNCTION(gpio5, 0),
+	BM1880_PINMUX_FUNCTION(gpio6, 0),
+	BM1880_PINMUX_FUNCTION(gpio7, 0),
+	BM1880_PINMUX_FUNCTION(gpio8, 0),
+	BM1880_PINMUX_FUNCTION(gpio9, 0),
+	BM1880_PINMUX_FUNCTION(gpio10, 0),
+	BM1880_PINMUX_FUNCTION(gpio11, 0),
+	BM1880_PINMUX_FUNCTION(gpio12, 1),
+	BM1880_PINMUX_FUNCTION(gpio13, 1),
+	BM1880_PINMUX_FUNCTION(gpio14, 0),
+	BM1880_PINMUX_FUNCTION(gpio15, 0),
+	BM1880_PINMUX_FUNCTION(gpio16, 0),
+	BM1880_PINMUX_FUNCTION(gpio17, 0),
+	BM1880_PINMUX_FUNCTION(gpio18, 0),
+	BM1880_PINMUX_FUNCTION(gpio19, 0),
+	BM1880_PINMUX_FUNCTION(gpio20, 0),
+	BM1880_PINMUX_FUNCTION(gpio21, 0),
+	BM1880_PINMUX_FUNCTION(gpio22, 0),
+	BM1880_PINMUX_FUNCTION(gpio23, 0),
+	BM1880_PINMUX_FUNCTION(gpio24, 0),
+	BM1880_PINMUX_FUNCTION(gpio25, 0),
+	BM1880_PINMUX_FUNCTION(gpio26, 0),
+	BM1880_PINMUX_FUNCTION(gpio27, 0),
+	BM1880_PINMUX_FUNCTION(gpio28, 0),
+	BM1880_PINMUX_FUNCTION(gpio29, 0),
+	BM1880_PINMUX_FUNCTION(gpio30, 0),
+	BM1880_PINMUX_FUNCTION(gpio31, 0),
+	BM1880_PINMUX_FUNCTION(gpio32, 0),
+	BM1880_PINMUX_FUNCTION(gpio33, 0),
+	BM1880_PINMUX_FUNCTION(gpio34, 0),
+	BM1880_PINMUX_FUNCTION(gpio35, 0),
+	BM1880_PINMUX_FUNCTION(gpio36, 0),
+	BM1880_PINMUX_FUNCTION(gpio37, 0),
+	BM1880_PINMUX_FUNCTION(gpio38, 0),
+	BM1880_PINMUX_FUNCTION(gpio39, 0),
+	BM1880_PINMUX_FUNCTION(gpio40, 0),
+	BM1880_PINMUX_FUNCTION(gpio41, 0),
+	BM1880_PINMUX_FUNCTION(gpio42, 0),
+	BM1880_PINMUX_FUNCTION(gpio43, 0),
+	BM1880_PINMUX_FUNCTION(gpio44, 0),
+	BM1880_PINMUX_FUNCTION(gpio45, 0),
+	BM1880_PINMUX_FUNCTION(gpio46, 0),
+	BM1880_PINMUX_FUNCTION(gpio47, 0),
+	BM1880_PINMUX_FUNCTION(gpio48, 0),
+	BM1880_PINMUX_FUNCTION(gpio49, 0),
+	BM1880_PINMUX_FUNCTION(gpio50, 0),
+	BM1880_PINMUX_FUNCTION(gpio51, 0),
+	BM1880_PINMUX_FUNCTION(gpio52, 0),
+	BM1880_PINMUX_FUNCTION(gpio53, 0),
+	BM1880_PINMUX_FUNCTION(gpio54, 0),
+	BM1880_PINMUX_FUNCTION(gpio55, 0),
+	BM1880_PINMUX_FUNCTION(gpio56, 0),
+	BM1880_PINMUX_FUNCTION(gpio57, 0),
+	BM1880_PINMUX_FUNCTION(gpio58, 0),
+	BM1880_PINMUX_FUNCTION(gpio59, 0),
+	BM1880_PINMUX_FUNCTION(gpio60, 0),
+	BM1880_PINMUX_FUNCTION(gpio61, 0),
+	BM1880_PINMUX_FUNCTION(gpio62, 0),
+	BM1880_PINMUX_FUNCTION(gpio63, 0),
+	BM1880_PINMUX_FUNCTION(gpio64, 0),
+	BM1880_PINMUX_FUNCTION(gpio65, 0),
+	BM1880_PINMUX_FUNCTION(gpio66, 0),
+	BM1880_PINMUX_FUNCTION(gpio67, 0),
+	BM1880_PINMUX_FUNCTION(eth1, 1),
+	BM1880_PINMUX_FUNCTION(i2s0, 2),
+	BM1880_PINMUX_FUNCTION(i2s0_mclkin, 1),
+	BM1880_PINMUX_FUNCTION(i2s1, 2),
+	BM1880_PINMUX_FUNCTION(i2s1_mclkin, 1),
+	BM1880_PINMUX_FUNCTION(spi0, 1),
 };
 
 static int bm1880_pctrl_get_groups_count(struct pinctrl_dev *pctldev)
@@ -870,28 +856,17 @@ static int bm1880_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	const struct bm1880_pinmux_function *func = &pctrl->funcs[function];
 	int i;
 
-	if (func->mux) {
+	for (i = 0; i < pgrp->npins; i++) {
+		unsigned int pin = pgrp->pins[i];
+		u32 offset = (pin >> 1) << 2;
+		u32 mux_offset = ((!((pin + 1) & 1) << 4) + 4);
 		u32 regval = readl_relaxed(pctrl->base + BM1880_REG_MUX +
-					   func->mux);
-
-		regval &= ~(func->mux_mask << func->mux_shift);
-		regval |= func->mux_val << func->mux_shift;
-		writel_relaxed(regval, pctrl->base + BM1880_REG_MUX +
-			       func->mux);
-	} else {
-		for (i = 0; i < pgrp->npins; i++) {
-			unsigned int pin = pgrp->pins[i];
-			u32 offset = (pin >> 1) << 2;
-			u32 mux_offset = ((!((pin + 1) & 1) << 4) + 4);
-			u32 regval = readl_relaxed(pctrl->base +
-						   BM1880_REG_MUX + offset);
-
-			regval &= ~(func->mux_mask << mux_offset);
-			regval |= func->mux_val << mux_offset;
-
-			writel_relaxed(regval, pctrl->base +
-				       BM1880_REG_MUX + offset);
-		}
+					   offset);
+
+		regval &= ~(0x03 << mux_offset);
+		regval |= func->mux_val << mux_offset;
+
+		writel_relaxed(regval, pctrl->base + BM1880_REG_MUX + offset);
 	}
 
 	return 0;
-- 
2.17.1

