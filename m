Return-Path: <linux-gpio+bounces-14227-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABF99FC382
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Dec 2024 04:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B42C918838E7
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Dec 2024 03:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFB713E8AE;
	Wed, 25 Dec 2024 03:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqubMES6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C61946F;
	Wed, 25 Dec 2024 03:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735099173; cv=none; b=lRPdEXaYXJ+YwzdVppj/nJ+i/7hGmZ1fkvb1jQX9qs2xK/iH544Uf5jtDxmHy++T1mPPKh/va9ywJ1Seg7LvL5e+6FA4B3LFxy+Gj7y4Rz9T06Tg/4de/T7cfW1xY5PlkagZ3gSpba1JQd9e9pEFjefZcJVjoEBTp0b0DoUx/4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735099173; c=relaxed/simple;
	bh=i0L2HNzYLEGZasdLjUXLs9gqmAe5ehGaJVQTSqLiCXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=epp+dTu6xb6xe254Ltm++YXf7cEeRqxLVbb5HN5YzV7FgcgLxsS6V+O5QQvADp0uPcsTWRDGk3RbqCtGGskaCBnIVCurZT9niuZoLmeD9iV7B1OhpB0OhXFN3jFlinK9U7+9ZOad76UEl4ZrCr/+0YD34KdFqf6duDYBmaXN8/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqubMES6; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-216426b0865so58609345ad.0;
        Tue, 24 Dec 2024 19:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735099171; x=1735703971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xtNq+Vqbf9jnvNwaxJRORjh9ptP5g1fnaGQJVgyDdk=;
        b=GqubMES6xQXUFrmEV0adwYk2q1hKh5BC6Zffbhtdm5qi6XFeu0ZmkENjuSs/bQRV7J
         XA2X6Y0ciNVuxhF9uuCx6Raf9t2Ui1UO26kjYEADgbyPMU+egVLEbqhzZ2PEgGlTsF7O
         UoKS6/TnjM1qW0J0lEQ260vstGXhGo1hO9nrx97PH6tL2ov694SlNMYJJNSqndAQRiDE
         fyk7gMl9PWh1XUhvVXU9sKZbCcea/bpDZrGI6m9mTK5AfZcGAF7WKOjVaS7sO8d8fMzA
         AalNFO4irQnL86d437/FJGJNShWO4AIv+yG0cNwt6tdcVcHpu8BXOhwixqfVFQyiGYCU
         igpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735099171; x=1735703971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xtNq+Vqbf9jnvNwaxJRORjh9ptP5g1fnaGQJVgyDdk=;
        b=Regf3SmHK2UFqRprAB9AOxeYQTy6wXGHBI4JhxeiwdJ2EvueyNAR9PHXTLX87sPlKh
         Kj+yD4vxW0b7fwk6iJl83sno6EotznW2hKTlwFVQckE6jr3kc6advkgtGfnrb28ez+Ak
         rJ/O3dS2Jg/xVG4R4l5Mu1IkMeMY3VmxxJN/TEaholR61ly0tRfj40NeI20juaugY/lJ
         QPDWP7pP3CYrOV0DCamw3GHEnkYWIFFz3ImkfGPaYnI2n3gylKx4fmOlTK2YKS6P45aP
         mTPtXfqDCIkf3zFUjsgdwJFHOVd6pEs4h2XLcgAB3qS7wXtyfUklpPMRA0C+0dAopNlV
         lnhA==
X-Forwarded-Encrypted: i=1; AJvYcCWewrDFr0vK5gsUvJGIZtkbMw2bsfk8ceJQAEFqUx4LgBBHdqljzovU3qLx2djS4aLpHHHrzVtoBupy@vger.kernel.org, AJvYcCXSGOKEnGsjSRB0dkLkbRB/XzxWpKFc99/gXcO31vnxiLC+de+s4os0NPuO2GQpYwNYJosZrhF4trNn79Ue@vger.kernel.org
X-Gm-Message-State: AOJu0YzPxsRv3TdRROtHjt9dzxh67+086dl2krqCaeB1m5VdRDQx21Ed
	GhFW1p8PZW2prB+o1pW9rF68Ynap335fesbu0yTKRdm+MfV7VbyptOzHxlURerc=
X-Gm-Gg: ASbGnctPKF9rMCkl/nSga72BE1YwKXf4ABLugD5sF4hg0JtG/iWbv66k+g+38I4BtcV
	PRwIsVWzvaf+Cj0YyiRteLlhQHxCjXgtA8vdkj4smVKa3G/km/9vNZLONJkTtrzpgmSf8XUMEQ9
	9RxZnZMaF7Sk+KIgzJt9BpUS6CL2M/wRksLEFkSapLVMQt3POZNhm3n3OzhuzcIrtE+XHupgs/3
	aPVo1qa7iyFhkuqMfzPdkUtOeC4EdZsdFIlubfLnYfXGdJkAd+N4rQvbGpcGZfmtkA=
X-Google-Smtp-Source: AGHT+IHfK08O5h1jNe/AFjUkyk8M3iuVgTdieS/ByFPe1mJaQ6GSyuls69bFosfB5lClBp0m+ieqcQ==
X-Received: by 2002:a17:902:cf09:b0:216:3889:6f6f with SMTP id d9443c01a7336-219e6e9fa8amr246530405ad.17.1735099170986;
        Tue, 24 Dec 2024 19:59:30 -0800 (PST)
Received: from guoguo-thinkbook.lan ([112.65.12.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9d447fsm94256125ad.128.2024.12.24.19.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 19:59:30 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Qingfang Deng <qingfang.deng@siflower.com.cn>,
	Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH 1/2] dt-bindings: gpio: add binding doc for siflower,sf19a2890-gpio
Date: Wed, 25 Dec 2024 11:58:50 +0800
Message-ID: <20241225035851.420952-2-gch981213@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241225035851.420952-1-gch981213@gmail.com>
References: <20241225035851.420952-1-gch981213@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt binding doc for the GPIO controller found on Siflower SF19A2890
and various other Siflower MIPS and RISC-V SoCs.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 .../gpio/siflower,sf19a2890-gpio.yaml         | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/siflower,sf19a2890-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/siflower,sf19a2890-gpio.yaml b/Documentation/devicetree/bindings/gpio/siflower,sf19a2890-gpio.yaml
new file mode 100644
index 000000000000..7dab1e3f159c
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/siflower,sf19a2890-gpio.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/siflower,sf19a2890-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Siflower SF19A2890 GPIO controller
+
+maintainers:
+  - Chuanhong Guo <gch981213@gmail.com>
+
+properties:
+  compatible:
+    const: siflower,sf19a2890-gpio
+
+  gpio-controller: true
+  "#gpio-cells":
+    const: 2
+
+  gpio-ranges: true
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      Interrupt mapping, one interrupt per 16 GPIOs.
+    minItems: 1
+    maxItems: 10
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  ngpios:
+    description:
+      The number of GPIOs available on the controller implementation.
+    minimum: 1
+
+required:
+  - compatible
+  - clocks
+  - gpio-controller
+  - gpio-ranges
+  - interrupt-controller
+  - interrupts
+  - ngpios
+  - reg
+  - resets
+  - "#gpio-cells"
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+    gpio@19d00000 {
+      compatible = "siflower,sf19a2890-gpio";
+      reg = <0x19d00000 0x100000>;
+      interrupts = <GIC_SHARED 246 IRQ_TYPE_LEVEL_HIGH>,
+        <GIC_SHARED 247 IRQ_TYPE_LEVEL_HIGH>,
+        <GIC_SHARED 248 IRQ_TYPE_LEVEL_HIGH>,
+        <GIC_SHARED 249 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&gpioclk 0>;
+      resets = <&gpiorst 0>;
+
+      gpio-controller;
+      #gpio-cells = <2>;
+      ngpios = <49>;
+      gpio-ranges = <&pinctrl 0 0 49>;
+
+      interrupt-controller;
+      #interrupt-cells = <2>;
+    };
-- 
2.47.1


