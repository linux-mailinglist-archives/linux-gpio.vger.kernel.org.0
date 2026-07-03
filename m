Return-Path: <linux-gpio+bounces-39412-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0PNoLmG8R2q/eQAAu9opvQ
	(envelope-from <linux-gpio+bounces-39412-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 15:42:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E010703010
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 15:42:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=K7eo9h3B;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39412-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39412-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6104930547D8
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 13:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F385C3DA5B1;
	Fri,  3 Jul 2026 13:30:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D27D3D891C;
	Fri,  3 Jul 2026 13:30:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783085454; cv=none; b=EbCKuqU9RygIQaL6XZyd+iM6q4cvaeHZGI0EOkx61JZuH6NtandqW1CZ3lykNrzRz6nWMcoa+yX2UQdxgXtrKDgCky2z6IsPNBVyvoEPdP3iWEEcyyyOguTEczJCEJ20MNA5i9VeXVkeTlj4NWEqFtN9wbokk+0YKOVdSjtZ9Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783085454; c=relaxed/simple;
	bh=qLX9DQ6US1jLkaxEAOSY64aDksPeerbbEeIDbPKoJVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qqqChXsWdJDhi86mogcmLhckk6EaJn0ohTQUcQqzbP88v/fy50+x2ivIjjxhpDF+kJNlQpTuhSGlzhaQkMT2gT0ec1Eo/qZl1WWkjDJhiR9RzufPff+tBhfSUu4IvF9eYr+CwKuQ6MxkvJviU47qG3UVVp2nJPIez3wGWc/gm6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=K7eo9h3B; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B9DD61A0E2A;
	Fri,  3 Jul 2026 13:30:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8ED9160300;
	Fri,  3 Jul 2026 13:30:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12473104C9464;
	Fri,  3 Jul 2026 15:30:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783085445; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RGZOL8C2TkmYpdoDmtcWAQyhNiUWAQ2nkK1kVx5QS1A=;
	b=K7eo9h3BUEmCk/xosCZC6V6++51tqWU4cMERDXId5OyY53HOByjSQGLNUQ65mFwhXwx+cI
	9ebFPdIipeNTq/kb6e+ddxnpSpJNKVtm2ucrRIoU6G2CTdQAf01lJmhxD+Tc9r0RKQbcgK
	id6i2RQR+dw6P80YvEcsjIRhjsckMTBPEIpgamXYWV5pHCkbofgTKGMDRjoIOlImLoK/MX
	hEFNBy3lQVHCYmLp0KnaljRc3aeT7A/2MmwP6hi+lB0SzM2bd3Kk4QzqxyGOrbD4NX+CO4
	jQbehgzGYkmCHMsiBvPzMd0X5lLNh9gTfxKa7zXRr+gLgkeDlxcHU/VzLKJQbA==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Fri, 03 Jul 2026 15:30:17 +0200
Subject: [PATCH 09/12] soc: fsl: qe: Rename irq variable to parent_irq
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qe-pic-gpios-v1-9-6c3e706e27dc@bootlin.com>
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
In-Reply-To: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
To: Qiang Zhao <qiang.zhao@nxp.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Paul Louvel <paul.louvel@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783085423; l=1714;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=qLX9DQ6US1jLkaxEAOSY64aDksPeerbbEeIDbPKoJVA=;
 b=55d1Hq2Gudzpk5/2MD3gVD6YluwwZMFeAdM8hRfZB6IhTnjsBdCCzYQupJ+SZ+NKhsMhxSrNd
 +8uV2+zFd8iA8VY7KuXYZ2cT7dPQ/IkFTCHlmkWjcCrdxG1Uf24axWX
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39412-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[nxp.com,kernel.org,linux.ibm.com,ellerman.id.au,gmail.com];
	FORGED_SENDER(0.00)[paul.louvel@bootlin.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:qiang.zhao@nxp.com,m:chleroy@kernel.org,m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:paul.louvel@bootlin.com,m:thomas.petazzoni@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul.louvel@bootlin.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:from_mime,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E010703010

Rename the local variable holding the platform IRQ to parent_irq, which
better describes its role as the upstream/chained interrupt in the
hierarchy.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/soc/fsl/qe/qe_ports_ic.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
index d022aa224f6d..718703dab024 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -19,7 +19,7 @@
 struct qepic_data {
 	void __iomem *reg;
 	struct irq_domain *host;
-	int irq;
+	int parent_irq;
 	struct irq_chip_generic *gc;
 };
 
@@ -111,7 +111,7 @@ static int qepic_domain_init(struct irq_domain *d)
 {
 	struct qepic_data *data = d->host_data;
 
-	irq_set_chained_handler_and_data(data->irq, qepic_cascade, data);
+	irq_set_chained_handler_and_data(data->parent_irq, qepic_cascade, data);
 
 	return 0;
 }
@@ -120,7 +120,7 @@ static void qepic_domain_exit(struct irq_domain *d)
 {
 	struct qepic_data *data = d->host_data;
 
-	irq_set_chained_handler_and_data(data->irq, NULL, NULL);
+	irq_set_chained_handler_and_data(data->parent_irq, NULL, NULL);
 }
 
 static int qepic_probe(struct platform_device *pdev)
@@ -154,9 +154,9 @@ static int qepic_probe(struct platform_device *pdev)
 	if (IS_ERR(data->reg))
 		return PTR_ERR(data->reg);
 
-	data->irq = platform_get_irq(pdev, 0);
-	if (data->irq < 0)
-		return data->irq;
+	data->parent_irq = platform_get_irq(pdev, 0);
+	if (data->parent_irq < 0)
+		return data->parent_irq;
 
 	data->host = devm_irq_domain_instantiate(dev, &d_info);
 	if (IS_ERR(data->host))

-- 
2.55.0


