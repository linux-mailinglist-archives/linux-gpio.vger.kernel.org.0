Return-Path: <linux-gpio+bounces-30970-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFv/KTo/c2mWtwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30970-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:28:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 21302734FA
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29B4F303E08E
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 09:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 631E6364E8C;
	Fri, 23 Jan 2026 09:27:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6BC34DB5F;
	Fri, 23 Jan 2026 09:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769160425; cv=none; b=Pxq4XqkjVEBlbcshHLtxTp/GsL7E/P96PM69i2vr7MFqadgNv307iiRWocj1K8n5a8+AedOA5VwZ1i2VIzUwySIHL4fwbCQVI1C1CRR05I/PHPg6I6uzaCQ3UZTkUmslOLxuaLWJihR1ztdLbI3e6nDaPXIEEs63/N/fujtrcDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769160425; c=relaxed/simple;
	bh=Hl9LdLVmaEDP86aDOaXmV5qwrfCQGY8Vf57r/K2vfGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=VEtwXMPKjnMu4sIV4U37E48jC7holUojeQavNd9lfuMg2bEYqW4MR3ANuuN+Qqw+yrOSZPPSb3jy/1DDfNT/lMnt8QntU3lR6gHczZzIc7WefBYnZzBIOg3Y+5lhAIyapeUDh7l5KsWUVJt1UpVNS38nMtv3hWMdtUnkUD0CSUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 23 Jan
 2026 17:26:27 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 23 Jan 2026 17:26:27 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Fri, 23 Jan 2026 17:26:29 +0800
Subject: [PATCH v2 4/6] gpio: aspeed-sgpio: Convert IRQ functions to use
 llops callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-upstream_sgpio-v2-4-69cfd1631400@aspeedtech.com>
References: <20260123-upstream_sgpio-v2-0-69cfd1631400@aspeedtech.com>
In-Reply-To: <20260123-upstream_sgpio-v2-0-69cfd1631400@aspeedtech.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Jeffery" <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<bmc-sw@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769160386; l=3203;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=Hl9LdLVmaEDP86aDOaXmV5qwrfCQGY8Vf57r/K2vfGo=;
 b=K5o16m1x6dewUe7aGBZCQd8VhK7H5qvqCsuX/OtBs3wmUEm1li/l9HmMHp3sC1i6NAm2bdliC
 pd+fJU5ZViyAfNRcAtJ7kLlypsitiC5xTGENG39S2WcBt/1oECAdTz9
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30970-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,aspeedtech.com:mid,aspeedtech.com:email]
X-Rspamd-Queue-Id: 21302734FA
X-Rspamd-Action: no action

Update aspeed_sgpio_irq_handler() and aspeed_sgpio_setup_irqs() to use
the llops callbacks for register access instead of direct iowrite32().
This creates a unified hardware access layer, which is essential for
supporting SoCs with different register layouts like the AST2700.

Additionally, change the loop bounds to use ngpio instead of the static
ARRAY_SIZE(aspeed_sgpio_banks). This allows the driver to adapt to the
actual number of supported pins on the running SoC.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 33a830ea7d28..b5270e11b153 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -319,12 +319,13 @@ static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct irq_chip *ic = irq_desc_get_chip(desc);
 	struct aspeed_sgpio *data = gpiochip_get_data(gc);
-	unsigned int i, p;
+	unsigned int i, p, banks;
 	unsigned long reg;
 
 	chained_irq_enter(ic, desc);
 
-	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
+	banks = DIV_ROUND_UP(gc->ngpio, 64);
+	for (i = 0; i < banks; i++) {
 		reg = data->pdata->llops->reg_bank_get(data, i << 6, reg_irq_status);
 
 		for_each_set_bit(p, &reg, 32)
@@ -355,7 +356,6 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 				   struct platform_device *pdev)
 {
 	int rc, i;
-	const struct aspeed_sgpio_bank *bank;
 	struct gpio_irq_chip *irq;
 
 	rc = platform_get_irq(pdev, 0);
@@ -365,12 +365,11 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 	gpio->irq = rc;
 
 	/* Disable IRQ and clear Interrupt status registers for all SGPIO Pins. */
-	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
-		bank =  &aspeed_sgpio_banks[i];
+	for (i = 0; i < gpio->chip.ngpio; i += 2) {
 		/* disable irq enable bits */
-		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_enable));
+		gpio->pdata->llops->reg_bit_set(gpio, i, reg_irq_enable, 0);
 		/* clear status bits */
-		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_status));
+		gpio->pdata->llops->reg_bit_set(gpio, i, reg_irq_status, 1);
 	}
 
 	irq = &gpio->chip.irq;
@@ -384,14 +383,13 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 	irq->num_parents = 1;
 
 	/* Apply default IRQ settings */
-	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
-		bank =  &aspeed_sgpio_banks[i];
+	for (i = 0; i < gpio->chip.ngpio; i += 2) {
 		/* set falling or level-low irq */
-		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type0));
+		gpio->pdata->llops->reg_bit_set(gpio, i, reg_irq_type0, 0);
 		/* trigger type is edge */
-		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type1));
+		gpio->pdata->llops->reg_bit_set(gpio, i, reg_irq_type1, 0);
 		/* single edge trigger */
-		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type2));
+		gpio->pdata->llops->reg_bit_set(gpio, i, reg_irq_type2, 0);
 	}
 
 	return 0;

-- 
2.34.1


