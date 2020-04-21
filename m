Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5A1B1B2963
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2020 16:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728846AbgDUOYS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Apr 2020 10:24:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726741AbgDUOYR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Apr 2020 10:24:17 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A43CC061A10;
        Tue, 21 Apr 2020 07:24:17 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id h11so5285921plr.11;
        Tue, 21 Apr 2020 07:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A1eMOz2nD0A99gDTpSwCxCwc0K9Rie/82wne8kdt1x0=;
        b=ZaE1gM6dOoSFCCbM5iLPlcTG33W2VSY/uIKveD5P69gWTeEqj3AuuKGEaJAxOyLKRh
         fvd9dwKhYCvmIB6y6TX7ix9zU0TM6KNQ7eyB/VX/qSRO8tvvPJBdJ+NvwNETUwITxx8G
         wmmDiX9XjJyhYK4NDtkuD2/FQQ/OUuAp6o9bqyI9AVKNwaIrAlZIrhSPI9SuK6XYjJ4j
         5W9cn4G7mfAt7bC+AohT5KLIaT9IKh3j7jjCWr0g0GzoJqF7j63mWMGHsm1CuKPxb2E6
         ywUGWFwqyte78Hb+Gsf33vXp9KVqGbhwBJvfhEmx69pVMwwG6vmgQPRGOSaBc+2lr1XY
         7bqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A1eMOz2nD0A99gDTpSwCxCwc0K9Rie/82wne8kdt1x0=;
        b=m2gpDHxDiOMiwE8tCbaEWRhPVxm/TvNpBOhxE3OOuwj+0NT0CUJHJbtIKVM99mXxOK
         g8efwnmi1sU50XJQ3DlLXLaqrehdD1mDm5lpndGBoalTEmxb84pN8o5adgFFN3ZNrMfC
         MzSXpoGZV4Vbdy1+FgItbsza/3zsu+ErmgGIXVELr9fXuXsgQOo4e61uoN3A5usAnsG6
         6Iq/3AYhREWH/niSqnpI1L8an2vdA3atmx8UviPTxyCTO6iqOEmeRKwyD8PK5aLNDPMk
         mkKuFbjSxkA1YaF51FM2u3mrKf4t2zgW9BTaYBM33nhpOPOfD/YtefslbsSYygZQuAFK
         sSLw==
X-Gm-Message-State: AGi0Pua5JrrrnDSerVbxZpE4fTwr/HvRL0xhaQU2Gy+Q9e3TCpUU1959
        H81okBXYdFWyWu3Vvx5uSGI=
X-Google-Smtp-Source: APiQypI+MqPDxvWshFgIsS6T6ewqXjall3pJ9Hp6NPBIiNtgZIA8ZoUH3FAvz1iJVYAPc9RyHiMXnA==
X-Received: by 2002:a17:90b:3018:: with SMTP id hg24mr6125648pjb.130.1587479056588;
        Tue, 21 Apr 2020 07:24:16 -0700 (PDT)
Received: from localhost ([89.208.244.140])
        by smtp.gmail.com with ESMTPSA id t3sm2552052pfq.110.2020.04.21.07.24.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 07:24:15 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, geert+renesas@glider.be,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-gpio@vger.kernel.org, joe@perches.com
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v3] pinctrl: fix several typos
Date:   Tue, 21 Apr 2020 22:24:02 +0800
Message-Id: <20200421142402.9524-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

use codespell to fix lots of typos over frontends.

CC: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
v2 -> v3:
	- remove the changed of "thru -> through" in the
	  pinctrl-nomadik-db8500.c by Joe's suggestion.

v1 -> v2:
	- Geert help me Reviewed the pfc-sh7269.c and Thanks Geert.
	- Geert advised me modify [0..16] to [0..15] in the pfc-sh7269.c
	- Uwe advised me modify "control register are" to "control
	  registers are", Thanks Uwe.

 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 2 +-
 drivers/pinctrl/pinctrl-lantiq.c              | 2 +-
 drivers/pinctrl/pinctrl-sx150x.c              | 2 +-
 drivers/pinctrl/sh-pfc/pfc-sh7269.c           | 5 +++--
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c    | 2 +-
 drivers/pinctrl/zte/pinctrl-zx.c              | 2 +-
 6 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index c00d0022d311..0c1c0e72fa8e 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -60,7 +60,7 @@ struct imx1_pinctrl {
 
 /*
  * IMX1 IOMUXC manages the pins based on ports. Each port has 32 pins. IOMUX
- * control register are seperated into function, output configuration, input
+ * control registers are separated into function, output configuration, input
  * configuration A, input configuration B, GPIO in use and data direction.
  *
  * Those controls that are represented by 1 bit have a direct mapping between
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
index d20974a55d93..e2916aaa8304 100644
--- a/drivers/pinctrl/sh-pfc/pfc-sh7269.c
+++ b/drivers/pinctrl/sh-pfc/pfc-sh7269.c
@@ -1963,8 +1963,9 @@ static const struct pinmux_func pinmux_func_gpios[] = {
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	/* "name" addr register_size Field_Width */
 
-	/* where Field_Width is 1 for single mode registers or 4 for upto 16
-	   mode registers and modes are described in assending order [0..16] */
+	/* where Field_Width is 1 for single mode registers or 4 for up to 16
+	 * mode registers and modes are described in assending order [0..15]
+	 */
 
 	{ PINMUX_CFG_REG("PAIOR0", 0xfffe3812, 16, 1, GROUP(
 		0, 0, 0, 0, 0, 0, 0, 0,
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

