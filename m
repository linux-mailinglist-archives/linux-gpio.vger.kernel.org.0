Return-Path: <linux-gpio+bounces-31096-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOzYFgYqeGl7oQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31096-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 03:59:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EE08F4C8
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 03:59:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1A4AA300616A
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 02:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED36A29A30E;
	Tue, 27 Jan 2026 02:59:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB982DCF6B;
	Tue, 27 Jan 2026 02:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769482755; cv=none; b=f5TCDpGfJ9X6TXmltgpMh0UcA75WpY2kKdSitVlX+A9k1yqiGO0ZG0JWDGaWr+1Q1oTLv84VcmGs2aGPCqfakkWPGM0tCNOTkyW1YyvCXdq2IyCPTmQ0Su4yTiYIldNNfeIQOkpyyMvnwTdfTFPbRmYMA0qSA4iQN0Av0MTRuoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769482755; c=relaxed/simple;
	bh=/N92tFqXBWR2t7JMjYxLe6MI9R0Q4CYbIh2K8mtgxcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fw/62EpzX9ssVbQqaVk13vfxSpjszm97vlRTb/sP5K6FZSE9zYMm5v96lUrN0IevmegE3QHWxSkRZAIg/h7VjZQNmEd/Z6WYRvH79bWVmj8AGYKMBTYY01cS90pUqA7Vq5Xi8sTtRL2XoyneKJxgJ0F73/zV8CrFvEEfH/A1fwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [127.0.0.2] (unknown [210.73.43.101])
	by APP-01 (Coremail) with SMTP id qwCowACHMGzqKXhpDppkBg--.41488S2;
	Tue, 27 Jan 2026 10:58:50 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Tue, 27 Jan 2026 10:58:49 +0800
Subject: [PATCH] gpio: spacemit-k1: Use PDR for pin direction, not SDR/CDR
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-gpio-spacemit-k1-pdr-v1-1-bb868a517dbc@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAOgpeGkC/yWN2wqDMBBEf0X2uQETm4v9leLDJlltKGqa2FIQ/
 71LhXk5A3Nmh0olUYVbs0OhT6ppXRjkpYHwwGUikSIzqFaZViorppxWUTMGmtMmnlLkWES0Ujv
 nTYx9CzzNhcb0/Wvvw8mFXm+2b2cJHiuJsM4suTUdGuw4Y7iSdMRfhKMJSjutO69RWt9LYy0Mx
 /EDxHggCrIAAAA=
X-Change-ID: 20260127-gpio-spacemit-k1-pdr-d71588b6dd90
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.3
X-CM-TRANSID:qwCowACHMGzqKXhpDppkBg--.41488S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAF1UZF1UGry7JF1rCF4Uurg_yoW5ury3pF
	Wru3savF45JFWUtFnFvFnrZF4fCan7tFnxAF42grW8Zwn0qFyktr48tF93XFy5ZFyrZr42
	qr4DKr18C3ZrAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9K14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r4UMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUO6pPUUUUU
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,spacemit.com:url];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FROM_NEQ_ENVFROM(0.00)[wangruikang@iscas.ac.cn,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-31096-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: A4EE08F4C8
X-Rspamd-Action: no action

On the SpacemiT GPIO controller, the direction control register PDR is
readable and writable [1]. Therefore, implement direction control by
using PDR as dirout, and don't mark it as unreadable.

The original implementation, using SDR as dirout and CDR as dirin, is
not actually a supported configuration by gpio-mmio. The hardware
supports changing the direction of some pins atomically by writing a
value with the corresponding bits set to SDR (set as output) or to CDR
(set as input). However, gpio-mmio does not actually handle this.

Using only PDR as dirout to match the expectations of gpio-mmio. This
also allows us to avoid clobbering potentially important GPIO direction
configurations set by pre-Linux boot stages.

Found while trying to add PCIe support to OrangePi RV2, where the
regulator (controlled by GPIO 116) turns off on boot while some other
GPIO pin in the same bank is touched, which is not desirable.

Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#18.4-gpio # [1]
Fixes: d00553240ef8 ("gpio: spacemit: add support for K1 SoC")
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
Tested on K1 only - help with K3 testing would be appreciated.

Backporting this looks like it would be annoying. Unsure about whether
it would be necessary.

Of course the PCIe 3.3V regulator still needs to described properly in
the future DTS update for OrangePi RV2, but IIUC this avoids having the
regulator briefly powering off? In any case, being able to read the
direction is still an improvement.
---
 drivers/gpio/gpio-spacemit-k1.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
index 8f570a1a4894..dbd2e81094b9 100644
--- a/drivers/gpio/gpio-spacemit-k1.c
+++ b/drivers/gpio/gpio-spacemit-k1.c
@@ -199,7 +199,7 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 	struct gpio_chip *gc = &gb->chip.gc;
 	struct device *dev = sg->dev;
 	struct gpio_irq_chip *girq;
-	void __iomem *dat, *set, *clr, *dirin, *dirout;
+	void __iomem *dat, *set, *clr, *dirout;
 	int ret;
 
 	gb->base = regs + sg->data->bank_offsets[index];
@@ -208,8 +208,7 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 	dat	= gb->base + to_spacemit_gpio_regs(gb)[SPACEMIT_GPLR];
 	set	= gb->base + to_spacemit_gpio_regs(gb)[SPACEMIT_GPSR];
 	clr	= gb->base + to_spacemit_gpio_regs(gb)[SPACEMIT_GPCR];
-	dirin	= gb->base + to_spacemit_gpio_regs(gb)[SPACEMIT_GCDR];
-	dirout	= gb->base + to_spacemit_gpio_regs(gb)[SPACEMIT_GSDR];
+	dirout	= gb->base + to_spacemit_gpio_regs(gb)[SPACEMIT_GPDR];
 
 	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
@@ -218,9 +217,7 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 		.set = set,
 		.clr = clr,
 		.dirout = dirout,
-		.dirin = dirin,
-		.flags = GPIO_GENERIC_UNREADABLE_REG_SET |
-			 GPIO_GENERIC_UNREADABLE_REG_DIR,
+		.flags = GPIO_GENERIC_UNREADABLE_REG_SET,
 	};
 
 	/* This registers 32 GPIO lines per bank */

---
base-commit: 3a6a36a3fc4e18e202eaf6c258553b5a17b91677
change-id: 20260127-gpio-spacemit-k1-pdr-d71588b6dd90

Best regards,
-- 
Vivian "dramforever" Wang


