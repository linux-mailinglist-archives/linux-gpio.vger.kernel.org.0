Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1D963D94A
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 16:23:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbiK3PXC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 10:23:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbiK3PW6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 10:22:58 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29FEC50D6C
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 07:22:55 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p0OuS-00009t-Vo; Wed, 30 Nov 2022 16:22:05 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p0OuJ-001LdS-Sq; Wed, 30 Nov 2022 16:21:56 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p0OuJ-001Vqc-PU; Wed, 30 Nov 2022 16:21:55 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Douglas Anderson <dianders@chromium.org>,
        Pavel Machek <pavel@ucw.cz>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Michael Walle <michael@walle.cc>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Hammer Hsieh <hammerh0314@gmail.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Sean Anderson <sean.anderson@seco.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        chrome-platform@lists.linux.dev, linux-amlogic@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-riscv@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev
Subject: [PATCH v2 01/11] pwm: Make .get_state() callback return an error code
Date:   Wed, 30 Nov 2022 16:21:38 +0100
Message-Id: <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=33730; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=6aKwDQeWFfhk7HNIUIW+KFczG8dz0Cbl6n6wGeYnRI0=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjh3TheqBOZnA37N8EiQMSn8aVt1bApU3hGZu9W2/8 Lk3LwJ+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY4d04QAKCRDB/BR4rcrsCaikCA CHUvfaYuPDw9QNqML6mJZ8m6CeaoJG8CMLK9nxftXBxxPYpQqGDOyOOB/ScP6OgtbdFTUj/GxdeHtK x5pBgrOrJMvaKiqONoJEUEcVb22lzmWgsGOzjyjfUChlljfw+e06BJe6uunideRUW3Pf1dRw3G5/sI Jcp/YWEzuM26Bjnp6guP4OYMLZiL1cPMZgvK16TaE6AY/ECbVyf5eOs8NhzSugjwavxp2Fot8omx2T n5TCOyO02/LoLYwff8tF9SWW3Cw6FkoeW4MuUm9B3kF7o5iG0ECNqUqJFNy5R4PEj3jXbJjJpBf+OK UsUTssaW73uOGg6t8ZRtwPYauMF8ce
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

.get_state() might fail in some cases. To make it possible that a driver
signals such a failure change the prototype of .get_state() to return an
error code.

This patch was created using coccinelle and the following semantic patch:

@p1@
identifier getstatefunc;
identifier driver;
@@
 struct pwm_ops driver = {
        ...,
        .get_state = getstatefunc
        ,...
 };

@p2@
identifier p1.getstatefunc;
identifier chip, pwm, state;
@@
-void
+int
 getstatefunc(struct pwm_chip *chip, struct pwm_device *pwm, struct pwm_state *state)
 {
   ...
-  return;
+  return 0;
   ...
 }

plus the actual change of the prototype in include/linux/pwm.h (plus some
manual fixing of indentions and empty lines).

So for now all drivers return success unconditionally. They are adapted
in the following patches to make the changes easier reviewable.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpio/gpio-mvebu.c             |  9 ++++++---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 14 ++++++++------
 drivers/leds/rgb/leds-qcom-lpg.c      | 14 ++++++++------
 drivers/pwm/pwm-atmel.c               |  6 ++++--
 drivers/pwm/pwm-bcm-iproc.c           |  8 +++++---
 drivers/pwm/pwm-crc.c                 | 10 ++++++----
 drivers/pwm/pwm-cros-ec.c             |  8 +++++---
 drivers/pwm/pwm-dwc.c                 |  6 ++++--
 drivers/pwm/pwm-hibvt.c               |  6 ++++--
 drivers/pwm/pwm-imx-tpm.c             |  8 +++++---
 drivers/pwm/pwm-imx27.c               |  8 +++++---
 drivers/pwm/pwm-intel-lgm.c           |  6 ++++--
 drivers/pwm/pwm-iqs620a.c             |  6 ++++--
 drivers/pwm/pwm-keembay.c             |  6 ++++--
 drivers/pwm/pwm-lpss.c                |  6 ++++--
 drivers/pwm/pwm-meson.c               |  8 +++++---
 drivers/pwm/pwm-mtk-disp.c            | 12 +++++++-----
 drivers/pwm/pwm-pca9685.c             |  8 +++++---
 drivers/pwm/pwm-raspberrypi-poe.c     |  8 +++++---
 drivers/pwm/pwm-rockchip.c            | 12 +++++++-----
 drivers/pwm/pwm-sifive.c              |  6 ++++--
 drivers/pwm/pwm-sl28cpld.c            |  8 +++++---
 drivers/pwm/pwm-sprd.c                |  8 +++++---
 drivers/pwm/pwm-stm32-lp.c            |  8 +++++---
 drivers/pwm/pwm-sun4i.c               | 12 +++++++-----
 drivers/pwm/pwm-sunplus.c             |  6 ++++--
 drivers/pwm/pwm-visconti.c            |  6 ++++--
 drivers/pwm/pwm-xilinx.c              |  8 +++++---
 include/linux/pwm.h                   |  4 ++--
 29 files changed, 146 insertions(+), 89 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 1bb317b8dcce..91a4232ee58c 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -657,9 +657,10 @@ static void mvebu_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
 	spin_unlock_irqrestore(&mvpwm->lock, flags);
 }
 
-static void mvebu_pwm_get_state(struct pwm_chip *chip,
-				struct pwm_device *pwm,
-				struct pwm_state *state) {
+static int mvebu_pwm_get_state(struct pwm_chip *chip,
+			       struct pwm_device *pwm,
+			       struct pwm_state *state)
+{
 
 	struct mvebu_pwm *mvpwm = to_mvebu_pwm(chip);
 	struct mvebu_gpio_chip *mvchip = mvpwm->mvchip;
@@ -693,6 +694,8 @@ static void mvebu_pwm_get_state(struct pwm_chip *chip,
 		state->enabled = false;
 
 	spin_unlock_irqrestore(&mvpwm->lock, flags);
+
+	return 0;
 }
 
 static int mvebu_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 3c3561942eb6..6826d2423ae9 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1500,8 +1500,8 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	return ret;
 }
 
-static void ti_sn_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
-				struct pwm_state *state)
+static int ti_sn_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+			       struct pwm_state *state)
 {
 	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
 	unsigned int pwm_en_inv;
@@ -1512,19 +1512,19 @@ static void ti_sn_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	ret = regmap_read(pdata->regmap, SN_PWM_EN_INV_REG, &pwm_en_inv);
 	if (ret)
-		return;
+		return 0;
 
 	ret = ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_SCALE_REG, &scale);
 	if (ret)
-		return;
+		return 0;
 
 	ret = ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_REG, &backlight);
 	if (ret)
-		return;
+		return 0;
 
 	ret = regmap_read(pdata->regmap, SN_PWM_PRE_DIV_REG, &pre_div);
 	if (ret)
-		return;
+		return 0;
 
 	state->enabled = FIELD_GET(SN_PWM_EN_MASK, pwm_en_inv);
 	if (FIELD_GET(SN_PWM_INV_MASK, pwm_en_inv))
@@ -1539,6 +1539,8 @@ static void ti_sn_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	if (state->duty_cycle > state->period)
 		state->duty_cycle = state->period;
+
+	return 0;
 }
 
 static const struct pwm_ops ti_sn_pwm_ops = {
diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 02f51cc61837..741cc2fd817d 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -968,8 +968,8 @@ static int lpg_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	return ret;
 }
 
-static void lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
-			      struct pwm_state *state)
+static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+			     struct pwm_state *state)
 {
 	struct lpg *lpg = container_of(chip, struct lpg, pwm);
 	struct lpg_channel *chan = &lpg->channels[pwm->hwpwm];
@@ -982,20 +982,20 @@ static void lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	ret = regmap_read(lpg->map, chan->base + LPG_SIZE_CLK_REG, &val);
 	if (ret)
-		return;
+		return 0;
 
 	refclk = lpg_clk_rates[val & PWM_CLK_SELECT_MASK];
 	if (refclk) {
 		ret = regmap_read(lpg->map, chan->base + LPG_PREDIV_CLK_REG, &val);
 		if (ret)
-			return;
+			return 0;
 
 		pre_div = lpg_pre_divs[FIELD_GET(PWM_FREQ_PRE_DIV_MASK, val)];
 		m = FIELD_GET(PWM_FREQ_EXP_MASK, val);
 
 		ret = regmap_bulk_read(lpg->map, chan->base + PWM_VALUE_REG, &pwm_value, sizeof(pwm_value));
 		if (ret)
-			return;
+			return 0;
 
 		state->period = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * LPG_RESOLUTION * pre_div * (1 << m), refclk);
 		state->duty_cycle = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * pwm_value * pre_div * (1 << m), refclk);
@@ -1006,13 +1006,15 @@ static void lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	ret = regmap_read(lpg->map, chan->base + PWM_ENABLE_CONTROL_REG, &val);
 	if (ret)
-		return;
+		return 0;
 
 	state->enabled = FIELD_GET(LPG_ENABLE_CONTROL_OUTPUT, val);
 	state->polarity = PWM_POLARITY_NORMAL;
 
 	if (state->duty_cycle > state->period)
 		state->duty_cycle = state->period;
+
+	return 0;
 }
 
 static const struct pwm_ops lpg_pwm_ops = {
diff --git a/drivers/pwm/pwm-atmel.c b/drivers/pwm/pwm-atmel.c
index 8e00a4286145..cdbc23649032 100644
--- a/drivers/pwm/pwm-atmel.c
+++ b/drivers/pwm/pwm-atmel.c
@@ -356,8 +356,8 @@ static int atmel_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	return 0;
 }
 
-static void atmel_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
-				struct pwm_state *state)
+static int atmel_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+			       struct pwm_state *state)
 {
 	struct atmel_pwm_chip *atmel_pwm = to_atmel_pwm_chip(chip);
 	u32 sr, cmr;
@@ -396,6 +396,8 @@ static void atmel_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		state->polarity = PWM_POLARITY_INVERSED;
 	else
 		state->polarity = PWM_POLARITY_NORMAL;
+
+	return 0;
 }
 
 static const struct pwm_ops atmel_pwm_ops = {
diff --git a/drivers/pwm/pwm-bcm-iproc.c b/drivers/pwm/pwm-bcm-iproc.c
index 7251037d4dd5..97ec131eb7c1 100644
--- a/drivers/pwm/pwm-bcm-iproc.c
+++ b/drivers/pwm/pwm-bcm-iproc.c
@@ -68,8 +68,8 @@ static void iproc_pwmc_disable(struct iproc_pwmc *ip, unsigned int channel)
 	ndelay(400);
 }
 
-static void iproc_pwmc_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
-				 struct pwm_state *state)
+static int iproc_pwmc_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				struct pwm_state *state)
 {
 	struct iproc_pwmc *ip = to_iproc_pwmc(chip);
 	u64 tmp, multi, rate;
@@ -91,7 +91,7 @@ static void iproc_pwmc_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (rate == 0) {
 		state->period = 0;
 		state->duty_cycle = 0;
-		return;
+		return 0;
 	}
 
 	value = readl(ip->base + IPROC_PWM_PRESCALE_OFFSET);
@@ -107,6 +107,8 @@ static void iproc_pwmc_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	value = readl(ip->base + IPROC_PWM_DUTY_CYCLE_OFFSET(pwm->hwpwm));
 	tmp = (value & IPROC_PWM_PERIOD_MAX) * multi;
 	state->duty_cycle = div64_u64(tmp, rate);
+
+	return 0;
 }
 
 static int iproc_pwmc_apply(struct pwm_chip *chip, struct pwm_device *pwm,
diff --git a/drivers/pwm/pwm-crc.c b/drivers/pwm/pwm-crc.c
index 7b357d1cf642..4099850117ba 100644
--- a/drivers/pwm/pwm-crc.c
+++ b/drivers/pwm/pwm-crc.c
@@ -121,8 +121,8 @@ static int crc_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	return 0;
 }
 
-static void crc_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
-			      struct pwm_state *state)
+static int crc_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+			     struct pwm_state *state)
 {
 	struct crystalcove_pwm *crc_pwm = to_crc_pwm(chip);
 	struct device *dev = crc_pwm->chip.dev;
@@ -132,13 +132,13 @@ static void crc_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	error = regmap_read(crc_pwm->regmap, PWM0_CLK_DIV, &clk_div_reg);
 	if (error) {
 		dev_err(dev, "Error reading PWM0_CLK_DIV %d\n", error);
-		return;
+		return 0;
 	}
 
 	error = regmap_read(crc_pwm->regmap, PWM0_DUTY_CYCLE, &duty_cycle_reg);
 	if (error) {
 		dev_err(dev, "Error reading PWM0_DUTY_CYCLE %d\n", error);
-		return;
+		return 0;
 	}
 
 	clk_div = (clk_div_reg & ~PWM_OUTPUT_ENABLE) + 1;
@@ -149,6 +149,8 @@ static void crc_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		DIV_ROUND_UP_ULL(duty_cycle_reg * state->period, PWM_MAX_LEVEL);
 	state->polarity = PWM_POLARITY_NORMAL;
 	state->enabled = !!(clk_div_reg & PWM_OUTPUT_ENABLE);
+
+	return 0;
 }
 
 static const struct pwm_ops crc_pwm_ops = {
diff --git a/drivers/pwm/pwm-cros-ec.c b/drivers/pwm/pwm-cros-ec.c
index 7f10f56c3eb6..11684edc0620 100644
--- a/drivers/pwm/pwm-cros-ec.c
+++ b/drivers/pwm/pwm-cros-ec.c
@@ -183,8 +183,8 @@ static int cros_ec_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	return 0;
 }
 
-static void cros_ec_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
-				  struct pwm_state *state)
+static int cros_ec_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				 struct pwm_state *state)
 {
 	struct cros_ec_pwm_device *ec_pwm = pwm_to_cros_ec_pwm(chip);
 	struct cros_ec_pwm *channel = pwm_get_chip_data(pwm);
@@ -193,7 +193,7 @@ static void cros_ec_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	ret = cros_ec_pwm_get_duty(ec_pwm, pwm->hwpwm);
 	if (ret < 0) {
 		dev_err(chip->dev, "error getting initial duty: %d\n", ret);
-		return;
+		return 0;
 	}
 
 	state->enabled = (ret > 0);
@@ -212,6 +212,8 @@ static void cros_ec_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		state->duty_cycle = channel->duty_cycle;
 	else
 		state->duty_cycle = ret;
+
+	return 0;
 }
 
 static struct pwm_device *
diff --git a/drivers/pwm/pwm-dwc.c b/drivers/pwm/pwm-dwc.c
index 7568300bb11e..bd2308812096 100644
--- a/drivers/pwm/pwm-dwc.c
+++ b/drivers/pwm/pwm-dwc.c
@@ -163,8 +163,8 @@ static int dwc_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	return 0;
 }
 
-static void dwc_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
-			      struct pwm_state *state)
+static int dwc_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+			     struct pwm_state *state)
 {
 	struct dwc_pwm *dwc = to_dwc_pwm(chip);
 	u64 duty, period;
@@ -188,6 +188,8 @@ static void dwc_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	state->polarity = PWM_POLARITY_INVERSED;
 
 	pm_runtime_put_sync(chip->dev);
+
+	return 0;
 }
 
 static const struct pwm_ops dwc_pwm_ops = {
diff --git a/drivers/pwm/pwm-hibvt.c b/drivers/pwm/pwm-hibvt.c
index 333f1b18ff4e..12c05c155cab 100644
--- a/drivers/pwm/pwm-hibvt.c
+++ b/drivers/pwm/pwm-hibvt.c
@@ -128,8 +128,8 @@ static void hibvt_pwm_set_polarity(struct pwm_chip *chip,
 				PWM_POLARITY_MASK, (0x0 << PWM_POLARITY_SHIFT));
 }
 
-static void hibvt_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
-				struct pwm_state *state)
+static int hibvt_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+			       struct pwm_state *state)
 {
 	struct hibvt_pwm_chip *hi_pwm_chip = to_hibvt_pwm_chip(chip);
 	void __iomem *base;
@@ -146,6 +146,8 @@ static void hibvt_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	value = readl(base + PWM_CTRL_ADDR(pwm->hwpwm));
 	state->enabled = (PWM_ENABLE_MASK & value);
+
+	return 0;
 }
 
 static int hibvt_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
diff --git a/drivers/pwm/pwm-imx-tpm.c b/drivers/pwm/pwm-imx-tpm.c
index e5e7b7c339a8..ed1aad96fff0 100644
--- a/drivers/pwm/pwm-imx-tpm.c
+++ b/drivers/pwm/pwm-imx-tpm.c
@@ -132,9 +132,9 @@ static int pwm_imx_tpm_round_state(struct pwm_chip *chip,
 	return 0;
 }
 
-static void pwm_imx_tpm_get_state(struct pwm_chip *chip,
-				  struct pwm_device *pwm,
-				  struct pwm_state *state)
+static int pwm_imx_tpm_get_state(struct pwm_chip *chip,
+				 struct pwm_device *pwm,
+				 struct pwm_state *state)
 {
 	struct imx_tpm_pwm_chip *tpm = to_imx_tpm_pwm_chip(chip);
 	u32 rate, val, prescale;
@@ -164,6 +164,8 @@ static void pwm_imx_tpm_get_state(struct pwm_chip *chip,
 
 	/* get channel status */
 	state->enabled = FIELD_GET(PWM_IMX_TPM_CnSC_ELS, val) ? true : false;
+
+	return 0;
 }
 
 /* this function is supposed to be called with mutex hold */
diff --git a/drivers/pwm/pwm-imx27.c b/drivers/pwm/pwm-imx27.c
index ea91a2f81a9f..3a22c2fddc45 100644
--- a/drivers/pwm/pwm-imx27.c
+++ b/drivers/pwm/pwm-imx27.c
@@ -118,8 +118,8 @@ static void pwm_imx27_clk_disable_unprepare(struct pwm_imx27_chip *imx)
 	clk_disable_unprepare(imx->clk_ipg);
 }
 
-static void pwm_imx27_get_state(struct pwm_chip *chip,
-				struct pwm_device *pwm, struct pwm_state *state)
+static int pwm_imx27_get_state(struct pwm_chip *chip,
+			       struct pwm_device *pwm, struct pwm_state *state)
 {
 	struct pwm_imx27_chip *imx = to_pwm_imx27_chip(chip);
 	u32 period, prescaler, pwm_clk, val;
@@ -128,7 +128,7 @@ static void pwm_imx27_get_state(struct pwm_chip *chip,
 
 	ret = pwm_imx27_clk_prepare_enable(imx);
 	if (ret < 0)
-		return;
+		return 0;
 
 	val = readl(imx->mmio_base + MX3_PWMCR);
 
@@ -170,6 +170,8 @@ static void pwm_imx27_get_state(struct pwm_chip *chip,
 	state->duty_cycle = DIV_ROUND_UP_ULL(tmp, pwm_clk);
 
 	pwm_imx27_clk_disable_unprepare(imx);
+
+	return 0;
 }
 
 static void pwm_imx27_sw_reset(struct pwm_chip *chip)
diff --git a/drivers/pwm/pwm-intel-lgm.c b/drivers/pwm/pwm-intel-lgm.c
index b66c35074087..0cd7dd548e82 100644
--- a/drivers/pwm/pwm-intel-lgm.c
+++ b/drivers/pwm/pwm-intel-lgm.c
@@ -86,8 +86,8 @@ static int lgm_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	return lgm_pwm_enable(chip, 1);
 }
 
-static void lgm_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
-			      struct pwm_state *state)
+static int lgm_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+			     struct pwm_state *state)
 {
 	struct lgm_pwm_chip *pc = to_lgm_pwm_chip(chip);
 	u32 duty, val;
@@ -100,6 +100,8 @@ static void lgm_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	regmap_read(pc->regmap, LGM_PWM_FAN_CON0, &val);
 	duty = FIELD_GET(LGM_PWM_FAN_DC_MSK, val);
 	state->duty_cycle = DIV_ROUND_UP(duty * pc->period, LGM_PWM_MAX_DUTY_CYCLE);
+
+	return 0;
 }
 
 static const struct pwm_ops lgm_pwm_ops = {
diff --git a/drivers/pwm/pwm-iqs620a.c b/drivers/pwm/pwm-iqs620a.c
index 54bd95a5cab0..15aae53db5ab 100644
--- a/drivers/pwm/pwm-iqs620a.c
+++ b/drivers/pwm/pwm-iqs620a.c
@@ -104,8 +104,8 @@ static int iqs620_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	return ret;
 }
 
-static void iqs620_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
-				 struct pwm_state *state)
+static int iqs620_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				struct pwm_state *state)
 {
 	struct iqs620_pwm_private *iqs620_pwm;
 
@@ -126,6 +126,8 @@ static void iqs620_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	mutex_unlock(&iqs620_pwm->lock);
 
 	state->period = IQS620_PWM_PERIOD_NS;
+
+	return 0;
 }
 
 static int iqs620_pwm_notifier(struct notifier_block *notifier,
diff --git a/drivers/pwm/pwm-keembay.c b/drivers/pwm/pwm-keembay.c
index 733811b05721..ac02d8bb4a0b 100644
--- a/drivers/pwm/pwm-keembay.c
+++ b/drivers/pwm/pwm-keembay.c
@@ -89,8 +89,8 @@ static void keembay_pwm_disable(struct keembay_pwm *priv, int ch)
 				KMB_PWM_LEADIN_OFFSET(ch));
 }
 
-static void keembay_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
-				  struct pwm_state *state)
+static int keembay_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				 struct pwm_state *state)
 {
 	struct keembay_pwm *priv = to_keembay_pwm_dev(chip);
 	unsigned long long high, low;
@@ -113,6 +113,8 @@ static void keembay_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	state->duty_cycle = DIV_ROUND_UP_ULL(high, clk_rate);
 	state->period = DIV_ROUND_UP_ULL(high + low, clk_rate);
 	state->polarity = PWM_POLARITY_NORMAL;
+
+	return 0;
 }
 
 static int keembay_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
diff --git a/drivers/pwm/pwm-lpss.c b/drivers/pwm/pwm-lpss.c
index accdef5dd58e..81ac297b8ba5 100644
--- a/drivers/pwm/pwm-lpss.c
+++ b/drivers/pwm/pwm-lpss.c
@@ -205,8 +205,8 @@ static int pwm_lpss_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	return ret;
 }
 
-static void pwm_lpss_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
-			       struct pwm_state *state)
+static int pwm_lpss_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+			      struct pwm_state *state)
 {
 	struct pwm_lpss_chip *lpwm = to_lpwm(chip);
 	unsigned long base_unit_range;
@@ -236,6 +236,8 @@ static void pwm_lpss_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	state->enabled = !!(ctrl & PWM_ENABLE);
 
 	pm_runtime_put(chip->dev);
+
+	return 0;
 }
 
 static const struct pwm_ops pwm_lpss_ops = {
diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 57112f438c6d..16d79ca5d8f5 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -318,8 +318,8 @@ static unsigned int meson_pwm_cnt_to_ns(struct pwm_chip *chip,
 	return cnt * fin_ns * (channel->pre_div + 1);
 }
 
-static void meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
-				struct pwm_state *state)
+static int meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+			       struct pwm_state *state)
 {
 	struct meson_pwm *meson = to_meson_pwm(chip);
 	struct meson_pwm_channel_data *channel_data;
@@ -327,7 +327,7 @@ static void meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	u32 value, tmp;
 
 	if (!state)
-		return;
+		return 0;
 
 	channel = &meson->channels[pwm->hwpwm];
 	channel_data = &meson_pwm_per_channel_data[pwm->hwpwm];
@@ -357,6 +357,8 @@ static void meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		state->period = 0;
 		state->duty_cycle = 0;
 	}
+
+	return 0;
 }
 
 static const struct pwm_ops meson_pwm_ops = {
diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index c605013e4114..9a6bb334a31b 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -172,9 +172,9 @@ static int mtk_disp_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	return 0;
 }
 
-static void mtk_disp_pwm_get_state(struct pwm_chip *chip,
-				   struct pwm_device *pwm,
-				   struct pwm_state *state)
+static int mtk_disp_pwm_get_state(struct pwm_chip *chip,
+				  struct pwm_device *pwm,
+				  struct pwm_state *state)
 {
 	struct mtk_disp_pwm *mdp = to_mtk_disp_pwm(chip);
 	u64 rate, period, high_width;
@@ -184,14 +184,14 @@ static void mtk_disp_pwm_get_state(struct pwm_chip *chip,
 	err = clk_prepare_enable(mdp->clk_main);
 	if (err < 0) {
 		dev_err(chip->dev, "Can't enable mdp->clk_main: %pe\n", ERR_PTR(err));
-		return;
+		return 0;
 	}
 
 	err = clk_prepare_enable(mdp->clk_mm);
 	if (err < 0) {
 		dev_err(chip->dev, "Can't enable mdp->clk_mm: %pe\n", ERR_PTR(err));
 		clk_disable_unprepare(mdp->clk_main);
-		return;
+		return 0;
 	}
 
 	rate = clk_get_rate(mdp->clk_main);
@@ -211,6 +211,8 @@ static void mtk_disp_pwm_get_state(struct pwm_chip *chip,
 	state->polarity = PWM_POLARITY_NORMAL;
 	clk_disable_unprepare(mdp->clk_mm);
 	clk_disable_unprepare(mdp->clk_main);
+
+	return 0;
 }
 
 static const struct pwm_ops mtk_disp_pwm_ops = {
diff --git a/drivers/pwm/pwm-pca9685.c b/drivers/pwm/pwm-pca9685.c
index f230c10d28bb..41be244e7dd3 100644
--- a/drivers/pwm/pwm-pca9685.c
+++ b/drivers/pwm/pwm-pca9685.c
@@ -431,8 +431,8 @@ static int pca9685_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	return ret;
 }
 
-static void pca9685_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
-				  struct pwm_state *state)
+static int pca9685_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				 struct pwm_state *state)
 {
 	struct pca9685 *pca = to_pca(chip);
 	unsigned long long duty;
@@ -458,12 +458,14 @@ static void pca9685_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		 */
 		state->duty_cycle = 0;
 		state->enabled = false;
-		return;
+		return 0;
 	}
 
 	state->enabled = true;
 	duty = pca9685_pwm_get_duty(pca, pwm->hwpwm);
 	state->duty_cycle = DIV_ROUND_DOWN_ULL(duty * state->period, PCA9685_COUNTER_RANGE);
+
+	return 0;
 }
 
 static int pca9685_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
diff --git a/drivers/pwm/pwm-raspberrypi-poe.c b/drivers/pwm/pwm-raspberrypi-poe.c
index 6ff73029f367..2939b71a7ba7 100644
--- a/drivers/pwm/pwm-raspberrypi-poe.c
+++ b/drivers/pwm/pwm-raspberrypi-poe.c
@@ -82,9 +82,9 @@ static int raspberrypi_pwm_get_property(struct rpi_firmware *firmware,
 	return 0;
 }
 
-static void raspberrypi_pwm_get_state(struct pwm_chip *chip,
-				      struct pwm_device *pwm,
-				      struct pwm_state *state)
+static int raspberrypi_pwm_get_state(struct pwm_chip *chip,
+				     struct pwm_device *pwm,
+				     struct pwm_state *state)
 {
 	struct raspberrypi_pwm *rpipwm = raspberrypi_pwm_from_chip(chip);
 
@@ -93,6 +93,8 @@ static void raspberrypi_pwm_get_state(struct pwm_chip *chip,
 					 RPI_PWM_MAX_DUTY);
 	state->enabled = !!(rpipwm->duty_cycle);
 	state->polarity = PWM_POLARITY_NORMAL;
+
+	return 0;
 }
 
 static int raspberrypi_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
diff --git a/drivers/pwm/pwm-rockchip.c b/drivers/pwm/pwm-rockchip.c
index a5af859217c1..3ec7d1756903 100644
--- a/drivers/pwm/pwm-rockchip.c
+++ b/drivers/pwm/pwm-rockchip.c
@@ -57,9 +57,9 @@ static inline struct rockchip_pwm_chip *to_rockchip_pwm_chip(struct pwm_chip *c)
 	return container_of(c, struct rockchip_pwm_chip, chip);
 }
 
-static void rockchip_pwm_get_state(struct pwm_chip *chip,
-				   struct pwm_device *pwm,
-				   struct pwm_state *state)
+static int rockchip_pwm_get_state(struct pwm_chip *chip,
+				  struct pwm_device *pwm,
+				  struct pwm_state *state)
 {
 	struct rockchip_pwm_chip *pc = to_rockchip_pwm_chip(chip);
 	u32 enable_conf = pc->data->enable_conf;
@@ -70,11 +70,11 @@ static void rockchip_pwm_get_state(struct pwm_chip *chip,
 
 	ret = clk_enable(pc->pclk);
 	if (ret)
-		return;
+		return 0;
 
 	ret = clk_enable(pc->clk);
 	if (ret)
-		return;
+		return 0;
 
 	clk_rate = clk_get_rate(pc->clk);
 
@@ -96,6 +96,8 @@ static void rockchip_pwm_get_state(struct pwm_chip *chip,
 
 	clk_disable(pc->clk);
 	clk_disable(pc->pclk);
+
+	return 0;
 }
 
 static void rockchip_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index 2d4fa5e5fdd4..1e9870aa29e9 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -105,8 +105,8 @@ static void pwm_sifive_update_clock(struct pwm_sifive_ddata *ddata,
 		"New real_period = %u ns\n", ddata->real_period);
 }
 
-static void pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
-				 struct pwm_state *state)
+static int pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				struct pwm_state *state)
 {
 	struct pwm_sifive_ddata *ddata = pwm_sifive_chip_to_ddata(chip);
 	u32 duty, val;
@@ -123,6 +123,8 @@ static void pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	state->duty_cycle =
 		(u64)duty * ddata->real_period >> PWM_SIFIVE_CMPWIDTH;
 	state->polarity = PWM_POLARITY_INVERSED;
+
+	return 0;
 }
 
 static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
diff --git a/drivers/pwm/pwm-sl28cpld.c b/drivers/pwm/pwm-sl28cpld.c
index 589aeaaa6ac8..e64900ad4ba1 100644
--- a/drivers/pwm/pwm-sl28cpld.c
+++ b/drivers/pwm/pwm-sl28cpld.c
@@ -87,9 +87,9 @@ struct sl28cpld_pwm {
 #define sl28cpld_pwm_from_chip(_chip) \
 	container_of(_chip, struct sl28cpld_pwm, pwm_chip)
 
-static void sl28cpld_pwm_get_state(struct pwm_chip *chip,
-				   struct pwm_device *pwm,
-				   struct pwm_state *state)
+static int sl28cpld_pwm_get_state(struct pwm_chip *chip,
+				  struct pwm_device *pwm,
+				  struct pwm_state *state)
 {
 	struct sl28cpld_pwm *priv = sl28cpld_pwm_from_chip(chip);
 	unsigned int reg;
@@ -115,6 +115,8 @@ static void sl28cpld_pwm_get_state(struct pwm_chip *chip,
 	 * the PWM core.
 	 */
 	state->duty_cycle = min(state->duty_cycle, state->period);
+
+	return 0;
 }
 
 static int sl28cpld_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
diff --git a/drivers/pwm/pwm-sprd.c b/drivers/pwm/pwm-sprd.c
index 7004f55bbf11..bda8bc5af976 100644
--- a/drivers/pwm/pwm-sprd.c
+++ b/drivers/pwm/pwm-sprd.c
@@ -65,8 +65,8 @@ static void sprd_pwm_write(struct sprd_pwm_chip *spc, u32 hwid,
 	writel_relaxed(val, spc->base + offset);
 }
 
-static void sprd_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
-			       struct pwm_state *state)
+static int sprd_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+			      struct pwm_state *state)
 {
 	struct sprd_pwm_chip *spc =
 		container_of(chip, struct sprd_pwm_chip, chip);
@@ -83,7 +83,7 @@ static void sprd_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (ret) {
 		dev_err(spc->dev, "failed to enable pwm%u clocks\n",
 			pwm->hwpwm);
-		return;
+		return 0;
 	}
 
 	val = sprd_pwm_read(spc, pwm->hwpwm, SPRD_PWM_ENABLE);
@@ -113,6 +113,8 @@ static void sprd_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	/* Disable PWM clocks if the PWM channel is not in enable state. */
 	if (!state->enabled)
 		clk_bulk_disable_unprepare(SPRD_PWM_CHN_CLKS_NUM, chn->clks);
+
+	return 0;
 }
 
 static int sprd_pwm_config(struct sprd_pwm_chip *spc, struct pwm_device *pwm,
diff --git a/drivers/pwm/pwm-stm32-lp.c b/drivers/pwm/pwm-stm32-lp.c
index 3115abb3f52a..39364c52cfe4 100644
--- a/drivers/pwm/pwm-stm32-lp.c
+++ b/drivers/pwm/pwm-stm32-lp.c
@@ -157,9 +157,9 @@ static int stm32_pwm_lp_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	return ret;
 }
 
-static void stm32_pwm_lp_get_state(struct pwm_chip *chip,
-				   struct pwm_device *pwm,
-				   struct pwm_state *state)
+static int stm32_pwm_lp_get_state(struct pwm_chip *chip,
+				  struct pwm_device *pwm,
+				  struct pwm_state *state)
 {
 	struct stm32_pwm_lp *priv = to_stm32_pwm_lp(chip);
 	unsigned long rate = clk_get_rate(priv->clk);
@@ -185,6 +185,8 @@ static void stm32_pwm_lp_get_state(struct pwm_chip *chip,
 	tmp = prd - val;
 	tmp = (tmp << presc) * NSEC_PER_SEC;
 	state->duty_cycle = DIV_ROUND_CLOSEST_ULL(tmp, rate);
+
+	return 0;
 }
 
 static const struct pwm_ops stm32_pwm_lp_ops = {
diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
index c8445b0a3339..37d75e252d4e 100644
--- a/drivers/pwm/pwm-sun4i.c
+++ b/drivers/pwm/pwm-sun4i.c
@@ -108,9 +108,9 @@ static inline void sun4i_pwm_writel(struct sun4i_pwm_chip *chip,
 	writel(val, chip->base + offset);
 }
 
-static void sun4i_pwm_get_state(struct pwm_chip *chip,
-				struct pwm_device *pwm,
-				struct pwm_state *state)
+static int sun4i_pwm_get_state(struct pwm_chip *chip,
+			       struct pwm_device *pwm,
+			       struct pwm_state *state)
 {
 	struct sun4i_pwm_chip *sun4i_pwm = to_sun4i_pwm_chip(chip);
 	u64 clk_rate, tmp;
@@ -132,7 +132,7 @@ static void sun4i_pwm_get_state(struct pwm_chip *chip,
 		state->duty_cycle = DIV_ROUND_UP_ULL(state->period, 2);
 		state->polarity = PWM_POLARITY_NORMAL;
 		state->enabled = true;
-		return;
+		return 0;
 	}
 
 	if ((PWM_REG_PRESCAL(val, pwm->hwpwm) == PWM_PRESCAL_MASK) &&
@@ -142,7 +142,7 @@ static void sun4i_pwm_get_state(struct pwm_chip *chip,
 		prescaler = prescaler_table[PWM_REG_PRESCAL(val, pwm->hwpwm)];
 
 	if (prescaler == 0)
-		return;
+		return 0;
 
 	if (val & BIT_CH(PWM_ACT_STATE, pwm->hwpwm))
 		state->polarity = PWM_POLARITY_NORMAL;
@@ -162,6 +162,8 @@ static void sun4i_pwm_get_state(struct pwm_chip *chip,
 
 	tmp = (u64)prescaler * NSEC_PER_SEC * PWM_REG_PRD(val);
 	state->period = DIV_ROUND_CLOSEST_ULL(tmp, clk_rate);
+
+	return 0;
 }
 
 static int sun4i_pwm_calculate(struct sun4i_pwm_chip *sun4i_pwm,
diff --git a/drivers/pwm/pwm-sunplus.c b/drivers/pwm/pwm-sunplus.c
index e776fd16512d..d6ebe9f03b35 100644
--- a/drivers/pwm/pwm-sunplus.c
+++ b/drivers/pwm/pwm-sunplus.c
@@ -124,8 +124,8 @@ static int sunplus_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	return 0;
 }
 
-static void sunplus_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
-				  struct pwm_state *state)
+static int sunplus_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				 struct pwm_state *state)
 {
 	struct sunplus_pwm *priv = to_sunplus_pwm(chip);
 	u32 mode0, dd_freq, duty;
@@ -155,6 +155,8 @@ static void sunplus_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	}
 
 	state->polarity = PWM_POLARITY_NORMAL;
+
+	return 0;
 }
 
 static const struct pwm_ops sunplus_pwm_ops = {
diff --git a/drivers/pwm/pwm-visconti.c b/drivers/pwm/pwm-visconti.c
index 927c4cbb1daf..e3fb79b3e2a7 100644
--- a/drivers/pwm/pwm-visconti.c
+++ b/drivers/pwm/pwm-visconti.c
@@ -103,8 +103,8 @@ static int visconti_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	return 0;
 }
 
-static void visconti_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
-				   struct pwm_state *state)
+static int visconti_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				  struct pwm_state *state)
 {
 	struct visconti_pwm_chip *priv = visconti_pwm_from_chip(chip);
 	u32 period, duty, pwmc0, pwmc0_clk;
@@ -122,6 +122,8 @@ static void visconti_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm
 		state->polarity = PWM_POLARITY_NORMAL;
 
 	state->enabled = true;
+
+	return 0;
 }
 
 static const struct pwm_ops visconti_pwm_ops = {
diff --git a/drivers/pwm/pwm-xilinx.c b/drivers/pwm/pwm-xilinx.c
index 4dab2b86c427..f7a50fdcd9a5 100644
--- a/drivers/pwm/pwm-xilinx.c
+++ b/drivers/pwm/pwm-xilinx.c
@@ -169,9 +169,9 @@ static int xilinx_pwm_apply(struct pwm_chip *chip, struct pwm_device *unused,
 	return 0;
 }
 
-static void xilinx_pwm_get_state(struct pwm_chip *chip,
-				 struct pwm_device *unused,
-				 struct pwm_state *state)
+static int xilinx_pwm_get_state(struct pwm_chip *chip,
+				struct pwm_device *unused,
+				struct pwm_state *state)
 {
 	struct xilinx_timer_priv *priv = xilinx_pwm_chip_to_priv(chip);
 	u32 tlr0, tlr1, tcsr0, tcsr1;
@@ -191,6 +191,8 @@ static void xilinx_pwm_get_state(struct pwm_chip *chip,
 	 */
 	if (state->period == state->duty_cycle)
 		state->duty_cycle = 0;
+
+	return 0;
 }
 
 static const struct pwm_ops xilinx_pwm_ops = {
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index d70c6e5a839d..4de09163c968 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -276,8 +276,8 @@ struct pwm_ops {
 		       struct pwm_capture *result, unsigned long timeout);
 	int (*apply)(struct pwm_chip *chip, struct pwm_device *pwm,
 		     const struct pwm_state *state);
-	void (*get_state)(struct pwm_chip *chip, struct pwm_device *pwm,
-			  struct pwm_state *state);
+	int (*get_state)(struct pwm_chip *chip, struct pwm_device *pwm,
+			 struct pwm_state *state);
 	struct module *owner;
 };
 
-- 
2.38.1

