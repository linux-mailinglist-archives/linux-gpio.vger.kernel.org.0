Return-Path: <linux-gpio+bounces-20994-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D307ACE13B
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 17:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9E8818979EF
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 15:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA6921C5496;
	Wed,  4 Jun 2025 15:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TOxSmiuu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE901A2632
	for <linux-gpio@vger.kernel.org>; Wed,  4 Jun 2025 15:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050752; cv=none; b=k2ANSfXfltICYQsK6Avsmnz3h6O05ccYy50xUdbwfbQbWqC1GVkE2418x2F3nKqhmQWv8G4eaqjxE8JKOLp9OFejc9fmm7WoWYXvDD7YtKjYNEb6djYHy5hEsvOG1vUldC/8ZLr1mLlN39uYneS0zyKH5e+pDzlKW46CMXPH770=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050752; c=relaxed/simple;
	bh=j0GuHj7/ZWHalZNJJKYALf4n+0SGhUawk93aep6mVzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O8osbyIIyHh3hUT+d15ldMMVZZWXdQXnSgFcWIcQmt0oxCboTRK0k7Ytzod5tH8lJ471B9umQMLDPGl72B0evvCq3nM8w/Qf1XmQV+EJtlCeM5bJ8P+I66aGovEYE4ikA3iy+fi0D8FhcgyRiyea+VOzmNsen2cMvlvhRAn4X/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TOxSmiuu; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-601f278369bso14625109a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Jun 2025 08:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050748; x=1749655548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0u44+fUCPUbXjNG3Yeye3uYWIaUqk694d8ypWgEWxmc=;
        b=TOxSmiuuOIVEo/F08dulkHvZzIp0ij1IJ0DnYwF7gj1HIoaTBeVKZ/FnmNKC7HDoTs
         OB1QQTuA8lHSpE+ARFwqX/mGp7NeoRjpzM+96CY+n5CSZsRdTHGihy6XxLWrRaCCfz1e
         TsbVg9iDGHvfn8NhfyfxYNG/RH4oQa0vneZEqhP2EMRoAxBVIi/+uecvq951VvbUM6iL
         fpNC7D/d+RfghTH9MJ9ZmEywlS9YNDJsPgzkE6/u2HJLOUEuWA41t2hRrBamcTO7kCeH
         mhSxTsmKnchlDVD0eE9H2RWyeXR7bv0et5X7QvNwP0Q8IkzlCk8ymanrSGUw/p/gwr1M
         ZxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050748; x=1749655548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0u44+fUCPUbXjNG3Yeye3uYWIaUqk694d8ypWgEWxmc=;
        b=seg5M2/1bqQ+wvQ4CC16BC0QhWBVookZ2rq6qx49LXPZhK97+w4d1hLwozeqyZHjST
         salBM10tTMj28yXn/dxhDsw60Fmv2LWjkyWSNzJ78ANGkN5wHMpyqQazCX25S7HEgSm7
         zu3jz5OsO63OYH+mD9N/osUH4lVUQ2WNXA3kQMYK4AZLxXli+FLsYi68XXI6xME0d80q
         I7OnvCZ34SG2RYQySJNQy41JFdTWgb4TWc271ElPgEEKobKPOjWtSaUDTT5vh3T83X2w
         tyUIWgN8nYLDJsZvuE7x9K4FUxzyq++MTVXVtDoAELUSUrddwsVxPlPvxh/azJBt4YJ7
         pklQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4nLZqS8dhzhd7g8Y3W64plsH+klD1qxTsINUVs3cMP5p3h8nZ2K1T6YxXYuYSI3oPn3EULQ64h70f@vger.kernel.org
X-Gm-Message-State: AOJu0YywJof9Z+IP25pirc/4Vns9FeDNCQQV5ltJXAWQwiFwaU9jB+bd
	o5bJyOEc1egW3a0YwKWvqZzyoKImLWwF0aZ4BPQhD4U0ekS6DcCoy5s1aGc3btGGwSY=
X-Gm-Gg: ASbGncsuaHCurIFv6DocIPZWsjHlDIKM2MhhV53Hz4pOgGr2jk+yinnWBUVCG5Vf32n
	xLOEAatOb9LNzbWK+X/AORBVyz6RBtPy3DklURYKqwPk81uQyq4y64GQMun6S93uNafXLFs5aPw
	ucR0YTQkEqoBbfDPphR1lAbk3gjoIIf07CXqvD3q4OtNJ5WzzIHPbrmqgiQ2xMdKFPdJqPs6QrO
	NG/mfIxgXjPvfJue1+D64A1gs/+8N7gHFTiCGeMJxdwzrEmbOm/eu7cm9G23PQZFt4cwOnLSfxf
	Zy54YNThDP2pOQTi2q0RO1BqJGmJ8sXc7UbqwVE51G2t1iMbzQZ+6UKHp2jyt5X5o+dd7fDC3lC
	53PWX8celY/QCkoD+8owiea4D8GSLimMena0=
X-Google-Smtp-Source: AGHT+IHNAC7ImHn1/O1ztYLzbmZYe73jvmUwIhXjFO7kKauTSDKLz6MSUnHCtZ7LDe45RKA4CdqcaA==
X-Received: by 2002:a05:6402:26cd:b0:606:b6ba:3595 with SMTP id 4fb4d7f45d1cf-606f0fd23d5mr2931176a12.32.1749050748489;
        Wed, 04 Jun 2025 08:25:48 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606ed984f63sm1051640a12.58.2025.06.04.08.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:25:48 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 04 Jun 2025 16:25:45 +0100
Subject: [PATCH 06/17] dt-bindings: firmware: google,gs101-acpm-ipc: update
 PMIC examples
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250604-s2mpg1x-regulators-v1-6-6038740f49ae@linaro.org>
References: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
In-Reply-To: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
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

In a typical system using the Samsung S2MPG10 PMIC, an S2MPG11 is used
as a sub-PMIC.

The interface for both is the ACPM firmware protocol, so update the
example here to describe the connection for both.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 40 ++++++++++++++++++++--
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 62a3a7dac5bd250a7f216c72f3315cd9632d93e1..408cf84e426b80b6c06e69fda87d0f8bfc61498d 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -36,6 +36,15 @@ properties:
       compatible:
         const: samsung,s2mpg10-pmic
 
+  pmic2:
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
@@ -52,7 +61,9 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/regulator/samsung,s2mpg10-regulator.h>
 
     power-management {
         compatible = "google,gs101-acpm-ipc";
@@ -63,12 +74,20 @@ examples:
             compatible = "samsung,s2mpg10-pmic";
             interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
 
+            vinl3m-supply = <&buck8m>;
+
             regulators {
                 ldo1m {
                     regulator-name = "vdd_ldo1";
                     regulator-min-microvolt = <700000>;
                     regulator-max-microvolt = <1300000>;
-                    regulator-always-on;
+                };
+
+                ldo20m {
+                    regulator-name = "vdd_ldo1";
+                    regulator-min-microvolt = <700000>;
+                    regulator-max-microvolt = <1300000>;
+                    samsung,ext-control = <S2MPG10_PCTRLSEL_LDO20M_EN>;
                 };
 
                 // ...
@@ -77,8 +96,23 @@ examples:
                     regulator-name = "vdd_mif";
                     regulator-min-microvolt = <450000>;
                     regulator-max-microvolt = <1300000>;
-                    regulator-always-on;
-                    regulator-boot-on;
+                    regulator-ramp-delay = <6250>;
+                };
+            };
+        };
+
+        pmic2 {
+            compatible = "samsung,s2mpg11-pmic";
+            interrupts-extended = <&gpa0 7 IRQ_TYPE_LEVEL_LOW>;
+
+            vinl1s-supply = <&buck8m>;
+            vinl2s-supply = <&buck6s>;
+
+            regulators {
+                buckd {
+                    regulator-ramp-delay = <6250>;
+                    samsung,ext-control = <S2MPG11_PCTRLSEL_UFS_EN>;
+                    samsung,ext-control-gpios = <&gpp0 1 GPIO_ACTIVE_HIGH>;
                 };
             };
         };

-- 
2.49.0.1204.g71687c7c1d-goog


