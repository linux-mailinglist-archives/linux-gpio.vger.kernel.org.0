Return-Path: <linux-gpio+bounces-37580-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO7BOt3vFmrsxgcAu9opvQ
	(envelope-from <linux-gpio+bounces-37580-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 15:21:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F29245E4D35
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 15:21:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 094FA3119B86
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 13:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5D540B6E9;
	Wed, 27 May 2026 13:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3ML7YFu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1587540B6D2;
	Wed, 27 May 2026 13:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779887127; cv=none; b=sc4I9fbOQjzydR1pmFnyAe+smUryOyuo1ZmhksEgqiAZ5i0Pr3psse9XK5T0s3ixyMuf+yWKiec/m41CNRkYGq7pQ02wtuuu3zHHV4OZs8geGsZmWvFctFGgPzLME7s+1muMd7kKc3AlY60fugXaydUN3T7mE6GMVuY0HR2xU4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779887127; c=relaxed/simple;
	bh=0X0szkG5yLiMj09IJZBb45Om8c4jwNps5B8juTZM4wQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nSuPOQP6VOLtbhcSVVfczBrGT0jKfqzv49Pe2bSyYRXAnYeqNf86+eB+BA4DELFaVkqFgLtS5s417j3lHfh9mWoEOJzIkevoijDq+r6MHaeq+MmdNaiSOiLmx1RWMK1qkJAlWwfIRJOtUdDPUdSn1AD3AoTDwAmhrtDgP887kUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3ML7YFu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FED31F00A3C;
	Wed, 27 May 2026 13:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779887125;
	bh=vpmrGvI+S9mqjhJ6dDecf+d4FxN+jhtGetmts2ZTPoY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=P3ML7YFujcE1TmHDbPRTwHG1NpmQNeQtubntOuyO+9jWoAfnUu8zRM6H+hI0dWRhk
	 rxRKrub2GqeHBbqhiFgjCMvf11d5UR1FQuO+w268CfezPE34CPNYGOEMk9wY+05412
	 aFGQGYfRc06kTJoS05NJa9ADe4uBGiiS9LYRNd2/5tsJAYm/q4AueIJ8cVkHYOsU+z
	 DYBGGvNCzgZ4H+VwYjKaSw1a0b47/aLG0c1f31mXXhLu/TJEmDMWNWe6jgQgcrU+dW
	 DlRtRI+Aevqt22BisFaNQw6FmoKsPW+8Ir07hrmSc869vEGKX5VTBAA/gy6/+lDPsq
	 gyRU5MIxzSy/g==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 15:05:16 +0200
Subject: [PATCH v5 1/2] dt-bindings: mfd: wlf,arizona: Add irq-gpios
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-mfd-arizona-irq-v5-1-ebeda2e925da@kernel.org>
References: <20260527-mfd-arizona-irq-v5-0-ebeda2e925da@kernel.org>
In-Reply-To: <20260527-mfd-arizona-irq-v5-0-ebeda2e925da@kernel.org>
To: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37580-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: F29245E4D35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Wolfson Microelectronics Arizona sometimes needs to poll the
GPIO line corresponding to the IRQ to counter bugs in the hardware
that appear on edge-triggered IRQs.

For this situation, provide the optional irq-gpios property.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/devicetree/bindings/mfd/wlf,arizona.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml b/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
index 7902f3c5d289..359e40b3dacb 100644
--- a/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
+++ b/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
@@ -194,6 +194,16 @@ properties:
   reset-gpios:
     maxItems: 1
 
+  irq-gpios:
+    maxItems: 1
+    description:
+      A functional IRQ should be provided in the interrupts
+      property. This property enables edge triggered IRQ emulation
+      for hosts that don't support the codecs level triggered IRQ
+      output. The GPIO line corresponding to the IRQ will be polled
+      until all IRQs have been handled, ensuring an edge is generated
+      for the next IRQ.
+
   wlf,reset:
     description:
       GPIO specifier for the GPIO controlling RESET

-- 
2.54.0


