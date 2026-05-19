Return-Path: <linux-gpio+bounces-37160-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKC+KjGWDGp1jAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37160-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 18:56:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D93582B2D
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 18:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B0FA30F034E
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 16:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50AD93F1AB9;
	Tue, 19 May 2026 16:40:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FC6340403;
	Tue, 19 May 2026 16:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779208840; cv=none; b=SelUMcXlMse1ZRSSPE0aKZnhuyKxYfB7ERqcb5tLT4RoznNuPnAdxPI6mKLc1Ep0AZPmMg+c1bfNsa2NKfzHaRPI3uh5M9FLJ8t55XABvYA3YlH6sj5JUXcool042ffGcPSIDR57DCeyxolZIZZWzIH6aBb3ctBYIsAMozGBikw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779208840; c=relaxed/simple;
	bh=pAVRAof20PXDUytVbYsQzoxT26t3SRhqDpq90i2F7lA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kh4uqJ5eKrqV64bK+jgEuK7MrURlw4FgSLHpv+pulLmXPp5OkAVR5MjQwhJbcnNzcu7EHpJd+YSswn+SByzttASJfDf/K6OjknXrlk4DEbBLAhL3CDIpY/rJbcnhZwO0ljxYzSfJ4YqL23L3I1Zxrl+6xSv49Q3xj//0BSuVtFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [223.166.95.230])
	by APP-03 (Coremail) with SMTP id rQCowAB3W+Jvkgxq+lqQEQ--.18430S2;
	Wed, 20 May 2026 00:40:17 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
To: Linus Walleij <linusw@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
	Han Gao <gaohan@iscas.ac.cn>,
	Anand Moon <linux.amoon@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>
Subject: [PATCH] pinctrl: spacemit: fix NULL check in spacemit_pin_set_config
Date: Wed, 20 May 2026 00:40:07 +0800
Message-ID: <20260519164007.122574-1-gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAB3W+Jvkgxq+lqQEQ--.18430S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr4fJr17uw4UWF1Utr45trb_yoW8XrW3pF
	43Zrnak345tw48KF4vq3929FyFkan7XryUCa1a9r9rZan5CFy5GryUKFWYqrZ7CrWrJr1F
	qws8ta4Yg3WUAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiDAYLDGoLKuDdZgACsf
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-37160-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,hammernet.be,iscas.ac.cn,gmail.com,pigmoral.tech,linux.spacemit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaohan@iscas.ac.cn,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.linux.dev,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:mid,iscas.ac.cn:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 10D93582B2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

spacemit_pin_set_config() looks up the per-pin descriptor with
spacemit_get_pin() then checks the wrong variable for failure:

	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
	...
	if (!pin)
		return -EINVAL;

	reg = spacemit_pin_to_reg(pctrl, spin->pin);

pin is an unsigned int pin id, where 0 (GPIO_0 / gmac0_rxdv on K3) is a
valid pin, so rejecting it here drops the PAD config write for the first
pin of every group. On K3 Pico-ITX the GMAC RGMII group lists pin 0 as
its first entry, so its drive-strength / bias configuration was silently
ignored.

The intended guard is against spacemit_get_pin() returning NULL when the
pin id isn't in the SoC's pin table. Check spin instead, which both
restores PAD setup for pin 0 and prevents a NULL deref on spin->pin.

Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index b0be62b1c816..95024e2bb5a5 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -795,7 +795,7 @@ static int spacemit_pin_set_config(struct spacemit_pinctrl *pctrl,
 	void __iomem *reg;
 	unsigned int mux;
 
-	if (!pin)
+	if (!spin)
 		return -EINVAL;
 
 	reg = spacemit_pin_to_reg(pctrl, spin->pin);
-- 
2.47.3


