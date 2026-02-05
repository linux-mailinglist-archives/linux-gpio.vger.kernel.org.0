Return-Path: <linux-gpio+bounces-31473-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MI26Ci2XhGmh3gMAu9opvQ
	(envelope-from <linux-gpio+bounces-31473-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 14:12:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8526F308C
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 14:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FEE83007F66
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Feb 2026 13:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4247D3A9D87;
	Thu,  5 Feb 2026 13:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=dev.tdt.de header.i=@dev.tdt.de header.b="npgLFoAW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout70.expurgate.net (mxout70.expurgate.net [194.37.255.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7BF4C97;
	Thu,  5 Feb 2026 13:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.37.255.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770297123; cv=none; b=amSUqgJGPveXyFz2idFa0uN8t8bjNiuQ1iOT/yYx5h3SSclorsN6J10lC/Z0AKAcvZSCVpNYxKr6tzs1cuRDyaqk8TdDgEPInqiKkYyIOl3FSx7eagMZRuZgF2P284D2/4T+rP70mLOB0+YeJRtx8mpoPxHTiLLTlCDsR1BR5iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770297123; c=relaxed/simple;
	bh=qCXf7nKbLScwQy4osBXfLc9iP6E1Wr1KRNIyHXzudxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:Cc; b=YjqLlxaVb2vPv92OWcH0n/J+cOhjmf/D7fJmrC8TAPpNFBfxnpSlnESL+h4ADFFvQXwSN4hh8gKMkGwtMuXNOpCXUWcq3emHqNmmCGfvhykj1hrZBi1bGqUQZe8npgEN9r4MSIreDkuNbRToAgEbgfTM9Y4bpYtxJfgdK3bPjMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dev.tdt.de; spf=pass smtp.mailfrom=dev.tdt.de; dkim=temperror (0-bit key) header.d=dev.tdt.de header.i=@dev.tdt.de header.b=npgLFoAW; arc=none smtp.client-ip=194.37.255.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dev.tdt.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.tdt.de
Received: from [194.37.255.9] (helo=mxout.expurgate.net)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <prvs=451014665c=fe@dev.tdt.de>)
	id 1vnytn-007WtQ-KX; Thu, 05 Feb 2026 13:55:55 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <fe@dev.tdt.de>)
	id 1vnytn-000WoS-2x; Thu, 05 Feb 2026 13:55:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dev.tdt.de;
	s=z1-selector1; t=1770296154;
	bh=alup1cXmxDxE54p3dkBAW3FxBmWlZ8yuytC6oXz/m/I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=npgLFoAWpTAVB+mYRvgpOmMhpm6rCrrbZD9tJyGR6FNjy9In5leEuJgX+JSGo5aaH
	 a4v4kRib4g/d1DwjJrIUvMbmXAr9SaD4EMJvY5rhapY6+sHjw2ysfsJOY2nfjBgfX+
	 ZLtVXbkjKzEMJQNPOoTsd4ggcwrCbwfWtTRT8aEetLspaj8OaE2dIa/iUA+Vj7SIio
	 irte/YTTUgsxIn2XDJrCLU6n8qAfdn0CuCmjEo600TmO1KqjUADSpkB1YuF1D5dXKm
	 pyfjtVj4Gi5emQIfZAyvKHNdeV37MwME0Ej7ZPnRmvp2Vjr7hDADnPie7GzMrU1cOp
	 /wK3zlVeZMzaQ==
Received: from securemail.tdt.de (localhost [127.0.0.1])
	by securemail.tdt.de (Postfix) with ESMTP id A89BB240042;
	Thu,  5 Feb 2026 13:55:54 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
	by securemail.tdt.de (Postfix) with ESMTP id A2B77240041;
	Thu,  5 Feb 2026 13:55:54 +0100 (CET)
Received: from [10.2.3.40] (unknown [10.2.3.40])
	by mail.dev.tdt.de (Postfix) with ESMTPSA id 8373022826;
	Thu,  5 Feb 2026 13:55:54 +0100 (CET)
From: Florian Eckert <fe@dev.tdt.de>
Date: Thu, 05 Feb 2026 13:55:46 +0100
Subject: [PATCH 2/2] pinctrl: equilibrium: fix warning trace on load
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260205-pinctrl-equilibrium-v1-2-66909a3b0acb@dev.tdt.de>
References: <20260205-pinctrl-equilibrium-v1-0-66909a3b0acb@dev.tdt.de>
In-Reply-To: <20260205-pinctrl-equilibrium-v1-0-66909a3b0acb@dev.tdt.de>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Florian Eckert <Eckert.Florian@gmail.com>,
	Florian Eckert <fe@dev.tdt.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770296154; l=3266;
 i=fe@dev.tdt.de; s=20260205; h=from:subject:message-id;
 bh=qCXf7nKbLScwQy4osBXfLc9iP6E1Wr1KRNIyHXzudxE=;
 b=FeqJ5Gtx96tgmNSu5H0o+AjDDtXXGdtlN/NkBG+F1ms0riN8cdqT1bFXVhsmc11rfOkaMlaSu
 w/+h/umafMfC6bmTCzZ1eVY1ShBLVaf73+4DhfLtpPyzA40QeoYxZOr
X-Developer-Key: i=fe@dev.tdt.de; a=ed25519;
 pk=q7Pvv3Au2sAVRhBz5UF7ZqUPNxUwXQ78Jdqu8E6Negk=
X-purgate: clean
X-purgate-ID: 151534::1770296155-53DF9330-5582222A/0/0
X-purgate-type: clean
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[tdt.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[dev.tdt.de:s=z1-selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,dev.tdt.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31473-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[dev.tdt.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,dev.tdt.de:mid,dev.tdt.de:dkim,tdt.de:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fe@dev.tdt.de,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B8526F308C
X-Rspamd-Action: no action

The callback functions 'eqbr_irq_mask()' and 'eqbr_irq_ack()' are also
called in the callback function 'eqbr_irq_mask_ack()'. This is done to
avoid source code duplication. The problem, is that in the function
'eqbr_irq_mask()' also calles the gpiolib function 'gpiochip_disable_irq()'

This generates the following warning trace in the log for every gpio on
load.

[    6.088111] ------------[ cut here ]------------
[    6.092440] WARNING: CPU: 3 PID: 1 at drivers/gpio/gpiolib.c:3810 gpiochip_disable_irq+0x39/0x50
[    6.097847] Modules linked in:
[    6.097847] CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W          6.12.59+ #0
[    6.097847] Tainted: [W]=WARN
[    6.097847] RIP: 0010:gpiochip_disable_irq+0x39/0x50
[    6.097847] Code: 39 c6 48 19 c0 21 c6 48 c1 e6 05 48 03 b2 38 03 00 00 48 81 fe 00 f0 ff ff 77 11 48 8b 46 08 f6 c4 02 74 06 f0 80 66 09 fb c3 <0f> 0b 90 0f 1f 40 00 c3 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40
[    6.097847] RSP: 0000:ffffc9000000b830 EFLAGS: 00010046
[    6.097847] RAX: 0000000000000045 RBX: ffff888001be02a0 RCX: 0000000000000008
[    6.097847] RDX: ffff888001be9000 RSI: ffff888001b2dd00 RDI: ffff888001be02a0
[    6.097847] RBP: ffffc9000000b860 R08: 0000000000000000 R09: 0000000000000000
[    6.097847] R10: 0000000000000001 R11: ffff888001b2a154 R12: ffff888001be0514
[    6.097847] R13: ffff888001be02a0 R14: 0000000000000008 R15: 0000000000000000
[    6.097847] FS:  0000000000000000(0000) GS:ffff888041d80000(0000) knlGS:0000000000000000
[    6.097847] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    6.097847] CR2: 0000000000000000 CR3: 0000000003030000 CR4: 00000000001026b0
[    6.097847] Call Trace:
[    6.097847]  <TASK>
[    6.097847]  ? eqbr_irq_mask+0x63/0x70
[    6.097847]  ? no_action+0x10/0x10
[    6.097847]  eqbr_irq_mask_ack+0x11/0x60

In an other driver (drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c) the
interrupt is not disabled here.

To fix this, do not call the 'eqbr_irq_mask()' and 'eqbr_irq_ack()'
function. Implement instead this directly without disabling the interrupts.

Fixes: 52066a53bd11 ("pinctrl: equilibrium: Convert to immutable irq_chip")
Signed-off-by: Florian Eckert <fe@dev.tdt.de>
---
 drivers/pinctrl/pinctrl-equilibrium.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 99596236f4d2b1c0ea280a2bd2cf4be247bc5042..64a55913acf08ed5ce5b27a4d5bb17bf848a8122 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -64,8 +64,15 @@ static void eqbr_irq_ack(struct irq_data *d)
 
 static void eqbr_irq_mask_ack(struct irq_data *d)
 {
-	eqbr_irq_mask(d);
-	eqbr_irq_ack(d);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct eqbr_gpio_ctrl *gctrl = gpiochip_get_data(gc);
+	unsigned int offset = irqd_to_hwirq(d);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&gctrl->lock, flags);
+	writel(BIT(offset), gctrl->membase + GPIO_IRNENCLR);
+	writel(BIT(offset), gctrl->membase + GPIO_IRNCR);
+	raw_spin_unlock_irqrestore(&gctrl->lock, flags);
 }
 
 static inline void eqbr_cfg_bit(void __iomem *addr,

-- 
2.47.3


