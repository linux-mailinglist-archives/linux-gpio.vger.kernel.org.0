Return-Path: <linux-gpio+bounces-27618-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B71C0B711
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 00:18:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 048E34ED84F
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Oct 2025 23:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C38C30101A;
	Sun, 26 Oct 2025 23:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rxpo9G//"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E883009F5
	for <linux-gpio@vger.kernel.org>; Sun, 26 Oct 2025 23:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761520704; cv=none; b=ifcxJjXh9c1osImsoCztjjGtia7spO1T6zJF5Wb+z31nZSJdkCzAgi3K7VNCS87/+JTyo4nDBwoZmYqEUYkMiyai2Lk2IuYHFwAvdnNqzBVX2mVlzhlBxeCiH8xZn47p6Fel/HniD6wnQwo8xhqsVdcWmzRt0GiF/j2CipZqSGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761520704; c=relaxed/simple;
	bh=E4LUSFJuH8xqIHw6adJ7z9S5S1JC/5ZujNe34lPd0xI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d47+T3R6gUsM+nwYHoYOkarVXquQSpaHyEPJirYdjIV5dSqIek1lrX0t61g3o5zd1PHoPMTFC6hw8G/GyQFzBmpxwxQJr8qVudHAljBmKOwPMD9KVWo52mzOu0Z35RjGPjMj/u2NDhMRRr71uV/KrqkxdawTseyw4MN6ZiJw0yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rxpo9G//; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-63e0abe71a1so8052099a12.1
        for <linux-gpio@vger.kernel.org>; Sun, 26 Oct 2025 16:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761520700; x=1762125500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9ZOz8cXSTa3B6pHuY7KFejgV/aD4XEibzOR0qxVt50=;
        b=Rxpo9G//i4CpkZQ9+ij64r5wim8tQuUyD45g6L9YhqyWt9hpF4d9IOI/r7QhP5SOkq
         jBV9wfHOTSXI/4wRVKMeRmHEwKIRRrZ33KApYI7e991h7RV9uWLiuHkSz4MOyrUyKe/6
         2EwnNHfqC1/mP5gCTk8IKrmzNep1qy+0hAVxoxRMLgmdUs7pnRPjKU90I1YGhwEnXkHU
         GqTgUlYOjsSK8jsL4RaqhtwrbbgcHDEnEMDO7+tj7PTFlD5fnYkD5G1ADxY59ZNIXKUq
         1mZX6U4f9LAwchQl0K9+cO+v9bymGCim0Q4ZZhpYou8cbzPbNwyIsQr/0fAmOv5u/Vy8
         B90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761520700; x=1762125500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9ZOz8cXSTa3B6pHuY7KFejgV/aD4XEibzOR0qxVt50=;
        b=bmtrtqdAsJjildMCKb5zrNCuYXqk9r+iyy4d3RnQm+4jNf222mJO9x7VLW8/rQ2UTJ
         nD82N+mK7yS6dj3QIb/AH1gJ0DW9YcwaxItB54qZDFYxkvMI5qKexmBe3TMsCCjJD79Y
         9jiC0wsla+JHfh621S87nTdVbspC9aeQdmnCLsa16vGOolcMQevwajD7LlKQbEqZHnvH
         SImG5w8kq0ubxaLGZlrggleFEQFEGuvvMKtLLzZUJJH0PjcG871886xaNfdT1Zv2+QGZ
         DTW6fFsmnmUsdh5dcfkeyCxTBS1Fsj1937GMC0gklPmVVxd+e23ZO4k42qizD/NDkAF3
         ML6Q==
X-Gm-Message-State: AOJu0Yy+9Mq3pmjZrElUPg+tRsdyP49zeLihqQcV8pTZrQJEd/CyH1Ez
	7Dht8VBkE//vFkHCj4gvRVtZ2EaIqggNTpYF8PfVm99WClqFaRNLCYZE
X-Gm-Gg: ASbGncuCbThc2vkSgYGJVVXSAqAEDiHyYbqgjiy69/RYHgSlcf1w/hkJ/JJT42jqV9N
	fYPm/ODGeGnmCwzzgT6Guq08wWtwKe/NBtYp9lt0yPcSRIPBECFrAx9Iw++Do2TXzcWutm+rirY
	x3u0JoFfXHjOdpFMy2M9CSKHPb0D8n/wO21tbXB+srMENEsFrQvtJwkT1SjlJdeHPrO4FuUheZ9
	YEievVKtqPpec4wlqW+2uA9mcHgx310P/L3Ue6YZX4A0taxH3iQ5vJQtQA1BlxJFZ2n8+J8Gr8h
	bBbU3vj35eIJZ5AzgfvU58jmNDxuoKtC27QM5dxFxqybGtRqny03jzCrl6svJBxIRu2YsibZUrU
	bioQ5OWHZ/NcWZbnR515jTZJPYbK+rUJew2wqeKWm1/6upKGgV2M18/20gUYZmaBXp+PrwkX7IT
	qIrJY=
X-Google-Smtp-Source: AGHT+IEfEWMBpuXB6esQrBxKFWN/QBT+PeLNQP1j9P5NPPvwz0/rY/HNSQBn0WwC4+Hiu2oqxC+6fg==
X-Received: by 2002:a05:6402:90b:b0:63e:f2d:b179 with SMTP id 4fb4d7f45d1cf-63e3e585ce9mr11470847a12.29.1761520699454;
        Sun, 26 Oct 2025 16:18:19 -0700 (PDT)
Received: from builder.. ([2001:9e8:f109:5716:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef82865sm4847379a12.9.2025.10.26.16.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 16:18:19 -0700 (PDT)
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
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: gpio: add gpio-line-mux controller
Date: Sun, 26 Oct 2025 23:17:53 +0000
Message-ID: <20251026231754.2368904-2-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251026231754.2368904-1-jelonek.jonas@gmail.com>
References: <20251026231754.2368904-1-jelonek.jonas@gmail.com>
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
---
 .../bindings/gpio/gpio-line-mux.yaml          | 108 ++++++++++++++++++
 .../devicetree/bindings/mux/gpio-mux.yaml     |  30 +++++
 2 files changed, 138 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml b/Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml
new file mode 100644
index 000000000000..4c907a35eb4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml
@@ -0,0 +1,108 @@
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
+description:
+  A GPIO controller to provide virtual GPIOs for a 1-to-many mapping backed by
+  a single shared GPIO and a multiplexer. A simple illustrated example is
+
+            +----- A
+    IN/OUT /
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
+     M1 M0   IN/OUT
+      0  0   A
+      0  1   B
+      1  0   C
+      1  1   D
+
+  This can be used in case a real GPIO is connected to multiple inputs/outputs
+  and controlled by a multiplexer, and another subsystem/driver does not work
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
+    minItems: 1
+    items:
+      type: string
+
+  gpio-line-names: true
+
+  mux-controls:
+    maxItems: 1
+    $ref: /schemas/mux/mux-controller.yaml#
+    description:
+      Phandle to the multiplexer to control access to the GPIOs.
+
+  ngpios: false
+
+  shared-gpio:
+    description:
+      GPIO which is the '1' in 1-to-many and is shared by the virtual GPIOs
+      and controlled via the mux.
+
+required:
+  - compatible
+  - gpio-controller
+  - gpio-line-mux-states
+  - mux-controls
+  - shared-gpio
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/mux/mux.h>
+
+    sfp_gpio_mux: gpio-mux {
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
+        shared-gpio = <&gpio0 2 GPIO_ACTIVE_HIGH>;
+
+        gpio-line-names = "SFP1_LOS", "SFP1_MOD_ABS", "SFP1_TX_FAULT";
+        gpio-line-mux-states = <0>, <1>, <3>;
+    };
+
+    sfp1: sfp-p1 {
+        compatible = "sff,sfp";
+
+        los-gpios = <&sfp1_gpio 0 GPIO_ACTIVE_HIGH>;
+        mod-def0-gpios = <&sfp1_gpio 1 GPIO_ACTIVE_LOW>;
+        tx-fault-gpios = <&sfp1_gpio 2 GPIO_ACTIVE_HIGH>;
+    };
diff --git a/Documentation/devicetree/bindings/mux/gpio-mux.yaml b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
index ef7e33ec85d4..57eb1e9ef4cf 100644
--- a/Documentation/devicetree/bindings/mux/gpio-mux.yaml
+++ b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
@@ -100,4 +100,34 @@ examples:
             };
         };
     };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    sfp_mux: mux-controller {
+        compatible = "gpio-mux";
+        #mux-control-cells = <0>;
+
+        mux-gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>,
+                    <&gpio0 1 GPIO_ACTIVE_HIGH>;
+    };
+
+    sfp_gpio: sfp-gpio-1 {
+        compatible = "gpio-line-mux";
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        mux-controls = <&sfp_mux>;
+        shared-gpio = <&gpio0 2 GPIO_ACTIVE_HIGH>;
+
+        gpio-line-names = "SFP_LOS", "SFP_MOD_ABS", "SFP_TX_F";
+        gpio-line-mux-states = <0>, <1>, <2>;
+    };
+
+    sfp0: sfp-p0 {
+        compatible = "sff,sfp";
+
+        los-gpios = <&sfp_gpio 0 GPIO_ACTIVE_HIGH>;
+        mod-def0-gpios = <&sfp_gpio 1 GPIO_ACTIVE_LOW>;
+        tx-fault-gpios = <&sfp_gpio 2 GPIO_ACTIVE_HIGH>;
+    };
 ...
-- 
2.48.1


