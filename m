Return-Path: <linux-gpio+bounces-29951-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E6ACE00BC
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 19:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEADF30249CA
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 18:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD8032573A;
	Sat, 27 Dec 2025 18:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/pX28Lb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D5D1F3D56
	for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 18:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766858506; cv=none; b=IvIrAF4AyP6pxyHskZiMQb4Mhd16YCO4LimTcW8MdbSyzjrXVpq4/MLx/Sryy604tj81YVQPiNjR7OxAtnC0P/3FwhsmMl9CYtfRc3Qocr11p7gsNKSeRQry7KldZLU2mOYSdLgajwhx4a4CyBKRb/z6A5usbHJBbyVE8hNkpIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766858506; c=relaxed/simple;
	bh=RzAjmD2QpwAb0Iwims6jlShtVpnuGrDR/qh6hQP5qd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lIzXPsRp6cfF17yxNfH62W9JrtNrc+kffQXr1ttzmrbHagjbGJcRnECsXHplSIQ57iXk6gLB98DqSQkQ167FrzrnYK0MF7blva/syiy3AHl3eLqKdbsNXBZb3qXDOejgVhQIi30ovKK8IPQBe6kViTupmIv/WvQUc9OwUFsJD2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/pX28Lb; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so1631858366b.3
        for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 10:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766858503; x=1767463303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNr2NQjhqtvw3/ELF26rbEOZcLfS+9yH2UWT2cZxXrM=;
        b=l/pX28LbpA/BBYn/OWRgBWNQEVnwZEn1yTmvC2pymkKLYjwnFKqB8gqXlSQry7mpb6
         NtRj97zjq+sE45fBlBZetlrouA4ACA9EVvkkM2nFjGuVv4hxrQrmkB5hEQFiqG3WhD8f
         W/NH0Wp6PLwx3Z1SSL8IK1C61fGkWzWgC/nlTW6Z/NcUZu7UGKl+xcGwq78GxsDypCbK
         HtHvHNj82f9oBF1wUuMm2maeh6JegtxD9DBuqkJrM/8TERGrl/HjuuR62KCowIGP/eV5
         OL30MDa39qknTGiWkaJWw1d8Of6aWohABHGIRdS0pwHXYGZMFAIqq50itBo1N+2wx6WB
         FsbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766858503; x=1767463303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vNr2NQjhqtvw3/ELF26rbEOZcLfS+9yH2UWT2cZxXrM=;
        b=XUdbirlrl40KnhjJezb4EJWLP26Kcliup8XUReDxLXODFQnbeLIfIlWzuA/YslNOVi
         wptLPQi1w+Tk2Pnr+wEVS5x62J25YBJ4U2/gqG4c8Aw/1YY9VQg1yGw6uFY2hdOl9WnH
         fNprrsd+/h7eUXYmK7PIyFpl/4e20P2l5PxSaVr+0r+NM5KUaiYRmqXKhrynMB2WV6jl
         H8MUgrnLY3UECMhFAOoEXmv+WNB9gEpMeVbQ1LeuQuoxHnoREBdleftmhsgfQNjaScGK
         xv3VD9FVDp4aQNlsfQycbFwip6gdoVN2lg9uXDTckG4hBO5961e1QHleuxCN/46RHbm1
         ZkUA==
X-Gm-Message-State: AOJu0YwCHTywiM5QQMerWxsNn4l5ESwlnMaTBR+uDYxV9Ky7WOoU1dcT
	MO0dcmpiDMiOU1/DuPOzb2/6Hfs9sRV/f2tFAAZENiEVhRNDQJx+pYPn
X-Gm-Gg: AY/fxX5jvJ1kpxmGy/B9OIZO25Kd+hUWglmh265vajGt5A9ViJwldUo+xlr2j6v8TuW
	5Ql4633RADyeyvvCTG5N2c4iez/RkI4O5tPMF3+ImxprzYs5zfLutkHfi2R8Hu2xA9BJhUQL3U5
	GFqJ96X2CSkS0WjwPYWqh6qT2k8KuYljihu3nK9v75Mt3YFKQ5WO4SCgMbRmP81BqoeN8Yq7Tbb
	+YTZpXusVb0yHZvMGjxrU6c+NCnCaJwGQZFgBnR0uN1BYFcrorn/kNDLDCN38fiDqWDiTESab24
	/sb+YBg2HtxHnKyfZ2hTIz0mlzvnmZeRssQXUuyoafi0+ngU9ik56PfvXWF84WQ/oXzuRjlkrmF
	0TL2yumERrH5rZJRBHwSH2GFs6wtLIlvszQ9pmNbRSroocr4OzaLtkKjMLd1cut+2/YCmeHhHj4
	enOGDawpc3R2UVCSc=
X-Google-Smtp-Source: AGHT+IGgnTebWb4iw57E/p9PtBigV+m6q6bb9WY70BT7u/VewoxWOOpVr2GiX7SzqjX9JM7lg2ZmmQ==
X-Received: by 2002:a17:907:8686:b0:b76:8163:f1f8 with SMTP id a640c23a62f3a-b80371d6725mr2792072466b.53.1766858502693;
        Sat, 27 Dec 2025 10:01:42 -0800 (PST)
Received: from builder.. ([2001:9e8:f10d:7316:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de1421sm2794835666b.41.2025.12.27.10.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 10:01:42 -0800 (PST)
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
Subject: [PATCH v7 1/2] dt-bindings: gpio: add gpio-line-mux controller
Date: Sat, 27 Dec 2025 18:01:33 +0000
Message-ID: <20251227180134.1262138-2-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251227180134.1262138-1-jelonek.jonas@gmail.com>
References: <20251227180134.1262138-1-jelonek.jonas@gmail.com>
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
 .../bindings/gpio/gpio-line-mux.yaml          | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml b/Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml
new file mode 100644
index 000000000000..f49c05249ca7
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml
@@ -0,0 +1,107 @@
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
+  example is:
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


