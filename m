Return-Path: <linux-gpio+bounces-13823-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 712729EF1A2
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 17:39:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE2A717A8DC
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 16:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E7D231A54;
	Thu, 12 Dec 2024 16:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="XjL8XaPl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC5E231A27
	for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 16:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734020348; cv=none; b=r7vz9fZpYwoEAjJyJyLvekpVYaSl4pa7qe6T0iD9kVhJQbaBro4+3KwvelsirAAZip6KNb9Mj8strgi0vdaVlJ7myPr4NZvriUQSDRN8Z8G1WSoJjSgCmu4BnIjDRrrwqng/yrkBxa7Z7DruPUDBMHgwZKsOKWd7n+50aCBRGqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734020348; c=relaxed/simple;
	bh=7ND0VHnVmm8LcXHDwESXYMU2C05O2sQs2Pn504aPY3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vz1mD4dgwpqSkWFNTe/Dky4M+eqwuKXY94U7EomqCg9UoGLpOC2S/vbSHnU/Nvn20VaBYcctGR7fEml5+ITqQAG3uTTzgN2xSewXneqwGObtZ2zJT/UMd9gOJTnxRokPSW9DmpogV59OhxdgkqEKpelO7r7PbalqZe7/MK8qBF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=XjL8XaPl; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361f796586so10231275e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 08:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734020344; x=1734625144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6HwzRhtwuck+pMBjZMoVZ4D2FniLRRRufqq2y2rOjs=;
        b=XjL8XaPlNWTlg/sk9QuuyuWirn2v1kM7XFUGyb4SGwwPMDLRWESWrICGjaJTStTKvZ
         eQWwjX7D2nacOsyFE1KHuC80xK5mtw32qHvz5uPTllaFMevZL4c9ouVY704mwgKByx8V
         M5deaW2mmQWMetW5NSh/UrOdJVeXVNWQnF2zHYzStWoQLGTmqDH03PD39BiQndKiK/HU
         t+uIi/sDtvM8cBfeDIH7T7K4cEsuHq7FS2MQug/CcbWo01e41O3nacirSQlsDWx9+S/S
         C7pOL0vPoMxUVV4Iw3QnE87oVhdWLapa08hf53q4Rc5ACGz0ElsrYPpd5TlrfgBtfwzp
         dHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734020344; x=1734625144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6HwzRhtwuck+pMBjZMoVZ4D2FniLRRRufqq2y2rOjs=;
        b=bs6wiH9K2fLnC7QH0RrcOzyDIQ9Wz29kLjDFRVMpG9/LLselv8MmjToS7WOSLgJ8fc
         y1FVn3J8yeU5ngqy7D1QraOH9Enc1mojvQGGZFGCnFTyAp7TeQeOKPw1UxmbHTgSVuI6
         D3/9G0d71ZzD3dcAup77vXa0dMzGprrAJAS7+HkrT60CJCspsSObzI7AeKBYOKMcALUW
         QyyxyOcqLCUzuW50oq6uJViTdHBZmDjXwBK03YpRzZ6SVXuU0nCq6LwGwueXo8TmezoU
         edVxFB+Q5u+KhpNN/gec7IOwYAYBfjbfWHKd7hYE3k8AlKwvqSTsq9w1x2jFQ4un6pih
         ntXw==
X-Forwarded-Encrypted: i=1; AJvYcCXCRHE03UGneIlWnIg5COUmcAolcbcESAdFksIHofbvIIDj8DITQh/LiNx7l0OSWT3vNfBw8wBSvEI9@vger.kernel.org
X-Gm-Message-State: AOJu0YwCvvlJxtglTZSwlWCptuZ3Yy6s7ZXnOEWZlZuS+GdX94OVqhaW
	HibRUvUsKH1oI5MldlkImomBbHCOYfZ0tDz8LGHV+cvx5VZAdVObi3kIWxNtsG4=
X-Gm-Gg: ASbGncuhBWFuwLpeUcjgE5oLF+8zbkCK3BHGsADsJNB8szM7W2BYOq0SEnc3PRR1gel
	cC7HhYpxT6Z1zcJf7sCJ+2fxRX+SjsMu/oXiogO/dCukqXAaPiqfMTPPZIA7GaAbpUZcm4u6yuj
	YPIvzP6GnEO7oaePVmWfaxBFUM/X0KgfWSY0YO0PqWD54/mvUJhG5sBjBxCcn+DIVCYN8FAyTDz
	8VPRhbxKMRmPZnj0KEgenQpLvf21IPXGXzP0Wu7+VdwGMQE
X-Google-Smtp-Source: AGHT+IECJruZQ6LwRw858w1Yxs8MMZZ8ljYIT9r3bgD0QLs1iDMGolWGCI6cX4+UuSx7QkTjWRFBnA==
X-Received: by 2002:a05:600c:524b:b0:434:a781:f5d9 with SMTP id 5b1f17b1804b1-4361c3aaefamr71124875e9.11.1734020344259;
        Thu, 12 Dec 2024 08:19:04 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4361e322328sm44336105e9.0.2024.12.12.08.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:19:03 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 16:18:51 +0000
Subject: [PATCH v2 1/7] dt-bindings: display: bcm2711-hdmi: Add interrupt
 details for BCM2712
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v2-1-35986e04d0f4@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v2-0-35986e04d0f4@raspberrypi.com>
In-Reply-To: <20241212-dt-bcm2712-fixes-v2-0-35986e04d0f4@raspberrypi.com>
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
number of interrupts changed.

Update the schema to include the interrupt requirements.

Fixes: 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../bindings/display/brcm,bcm2711-hdmi.yaml        | 107 ++++++++++++++++++---
 1 file changed, 93 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
index 6d11f5955b51..a7ca3a336187 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
@@ -56,22 +56,38 @@ properties:
       - const: cec
 
   interrupts:
-    items:
-      - description: CEC TX interrupt
-      - description: CEC RX interrupt
-      - description: CEC stuck at low interrupt
-      - description: Wake-up interrupt
-      - description: Hotplug connected interrupt
-      - description: Hotplug removed interrupt
+    oneOf:
+      - items:
+        - description: CEC TX interrupt
+        - description: CEC RX interrupt
+        - description: CEC stuck at low interrupt
+        - description: Wake-up interrupt
+        - description: Hotplug connected interrupt
+        - description: Hotplug removed interrupt
+
+      - items:
+        - description: CEC TX interrupt
+        - description: CEC RX interrupt
+        - description: CEC stuck at low interrupt
+        - description: Hotplug connected interrupt
+        - description: Hotplug removed interrupt
 
   interrupt-names:
-    items:
-      - const: cec-tx
-      - const: cec-rx
-      - const: cec-low
-      - const: wakeup
-      - const: hpd-connected
-      - const: hpd-removed
+    oneOf:
+      - items:
+        - const: cec-tx
+        - const: cec-rx
+        - const: cec-low
+        - const: wakeup
+        - const: hpd-connected
+        - const: hpd-removed
+
+      - items:
+        - const: cec-tx
+        - const: cec-rx
+        - const: cec-low
+        - const: hpd-connected
+        - const: hpd-removed
 
   ddc:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -112,6 +128,66 @@ required:
 
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
+
+      required:
+        - interrupts
+        - interrupt-names
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
@@ -136,6 +212,9 @@ examples:
                     "hd";
         clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
         clock-names = "hdmi", "bvb", "audio", "cec";
+        interrupts = <0>, <1>, <2>, <3>, <4>, <5>;
+        interrupt-names = "cec-tx", "cec-rx", "cec-low", "wakeup",
+                "hpd-connected", "hpd-removed";
         resets = <&dvp 0>;
         ddc = <&ddc0>;
     };

-- 
2.34.1


