Return-Path: <linux-gpio+bounces-1280-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 568FC80E480
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 07:52:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10BB8282DE0
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 06:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA181641B;
	Tue, 12 Dec 2023 06:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hddesrMn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B61DCB;
	Mon, 11 Dec 2023 22:52:18 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d098b87eeeso46755895ad.0;
        Mon, 11 Dec 2023 22:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702363938; x=1702968738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QA/FnH40gld5sZ9cU7lEAib9rz+6JbdSh5ui3kZWjE8=;
        b=hddesrMnYpUK8yirUVgh9fnnzKGFuSCHK6YDDUBdyVGWstZBQsaWBjMLs3piztVuxT
         UyZmASBIDffRB5IDWEIWljhkYmR3LEXlw15RfNVQJfr2vLiiTiztGUcIKf3/PHSJoImK
         JGbrOtxtYFsuypWJ9CdNL0cAvxDIrtCt1fp+boXoI6gVEJ76PbWfbyP7dKpZukbs2Vtt
         UXad0h8bY7R0Mlqd9zrc+oKNJ7IsxqAvYfcsKdd+O1CwY4gKR4RMs6ad9A7t6qp2R6w4
         WiSchP51WRWfel54U2+LswDG/2lBPm52FIiCZDv6woh8hncDnAc04FsrjTc5e85h7mJc
         govg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702363938; x=1702968738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QA/FnH40gld5sZ9cU7lEAib9rz+6JbdSh5ui3kZWjE8=;
        b=wn4dt/ETlLIe3tuWAy0tKQFEDlk5/5JBD+iA8ZbJL0yzcV+iR5aQnseycnPLIGIKIh
         WD4scB4nQiw+T4fLF1yPkyqiAN2iVPfl+dI6ZHgfgzy/d+kCge10b9oMfUZl+nM7e5t+
         EqKimFfAWPFq4KTq7lBEBXlsSAgA9K505okDH8pISiwzp2BJanj1x4IYgrUZn54krgaj
         ECVZZKpJOjZdH4rzpa5Lg8GR7ije63Zi6FwoqEr91NE3fk6+8edFrQ6NQvk0C/5u/l+t
         SbQIJ2VWG6+02giJ/ffDsBcPLAs6Tf478OiY8jAPIJqVi/VtPyVfX5yWxfD9r6DJX6NH
         4iNA==
X-Gm-Message-State: AOJu0YyQsEG8U7gno4x8kr9D6d3bF7WEr7IS/taP+PVGZeDF3vkzwnhR
	H2DnZdti0/gRBLE2LyOl/ps=
X-Google-Smtp-Source: AGHT+IGoegdA65SLyD3sAEH/K64MOBzSS2vgEJTgxEhoD6tL+tjU9RAylPhkLWNjuCdxvk1Q/qW/Gw==
X-Received: by 2002:a17:902:e807:b0:1d1:cb7a:a908 with SMTP id u7-20020a170902e80700b001d1cb7aa908mr6833404plg.60.1702363937710;
        Mon, 11 Dec 2023 22:52:17 -0800 (PST)
Received: from localhost.localdomain ([1.200.151.130])
        by smtp.gmail.com with ESMTPSA id z3-20020a170903018300b001d0c4869725sm7855221plg.97.2023.12.11.22.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 22:52:17 -0800 (PST)
From: Jim Liu <jim.t90615@gmail.com>
To: jim.t90615@gmail.com,
	JJLIU0@nuvoton.com,
	KWLIU@nuvoton.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	andy@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v9 1/3] dt-bindings: gpio: add NPCM sgpio driver bindings
Date: Tue, 12 Dec 2023 14:51:45 +0800
Message-Id: <20231212065147.3475413-2-jim.t90615@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212065147.3475413-1-jim.t90615@gmail.com>
References: <20231212065147.3475413-1-jim.t90615@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: *

Add dt-bindings document for the Nuvoton NPCM7xx sgpio driver

Signed-off-by: Jim Liu <jim.t90615@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes for v9:
   - no changed
Changes for v8:
   - no changed
Changes for v7:
   - no changed
---
 .../bindings/gpio/nuvoton,sgpio.yaml          | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml b/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
new file mode 100644
index 000000000000..84e0dbcb066c
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/nuvoton,sgpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton SGPIO controller
+
+maintainers:
+  - Jim LIU <JJLIU0@nuvoton.com>
+
+description: |
+  This SGPIO controller is for NUVOTON NPCM7xx and NPCM8xx SoC.
+  Nuvoton NPCM7xx SGPIO module is combine serial to parallel IC (HC595)
+  and parallel to serial IC (HC165), and use APB3 clock to control it.
+  This interface has 4 pins  (D_out , D_in, S_CLK, LDSH).
+  NPCM7xx/NPCM8xx have two sgpio module each module can support up
+  to 64 output pins,and up to 64 input pin, the pin is only for gpi or gpo.
+  GPIO pins have sequential, First half is gpo and second half is gpi.
+  GPIO pins can be programmed to support the following options
+  - Support interrupt option for each input port and various interrupt
+    sensitivity option (level-high, level-low, edge-high, edge-low)
+  - ngpios is number of nuvoton,input-ngpios GPIO lines and nuvoton,output-ngpios GPIO lines.
+    nuvoton,input-ngpios GPIO lines is only for gpi.
+    nuvoton,output-ngpios GPIO lines is only for gpo.
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm750-sgpio
+      - nuvoton,npcm845-sgpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  nuvoton,input-ngpios:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The numbers of GPIO's exposed. GPIO lines is only for gpi.
+    minimum: 0
+    maximum: 64
+
+  nuvoton,output-ngpios:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The numbers of GPIO's exposed. GPIO lines is only for gpo.
+    minimum: 0
+    maximum: 64
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+  - interrupts
+  - nuvoton,input-ngpios
+  - nuvoton,output-ngpios
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    gpio8: gpio@101000 {
+        compatible = "nuvoton,npcm750-sgpio";
+        reg = <0x101000 0x200>;
+        clocks = <&clk NPCM7XX_CLK_APB3>;
+        interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        nuvoton,input-ngpios = <64>;
+        nuvoton,output-ngpios = <64>;
+    };
-- 
2.25.1


