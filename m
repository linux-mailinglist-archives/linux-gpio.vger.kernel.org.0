Return-Path: <linux-gpio+bounces-16698-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C0CA47C22
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 12:26:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C0063A9D4C
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 11:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7236322B598;
	Thu, 27 Feb 2025 11:25:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B551F22A7FA;
	Thu, 27 Feb 2025 11:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740655525; cv=none; b=fC2kSR8SXIiF4Vry/vOMHbx+shR6lnEMPZik48FzEa75y83eQ+8OIDxJW8lP7oCEILz9tunUBzg8sESekb4rMqW6KciuLYaDW+p0CW+fAIrV3oBTi3GnoKtlHDNLrFmg1TJrA7ymwaQ/oMSS6Vm0l6xTbObc35pGh1MvWnAHKUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740655525; c=relaxed/simple;
	bh=UZeskF50AAVW4VIGzve81+WsAxXVC9xLTtHgwD9uLs8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ohjB6tKxk1Nw9U/D57zSaktYcsUjbenmF6EqyCItZ+wvGHxJcGUZUqBUUYMILA92hVulzYI+yyWfw2ssYfguMay1AYR7l73EyMFOovj/oJo63VcvmkBE8xUW2NRQ+1x7ai9cVCeCMy+ig6wBUHeOH/XyK17+rPiYPl1G6nsHRl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6A629340DE6;
	Thu, 27 Feb 2025 11:25:20 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 27 Feb 2025 19:24:59 +0800
Subject: [PATCH 1/2] irqdomain: support three-cell scheme interrupts
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-04-gpio-irq-threecell-v1-1-4ae4d91baadc@gentoo.org>
References: <20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org>
In-Reply-To: <20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=UZeskF50AAVW4VIGzve81+WsAxXVC9xLTtHgwD9uLs8=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnwEuV0jaUFEhkEP6ug87op1aJ2zrrksR0O4/U8
 RKhyaKWORWJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ8BLlV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277UX0EACSHmw0dzvqhyKnH9
 rMgv7118nywDJl0Y6Gk4xDkHfe2vMbGXesc+/1KJydfcUdp0VoWk27zqB1h8PibvL1D67EiztH8
 lH8sRPHJO+OxcLX2B+xrAmVNIRcpvGrQ/gc5NLrpN1NFiurr/Y3NJXk3egkqaWc4fq0m262vBuH
 FelcyQvaGmKVxBwa6iiQmbpUht5FtW2dUKGdjVyQ9TxclBag2YTBP1Gju5KvbY9Dv01PD9h0xl2
 cJF4jSde2/L+7IEzRGVqhk6jLR48EwLl9fFXOfUC8l2CfnfH6XSmYtC4T5UtcB4P3e1EKmYMWzw
 Ne1shUaasajMhePQOXx2v0xeGAfpDMvF3i3oTiibBHkbufWtlNFzYaGIOPNOL3fNeJvTS0AYz3N
 wK2fd4517J5RoUfYfXiN42a/hz2fLT/uKku+QwUOwIRWffEAV8NgmQMsAunat661FUMszCiJRfb
 9SITGMdlzp8e/QkyAk15Qb/abS2ClSqBvRkEwi3Jt8TjBoeIl2YEfMb8rvMXVdrjDfRXHxDCn/2
 Xi/qed2jBPi8rnXzaSSozsWctOQH/aRoUXieECzwjq2vb4BtPkK22SNFKkUEQjwFqVHyh58TXE7
 A6Il0VonnwBEt7ykP0OYKrHobSM485ZWplM/UliXEIlrqYs0ZOYB0IhVCTqFRFqOZT3Q==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The is a prerequisite patch to support parsing three-cell
interrupts which encoded as <instance hwirq irqflag>,
the translate function will always retrieve irq number and
flag from last two cells.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 kernel/irq/irqdomain.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index ec6d8e72d980f604ded2bfa2143420e0e0095920..cb874ab5e54a4763d601122becd63b6d759e55d2 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1208,10 +1208,17 @@ int irq_domain_translate_twocell(struct irq_domain *d,
 				 unsigned long *out_hwirq,
 				 unsigned int *out_type)
 {
+	u32 irq, type;
+
 	if (WARN_ON(fwspec->param_count < 2))
 		return -EINVAL;
-	*out_hwirq = fwspec->param[0];
-	*out_type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
+
+	irq = fwspec->param_count - 2;
+	type = fwspec->param_count - 1;
+
+	*out_hwirq = fwspec->param[irq];
+	*out_type = fwspec->param[type] & IRQ_TYPE_SENSE_MASK;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(irq_domain_translate_twocell);

-- 
2.48.1


