Return-Path: <linux-gpio+bounces-6488-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB938CA5B9
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 03:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFD5B2826AC
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 01:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9091A175AA;
	Tue, 21 May 2024 01:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUugdTHE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1175134BD;
	Tue, 21 May 2024 01:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716254702; cv=none; b=loEJbUN2nx+JMLTzLWWbX1tES/6xcwzUtSQ5SW7A9OWS6Lm/j/uR5jMMPzwA6ozxJWsEVoFeA5PqUGGc5utmaGgm1xY7bDdpMjZFVnMjftAnvpZxNnQRtFeuAZRq+bBDSexxUaYImK+EeLVycHed7iZMRbi58uW1E91x0YPRciA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716254702; c=relaxed/simple;
	bh=uxrxbmAsPMLr8gccagqykeHs29KBvyewDg+sm6EJ0OA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RmjM26u7Emn13Lmx6vLYXy2qjfYpJpDg3wC94qzRX1yMwNx5mqXorqPlt1AjYwYMFGibqTv97mLC3luDeVz1BZoJUxrrac12Pyx3y9KLTuVmyvJrlxcCt6352T4HQydSRpmGza3u7Ry9JozvCDIQAebHcJwZ+gmOWiERGHoUMIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUugdTHE; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5b2dec569e3so2048566eaf.2;
        Mon, 20 May 2024 18:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716254700; x=1716859500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdRAuvJPzDOFmcmDaL4P+X32ok4kuqJZRpeCq1BZFBg=;
        b=ZUugdTHEnoX/430n4povxHvTqBwF6UFS7GCvGK5EbSCEVLN9T4ixK85U3tv/pFzIpV
         CzIObpD4+o8EGBE64KcZVhGdGKf1tcKZk9EMo3ZSil4iiwU5YRivfQja8axeOfvMFUAy
         5vAsQz2k9YBVDX3Xh8yfq35Aypuh9RfkMwjFc5liy//IdEfre6LN3wGcnUwW4mH0SSOa
         wionBGmsk8N2u+lQ+JRAlhDIqnNDf0G/egU471InI0+RdxYq9FaGsmdVIbm/uRgGZ9gg
         mS/mvafl7v+DjbiiqTZMS2LI0T93W5HujMrVDW966PPPR9mkZfwQyt8mH/HfMFKXCkmc
         PJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716254700; x=1716859500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdRAuvJPzDOFmcmDaL4P+X32ok4kuqJZRpeCq1BZFBg=;
        b=D0AAiUZ5HeEoxyIg6HxA4VMX15yhoCJGxADQo8Opz4tdpFDIUe6XbFrX3/hFxAL/jo
         a+ntJ/3j0NkmjnG02aV7nYfhsu/wJRz/TYFMpmdsuJSHvipXjNQXvfpiYhXMnWxqUqVz
         i5IL7WFzkSBZzd1KNaVzmMQ6Ur/fBp4dayHm+9c/U8UM1IAfrYY575LhSP3haWF5YQYb
         MaXDShURku8C4H8oei5/MOri9IJ0D8gg97QXpEDb05YVf0hCB2Y5GdAMfMuTbkN73hec
         sEZH49adjE6AqkifO2ieq+6MUIKfa76yvRjbz4E+cogRigd8KzoOyXMS87qoWFVGElDY
         8DKw==
X-Forwarded-Encrypted: i=1; AJvYcCUFQEdQc+BvFHtBIKGlCHGOC/FbYA7eOjuznMsLlt22zP4/U/NreM3GGtwmeNtXPMJdkZ10OHPkAv8egE8e32tI70ZP4rRuhaytBE8HIfkjf/RXVeJGU7UE4Ro2i9ET9DgqG1ASupJEUU+t+UNhrE0SDxF8fTMwA/c6Wa+O0M+77pV0YGI=
X-Gm-Message-State: AOJu0YyxgaLjQyMeLqI/11i2sJ8vPMuprUrBvpYuHSn6hKc0MQeO+QRZ
	8Ob2/XO7vkc2LRTv/ESDtmAGbp7R6IEJm+urC1mqH7VY+8NtquT0
X-Google-Smtp-Source: AGHT+IHPcfzJcWQiq1E+secdKFkWNB2WjHG3/RItAnrxWXGy89HFnHGzso1KiNeMDhjg0mQNr8qaGA==
X-Received: by 2002:a05:6358:431c:b0:17e:8e7f:59f9 with SMTP id e5c5f4694b2df-193bcfc5b63mr3300298055d.26.1716254699701;
        Mon, 20 May 2024 18:24:59 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-65e149dd925sm6477563a12.58.2024.05.20.18.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 18:24:59 -0700 (PDT)
From: Jacky Huang <ychuang570808@gmail.com>
To: linus.walleij@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 2/3] dt-bindings: pinctrl: Document nuvoton ma35d1 pin control
Date: Tue, 21 May 2024 01:24:46 +0000
Message-Id: <20240521012447.42211-3-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240521012447.42211-1-ychuang570808@gmail.com>
References: <20240521012447.42211-1-ychuang570808@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacky Huang <ychuang3@nuvoton.com>

Add documentation to describe nuvoton ma35d1 pin control and GPIO.

Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../pinctrl/nuvoton,ma35d1-pinctrl.yaml       | 178 ++++++++++++++++++
 1 file changed, 178 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,ma35d1-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,ma35d1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,ma35d1-pinctrl.yaml
new file mode 100644
index 000000000000..763a49bd07dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,ma35d1-pinctrl.yaml
@@ -0,0 +1,178 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 pin control and GPIO
+
+maintainers:
+  - Shan-Chun Hung <schung@nuvoton.com>
+  - Jacky Huang <ychuang3@nuvoton.com>
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,ma35d1-pinctrl
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  nuvoton,sys:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle of the system-management node.
+
+  ranges: true
+
+patternProperties:
+  "^gpio@[0-9a-f]+$":
+    type: object
+    properties:
+      gpio-controller: true
+
+      '#gpio-cells':
+        const: 2
+
+      reg:
+        maxItems: 1
+
+      clocks:
+        maxItems: 1
+
+      interrupt-controller: true
+
+      '#interrupt-cells':
+        const: 2
+
+      interrupts:
+        description:
+          The interrupt outputs to sysirq.
+        maxItems: 1
+
+    required:
+      - gpio-controller
+      - '#gpio-cells'
+      - reg
+      - clocks
+      - interrupt-controller
+      - '#interrupt-cells'
+      - interrupts
+
+    additionalProperties: false
+
+  "-grp$":
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    patternProperties:
+      "-pins$":
+        type: object
+        description:
+          A pinctrl node should contain at least one subnodes representing the
+          pinctrl groups available on the machine. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to muxer
+          configuration, pullups, drive strength, input enable/disable and input
+          schmitt.
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+
+        properties:
+          nuvoton,pins:
+            description:
+              Each entry consists of 4 parameters and represents the mux and config
+              setting for one pin.
+            $ref: /schemas/types.yaml#/definitions/uint32-matrix
+            minItems: 1
+            items:
+              items:
+                - minimum: 0
+                  maximum: 13
+                  description:
+                    Pin bank.
+                - minimum: 0
+                  maximum: 15
+                  description:
+                    Pin bank index.
+                - minimum: 0
+                  maximum: 15
+                  description:
+                    Mux 0 means GPIO and mux 1 to 15 means the specific device function.
+
+          power-source:
+            description: |
+              Valid arguments are described as below:
+              0: power supply of 1.8V
+              1: power supply of 3.3V
+            enum: [0, 1]
+
+          drive-strength-microamp:
+            oneOf:
+              - enum: [ 2900, 4400, 5800, 7300, 8600, 10100, 11500, 13000 ]
+                description: 1.8V I/O driving strength
+              - enum: [ 17100, 25600, 34100, 42800, 48000, 56000, 77000, 82000 ]
+                description: 3.3V I/O driving strength
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          input-schmitt-disable: true
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - nuvoton,sys
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+
+    pinctrl@40040000 {
+        compatible = "nuvoton,ma35d1-pinctrl";
+        reg = <0x40040000 0xc00>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        nuvoton,sys = <&sys>;
+        ranges = <0x0 0x40040000 0x400>;
+
+        gpio@0 {
+            reg = <0x0 0x40>;
+            interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk GPA_GATE>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+        };
+
+        uart-grp {
+            uart11-pins {
+                nuvoton,pins = <11 0 2>,
+                               <11 1 2>,
+                               <11 2 2>,
+                               <11 3 2>;
+                power-source = <1>;
+                bias-disable;
+            };
+        };
+    };
-- 
2.34.1


