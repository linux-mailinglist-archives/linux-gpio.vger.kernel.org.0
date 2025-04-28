Return-Path: <linux-gpio+bounces-19399-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C910A9EF3E
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 13:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A841817B004
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 11:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9784C267AF4;
	Mon, 28 Apr 2025 11:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QIzvOetu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647EB266567
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 11:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745840172; cv=none; b=S1AM1wvNl/fE6G2rJzIbOlcs5EVLh3llRCg11e5xXmoqe/Wv7FBflR3SRoo/mCsI5WhqTJXSG3FUUuTSfClzX+nZ9JGc7A6tHEPe9RZexqvvD5EbBSUcKLYq12pOZ9j1aOtLI3z0EiToVVse69awRTzrLPsi1xcmUgdU5eGRwNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745840172; c=relaxed/simple;
	bh=U6P6ZeSrPYv97XE+r6V4N7rXLoprPzfswXE2mWXxNIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IJ+gcyXQHBawutRFlhYuat9c1mLwt3V1lNWS2KXHgiA9WKHwnv5cf1SldwZpARZ6q1Orp+PEom/AO1LCFhlhqp3nHAi433MzEV3bwYpoRdmhh1YA3QLxbHC/r4H05Kfg4z8M9ym2R6tAaOv8nGPJvpbfSHxypvvRnIAWOX2qgqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QIzvOetu; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-acae7e7587dso704426566b.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 04:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745840168; x=1746444968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NBA5CuIc8YCbS4yzG+KOg86MsWIMfhXd5TGhL3Zsn8A=;
        b=QIzvOetu2zQNGBnY6qQ10Hd0E2cuXjR3yEknUr4z1FLnwaXDRKbM19Z5ZcAU8wm9M6
         lS9tLZJ19BvARJta5dYONz47toSyzpXr8C/EkCaZDalPz3aKqz13iePB1O/OVOX9USre
         o+EXG+Rq28vJy7hISuwU6UnYMG3tYs+RoYuFlIZUYBKmR0ZwXX38VRtzqSCN3v2jwMrn
         esWXADdmjmuGKxM3exWpDG8l1iQS/N3Ansdjjv6GL66QuBrBHsd+rLq71vRENBBFDIsP
         kxothbp/p6gsTA0v7Lro3gFRIEyyaR0bGhcCPIVqEuPGXiAt+c4EzKBv+KlwQzEHR8qb
         QTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745840168; x=1746444968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NBA5CuIc8YCbS4yzG+KOg86MsWIMfhXd5TGhL3Zsn8A=;
        b=pyYdUf6nCAgIIYQ/SvBiJelgN7/JpE5xSuB6/81b+C7x6XXZ6V7BocSH0naql5psle
         4kMQvIr0EbGNAxm0R61NpGZ0iRmdR2Gj2MRmThYcw0R3vb7GYSijvGGM0RnlVCcg1aJi
         cvCTLIVJE4Zd3mIMqCwnvLMGuVyTFxUcl6ziZViou5iPgEdpcLQvycZQX4tw9o9wuP1+
         Mlk+jlqdYUTHVae8b2srMwg9DewiUZBMiSrAVr99Tzk7RXpk6Hns4aq7eEfvc+BMfhQ0
         kE8K2XT4gZhBKTAyrEBstSqpFt7WoyPDTFpCFr5XX2DJvFDev9wsAOVEtNr2GYLuK0qh
         Xwww==
X-Forwarded-Encrypted: i=1; AJvYcCV6eEc8nwFNgCdGndkD63Pk2H1/FQElCuL0YuwQu49G/URmL3Z5UwD5DzdgeykLs6Ajo2lZzvexrQj6@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo/7GzBXi1up7SsX/gDLF+qtqn757ZhfxzcV6OnSOJxPnAsLKQ
	aHZgzMkUcTm7G7toBlJkfbKmTPCwL/MvzN981RjeipH4QpLbCfdVF6RVkKC1rLc=
X-Gm-Gg: ASbGncunSBq6rVughYsEipL4yCKGpXRHrDn76uEBu5g/4pZx9jlIlPgJBt5gZ7S6TJb
	ZZn2tkIP4kmzzaojFbzJUO061ARXfk0Fths0pdJo9SozfzIBxrW7FKtoIMg5AlCtJ7HdYr3/kXe
	Q2uRK6mxH6UtOJMqd4sOoY9mO9llMtKLJh0K8MF1aexBs5dcLpG5Y1m+xG6G4f6LV4RUDGZI2Vg
	pIEXuq2RQuSYgRn7GgOw8owsbsLkXD31m8ENZLbCdTwpHe37WpiRXi3SelJQPml2QdYWO/yyBkh
	Gs4nGzqyBlb8mTRXbIAO61I/8YOUGiTmWy3xGexe5T4rej7TZliHzsL/EkX1V9M0kGoyCnSoIZK
	nya2oy8WMkjRLQI957bJLdAwX
X-Google-Smtp-Source: AGHT+IEg+c7X+Ta+5FJs9im5JHBiLsTS2tROmBMx41A+5pPg9TXu3iCXPaGd3tUwOuhF2Ei4yP46AQ==
X-Received: by 2002:a17:906:9fc6:b0:acb:5583:6fe0 with SMTP id a640c23a62f3a-ace71095745mr954872166b.15.1745840168498;
        Mon, 28 Apr 2025 04:36:08 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edb1580sm619937766b.175.2025.04.28.04.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 04:36:08 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 28 Apr 2025 12:36:05 +0100
Subject: [PATCH v7 2/6] dt-bindings: nvmem: add max77759 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250428-max77759-mfd-v7-2-edfe40c16fe8@linaro.org>
References: <20250428-max77759-mfd-v7-0-edfe40c16fe8@linaro.org>
In-Reply-To: <20250428-max77759-mfd-v7-0-edfe40c16fe8@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
Port Controller (TCPC), NVMEM, and a GPIO expander.

This describes its storage module (NVMEM).

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v2:
* drop example as the MFD binding has a complete one (Rob)

Note: MAINTAINERS doesn't need updating, the binding update for the
first leaf device (gpio) adds a wildcard matching all max77759 bindings
---
 .../bindings/nvmem/maxim,max77759-nvmem.yaml       | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml b/Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1e3bd4433007341a11040f513bf444866b9e38a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/maxim,max77759-nvmem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX77759 Non Volatile Memory
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+description: |
+  This module is part of the MAX77759 PMIC. For additional information, see
+  Documentation/devicetree/bindings/mfd/maxim,max77759.yaml.
+
+  The MAX77759 is a PMIC integrating, amongst others, Non Volatile Memory
+  (NVMEM) with 30 bytes of storage which can be used by software to store
+  information or communicate with a boot loader.
+
+properties:
+  compatible:
+    const: maxim,max77759-nvmem
+
+  wp-gpios: false
+
+required:
+  - compatible
+
+allOf:
+  - $ref: nvmem.yaml#
+
+unevaluatedProperties: false

-- 
2.49.0.850.g28803427d3-goog


