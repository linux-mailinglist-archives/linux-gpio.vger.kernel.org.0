Return-Path: <linux-gpio+bounces-17482-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C382A5D95E
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 10:26:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF39C189C65D
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 09:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A331D23BFBC;
	Wed, 12 Mar 2025 09:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EEKgGQt7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C772923BCEE
	for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2025 09:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741771580; cv=none; b=U7s0SJGj7cZCX2kbIV2UBaTTwnJyHNSHidtK+iDIdEWW/OZ1hLxhgEag+xIutNzSx5iF2EpwyFASL9gzIHap/2Mx2KxA+k1Eps6GCfc8vF0iKreMoGIk4WrWSmu4GHYM+8s8+P6FCI2BbMtv27HGFy8NZxpcGtunmMNbHXklu54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741771580; c=relaxed/simple;
	bh=ybs8R25yfpsfczxWhsJ2tV/Ul4Z2Pk35a94YSeM398M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OJNR2gKzlAxefrUQsJSydt9/SjDSx8oOTAF+nKPleAR1aqMXRTY5TWBmRkJaNzAK+BbDtxCiQ1TksuyBUcpJpqpqwmJDqAPld0+MDbUIxac8chBGg6fITMTCslJVn6uOHSKjyH5pi8SwoCPDxWcvYcTfP/T8b+plF3IjCG2tZeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EEKgGQt7; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso10006339a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2025 02:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741771576; x=1742376376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xswinb076qZvn7US/dc/QOmw/IdhpBRRPIAhxYh3Img=;
        b=EEKgGQt7pOmp+XdOO7PbUFTdYkaCv+bfqQx2YC9fIsPDXlfV178UsEJME+zgSwOuRD
         ITv6Qy1dsjO0KCI7tit+JtaEMwcweqU4eY0jbVJ3wdgF99yrhMu8zJVKptVG4RrJHWaJ
         1x6jd/jSuHAZY7uLWLuX0gi4ubFNHop45H9ljOn0IqXwtTEGh8nYBtMG/4giQYBXoX/1
         VSK2ujPniK8SXvnHeuSvEmYmi6oSepy+gBTdxS4PFK8blMqAC6vy0YOq1kYI6zjbRsXp
         PoHWSSjb2UG4gAA1hFbW3rj12WSoPoFd9FVyk9CQb2QngCURx3nf0kq8UJ7MG+kdVCC9
         EBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741771576; x=1742376376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xswinb076qZvn7US/dc/QOmw/IdhpBRRPIAhxYh3Img=;
        b=m92xVFlcR/ufWP4OzXJHY72rxQcZeE1AZPINXQw4RxHoNXJURV/LjCPONFjBRy71T0
         3efANnV8RL15s4UpL0yb0nl0gk4rwMeu3xWef564hFLzqGSjumFNRLSHYhtjNy6Nv0FO
         urar/dXL5t3z4j5MgYmA4VugG5rKx3hcmwwz8DsVwIj/NzttmQABQfGGAy4d2r1n3Wig
         pG0KWSo2rQNNj8k3zLzGcSnfyyQEs9+aqzIpQXiUPgaxrkncKoRwsaCZvKmg9R0dTXto
         5c/BIu3ye1UP5iyyyOelupFG0IY+oBjf50Q9k8v5QeG53RnyHIGY4bkJOY2oHH84RiyA
         +/Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVuPCAl+/6RYlJY9QgW8bcH23u1hhODLpmhFvrgBA9QK6qs716E1A3UfEBcuw+Oe3NyVUzrFLTl3nxl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4e2Wy/hWxPm/er5xxvJUBzdFHtWce3HV2mtrspTKXtxoqzfSY
	gEsnHzehYj+bP47hCuUp6PaX3YeNB6xMXw1dPzkRGGoP5kSodgMxp9ftVH2mjVc=
X-Gm-Gg: ASbGnctWEbRB1VTySNmQNPpftG1hd6M0eu2rL1QWO3xrb5fjdMPRQW2PJ44gdjjz1Jt
	HGEPxSuaraCeap9IuSVPTnyNvB0ZX6IUMdIprMUg5rga6CJ9dThrKDWBHePL7UmW/uZ/DkGs4e0
	T5QQUibbQMerre9pRjo9+Hfg0QouoXe/JQ+IMOineGZ83sd3+apvGkPfCSV6yPv4x2zswPoRnB8
	q0ioK/vaGX8p58xpfX9xBmHfn3K3F1VAZyPr/V55eQRShausdU6EAJYu74xv0qFBcwO6UuFJGDU
	nBvBFZJDEq3/zPlUEXAjNpytbYg0NBW9MacmlG6UJ6Wt82ng/P4URAmg5TRCsRwDjqZT/F89T1+
	HusIwbmBbIfO0nRxhEdl1q1K20Oi7
X-Google-Smtp-Source: AGHT+IG3BE+VCjz80UYyxxJRqNTl345juIBx/anG/Kz+C5kuNeMlQDho60z+7358e8nkNWd/1gqnUw==
X-Received: by 2002:a17:906:f589:b0:abf:d4a9:a0a5 with SMTP id a640c23a62f3a-ac252f8e28fmr2441712766b.45.1741771574569;
        Wed, 12 Mar 2025 02:26:14 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac25777c748sm894535266b.2.2025.03.12.02.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 02:26:14 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 12 Mar 2025 09:26:00 +0000
Subject: [PATCH v4 2/6] dt-bindings: nvmem: add max77759 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250312-max77759-mfd-v4-2-b908d606c8cb@linaro.org>
References: <20250312-max77759-mfd-v4-0-b908d606c8cb@linaro.org>
In-Reply-To: <20250312-max77759-mfd-v4-0-b908d606c8cb@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
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
2.49.0.rc0.332.g42c0ae87b1-goog


