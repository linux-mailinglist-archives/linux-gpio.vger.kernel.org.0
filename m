Return-Path: <linux-gpio+bounces-36278-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OH87DWQT+2lLWQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36278-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 12:09:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 356B94D926E
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 12:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 30781307564E
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 09:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA028402454;
	Wed,  6 May 2026 09:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WG44oO9T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47CF3DC4A3;
	Wed,  6 May 2026 09:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778061498; cv=none; b=Mypo4EzqjemjblwtLDc1mkm5j96aA1RKZ5+wv1khGyxeDY7HfgOIqPOxjWGBSLJ0XQk0bVixYFRnnGnfFrLDtT3/h+p2soWDm8Uevy9i5Oqh5TBdHgMLJlOf2/iBNYkMgqBc8HdSPedxJpU/iJi5iCD7UOHzP14a/WoVmkxSCJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778061498; c=relaxed/simple;
	bh=v2Z43waBNb1sScGZkywyBPPfu9AJTH0bPEJbypNx/9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sl+/dOmKy+Za8vTBmZceHymoPnVua7fF1AzHTqYuAKEEr7/0298YXje77VYMa9oadMzpWuxW0YlQhFtWPVshcsGhVVcYv2oOZRTOZ38W3vukMxtZxkccAJccXlp4yA4tN+rYIIpmh9BDXxH+iOb8Mh9Rq6KMjLQYgaNFIt8G/RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WG44oO9T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60557C2BCC9;
	Wed,  6 May 2026 09:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778061497;
	bh=v2Z43waBNb1sScGZkywyBPPfu9AJTH0bPEJbypNx/9Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WG44oO9TMvF7kiD51Etx91un/RdtZOeMoteCnQgQFqUaqeA25FD+DAHQIemqgDZng
	 56v2HgLykir7ilGwY9wv7O7zsRQvLUgh5yDL6057DboKTr1t3Py+T+6fRjT0wPJsW8
	 CdoPtl1bodVpxIaCoadImuzAM6g7WIWpVpbgBiwlZQpAqExNBrz1j8fUi9MLTQVy4p
	 yXc1RAc8fUEGvdOwVurE48hcOFFCAwlnvPWr1Co5fXGmL1rkzzS/f9hVLCB+UTHR0X
	 kiT5vg85L0QLRi+TpixO/5bbuxbl+WQzFAIoaf9HUpWupesFCATXTu2Wvyob4pHuh8
	 UqMinIs5doyBQ==
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
Subject: [RFC v1 4/4] pinctrl: spacemit: move over to generic pinmux dt_node_to_map implementation
Date: Wed,  6 May 2026 10:57:42 +0100
Message-ID: <20260506-womb-bonus-68a236490084@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506-energize-dramatize-051909e54256@spud>
References: <20260506-energize-dramatize-051909e54256@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3606; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=EBo7vsj45Fm6ts8vxVZqmKyxIs0BuENJUV4vbK7h45M=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm/BSb39VRuPlyx7dTVybtPFKcGfqt8LVWl+3qm9zZDQ Z9Oix2nO0pZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjARz4+MDPvXrE5ff0aqJjZ+ 72rz29sKlLcx7hURWFDwKJSjs+PzSw6Gf4Y7Z25c31Yd73LtiJXD7brJorYHdHd7HHn/8v2O0Gw XcSYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 356B94D926E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36278-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,microchip.com:email]

From: Conor Dooley <conor.dooley@microchip.com>

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 33 ++++++++++-----------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index 41d8a34bc386b..c90b6ccfce2ea 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -114,11 +114,6 @@ struct spacemit_pinctrl_data {
 	const struct spacemit_pinctrl_dconf	*dconf;
 };
 
-struct spacemit_pin_mux_config {
-	const struct spacemit_pin	*pin;
-	u32				config;
-};
-
 /* map pin id to pinctrl register offset, refer MFPR definition */
 static unsigned int spacemit_k1_pin_to_offset(unsigned int pin)
 {
@@ -474,7 +469,6 @@ static int spacemit_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	ngroups = 0;
 	guard(mutex)(&pctrl->mutex);
 	for_each_available_child_of_node_scoped(np, child) {
-		struct spacemit_pin_mux_config *pinmuxs;
 		unsigned int config, *pins;
 		int i, npins;
 
@@ -497,10 +491,6 @@ static int spacemit_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 		if (!pins)
 			return -ENOMEM;
 
-		pinmuxs = devm_kcalloc(dev, npins, sizeof(*pinmuxs), GFP_KERNEL);
-		if (!pinmuxs)
-			return -ENOMEM;
-
 		for (i = 0; i < npins; i++) {
 			ret = of_property_read_u32_index(child, "pinmux",
 							 i, &config);
@@ -509,11 +499,6 @@ static int spacemit_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 				return -EINVAL;
 
 			pins[i] = spacemit_dt_get_pin(config);
-			pinmuxs[i].config = config;
-			pinmuxs[i].pin = spacemit_get_pin(pctrl, pins[i]);
-
-			if (!pinmuxs[i].pin)
-				return dev_err_probe(dev, -ENODEV, "failed to get pin %d\n", pins[i]);
 		}
 
 		map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
@@ -522,7 +507,7 @@ static int spacemit_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 		nmaps += 1;
 
 		ret = pinctrl_generic_add_group(pctldev, grpname,
-						pins, npins, pinmuxs);
+						pins, npins, &config);
 		if (ret < 0)
 			return dev_err_probe(dev, ret, "failed to add group %s: %d\n", grpname, ret);
 
@@ -559,7 +544,7 @@ static const struct pinctrl_ops spacemit_pctrl_ops = {
 	.get_group_name		= pinctrl_generic_get_group_name,
 	.get_group_pins		= pinctrl_generic_get_group_pins,
 	.pin_dbg_show		= spacemit_pctrl_dbg_show,
-	.dt_node_to_map		= spacemit_pctrl_dt_node_to_map,
+	.dt_node_to_map		= pinctrl_generic_pinmux_dt_node_to_map,
 	.dt_free_map		= pinctrl_utils_free_map,
 };
 
@@ -568,8 +553,8 @@ static int spacemit_pmx_set_mux(struct pinctrl_dev *pctldev,
 {
 	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	const struct group_desc *group;
-	const struct spacemit_pin_mux_config *configs;
 	unsigned int i, mux;
+	unsigned int *configs;
 	void __iomem *reg;
 
 	group = pinctrl_generic_get_group(pctldev, gsel);
@@ -579,11 +564,17 @@ static int spacemit_pmx_set_mux(struct pinctrl_dev *pctldev,
 	configs = group->data;
 
 	for (i = 0; i < group->grp.npins; i++) {
-		const struct spacemit_pin *spin = configs[i].pin;
-		u32 value = configs[i].config;
+		const struct spacemit_pin *spin;
+		u32 value = configs[i];
+
+		spin = spacemit_get_pin(pctrl, group->grp.pins[i]);
+		if (!spin) {
+			dev_err(pctrl->dev, "Invalid pin %u\n", group->grp.pins[i]);
+			return -EINVAL;
+		}
 
 		reg = spacemit_pin_to_reg(pctrl, spin->pin);
-		mux = spacemit_dt_get_pin_mux(value);
+		mux = value;
 
 		guard(raw_spinlock_irqsave)(&pctrl->lock);
 		value = readl_relaxed(reg) & ~PAD_MUX;
-- 
2.53.0


