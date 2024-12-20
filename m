Return-Path: <linux-gpio+bounces-14100-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F074C9F993A
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 19:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D14F7167ED0
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 18:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA632210CB;
	Fri, 20 Dec 2024 18:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="XFHbUPON"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C4821D5A5
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 18:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734718290; cv=none; b=cP4hrbI0ZfvwSyui9i8aJQTh+aovL+jfMrMxa6Krd5jiOBkgQeJHpdBUUQjIIc0oITbH8whlbD/Sn5wjHQjW1KrzfPgLHzsDqFUiZXpjVYxPs3N9JdgsqBx2hNFPEt5p9NMJTemlsIPJU55Ms+OQrhkAp/K+hh+kqfjMhBA8DOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734718290; c=relaxed/simple;
	bh=f++A39P0hC2PNYe2xMEbczHdYmf36DPvvwKlnSwS2e4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IP9ib7Eo6KIRkWszKUIwrw172guDXDbIuTCEBp2LoamD0ERIOM/2Jp27lD0pHdxP+YSQZBwvdEJk4DQOIfJ8keW1dXPijwW0/sb59GBg6FtZ5tGHBeH+X2M4i5QTf8aTSmSRw5erJdIjKt/3GVj8hpXNVeBAr9DrF7cSAIPFODQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=XFHbUPON; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso15413135e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 10:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734718285; x=1735323085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Sl5vZ6DuvY58dxwG3krkGImhGuVFYQY4MkC0DJ9Dic=;
        b=XFHbUPONFscyXnVZrdGr25THUfH5DRNoN2f4MpMqrx185l8XvIeCwMsYdZ3PlXJQE1
         aY6Vme/A8y676mji2NQyzmoy3J3KxoyHgfuwQOltiZGkjfA+zKRbu7UlEp5BrODck+n0
         zb5gB6GHFn+SyoVWfVpZyzkvAnUK0s+oaVl7YmyPhoHQZQ3nLEtJ/jwmTJu6DXFyz3PO
         pX+gvTgXSmSdVOh11kUqLd8rY1o5HMxK2zShMeaOwGGRCO07COsJ2xfuxaTddWi+L0jt
         AnD14nKp407NhZyEqajCZX5ehpozPpk1ikTSnj8esNoXerIqwz7lTwJLznyRBYAUYIPh
         1ywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734718285; x=1735323085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Sl5vZ6DuvY58dxwG3krkGImhGuVFYQY4MkC0DJ9Dic=;
        b=xDNRWvJMbd9+DFLqUF9xPVBM8zCPwO9hNYniZc/92KDnESMUy+7yoFkPDqpNpW3Oag
         gLSWl4RQcfJnKLnZGwA7+71TuxVzW06vbPczXvAuRM8v0q3LOuo2a8HbMzSDd20IZu84
         ZP0lBoBNHa5cxX7BR/k3wvoQF2blJDA6jIu3CINlfr3RcIVxAr6YlYbPm2dugLrwNgFU
         Td3eEW1MfrW51RC5MdWhp1TPubZzW3JNAtUsxSfx23/PnhkNIsfEhVqqXM8B8fsX3ToV
         0xvXLd+LiHkzYOBMDOYazNR1tYlxWYfOs3tLCoJVkOkirRqzsy9S7P5pHdf/E0JFbTXr
         LNZg==
X-Forwarded-Encrypted: i=1; AJvYcCUoNqLdJrC8Jsi0jjBO/b/IhNl5/K4oPvWf7Wef8Oa5QbvOLJqpU1LhPePCCtFVQsvwP2PX0n/EEFmH@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi0Uxctxxjp5qV221yxmBSGLLzsa7JxjpakOH7+6GP3pVAdu55
	lfd/TucM/ISqRBxvbO6tTzIsjWh4uladsBTlwz39Wt2HtCinsDFKiZg9nGgfnjyhOzzLLzOnBRa
	yNKU=
X-Gm-Gg: ASbGncsMZISyGOf0CW6XUUIlMTFXRH/IBazmO8QMGRYOWfz3cZKmiCUBrum9wF6/Ik+
	dPaxhOHDUsbcMIu5ycIzqLbiLjZKtPHZcEnOW4TVhQW2ONP0yzv33YsQvPJdU0lITYheCFngnYf
	8ZTeGsN6KZDqCRpQrPo0R4MQpQ63GYpLYU3/+B2QUzgtIkQapsLI1buswfPEl3pL/ns0BxN7vvK
	yadSaDPjGgVladCc2mdRJZ7DcrSijhRYBiWMAhNtgmI96Nd
X-Google-Smtp-Source: AGHT+IEvTWbavoXhQ6+vfbkOhG8cbDKYZMOKpzg5ZpuFE1J+Gc33Tj3rIi7Es/smHvmbL2/NSCBTrA==
X-Received: by 2002:a05:600c:1912:b0:434:a968:89a3 with SMTP id 5b1f17b1804b1-436686436f9mr40093445e9.9.1734718284772;
        Fri, 20 Dec 2024 10:11:24 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4366127c488sm51460075e9.27.2024.12.20.10.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 10:11:24 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 20 Dec 2024 18:11:12 +0000
Subject: [PATCH v5 2/3] dt-bindings: display: Fix brcm,bcm2835-hvs bindings
 for BCM2712
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-dt-bcm2712-fixes-v5-2-cbbf13d2e97a@raspberrypi.com>
References: <20241220-dt-bcm2712-fixes-v5-0-cbbf13d2e97a@raspberrypi.com>
In-Reply-To: <20241220-dt-bcm2712-fixes-v5-0-cbbf13d2e97a@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 linux-gpio@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

Commit 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
added the compatible string for BCM2712, but missed out that
the number of interrupts and clocks changed too.

The driver commit adding support for BCM2712 [1] also requires that
both interrupts and clocks are named, so the relevant -names
properties are also added to "required" for BCM2712.

Update to validate clock, interrupts, and their names for the BCM2712
variant. (There should be no change in the binding requirements for
the other variants).

[1] Commit 7687a12153d3 ("drm/vc4: hvs: Add support for BCM2712 HVS")

Fixes: 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../bindings/display/brcm,bcm2835-hvs.yaml         | 88 ++++++++++++++++++----
 1 file changed, 74 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
index f91c9dce2a44..9aca38a58a16 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
@@ -20,11 +20,20 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 3
 
   clocks:
-    maxItems: 1
-    description: Core Clock
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
 
 required:
   - compatible
@@ -33,17 +42,68 @@ required:
 
 additionalProperties: false
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - brcm,bcm2711-hvs
-          - brcm,bcm2712-hvs
-
-then:
-  required:
-    - clocks
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm2711-hvs
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Core Clock
+        interrupts:
+          maxItems: 1
+        clock-names: false
+        interrupt-names: false
+
+      required:
+        - clocks
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm2712-hvs
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: core
+            - const: disp
+        interrupts:
+          items:
+            - description: Channel 0 End of frame
+            - description: Channel 1 End of frame
+            - description: Channel 2 End of frame
+        interrupt-names:
+          items:
+            - const: ch0-eof
+            - const: ch1-eof
+            - const: ch2-eof
+      required:
+        - clocks
+        - clock-names
+        - interrupt-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm2835-hvs
+
+    then:
+      properties:
+        interrupts:
+          maxItems: 1
+        clock-names: false
+        interrupt-names: false
 
 examples:
   - |

-- 
2.34.1


