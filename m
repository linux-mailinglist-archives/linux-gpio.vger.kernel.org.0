Return-Path: <linux-gpio+bounces-29792-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CFECD5EEB
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 13:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 618043042481
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 12:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4092777F9;
	Mon, 22 Dec 2025 12:09:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ACF2264DC;
	Mon, 22 Dec 2025 12:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766405383; cv=none; b=lDXGKIsvsKgGFy+mo3sPYMqf8mzhNPm24YHdFoev+BBraHR6xfYOoRy9Plshwpdm5ssOTz/m6t1BQSigKGrkQXawAhu/hZPeAPhszMrO0ec76b8zXZGYRSVXsxZRFXgPsszuubEwi5Y+EFyu7xhpUsIRZ1jWXTDiRW/NUb0yTn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766405383; c=relaxed/simple;
	bh=mLpIgJBdohwcrKeJ7RCQJzIRtJYXXrUcbvE9Zo7aONY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=J4x4xFbTrBXrLl6khiu1AFzdsDt1KKx437foPuQUQkA3z/yPqyMdWHdarcj/g5Lwe8l78NlhiQtr9lOlYChtYd9AERWkB2ezOy9iAao8suE3LuS5dm05rc7s9mG6mXfj7rltBs4ts5fIHV67Bm1xHIFAfZ+phHV82wTlCB5+l2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 22 Dec
 2025 20:04:29 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 22 Dec 2025 20:04:29 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Mon, 22 Dec 2025 20:04:26 +0800
Subject: [PATCH 1/3] pinctrl: single: add per-pin binding support for
 bit-per-mux
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251222-upstream_pinctrl_single-v1-1-e4aaa4eeb936@aspeedtech.com>
References: <20251222-upstream_pinctrl_single-v1-0-e4aaa4eeb936@aspeedtech.com>
In-Reply-To: <20251222-upstream_pinctrl_single-v1-0-e4aaa4eeb936@aspeedtech.com>
To: Tony Lindgren <tony@atomide.com>, Haojian Zhuang
	<haojian.zhuang@linaro.org>, Linus Walleij <linusw@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<andrew@codeconstruct.com.au>, <BMC-SW@aspeedtech.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766405069; l=5457;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=mLpIgJBdohwcrKeJ7RCQJzIRtJYXXrUcbvE9Zo7aONY=;
 b=Pzzag0AP1fUP+JeYNPfAgUs+c8wGseV6rvbd84ZvFG/U6WNasJTJv236B2W2K22qLQSRCQjB6
 az9HzXP2ONAAlxfsmJ/m0Ldi0uDmvY7+aqky2RAPekWBQBwGxqkNHWT
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=

Add support for binding where bit-per-mux users specify pins as
<pin_index func_sel> pairs. Prefer explicit bits binding when present,
but fall back to the new per-pin binding for improved flexibility.
This approach is intended to adapt to hardware with a regular register
layout, where pin functions are arranged with a fixed stride. For example,
the function of pin 0 is controlled by bits [3:0] at offset 0, the
function of pin 1 by bits [7:4] at the same offset, and so on.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/pinctrl/pinctrl-single.c | 132 +++++++++++++++++++++++++++++----------
 1 file changed, 100 insertions(+), 32 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 998f23d6c317..757c22cc09f3 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1041,29 +1041,81 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 			break;
 		}
 
-		offset = pinctrl_spec.args[0];
-		vals[found].reg = pcs->base + offset;
+		/*
+		 * For legacy (non bit-per-mux) users the first cell is the
+		 * register offset and the second (and optional third) cell is
+		 * the value to be written.
+		 *
+		 * For bit-per-mux users we want a simpler binding where the
+		 * first cell is the pin index and the second cell is the
+		 * function selector. Translate that into register offset,
+		 * value and mask here so the rest of the driver can stay
+		 * Register based.
+		 */
+		if (!pcs->bits_per_mux) {
+			offset = pinctrl_spec.args[0];
+			vals[found].reg = pcs->base + offset;
 
-		switch (pinctrl_spec.args_count) {
-		case 2:
-			vals[found].val = pinctrl_spec.args[1];
-			break;
-		case 3:
-			vals[found].val = (pinctrl_spec.args[1] | pinctrl_spec.args[2]);
-			break;
-		}
+			switch (pinctrl_spec.args_count) {
+			case 2:
+				vals[found].val = pinctrl_spec.args[1];
+				break;
+			case 3:
+				vals[found].val = (pinctrl_spec.args[1] |
+						   pinctrl_spec.args[2]);
+				break;
+			}
 
-		dev_dbg(pcs->dev, "%pOFn index: 0x%x value: 0x%x\n",
-			pinctrl_spec.np, offset, vals[found].val);
+			dev_dbg(pcs->dev, "%pOFn offset: 0x%x value: 0x%x\n",
+				 pinctrl_spec.np, offset, vals[found].val);
 
-		pin = pcs_get_pin_by_offset(pcs, offset);
-		if (pin < 0) {
-			dev_err(pcs->dev,
-				"could not add functions for %pOFn %ux\n",
-				np, offset);
-			break;
+			pin = pcs_get_pin_by_offset(pcs, offset);
+			if (pin < 0) {
+				dev_err(pcs->dev,
+					"could not add functions for %pOFn %ux\n",
+					np, offset);
+				break;
+			}
+			pins[found++] = pin;
+		} else {
+			unsigned int pin_index, func_sel;
+			unsigned int shift, mask, val;
+
+			/* Expect <pin_index func_sel> for bit-per-mux users. */
+			if (pinctrl_spec.args_count < 2) {
+				dev_err(pcs->dev,
+					"invalid args_count for bit-per-mux spec: %i\n",
+					pinctrl_spec.args_count);
+				break;
+			}
+
+			pin_index = pinctrl_spec.args[0];
+			func_sel = pinctrl_spec.args[1];
+
+			if (pin_index >= pcs->desc.npins) {
+				dev_err(pcs->dev,
+					"pin index out of range for %pOFn: %u (npins %u)\n",
+					np, pin_index, pcs->desc.npins);
+				break;
+			}
+
+			offset = pcs_pin_reg_offset_get(pcs, pin_index);
+			shift = pcs_pin_shift_reg_get(pcs, pin_index);
+
+			mask = pcs->fmask << shift;
+			val = (func_sel << shift) & mask;
+
+			vals[found].reg = pcs->base + offset;
+			vals[found].val = val;
+			vals[found].mask = mask;
+
+			dev_dbg(pcs->dev,
+				 "%pOFn pin: %u offset: 0x%x func: 0x%x val: 0x%x mask: 0x%x\n",
+				 pinctrl_spec.np, pin_index, offset,
+				 func_sel, val, mask);
+
+			pins[found++] = pin_index;
 		}
-		pins[found++] = pin;
 	}
 
 	pgnames[0] = np->name;
@@ -1280,21 +1332,37 @@ static int pcs_dt_node_to_map(struct pinctrl_dev *pctldev,
 	}
 
 	if (pcs->bits_per_mux) {
-		ret = pcs_parse_bits_in_pinctrl_entry(pcs, np_config, map,
-				num_maps, pgnames);
-		if (ret < 0) {
-			dev_err(pcs->dev, "no pins entries for %pOFn\n",
-				np_config);
-			goto free_pgnames;
+		/*
+		 * For bit-per-mux users there are two possible bindings:
+		 * - pinctrl-single,bits: offset/value/mask triples
+		 * - pinctrl-single,pins: <pin_index func_sel> pairs
+		 *
+		 * Prefer the explicit bits binding when present so existing
+		 * users keep their current behaviour, otherwise fall back
+		 * to the per-pin binding.
+		 */
+		if (of_find_property(np_config, "pinctrl-single,bits", NULL)) {
+			ret = pcs_parse_bits_in_pinctrl_entry(pcs, np_config,
+							      map, num_maps,
+							      pgnames);
+		} else if (of_find_property(np_config,
+					    "pinctrl-single,pins", NULL)) {
+			ret = pcs_parse_one_pinctrl_entry(pcs, np_config, map,
+							  num_maps, pgnames);
+		} else {
+			ret = -EINVAL;
 		}
 	} else {
-		ret = pcs_parse_one_pinctrl_entry(pcs, np_config, map,
-				num_maps, pgnames);
-		if (ret < 0) {
-			dev_err(pcs->dev, "no pins entries for %pOFn\n",
-				np_config);
-			goto free_pgnames;
-		}
+		if (of_find_property(np_config, "pinctrl-single,pins", NULL))
+			ret = pcs_parse_one_pinctrl_entry(pcs, np_config, map,
+							  num_maps, pgnames);
+		else
+			ret = -EINVAL;
+	}
+
+	if (ret < 0) {
+		dev_err(pcs->dev, "no pins entries for %pOFn\n", np_config);
+		goto free_pgnames;
 	}
 
 	return 0;

-- 
2.34.1


