Return-Path: <linux-gpio+bounces-27972-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F5AC2DD3F
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 20:15:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E267F4EB2B9
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 19:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F59322C97;
	Mon,  3 Nov 2025 19:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iMq5PpOZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31DA31E115
	for <linux-gpio@vger.kernel.org>; Mon,  3 Nov 2025 19:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762197291; cv=none; b=H3DDu7PfPxccGim4/3090Vb58oGBfV2ZCyFaEm1r35Nesk6vBOkuFa0iAckzzXqrFqvK4pCPZEjIN/TtS8t52EdeYMSdymNntbXqTYcTvA9EFkLUrPKyAhMIbX1EDPOZEKHaFD9hljZ7weJgW5JgVMYJuhZQPKXrdN/NUkSgPLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762197291; c=relaxed/simple;
	bh=c/xrRD600w1Dsyuw4U+hAJBnYZyF9dXpxSSF3rQ6G0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ry+NaPE85j36AOnuYGPk5kR+DBup6ZOpfGZq5vO3cpHcIPJpse/m7nuOrPtB9hcqaMWCNotqC1wSATwnHQW0FWsBvlkpdWNGdrdsfKQCpudR5Qsz4bJJM41Ltv3pwU3TJj4CC5nhHP0NPJnCCwamm1mGJZjwGtWIp7QSPzboTDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iMq5PpOZ; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-640a3317b89so2558140a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2025 11:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762197287; x=1762802087; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpU3+dPMBGal6bIAhOfb10JFhOSohjDVXIH9FUT9R/s=;
        b=iMq5PpOZ5+33YJBuGg/lCjGFjd2KBqHC8X8O30/DXTnVzOQAH8gMpqY3Y+/1SKqZ1c
         lgKvQlb1/vG8k0CCTEYe4yKpIqqi5AFcbJJJE+NT3qKzThrL13/AEbRo0lsn68FfAviI
         JqrIbfe7ui8P0DJskMBnz5BSgpQKq2SihqDx35Gn0g3FDFPTgVEwOm1ud8N4Csl7WSG/
         5ILFp+wiZab9JaR0Q3hS9j62em3eAzXELHHkdS9HLWeRSfRHb1yt8mh9tI4Rb3Y7Dxv6
         KPsxFvLe6TOiVwfNh576nr4+8T+1REQqETVNLiRxiIdkKoUFJ2D7vdwRN5jPxUnCAFU+
         vDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762197287; x=1762802087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hpU3+dPMBGal6bIAhOfb10JFhOSohjDVXIH9FUT9R/s=;
        b=BiIDap77w3og2egChn/SPYKCVlvFK9Hz+fXYsILeHInlo6/CSlF4MLR/Joa4Xda8e/
         QNL7Z9EVd6yZxVwdJxm+b1/A0g59t3LvAH3Y3qqK9VGRWBvL/kK5EIiQP6vhceUgecRf
         zbbandvWlGoOPKMKHHzAIodF3G2wQ5N/hnfKa1/x/TJfVDDpCP9BBqnFEW0NKfFHT+Fr
         LH/TXsI07Hp9lK1FC0k+/b3P/zPjBesYj99tGvyFUHs8Nssi7XDASGYs8qHmA3EHxU9o
         GBVX0X6QkC2PFiJjDlRBnDOTy4VOefXvopEgOV2Qrz7/eL3b5U/5vqNyV+dbmYigu9TO
         WGpw==
X-Forwarded-Encrypted: i=1; AJvYcCVH7p3SWo36KMEGe0ysOlBlULQH6ASspht5bVbUcQgohZ6wuCT50HJGoTJQMI8ODGMkbe/YojeIlsGD@vger.kernel.org
X-Gm-Message-State: AOJu0YwWLgV1TVk6pEEU/pgOXZKnjpjuOYIife0bBtpchz5zQjanLEcQ
	FuGXrynoGTsKQdjsHQVXv62y9PdStyLZaCwgyDUtdImxlyv+C33PLn0zZOktVIzV+8Y=
X-Gm-Gg: ASbGnctoLRYMFdjVFx8k7a0lbH9PKvnLQ0iEC9LBCRVzcNppIeVw3lib0eF9dUHXi8U
	Wkjl6lBVm8XW8vAQIdeCtgthZTYB89+W2LiEEVc5iZSqTFwNauLPp6ye0gi22jt34CtDzThlB3k
	lC0FhZoDnWqCT2Kn+ErHYhTA/Yff8CLAYdvcB3iR647cQN0aKzDxGM2k44+jCcpbxG91HVmUB37
	QVKuRdcAspNijEBnAuMJD01PCZbL4Li5ClW0CodhfMmGXxm6If/icM0Hw18WdySkeqnx69Xyy0T
	XrwaxHjerfK6UWmORaVZ3atEu2GnAWWTQZ/rP0tHEMS8rOwkd1v+qWrioVqW8QVuyb1AU66tIP5
	LJn2wgNldJMYzFW+haAXmYaP9Akbaf6lZRgQUzBRi7KTz0IiGP3a0rdumD0F59WYNUFNcUXC343
	/XxEjBkOIPSDlIIsp/Caocp28sz7IrsSrPKk6PUXY2BfbJlLERqbWOIWA4SEiagpQ/hQ3Ksu2Re
	4XOI4uKAg==
X-Google-Smtp-Source: AGHT+IGKx04tsYPLBvcqXY7Ecx3PC4XIi2xWV2nuoXlJTghX703VWRsq3RlhzHc4VON/CJmYFIqs2A==
X-Received: by 2002:a17:906:c10b:b0:b6d:8e29:8f67 with SMTP id a640c23a62f3a-b70701ae016mr1456556066b.26.1762197286776;
        Mon, 03 Nov 2025 11:14:46 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b9f29c8asm466765066b.8.2025.11.03.11.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:14:46 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 03 Nov 2025 19:14:46 +0000
Subject: [PATCH v3 07/20] dt-bindings: firmware: google,gs101-acpm-ipc:
 update PMIC examples
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251103-s2mpg1x-regulators-v3-7-b8b96b79e058@linaro.org>
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

In a typical system using the Samsung S2MPG10 PMIC, an S2MPG11 is used
as a sub-PMIC.

The interface for both is the ACPM firmware protocol, so update the
example here to describe the connection for both.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 40 ++++++++++++++++++++--
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 4a1e3e3c0505aad6669cadf9b7b58aa4c7f284cb..c25e155926e5f44bd74f195cdbff3672c7499f8e 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -45,6 +45,15 @@ properties:
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
@@ -62,7 +71,9 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/regulator/samsung,s2mpg10-regulator.h>
 
     power-management {
         compatible = "google,gs101-acpm-ipc";
@@ -74,12 +85,20 @@ examples:
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
+                    regulator-name = "vdd_dmic";
+                    regulator-min-microvolt = <700000>;
+                    regulator-max-microvolt = <1300000>;
+                    samsung,ext-control = <S2MPG10_EXTCTRL_LDO20M_EN>;
                 };
 
                 // ...
@@ -88,8 +107,23 @@ examples:
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
+                    enable-gpios = <&gpp0 1 GPIO_ACTIVE_HIGH>;
+                    samsung,ext-control = <S2MPG11_EXTCTRL_UFS_EN>;
                 };
             };
         };

-- 
2.51.2.997.g839fc31de9-goog


