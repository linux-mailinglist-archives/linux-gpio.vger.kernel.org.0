Return-Path: <linux-gpio+bounces-39649-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EOqaF54kTmr4DwIAu9opvQ
	(envelope-from <linux-gpio+bounces-39649-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 12:21:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E3E724325
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 12:21:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=DSEs8fMD;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39649-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39649-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DBFA430A870F
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 10:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0AC7420E87;
	Wed,  8 Jul 2026 10:16:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FEE3BFE3E;
	Wed,  8 Jul 2026 10:16:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505765; cv=none; b=CnooBFK/3HnOFWphUAMFc1RPzOVvxNCtS6j8pIIcAmmXns0NnYKQ1ZDkL/taqGclj7eDNH8xC1vNe+IN5ooCcRCK8N7k8gqf3zlR6WrvGbb3F6ScM8nVTD4lZta544egK5CLqjzLA+1VhvWTPJ3K7fG32hMIwdgppxa8KH4b3qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505765; c=relaxed/simple;
	bh=r3vHDvUHA4dsL1TckJnFW5O/nSaMdIgcvEIKqUzCiFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CIGlfa3E1fK4gKckZvzZ044mSjLqGcCG89Nt3dA5zWT67DcXMfg8MW9/6bsUy1hS86qT89MHv+aL24AFA+rR6X41mUtlH3p7SmbvyyD3RSLN7FYnm9ekJ4Tyh41v0qvYzZjGwqdyQtzwa5TgdYjpv6JcZaEnnpAPYlXIRYG1TDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DSEs8fMD; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2A1554E40CF7;
	Wed,  8 Jul 2026 10:16:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C490460337;
	Wed,  8 Jul 2026 10:16:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EC20211BC3441;
	Wed,  8 Jul 2026 12:15:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783505761; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QVQjk372EQ/aOAJi0x59NYkNGigxMXbij6zxAURUnhQ=;
	b=DSEs8fMDeP/WWEwk61m/T0e2qmm05KRT/+q28FATN+T+VD72LPiZllhnFvh/Hw7THfdTne
	N8qV6xtalmc7fdkli0jgAQJ6vcnr2R2ccsJNEZSmAOksCpBrcoaldsxV+Xn2ta2V24f4HF
	LcULpT+XNrPsc3YNuKuFRG2Bn6Hh5HZ9j7J1kSSjPLUSafW2piDsdhBqbMzx/YGIbEHGEj
	u4Svt65rNegyALp8PfWf/w4poWF+cjBFHtFUpd3u9h9UCO5+S7mkbWoLUAEjIMagxHZ3SS
	KxCnkLXaVNbzkHxXFkNJZYEgre+S1M/642bIGdOuNTWBeczmxr0sbrqapY1UBA==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Wed, 08 Jul 2026 12:15:19 +0200
Subject: [PATCH v2 06/10] soc: fsl: qe: Iterate over all pending interrupts
 in cascade handler
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-qe-pic-gpios-v2-6-1972044cfbd1@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783505738; l=1700;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=r3vHDvUHA4dsL1TckJnFW5O/nSaMdIgcvEIKqUzCiFU=;
 b=ABpT7RMI/xBzLmktdMmKXMO8zvzIO82law6Twa+KbFNhxcTIjcjZuEkcgCDCJ8oAn/2GgsYMV
 MGbI0UFWhEeDmThOPn8z2KSed9MI3EtbSACz1kkITb0/AbrbQPX6PH5
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39649-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,csgroup.eu:email,bootlin.com:from_mime,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 12E3E724325

Instead of only servicing a single interrupt, the chained handler can
handle all IRQs that have their bit set in the event register.
This avoid multiple parent IRQ handler being serviced if more than one
interrupt are pending on the QE PIC.

Remove unused code.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/soc/fsl/qe/qe_ports_ic.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
index c8fff45e353c..bc8b68e5d1a9 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2025 Christophe Leroy CS GROUP France (christophe.leroy@csgroup.eu)
  */
 
+#include <linux/bitops.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
@@ -70,25 +71,17 @@ static struct irq_chip qepic = {
 	.irq_set_type = qepic_set_type,
 };
 
-static int qepic_get_irq(struct irq_desc *desc)
-{
-	struct qepic_data *data = irq_desc_get_handler_data(desc);
-	u32 event = ioread32be(data->reg + CEPIER);
-
-	if (!event)
-		return -1;
-
-	return 32 - ffs(event);
-}
-
 static void qepic_cascade(struct irq_desc *desc)
 {
 	struct qepic_data *data = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned long event, bit;
 
 	chained_irq_enter(chip, desc);
 
-	generic_handle_domain_irq(data->host, qepic_get_irq(desc));
+	event = ioread32be(data->reg + CEPIER);
+	for_each_set_bit(bit, &event, 32)
+		generic_handle_domain_irq(data->host, 31 - bit);
 
 	chained_irq_exit(chip, desc);
 }

-- 
2.55.0


