Return-Path: <linux-gpio+bounces-14191-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 813049FBA62
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 09:03:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 132DC165E63
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 08:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EAC4191F6D;
	Tue, 24 Dec 2024 08:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qLVmvkrl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F7417B502;
	Tue, 24 Dec 2024 08:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735027366; cv=none; b=t7gSU6cb0IXX5dcnW6d7LTw0w/tS1g5CSwXMp42bssUVL8t4sDR0Fcv8s/oyQqdz2/SkidTWQhuu5zdd7aPxPzhGpSjrD+be9wijUl6qigVgYPQT7Sy2L6ryYTqJz6aB+JzGgvBkAWowQv5MFyo+FtykjWE/6VEfU9w6xBS4EBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735027366; c=relaxed/simple;
	bh=Z/XD1h0VJikgWhizjAxa3XqMcam4ZcSOMqnUDbPdub0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PrmhDqMY88q9b5s/bsGEezYRFQj6pHxPBlOIL9ADpEsOfrr5uha0TKc5Fyl3wne0/r0uWIr+AhEAnxJxFIROhTHBjSAIxja1hmHmh4WzJnNlKkq4chk6CpMTAPt5Zju1jVrGGwcnLGbvHQIQT8aN7e2zRg7vSWuGLNyKoEejLng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qLVmvkrl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94288C4CEE1;
	Tue, 24 Dec 2024 08:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735027365;
	bh=Z/XD1h0VJikgWhizjAxa3XqMcam4ZcSOMqnUDbPdub0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qLVmvkrloatNJ5lEvW0jKORICokpbU9hg4errjFx3mqucUZzGLgRMAw0U7yukDw2U
	 zKrrk+UOwiy1UsIC4mqTdnWj2zAA+w16Ytov6q9Q8T7Xv+GYdPVspsMCvORFh9eFxo
	 gyXqDNXV1zeVL8SYsKzec+1FWaTlL9AXTUBqU2ZO02OoypdQ9eNyKI0Ildq9SJ/FYC
	 kbKDOx9Ezr2q2g9gaoTfSj9M4WMJjIJtG2ZvoZRXIeUzykbDD4+L2TDiGS1EIG27Of
	 s7HdyRSJ+1VB3/GRR+fAKBYBvrCDkqiLGEffPAl1GBYE6gKo524W8QTMrRe9q9HvXY
	 BNpVGV7syjdow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F89E7718E;
	Tue, 24 Dec 2024 08:02:45 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Tue, 24 Dec 2024 09:02:12 +0100
Subject: [PATCH v2 3/3] dt-bindings: gpio: fairchild,74hc595: Document chip
 select vs. latch clock
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241224-gpio74-v2-3-bbcf14183191@posteo.net>
References: <20241224-gpio74-v2-0-bbcf14183191@posteo.net>
In-Reply-To: <20241224-gpio74-v2-0-bbcf14183191@posteo.net>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735027364; l=1852;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=cH5xit3DV86hTLAfvgIOa3yWbYuQXqh7Jhuym93dIKo=;
 b=wgPZt5Bm15HKsHlWSLf2fWzDXXz5ECnO5nU6CLR0GH+pCQu3++Eq8NuFFDkBTXOQSL3N09quU
 y/EBzlQ46rJBW5cuDhEMPp3YcjFIOzt72DDzM1i7rZdKA74mI5y9JM8
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

From looking at the data sheets, it is not obvious that CS# and latch
clock can be treated at the same, but doing so works fine and saves the
hassle of (1) trying to specify a SPI device without CS, and (2) adding
another property to drive the latch clock[1].

[1]: https://lore.kernel.org/lkml/20241213-gpio74-v1-2-fa2c089caf41@posteo.net/

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

v2:
- new patch
---
 .../devicetree/bindings/gpio/fairchild,74hc595.yaml     | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
index 629cf9b2ab8e4a63fbe17f56792a46d2066d40c3..a209c5b4f6e01ae9a376148b229273db7fdf0aa0 100644
--- a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
+++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
@@ -6,6 +6,23 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Generic 8-bit shift register
 
+description: |
+  NOTE: These chips nominally don't have a chip select pin. They do however
+  have a rising-edge triggered latch clock (or storage register clock) pin,
+  which behaves like an active-low chip select.
+
+  After the bits are shifted into the shift register, CS# is driven high, which
+  the 74HC595 sees as a rising edge on the latch clock that results in a
+  transfer of the bits from the shift register to the storage register and thus
+  to the output pins.
+                      _   _       _   _
+  shift clock    ____| |_| |_..._| |_| |_________
+
+  latch clock                           * trigger
+                 ___                     ________
+  chip select#      |___________________|
+
+
 maintainers:
   - Maxime Ripard <mripard@kernel.org>
 

-- 
2.45.2



