Return-Path: <linux-gpio+bounces-33853-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJNhC5RFvGlTwQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33853-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 19:51:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B798E2D1586
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 19:50:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0C1F33026920
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 18:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D66359A88;
	Thu, 19 Mar 2026 18:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObLzcAvS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698AC351C0A;
	Thu, 19 Mar 2026 18:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773946236; cv=none; b=VDZ4v/7XIUDoCamzTtETcN54lz5NIUXqP2+j6vECq5gOHZ101D9I+RkRztRSBm4waESsjb9xmytoVKk9FMFcao6xRpsayL4TRNzffR96uuyetnbUd5lqgHt2sC2ZmCmjtliM9dqkOaKM9nySE4Nn8cIg7ee28qgQZ/zt7Lpe3Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773946236; c=relaxed/simple;
	bh=s7amDrt63b2OZFObbq29BQbthPWiDgvYoDxI5Si80Pg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UtMn7GvWtrwMhRQuZYmF478CY3Y1lJ4mss+Rz1KxipQVNB5N/3UOp+Ez6/y8KKWcnSNjfhYxd0ukK4jNxP1MqGzgdDYF4H2bLxXIROzn+xtRg9DT7okfSGwaG3uQKnzIOaaQOmc4ySg90nEJs3JVuqjt9bZTdgFRWRrnMg6gAIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObLzcAvS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CAEAC2BC87;
	Thu, 19 Mar 2026 18:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773946236;
	bh=s7amDrt63b2OZFObbq29BQbthPWiDgvYoDxI5Si80Pg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ObLzcAvScQFhT3ICLc8WTpw9z8whN1YCTqccEkfe9MUOtYGeTtSXRIL7ez5u8Cf7i
	 4WyeIzPISYuZHrisy73JVwQ3jWLR3Mq5wxKeF24PN5BccWTNMIE7pqaoNwesT0o/5J
	 0WvHKRy6xKbDfJozjL+FzF7x8S+bzg+F94aqT38vDBmuf7uAuAyqJWSJiJ9YiQuXX2
	 Gg0A6lOo8zW9gVYUM6xyI47CCB886sXC0WmSMPKGRtrqcXLowE9BG0DL894sHrhd5b
	 XeJTDjbibq8m6jIEWLdFu6prJ3ujtUSPEkEVNV9c9Jd3jbJfCA+fgDEDyApUugcKp/
	 m7V27jz5ah1ug==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 19:50:29 +0100
Subject: [PATCH v3 1/2] dt-bindings: mfd: wlf,arizona: Add irq-gpios
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-mfd-arizona-irq-v3-1-24c251377ec2@kernel.org>
References: <20260319-mfd-arizona-irq-v3-0-24c251377ec2@kernel.org>
In-Reply-To: <20260319-mfd-arizona-irq-v3-0-24c251377ec2@kernel.org>
To: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33853-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B798E2D1586
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Wolfson Microelectronics Arizona sometimes needs to poll the
GPIO line corresponding to the IRQ to counter bugs in the hardware
that appear on edge-triggered IRQs.

For this situation, provide the optional irq-gpios property.

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
2.53.0


