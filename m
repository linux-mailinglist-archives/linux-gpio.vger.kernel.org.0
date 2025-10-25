Return-Path: <linux-gpio+bounces-27608-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0655C09725
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Oct 2025 18:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD19B3AC952
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Oct 2025 16:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9670306B3C;
	Sat, 25 Oct 2025 16:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eiv/itaA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E383304BB8;
	Sat, 25 Oct 2025 16:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761409117; cv=none; b=smSkMJ/dGzJnqe+1uS7ATBaC/QBXhYF8I2rs90jrXnnQpzbWSjwpP7LYkBEmjNG42XYX2jrh0Rh6Q7yuoU32CyRNCVe2XRGNwtNhAITk+C+e4NvlgJsVJK/XHQBPaFYjTl8RpHB8o8HUuCousjCHeDgfBZFGrXQSXZJ+L45YXGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761409117; c=relaxed/simple;
	bh=MqWjGTemgYbJk4aKJXikLaSuGnhNkeFWTQuYp2fq9qA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n90mTiVhZm6kkG+ETbT0vPKJwflIz7yxewyo+EvsPYvcQWpsb9h8cqvL6mJV5P8WVhFSkwE7ylNAog6SlmhZr1YfwYj+WrEDOLVXKkQx3CtABjtZ6uoE9zhvaM5D3Xp5h9q8fUSBHhGiIiXdm/RslGEoV84gyptKIoWorbHrkCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eiv/itaA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1AB5C4CEF5;
	Sat, 25 Oct 2025 16:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409117;
	bh=MqWjGTemgYbJk4aKJXikLaSuGnhNkeFWTQuYp2fq9qA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Eiv/itaAJz4Z24KXEuDNoVqMeDLruzhZEDGOz90JGYBoDVW5ULH5W23kcwcK+SK4A
	 nreaZsjdwvz/5o0mgVYeDC956spgFGMqFL4QsxzCWbPyUmHCXnlGTWUNA34KRdxmRQ
	 n/VWA1+i98TO3F0/1Fqn1loXyiouIfli+yfgSLDQhYvCD34YTlKhb8qgZlXNfAZlof
	 qiJ6xIA6VwSM1sIPSO4ijfrkI3+UrBAU8A2QMod3zkrhZIWJtnFkkoZWp1GTI/PCok
	 rpdEUoGb9tlqJONxiTPyQGSnLWNghvu0NHSSk0o1t+UVIw1c9LtnoFPS+Dsdu4CsSJ
	 FG7OwXmRhUTDg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	srini@kernel.org,
	p.zabel@pengutronix.de,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17] ASoC: codecs: wsa883x: Handle shared reset GPIO for WSA883x speakers
Date: Sat, 25 Oct 2025 11:57:16 -0400
Message-ID: <20251025160905.3857885-205-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

[ Upstream commit cf65182247761f7993737b710afe8c781699356b ]

On some Qualcomm platforms such as QCS6490-RB3Gen2, the multiple
WSA8830/WSA8835 speaker amplifiers share a common reset (shutdown) GPIO.

To handle such scenario, use the reset controller framework and its
"reset-gpio" driver to handle such case. This allows proper handling
of all WSA883x speaker amplifiers on QCS6490-RB3Gen2 board.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Link: https://patch.msgid.link/20250815172353.2430981-3-mohammad.rafi.shaik@oss.qualcomm.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- What it fixes
  - Addresses real functional issues on platforms where multiple WSA883x
    amplifiers share a single shutdown/reset line (e.g.,
    QCS6490-RB3Gen2). Using a plain GPIO per-device does not coordinate
    shared users; one instance toggling the line can inadvertently reset
    others. The patch switches to the reset controller framework with
    the reset‑gpio backend to handle shared lines correctly.

- Scope and minimality
  - Single-file, localized change in `sound/soc/codecs/wsa883x.c`.
  - No ABI or architectural changes; strictly startup/shutdown control
    path in probe.
  - Optional feature: falls back to existing `powerdown-gpios` behavior
    if no reset controller is provided, keeping backward compatibility.

- Specific code changes and rationale
  - Adds reset framework usage
    - Include added: `#include <linux/reset.h>` in
      `sound/soc/codecs/wsa883x.c`.
    - Private data gains an optional reset handle: `struct reset_control
      *sd_reset;` alongside the existing `sd_n` GPIO
      (sound/soc/codecs/wsa883x.c:462).
  - Centralized assert/deassert helpers
    - New helpers `wsa883x_reset_assert()` and
      `wsa883x_reset_deassert()` switch between
      `reset_control_assert/deassert()` and
      `gpiod_direction_output(sd_n, 1/0)` depending on whether a reset
      control is present.
  - Robust resource acquisition with graceful fallback
    - New `wsa883x_get_reset()` first tries
      `devm_reset_control_get_optional_shared(dev, NULL)` and, if none,
      falls back to the existing `devm_gpiod_get_optional(dev,
      "powerdown", ...)` path. This keeps old DTs working while enabling
      shared-reset handling when “resets”/“reset-gpios” is used.
  - Safer cleanup on errors/unbind
    - In `wsa883x_probe()`, instead of manually asserting the GPIO only
      on regmap-init failure (previous code:
      `gpiod_direction_output(wsa883x->sd_n, 1)` in the error path at
      sound/soc/codecs/wsa883x.c:1579–1585), the patch calls
      `wsa883x_reset_deassert(wsa883x)` to bring the device out of
      reset, then registers `devm_add_action_or_reset(dev,
      wsa883x_reset_assert, wsa883x)`. This guarantees the reset is
      asserted on any probe failure or device removal, mirroring the
      established pattern used in other codecs.
  - Probe flow changes (localized, low risk)
    - Replaces the hardwired GPIO bring-up:
      - Old: acquire `powerdown-gpios` then
        `gpiod_direction_output(sd_n, 0)` to deassert
        (sound/soc/codecs/wsa883x.c:1572–1575, 1561–1568).
      - New: `wsa883x_get_reset()` and `wsa883x_reset_deassert()` with
        `devm_add_action_or_reset` to ensure deterministic cleanup.
        Functionally equivalent for non-shared setups, but robust for
        shared lines.

- Precedent and consistency
  - The WSA884x codec already uses the same reset-controller-with-
    fallback pattern (e.g., `sound/soc/codecs/wsa884x.c:1999–2060`),
    demonstrating the approach is accepted upstream and low risk. This
    change brings WSA883x in line with WSA884x.

- Backport risk assessment
  - Small, contained, and backwards compatible: if no reset controller,
    code behaves as before with the `powerdown-gpios` line.
  - No behavioral change to runtime PM/audio paths; only reset/powerdown
    handling in probe/cleanup is touched.
  - No dependencies beyond standard reset framework and `reset-gpio`,
    both present in stable series; the driver already builds with reset
    APIs (used elsewhere in tree).
  - Documentation note: current 6.17 binding for WSA883x
    (`Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml`) lists
    `powerdown-gpios`, not `reset-gpios`/`resets`. Functionally this is
    fine (fallback keeps working), but if boards want to use shared
    reset via reset-gpio, a binding backport (to allow `reset-gpios` or
    `resets`) may be desirable to avoid dtbs_check warnings. This is
    documentation-only and does not affect runtime.

- Stable criteria
  - Fixes a real platform issue (shared reset handling) affecting users.
  - No new features to the audio path; no architectural refactor.
  - Very low regression risk, self-contained, and aligns with existing
    patterns in sibling drivers.
  - While there is no explicit “Fixes:” or “Cc: stable”, the change
    clearly improves correctness on affected hardware with minimal
    impact elsewhere, making it a good stable candidate.

 sound/soc/codecs/wsa883x.c | 57 ++++++++++++++++++++++++++++++++------
 1 file changed, 49 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 188363b03b937..ca4520ade79aa 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -14,6 +14,7 @@
 #include <linux/printk.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
@@ -468,6 +469,7 @@ struct wsa883x_priv {
 	struct sdw_stream_runtime *sruntime;
 	struct sdw_port_config port_config[WSA883X_MAX_SWR_PORTS];
 	struct gpio_desc *sd_n;
+	struct reset_control *sd_reset;
 	bool port_prepared[WSA883X_MAX_SWR_PORTS];
 	bool port_enable[WSA883X_MAX_SWR_PORTS];
 	int active_ports;
@@ -1546,6 +1548,46 @@ static const struct hwmon_chip_info wsa883x_hwmon_chip_info = {
 	.info	= wsa883x_hwmon_info,
 };
 
+static void wsa883x_reset_assert(void *data)
+{
+	struct wsa883x_priv *wsa883x = data;
+
+	if (wsa883x->sd_reset)
+		reset_control_assert(wsa883x->sd_reset);
+	else
+		gpiod_direction_output(wsa883x->sd_n, 1);
+}
+
+static void wsa883x_reset_deassert(struct wsa883x_priv *wsa883x)
+{
+	if (wsa883x->sd_reset)
+		reset_control_deassert(wsa883x->sd_reset);
+	else
+		gpiod_direction_output(wsa883x->sd_n, 0);
+}
+
+static int wsa883x_get_reset(struct device *dev, struct wsa883x_priv *wsa883x)
+{
+	wsa883x->sd_reset = devm_reset_control_get_optional_shared(dev, NULL);
+	if (IS_ERR(wsa883x->sd_reset))
+		return dev_err_probe(dev, PTR_ERR(wsa883x->sd_reset),
+				     "Failed to get reset\n");
+	/*
+	 * if sd_reset: NULL, so use the backwards compatible way for powerdown-gpios,
+	 * which does not handle sharing GPIO properly.
+	 */
+	if (!wsa883x->sd_reset) {
+		wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
+							GPIOD_FLAGS_BIT_NONEXCLUSIVE |
+							GPIOD_OUT_HIGH);
+		if (IS_ERR(wsa883x->sd_n))
+			return dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
+					     "Shutdown Control GPIO not found\n");
+	}
+
+	return 0;
+}
+
 static int wsa883x_probe(struct sdw_slave *pdev,
 			 const struct sdw_device_id *id)
 {
@@ -1566,13 +1608,9 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to enable vdd regulator\n");
 
-	wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-						GPIOD_FLAGS_BIT_NONEXCLUSIVE | GPIOD_OUT_HIGH);
-	if (IS_ERR(wsa883x->sd_n)) {
-		ret = dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
-				    "Shutdown Control GPIO not found\n");
+	ret = wsa883x_get_reset(dev, wsa883x);
+	if (ret)
 		goto err;
-	}
 
 	dev_set_drvdata(dev, wsa883x);
 	wsa883x->slave = pdev;
@@ -1595,11 +1633,14 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	pdev->prop.simple_clk_stop_capable = true;
 	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
 	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
-	gpiod_direction_output(wsa883x->sd_n, 0);
+
+	wsa883x_reset_deassert(wsa883x);
+	ret = devm_add_action_or_reset(dev, wsa883x_reset_assert, wsa883x);
+	if (ret)
+		return ret;
 
 	wsa883x->regmap = devm_regmap_init_sdw(pdev, &wsa883x_regmap_config);
 	if (IS_ERR(wsa883x->regmap)) {
-		gpiod_direction_output(wsa883x->sd_n, 1);
 		ret = dev_err_probe(dev, PTR_ERR(wsa883x->regmap),
 				    "regmap_init failed\n");
 		goto err;
-- 
2.51.0


