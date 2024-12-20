Return-Path: <linux-gpio+bounces-14099-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF509F9936
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 19:12:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86BE4165EA2
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 18:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB5521C19F;
	Fri, 20 Dec 2024 18:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="GF3eGBxe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8C021A449
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 18:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734718287; cv=none; b=Qd6i0scotxi46yeMxFtYVO7ViK/LazixFthbVRsH0hSNjY/QzqxudOQylsEGvTDaVY4YblR7oGTFCDQUF+rsfqlOWGmUjqvrSO07phIoKGzN6pgvlZdwS7IgmRfXYz+cLE65KxRPXuQYrz3cgSCZw2wDxw0/nhlFtbW80ZWqgn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734718287; c=relaxed/simple;
	bh=zcR7lxnGhhWEN5cw6h7Vm/gHy1+W70Ne4xGJNt6ufUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YBfJKtwiKSj33s6W+TNX91fx2P5bZXbpfVRROaznzq3v6z1h6zbuEDMPnIf1zQ+OOZXFtOESYlqt9R9uDwCRgnf3WSBQz+Eiu/ppCYoqMn5xdipCaQ35i3VIgurOWDwZs9POByYc/FQDJCwJ55y7oJmdVtjU1ajeNX3DlAoyfMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=GF3eGBxe; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4363ae65100so24077595e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 10:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734718284; x=1735323084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VKnwwPFe/+dE7hLJc1Yz3pFEYPu928FDpcSUb/vByrQ=;
        b=GF3eGBxeeqEoaiMd2UgQ+nJDcRcZd01ILTf1tAlPK2lDqasI9iIPcF1CLxLZiRUtJm
         eKbgNNYE/4H1Es+f2Uoh2ZAS/UEV8u12/aKnALx11FcP04fftqcnLBL7OoAkS8T7/WmP
         U7S0VIjMZO7JxIAS1ivLWPpN4XjM/VMLL6waT0zVPwyxKwNdEUqT989gJQtoJHILaXXI
         g4q3/rJtkYlLqExFTrbhjXBBWrzZarR4ZzV4D3rDSXKVpUeOupqXi7zrx6tXwrSAPeks
         Cb1PmY9pFSbv8tACzHulVfcX4zoyqFXxCgLihRzYYUJ4m/gq4/C4O5Fee7M7x7oPkflV
         M0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734718284; x=1735323084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VKnwwPFe/+dE7hLJc1Yz3pFEYPu928FDpcSUb/vByrQ=;
        b=QnYceoaqA3V8dyh2216A+6J03e11itDS+VF8oTKEC+Fn4mUqDRyLSklvXLLVN1tUaT
         tJJEe32EY8s6meXW2TMfUvvkYykxYTvEMZSFcK5Grq6zjxWasZpiGaYYjz93ovgky3fO
         xpX/OfQmL9/D6l/HdgCTBlMlQJ3OiW4m/FsW0hvSZGQprFBYzJbz390iCyOf4et+KRg6
         EX2bbi1Jw5ebBDnH5xzVGvbi7P7GXx6hjMmnmHNzfdxo0uL+CXTenUK81s+vWAgFpKkO
         +U0nnfcuCSlpagVbsfY6g4kOYXocwhYwN6IBqpGvX1f9iMK/R8a3cNQfZ6ctxcDULUgG
         Weyg==
X-Forwarded-Encrypted: i=1; AJvYcCUAyg18pXre0Nc7mLBbnLYCGW+vsRT66nl/UOF89JUGVS0htxXLPPh9EZl2+tuSdKLuVUSorCMCMOLv@vger.kernel.org
X-Gm-Message-State: AOJu0YytsCYPdH/Y2tk043ibcGINQaz2jHV93p9PRsOZzwaUcfc2is83
	GoHUhJ2p1owIjSYXERc3pGw4syo0ylmc1ePZzkwZUiynat02h7eZJpVzsNXHasw=
X-Gm-Gg: ASbGncuS/7upTfOcR0/BBfbNiYQNIG2EDtbtrloxRSBREZF79CROlUiOS/ASqRLhH1w
	ikB+duhULyWkgEcBZUychoT+69SlqI6nKZggiE5WER72zlhuPnvz6vG+zEGxCbmC2Rqy6Ed0qu0
	709YBSkKR+HQ2upQp1OGpjVwaU8uQMhVmu9VK9Tz/5cgDr/uo4CIxHtHrfBWYlBSWXMshkddlI6
	UON5VgU0rYNmgNNNzrJEH9rQ3eaFf6cXA/nevohgXRVNB/g
X-Google-Smtp-Source: AGHT+IEuWHn26jFE8mEN526e1pripavNV4jfCGcWV22FyYVXEe2zax7RoEXGtmhyz0wWSN2QoW0ULg==
X-Received: by 2002:a05:600c:1388:b0:434:f131:1e71 with SMTP id 5b1f17b1804b1-4366854c07emr38472865e9.8.1734718283903;
        Fri, 20 Dec 2024 10:11:23 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4366127c488sm51460075e9.27.2024.12.20.10.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 10:11:22 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 20 Dec 2024 18:11:11 +0000
Subject: [PATCH v5 1/3] dt-bindings: display: bcm2711-hdmi: Add interrupt
 details for BCM2712
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-dt-bcm2712-fixes-v5-1-cbbf13d2e97a@raspberrypi.com>
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

Commit 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
added the compatible strings for BCM2712, but missed out that the
number of interrupts changed, and for BCM2712 the driver changes[1]
required that the interrupts are named.

Update the schema to correct the interrupt requirements for BCM2712.
(Requirements for BCM2711 should be unchanged).

[1] Commit 0b1dbe82e051 ("drm/vc4: hdmi: Add support for BCM2712 HDMI
controllers")

Fixes: 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../bindings/display/brcm,bcm2711-hdmi.yaml        | 76 ++++++++++++++++++----
 1 file changed, 62 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
index 6d11f5955b51..c1cefd547391 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
@@ -56,22 +56,12 @@ properties:
       - const: cec
 
   interrupts:
-    items:
-      - description: CEC TX interrupt
-      - description: CEC RX interrupt
-      - description: CEC stuck at low interrupt
-      - description: Wake-up interrupt
-      - description: Hotplug connected interrupt
-      - description: Hotplug removed interrupt
+    minItems: 5
+    maxItems: 6
 
   interrupt-names:
-    items:
-      - const: cec-tx
-      - const: cec-rx
-      - const: cec-low
-      - const: wakeup
-      - const: hpd-connected
-      - const: hpd-removed
+    minItems: 5
+    maxItems: 6
 
   ddc:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -112,6 +102,61 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - brcm,bcm2711-hdmi0
+              - brcm,bcm2711-hdmi1
+    then:
+      properties:
+        interrupts:
+          items:
+            - description: CEC TX interrupt
+            - description: CEC RX interrupt
+            - description: CEC stuck at low interrupt
+            - description: Wake-up interrupt
+            - description: Hotplug connected interrupt
+            - description: Hotplug removed interrupt
+        interrupt-names:
+          items:
+            - const: cec-tx
+            - const: cec-rx
+            - const: cec-low
+            - const: wakeup
+            - const: hpd-connected
+            - const: hpd-removed
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - brcm,bcm2712-hdmi0
+              - brcm,bcm2712-hdmi1
+    then:
+      properties:
+        interrupts:
+          items:
+            - description: CEC TX interrupt
+            - description: CEC RX interrupt
+            - description: CEC stuck at low interrupt
+            - description: Hotplug connected interrupt
+            - description: Hotplug removed interrupt
+        interrupts-names:
+          items:
+            - const: cec-tx
+            - const: cec-rx
+            - const: cec-low
+            - const: hpd-connected
+            - const: hpd-removed
+
+      required:
+        - interrupts
+        - interrupt-names
+
 examples:
   - |
     hdmi0: hdmi@7ef00700 {
@@ -136,6 +181,9 @@ examples:
                     "hd";
         clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
         clock-names = "hdmi", "bvb", "audio", "cec";
+        interrupts = <0>, <1>, <2>, <3>, <4>, <5>;
+        interrupt-names = "cec-tx", "cec-rx", "cec-low", "wakeup",
+                          "hpd-connected", "hpd-removed";
         resets = <&dvp 0>;
         ddc = <&ddc0>;
     };

-- 
2.34.1


