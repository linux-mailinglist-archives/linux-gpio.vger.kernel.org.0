Return-Path: <linux-gpio+bounces-39409-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oz+JAAe6R2oFeQAAu9opvQ
	(envelope-from <linux-gpio+bounces-39409-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 15:32:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEC1702E77
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 15:32:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=G8KQcMnf;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39409-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39409-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07B4A30506A7
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 13:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A9C3D9548;
	Fri,  3 Jul 2026 13:30:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B1B3D953B;
	Fri,  3 Jul 2026 13:30:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783085446; cv=none; b=lZ4kSr+37SmPfuW9Jpkp/mjqJ1stxo8LvGWZPIyp6a+R3oczXbtnzfe1BjOrTL0mhzPoLT36p/3IhXc8nXrf2jKkKmYmWMooz2O0GLzrkle2zIELmTWA/f8XcWORo3F3NOzqfOWn8kkJZL6MKuonmnipjEwMKucpc9rVDFSYSfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783085446; c=relaxed/simple;
	bh=d9GunKd8m7L9v6kr11X2z55lp5pdUtS6kYCuy9Mzz3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J9we0N6BTEbQAg4Wrytp9vSlbQfqYK+GYXD2EGKvkTwwKa/WsUf4tm1sXoNc+o7xqJJiG5nPCRF+7ymdvNXwb8rFH1TRXHouIjB6wuOaUdOYdJUwjTic9CUlvUwxuD4SG4RZ+sKFzyfjxUSleQU4/feDzdjS9agr8VZMoKNnO80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=G8KQcMnf; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2BDEA4E40C6D;
	Fri,  3 Jul 2026 13:30:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0134160300;
	Fri,  3 Jul 2026 13:30:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A4CC6104C956C;
	Fri,  3 Jul 2026 15:30:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783085439; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1oefoDKc99jkDXFZ2F7f0RgFb3hTkk3t4ZLcXBYIg34=;
	b=G8KQcMnfA97uJv1/eCDL6gH5IJ+vm4EPXOagsotJwMTR8oFIuKQVSqeAQabajojEBOfO7b
	EG6Ai4UrKdvo/lWnemKKYKr2lDtsJqp9vuCs5MmQolpxyXe6VD18Q/7ieOSK/x3tHSCjOK
	fIWjh7AQkkrXrWHgGcycvuKv9NpJCgCqSyk08REr4s+G7rREldOvO2X8Pe89oRxXhDMYvj
	wFPm6CwPrZLq88t0zeS6huzkV3f/U8Ct9V29MC/htJcd9I2Y8EV5ngyNPmjG5vphXt5QhB
	0ydHTI5lm6L0upADw+4GjQmD5mE93pXSzfyi+IDS1Gcd5tci6mXX+3Hz5pfZeg==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Fri, 03 Jul 2026 15:30:14 +0200
Subject: [PATCH 06/12] soc: fsl: qe: Iterate over all pending interrupts in
 cascade handler
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qe-pic-gpios-v1-6-6c3e706e27dc@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783085423; l=1694;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=d9GunKd8m7L9v6kr11X2z55lp5pdUtS6kYCuy9Mzz3U=;
 b=nGB9C+Ncr3tcfR6k3rWU9qZiyRkLg+NUYBUuOA/C44U+SvIww5Y7/csAreOLgStzScc0eoVL5
 Rl1ffD4IbTMA+i9IIjd417wirii40xmTivqc9LO03NpXTjZM++mNBRk
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39409-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:from_mime,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,csgroup.eu:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AEC1702E77

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
index 3bca116fd2f5..27b62f4e3afb 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2025 Christophe Leroy CS GROUP France (christophe.leroy@csgroup.eu)
  */
 
+#include <linux/bitops.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
@@ -67,25 +68,17 @@ static struct irq_chip qepic = {
 	.irq_set_type = qepic_set_type,
 };
 
-static int qepic_get_irq(struct irq_desc *desc)
-{
-	struct qepic_data *data = irq_desc_get_handler_data(desc);
-	u32 event = in_be32(data->reg + CEPIER);
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
+	event = in_be32(data->reg + CEPIER);
+	for_each_set_bit(bit, &event, 32)
+		generic_handle_domain_irq(data->host, 32 - bit);
 
 	chained_irq_exit(chip, desc);
 }

-- 
2.55.0


