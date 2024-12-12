Return-Path: <linux-gpio+bounces-13838-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C80409EFB25
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 19:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06BC4188313C
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 18:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA04C2248A4;
	Thu, 12 Dec 2024 18:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Qy0ayegu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E628223C4A
	for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 18:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734028606; cv=none; b=Vmjp4yzJIxrXZzv2uWazRbSS5MHqzd3ZIn986Gl4K32ZuV+QJZFAeI/rPgrHCIpDbtJfpccuQpEsgYqtlY/Y6OJ/2ePfe1L2Jx/YqtXEOUjvzcHRdw9xynQ9E+G0W72QUN13OND+GDIuhIV6CNd3OI6pAExuvkoNEjKHjlq/VTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734028606; c=relaxed/simple;
	bh=rkPNOS/CThHiZ6WlZSF0eZPRzkaH0woMbTCR+SPr3t8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UECJLWRBxkoB6zw2gEi/oETTE9c4zHHqcDaq8zr6p8ZkK08Cr+UiuWJA3iO6vtWvs3RZ1hb9sEItTUWtbMsPcJaSZpF657WXxxGCam7PQj80dbOw1dTV+LdviJboXVKdAeT/TaUTTHqEIWy4uvKU9b9O1/P9P1+CuXvcQZtexXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Qy0ayegu; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385de59c1a0so583647f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 10:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734028603; x=1734633403; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZmY4nSeOHfUAeSRoOGUYAdGnJvM3BDuelhiAae/7ZWg=;
        b=Qy0ayeguk99iHuVBTkCZmC2a7Li07bPTqYCO5V3AEUKu1TSRAnFaG4J4rw1GkNmgBl
         w27SGhfvY2PMQf9E8kR3MOeH7f13bbAPD+CvOkyx7UlONsPDYF23dk/9Swv3v5vuvt/x
         R5pcslEhKgvahfs5YGtMfFEM7mln48pBFtKgTli0O1aruXbJOSDao2Xql5QC+AHz/wh5
         lFmpX4kz5pVRvj+oEWoPQ6yvsmLXNGfBKaNMZAYk/oRPfFCpqsDuYKKzrpzsazU8XI4h
         DcA4kEJsLIVXI0Upv55dTSuw4XhXUtJhNFgc7BdSzLE6Tu9KYLUNXL+9u1QVxF54c78T
         wcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028603; x=1734633403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmY4nSeOHfUAeSRoOGUYAdGnJvM3BDuelhiAae/7ZWg=;
        b=uUOLO9Jr4OHa+damD9qfC2F59LT82RqbqHu9cX1Hk3F3wRdeTqA5o2s34HOzzrrd7e
         T34vniF5/z5IwlHBhqA8arVTdyEmt1EHkXVEuc7AyTCGIZ9qt33gRg8xe0r55Dj62QVP
         XBP7IA5+xV9cYhWrmA9weZWQ0xafCFicf0KNiDNRlZR4ltB8s6ECkS/kWBHPCoYgPGAt
         c3vkcMJuh1QMtcsBVqNcCPfFAe+4tfSRRuenQGw5yk0cB2bDeRx8qJd5Far3e1ja6OAF
         NYUGMQ1VeUp+q105RBaH9GUPZA6Ek0wvUcJtS2KGGSqjHoCY/CwbKi9cyOtKkvBCwpud
         0M3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJ1zrU2cQSG1w7yL+Y0bQcp0L/byoYBVQOeVXAhl1ygA/bU3YBjE7aRDfMIwFIPk4Vb9FWh1uJ3d5p@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0oVAW3npoub6/xnbNDp7pLbanjpLdI7o9d5gWkqXdrkgUrRqm
	XXApexpi79WqR+9pJ7ulNrWZfngg9OdhXCuzU6TyZUVSpd5x8H7iphDizd8Q0kw=
X-Gm-Gg: ASbGncvxMkvmcsrqJ4CvZsYXHZAVQ9NdbQXs0ZNiPWb/qrqUFloj3YlhS1fHm6xpFed
	UOaryVkNxd/oYl70qxhJwGFziI7G8rIOv6eu/hXBt5Qnhy2ZhfDmwer2ywVdJgwx0KcPCtaCUsf
	JTns9lRDg9yjtjIEqzVGbjpijSsxXaNIWVrLwUcu33d+G+MFb+Hisy6A39yXmRdDwyP5vgqYk92
	UeKovTFsgeon1pv1c3Cb0iOqR2r6E9RtphP8uHG1+ypyYNj
X-Google-Smtp-Source: AGHT+IFU9uMnmpDGMa3W5FkV+Zbg8mGPNRBLqmRp7s6rNpHHpbC4TqWxpZPj4otDLO2FaOF1TjZ6vQ==
X-Received: by 2002:a05:6000:70e:b0:386:3864:5cf2 with SMTP id ffacd0b85a97d-38787691302mr4172021f8f.19.1734028602901;
        Thu, 12 Dec 2024 10:36:42 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436257178e3sm24651995e9.41.2024.12.12.10.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 10:36:41 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 18:36:29 +0000
Subject: [PATCH v3 2/7] dt-bindings: display: Fix BCM2835 HVS bindings for
 BCM2712
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v3-2-44a7f3390331@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
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

Update to validate clock and interrupts for the variants.

Fixes: 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../bindings/display/brcm,bcm2835-hvs.yaml         | 83 ++++++++++++++++++----
 1 file changed, 69 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
index f91c9dce2a44..36bf8eec88a6 100644
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
@@ -33,17 +42,63 @@ required:
 
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
 
 examples:
   - |

-- 
2.34.1


