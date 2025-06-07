Return-Path: <linux-gpio+bounces-21100-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C02AD0DBE
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Jun 2025 15:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B7EC188DF07
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Jun 2025 13:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996BE1A3142;
	Sat,  7 Jun 2025 13:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsLZhJm2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E88A360;
	Sat,  7 Jun 2025 13:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749304494; cv=none; b=H4lvoJOjnfR9BW/sri+4bdDuy8pCOvYRNS7RHhky/dWw/zrysqjrw0tnMLZkbhfIEMEXCSlX0rrvjp3ZvLSi/07rKMB4mXDVJcgKpjA1e1RIe+N+T4RV56kSvPgcP2AtgPviTpy2q7dtubjqPjMofASK4w4qAbjInq/e12qouvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749304494; c=relaxed/simple;
	bh=cmThDcb02rdfOWIo8z/d3jAmVfEg/kXS4OHfeoZ1jmY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E1bDYCRXaGPrJBXX/klvVp17GHrwTIn1b0T9rl2uYiyXZGN2gk8K27qO0pCNe69w2XbsBOJihB6PdU+JUEkcfWl9ie3DwTeU8FwjLkMv2qIDXc9y9AzPNP/5Ok+i787+lv/9MZy04CV5B1QpgSv4b/M640HFXhJ8L0M2HdKX5MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsLZhJm2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9133C4CEE4;
	Sat,  7 Jun 2025 13:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749304493;
	bh=cmThDcb02rdfOWIo8z/d3jAmVfEg/kXS4OHfeoZ1jmY=;
	h=From:To:Cc:Subject:Date:From;
	b=jsLZhJm2UN37rYwys1H4vv3Yj23hoDiLQqK/rMBMeIC3kckiwvu0LPiSq2Tp8aiAi
	 mm8uOHNKZYXjQWg6/kshWPM8DdTWRhpj6vHZVZlv/+ci6wXljnpiLxS5JpSI6gmoTk
	 2XylaOhu0TWKNTOQUbNH2t7EPZlxnd78WLpb7hRcK8PDtC1Atuh0PdkdEfHUGwbW3I
	 4aDvxG5repQir8/seK2hsTkU8VXQzYByC0/pODw62E/olz/clIp7ktorRSVOfgEaOe
	 EQ1j1q0RUOztGi1QsJ79XuTTP32TeST37CqbFhMv3rT9LkaGP1puIjM84IBxAOEcPv
	 Q0CU+w8Uu3pkw==
Received: by wens.tw (Postfix, from userid 1000)
	id 1153A5FD0C; Sat,  7 Jun 2025 21:54:51 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH resend] pinctrl: sunxi: dt: Consider pin base when calculating bank number from pin
Date: Sat,  7 Jun 2025 21:54:50 +0800
Message-Id: <20250607135450.2086806-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen-Yu Tsai <wens@csie.org>

In prepare_function_table() when the pinctrl function table IRQ entries
are generated, the pin bank is calculated from the absolute pin number;
however the IRQ bank mux array is indexed from the first pin bank of the
controller. For R_PIO controllers, this means the absolute pin bank is
way off from the relative pin bank used for array indexing.

Correct this by taking into account the pin base of the controller.

Fixes: f5e2cd34b12f ("pinctrl: sunxi: allow reading mux values from DT")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
Resent to linux-gpio mailing list instead of linux-clk.

 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 1833078f6877..4e34b0cd3b73 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -143,7 +143,7 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
  */
 static int prepare_function_table(struct device *dev, struct device_node *pnode,
 				  struct sunxi_desc_pin *pins, int npins,
-				  const u8 *irq_bank_muxes)
+				  unsigned pin_base, const u8 *irq_bank_muxes)
 {
 	struct device_node *node;
 	struct property *prop;
@@ -166,7 +166,7 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 	 */
 	for (i = 0; i < npins; i++) {
 		struct sunxi_desc_pin *pin = &pins[i];
-		int bank = pin->pin.number / PINS_PER_BANK;
+		int bank = (pin->pin.number - pin_base) / PINS_PER_BANK;
 
 		if (irq_bank_muxes[bank]) {
 			pin->variant++;
@@ -211,7 +211,7 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 	last_bank = 0;
 	for (i = 0; i < npins; i++) {
 		struct sunxi_desc_pin *pin = &pins[i];
-		int bank = pin->pin.number / PINS_PER_BANK;
+		int bank = (pin->pin.number - pin_base) / PINS_PER_BANK;
 		int lastfunc = pin->variant + 1;
 		int irq_mux = irq_bank_muxes[bank];
 
@@ -353,7 +353,7 @@ int sunxi_pinctrl_dt_table_init(struct platform_device *pdev,
 		return PTR_ERR(pins);
 
 	ret = prepare_function_table(&pdev->dev, pnode, pins, desc->npins,
-				     irq_bank_muxes);
+				     desc->pin_base, irq_bank_muxes);
 	if (ret)
 		return ret;
 
-- 
2.39.5


