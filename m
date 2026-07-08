Return-Path: <linux-gpio+bounces-39647-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jo86GakmTmq1EAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39647-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 12:30:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCCF72456D
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 12:30:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=kGMh6oVs;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39647-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39647-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F366B314AF7D
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 10:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA895416D12;
	Wed,  8 Jul 2026 10:16:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3D9395AEE
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 10:15:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505760; cv=none; b=SMBO0h9AUPaZlT4x6Zz46TY+l0Fj9thbYJ0BWitSdqdM5XUXS2WBzWRW8OEvA1T7YLK9l3tosVWo2sOv+NqFJ0q7IPGdwns+v77bvu4f4bu2EqUQ9gIUsXSwEz1ZLcr3bAt7vGYW2H+Qk1/AEOSLjQVSQhhMvoinmXNrIuIzZ8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505760; c=relaxed/simple;
	bh=DXzRspf6ZI8lMhz8y8ptUUL+MANU3WgrG0e6AbqI2G0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aCYQo2LUMIA5JJXB6qNDLvxCEm+tYsZVGiLfbOBAc7oqL5hanw1Oenj8zrp8KZeFH8cEy/ASzngrC6dTQ3TCqel2gbCiMbx/Y9ismkdJKZ1PJMF2ggtWUQV7RlztyB50g3/bM3C9kAZzCOKbG6IB8lKG0x0ahZBxGSrSQZeSEKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kGMh6oVs; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D0FA34E40CF2;
	Wed,  8 Jul 2026 10:15:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95C0360337;
	Wed,  8 Jul 2026 10:15:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2654A11BC3441;
	Wed,  8 Jul 2026 12:15:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783505756; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=l421AJzNoZ/8d4zrVEG3NJ6ngSRBxoXdW4wIVrCayIg=;
	b=kGMh6oVszdIL8ZmOiaG6EhdeLsnl4mPpd6rq930p9ZNleIkHrAgYI1YtaOf7WFeKDKFRHb
	NyQz4EZunNE33lRCktmFN6jMFo+bk7Og3I1Ld0e7Fj14ObHHUaoQhTG1JYZZ7Z9B1BgBCd
	lopgbxsz758BpobJd3LbNA/QXKzrCQbEsHXEu5ZIP/z4fFfZlUx4zJ8vJpwv/lZb+QrKxb
	4oyoIkdGjSxc/7X+U6ZbyaRVyFRVh7fqCCOB0GW3CfcBckjfIJL93Mg8XVnuCB+JUaTJLT
	Yu93+hk/TED2FSVTKMY8zEvWE48QXtNVjsycKdPGocJ0GWDXlOPdGHGdo/QGww==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Wed, 08 Jul 2026 12:15:17 +0200
Subject: [PATCH v2 04/10] dt-bindings: soc: fsl: qe: Add support of IRQ in
 QE GPIO
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-qe-pic-gpios-v2-4-1972044cfbd1@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783505738; l=3392;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=DXzRspf6ZI8lMhz8y8ptUUL+MANU3WgrG0e6AbqI2G0=;
 b=o+41FxZCX1nWEkemW4T4DWPopS4yskNGZ/HGQGoq5Tx3HdVVJgQ5QrZ6oxTKD1/xCuEbCVXpd
 XtpfTeBeTtoAANPHFAM0i+9WfwLolsl4KVYpBZfSIG9yGfTqimRG4fk
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
	TAGGED_FROM(0.00)[bounces-39647-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:from_mime,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCCCF72456D

Some QE GPIO pins have an associated interrupt line in the QE PIC to
signal state changes on the pin.  Add the corresponding
interrupt-controller / nexus properties to the QE GPIO binding.

Because the GPIO controller does not perform any interrupt handling
itself, a nexus node (interrupt-map) is used to map each GPIO line
supporting IRQ to the parent QE PIC interrupt domain.

As the QE PIC can be configured to generate an interrupt on either a
high-to-low transition or any change in signal state, three
interrupt-map entries are needed per GPIO pin that can yield an
interrupt (falling, both, and the "none" case which defaults to both in
QE PIC).  This overhead is necessary because the interrupt-map-pass-thru
property is not part of the DT specification.

The interrupt-map property is optional: it is not required for GPIO
banks that have no interrupt capable GPIO line (e.g. port D on MPC8323),
or when interrupt functionality is not used.

Update the example to show a scenario where each bank supports a
different numbers of IRQs, or no IRQs at all.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 .../bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml   | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
index 1af99339ff40..1d2ab44fcd3c 100644
--- a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
@@ -27,6 +27,17 @@ properties:
   "#gpio-cells":
     const: 2
 
+  "#address-cells":
+    const: 0
+
+  "#interrupt-cells":
+    const: 2
+
+  interrupt-map:
+    description: |
+      Specifies the mapping of GPIO lines to the parent interrupt controller, as the
+      GPIO controller does not do interrupt handling itself.
+
 required:
   - compatible
   - reg
@@ -37,9 +48,37 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
     gpio-controller@1400 {
         compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
         reg = <0x1400 0x18>;
         gpio-controller;
         #gpio-cells = <2>;
     };
+
+    gpio-controller@1418 {
+        compatible = "fsl,mpc8323-qe-pario-bank";
+        reg = <0x1418 0x18>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        #address-cells = <0>;
+        #interrupt-cells = <2>;
+        interrupt-map = <
+          7 IRQ_TYPE_EDGE_FALLING  &pic 4 IRQ_TYPE_EDGE_FALLING
+          7 IRQ_TYPE_EDGE_BOTH     &pic 4 IRQ_TYPE_EDGE_BOTH
+          7 0                      &pic 4 IRQ_TYPE_NONE
+
+          9 IRQ_TYPE_EDGE_FALLING  &pic 5 IRQ_TYPE_EDGE_FALLING
+          9 IRQ_TYPE_EDGE_BOTH     &pic 5 IRQ_TYPE_EDGE_BOTH
+          9 0                      &pic 5 IRQ_TYPE_NONE
+
+          25 IRQ_TYPE_EDGE_FALLING &pic 6 IRQ_TYPE_EDGE_FALLING
+          25 IRQ_TYPE_EDGE_BOTH    &pic 6 IRQ_TYPE_EDGE_BOTH
+          25 0                     &pic 6 IRQ_TYPE_NONE
+
+          27 IRQ_TYPE_EDGE_FALLING &pic 7 IRQ_TYPE_EDGE_FALLING
+          27 IRQ_TYPE_EDGE_BOTH    &pic 7 IRQ_TYPE_EDGE_BOTH
+          27 0                     &pic 7 IRQ_TYPE_NONE
+        >;
+    };

-- 
2.55.0


