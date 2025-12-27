Return-Path: <linux-gpio+bounces-29931-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FAACDFA98
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 13:26:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2C423025A68
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 12:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C1B330653;
	Sat, 27 Dec 2025 12:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hUTcqBfY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B8032F74D
	for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 12:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838278; cv=none; b=RlrvaoiRM1MGy9lruseagmHLsnqBDe3bPBozWIK7j0GeOeN82m5Llv9JyouJSo9a1iOrulsWLdyRpsYoPuvqG52jJv0Igtxxn1W3WCQK0fo9BTUcBX9BBIc1An0GYC1DfCPOHtmN8O6vFOJ8O29dqGazOUhSobzV/l3yHosbShE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838278; c=relaxed/simple;
	bh=hNm58sAFzxOO0mLfaUIDAAaiwFh3P1PTvPP9/eE7na0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Phmlg+6DhZBdI1rJIGBZuJTBLZ4WIDMRVULdILJYVkGOULGyIFdR53J77MVs6cK3W8i5qfV2cyYwF/aJFJWRPhyPZVEemUnd9SfyaZI058cjmEBxQFDhtiJgoLUCg/53K+2W3/2jXTO9RYfKhrmZ2gd3D792m3HgFE34xiVAmZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hUTcqBfY; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64b81ec3701so12287384a12.1
        for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 04:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766838271; x=1767443071; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ijeoVSxEaKK4ZCy9A7Kh1hnl7BcwzYQpACu/LfWJKFI=;
        b=hUTcqBfYxiG/4Y+wIMOkmqQtTWHzwU8IvJfIPttMG7ZbN+vMnOytnjzv3UP+sE0t15
         Qro0CnHMUQZ4vF/5+Y14EKRWQpp4DlBRkxkBm+X74+DdJuswWfNV0WZeL2jF0izbsk15
         sJP835BU4AV8rdOewy3F4ZkFydgAI6fHIB8d3kQn/GlYZUyYiNC36v2bPIpuXuBY0vGQ
         sY1+pNk7Gvv607DNgZpGK9y8n5QQ+0LpToUBy5iTj9asa9aSwm8sziIeYE0/jhsWMT0p
         ZVrFj6pxqk3tP1uhRhD2zRlzrzb3VdJw1oac3g82Ls+4hl7z4whwqd7fZhOs8QyJEIE/
         TJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766838271; x=1767443071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ijeoVSxEaKK4ZCy9A7Kh1hnl7BcwzYQpACu/LfWJKFI=;
        b=DN6Ck28YIqUueFLFT7Xzdpc+ygp11FQ8HvvSn3pN6ks0NH+ieCOMVKX/bXtIrMiOZj
         HOl8Ca/lseT3cTBQmHI0EydN3SxAxm7bVFtr6KVunlWXE+IqdK3kZY0BHcclQHHyZLQ9
         oaJRrOMdTJLDKxe0ZFBZOvJd1PB+r3u/U5JX3jjEL3aBnUo3GHG8+Y3tDIR3QW3bocpD
         Gapb+n6h4p6oDd1qbXvHpRjtiEWHBFxhJh0mZ9fURO63nHF8fK+OwR4F+BA4QKQGFdlZ
         jQT8LpJ7wuQm3vzDLQ6jqlBrZPBRajh+CPzUyA0adeZqc5Om8Fg3ofuUBdKpK/zaJt+h
         RdhA==
X-Forwarded-Encrypted: i=1; AJvYcCVJTOEwg8uwkS5uK3z2AIoPfZkea0tHhX4tBIiDB237IN1hUZg79BMG5dafk6gi5skLJv3+7Wyo3bQu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/DHD4isDwVLRfobJCDq4+9CI4BBBC1D9wIZAC28Ui29YzsRCP
	CdM/CdYw3l0JGJUi4F3/AltgfMFAzVACAv9VGIhE47sTKBr8fP3z8j/4rKI95469fUc=
X-Gm-Gg: AY/fxX6d3UDsu2w0u2M05hlY+mHKmYgKQ/sruYw3tw2mrHSz9S9tMUFlqGF7dzEdgbE
	I7ogD7DkT/Oz+fz82EHoEDHfindvmtHiAOMnGQsocNfqWU12LUwF3QkOndh1N6scmpuEHeEKe7/
	mknFS6qs7g5MIHWgZ6iL0sfCLmt2JumfZhuEynI47hEtqDIAYEZ+N0Fxs/AkCXBJAH6FZo4l+XI
	da06ULfMy3WNF+2F3AR8K4Mf10r/395hgsYYbUiaBunwW31pOC2QaNcxrrwB4qK1LuhB1Km/rPW
	lCkDTbK0XWhruNJQJqyC/LiudRXvFVd4iDPzMBgz9DZ/YCY6j0kiJw5Ld7GPj5Mo3WxwjyU9AGm
	iEMHbior68UyMoCL1bturh+VlodU9ATONrhpbXx1i+52RddmwAVDA+q0nzRtKD5v6ceiGbHn09M
	V+pfv9dxkNRt5vVr2eIjTdL2uPC4EUzatD4ILht9Sb4TZgOx+ZoBtNMwQu8jhdDHuKWaGaHIqZH
	tsXOw==
X-Google-Smtp-Source: AGHT+IEBSl+0hYWrK+DC8PhG+Ph6J1GOfmGHMm4fDyffFTq5iRMAUOqC0B5ilD6HzpC8eImZz7CR8A==
X-Received: by 2002:a05:6402:1e92:b0:64d:589a:572b with SMTP id 4fb4d7f45d1cf-64d589a59f3mr20595200a12.17.1766838271162;
        Sat, 27 Dec 2025 04:24:31 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm25932659a12.31.2025.12.27.04.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:24:30 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 27 Dec 2025 12:24:29 +0000
Subject: [PATCH v5 07/21] dt-bindings: firmware: google,gs101-acpm-ipc: add
 S2MPG11 secondary PMIC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251227-s2mpg1x-regulators-v5-7-0c04b360b4c9@linaro.org>
References: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
In-Reply-To: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2

In a typical system using the Samsung S2MPG10 PMIC, an S2MPG11 is used
as a sub-PMIC.

The interface for both is the ACPM firmware protocol, so update the
binding to allow the relevant node and update the example here to
describe the connection for both PMICs.

Since we have two PMICs here, but can not use the 'reg' property (as
the addressing is based on software, i.e. the ACPM firmware), the node
names reflect that with their respective suffix. The existing 'pmic'
therefore becomes deprecated in favour of 'pmic-1'.

While at it, update the example.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v4:
- Krzysztof:
  - update commit message / subject
  - pmic -> pmic-1, pmic2 -> pmic-2
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 50 +++++++++++++++++++++-
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 4a1e3e3c0505aad6669cadf9b7b58aa4c7f284cb..e68f9c3ca5e2619bacc0c8d843ec4984c0947fd8 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -37,6 +37,7 @@ properties:
     maxItems: 1
 
   pmic:
+    deprecated: true
     description: Child node describing the main PMIC.
     type: object
     additionalProperties: true
@@ -45,6 +46,24 @@ properties:
       compatible:
         const: samsung,s2mpg10-pmic
 
+  pmic-1:
+    description: Child node describing the main PMIC.
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: samsung,s2mpg10-pmic
+
+  pmic-2:
+    description: Child node describing the sub PMIC.
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: samsung,s2mpg11-pmic
+
   shmem:
     description:
       List of phandle pointing to the shared memory (SHM) area. The memory
@@ -62,7 +81,9 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/regulator/samsung,s2mpg10-regulator.h>
 
     power-management {
         compatible = "google,gs101-acpm-ipc";
@@ -70,10 +91,12 @@ examples:
         mboxes = <&ap2apm_mailbox>;
         shmem = <&apm_sram>;
 
-        pmic {
+        pmic-1 {
             compatible = "samsung,s2mpg10-pmic";
             interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
 
+            vinl3m-supply = <&buck8m>;
+
             regulators {
                 ldo1m {
                     regulator-name = "vdd_ldo1";
@@ -82,7 +105,13 @@ examples:
                     regulator-always-on;
                 };
 
-                // ...
+                ldo20m {
+                    regulator-name = "vdd_dmics";
+                    regulator-min-microvolt = <700000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-always-on;
+                    samsung,ext-control = <S2MPG10_EXTCTRL_LDO20M_EN2>;
+                };
 
                 buck8m {
                     regulator-name = "vdd_mif";
@@ -93,4 +122,21 @@ examples:
                 };
             };
         };
+
+        pmic-2 {
+            compatible = "samsung,s2mpg11-pmic";
+            interrupts-extended = <&gpa0 7 IRQ_TYPE_LEVEL_LOW>;
+
+            vinl1s-supply = <&buck8m>;
+            vinl2s-supply = <&buck6s>;
+
+            regulators {
+                buckd {
+                    regulator-name = "vcc_ufs";
+                    regulator-ramp-delay = <6250>;
+                    enable-gpios = <&gpp0 1 GPIO_ACTIVE_HIGH>;
+                    samsung,ext-control = <S2MPG11_EXTCTRL_UFS_EN>;
+                };
+            };
+        };
     };

-- 
2.52.0.351.gbe84eed79e-goog


