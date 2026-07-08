Return-Path: <linux-gpio+bounces-39653-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DsZgCrQlTmpsEAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39653-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 12:25:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C22724487
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 12:25:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=zaicWlvS;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39653-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39653-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42494315DC24
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 10:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4704D421EFD;
	Wed,  8 Jul 2026 10:16:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEDC38B7C3
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 10:16:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505776; cv=none; b=dMVpD1zN06gaX5izx0EMDNYCyVr1XDvdaI7RoC1XQyvQeweZGvI8JQaJKAZWL+ryoLartu+F4rHIUNW7l5ktnbR4lfxgTrWblrWtbKgBjvDN8LQMgIIs+JDe9xm/vVJkiGQhJCpYvAxkFNFBtl+PluDyIZuSwhqylHYhqb8JDEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505776; c=relaxed/simple;
	bh=uU4iuMohvv17IiIgOuFnj9w2k+ZovOe5eFIHeMSDjt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R+137pc6VDrclM6mj6TTZbFY4lq+bExRvOHLzWfft+1xRMmNcpwLhW6y2azUVZwxiGfYAKdtuZAKj6el+GySMHFYuCBLLQOmNPAv80e5d2gBCDtzFQCEy95CTnJrpBJIcfwTVXWUY0F8GTlGlZcCs29O46ZdTANwEmXlBb04570=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zaicWlvS; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 95C691A0EDC;
	Wed,  8 Jul 2026 10:16:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 62F1A60337;
	Wed,  8 Jul 2026 10:16:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E1FF11BC3442;
	Wed,  8 Jul 2026 12:16:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783505772; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=n9bPyS/0uNi6wXJqgrGX5cVcsYuuWD9wtysaxkT+Dt4=;
	b=zaicWlvSnJ8KaBt2L3nIl6XSz2ynYRpyDz3pmG3CzCaCyM/Tww6m7GGulF4nWE64cWdbXC
	3bH8svQman3+sIlahuSZhWXrGMOFEKDPGqF2QjFb36JARhjDyLldiNnHAQd1xmr1GVPNuu
	6DCB6entbZIOGH7sXnljsiI/VdLuilBc1EZehSj4Ngmu1h7fbKGhEtbfFH1EIzo67uiIzG
	p5HvcnBYLT4i9Dv9fISCE4R5i9F8WVnWwqK/S+NWUs4k+GCAYDP3SBfnz3i7cAU6EXIlfS
	/4+iWAahrr/33ONRABTFvDK7BpeiYWqXyJE3Lv+eoa4nNIt0Ff9/vkV2FLpKQg==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Wed, 08 Jul 2026 12:15:23 +0200
Subject: [PATCH v2 10/10] soc: fsl: qe: Add support of IRQs in QE GPIO
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-qe-pic-gpios-v2-10-1972044cfbd1@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783505738; l=2410;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=uU4iuMohvv17IiIgOuFnj9w2k+ZovOe5eFIHeMSDjt4=;
 b=/DxI+WVs9+OZyT+vFropDWk4THWwrhFGWAHwsSAJ8i9eNw71s6vgOdatacAE9eNosgwjKitj0
 ILwZaxa6CxbA8hhMVzdimCjePID/pTjnSN5w2t2vMJldkgoJPziHcdY
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
	TAGGED_FROM(0.00)[bounces-39653-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oirq.np:url,bootlin.com:from_mime,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94C22724487

Some QE GPIO pins have an associated interrupt line in the QE PIC to
signal state changes on the pin.

Because the GPIO controller does not perform any interrupt handling
itself, a nexus node (interrupt-map) is used to map each GPIO line
supporting IRQ to the parent QE PIC interrupt domain.

Add the to_irq() method in the corresponding GPIO controller driver,
that uses the nexus node to perform the translation.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/soc/fsl/qe/gpio.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 66828f2a3577..f8919642f40d 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -16,6 +16,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/slab.h>
 #include <linux/export.h>
+#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 
 #include <soc/fsl/qe/qe.h>
@@ -23,6 +24,7 @@
 #define PIN_MASK(gpio) (1UL << (QE_PIO_PINS - 1 - (gpio)))
 
 struct qe_gpio_chip {
+	struct device_node *np;
 	struct gpio_chip gc;
 	void __iomem *regs;
 	spinlock_t lock;
@@ -135,6 +137,29 @@ static int qe_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	return 0;
 }
 
+static int qe_gpio_to_irq(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
+	struct of_phandle_args oirq;
+	struct irq_domain *domain;
+	int ret;
+
+	oirq.np = qe_gc->np;
+	oirq.args_count = 2;
+	oirq.args[0] = gpio;
+	oirq.args[1] = 0;
+
+	ret = of_irq_parse_raw(NULL, &oirq);
+	if (ret)
+		return ret;
+
+	domain = irq_find_host(oirq.np);
+	if (!domain)
+		return -EPROBE_DEFER;
+
+	return irq_create_of_mapping(&oirq);
+}
+
 struct qe_pin {
 	/*
 	 * The qe_gpio_chip name is unfortunate, we should change that to
@@ -299,7 +324,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 	qe_gc = devm_kzalloc(dev, sizeof(*qe_gc), GFP_KERNEL);
 	if (!qe_gc)
 		return -ENOMEM;
-
+	qe_gc->np = np;
 	spin_lock_init(&qe_gc->lock);
 
 	gc = &qe_gc->gc;
@@ -311,6 +336,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 	gc->get = qe_gpio_get;
 	gc->set = qe_gpio_set;
 	gc->set_multiple = qe_gpio_set_multiple;
+	gc->to_irq = qe_gpio_to_irq;
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
 

-- 
2.55.0


