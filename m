Return-Path: <linux-gpio+bounces-6475-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ABF8C9FFD
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2024 17:47:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D9D22818FF
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2024 15:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378B7136E2C;
	Mon, 20 May 2024 15:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MosCYrxE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535014C66;
	Mon, 20 May 2024 15:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716220038; cv=none; b=gD+UZJ+YratiyRVJXitIMDEpv4TfoUSm3AXkXzqF+PRUhonDmewzYJuCpSvsRjnUmHt1VlBNHTBDXUQFmSdK+8q/2FfzxDvXI8lc0HbtVFSDawdSq3Wi6fZytOS/w3e64Vm3tYaFHepuOMwTLhqEmYtEIWYMtnZSbLkVgFi7rdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716220038; c=relaxed/simple;
	bh=uQyTUDBrb2M4ToZZB76OHhpsj6zKCUibocapiCL/n+o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hKLud25cgqUxiJ0CSnQ5FSfuor+Xa+b1fnzLjaBPr3JUb9WCfg/ANmDUVHO0jgnUAQxI3wb0sTIdv2ZvIHHZAeLd5ETVVLHGdS+FwA/Nqpt0wUJdcjDl8ho+a+sEOaOnPZj3cq7BnzqqTch29Zj2LkFRrddY41jmul+8evud2FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MosCYrxE; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5210684cee6so3961055e87.0;
        Mon, 20 May 2024 08:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716220034; x=1716824834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F3SMiS49AyJkdxBHc7WIBbANno/llp+H6SaO+b8OMQA=;
        b=MosCYrxEXdUNb7C9Txh7i8+ELcUGNxO/x9nK9Y2r+glGjoEf3QaC02lEyRue2yl7M0
         BgzEv5C6wpBXSflu9/S4j01TjLr+yQX1fsLW/486Q0yg+vIeyyo5a4vlOnx34jsq4v1/
         ewAGC/fVDqib3WvppfIxvKpK3CM8hk7GMc4fLA0u9SvSJq5N/Wfp2T+eCu2AtvJDuapX
         xiwJxd6EVws4EF3veRdxRQBySkMx0DXp5OBq7aSlUnu17XC7j0mYeZzaw0uPMJrBJe8B
         86henWGECYmrRHqyi5/vqXtB9dhJ1yG2ZXrSBqO/4VegMzfLWTMTJUPNbh+IgBrRiWXq
         oPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716220034; x=1716824834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F3SMiS49AyJkdxBHc7WIBbANno/llp+H6SaO+b8OMQA=;
        b=KLKL9iWpXsVQjulg/Ux/Hpkrl0DRG7/pJ/J2Oe1+lXLgS2T95uaBcmZXqZ4F4QD3Ry
         sEpTxn1r5E8ZT/2SRH22T2H6TaVDEsLA16+7J5wLpURm/9K5k68I4JYkbS5BrO72IhGx
         6Qly0mFSZle9mvjM8SGAaebeJRWD0tQpc/F5zVg/Qu+w0nT1/Reqw3hy5LK1B98pRUVV
         TMRe9X+8EZooYkd9hooADLVq7LQzLf81nfxpIdiEFt0lehRYZJXn24eTaH+xHgEH61Qz
         6Sf5stPoxofS7Nfd8D0hd+FP53X99mmo5UJZLOg1AQEis1eq8MkHnm2Oan5tGGcITzEf
         hY8A==
X-Forwarded-Encrypted: i=1; AJvYcCVa/3BDOg4Wu0+UjGid0iJPW9+/4veUVF7LbxkB1cPYfDben/X88+Y0CVAYWzlCEKmYg76ZAF4CrZs/bpaqqZg2GuaADW8yshjHIWF/rNwsxdw06dKndU5EdovWvvogL7w0uH6BE/zL+5JFedMAk3m0uNp57bhSmUWH7MCt41BewUqqslI=
X-Gm-Message-State: AOJu0YysiDI6seSB6QLN32UI7XoBC3hIPuC2xpW5NaRzUepCuNWEMlTd
	Wi4A0IW1vdQWqYV36KMMgGJGHvoHtrE0QLUjInzrcr/hw+rob9Uu
X-Google-Smtp-Source: AGHT+IG62mY91gEpiAarmSHeHjUwItNwi5VJN0X/TlHTjt2kNSZCxj4kp8AqtGbIWbuVJ3Tc+FEtPA==
X-Received: by 2002:a05:6512:3091:b0:51e:f1a6:ac39 with SMTP id 2adb3069b0e04-5220fa71b46mr24154338e87.12.1716220034251;
        Mon, 20 May 2024 08:47:14 -0700 (PDT)
Received: from pratik-IdeaPad.lan (customer-145-40-29-195.stosn.net. [145.40.29.195])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-521f35ba754sm4301267e87.107.2024.05.20.08.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 08:47:13 -0700 (PDT)
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
Subject: [PATCH v2] dt-bindings: gpio: lsi,zevio-gpio: convert to dtschema
Date: Mon, 20 May 2024 17:47:08 +0200
Message-Id: <20240520154711.7991-1-pratik.farkase@wsisweden.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Zevio GPIO Controller from text to dtschema.

Signed-off-by: Pratik Farkase <pratik.farkase@wsisweden.com>
---
Changes in v2:
- Renamed file from `gpio-zevio.yaml` to `lsi,zevio-gpio.yaml`
- Fixed the space indentation in example
---
---
 .../devicetree/bindings/gpio/gpio-zevio.txt   | 16 --------
 .../bindings/gpio/lsi,zevio-gpio.yaml         | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 16 deletions(-)
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
index 000000000000..b5aae8124311
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/lsi,zevio-gpio.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-zevio.yaml#
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
+additionalProperties: false
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


