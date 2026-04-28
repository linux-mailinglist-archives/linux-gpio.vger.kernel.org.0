Return-Path: <linux-gpio+bounces-35659-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AXOOK5v8Gn9TQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35659-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 10:28:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D6E480137
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 10:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09287306717C
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 08:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 860033D47A6;
	Tue, 28 Apr 2026 08:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="klZST4EV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284493D349F;
	Tue, 28 Apr 2026 08:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777364575; cv=none; b=h+R3PpG9156FqCgNF5cua2fTX85MpMZa51zIZ15KAM49MWAUy2fNlFAfb8h66hPht2+z3acUkddZiiWiT9OYcMFsHkvh0HQ/z/dS3nYdcqbVjop3FoKTXtURa8kA1Ti40UNmxZYKO0Rov5CWWwbGZdO41to+e5UktrLJWWxPC8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777364575; c=relaxed/simple;
	bh=J7eh+XFrs78utGECZ29cgpAbZ3KJfDOdBszbElZ49jY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IPQEsgAr9E5TxxagUvFwift4/jfKejTKqm8L0oERhpcR4SYLeij7YVu1aDdBFw4oPxiTdMA6eUqRvl7SkXSynvX6db5uHA1k7ofVjB2DDjKW6hmHsQRFxhFawSnhSVUWZukmmTMS5kggowFfen1rAprG+H4BUGISMzZ/QRXYzqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=klZST4EV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4E87C2BCF5;
	Tue, 28 Apr 2026 08:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777364574;
	bh=J7eh+XFrs78utGECZ29cgpAbZ3KJfDOdBszbElZ49jY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=klZST4EVDCkCSERgxKJjmaghR7SS3M6PCM3VxfzV6EmLaj9RfxSpSV5sfWZ0Gcccu
	 MRbQ3yElKf5P2a9Tx2AYv007AqyrFy5TXznuLH4rHNBxyPP1jC2nXfXljvKm3mQ50/
	 bpy5nQMVz0cBsQgUsCqLdsmRDbWvxeFOunvQODGlLHtqPgzZ4Ejz0r1a7XBIUYfcss
	 ne6Q9kwtxKh+qzBg+xd8aEO1Li9vAJcnvJh304F8Iich4IF2dPoNcnk7D9M/NKz0l3
	 Z6mqfHMif4be2wa4ZbXUTzNnlEmc9qp2VX2T5Xkf9X7b54xWzywFUdOZrTXiXB5BDs
	 1mqMV1WAN8TEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7BD5FF886D;
	Tue, 28 Apr 2026 08:22:54 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 28 Apr 2026 08:22:49 +0000
Subject: [PATCH 2/2] pinctrl: meson: support amlogic A9 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-a9-pinctrl-v1-2-cd611bb5f52d@amlogic.com>
References: <20260428-a9-pinctrl-v1-0-cd611bb5f52d@amlogic.com>
In-Reply-To: <20260428-a9-pinctrl-v1-0-cd611bb5f52d@amlogic.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777364572; l=4554;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=VUhEj9cKp+FmG7e6Zp2Dxko9ciBXVboEUbRooKfNrpU=;
 b=yqNFNjMSqcesmpLiPuDXeRbBy/kyQ64rWB4GCE6Y1F9HzNjtF9tMcqRjKm2T6SYiQXA5K4XnE
 L6M8w8ghn7uCK4j8bVwg/ZUoZXuyIRAM6s+UyTk/ofXLLYIXcRuWjX4
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com
X-Rspamd-Queue-Id: 82D6E480137
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35659-lists,linux-gpio=lfdr.de,xianwei.zhao.amlogic.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	HAS_REPLYTO(0.00)[xianwei.zhao@amlogic.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amlogic.com:email,amlogic.com:replyto,amlogic.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

In Amlogic A9 SoC, subordinate bank reuse other master bank is
not from bit0, and subordinate bank reuse multi master banks.

This submission implements this situation.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 61 +++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index e2293a872dcb..256d9787f004 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -55,14 +55,18 @@ struct aml_pio_control {
  * partial bank(subordinate) pins mux config use other bank(main) mux registgers
  * m_bank_id:	the main bank which pin_id from 0, but register bit not from bit 0
  * m_bit_offs:	bit offset the main bank mux register
+ * s_bit_offs:	start bit that subordinate bank use mux register
  * sid:         start pin_id of subordinate bank
  * eid:         end pin_id of subordinate bank
+ * next:	subordinate bank reused multiple other bank groups.
  */
 struct multi_mux {
 	unsigned int m_bank_id;
 	unsigned int m_bit_offs;
+	unsigned int s_bit_offs;
 	unsigned int sid;
 	unsigned int eid;
+	const struct multi_mux *next;
 };
 
 struct aml_pctl_data {
@@ -124,12 +128,51 @@ static const char *aml_bank_name[31] = {
 "GPIOCC", "TEST_N", "ANALOG"
 };
 
+static const struct multi_mux multi_mux_a9[] = {
+	{
+		.m_bank_id = AMLOGIC_GPIO_C,
+		.m_bit_offs = 4,
+		.s_bit_offs = 0,
+		.sid = (AMLOGIC_GPIO_D << 8) + 16,
+		.eid = (AMLOGIC_GPIO_D << 8) + 16,
+		.next = &multi_mux_a9[1],
+	}, {
+		.m_bank_id = AMLOGIC_GPIO_AO,
+		.m_bit_offs = 0,
+		.s_bit_offs = 52,
+		.sid = (AMLOGIC_GPIO_D << 8) + 17,
+		.eid = (AMLOGIC_GPIO_D << 8) + 17,
+		.next = NULL,
+	}, {
+		.m_bank_id = AMLOGIC_GPIO_A,
+		.m_bit_offs = 0,
+		.s_bit_offs = 80,
+		.sid = (AMLOGIC_GPIO_Y << 8) + 8,
+		.eid = (AMLOGIC_GPIO_Y << 8) + 9,
+		.next = NULL,
+	}, {
+		.m_bank_id = AMLOGIC_GPIO_CC,
+		.m_bit_offs = 24,
+		.s_bit_offs = 0,
+		.sid = (AMLOGIC_GPIO_X << 8) + 16,
+		.eid = (AMLOGIC_GPIO_X << 8) + 17,
+		.next = NULL,
+	},
+};
+
+static const struct aml_pctl_data a9_priv_data = {
+	.number = ARRAY_SIZE(multi_mux_a9),
+	.p_mux = multi_mux_a9,
+};
+
 static const struct multi_mux multi_mux_s7[] = {
 	{
 		.m_bank_id = AMLOGIC_GPIO_CC,
 		.m_bit_offs = 24,
+		.s_bit_offs = 0,
 		.sid = (AMLOGIC_GPIO_X << 8) + 16,
 		.eid = (AMLOGIC_GPIO_X << 8) + 19,
+		.next = NULL,
 	},
 };
 
@@ -142,13 +185,17 @@ static const struct multi_mux multi_mux_s6[] = {
 	{
 		.m_bank_id = AMLOGIC_GPIO_CC,
 		.m_bit_offs = 24,
+		.s_bit_offs = 0,
 		.sid = (AMLOGIC_GPIO_X << 8) + 16,
 		.eid = (AMLOGIC_GPIO_X << 8) + 19,
+		.next = NULL,
 	}, {
 		.m_bank_id = AMLOGIC_GPIO_F,
 		.m_bit_offs = 4,
+		.s_bit_offs = 0,
 		.sid = (AMLOGIC_GPIO_D << 8) + 6,
 		.eid = (AMLOGIC_GPIO_D << 8) + 6,
+		.next = NULL,
 	},
 };
 
@@ -177,31 +224,34 @@ static int aml_pctl_set_function(struct aml_pinctrl *info,
 	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
 	unsigned int shift;
 	int reg;
-	int i;
+	int i, loop_count;
 	unsigned int offset = bank->mux_bit_offs;
 	const struct multi_mux *p_mux;
 
 	/* peculiar mux reg set */
-	if (bank->p_mux) {
-		p_mux = bank->p_mux;
+	loop_count = 10;
+	p_mux = bank->p_mux;
+	while (p_mux && loop_count) {
 		if (pin_id >= p_mux->sid && pin_id <= p_mux->eid) {
 			bank = NULL;
 			for (i = 0; i < info->nbanks; i++) {
 				if (info->banks[i].bank_id == p_mux->m_bank_id) {
 					bank = &info->banks[i];
-						break;
+					break;
 				}
 			}
 
 			if (!bank || !bank->reg_mux)
 				return -EINVAL;
 
-			shift = (pin_id - p_mux->sid) << 2;
+			shift = ((pin_id - p_mux->sid) << 2) + p_mux->s_bit_offs;
 			reg = (shift / 32) * 4;
 			offset = shift % 32;
 			return regmap_update_bits(bank->reg_mux, reg,
 					0xf << offset, (func & 0xf) << offset);
 		}
+		p_mux = p_mux->next;
+		loop_count--;
 	}
 
 	/* normal mux reg set */
@@ -1159,6 +1209,7 @@ static int aml_pctl_probe(struct platform_device *pdev)
 
 static const struct of_device_id aml_pctl_of_match[] = {
 	{ .compatible = "amlogic,pinctrl-a4", },
+	{ .compatible = "amlogic,pinctrl-a9", .data = &a9_priv_data, },
 	{ .compatible = "amlogic,pinctrl-s7", .data = &s7_priv_data, },
 	{ .compatible = "amlogic,pinctrl-s6", .data = &s6_priv_data, },
 	{ /* sentinel */ }

-- 
2.52.0



