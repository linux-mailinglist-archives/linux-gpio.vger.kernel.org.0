Return-Path: <linux-gpio+bounces-39645-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id clA+Gk4kTmrkDwIAu9opvQ
	(envelope-from <linux-gpio+bounces-39645-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 12:19:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA487242E5
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 12:19:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=SVXDAfn7;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39645-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39645-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D6EE43087B91
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 10:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD1D405C3B;
	Wed,  8 Jul 2026 10:15:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D123A6F1A;
	Wed,  8 Jul 2026 10:15:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505755; cv=none; b=qhXtJNcEr9FaOQP8MwLm6IIe20/UgHdj7elZ/VYyPG7v1ajBdsg6ldtf8Je5yhMdyA2hogiY0jdmPK1IhEPbRyV6MCDIo3ufvwah/lMtfL7ftrgwma1ATIIs8u5JdTg27YrkYc/ECJ5jOGdCGTEtKNpgpunR/hlT3atJPwTUVtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505755; c=relaxed/simple;
	bh=ZEM3vY/Rvni5vUWyO125mYZA67WdP+10qWiVEiSpxQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=arq8Uc9mHnPYAoL0DYdUvANuckU+ZrobzHQGkzxL9yhBL8OnOUYYCp9dquOJ7gwXY2/wy2YoWOn2oCaIvzzA6T4Bu3hyxNReVW+D5mz2eG5eSVy6e7Jy1GGJVwQsRrOTq2URqE3RzZtcoI/xWQJpqSv0hAevED39aO55zzaKSkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SVXDAfn7; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C23964E40CF2;
	Wed,  8 Jul 2026 10:15:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7B6B960337;
	Wed,  8 Jul 2026 10:15:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C983B11BC3442;
	Wed,  8 Jul 2026 12:15:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783505751; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vK9K/mrLB76x5uzU5c0TcceENMmOeXyS0wuuRlEv6io=;
	b=SVXDAfn7LdRk2SSamjgET8HABd/s1b80AQUUWICbOH38NBWiFzzKEFb2BWVMlzq7xvL+Vo
	UehsT6u0NEaPTvZmj72yc9b4DoR05MoKOi1JLyjoAFRJU9scLwM7Kxhgl/KhWcuXq44sXm
	6I7uirW+qH6aecJwiYX1xrTj63/PwyQGhKV+tzQTDyCiNdRTtuXgSf30fBJYWJzfjZ8BeF
	D5ur0Z7qost66nNRmWwWxwv6PbRM4ywA4XzSK1OhdVVeJSmR4t4Dr8c8cgNMI47awdJJtC
	Xu9lD5bjzAz4ZhbVl8Cr5vEs3F2n4u4OyDSy7+I6CuEk18Gl0x6GA+m7idgp5A==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Wed, 08 Jul 2026 12:15:15 +0200
Subject: [PATCH v2 02/10] dt-bindings: soc: fsl: qe: Set #interrupt-cells
 to 2 to support interrupt type encoding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-qe-pic-gpios-v2-2-1972044cfbd1@bootlin.com>
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
 Herve Codina <herve.codina@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783505738; l=1330;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=ZEM3vY/Rvni5vUWyO125mYZA67WdP+10qWiVEiSpxQ0=;
 b=oblis8PGfDPelQNzHShpnx1O5nbtJdaQ4wl6aqrmAbUO6DPeEoXYQulxvpdHTKaACO7exVse+
 3PvGSviY4A8BR0Iw1bv6Ad4rRllIJP4ofY/+VB2T2B6QM0aFQuoVbOi
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
	TAGGED_FROM(0.00)[bounces-39645-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[nxp.com,kernel.org,linux.ibm.com,ellerman.id.au,gmail.com];
	FORGED_SENDER(0.00)[paul.louvel@bootlin.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:qiang.zhao@nxp.com,m:chleroy@kernel.org,m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:paul.louvel@bootlin.com,m:herve.codina@bootlin.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:from_mime,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1AA487242E5

The QUICC Engine port interrupt controller can be configured to generate
an interrupt on either a high-to-low transition or any change in the
signal state on the related GPIOs.

Update the #interrupt-cells property to 2 so consumers can encode
interrupt level information.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


