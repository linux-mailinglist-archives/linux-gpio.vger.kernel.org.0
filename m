Return-Path: <linux-gpio+bounces-39411-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nN5xJ2K6R2o/eQAAu9opvQ
	(envelope-from <linux-gpio+bounces-39411-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 15:34:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A172702EBA
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 15:34:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=SXF3aul5;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39411-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39411-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D06FD300E163
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 13:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A95F3DB960;
	Fri,  3 Jul 2026 13:30:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD003D953B
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 13:30:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783085453; cv=none; b=IjANfTEHJ5BGY/ecmNl8lfi5vI1KusgrjmOZjnGb/U2SDHlCsXEOGfI87l1g1eqC60B77QY/ED7OTBXDCxwswYoiSzO+fo5x8eD5BikVruRTx3HIRWJNznS2U2oq+qpJKmL8bb/pomqbetxDQXPqeQg2vAchMRjd1MeiUgc+mHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783085453; c=relaxed/simple;
	bh=Q1LU98vM9HHOAM5h2e8fS0MJIEHJs/m4IozHvGGHGHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EdY4l7kXyClna/bH9KTBLIUERJIFToRgWsD1iXhfwMT0GwtOf9jiyTBgsjTTQI6Ea7WD7yyrRVXTnIo2RlUH/RjoxsK5Tvhwd9ZKBGzvjQkdatNQn1wbM4rz00/TGFdYoSZSTZlJXaamr4zLhucCHO/Gdl4lc9x43ZXMMUKCkGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SXF3aul5; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6F35C4E40C72;
	Fri,  3 Jul 2026 13:30:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3DD5560300;
	Fri,  3 Jul 2026 13:30:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DDC72104C95AA;
	Fri,  3 Jul 2026 15:30:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783085447; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XVGgD3fb+eKy4BrLSrfxqR3z72o1xfjS9b0bDJoQno0=;
	b=SXF3aul57hCaFh0VwEkkDSj/4nrSy/i+RyZiUelCBbEO0WRhxrx+wugPe+O262Q2RWPryr
	01Eiw2vI4D/H3JB+8zNIL8FqyLZBEpO4/3liT+fx6v7WXY3gMAbltcVDycJRIPQTdr9XYH
	XFWLhhvSZ4fS/9qRWpaeMc+CNki8if6Ye5TOHvpe2uHyU91dLmlfIBslkemMLn9mCgeY7+
	65kQO32lqKDNuVFd3MmtqUeLMn8ybqiC0BL3poSdGzag7F8TcFFQxEeVJZOyRvUmr2jcjp
	si/yh8hhQrTg0pIwce3HfF6eSOHmv4Frt6TZPw3ppPswb92XhaNILGjHOc1x/g==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Fri, 03 Jul 2026 15:30:18 +0200
Subject: [PATCH 10/12] soc: fsl: qe: Rename host member to domain in struct
 qepic_data
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qe-pic-gpios-v1-10-6c3e706e27dc@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783085423; l=1508;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=Q1LU98vM9HHOAM5h2e8fS0MJIEHJs/m4IozHvGGHGHk=;
 b=3ByUpPIH3v8ySIFn0+aNMFaKPQFIWVsopDzpFPZIneWR1GFcygDi4tPD47xYf/IimB0uOiwhP
 8Xx53Iyu7rDBu4rrgnyFLfvF61fEsYOCObL3lJRFukRrLA7p86s6HlX
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39411-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:from_mime,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A172702EBA

Rename the host field to domain to match the common kernel naming
convention for irq_domain pointers.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/soc/fsl/qe/qe_ports_ic.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
index 718703dab024..1bf2af087b78 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -18,8 +18,8 @@
 
 struct qepic_data {
 	void __iomem *reg;
-	struct irq_domain *host;
 	int parent_irq;
+	struct irq_domain *domain;
 	struct irq_chip_generic *gc;
 };
 
@@ -85,7 +85,7 @@ static void qepic_cascade(struct irq_desc *desc)
 	}
 
 	for_each_set_bit(bit, &event, 32)
-		generic_handle_domain_irq(data->host, 32 - bit);
+		generic_handle_domain_irq(data->domain, 32 - bit);
 
 out:
 	chained_irq_exit(chip, desc);
@@ -158,11 +158,11 @@ static int qepic_probe(struct platform_device *pdev)
 	if (data->parent_irq < 0)
 		return data->parent_irq;
 
-	data->host = devm_irq_domain_instantiate(dev, &d_info);
-	if (IS_ERR(data->host))
-		return PTR_ERR(data->host);
+	data->domain = devm_irq_domain_instantiate(dev, &d_info);
+	if (IS_ERR(data->domain))
+		return PTR_ERR(data->domain);
 
-	data->gc = irq_get_domain_generic_chip(data->host, 0);
+	data->gc = irq_get_domain_generic_chip(data->domain, 0);
 	if (!data->gc)
 		return -ENODEV;
 	data->gc->reg_base = data->reg;

-- 
2.55.0


