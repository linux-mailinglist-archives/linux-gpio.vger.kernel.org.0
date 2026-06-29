Return-Path: <linux-gpio+bounces-39084-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Yy5XDEsNQmr5zQkAu9opvQ
	(envelope-from <linux-gpio+bounces-39084-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 08:14:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 233BE6D6399
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 08:14:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39084-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39084-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 24B863017CD9
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 06:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07EDC393DFB;
	Mon, 29 Jun 2026 06:07:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A233738945D
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 06:07:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782713270; cv=none; b=f6mivcN9vKFip4UEr+fVIq4+53ENrpl+TJrc+YLkY3agBPGmIiqyp0eLBO+BW5W3Kpy2m9ui014AOts/ktQb5rcP5QFXK4tUbvkFz7a1jLDThEsetnrCtCpyP7g5RbuX9qDQx7zakKojvyI8G1/JhKa3BSE5vpRiS/huZag1gtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782713270; c=relaxed/simple;
	bh=S+xfSjerIzf4333j31cwkBDq1ASe4CstqMGjPHVylHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CN6lSoEYyeO+kr3dLVG05Hw6jCv8ZWuprroU3HQqYKrHFFPCKZbTCfNrcdnU4ZQqQk0vSK2GZer7rdxSA5B419n3bKwZrChaS+zOQ1YdHFfC3s52r0SJnPjGdi9RIUjk/V2uer7JnGL00JMRcNYWHUshNztyBPxV2zt6Kh23w24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; arc=none smtp.client-ip=195.135.223.131
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3F14D75D1E;
	Mon, 29 Jun 2026 06:07:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0E7FC779A8;
	Mon, 29 Jun 2026 06:07:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6rUYArQLQmrfEwAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 29 Jun 2026 06:07:48 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: [PATCH 24/32] drivers/gpio: Stop using 32-bit MSR interfaces
Date: Mon, 29 Jun 2026 08:05:15 +0200
Message-ID: <20260629060526.3638272-25-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629060526.3638272-1-jgross@suse.com>
References: <20260629060526.3638272-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[suse.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:jgross@suse.com,m:linusw@kernel.org,m:brgl@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39084-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[jgross@suse.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 233BE6D6399

The 32-bit MSR interfaces rdmsr() and wrmsr() are planned to be
removed. Use the related 64-bit variants instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/gpio/gpio-cs5535.c | 10 +++++-----
 include/linux/cs5535.h     | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-cs5535.c b/drivers/gpio/gpio-cs5535.c
index 5f5373d86397..a97ec7561889 100644
--- a/drivers/gpio/gpio-cs5535.c
+++ b/drivers/gpio/gpio-cs5535.c
@@ -143,17 +143,17 @@ EXPORT_SYMBOL_GPL(cs5535_gpio_isset);
 
 int cs5535_gpio_set_irq(unsigned group, unsigned irq)
 {
-	uint32_t lo, hi;
+	struct msr val;
 
 	if (group > 7 || irq > 15)
 		return -EINVAL;
 
-	rdmsr(MSR_PIC_ZSEL_HIGH, lo, hi);
+	rdmsrq(MSR_PIC_ZSEL_HIGH, val.q);
 
-	lo &= ~(0xF << (group * 4));
-	lo |= (irq & 0xF) << (group * 4);
+	val.l &= ~(0xF << (group * 4));
+	val.l |= (irq & 0xF) << (group * 4);
 
-	wrmsr(MSR_PIC_ZSEL_HIGH, lo, hi);
+	wrmsrq(MSR_PIC_ZSEL_HIGH, val.q);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(cs5535_gpio_set_irq);
diff --git a/include/linux/cs5535.h b/include/linux/cs5535.h
index 2be1120174eb..5ec2aca537bb 100644
--- a/include/linux/cs5535.h
+++ b/include/linux/cs5535.h
@@ -49,12 +49,12 @@
 static inline int cs5535_pic_unreqz_select_high(unsigned int group,
 						unsigned int irq)
 {
-	uint32_t lo, hi;
+	struct msr val;
 
-	rdmsr(MSR_PIC_ZSEL_HIGH, lo, hi);
-	lo &= ~(0xF << (group * 4));
-	lo |= (irq & 0xF) << (group * 4);
-	wrmsr(MSR_PIC_ZSEL_HIGH, lo, hi);
+	rdmsrq(MSR_PIC_ZSEL_HIGH, val.q);
+	val.l &= ~(0xF << (group * 4));
+	val.l |= (irq & 0xF) << (group * 4);
+	wrmsrq(MSR_PIC_ZSEL_HIGH, val.q);
 	return 0;
 }
 
-- 
2.54.0


