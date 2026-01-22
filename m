Return-Path: <linux-gpio+bounces-30879-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOPcCeN5cWkvHwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30879-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 02:14:11 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E10A60358
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 02:14:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AEB7D500B9F
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 01:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632A8341AD0;
	Thu, 22 Jan 2026 01:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="nsUvtL+k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A427234164B;
	Thu, 22 Jan 2026 01:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769044437; cv=none; b=JDWZ8C7JASUcDmQyjxDDxFwCXh22TyEapN46vdmXu/UXSs/qNvfghguef+ZMpmmm+ym4vAEsUTiCGvJf+7LpgFt7vrLO43zAr1o7Xsx3QHlemZi7ymgEBNLqqOMIHVkj/oRjiJ/GeCG38FtKYBhcR0nrEnJnosb002WgZSkSP5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769044437; c=relaxed/simple;
	bh=HTp+Do+BE5EGcVI/v3yRKJyoUKPYpIeDXAWsrGMIs+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hTJhB3IZMv7qQt4qtsMuu7RVLpyotHvRq61uDbw47TqL7Nuc+SXXf5gOnYzvi6+lYn1xiQUbg21vB8j06feTjtgX+Ahl+YLkEP09+n8OzHJcCZ7FphrJX3qsIz5/VYcSe6O9KgUSUP+s7iiNqNnnAB11LbvWt0d/jWR/0zOTNJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=nsUvtL+k; arc=none smtp.client-ip=192.19.166.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id B1161C008DE1;
	Wed, 21 Jan 2026 17:06:25 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com B1161C008DE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1769043985;
	bh=HTp+Do+BE5EGcVI/v3yRKJyoUKPYpIeDXAWsrGMIs+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nsUvtL+kfOAq+lSzB9gWV8gk/+wPQbgTDEHbbWICbYWqeNAUNBkVw4B1yf1qZrAO8
	 iCxoYXBU89u7Sr35hgzAQZ+Wwaf8xObeyjLEfOo+kpdOz3EB04qZHdR8Tbb9NIoRc8
	 foZEM+kOqwWM9K8dS7vbDQUz1ofY5yWYDmayLSr4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 924B019CD8;
	Wed, 21 Jan 2026 17:06:25 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH 1/3] gpio: brcmstb: correct hwirq to bank map
Date: Wed, 21 Jan 2026 17:05:14 -0800
Message-ID: <20260122010516.1200630-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122010516.1200630-1-florian.fainelli@broadcom.com>
References: <20260122010516.1200630-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=dkimrelay];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[broadcom.com:+];
	TAGGED_FROM(0.00)[bounces-30879-lists,linux-gpio=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[broadcom.com,reject];
	FREEMAIL_CC(0.00)[gmail.com,broadcom.com,kernel.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 8E10A60358
X-Rspamd-Action: no action

From: Doug Berger <opendmb@gmail.com>

The brcmstb_gpio_hwirq_to_bank() function was designed to
accommodate the downward numbering of dynamic GPIOs by
traversing the bank list in the reverse order. However, the
dynamic numbering has changed to increment upward which can
produce an incorrect mapping.

The function is modified to no longer assume an ordering of
the list to accommodate either option.

Fixes: 7b61212f2a07 ("gpiolib: Get rid of ARCH_NR_GPIOS")
Signed-off-by: Doug Berger <opendmb@gmail.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/gpio/gpio-brcmstb.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index af9287ff5dc4..2352d099709c 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -301,12 +301,10 @@ static struct brcmstb_gpio_bank *brcmstb_gpio_hwirq_to_bank(
 		struct brcmstb_gpio_priv *priv, irq_hw_number_t hwirq)
 {
 	struct brcmstb_gpio_bank *bank;
-	int i = 0;
 
-	/* banks are in descending order */
-	list_for_each_entry_reverse(bank, &priv->bank_list, node) {
-		i += bank->chip.gc.ngpio;
-		if (hwirq < i)
+	list_for_each_entry(bank, &priv->bank_list, node) {
+		if (hwirq >= bank->chip.gc.offset &&
+		    hwirq < (bank->chip.gc.offset + bank->chip.gc.ngpio))
 			return bank;
 	}
 	return NULL;
-- 
2.43.0


