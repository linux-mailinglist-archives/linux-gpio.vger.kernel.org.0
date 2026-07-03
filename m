Return-Path: <linux-gpio+bounces-39414-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SiNTJnW7R2p+eQAAu9opvQ
	(envelope-from <linux-gpio+bounces-39414-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 15:39:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE87E702F56
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 15:39:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=TPFDubIO;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39414-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39414-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1AF430557CB
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 13:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6A93D9678;
	Fri,  3 Jul 2026 13:30:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96F63DA7DD;
	Fri,  3 Jul 2026 13:30:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783085456; cv=none; b=u9gJzcmavaUDfEsHn/HMoh5tMS3SYEAjUlOAkhEQhVb+V/9iZWy7UroTg8BdU86bDZ0Vdias6x3s4gGHLlFvz9u8JUKH8MgSCnKWX+w/ML5CAwjNaHWQTzSKHAS1G7XFfuF2XaQgnU5Shbm8+OMeZ1gFFFSQIlbFJnDh7FZF5mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783085456; c=relaxed/simple;
	bh=lV6ixfVQUU+h5OFc6ks1zgWp1h40IUo5QKv+Bi6rpy4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gfZl+xefdHiAMwQr4LcLjnSYDO0epryaNitRLcp4c5n7RvnLZpr5UTNK/Z6xB9DcLp9TcSzJxQ0i1kk/cNURXZvuWXdl+vrOgmpwbb2lMDZ3Bm+7EVjib2V4nIJwXJjH64n0mZb8jAdiDZXL5NJd9uEccRghKTcq9HdSegKwGWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TPFDubIO; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 01BD11A0E2D;
	Fri,  3 Jul 2026 13:30:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CB6FA60300;
	Fri,  3 Jul 2026 13:30:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A2806104C95AB;
	Fri,  3 Jul 2026 15:30:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783085448; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DYiPuRvE6Nwnxm1ayjjfGRCixDjRGX9XFfBMaqcehNo=;
	b=TPFDubIOOd12n77ZxYKru+sNA7xfghnI7Q5u0bwp4fAQxtAEOXWdCwOjBuUJ6H/lVmev8p
	At01ZX3W66RGbqXG6frB42AukdRbTiqgf9Ne3YC5tw1lFV81K1EcbqbimuX1VgsLsFsJWn
	RgL3pNdq/GHpFeAJ7uzls9MGOI5yNN76s/TXzF09XOf0LcnI4uvnQqgvmkfrEwZXtNhtng
	F9iI2hXF9H/6d6dtDGHA1MZRs9g1pnlYftrTHfaN8Tm4mLwIG1GTtftPFd6+jRiN/ninp7
	+/TeZllHOaEtIknkmkI0euNQrkn31XiYid5PZ4uVeX2/UaR7O6aPY0+apyckgA==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Fri, 03 Jul 2026 15:30:19 +0200
Subject: [PATCH 11/12] soc: fsl: qe: Remove useless struct member
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qe-pic-gpios-v1-11-6c3e706e27dc@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783085423; l=1530;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=lV6ixfVQUU+h5OFc6ks1zgWp1h40IUo5QKv+Bi6rpy4=;
 b=GTd53N1L6mieV9LlVEep06QMzjN/ESane6rFL5nBaGQzPhkH7cvOjjXeGy3noJBEpv8mlEyJD
 09JzWIAKFqZATFJ0g3rY981zqaR5bWzMCKPO8dxQ09la/CBBR6EG1Kf
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39414-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:from_mime,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE87E702F56

The reg member from the struct qepic_data is no longer needed, since it
is now embedded in reg_base of struct irq_chip_generic. Remove it.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/soc/fsl/qe/qe_ports_ic.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
index 1bf2af087b78..6cf23a721ff3 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -17,7 +17,6 @@
 #define CEPICR		0x14
 
 struct qepic_data {
-	void __iomem *reg;
 	int parent_irq;
 	struct irq_domain *domain;
 	struct irq_chip_generic *gc;
@@ -144,15 +143,16 @@ static int qepic_probe(struct platform_device *pdev)
 	};
 	struct device *dev = &pdev->dev;
 	struct qepic_data *data;
+	void __iomem *reg;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 	d_info.host_data = data;
 
-	data->reg = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(data->reg))
-		return PTR_ERR(data->reg);
+	reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
 
 	data->parent_irq = platform_get_irq(pdev, 0);
 	if (data->parent_irq < 0)
@@ -165,7 +165,7 @@ static int qepic_probe(struct platform_device *pdev)
 	data->gc = irq_get_domain_generic_chip(data->domain, 0);
 	if (!data->gc)
 		return -ENODEV;
-	data->gc->reg_base = data->reg;
+	data->gc->reg_base = reg;
 
 	return 0;
 }

-- 
2.55.0


