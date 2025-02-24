Return-Path: <linux-gpio+bounces-16481-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EC4A41AF1
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 11:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4ACA01896AB5
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 10:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCCA2528EB;
	Mon, 24 Feb 2025 10:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yls4iqky"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B7C2505B3
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 10:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740392937; cv=none; b=nVEJAUtXtGn9xCwxj3HcEIs2cmiYjl3AajHkx/GIh3OYLf+02FaINUh7xPxUBfYUv7qfmHzcxk+1IT5qJkHasKYBkj8TEH8Qt0bBcjBwdIu1X/Ku8epDooM0gLGdsXxRIaBAoUiOw9fwGvWV5XvSdXmcO8Iju6ZVIhh7V3bExBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740392937; c=relaxed/simple;
	bh=SbxyZVFzeep/C5H/BzJACz2cstijlLoAVmx4b9KRzx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DbYd5D8oMKW30E6mB9/93WUUrqDVTMRNVpJGPIkErGJB2Vs40Pcp4nS4PqDpIv3CrJtqUF0yPxgS69zw1nZe5EtaCJ72msO1LK1BxxdbCBO0TkNpCof7PNwQmEJNxHE92QTekjKpHAe1mmP5W3w/o3EIHSlRIIA3G/daGnjV6Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yls4iqky; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abb7a6ee2deso648459766b.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 02:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740392933; x=1740997733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WbhcZtzS5EwoX+spb+fb7Z6TUP96XJcoUjJrW1dm9ac=;
        b=Yls4iqkywa3myn9tbq8ErI4PwyN1xABko277p6G8VTDqy2DCPKdDutj4kpYcVlXW0Y
         ZjTmnZ310vjKbNIJc1VfeAV4jPwnzjbc6rRKQYSuxg3tWrQzhi9M4tXczIxmrn042x3/
         9KxfY7kHhF77ioSbWKA8BZ32Sx4thJiFZnd23zoxK7zKUMsSxSv0+jkc1fGWv9xQWsAc
         bukYC+P5y6z66cibcsCTfpQITvu5W1TDDrVQmYBOulv+mfapDqIKprl4hdPawVjno8Km
         394Ct3atD6xWBy1ht1pl87erI13tMEXDKriLhH475CrgspZGJQGIau2Q8RZ7KTLG/nQ0
         QQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740392933; x=1740997733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WbhcZtzS5EwoX+spb+fb7Z6TUP96XJcoUjJrW1dm9ac=;
        b=IZnSxXTEmlCqmZ97ArQ/8PyQqvPDpgQv6qZPMsnhziR2Js1rSPiIXDY27VjipCuh1z
         Vn0pLuiDkEG79vrweN8wtJEC7Aqm7vkJuYQbVRpdYP7aUV5Iv1Tftmn3hhgMgcUWu2aZ
         apdx1hfHDKtt+pgK75MxUNb6qKcPjwcJmLx3DW483vbi7LDOU+kDHlvTNZ+4LnVbYydy
         EX8+D25DmBaZKE28d5R9m9pbi2h6XNrsgudjfCtYwML3ZbqVTYSD18Pg347D16madKHj
         yyxQvBEjW0P+ck5DWI9tsv/buvbPnWcOzbPsBsWDSgBr4vX+bzyrjJ9Glb876K5qBImq
         d7Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWY+6fKRw+UijiZFFU9mSmA5cQW5o5+muSin12LGb1duBx9pnF17psLzU0EKUV2po40/085nUv3NyJv@vger.kernel.org
X-Gm-Message-State: AOJu0Yw61hIHHW/qnXAenXanXb01iXnNTC1DQmlS4H0VCyQq5KRrYsRw
	wCiHkDqN0y3k71bOa3vgbDNd/yvPshIOthTYo3CXnnQ8yFBuTec+qdIjXOgTh/g=
X-Gm-Gg: ASbGncvA/eny87JBFaiDrcPxfYtLUA+fE8mlM28TeexCqTYLA1kY3UPx5677XLWB+Ce
	xrbGLz469F915ri9ZVzwxfCO6QCAfxeUTnDOsri5ytFfDOo4LMNL5MCHYNBDVGFRRl6rRF38xX9
	s8p2WlX1tZIdAFNbqH4DP4eoI9ihcuHzlGOlorBLTOFxT7W0OVUPlFYkiVgiaGp5JwD9OzgHYUK
	9LvxSYR+KV+nNkj/Ps5NCj5EGvLwyv26sI7jky1XwxRcsfmK7iTiNy4T4ggJ1d+awsWkPNOSLzk
	Sue4C8TpDpxkx299zeam1uIvHr7tj8kXL+cRU7d3I7F7Z+03UJUn4vZ3ttEDMI0dCyfTtrkUsGe
	qalklkpxclQ==
X-Google-Smtp-Source: AGHT+IH4RZjl08rR2sE5UQioxf9Tb8q7zCAreWXLTS8Ohg3GQ4mI+vcJ4QA6lsBdoNmgXsyuVz1NiA==
X-Received: by 2002:a17:907:3f92:b0:abb:e259:2a64 with SMTP id a640c23a62f3a-abc09b21c99mr1220180466b.33.1740392933327;
        Mon, 24 Feb 2025 02:28:53 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbb186c5d5sm1349206666b.51.2025.02.24.02.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 02:28:52 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 24 Feb 2025 10:28:51 +0000
Subject: [PATCH 3/6] dt-bindings: nvmem: add max77759 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250224-max77759-mfd-v1-3-2bff36f9d055@linaro.org>
References: <20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org>
In-Reply-To: <20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org>
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
X-Mailer: b4 0.14.1

Add the DT binding document for the NVMEM module of the Maxim MAX77759.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../bindings/nvmem/maxim,max77759-nvmem.yaml       | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml b/Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml
new file mode 100644
index 000000000000..d3b7430ef551
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml
@@ -0,0 +1,50 @@
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
+
+examples:
+  - |
+    nvmem {
+        compatible = "maxim,max77759-nvmem";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        nvmem-layout {
+            compatible = "fixed-layout";
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            rsoc@a {
+                reg = <0xa 2>;
+            };
+        };
+    };

-- 
2.48.1.658.g4767266eb4-goog


