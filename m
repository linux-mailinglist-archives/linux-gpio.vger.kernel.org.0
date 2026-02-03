Return-Path: <linux-gpio+bounces-31406-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEMHLs0zgmlsQgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31406-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 18:43:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 16429DCFF7
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 18:43:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ED0FD3059B9D
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 17:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B6133659E7;
	Tue,  3 Feb 2026 17:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRaWRc6b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298353644D2;
	Tue,  3 Feb 2026 17:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770139821; cv=none; b=UhKOgGXu61taW5sBg+yR7zzEVFx9elIl71a5PxLao5ijn4mPjwsaCBnrq/E2POgxg0d5YSzL45Dp2OIfsaLUtfg1KCjIxR034bwLCTsF/zOvmKFWw1fvBeVUMAo/yL6YgjyjSSH3OFqiptNVdYPn7VS6tUe9/vdWyaXrNQ2XA+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770139821; c=relaxed/simple;
	bh=+TJZbuSUrc2aq/cuJGaaBK3cvI5fuXEhX3m/yBP+rCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NWC4aNPNYaF1LASwsCTaqLSfevgeHrC0n33emAzTiaT63Ee0go6TukFFgS9+a6BnWQTJVlIrJzSMtBmJWWwGXWqSuh+ttEn5H1EBdrvWcF0Y1S1cMATjHDCQ+/aKdtQjC5OtcL8H/LFatvnto3eK5KKY45o4vdNqrq9LJ4AUqys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRaWRc6b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8EBAC2BC86;
	Tue,  3 Feb 2026 17:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770139820;
	bh=+TJZbuSUrc2aq/cuJGaaBK3cvI5fuXEhX3m/yBP+rCY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GRaWRc6bEwLpO8hmq0KoNnypzwN76hNAMU4aiLMDrSNyG6V82eV6MklhBYmLy4p1x
	 p8nYreFLKGHkTXC0f5sjC7hT7Ydh4Yjg5P9FQL6umoQpsIorC1ogGgIQV0EKuSXjY6
	 CstRjgNkYZozYURWnyZTKGT2shl8i4bM+EmhvvhWthUhkxDDpVyAUICboqPPZ/UivJ
	 pASGHcf+8EwdCfT4i36nd329lDTk0BhBuUrYfEo2fQpvYIcVDf+gm1UDr2h5VPQSyt
	 kUtbXq/uzBQW1W1oHQ2ZhgOy9F7md8yNlaeO5HN7lSDDmWeU3SbkMX5X0Fy0u4ROVy
	 f7V1Tcho8m2cg==
From: Conor Dooley <conor@kernel.org>
To: linusw@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [rfc 2/2] dt-bindings: pinctrl: pincfg-node: add restrictions on conflicting properties
Date: Tue,  3 Feb 2026 17:29:43 +0000
Message-ID: <20260203-gleaming-perky-e12d6a5fe86f@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260203-device-unwashed-ed24f8592d79@spud>
References: <20260203-device-unwashed-ed24f8592d79@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3170; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=fHWlkhGu4hcgzz/nLnrdWCDLipWjIryl6nOBxJfO8ZM=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlNBjN6zvKLxfLMys0Om/17rpbpRXfR4IDKli8cJ1ec3 b6i5v7KjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExkkhQjw+7uL7blu7yN61a6 evk7n2qrcHSfyS0dbyFrnnmsZ2rkQkaGPa67+oK9jJK8Q8/MmLzt2bLpjmwh5Uc0ZjkVlGUyHGH mAQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31406-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: 16429DCFF7
X-Rspamd-Action: no action

From: Conor Dooley <conor.dooley@microchip.com>

Many of the possible pincfg properties are not compatible with one
another, either because they represent mutually exclusive states for a
pin or because they provide the same information in different units.

Add some simple restrictions to prevent invalid configurations.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/pinctrl/pincfg-node.yaml         | 105 ++++++++++++++++--
 1 file changed, 98 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
index d1bc389e0a6d..874f0781d2fc 100644
--- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
@@ -162,12 +162,103 @@ properties:
       this affects the expected delay in ps before latching a value to
       an output pin.
 
-if:
-  required:
-    - skew-delay
-then:
-  properties:
-    skew-delay-input-ps: false
-    skew-delay-output-ps: false
+allOf:
+  - if:
+      required:
+        - skew-delay
+    then:
+      properties:
+        skew-delay-input-ps: false
+        skew-delay-output-ps: false
+
+  - if:
+      required:
+        - input-disable
+    then:
+      properties:
+        input-enable: false
+
+  - if:
+      required:
+        - output-disable
+    then:
+      properties:
+        output-enable: false
+        output-impedance-ohms: false
+
+  - if:
+      required:
+        - output-low
+    then:
+      properties:
+        output-high: false
+
+  - if:
+      required:
+        - low-power-enable
+    then:
+      properties:
+        low-power-disable: false
+
+  - if:
+      required:
+        - input-schmitt-disable
+    then:
+      properties:
+        input-schmitt-enable: false
+        input-schmitt-microvolt: false
+
+  - if:
+      required:
+        - drive-strength
+    then:
+      properties:
+        drive-strength-microamp: false
+
+  - if:
+      anyOf:
+        - required:
+            - drive-open-source
+        - required:
+            - drive-open-drain
+        - required:
+            - drive-push-pull
+    then:
+      oneOf:
+        - required:
+            - drive-open-source
+        - required:
+            - drive-open-drain
+        - required:
+            - drive-push-pull
+
+  - if:
+      anyOf:
+        - required:
+            - bias-disable
+        - required:
+            - bias-high-impedance
+        - required:
+            - bias-bus-hold
+        - required:
+            - bias-pull-up
+        - required:
+            - bias-pull-down
+        - required:
+            - bias-pull-pin-default
+    then:
+      oneOf:
+        - required:
+            - bias-disable
+        - required:
+            - bias-high-impedance
+        - required:
+            - bias-bus-hold
+        - required:
+            - bias-pull-up
+        - required:
+            - bias-pull-down
+        - required:
+            - bias-pull-pin-default
 
 additionalProperties: true
-- 
2.51.0


