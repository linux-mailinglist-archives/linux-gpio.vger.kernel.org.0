Return-Path: <linux-gpio+bounces-24610-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E75B2DA70
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 12:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E15B5726C58
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 10:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6FC2E2DFE;
	Wed, 20 Aug 2025 10:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CmFrZs59"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644AD2E2DFA
	for <linux-gpio@vger.kernel.org>; Wed, 20 Aug 2025 10:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755687592; cv=none; b=kp05b9rwt5yobI2eHGb/+5/ESvXNzxaknmnxjTffJsGrQzA27gNzmkBCypuK8nn6Cgl5rKH9yj0aCQWdWfBog+9GYFuRZzFmN/Cizappz2FIK/5o9H3CYl+pnym+PI8iT8gmK4pvKv2BNT4EG/sChF7fQf/H13jTgH+kQwAiz/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755687592; c=relaxed/simple;
	bh=XM4zIAAvseoRQO7OpulfXeLDpQmgjMtT0KnBIZKUP3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kc8NezALyNdT5zbiQVZEsq8L1Tdy4MhWeEV4H1jRojgrx8EM72r13xFHtXMy9thXGaOfwwBbbxH1+4jr5D3Qx/Wphqw1STKqUgF78idU5wH53tsAoTmQ0+F8wRIiAxE2bebnuStxoMWNHPZztPemDzrsYLfwKsXRWCZ3SaoqZX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CmFrZs59; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55ce509f80dso6351317e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 20 Aug 2025 03:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755687588; x=1756292388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YznYINJyZXwaM/A6206H6PVqjIXIV9RM0H2nhFHc/vw=;
        b=CmFrZs59zs3bHBd+Fnlf39jtXUFUAwWAx1bWC2K5WdgEhmdfXgbvG0jz5Ak2bBXdR2
         GSnipURw4XexUZgCb5i1DS/RKBiiRAxCEY6p1cXAYUQikTXrq0KslsS71m8baKnXm8vc
         Xcq1vB2H3GohjHUv+44Nfqt3dOt4VKcQ+0Vhs9bxumlXVHRxJBXQZHkiFh8brSzyfSlA
         wzQXNxOBFbFhl9lmARFOhLkDd/bSgOglQ9aBTyrguJwVLjCR4dYR3Izo73Lk0keDgbGc
         8EHn0OedigTckuEmdQNzQMwk+D3D6t0woqx5G2paxoXoBqHPPqbTlfrjQHQgJ7GgymO/
         bhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755687588; x=1756292388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YznYINJyZXwaM/A6206H6PVqjIXIV9RM0H2nhFHc/vw=;
        b=FBpBYdP2te0ZqBtUMf8+9yzJbwgGGDlkrOq1zx1NIovqEB1BF7Yhs24fMVd63mkrFB
         ooDWcpRIdjvC/8EJcg6DKCM+DM1BPgPviGa+qQFv3DBSbC9QJRuz3A3Wc+6BYomxuwpu
         PRDxEpgczyNFJM4qPGhs6JjQBbQBm/saYZJoPrDvh796sPwOYeqU2rxUMdfD+3O70BHN
         vyr/Mj+Xe4UUwOmoWSlyYKDM8GCZ/DqOkDvFSXpkV6kq0B0PPTFV3BahDhhpz9ibY22H
         KMQvgBsoDEI8aKMpo1RG+idzfEp1FpbX/1HRwUZbWEktYLx5Xk9GY1ybvcY0pdJ2Z09N
         +LoQ==
X-Gm-Message-State: AOJu0YwQT9keoxsQPyPiJaBZgNwEzfsFftrtnr+AY1h03vCPVZxs/HdP
	Ry/eGXd0RwRZ7R8QoPImTtEF84yIo/3WZPsIW5cLq+zLpP1fJ3zEnK0dqQ18AjMIQPU=
X-Gm-Gg: ASbGncvdOLLYPaFPBIQR37XOtTrTxPDaoanJf6gm+kGRjs8x50vDdC9U6OadBMQ2nNI
	TWZauoC5Y2nJE3i+mHiClWSubL0tfwBlvtAFVbz5lums7E+ZQAE+sNnR9tIq30yui1lEILV/oUp
	FqlkzBC6FTL9Dmnt9VCggzfx4Cd7/j6l4QtcSXIt2OQU9gb6Alz/yTG6VggUGu1okfRF67EWIr/
	ydT6A17s6ldKCYsyZWH9VWxSJY8V6wJffwXxGOD9jQaHD4DdzD0eRgddDsEi46yEM9gL74hLO6i
	w7GeyC1fp8DeGyW89db76c1nvtnYFZ3ihk0Mg0IbYXXcRpjPeT5oXdknJPaPYVx2Hu0luoM16JQ
	q/iazCrWZC2bDa5BcUIOSAc7ezjx7Ncy7
X-Google-Smtp-Source: AGHT+IEn6br9SNPzvwlS6Q5dncSg0AYbRVDEjzxQ0rwjQvjT86oq/uzBbjC7exz32rHFcMhrkxidWQ==
X-Received: by 2002:a05:6512:438b:b0:55e:99b:ebe with SMTP id 2adb3069b0e04-55e099b0f0amr278406e87.45.1755687588468;
        Wed, 20 Aug 2025 03:59:48 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef369843sm2518285e87.60.2025.08.20.03.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 03:59:47 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Aug 2025 12:59:45 +0200
Subject: [PATCH 3/4] dt-bindings: gpio-mmio: Add MMIO for IXP4xx expansion
 bus
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-ixp4xx-eb-mmio-gpio-v1-3-0e167398c8ac@linaro.org>
References: <20250820-ixp4xx-eb-mmio-gpio-v1-0-0e167398c8ac@linaro.org>
In-Reply-To: <20250820-ixp4xx-eb-mmio-gpio-v1-0-0e167398c8ac@linaro.org>
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

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/gpio/gpio-mmio.yaml        | 31 +++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
index ca32317dff85bc72aace6638dabbdd91de5e569b..487efab2710e02402ef8ca3e407b6ebc24e3f399 100644
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
@@ -132,3 +141,23 @@ examples:
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
+            bank-width = <2>;
+            big-endian;
+            reg = <1 0x00000000 0x2>;
+            reg-names = "dat";
+            intel,ixp4xx-eb-write-enable = <1>;
+        };
+    };

-- 
2.50.1


