Return-Path: <linux-gpio+bounces-6576-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F21A08CC3F3
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 17:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 212921C20E56
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 15:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA69529422;
	Wed, 22 May 2024 15:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPppyMsJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF642574D;
	Wed, 22 May 2024 15:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716390983; cv=none; b=BrZ68vWc02Pc91zZl2Gwkle7EoPVffLh2zaajsScg0RCPkGLtAyP2X0YkmUP8Xa0NmSWoJGhQKkjnaE/J9R1j6MT922v1bRaZHU3fGgYVpoFogrtlgZ/ZrMyIHWF+4A1GCW8ILcOUP73Uc+qFLE/VsT7oJD/9iF55JWJ/Kiaa04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716390983; c=relaxed/simple;
	bh=EI0HTnk8GGjk6iqjpuIdqvCDyPO+TCTJmp5zSzG0huU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZAntf36WtPXjkcNTsz/YjtAFShimS9aCycnbUKF1p/XhTSk7XIBJ9ms71POrXH34tESbXQK0SGU1eXiP/l5mlF92G7yQYUA+7R23ACLn26uJBFzW+Jw2uQ/vZmax/GsMfe/OfLCM2dYcs6DbYQs/ybkWu/ShutFDTdWTgrN8VTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPppyMsJ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52742fdd363so592798e87.1;
        Wed, 22 May 2024 08:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716390980; x=1716995780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=roXuzAP03ERlPT/E+g7wXJxWMv9lSxxfHo4i6eclxyA=;
        b=hPppyMsJx4dhjxGqou4bhBjLf3ep/UCoHlE+ZAMYqNcthTdUs8gdk/2Dl9HvFOj+VB
         LNGhjFxfCRtIkjyoXQX+gdt7Se+BTjb0Ki8bKXgxA8jN+oOSpHlxXYaAWYUHJNwKfA6z
         +ZaSNJ5MJ4Bx0xiYBWMdqam1FP5hOd/xYLqMH2Nf07zsG5VwCWdaNwwIlYgg38YioRCr
         j3KG4hMIDW82ZO3qbkd9sny+8W+ogydfFF9aIXbvxQE7NatMlWXBiVh6W/VUo1gyLjzO
         NuLx0X9RQTe8m7OfKh2zukn4VwcDOT5k9rXE/L1WYvEFlKI24MU+gyp6vupI8dkNYR5c
         BnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716390980; x=1716995780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=roXuzAP03ERlPT/E+g7wXJxWMv9lSxxfHo4i6eclxyA=;
        b=Vb9RZmckvPv+tbkg3X3ohVn0YNVs2uigxNKFZ3PHLpQSwMsjAmiJsp1g5X57MvGrdS
         8EShCAgLzU0xG85KXcQS2lL2PZTicTGXeElgkpiPJeoBLJqNycvIJP9pccdauu9xhSpV
         Mt44xzg40iZPQyYOlJ94R/32brLayQrI49OodTrZPXVbFrqP9N9C3ufZVv0zadwZBjHx
         h3LzJKv8ppxwMiN3g2imk8GF8Hz1g1Nzi3EeRFVv7E0z6IZFTzCLTiXSQP3PsFuu5dYo
         7KriqjS4Oe+LCAHNhbN6/OAFcgDg8T2PWqqlXgb37zPyIvHa+JZnBAhnuvpWDZJ4Hc7+
         lN5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbcfDB/wXppFuAC2RpiWRWtcLqV7zls4Nj4vEFh5q3/li+u+BiCSeZSXm9O8mh9/xQllQsyQDulG+HF/tzttgS+9joCR1baIAXxjtSHIXyQTw3S9d8bmUMiiUmwZEiK1szmupZRzXg5Krs0JuX+PRASblkniC2T28QnlCfbaM4hEe6QlQ=
X-Gm-Message-State: AOJu0Yw+FWnstLylBbSVINoCJO296/pfwi4eeN3iIOd4AYYI2vM0hyHK
	rO00zRmG9/B2h9e0avAQLj85L3wwrXbBl3MacxwZ0u++YQ8BINBL
X-Google-Smtp-Source: AGHT+IEHZB1bTFFnwygf0GprRyBd/WmnlMoYX642oxz0uKZTkPF6xjNsqg/DDepqC2ncSek6hdG3rg==
X-Received: by 2002:ac2:57c2:0:b0:51a:c913:a9ce with SMTP id 2adb3069b0e04-526bf642cb9mr1366242e87.50.1716390978862;
        Wed, 22 May 2024 08:16:18 -0700 (PDT)
Received: from pratik-IdeaPad.lan (customer-145-40-29-195.stosn.net. [145.40.29.195])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-525e6cb5ed4sm335634e87.247.2024.05.22.08.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 08:16:18 -0700 (PDT)
From: Pratik Farkase <pratikfarkase94@gmail.com>
X-Google-Original-From: Pratik Farkase <pratik.farkase@wsisweden.com>
To: 
Cc: Pratik Farkase <pratik.farkase@wsisweden.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pratik Farkase <pratikfarkase94@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] dt-bindings: gpio: lsi,zevio-gpio: convert to dtschema
Date: Wed, 22 May 2024 17:16:13 +0200
Message-Id: <20240522151616.27397-1-pratik.farkase@wsisweden.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Zevio GPIO Controller from text to dtschema.
Adding `interrupts` property fixes the following warning:
linux/out/arch/arm/boot/dts/nspire/nspire-tp.dtb: gpio@90000000:
'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'`
while executing `make dtbs_check` on Texas Instruments
nspire boards.

Signed-off-by: Pratik Farkase <pratik.farkase@wsisweden.com>
---
Changes in v4:
- Updated commit message to describe addition of `interrupt`
property
Changes in v3:
- Updated relative path filename to match actual path filename
- Added `interrupts` property
Changes in v2:
- Renamed file from `gpio-zevio.yaml` to `lsi,zevio-gpio.yaml`
- Fixed the space indentation in example
---
---
 .../devicetree/bindings/gpio/gpio-zevio.txt   | 16 -------
 .../bindings/gpio/lsi,zevio-gpio.yaml         | 44 +++++++++++++++++++
 2 files changed, 44 insertions(+), 16 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-zevio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/lsi,zevio-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-zevio.txt b/Documentation/devicetree/bindings/gpio/gpio-zevio.txt
deleted file mode 100644
index a37bd9ae2730..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-zevio.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-Zevio GPIO controller
-
-Required properties:
-- compatible: Should be "lsi,zevio-gpio"
-- reg: Address and length of the register set for the device
-- #gpio-cells: Should be two. The first cell is the pin number and the
-  second cell is used to specify optional parameters (currently unused).
-- gpio-controller: Marks the device node as a GPIO controller.
-
-Example:
-	gpio: gpio@90000000 {
-		compatible = "lsi,zevio-gpio";
-		reg = <0x90000000 0x1000>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/lsi,zevio-gpio.yaml b/Documentation/devicetree/bindings/gpio/lsi,zevio-gpio.yaml
new file mode 100644
index 000000000000..37df0e6cfec5
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/lsi,zevio-gpio.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/lsi,zevio-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Zevio GPIO controller
+
+maintainers:
+  - Pratik Farkase <pratikfarkase94@gmail.com>
+
+properties:
+  compatible:
+    items:
+      - const: lsi,zevio-gpio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - gpio-controller
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    gpio@90000000 {
+        compatible = "lsi,zevio-gpio";
+        reg = <0x90000000 0x1000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
-- 
2.34.1


