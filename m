Return-Path: <linux-gpio+bounces-39405-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R2RONNC5R2rueAAAu9opvQ
	(envelope-from <linux-gpio+bounces-39405-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 15:32:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51832702E2B
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 15:32:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=pwiLMmfV;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39405-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39405-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CD13303F70A
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 13:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416113D9690;
	Fri,  3 Jul 2026 13:30:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5943D9524;
	Fri,  3 Jul 2026 13:30:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783085441; cv=none; b=WI3MbJhwUJSOODAaFTaZdjvo66KHkNVAqxmxwj6XZ8YHoRpDzlSkvR6g5NW6WMpMM92gCjZj5S3nyXzO/MZf0qqhVxns2E25f6iSL5nxZIe8lh7jHiXmpWNMbKjKzfYdkyxT2DS3+AKRihsAZbXN7HAfcTdHZ8mAprrlJiIJLfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783085441; c=relaxed/simple;
	bh=mjxqYKQt7RhbTH9annDerlVLtJg9QeVJe4wiCLif0v8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iv/7PilfQvECDNV317CzRi/hhMK5zwnnjo8sWoStX84GipbfI2AHh6NzRJ6k+la+XGhY2wF6QrXGjRXd2WRDevMHVqatbnaMBskwcmDcTPimJ9FVKdyJWSrzR7jwqg3nyT4eHdTjN81e3eDmSJ+NN+cerdPw4ByXy6p+VY2x16Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pwiLMmfV; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 27794C49F5A;
	Fri,  3 Jul 2026 13:30:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5649660300;
	Fri,  3 Jul 2026 13:30:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0084D104C956C;
	Fri,  3 Jul 2026 15:30:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783085432; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Cr2wW8ttzYiYLdwnRKCH/wUeHL21X2WlKudfchK028Q=;
	b=pwiLMmfVos4md1Bu88HcdBUVf5qGWEPp+EXtHImzJltQj0BpoqwYKCmceE7FafQ0zTpGgU
	RuteKSOENKSQYPJvGalREy3Ya5fh/Zfver6GQbNcJbqJak6n8epwiHZi8hm5YkhBR07s5b
	tbZgqqI/nXJti7tjbDr9s+azrKIbiwnDKnfAfUEbbWFE2Py9kAPRJtU9EXxngySdHjpE7B
	dUAYG+sAD3D3KJf/CQzkFGicPTFyh1V7uqzu8TgMrvVyTyCXWC8vklej9JB9bJAbCNEbiA
	7UHpvQTvyaFJb2enJrH3hmNYBPapgKWU8kCcmQ7n4kY6RnCgyuVTw5U41rOHuw==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Fri, 03 Jul 2026 15:30:10 +0200
Subject: [PATCH 02/12] dt-bindings: soc: fsl: qe: Set #interrupt-cells to 2
 to support interrupt type encoding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qe-pic-gpios-v1-2-6c3e706e27dc@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783085423; l=1260;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=mjxqYKQt7RhbTH9annDerlVLtJg9QeVJe4wiCLif0v8=;
 b=AozDGgL99UwYTEj6LEkXlQmiz0Gg/354Iorfp1Ozq7sd2NOOgNJG0V/EJkiVoY+kY2vSgZwWz
 QEjNjJuDVNRD3U3ovwqD8XZ3hbJjRW2RKXKdI2obGbokOJdO/DKYFCE
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
	TAGGED_FROM(0.00)[bounces-39405-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 51832702E2B

The QUICC Engine port interrupt controller can be configured to generate
an interrupt on either a high-to-low transition or any change in the
signal state on the related GPIOs.

Update the #interrupt-cells property to 2 so consumers can encode
interrupt level information.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 .../devicetree/bindings/interrupt-controller/fsl,qe-ports-ic.yaml     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,qe-ports-ic.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,qe-ports-ic.yaml
index 2b8e7b9c6d7a..2b7c6b4f0389 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/fsl,qe-ports-ic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,qe-ports-ic.yaml
@@ -23,7 +23,7 @@ properties:
     const: 0
 
   '#interrupt-cells':
-    const: 1
+    const: 2
 
   interrupts:
     maxItems: 1
@@ -45,7 +45,7 @@ examples:
       reg = <0xc00 0x18>;
       interrupt-controller;
       #address-cells = <0>;
-      #interrupt-cells = <1>;
+      #interrupt-cells = <2>;
       interrupts = <74 0x8>;
       interrupt-parent = <&ipic>;
     };

-- 
2.55.0


