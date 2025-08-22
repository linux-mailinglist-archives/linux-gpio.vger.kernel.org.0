Return-Path: <linux-gpio+bounces-24825-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E50D7B31FC6
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 17:58:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3FA61C24085
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 15:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3875254AE7;
	Fri, 22 Aug 2025 15:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lNe0uM22"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C053F1A9FBE
	for <linux-gpio@vger.kernel.org>; Fri, 22 Aug 2025 15:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755877602; cv=none; b=GDVTzPXJWr1TFHMGH9OHhnOIF9WbNHAiM+uBzEG9n3HGsuCmDEhZcbiSmkVMQW6xn+WTkRXpJCjzViNT4ohGNR0XrAfpDLGfjJevKLAJ0uNMmDBkNXVkWqfhbSpSDBPyaJws489zjSG5Ub6qFb+GwYXhnLiC25dtR/q2+7z+wJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755877602; c=relaxed/simple;
	bh=JArWf2XalW/PNzY8iiMYiBZ9lhJd/olHDvM90enoPRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oz/pFpXlQzD6M4lk8HPrf91IKX5LjNss1KZ5+feeb0JN6at8T6iB14tw30XtFTfv4k/neOtBFR/BjBPfgCkYpvhNALa2hmdwM66EeIsjWGjf7d58MiTqEpchmERCe355hRkjxar6wwSbw83qvGlOZ3AmPo1lXam0PRwXWKGt+hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lNe0uM22; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55f3533fd05so209566e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 Aug 2025 08:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755877598; x=1756482398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z8Y+RQqnLspSTdtkJYmb6U4wCQOh+iuL2r+EIW+zspc=;
        b=lNe0uM22XhWOeknn3aWCIlxQ8d8KznlNK3UTosvBQmVFgsWa64ARsxZJUd94zz01xX
         JnoYLhtGjnxgnV7SzYNXom0zq2ymlIULu6ZtsVLAvkcVlzO4IWXC+S3TiAs0qgLuT8iG
         iIR4nqUjIQJqFayUudFzv7x08EYe1HQIx/yHPXVA6/AfVm6ZckNAeV4gPGMepT5iXLZF
         7PeQ2gAcKhCuj8yUPVPKhu6VSw+SvXGCVw0qHNfw+bYOslqbF439/o1eWDPzdyX/0s25
         gdyu3lX1pIxhuqQR96A06cyIJ3/y5OKubnoL3h4Vqbsa+mC2LxDmBwJoWtx81bD66r4P
         +Z7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755877598; x=1756482398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8Y+RQqnLspSTdtkJYmb6U4wCQOh+iuL2r+EIW+zspc=;
        b=fhcQmKpzRL89kJ2cx2Ee+AYNiEVXf31lv7qS/E3oHFAvRp7jJM4TEHyab8JIQjJx0K
         P42ljFdL006V4bgukmaPscC5ds4Mzkun0I/j0Kh7FpdMPPPtuOPcJTW8Gcg5lc9YYG96
         a+nm1otUq6syrFybyYMaoYTzD6Vh9yJ3PIYiBf7CEmrbfCOQyQKgN3Upf7YOUV1PkHK/
         ooeZxGcBnpt5r5EFhY4LThMgYLSpSXGOOtLUOaqAq7gH+W6Inj9Uvv/CCEfByhwae70N
         mrqVmj6N5i2tD/2MYEDFVeGGI/EU+5/KltwoueRmawg15dH5IWbrefSC/1luhJJgzGU0
         p73w==
X-Gm-Message-State: AOJu0YyHpsHnktvJLUfT4HP9fQ1d0zktx1g+mWrGCKLbO+9rhJzm98WA
	ceztRBctGZd8OcdkeRkIkzeok5Sm79bci9/Y5XO5Ujxpdrn0FMPZ/q6nexqj83+EF0I=
X-Gm-Gg: ASbGncvZUNC+izn7Z1Db1glnQT+E1HviXf3xDV3g8joV+StX2QHjs9KjoOsHkb+geB+
	RzZMgUWc8e6eu25V2D7pqwibOiN9/00vIL6p2xuR92Qif1IGrpVZFhj47NUw11HJlxi6MFf+mxU
	w6U6MxZDIs9TKROTsrRCK/iYkq33BZmmPZLvZbBX96LLSHpF+IPj5j3nU0V6crFFB7m2Q3fpNA7
	2zwhHgk1nkt8Q4smD5RoyV+uTAsLNFfhGix02Wk+tCLu9daga8p0FTTBXFxjMEubauUs3uDQQND
	bz5rDZEottlQs9NOGA96eJZR9jT174g8MmSml7ucMi7td7PNUcOV6QirTJXh45pgeSUQcDqvqA9
	feHdmTzDdllXOQoMLCi5owDnTKSuPpqk+
X-Google-Smtp-Source: AGHT+IHL6XXxtiQqU/fb2/g150H117p1R4rEtNRd8M6/8OxqOm9IG+ZC1SmwGXzoJ5Hpl4n5vzifHA==
X-Received: by 2002:a05:6512:3e04:b0:55b:7e31:c13f with SMTP id 2adb3069b0e04-55f0c6b989dmr1405134e87.19.1755877597737;
        Fri, 22 Aug 2025 08:46:37 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e5d1a6fsm56541fa.49.2025.08.22.08.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 08:46:36 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 22 Aug 2025 17:46:27 +0200
Subject: [PATCH v2 2/3] dt-bindings: gpio-mmio: Add MMIO for IXP4xx
 expansion bus
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-ixp4xx-eb-mmio-gpio-v2-2-bd2edd4a9c74@linaro.org>
References: <20250822-ixp4xx-eb-mmio-gpio-v2-0-bd2edd4a9c74@linaro.org>
In-Reply-To: <20250822-ixp4xx-eb-mmio-gpio-v2-0-bd2edd4a9c74@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

This expansion is a simple MMIO-mapped GPIO device but the bus has a
number of additional properties that we need to bring in using
a reference to the bus child node schema.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/gpio/gpio-mmio.yaml        | 30 +++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
index ca32317dff85bc72aace6638dabbdd91de5e569b..b4d55bf6a28548534f35ca8af22d18a596c6d2b2 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
@@ -22,6 +22,7 @@ properties:
       - brcm,bcm6345-gpio
       - ni,169445-nand-gpio
       - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
+      - intel,ixp4xx-expansion-bus-mmio-gpio
 
   big-endian: true
 
@@ -89,6 +90,14 @@ properties:
     description:
       If this property is present, the controller cannot drive the GPIO lines.
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: intel,ixp4xx-expansion-bus-mmio-gpio
+then:
+  $ref: /schemas/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml#
+
 patternProperties:
   "^.+-hog(-[0-9]+)?$":
     type: object
@@ -102,7 +111,7 @@ required:
   - '#gpio-cells'
   - gpio-controller
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -132,3 +141,22 @@ examples:
       gpio-controller;
       #gpio-cells = <2>;
     };
+
+    bus@c4000000 {
+        compatible = "intel,ixp42x-expansion-bus-controller", "syscon";
+        reg = <0xc4000000 0x30>;
+        native-endian;
+        #address-cells = <2>;
+        #size-cells = <1>;
+        ranges = <0 0x0 0x50000000 0x01000000>;
+        dma-ranges = <0 0x0 0x50000000 0x01000000>;
+        gpio@1,0 {
+            compatible = "intel,ixp4xx-expansion-bus-mmio-gpio";
+            gpio-controller;
+            #gpio-cells = <2>;
+            big-endian;
+            reg = <1 0x00000000 0x2>;
+            reg-names = "dat";
+            intel,ixp4xx-eb-write-enable = <1>;
+        };
+    };

-- 
2.50.1


