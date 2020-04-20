Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 850571B0E62
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2020 16:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726398AbgDTOae (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Apr 2020 10:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729002AbgDTOae (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Apr 2020 10:30:34 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C882C061A0C;
        Mon, 20 Apr 2020 07:30:34 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id o185so4599072pgo.3;
        Mon, 20 Apr 2020 07:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tv2Cczof9DPYhDPzztiBBcQgIsO4HqRAZKMUXqn9iJI=;
        b=Y2J/fDa5J05+3RJokQkoWpIwmkUb7z+JaRJEUUAIRS8Y5I37SKRHozkRYm4swgYQce
         4LZvU6+KoFbjfo/pHAp3oO8JQB2akQ0vjKNGRKZpsQ7u+h4UUdYloo7GQc4phS8lOVNF
         cCcgRYIXH2Rx7vGiZPb0TAaloUkBzD8ofCHc0A7ecjRjRK/T56MMhh3J4ODQR/cv4Veo
         6zGns9if3hMl6D2mfqzKeM3xrZZ5xZc3EVswuoDK/1m3ixONkftlAcVOdwPRYGhOs8BS
         Sj0A/a0La0G+zuLxV3eqSV0RwgYLNX/H9FePQplN0O4Y/PNURi/rza3OJfcyuaOpDEvu
         jaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tv2Cczof9DPYhDPzztiBBcQgIsO4HqRAZKMUXqn9iJI=;
        b=ewBXNlCroAc704jwzFTpPldn1GfASG2Q2sNKCYIpDjp6a5Qdv0+wxMgT0rL2Ev3N0a
         lXptCe80A1eS1TaKMVIzDvGH9tLTZruL/xlhQNJXB2VtNxKoneBd9OOgZxeHLUtGInCf
         y/GXtG23wV1RDMVszOZ00gjgH/IgaqBIBwoDssZEtz+NIW1UiGE+Gi9cBJDmVOxvB7B9
         cDpXGtX5Vz7OzBS+mq58tyJaBgL6b/a9i4LPBN/IJhtDI0y5qBaSKspqqgsBlplt7FpU
         dSzGLUr1aSb85/LI0+GPsKoywJICsJGrfIV9gw4xclIGTn2jfSSclZJffc7PeaPW5I+b
         XUXQ==
X-Gm-Message-State: AGi0PuarhEp4VEQx7K8bn0LxT5t2sqETjvaL0UKlKBpJ/UaBrmnedXIR
        /IJ/0UApvASlbXe4s0rzuR0=
X-Google-Smtp-Source: APiQypK7OzfirqZ5zVvJYhSQkxeCCeF1b+We9hPajle3dMgmiqQ72q61Jj187pUB13GrDfEcmGP9CQ==
X-Received: by 2002:a63:774e:: with SMTP id s75mr16623480pgc.414.1587393033488;
        Mon, 20 Apr 2020 07:30:33 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id f3sm1300911pjo.24.2020.04.20.07.30.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Apr 2020 07:30:32 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, geert+renesas@glider.be,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        stephan@gerhold.net, linux-gpio@vger.kernel.org,
        u.kleine-koenig@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2] pinctrl: fix several typos
Date:   Mon, 20 Apr 2020 22:30:28 +0800
Message-Id: <20200420143028.11014-1-zhengdejin5@gmail.com>
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
v1 -> v2:
	- Geert help me Reviewed the pfc-sh7269.c and Thanks Geert.
	- Geert advised me modify [0..16] to [0..15] in the pfc-sh7269.c
	- Uwe advised me modify "control register are" to "control
	  registers are", Thanks Uwe.

 drivers/pinctrl/freescale/pinctrl-imx1-core.c    | 2 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c | 2 +-
 drivers/pinctrl/pinctrl-lantiq.c                 | 2 +-
 drivers/pinctrl/pinctrl-sx150x.c                 | 2 +-
 drivers/pinctrl/sh-pfc/pfc-sh7269.c              | 5 +++--
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c       | 2 +-
 drivers/pinctrl/zte/pinctrl-zx.c                 | 2 +-
 7 files changed, 9 insertions(+), 8 deletions(-)

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

