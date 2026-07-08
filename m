Return-Path: <linux-gpio+bounces-39652-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f2gxLNMkTmoNEAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39652-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 12:22:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E55172436F
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 12:22:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=C2ttfkG7;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39652-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39652-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6B6EB30493DC
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 10:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC1D422540;
	Wed,  8 Jul 2026 10:16:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462AA3E3C50
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 10:16:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505773; cv=none; b=CbuKK/kdyor2U6nJ1qu9PjT2Wx7befBYSR44hhoeMd2AY7Qf2w8LijeBjVu9Od75orCc7GFjXsW9Y5mtVr25uXBp5cM6nBYTNtxMiR2RfEhpsJCkunu5qcRiK58qFIaKISNlOJX1uT/AeSFPxPRKC7qHq42CTyaWLgAhGm+UAe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505773; c=relaxed/simple;
	bh=lg8pO2TtHb3jP6IOv7CUPg4uuEdOUB/AkCb+PKzxxEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M5mwbZasp2Y6+oQkoIYAz4pxz7gQ2+CpwyNqvUB/6+yHTQQZEMJfdE+1JfnGHVCrzheANSK1s14JZhtx21ezMc++xW4+Vk3iAfpoYhjOd59VDo61dtWnnH/Vgae72AZCbgjUTgBDHtcBbH1pj699W2X+i0m2RCzVewNTrx0DmTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=C2ttfkG7; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0CE371A0EDE;
	Wed,  8 Jul 2026 10:16:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D52A160337;
	Wed,  8 Jul 2026 10:16:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F165811BC3422;
	Wed,  8 Jul 2026 12:16:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783505768; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2D54DLwyp1FomyecUqBcQt3voMAAHcAPIOVYtACtMIY=;
	b=C2ttfkG7CQu+QwlKhKO8Jy8mmOO5slLHoPzfhlHogbTefzYwmRXBzRSo+BrzSAmSqyrWJR
	G/cf+3aotc/5GwBrkT/7NtWu3Lpu0DcFqFrEoafdWidU8LMlwElD72mAnc1IHvpAX3a6pr
	qxmsmfSMCxsgGVcmY3jjR/y62yQczTURLd3Ctr6RlwNWr9k3GKXSaZgvLdESb2m4FopGBI
	ePG7/l2nZSQYgdpIcZ1/bgKWVosgvqpLWdsBk73Ok4wp7UL8K0jAlgKB2AEMQJGbGQqkwl
	R8zQMjs7PfUwYgpj98uBgJjmgDnngitJYzjUscI2aENsneBuchowX4FqiDhwbw==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Wed, 08 Jul 2026 12:15:22 +0200
Subject: [PATCH v2 09/10] soc: fsl: qe: Rename irq variable to parent_irq
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-qe-pic-gpios-v2-9-1972044cfbd1@bootlin.com>
References: <20260708-qe-pic-gpios-v2-0-1972044cfbd1@bootlin.com>
In-Reply-To: <20260708-qe-pic-gpios-v2-0-1972044cfbd1@bootlin.com>
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
 Herve Codina <herve.codina@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783505738; l=1688;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=lg8pO2TtHb3jP6IOv7CUPg4uuEdOUB/AkCb+PKzxxEo=;
 b=8Gi3R+3l/3Km+4n/8HNw4vV2u2JZvzUjJIXrzPPYx5pm9Y0Ay81LIakl3dqT2jK6OvHk3ua8B
 zoC/7XHYaHfDLNoJmyi5xnIIBRuR6IRLZfntTDNkBdkr998zxLmUy4U
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39652-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[nxp.com,kernel.org,linux.ibm.com,ellerman.id.au,gmail.com];
	FORGED_SENDER(0.00)[paul.louvel@bootlin.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:qiang.zhao@nxp.com,m:chleroy@kernel.org,m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:paul.louvel@bootlin.com,m:herve.codina@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bootlin.com:from_mime,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E55172436F

Rename the local variable holding the platform IRQ to parent_irq, which
better describes its role as the upstream/chained interrupt in the
hierarchy.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/soc/fsl/qe/qe_ports_ic.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
index 4f6b75439f9f..7375f92f528b 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -18,7 +18,7 @@
 
 struct qepic_data {
 	void __iomem *reg;
-	int irq;
+	int parent_irq;
 };
 
 static void qepic_mask(struct irq_data *d)
@@ -117,7 +117,7 @@ static int qepic_domain_init(struct irq_domain *d)
 {
 	struct qepic_data *data = d->host_data;
 
-	irq_set_chained_handler_and_data(data->irq, qepic_cascade, d);
+	irq_set_chained_handler_and_data(data->parent_irq, qepic_cascade, d);
 
 	return 0;
 }
@@ -126,7 +126,7 @@ static void qepic_domain_exit(struct irq_domain *d)
 {
 	struct qepic_data *data = d->host_data;
 
-	irq_set_chained_handler_and_data(data->irq, NULL, NULL);
+	irq_set_chained_handler_and_data(data->parent_irq, NULL, NULL);
 }
 
 static int qepic_probe(struct platform_device *pdev)
@@ -161,9 +161,9 @@ static int qepic_probe(struct platform_device *pdev)
 	if (IS_ERR(data->reg))
 		return PTR_ERR(data->reg);
 
-	data->irq = platform_get_irq(pdev, 0);
-	if (data->irq < 0)
-		return data->irq;
+	data->parent_irq = platform_get_irq(pdev, 0);
+	if (data->parent_irq < 0)
+		return data->parent_irq;
 
 	domain = devm_irq_domain_instantiate(dev, &d_info);
 	if (IS_ERR(domain))

-- 
2.55.0


