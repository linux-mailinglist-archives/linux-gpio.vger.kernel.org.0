Return-Path: <linux-gpio+bounces-21081-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E40AD047D
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jun 2025 17:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4A1E3A5BD2
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jun 2025 15:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45B9289826;
	Fri,  6 Jun 2025 15:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qCc9zrTZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDF1289374
	for <linux-gpio@vger.kernel.org>; Fri,  6 Jun 2025 15:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222200; cv=none; b=QCyv6mQp9hYPa8RXqvKjcoNNizkMSQ79Ui94t+y8kUkeFNZguFdnU4L9bzMCzkbd7gq7hSlWJjepgjnDgkKl/k2L2Beqh/a2GLBpCHG5YOUp/Jm98J6e4eowVNGc4In80dBB5SjhUXxQ6o7xAU34byGwWVxVsUHrMOLTqe7/bS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222200; c=relaxed/simple;
	bh=s3mSTfiKouX/DXZqGMbD6vxo0PP5K4YwGopbgIII0PU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h0M2hwKFkrOa62swIvSA1UzyWBOusNfJ0hobXTWXElEoIlcJW7/OC8d7H0FoylEOeBJBteM8vjphJhmiyuOHqD3mxk4PNUDacjRh9Gbcc5uwKiB6r4UWUGagnK0ML0VNDR+Gk5MFDouTu7v0u2vKzmlOhk3WSulGyd447bAkIUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qCc9zrTZ; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6071ac9dc3eso3522674a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Jun 2025 08:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749222194; x=1749826994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hw33Rl+thTuvgJB34fURNPMx+D4YtoSUdiE6dWyoZ50=;
        b=qCc9zrTZUy+jC1tXAdLtxAeJ4gW1DtYGWMzEaslr52+d6b3AmYMSWKceoPajTCLIny
         D5dbExTZ2doxdE7gfrpkPSWe6hP/aKceQvYKcKseeDmjI2Yuv/tKAuCgAKmUXjpw8p8N
         oAJFMaNPOZwHF5vXL65RAs+gV5YtcxrPH3SwluArm+jbY6+gHKGS+1gNwCrL7XQq0sEt
         nFC+Ty/1/yfrSiCbWTdKhy2VS3R2dE1d5fD0LeevpOV9cp97+LJyzTPvYf5epoNVi/oK
         JEryjrUYKq1iurHJetyHkTfWHwGzwxjqKIWyv4RrC0ZSdfQ8sIDfWn2WVBhECokn15IJ
         gUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222194; x=1749826994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hw33Rl+thTuvgJB34fURNPMx+D4YtoSUdiE6dWyoZ50=;
        b=a1H9g52e1MeWWaWBb/7biSEAOEorSkn6Vz5iUyKdNyP2hVO4C6qnIp3Gy7F3K0OHYf
         mbFxAxmt9jP29Z2Nz9WUiHIL6jqkbu33axBpWBAeQBpgELJ168EUYMoN9S4BTwHMjZg0
         P9v8ym0kuGWA56RRQ+2+OnkdsLVujVrawNPkIDGTZzLt3DHyhwORR4+D7jDqMVFxeDS+
         aX4jKTv3cSGj9RKzkX8mynWnftXNrgB7kKiW6NlQeGCsDre07ALvSjc2Zp66XW/5TQUh
         1pEIaHCN5PbPTzmwoMOaOG+ZgQitFNGGJKeU4+RwcWDlxAYHEmcbfOvEN0H9AMUglD/c
         2zeg==
X-Forwarded-Encrypted: i=1; AJvYcCXx7s6AeDn6kh/lEVXILr0xXluhgsNEGfOKw54mOniZ6pa5zJlRRwReDZcxpgLMvzM2J0hK+/XyZX+K@vger.kernel.org
X-Gm-Message-State: AOJu0Yx41g0v6alLld/DyWYqfLvzSDSC8AbEz2trvf/yAPOaVc2/VUXl
	meM0rJYcu0sPbMq3iI88si6kLZPlWn+EDf3tUkRL0xRBMMaAfKZyv1sFFbdsF8LH2lI=
X-Gm-Gg: ASbGncv123zqO0FWNodiiLHHHgfoMkY1D3/S+3ExkrpIBV+Tbir7nsQMNjxPZLZtQmW
	CLmacneIlODLjctth8ktUu/ez1v9irpsgiI4IsFlwXhFUNWRYVYPYqXrTbTZOc1zwLdj+84HdbG
	8uLPuZ9tSw64osNs8YRlEOxopVsQdk4Ms7YuX6ozqKL8OCtpMlZ4Nc0W5RWbQzcgwX6YHlAnu/X
	WNj86cITHZGLmNdTbMm+DNlBFhRLwt8BPXYB96TDt//lJlt6x3EXrjD5IYA9ujfsSfvDuhQlihX
	8dDLic4Vqc1TPW+JqRcsZrSuXa+IsLZFjPZ5zoAUPblk4DR6NQSaxVktgujiEZ+DBduiPyv7jf+
	NBHCb22eJLk7MXnOxmuKy7MD5Ur7dZx7NPLB4rCtNUJylWA==
X-Google-Smtp-Source: AGHT+IHbWi8jsL6tIHBW7of/W9kUs+W2SnVGPOjs734Ix0yZ3GKT9YaBdqKy5cjONZI5b7CnH58irQ==
X-Received: by 2002:a17:907:5c1:b0:ad8:8efe:31fb with SMTP id a640c23a62f3a-ade1abc5eb0mr323702866b.54.1749222194282;
        Fri, 06 Jun 2025 08:03:14 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc38cf2sm127735066b.121.2025.06.06.08.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:03:13 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Jun 2025 16:03:01 +0100
Subject: [PATCH v2 05/17] dt-bindings: mfd: samsung,s2mps11: add
 s2mpg11-pmic
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-s2mpg1x-regulators-v2-5-b03feffd2621@linaro.org>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
In-Reply-To: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The Samsung S2MPG11 PMIC is similar to the existing S2MPG10 PMIC
supported by this binding.

It is a Power Management IC for mobile applications with buck
converters, various LDOs, power meters, and additional GPIO interfaces
and typically complements an S2MPG10 PMIC in a main/sub configuration
as the sub-PMIC.

Like S2MPG10, communication is not via I2C, but via the Samsung ACPM
firmware, it therefore doesn't need a 'reg' property but needs to be a
child of the ACPM firmware node instead.

Add the PMIC, the regulators node, and the supply inputs of the
regulator rails, with the supply names matching the datasheet.

Note: S2MPG11 is typically used as the sub-PMIC together with an
S2MPG10 PMIC in a main/sub configuration, hence the datasheet and the
binding both suffix the supplies with an 's'.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
- add | to vinb*-supply description for better formatting to mark as
  literal style
- mention GPIOs in commit message
---
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 70 ++++++++++++++++++----
 1 file changed, 58 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index 0b834a02368f7867a2d093cbb3a9f374bb2acf41..a6a10d23a480b460c66be2df5bfdef5ea3024ce1 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
@@ -21,6 +21,7 @@ properties:
   compatible:
     enum:
       - samsung,s2mpg10-pmic
+      - samsung,s2mpg11-pmic
       - samsung,s2mps11-pmic
       - samsung,s2mps13-pmic
       - samsung,s2mps14-pmic
@@ -70,21 +71,46 @@ required:
 unevaluatedProperties: false
 
 allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            const: samsung,s2mpg10-pmic
+    then:
+      properties:
+        system-power-controller: false
+
   - if:
       properties:
         compatible:
           contains:
-            const: samsung,s2mpg10-pmic
+            enum:
+              - samsung,s2mpg10-pmic
+              - samsung,s2mpg11-pmic
     then:
       properties:
         reg: false
+        samsung,s2mps11-acokb-ground: false
+        samsung,s2mps11-wrstbi-ground: false
+
+      oneOf:
+        - required: [interrupts]
+        - required: [interrupts-extended]
+
+    else:
+      required:
+        - reg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mpg10-pmic
+    then:
+      properties:
         regulators:
           $ref: /schemas/regulator/samsung,s2mpg10-regulator.yaml
 
-        samsung,s2mps11-acokb-ground: false
-        samsung,s2mps11-wrstbi-ground: false
-
       patternProperties:
         "^vinb([1-9]|10)m-supply$":
           description:
@@ -112,16 +138,36 @@ allOf:
               vinl14m - ldo21m
               vinl15m - ldo10m, ldo22m, ldo26m, ldo27m
 
-      oneOf:
-        - required: [interrupts]
-        - required: [interrupts-extended]
-
-    else:
+  - if:
       properties:
-        system-power-controller: false
+        compatible:
+          contains:
+            const: samsung,s2mpg11-pmic
+    then:
+      properties:
+        regulators:
+          $ref: /schemas/regulator/samsung,s2mpg11-regulator.yaml
 
-      required:
-        - reg
+      patternProperties:
+        "^vinb(([1-9]|10)s|[abd])-supply$":
+          description: |
+            Phandle to the power supply for each buck rail of this PMIC. There
+            is a 1:1 mapping of numbered supply to rail, e.g. vinb1s-supply
+            supplies buck1s. The remaining mapping is as follows
+              vinba - bucka
+              vinbb - buck boost
+              vinbd - buckd
+
+        "^vinl[1-6]s-supply$":
+          description: |
+            Phandle to the power supply for one or multiple LDO rails of this
+            PMIC. The mapping of supply to rail(s) is as follows
+              vinl1s - ldo1s, ldo2s
+              vinl2s - ldo8s, ldo9s
+              vinl3s - ldo3s, ldo5s, ldo7s, ldo15s
+              vinl4s - ldo10s, ldo11s, ldo12s, ldo14s
+              vinl5s - ldo4s, ldo6s
+              vinl6s - ldo13s
 
   - if:
       properties:

-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


