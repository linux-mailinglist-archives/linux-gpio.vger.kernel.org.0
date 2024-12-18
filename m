Return-Path: <linux-gpio+bounces-13987-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A139F691D
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2024 15:52:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C58CE173A6A
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2024 14:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062031E9B09;
	Wed, 18 Dec 2024 14:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="rYxG6wVC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC0E1B422B
	for <linux-gpio@vger.kernel.org>; Wed, 18 Dec 2024 14:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734533331; cv=none; b=CTWzit7x9rcmWg9dlvGv3gCyP2BRiqyZyA97z3n9TTJpW5zJ4LBzDIue1DYmtYPk37zlOSIpYr2AAe2qqaMJu5FK8kxcOUqEkiKKBIJaKs/f6e59a5KZZ1uMYlPrI+7PIhpQ2DDWh8Mw6o4aa/i4LeJtVqajYHNwNjkrxE5cKKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734533331; c=relaxed/simple;
	bh=dgUTEO5IJODWHuc652GdPAcw5MpYfTRtGhZ29mnXqV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L0EDZPys58H8VC0XdX3Pi6sRnR7i7ZKqzJOOc1E3ntNms2lGoStGKbp1A/8KQv57/mxIXb/HON0Yuv5NktQmpACQUb3blb3AeMDJuZ6ZnWIOP+jgPozwQ3Z8tvilp8WuTukTGGLwasAamgAQtsU2ILV5q4tvyRCcVHR1VzR6Y+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=rYxG6wVC; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3862b364538so505235f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Dec 2024 06:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734533327; x=1735138127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yrY2pupmY3cS5kWrlBb91JoKbiwZO8QDmeo+1uchgEg=;
        b=rYxG6wVC+glELCzGk2fpWlEh5Y95OaZRTxq6PKKjHPUAKMvRaErJcFeZYeoIgcpd6N
         OQM7zTjkHeJUc8Abhcv1wPOq6Mbxd0xT33kGaHtEz0rbDEFgZ24dnoEq6uzA8K3pIXHZ
         KbFSiVXg5Piz0qJK8HHoIqjwHgzbrduCH5pK5qTdAzOqg/1mFhrU7xZI4WCho9Xcgr7Q
         v4yroi2uYsHNsSDindIxvfWPcvTlCB82FZnj1FxjfboDiBlzTp6GfhtbFqLWf3u6ox7S
         U4jSloPO6Q6Mmk9bclgDiCThxvArD7WHWnlqquina6ji/0hd7RY+Xyodqs1ZO51fVaTa
         DoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734533327; x=1735138127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrY2pupmY3cS5kWrlBb91JoKbiwZO8QDmeo+1uchgEg=;
        b=MQkP4XoSZ0Wb23HEuUaf1v8BuNWrJmEW5DCREyW42rLK+BetsT4RlE6pCLNWa/L7bH
         dftXYCRS3c86H3niB1puo2zt26EbbsLUkp9l34p5cgEF+aq3dhC4uwhvtA4uDksl0OzE
         smRm9bk9JvwWCB6XWoDJWFVhiMlHqnh5Ui3d/ubGF20R0+YqjiDIT/zxuO+T2YK7DT9N
         2xjXUwbqquFEA7QQWZSsOaPFkiytGmfU06chEiCcA1TwbzrfXhqikwmzAxf/Hmm/YDNn
         r9gnp+/lrDrnW2NZecrL7K19HOKnoQnLN5EkZHh5mux7Y7lE9bE7MtUzFUD7QldliqHB
         lbGw==
X-Forwarded-Encrypted: i=1; AJvYcCWNEoxWFbSYPvEgZPNGV+u5Uymiy7k5at4IXTzdrfEI/F+Wyllh6EBAsfowjdT42hR6gucxiY3kawne@vger.kernel.org
X-Gm-Message-State: AOJu0YzJFi1TaUj0EVYipt1+wy9qmFdMkj8dD/oSHDH+nQWchCCAXkLi
	vTi1dhuQ1z0tV8LdyvDEDPYXMyhrMSLlJeaylizIIEXVtZHAaY6rJLI6H6IqGR0=
X-Gm-Gg: ASbGncuFJuTKuy7PLGrVao4nNHyyzFvAk3eiGaT1Je70ll/31B51auNUaec4rSgFtnE
	RSDDwdasYvgdFYStSdcGOolrxpTpYd2ldUgxfsQHvk/7SsNSOWa7U3WJ7/8x3p2excD9aRBatQC
	eWlnPKl8AKJimvCz9JWzzZmEwNW1FXDUoOD71ZpaW0L60Po8rpUDGpHSRiMpbVRkQJx1PC2a8HA
	5rklVw0pPwNCWZU6FHXuxz2U7InitQeFglt1WjduiwgEo4J
X-Google-Smtp-Source: AGHT+IGVb9AVJbgLZf6oo7CR/UM/0zP05m4m7cxzr4ZQnmR8ihuiTVlaXnWyw/vXXHA60mapsdImEQ==
X-Received: by 2002:a05:6000:1ac9:b0:385:f64e:f177 with SMTP id ffacd0b85a97d-388e4e1d4f2mr2756907f8f.11.1734533327591;
        Wed, 18 Dec 2024 06:48:47 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-388c80613a9sm14165163f8f.101.2024.12.18.06.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 06:48:46 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 18 Dec 2024 14:48:33 +0000
Subject: [PATCH v4 2/3] dt-bindings: display: Fix BCM2835 HVS bindings for
 BCM2712
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-dt-bcm2712-fixes-v4-2-54cc88b6c229@raspberrypi.com>
References: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
In-Reply-To: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
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
the number of interrupts and clocks changed too, and both need to be
named.

Update to validate clock, interrupts, and their names for the variants.

Fixes: 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../bindings/display/brcm,bcm2835-hvs.yaml         | 84 ++++++++++++++++++----
 1 file changed, 70 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
index f91c9dce2a44..fd25ee5ce301 100644
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
@@ -33,17 +42,64 @@ required:
 
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
 
 examples:
   - |

-- 
2.34.1


