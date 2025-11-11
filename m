Return-Path: <linux-gpio+bounces-28344-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AA7C4CAA2
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 10:30:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 678D04EB1CF
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 09:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB44B2F1FD3;
	Tue, 11 Nov 2025 09:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GOMq3Pnz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B654435950
	for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 09:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762853234; cv=none; b=sKOF2UoVuvep1Kzoh0pVY6t7tQLiHLGNDGGU2VJceZDT/xUc7qU86kSsr8RPmxGHt6nsxCO6ticR9ELYkvD8oUT7P0KkbvbYte/H9IT1COwHdH1KZcJlH9b8QEALeqAz3Fwx7FWC8kK5oCgXvphX3h3g2iuufEch0DErktmqxLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762853234; c=relaxed/simple;
	bh=pCONCT1Mz2rcdeKnyJtzVqBxrE/ew++NH2w5XjdtUno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r8QZKZrf5XA6T85MnIpgkiprXan+xKom9fJDrBZtM0XC5Wv5uV35x4QoDN6SApvVM7yp6UcI+oz2h/wkB9ygEEy/lMLD2pGpuOozJzcCLT7Z6PVIBpukT8h8Ki8fTs4HKhXDFxPivbBx+tKlO8xw8oaramYi0Ob61V2EghJcOKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GOMq3Pnz; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b312a08a2so1995364f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 01:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762853231; x=1763458031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTGHw2wYhtc4Y/i+QYoRz81XM72wiR9wQ453plCnIys=;
        b=GOMq3PnzBCLgrVUfjom3DUcYm9Dk+kwbySFMU6EwAZfsjLPk4b8760RlBmwi326tdm
         7JQ3im3M0k7GtEQZe6zHsl15P+bfatwBFGnPWwmYDDRaOtK1RSyPk/ix1Qnqa8q5uaZO
         lfr6IOk8be60KGE6IIQ19o7PdQauN+YeCIlEnTu3ZPitGAToxvE4l62RVaoyyuzT75Vo
         o0wi8UJx3/aepg/YMB3ejbaMiM009k1soWOIia0F6HJhAZz2ZxQtzmOqhDB9wNxHz3lA
         G/2zEOevqyKQ8F7NoAM50TxkAClKkaxWeqab6boNf2Wnl7hXEVQDcwn7w9TyEUhGLYql
         dUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853231; x=1763458031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TTGHw2wYhtc4Y/i+QYoRz81XM72wiR9wQ453plCnIys=;
        b=j/zNXdnFXoDPMHakIRXo0c8bFh/vvAV/2fn8Wc/53YNE+p5+gTihJXgU04VLU2UXWm
         wRxgSl4G/tv4Ab5/CPHElTLFhmY+mp07kohdHcHyJaDAJMa/7ZachpJs654UJGCyANU7
         O8s3UrMyHX5J7nuJwW8S0oZ116flT1nSpxhAMzNXun381+sXxgbfs5Q+kjR2tvy7HEIv
         e/AWeHd/zeCr1A27swSl0x7WCkcBODgK8jWtfSpqeDX9y1QM2thLlyVL059CTbcPYw5O
         hXJwkaAypAyekpK7bJ6hnkjIdcL8ZuDKoO+x56CpEEFeZM+7RpPanL1A/ueBMlt/cWpO
         uAzQ==
X-Gm-Message-State: AOJu0Yz5WGRrfFaOFbBWCQ4ZCdJt6IOgeUbEDaPxmeSAGLX8YcNngmKc
	2lAgHuJSxgjxJ8BujJhZ8kIG8kcoRr2BgUD+N98t2rPOTfk/CWiEqn+U
X-Gm-Gg: ASbGncvKFbOr03FhnDGrhGT3EJ1hAyHjuCOTRR3DUxKZlk1J/h3GzgoeDfViHwQ3SG+
	3l/+CqDcjj/ihIRp8mJ23LHWpSHmRaQeJ8nx5gMsKJe5JyCXa6l4fCfmT2JM67wXVJu5TJShRA5
	knefC3oME2/cf2LaWhLSrqkEy3tM2xKH2uWMmhIfQpNThnaMB0KV4U+yenSs+5F/Kwf+VbpTfDd
	CoeOs1EI8yHhj+w6xSxdoTykDRda2gcWpw6xmvoDAiy5EckU7ArGttle+1/XyVVBdfKu7OCWvab
	1Hq8pS+zfauVN2q5ZzmCrOjAIr2GrChbs85ru56Fzv7NC0tYW5N3Z9tXnXogieNbWIjkztBmsCx
	EYKjvRU4CI8Vq61LgueSORNQPX2p7o4k5v4G9hrKpyyMjTqcQs+lk31ufhdrfvkSj2v717NrWai
	k5B9A=
X-Google-Smtp-Source: AGHT+IGBifXqy242Ns3xjfBr9K2JFF4pKkxyiE/nclOky8SySYLr6IREuvFpJkHchyln+byC5Z2qSQ==
X-Received: by 2002:a05:6000:2a8a:b0:42b:3825:2ac8 with SMTP id ffacd0b85a97d-42b382530a0mr5530778f8f.59.1762853230774;
        Tue, 11 Nov 2025 01:27:10 -0800 (PST)
Received: from builder.. ([2001:9e8:f12a:4216:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac67921c3sm27464641f8f.40.2025.11.11.01.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:27:10 -0800 (PST)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Richard <thomas.richard@bootlin.com>,
	Jonas Jelonek <jelonek.jonas@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/2] dt-bindings: gpio: add gpio-line-mux controller
Date: Tue, 11 Nov 2025 09:27:03 +0000
Message-ID: <20251111092705.196465-2-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251111092705.196465-1-jelonek.jonas@gmail.com>
References: <20251111092705.196465-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-schema for a gpio-line-mux controller which exposes virtual
GPIOs for a shared GPIO controlled by a multiplexer, e.g. a gpio-mux.

The gpio-line-mux controller is a gpio-controller, thus has mostly the
same semantics. However, it requires a mux-control to be specified upon
which it will operate.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/gpio/gpio-line-mux.yaml          | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml b/Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml
new file mode 100644
index 000000000000..0228e9915b92
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-line-mux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO line mux
+
+maintainers:
+  - Jonas Jelonek <jelonek.jonas@gmail.com>
+
+description: |
+  A GPIO controller to provide virtual GPIOs for a 1-to-many input-only mapping
+  backed by a single shared GPIO and a multiplexer. A simple illustrated
+  example is
+
+            +----- A
+    IN     /
+    <-----o------- B
+        / |\
+        | | +----- C
+        | |  \
+        | |   +--- D
+        | |
+       M1 M0
+
+    MUX CONTROL
+
+     M1 M0   IN
+      0  0   A
+      0  1   B
+      1  0   C
+      1  1   D
+
+  This can be used in case a real GPIO is connected to multiple inputs and
+  controlled by a multiplexer, and another subsystem/driver does not work
+  directly with the multiplexer subsystem.
+
+properties:
+  compatible:
+    const: gpio-line-mux
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-line-mux-states:
+    description: Mux states corresponding to the virtual GPIOs.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  gpio-line-names: true
+
+  mux-controls:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+    description:
+      Phandle to the multiplexer to control access to the GPIOs.
+
+  ngpios: false
+
+  muxed-gpios:
+    maxItems: 1
+    description:
+      GPIO which is the '1' in 1-to-many and is shared by the virtual GPIOs
+      and controlled via the mux.
+
+required:
+  - compatible
+  - gpio-controller
+  - gpio-line-mux-states
+  - mux-controls
+  - muxed-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/mux/mux.h>
+
+    sfp_gpio_mux: mux-controller-1 {
+        compatible = "gpio-mux";
+        mux-gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>,
+                    <&gpio0 1 GPIO_ACTIVE_HIGH>;
+        #mux-control-cells = <0>;
+        idle-state = <MUX_IDLE_AS_IS>;
+    };
+
+    sfp1_gpio: sfp-gpio-1 {
+        compatible = "gpio-line-mux";
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        mux-controls = <&sfp_gpio_mux>;
+        muxed-gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
+
+        gpio-line-names = "SFP1_LOS", "SFP1_MOD_ABS", "SFP1_TX_FAULT";
+        gpio-line-mux-states = <0>, <1>, <3>;
+    };
+
+    sfp1: sfp-p1 {
+        compatible = "sff,sfp";
+
+        i2c-bus = <&sfp1_i2c>;
+        los-gpios = <&sfp1_gpio 0 GPIO_ACTIVE_HIGH>;
+        mod-def0-gpios = <&sfp1_gpio 1 GPIO_ACTIVE_LOW>;
+        tx-fault-gpios = <&sfp1_gpio 2 GPIO_ACTIVE_HIGH>;
+    };
-- 
2.48.1


