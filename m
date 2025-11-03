Return-Path: <linux-gpio+bounces-27970-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F705C2DD25
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 20:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95763189842E
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 19:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02B931E10F;
	Mon,  3 Nov 2025 19:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v0LAccVM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210B4208961
	for <linux-gpio@vger.kernel.org>; Mon,  3 Nov 2025 19:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762197288; cv=none; b=VaSZY/+JqBlPxvNHGiG7Bem3lkRMWF06Plj8gPBGY0SYlsaD4v0UBPL8jculMf7+yrrViYmepMdSU+vjRDhjU1sZMxtoNeyIWrsgmakbRgxcJH0bWp3M7CD6iP8ToLd+vzVHSwQUNNqkXz0ffE3nuNhXHR0roQyDDqNgHRdOWgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762197288; c=relaxed/simple;
	bh=lqdgY6BOgEM0MSE1qQYoA5gcxwHEAGdkNfh5pQ5Ugyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MjatAEoddmqqqYkzquopceI5TavNShc08Uvwu+jOENnpy/D0psE9Jq03qou2U6eRx2uixt9qtHjW8CX+sgO+GWwb8G1757iP25VDI/DP40c/5ey4keUCD2q9PGM59k3a1WQreLCz/N6mNmbzmvzM0t+905vq1r02NfG9IC71vzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v0LAccVM; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6399328ff1fso8153027a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2025 11:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762197284; x=1762802084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GTKN9/O1c47+H1XzJitpyv+Yeo6U9P5xhhUdsqBw8y4=;
        b=v0LAccVMUJM/1Lhuy8H7m82gJ2e0JXZLVkSqrIXUfPtgwBcG6OEs8YeVYIhpXx8gxy
         Rkp08Z1adsfi3JioTzh6fDzXCsC33nOpfSEKulDbE1XygYIDtivKmFwe/ixHR7oB+mPg
         yI24cn4WiTl4cQKDsX1oeaYNs4OwxHd4jq/2q16qvhGMiJMmw82+zmQfLsJpvlr54lJR
         kU6HNI3Xhgt/qfoQpWNyYWkCd322tI0DtuK+GHyCeCB3vKxCt43P8kDxGhHIkyZyKnvP
         O/6S/Lu1xuLFoqZMkaerfrDH7j5rZ0WrU/h4QHFuctIfT/B/jQhNajQAp/Q9/MdFx27i
         BOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762197284; x=1762802084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTKN9/O1c47+H1XzJitpyv+Yeo6U9P5xhhUdsqBw8y4=;
        b=VnBv0SRq8dWuTmMyJn3S9MY7MeOI2uIeIfX3Hfa+ZyXDb+eg5WCGzD0sLLqrHO6tQs
         lqDpWDb81xDVo5b9mzQIqjS8BAvwnMQYv8RHO9avcefAG8HdKqRZrd0EoTOyBot7+TIZ
         oLOIT2KOB5IPuWL3DB9bS3l4WJy01YpMv2Ofe68dF9pPiUU9eJG8U5lYWtaimw/OQc2F
         dFtKMyXu3brELmnuLjDzAsEWRy/j9om+i7MMgJL9CiXNAgJ+RQL/i7ZE+O0R8IHKg/cM
         a0w9nKvkM2sSjJjAwd392wFojNCwfwrDv3QnhWvUGxnu6c3UYTdYhhImK2jK/qzcC9ZF
         RzYg==
X-Forwarded-Encrypted: i=1; AJvYcCUKK5glS/2I22Wb0n+VBrqG16gUOXv41T3sxBwMrgWzVD0DE2SZFhr5adxXMk4/SwUFiqYKgq9Ow09u@vger.kernel.org
X-Gm-Message-State: AOJu0YzoSSi9OtKtptx5b4Y6QpayRjHpB59Lg1BdxkkG8WE+Cd8TO5zg
	xaDyQp7lBGb2Hu6Ub21UxQQ+ndGbJAYr1RPDGRkMAQLzvkfd7SyH6dNKP4Jw00DhCd4=
X-Gm-Gg: ASbGncsZ61Pl0BrMm+dYI2otnt39yNridWyDMr67MYJvDP0n7NFItctKItfYDzngbmA
	63TFTdI5TtUN1q+CUe8Q4ICHy0DZ2bsdhvBngPcVG59OVgtGlERSFDlBfmiyDbHj7Y7m7F2UhmC
	U6Yuq+N6zvrbOYbz6VgZ1FJUKG13sdDUyKhH7UqTC8biQXgI//U+UUST3+Nvx14MjoYFNoIyDKp
	/G7f7P4B4I2JDUXMpTdc2ta55RM3tUNqDDcjQU+Pu8GatmuHrpvQhXUvUQOny4GLGm/F8YpJw3c
	bWc9lMf9avJ0iizQy/BFGgP4R88H52c6L2QUFHa87Uz6iaoRZSM2BAsrfv9f00krD3khFW87Xu/
	w0B+GHih1fJWzojwEbKKeaufqiCpNzh7PBPVLi42/OHJv7eDWlkyNBHfx1ImSZI8UYjwbO/BjnN
	ahRCHp4Ai7HQz7gnzQCvkxVtYI/Makwbfr90NEF1fYOdaXLV6NHNjZcksUlZZb
X-Google-Smtp-Source: AGHT+IGA0IgJWdETPjRFY4ufrePSVxtNNcQgcMJG5R1wwf1lSlcwEdU6CoGHlzpUg2mpWH4wh3mzsg==
X-Received: by 2002:a17:906:fe06:b0:b40:6e13:1a82 with SMTP id a640c23a62f3a-b70701c01bdmr1397251166b.26.1762197284381;
        Mon, 03 Nov 2025 11:14:44 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b9f29c8asm466765066b.8.2025.11.03.11.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:14:44 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 03 Nov 2025 19:14:41 +0000
Subject: [PATCH v3 02/20] dt-bindings: mfd: samsung,s2mps11: split s2mpg10
 into separate file
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251103-s2mpg1x-regulators-v3-2-b8b96b79e058@linaro.org>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
In-Reply-To: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The s2mpg10 binding is going to acquire various additional properties.
To avoid making the common samsung,s2mps11 binding file too complicated
due to additional nesting, split s2mpg10 out into its own file.

As a side-effect, the oneOf for the interrupts is not required anymore,
as the required: node is at the top-level now.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
Note: checkpatch suggests to update MAINTAINERS, but the new file is
covered already due to using a wildcard.

v3:
- new patch (Krzysztof)
---
 .../devicetree/bindings/mfd/samsung,s2mpg10.yaml   | 46 ++++++++++++++++++++++
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 29 +-------------
 2 files changed, 47 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mpg10.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mpg10.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..841b7c8ab556bc6a3d4cc8d5a0c811814d4176be
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mpg10.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/samsung,s2mpg10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPG10 Power Management IC
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+description: |
+  This is part of the device tree bindings for the S2MPG family of Power
+  Management IC (PMIC).
+
+  The Samsung S2MPG10 is a Power Management IC for mobile applications with buck
+  converters, various LDOs, power meters, RTC, clock outputs, and additional
+  GPIO interfaces.
+
+properties:
+  compatible:
+    const: samsung,s2mpg10-pmic
+
+  clocks:
+    $ref: /schemas/clock/samsung,s2mps11.yaml
+    description:
+      Child node describing clock provider.
+
+  interrupts:
+    maxItems: 1
+
+  regulators:
+    type: object
+    description:
+      List of child nodes that specify the regulators.
+
+  system-power-controller: true
+
+  wakeup-source: true
+
+required:
+  - compatible
+  - interrupts
+  - regulators
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index 31d544a9c05cad878d10a0ae9b99631f08eb04a8..ac5d0c149796b6a4034b5d4245bfa8be0433cfab 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
@@ -20,7 +20,6 @@ description: |
 properties:
   compatible:
     enum:
-      - samsung,s2mpg10-pmic
       - samsung,s2mps11-pmic
       - samsung,s2mps13-pmic
       - samsung,s2mps14-pmic
@@ -59,42 +58,16 @@ properties:
       reset (setting buck voltages to default values).
     type: boolean
 
-  system-power-controller: true
-
   wakeup-source: true
 
 required:
   - compatible
+  - reg
   - regulators
 
 additionalProperties: false
 
 allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            const: samsung,s2mpg10-pmic
-    then:
-      properties:
-        reg: false
-        samsung,s2mps11-acokb-ground: false
-        samsung,s2mps11-wrstbi-ground: false
-
-      # oneOf is required, because dtschema's fixups.py doesn't handle this
-      # nesting here. Its special treatment to allow either interrupt property
-      # when only one is specified in the binding works at the top level only.
-      oneOf:
-        - required: [interrupts]
-        - required: [interrupts-extended]
-
-    else:
-      properties:
-        system-power-controller: false
-
-      required:
-        - reg
-
   - if:
       properties:
         compatible:

-- 
2.51.2.997.g839fc31de9-goog


