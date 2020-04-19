Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE931AFC32
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2020 18:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbgDSQuG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Apr 2020 12:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726651AbgDSQuE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 19 Apr 2020 12:50:04 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2563CC061A0C;
        Sun, 19 Apr 2020 09:50:04 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id o15so3267648pgi.1;
        Sun, 19 Apr 2020 09:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vFf25JxhgwXBtDCMayNFLRabViLC1GO2elBX7/IcCm4=;
        b=Glnym17sUsSX41ofG4UmqR29XCHiL4heELaNJ1sDAutrVgW34z62UYmTH596IrA0DE
         UPZFP356mZpa3HUeD7iQDrs9/ph3UCJNIG3jOdD/GppxyoPY00jjAWL/LFrw/As8xlgN
         T+t+Qy3XwSxEThAbVn7OcyTfM+Z5TlGutIj3WdUurO+6s8yCXXh5iFy7CpyCPJkcsT0u
         0Tn32mRQ+hMoGE1oZmxOuJyicFkKIbSlEa+PI5HIk0zOr3WUzJCehGugH7hTvM6yov1P
         QdpuAm0UR/I3J8bM2Qa4L4SA3TlKzrWDJQ8hwpPo64R/72PgAHA2GPTAAUupdD5p8MLw
         ba5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vFf25JxhgwXBtDCMayNFLRabViLC1GO2elBX7/IcCm4=;
        b=eHDoXXrQTuswcd8elp76EaWosgdFaXoASM3B2NWzjOiP66hOZO6QqKWlXskI0iNgMz
         tOpETfdLmX8foIbffnomYOKTWqMmqi/ReNJBR8zXO/BjAo/5TsvD+7jkmWDZEqmlYeGa
         ZgplgJIF+IVUWQ6ZrvSf9bBqku0Df/IwqLTeWqczS1shPg3bPJFvL8xu8ca40drIsPpd
         woiMczenKMGnd9SJcqQAcxcgv2PGfUzP1hJFE/LkOlL5QowgZvJTdWyxpaSObCsL9B5s
         PvWsBhfUwGJEv+fE6ivksqha/IbdgInJQE0GesxEAhfxd/Vn8dJddBIQrtgfJ0isea3D
         uz4w==
X-Gm-Message-State: AGi0PuYOfXdkhkygqnFR9zXcAsKqg5T2LWGmuSBAMI4lfch+HPJSKzcB
        ht66C5gBCyxH3h1qFrMdfgo=
X-Google-Smtp-Source: APiQypKKwQ9b0XCfCqaY4E1mtQ3tzgW1xlLGiDrMkxSAIs3a/vob7kYwBn5q0HjlTvhNY3IuF7qFCg==
X-Received: by 2002:a62:834a:: with SMTP id h71mr5626682pfe.307.1587315003529;
        Sun, 19 Apr 2020 09:50:03 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id q187sm20427444pfb.131.2020.04.19.09.50.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Apr 2020 09:50:03 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, geert+renesas@glider.be,
        thierry.reding@gmail.com, jonathanh@nvidia.com, jun.nie@linaro.org,
        stephan@gerhold.net, linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1] pinctrl: fix several typos
Date:   Mon, 20 Apr 2020 00:49:56 +0800
Message-Id: <20200419164956.3484-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

use codespell to fix lots of typos over frontends.

CC: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 drivers/pinctrl/freescale/pinctrl-imx1-core.c    | 2 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c | 2 +-
 drivers/pinctrl/pinctrl-lantiq.c                 | 2 +-
 drivers/pinctrl/pinctrl-sx150x.c                 | 2 +-
 drivers/pinctrl/sh-pfc/pfc-sh7269.c              | 2 +-
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c       | 2 +-
 drivers/pinctrl/zte/pinctrl-zx.c                 | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index c00d0022d311..ec0b1a273f7b 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -60,7 +60,7 @@ struct imx1_pinctrl {
 
 /*
  * IMX1 IOMUXC manages the pins based on ports. Each port has 32 pins. IOMUX
- * control register are seperated into function, output configuration, input
+ * control register are separated into function, output configuration, input
  * configuration A, input configuration B, GPIO in use and data direction.
  *
  * Those controls that are represented by 1 bit have a direct mapping between
diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c b/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c
index b9246e0b4fe2..508f1b11a4df 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c
@@ -418,7 +418,7 @@ static const unsigned lcdvsi1_a_1_pins[] = { DB8500_PIN_E2 };
 static const unsigned lcd_d0_d7_a_1_pins[] = {
 	DB8500_PIN_G5, DB8500_PIN_G4, DB8500_PIN_H4, DB8500_PIN_H3,
 	DB8500_PIN_J3, DB8500_PIN_H2, DB8500_PIN_J2, DB8500_PIN_H1 };
-/* D8 thru D11 often used as TVOUT lines */
+/* D8 through D11 often used as TVOUT lines */
 static const unsigned lcd_d8_d11_a_1_pins[] = { DB8500_PIN_F4,
 	DB8500_PIN_E3, DB8500_PIN_E4, DB8500_PIN_D2 };
 static const unsigned lcd_d12_d23_a_1_pins[] = {
diff --git a/drivers/pinctrl/pinctrl-lantiq.c b/drivers/pinctrl/pinctrl-lantiq.c
index aa92f141b865..626e02d7a1ba 100644
--- a/drivers/pinctrl/pinctrl-lantiq.c
+++ b/drivers/pinctrl/pinctrl-lantiq.c
@@ -221,7 +221,7 @@ static int match_mux(const struct ltq_mfp_pin *mfp, unsigned mux)
 	return i;
 }
 
-/* dont assume .mfp is linearly mapped. find the mfp with the correct .pin */
+/* don't assume .mfp is linearly mapped. find the mfp with the correct .pin */
 static int match_mfp(const struct ltq_pinmux_info *info, int pin)
 {
 	int i;
diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 6e74bd87d959..708bc91862fe 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -988,7 +988,7 @@ static unsigned int sx150x_maybe_swizzle(struct sx150x_pinctrl *pctl,
 /*
  * In order to mask the differences between 16 and 8 bit expander
  * devices we set up a sligthly ficticious regmap that pretends to be
- * a set of 32-bit (to accomodate RegSenseLow/RegSenseHigh
+ * a set of 32-bit (to accommodate RegSenseLow/RegSenseHigh
  * pair/quartet) registers and transparently reconstructs those
  * registers via multiple I2C/SMBus reads
  *
diff --git a/drivers/pinctrl/sh-pfc/pfc-sh7269.c b/drivers/pinctrl/sh-pfc/pfc-sh7269.c
index d20974a55d93..0aed18863ba3 100644
--- a/drivers/pinctrl/sh-pfc/pfc-sh7269.c
+++ b/drivers/pinctrl/sh-pfc/pfc-sh7269.c
@@ -1963,7 +1963,7 @@ static const struct pinmux_func pinmux_func_gpios[] = {
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	/* "name" addr register_size Field_Width */
 
-	/* where Field_Width is 1 for single mode registers or 4 for upto 16
+	/* where Field_Width is 1 for single mode registers or 4 for up to 16
 	   mode registers and modes are described in assending order [0..16] */
 
 	{ PINMUX_CFG_REG("PAIOR0", 0xfffe3812, 16, 1, GROUP(
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
index 6f7b3767f453..43922ab81666 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
@@ -123,7 +123,7 @@ static int tegra_xusb_padctl_get_group_pins(struct pinctrl_dev *pinctrl,
 					    unsigned *num_pins)
 {
 	/*
-	 * For the tegra-xusb pad controller groups are synonomous
+	 * For the tegra-xusb pad controller groups are synonymous
 	 * with lanes/pins and there is always one lane/pin per group.
 	 */
 	*pins = &pinctrl->desc->pins[group].number;
diff --git a/drivers/pinctrl/zte/pinctrl-zx.c b/drivers/pinctrl/zte/pinctrl-zx.c
index 786bf89487d6..80d00ab8c110 100644
--- a/drivers/pinctrl/zte/pinctrl-zx.c
+++ b/drivers/pinctrl/zte/pinctrl-zx.c
@@ -94,7 +94,7 @@ static int zx_set_mux(struct pinctrl_dev *pctldev, unsigned int func_selector,
 	if (data->aon_pin) {
 		/*
 		 * It's an AON pin, whose mux register offset and bit position
-		 * can be caluculated from pin number.  Each register covers 16
+		 * can be calculated from pin number.  Each register covers 16
 		 * pins, and each pin occupies 2 bits.
 		 */
 		u16 aoffset = pindesc->number / 16 * 4;
-- 
2.25.0

