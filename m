Return-Path: <linux-gpio+bounces-30958-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GK9+KDvvcmlCrQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30958-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 04:47:07 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E8401702F7
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 04:47:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 79A4D30069BC
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 03:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F8B38A732;
	Fri, 23 Jan 2026 03:46:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4348936CE0A;
	Fri, 23 Jan 2026 03:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769140015; cv=none; b=VG1Xh1SOBuuOP3EgehM6vLwn2MQYpL/cRgUl3rLt1s9FuOO0bZ1lYWqIIjuKXf8dSAQ4/36eC5jaiVK0Q8SNJPJmX4H35ZkfQvgf5wwEcBHRXpnq5wXcP0QhOikGR6cvVnvV9v1B8D3Xhu9A81EgCp2r2LX2ZYG1+LRANXHQpi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769140015; c=relaxed/simple;
	bh=mLpIgJBdohwcrKeJ7RCQJzIRtJYXXrUcbvE9Zo7aONY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DNXx7ONFmvkKvdsWoejNPDM8gGkxxyZza3SOnQQPhf/KkXqGi5OZojIcV5dbOk17PXxtQDRAmedHtvapLxnI/K90m9XF7HmSrrc6/CnCi3PO5B7t2aS8gBkyYCHv9Ff1TXrcR38u3Zo8Kbp8rsDosJdEW2VL/iWmnNN0N8bUT1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 23 Jan
 2026 11:41:23 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 23 Jan 2026 11:41:23 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Fri, 23 Jan 2026 11:41:23 +0800
Subject: [PATCH v2 1/3] pinctrl: single: add per-pin binding support for
 bit-per-mux
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-upstream_pinctrl_single-v2-1-40f8063cc5a2@aspeedtech.com>
References: <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
In-Reply-To: <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
To: Tony Lindgren <tony@atomide.com>, Haojian Zhuang
	<haojian.zhuang@linaro.org>, Linus Walleij <linusw@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<andrew@codeconstruct.com.au>, <BMC-SW@aspeedtech.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769139683; l=5457;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=mLpIgJBdohwcrKeJ7RCQJzIRtJYXXrUcbvE9Zo7aONY=;
 b=KwIq7vVGhjbAhEhx26OUgaWYrMkkXqPRuQTsp/1E1Ub3O2z7Mx085EQDtjsNyjPzvca/CIW0+
 SUpHnwBMj6kBeylvbR0HjoCkfK85s/Nz3U0WmhILd5KdzDGmRAScZff
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,aspeedtech.com:mid,aspeedtech.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-30958-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: E8401702F7
X-Rspamd-Action: no action

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


