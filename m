Return-Path: <linux-gpio+bounces-37480-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBixF+Z8FGowNwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37480-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 18:46:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B2E5CD067
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 18:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9DF830277C4
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 16:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4433F6C3C;
	Mon, 25 May 2026 16:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="hp0HLQvq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C45F3F65EC;
	Mon, 25 May 2026 16:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779727369; cv=none; b=hotyV1QcnI2+7Qb6nVBSZlQJIiidFHjsUU6F+LTCaUhvvA/QdUttOGITCOOoC0xRtIvl+vPYvlt+1JNqeGOaL3IyeaKhk1ceYc2+KgLSKfw6yYfNMV9NN1tWD8pklKEAzpxodgOaJruGYsqxqxaeq1GejtpDxA6IY1G7eEHau4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779727369; c=relaxed/simple;
	bh=tYb7EiJrA7HY9h6NF25A/246WD8DV5q9e0H5fLjg+M4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VRsXiVmTJ7BqjrqyediAufnroy5EVpDZHXsbcQ+6++J9YA5fDUBlOIfdPQPOy29cJ/thlyszP5TeoYXx4TpGKlhfSm644eTmxF94vMrm2db38lMwWLz6hK9vFML4u+/0DOoQrJ4joyZgahSMVL9rgynX20Ht7hH8/iEsNnLycpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=hp0HLQvq; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E0B2A27202;
	Mon, 25 May 2026 18:42:46 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNK1EPbJY_67; Mon, 25 May 2026 18:42:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1779727366; bh=tYb7EiJrA7HY9h6NF25A/246WD8DV5q9e0H5fLjg+M4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hp0HLQvqO1mb5Dsk6KPITtG7rPvFkpEOi2o/Oru9pe0b0MeolFOwfLECjLDA//ZGp
	 fTVwOWbtCJyskqQEmqg2jDO3pF7ULnA4nzf458Ai0aFExLs77d0UrOiedpeHU8s5+j
	 Imb5RzFMtBIJ6w0fqxyUp7H+2IYSybOsv33d7S5sVBy4PQvX49ohnjkycTfGvKJoim
	 1Dixd7VCGjW5/UHi1JPGQWXqatHABzYyZ1MPQBoKve+qgz2cvWBhOUaD3a995YCgJ7
	 Wcp/ji0TLGbQwZZhHUWdbNiqF1oHX0zndh+mI0j7T+GnhLQ8gakq64DhKk15KTpO9/
	 0580b2POZm1zQ==
From: "Marco Scardovi (scardracs)" <scardracs@disroot.org>
To: linusw@kernel.org,
	brgl@kernel.org,
	heiko@sntech.de
Cc: linux-gpio@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Marco Scardovi (scardracs)" <scardracs@disroot.org>
Subject: [PATCH 2/2] gpio: rockchip: fix teardown bugs and resource leaks
Date: Mon, 25 May 2026 18:39:39 +0200
Message-ID: <20260525164230.43307-3-scardracs@disroot.org>
In-Reply-To: <20260525164230.43307-1-scardracs@disroot.org>
References: <20260525164230.43307-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37480-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[disroot.org:+];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:email,disroot.org:mid,disroot.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B3B2E5CD067
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit addresses several teardown issues and resource leaks in the
driver's remove path and error handling:

1. Debounce clock reference leak: The debounce clock (bank->db_clk) was
   obtained using of_clk_get() which increments the clock's reference
   count, but clk_put() was never called. A devm action is now registered
   to cleanly release it on unbind. Note that of_clk_get(..., 1) remains
   necessary over devm_clk_get() because the DT binding does not define
   clock-names, precluding name-based lookup.

2. Unregistered chained IRQ handler: The chained IRQ handler was not
   disconnected in remove(). If a stray interrupt fired after the driver
   was removed, the kernel would attempt to execute a stale handler,
   leading to a panic. This is fixed by clearing the handler in remove().

3. IRQ domain leak: The linear IRQ domain and its generic chips were
   allocated manually during probe but never removed. The IRQ domain is
   now removed during driver teardown to free the associated generic chips
   and mappings.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/gpio/gpio-rockchip.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 33580093a4e7..c804f970d823 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -638,10 +638,17 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
 	return ret;
 }
 
+static void rockchip_clk_put(void *data)
+{
+	struct clk *clk = data;
+
+	clk_put(clk);
+}
+
 static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 {
 	struct resource res;
-	int id = 0;
+	int id = 0, ret;
 
 	if (of_address_to_resource(bank->of_node, 0, &res)) {
 		dev_err(bank->dev, "cannot find IO resource for bank\n");
@@ -673,6 +680,13 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 			dev_err(bank->dev, "cannot find debounce clk\n");
 			return -EINVAL;
 		}
+
+		ret = devm_add_action_or_reset(bank->dev, rockchip_clk_put,
+					       bank->db_clk);
+		if (ret) {
+			dev_err(bank->dev, "failed to register debounce clk action\n");
+			return ret;
+		}
 		break;
 	case GPIO_TYPE_V1:
 		bank->gpio_regs = &gpio_regs_v1;
@@ -789,6 +803,9 @@ static void rockchip_gpio_remove(struct platform_device *pdev)
 {
 	struct rockchip_pin_bank *bank = platform_get_drvdata(pdev);
 
+	irq_set_chained_handler_and_data(bank->irq, NULL, NULL);
+	if (bank->domain)
+		irq_domain_remove(bank->domain);
 	gpiochip_remove(&bank->gpio_chip);
 }
 
-- 
2.54.0


