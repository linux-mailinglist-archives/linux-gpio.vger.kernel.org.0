Return-Path: <linux-gpio+bounces-19438-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 943D7AA0593
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 10:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 118CF7B2E06
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 08:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D526A29DB6E;
	Tue, 29 Apr 2025 08:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JIx/2dq0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156322957D3
	for <linux-gpio@vger.kernel.org>; Tue, 29 Apr 2025 08:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745914932; cv=none; b=ObaYbudMvAWTAvKNkZR2pkZFRNUTSnPDBq/Cn/zvVBFGxi6iBe2TaeAW7OiwZB5CuywLXTFaVqH4Uc5rKxXU8gjz+oMDlKU0vNJDdbEidqZ38SX4yzQ81cCnLIvISg9msn3uDh2ecx5uVJTRvhBVOQ7wc7zrYx4q2raR7bDCLkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745914932; c=relaxed/simple;
	bh=Cc1Ucs7d+DoVlcf66E1KPy7NQ5fP8mutIpm2TD0VDuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tcsOTHV+qiEojKcnXbJGbSD0H0OgEQdH4eEJKTWLYzj//oN9lcwHBb4u0Aw6YQhYZwJoABrqRqh68MlgnTId4j1I1WE957lHjNexqM1b2rZYaDJuoxxiZcrUg5+hKCGDNpz3Y1tFplqI+sdUmut9OSKFS2o6AIPZ+jvKIlgPkFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JIx/2dq0; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so983517866b.3
        for <linux-gpio@vger.kernel.org>; Tue, 29 Apr 2025 01:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745914928; x=1746519728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rgc6ivQ4v0OBxVxiMV//REmkxOVzSIsF9RwMWgdL0S4=;
        b=JIx/2dq0IdP5lsWIrTOPOeR6rm7/Ty0PDCRQFTGX5B+VLkE2tL7NxkZqVceAoqOeNb
         mVD3rpFNJ6vrN1bXWUjkrbklE8VG8Ln6Kh5sh7Qt/Aj2SIfW/dI01tp9c/K4CfrTojtK
         Zfj/SQ820rMqH2oHDyia9AyjQy9PTH3yhVUkUaFBUjETIPku/bTrUT/zp0CJOl7PYAi1
         kGrPUWO5WpfGeskOfcmfd/cZWKL2Wa1e19CNBqGFjMDPEUpKD1sOiZNyqigG9cfN8SOB
         V6pxHsDYgZCtHXs2xg9dJ0+OoeOeXDu/esQGmZiOihr4G2wPV03hZctH/+29F2WwLBWr
         lxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745914928; x=1746519728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rgc6ivQ4v0OBxVxiMV//REmkxOVzSIsF9RwMWgdL0S4=;
        b=Z9s3rEVFuyjEehNS/TcRre9TkQC0yt9xaR8drstM8XrerUJCk9KE8lGYwdTAM1Xmyj
         4sCjnPDvQEaPCA5bAxAR5v1EJVRI9nQ5nOK5Y3OTjG+vt+ti6Qd5ey79I53LNS0KlHBX
         D5inKDa/RyAS+0K+A8jZ3/hkpfXXAYb/6f5AFzvffd5F0uWzLGeMss0vUHEFZaM/eAKc
         tBVCxzxcIaB/WC51e6DAvK2WQ9IAkrUq07LERD20inRCKFOGlP+ji81xc/zIcTX5SXIt
         Cxq7AzPOvmMRor2GFObBr9S9g4BwJShrCtMrm0mAwCqSrtA5F0LNEMhRxzakea2av+j/
         91RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZAW6ugkGu39kyfATPd2oeTRPN0Hw8QKcb/gI+b7FWkkQDhJ3h56DYqfWLtdCcmTh/W1dunjKpb+sB@vger.kernel.org
X-Gm-Message-State: AOJu0YxvtiUQ9/TRqKOBD2sHW7xK8vJp4aGe89PVGhkPoTUCLXbclWQR
	t13bxkwTSGautp3MWn7eleSn4TyvoYb3x/nQPS/tLlr9fRIq7nZq8LDjwMHiEgM=
X-Gm-Gg: ASbGncu32A6CALMwVT8V1qcOby0Gjfg3uwMY/lLdtPkk3IRG3A6walhPCnZVumDDf90
	rWdYdjfu0hPs6WcQdv2DcebKkfBtzAe1JhsDNtI/baYacAzBPMlooKJgeM5jZl2Vd7LJ3EfeSsG
	8UjAXXz/a8yx5rjRdSmYC9jxheHq79KxfAb4TVzf9b76QUbjP4n9Ug/ArWKu0cYrq3SE53yaXRa
	CC3XDGufjRvPOyP2s7eleb/hBlY6ReKgQgobQKPblCTitePO+FKExYDcXNWYK4Yc1ApOlZM0r7h
	gKjp1e8G4VfK2Dd+iOnRrn0a/MXsXl1xQVSiPIgVUsMy28rAH8Ay8g0XSHPb4IzsG4bTS9wFy46
	FgAGPP2gPlkjg7hI6ihoueKOL
X-Google-Smtp-Source: AGHT+IFe3Pnn1X/IyxiNpZeYuCh2G0CyBjUHp/1BGmD7TkeokHlJhATW4MV7s/37c0u7zNh9awdx1w==
X-Received: by 2002:a17:907:7e84:b0:aca:d83b:611b with SMTP id a640c23a62f3a-ace84aad97bmr1190165266b.43.1745914928158;
        Tue, 29 Apr 2025 01:22:08 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bbf4sm737905466b.36.2025.04.29.01.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:22:07 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 29 Apr 2025 09:21:38 +0100
Subject: [PATCH v8 2/6] dt-bindings: nvmem: add max77759 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250429-max77759-mfd-v8-2-72d72dc79a1f@linaro.org>
References: <20250429-max77759-mfd-v8-0-72d72dc79a1f@linaro.org>
In-Reply-To: <20250429-max77759-mfd-v8-0-72d72dc79a1f@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Srinivas Kandagatla <srini@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
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
2.49.0.901.g37484f566f-goog


