Return-Path: <linux-gpio+bounces-36277-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJBJBEsT+2lLWQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36277-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 12:09:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDCB4D9252
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 12:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2313C306F17D
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 09:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882B541B34C;
	Wed,  6 May 2026 09:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sr9dxcpK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14CA3FAE0C;
	Wed,  6 May 2026 09:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778061495; cv=none; b=J5zS/R0/G20CA6puxC3QsZa/E13AaJPo4HcpA7o2A4Ej58UbN7Ge244JhPDsntN0ZsfcwShP8wyNXfB9XdPRiPRPEXYqSK1wcXhHDyAOH8eEfudcugjM/ToJsS/pTndIbG6jd4UOfA34mxWbSGHTO0tXy7dpfV3tJonZ6+pitK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778061495; c=relaxed/simple;
	bh=swaIO29uhHgaslA4Hb1JIgdHX4IRPVdujCyvQCSGJPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RMz1Wh33e+43cWUharXJQCd7625d11thbMeBnbiEoVY2KAOejDYsMkaZNhmdPSxI4giEhjgjcFwBJNHZ9Xd4oCvtCb7koOEDdFIMmtHjiibjab+IqMIkpD5dZ4cW6OIy5F+5XZin2BcaZ/K651/oOqAdcgdSDLyjLqXjbov0Nrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sr9dxcpK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33148C2BCB8;
	Wed,  6 May 2026 09:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778061495;
	bh=swaIO29uhHgaslA4Hb1JIgdHX4IRPVdujCyvQCSGJPk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sr9dxcpKbkrPjay+PbxV7TxKARgnQeSvNiWdxHqqwTNyrWnN71FmZ69sBQgaLvVQf
	 jfhZGtsQFIsRLl9k9OgRgPasiztvdv+jBiqTq/tE3N++VVFnbEA0A/ScgMxM5z2sl5
	 Lp8N0kf+l218jEg7tFKPLbxLeN61EcUyvtV+ayG0qiG5LVUkhIwpdaCzCbcLJGqAFP
	 SfwNY73hVH75Kab2ugZt3wkdwD5h2+LvAyOO2IeTRnNiuanHljXzrPGtD8GjTDZsqk
	 4WzHdhqekeI1A3CusbSWknRQ0nbkXvEVrWedGSn0fPEpinzyGbRdKeJBzY9aWjdpLa
	 1LlIf1TfxLL8Q==
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [RFC v1 3/4] pinctrl: spacemit: delete check_power()
Date: Wed,  6 May 2026 10:57:41 +0100
Message-ID: <20260506-backtalk-pregnant-ff4cbd27b4d0@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506-energize-dramatize-051909e54256@spud>
References: <20260506-energize-dramatize-051909e54256@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2013; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=f33zeKL5li7qyIF7zuSgaFGlrhBhLaxwN0tJ5RiB2fs=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm/BSa/fc7zKjvqntBa9fW+u13t5l559yMkpVm8yHaN2 g3T7R9CO0pZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRUl9Ghkb7K6GySfZHrVbE +nLKtcfcW7eaP9Uu1v5jRfmelg1TrBkZvodaMm5n71KetaAucPcL7fz3XefyfAtz+vpX7zLwdzf kBQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5EDCB4D9252
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36277-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

From: Conor Dooley <conor.dooley@microchip.com>

AFAICT, this is pointless because generate_config performs this check
too.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 37 ---------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index 62cab6f6cd0a8..41d8a34bc386b 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -409,38 +409,6 @@ static inline u32 spacemit_get_drive_strength_mA(enum spacemit_pin_io_type type,
 	}
 }
 
-static int spacemit_pctrl_check_power(struct pinctrl_dev *pctldev,
-				      struct device_node *dn,
-				      struct spacemit_pin_mux_config *pinmuxs,
-				      int num_pins, const char *grpname)
-{
-	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-	struct device *dev = pctrl->dev;
-	enum spacemit_pin_io_type type;
-	u32 power = 0, i;
-
-	of_property_read_u32(dn, "power-source", &power);
-
-	for (i = 0; i < num_pins; i++) {
-		type = spacemit_to_pin_io_type(pinmuxs[i].pin);
-
-		if (type != IO_TYPE_EXTERNAL)
-			continue;
-
-		switch (power) {
-		case PIN_POWER_STATE_1V8:
-		case PIN_POWER_STATE_3V3:
-			break;
-		default:
-			dev_err(dev, "group %s has unsupported power\n",
-				grpname);
-			return -ENOTSUPP;
-		}
-	}
-
-	return 0;
-}
-
 static void spacemit_set_io_pwr_domain(struct spacemit_pinctrl *pctrl,
 				      const struct spacemit_pin *spin,
 				      const enum spacemit_pin_io_type type)
@@ -548,11 +516,6 @@ static int spacemit_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 				return dev_err_probe(dev, -ENODEV, "failed to get pin %d\n", pins[i]);
 		}
 
-		ret = spacemit_pctrl_check_power(pctldev, child, pinmuxs,
-						 npins, grpname);
-		if (ret < 0)
-			return ret;
-
 		map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
 		map[nmaps].data.mux.function = np->name;
 		map[nmaps].data.mux.group = grpname;
-- 
2.53.0


