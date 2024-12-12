Return-Path: <linux-gpio+bounces-13837-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A517F9EFB1D
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 19:36:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FC13283421
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 18:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA72223C7B;
	Thu, 12 Dec 2024 18:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="NSjBiIw3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29C8223328
	for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 18:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734028604; cv=none; b=lc0dLDxo+0byzav3jxaYar0o2P+VzLPZKnK09FlA1rINvG31L8ZDIUcqZed8ayZFXZM+DEr4RpiKsoCwdHTRJSF29G/o61MqDvog+/7wYyJMPQkRsbkS6YFb36AbgQI4cz0G+oPvhDWNGYL+RHqpqCXwZbuW6UMnlIufgruxsBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734028604; c=relaxed/simple;
	bh=cb6Tk6wcQrIhyxtV/mlHSUiE3Km8qExqIyZ9hnXm4oU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BVM3MmmfABK/ZyxEsvTOg24RcwIOXwAM4cPhe9+cPugllXlNwUpMO00hltTmz87P24RptqT7GgkNA6mX3SBjngy6qJjEYhb35swDs93lPml6uJTJRtIprpieydhVKfzwcrQUVKlp1JP6J+UN0d+wEgrxdpYuTQd6rJwnYh+ezg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=NSjBiIw3; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436281c8a38so4174345e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 10:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734028601; x=1734633401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sw6ds3OYrX9qZTskII5utnH0CDhwWN9CZmERg/3tjRI=;
        b=NSjBiIw3rvrTIcUi0bD5nusPBseYgUMIn5J/Dd5yroAtW4g/PW80toFukL+DlaUowo
         18LAEXg5A7jYRIX+3v+wGq5p/cjt9G/LmkXiJqTa6J7k7BGL0TL6CTHBcTCIpxSbGrLJ
         kQ3KlqRJE6b5T2UIre18igRrCxd7q91Wa5XXSM0gTUwBDHfy0fXjX9qauUzHNi0LtX4k
         zk9i2fTLUySVMBsmEnA7GYK7P4zmEuFJlcxpLVGXS0ww6H/1OY3PzxAP02BSk5KCAvhr
         cIbtAv5xtBOe+LmGgZyQhD+jGGgy/IY+h9MI5/P55+s0UZ44kUaJTEk05E+ZvIVBkgkB
         yDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028601; x=1734633401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sw6ds3OYrX9qZTskII5utnH0CDhwWN9CZmERg/3tjRI=;
        b=T6+w/T0ahFBDIYjk6U4mUPj2ipyG72uUj35Clr/PCU4eOCs9lgECqID3PggtLxDjgo
         eMajfqwfIJr1WDNaj4asxrDdEBxua2HcT0PGbyAeQGGryNlF0tkfOLhSkPyCi7xQdaC7
         DXN9YslAT6MRpG6pb5Uw8YslJk+dKcumAKJ690jMp29Fa7LxMpZzN7DBx6vyPTz7Y0DO
         YzT93rMhgsRc7mUT7BhTpU7Hm5TB94aj7wE5PlTL17ae0KP8r8UBuB5lyBRuuU0FblsB
         9hUE5VBlIjnlQaSScoHhhP6N80MC2L/BhxcPfObPhHO0oDvswu1iGQksHTgbWZUGExEY
         6osg==
X-Forwarded-Encrypted: i=1; AJvYcCW+OULvOJtUBU0M9ku2EcujrRIPqcp3hAsxDHT8G54N/WtwQnatVCBlck9zY9cu2+MJ+rbQsS89nWxt@vger.kernel.org
X-Gm-Message-State: AOJu0YxpdcnSZAKc5ugsslNWPyACtZeXoIM0g9QG6QRTQsCkGtScTTON
	R/fxeyyp78o5HfxWWyFlKAn3wyMpV7IZNWgkC8naPocaNCok5QnGzxIsH4tEX1g=
X-Gm-Gg: ASbGncu4rVa7hLSyTWBB+NtFxU5CZkzkzHGKkXBSqKHndYr8LP/Wv+wxyq7tNhANZu6
	0EMDAsGw4J3fSM3uF+ZOdLVQo2ZIHFDvx2rvj0J59mlHEIGwC6VpvaJBX7drb6wY8t08LITyS2N
	T/ghZ9Rpjy0A6T7RgdYcQj8L08tBnpl/owEclWV+lSfZhpbnAu4nXOhGr7xKCXGqyYg7E5I88I1
	91Cq/7iko2HSMTcD3fCj7UTbRNmbWiONHNTBumLjsG/d1e4
X-Google-Smtp-Source: AGHT+IGgVpkk1QUs/pq3VjaphhAJz/7+ivfj+5RpPlXI4jycscQ8dQXMYYBv4ChFADcllhzmrrBmNA==
X-Received: by 2002:a05:600c:3b13:b0:434:effb:9f8a with SMTP id 5b1f17b1804b1-4362284264bmr44025395e9.15.1734028601307;
        Thu, 12 Dec 2024 10:36:41 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436257178e3sm24651995e9.41.2024.12.12.10.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 10:36:40 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 18:36:28 +0000
Subject: [PATCH v3 1/7] dt-bindings: display: bcm2711-hdmi: Add interrupt
 details for BCM2712
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v3-1-44a7f3390331@raspberrypi.com>
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
index 6d11f5955b51..dd7dea60183b 100644
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
+          - description: CEC TX interrupt
+          - description: CEC RX interrupt
+          - description: CEC stuck at low interrupt
+          - description: Wake-up interrupt
+          - description: Hotplug connected interrupt
+          - description: Hotplug removed interrupt
+
+      - items:
+          - description: CEC TX interrupt
+          - description: CEC RX interrupt
+          - description: CEC stuck at low interrupt
+          - description: Hotplug connected interrupt
+          - description: Hotplug removed interrupt
 
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
+          - const: cec-tx
+          - const: cec-rx
+          - const: cec-low
+          - const: wakeup
+          - const: hpd-connected
+          - const: hpd-removed
+
+      - items:
+          - const: cec-tx
+          - const: cec-rx
+          - const: cec-low
+          - const: hpd-connected
+          - const: hpd-removed
 
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


