Return-Path: <linux-gpio+bounces-33730-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLg+KOyJumnSXgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33730-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 12:18:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D0E2BAADC
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 12:18:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADDC13232BC8
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 11:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7E03939CA;
	Wed, 18 Mar 2026 11:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gdd4xjR+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E733C4567;
	Wed, 18 Mar 2026 11:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773831888; cv=none; b=l0zHK/PILnKjcz4zpn3f3fAlR1G2bbe3CtAy3a9Lu4CetwzMAo5miUaaO/cpBIR7XB09QMAcrJ9A/cInlumeN+p3L3p4OUp46Gctbk0/xMCWFmtFBvk3QISD1OaZ7eU1oVw2H7DODuWcgRS7tGcXwbOEWzfUs8pdatTlJI2Ixgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773831888; c=relaxed/simple;
	bh=7rNVad+B7+QaXsOmWf2AwAwbqZ0cbbd/BzWX6Rw2CF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m+vWJmRJE21b8cjj+vA7l5F/5f2CaESgmYjgcu3EXyAvctaUmoP5nrasnAvAdntdlEL/vtwbIY/konhxKaSEe1PG8+T3NuRbvm/ohO9a5/gBs0BVhimtZ6gBxKnMDIlj+MZIHxHqtWHVkYo4ibEzwxKZlnWJ4J6WtkBrtBU5/co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gdd4xjR+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D8FC2BCB2;
	Wed, 18 Mar 2026 11:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773831887;
	bh=7rNVad+B7+QaXsOmWf2AwAwbqZ0cbbd/BzWX6Rw2CF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gdd4xjR+aoSrnT2aU4PCaudtHFjxR/RcSD6iG2HqgqmptJBvtIdA42vqcb8Zf5ymv
	 +b+GU0vL5sb+qglnCk+0FGFxZlmXLL76DY0gNf47b8FielnC41/2nahumdQwNbXyIm
	 zXBz08HIQbrZPTPfkwARpAgopIHsIP5DStkS3r+tZAr7hIsnMYjLkXUPWuszKELxFY
	 37uOTk8mbxB1Iicn61RQ1UMIJ/PPdX43duB71ARmvbvj9IMBo+vnnuzdLZIo6DdwU1
	 4Tj12EOwvIv+CkDo8QAWsI7SBfHtwJzup/7b5QcSlWlDcIBnaMSSYoAYVbLPt8orM8
	 x64UgwTvoLvOQ==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v13 1/5] dt-bindings: gpio: fix microchip,mpfs-gpio interrupt documentation
Date: Wed, 18 Mar 2026 11:04:32 +0000
Message-ID: <20260318-fondly-tradition-90b8241f0cc8@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260318-gift-nearest-fd3ef3e4819b@spud>
References: <20260318-gift-nearest-fd3ef3e4819b@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3190; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=27/jkLY5kQVq9jTRVF6tl1zmApScLGF112Z5WyTB0Qc=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm72o6s9HuxjM2yme9l5esMlVvTJJ/PMltlw2R67ZVNw sLtZ8tedJSyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiecaMDP3H4mX4dWriCtXC QoqPyZYt5Lqx0FHIYLnd1G2RfIsSNjAyvJ1QGbRzAd+mrIidVtIlHwMsTP/NFNzM63p/7v/3C/b H8gEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33730-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: 22D0E2BAADC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Conor Dooley <conor.dooley@microchip.com>

The microchip,mpfs-gpio binding suffered greatly due to being written
with a narrow minded view of the controller, and the interrupt bits
ended up incorrect. It was mistakenly assumed that the interrupt
configuration was set by platform firmware, based on the FPGA
configuration, and that the GPIO DT nodes were the only way to really
communicate interrupt configuration to software.

Instead, the mux should be a device in its own right, and the GPIO
controllers should be connected to it, rather than to the PLIC.
Now that a binding exists for that mux, try to fix the misconceptions
in the GPIO controller binding.

Firstly, it's not possible for this controller to have fewer than 14
GPIOs, and thus 14 interrupts also. There are three controllers, with
14, 24 & 32 GPIOs each. The fabric core, CoreGPIO, can of course have
a customisable number of GPIOs.

The example is wacky too - it follows from the incorrect understanding
that the GPIO controllers are connected to the PLIC directly. They are
not however, with a mux sitting in between. Update the example to use
the mux as a parent, and the interrupt numbers at the mux for GPIO2 as
the example - rather than the strange looking, repeated <53>.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/gpio/microchip,mpfs-gpio.yaml    | 24 ++++++++++++-------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
index 184432d24ea18..9b8c58f391f40 100644
--- a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
@@ -62,6 +62,11 @@ allOf:
           contains:
             const: microchip,mpfs-gpio
     then:
+      properties:
+        ngpios:
+          enum: [14, 24, 32]
+        interrupts:
+          minItems: 14
       required:
         - interrupts
         - "#interrupt-cells"
@@ -82,18 +87,19 @@ examples:
         compatible = "microchip,mpfs-gpio";
         reg = <0x20122000 0x1000>;
         clocks = <&clkcfg 25>;
-        interrupt-parent = <&plic>;
+        interrupt-parent = <&irqmux>;
         gpio-controller;
         #gpio-cells = <2>;
+        ngpios = <32>;
         interrupt-controller;
         #interrupt-cells = <1>;
-        interrupts = <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>;
+        interrupts = <64>, <65>, <66>, <67>,
+                     <68>, <69>, <70>, <71>,
+                     <72>, <73>, <74>, <75>,
+                     <76>, <77>, <78>, <79>,
+                     <80>, <81>, <82>, <83>,
+                     <84>, <85>, <86>, <87>,
+                     <88>, <89>, <90>, <91>,
+                     <92>, <93>, <94>, <95>;
     };
 ...
-- 
2.51.0


