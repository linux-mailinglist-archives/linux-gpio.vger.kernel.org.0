Return-Path: <linux-gpio+bounces-28138-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A94BCC36CCC
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 17:51:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 187074FEF22
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 16:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9393370F9;
	Wed,  5 Nov 2025 16:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kqc04odJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEBA3328FF
	for <linux-gpio@vger.kernel.org>; Wed,  5 Nov 2025 16:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762360595; cv=none; b=neUk4dT2eKE3ynzzGB+IDNliYrLLMHCmCCv/FFSu7N12AxNTRKjtNDR+KOoqkxuLVnpAqARIgeot/gMmJBalkCkSYB/MypDu7ITorXh+uByut6REX60BrsvJENjdyRQeG18TtECSSn9j1bbIN8qqDx7rEWuE09a8uRLYFGr35m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762360595; c=relaxed/simple;
	bh=vfu6o9FHVJ4VDzNtYkoiJcMRZrIdOAy2exAu63XzyUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mgEmVjSMBgshgfynpn2z3ZObjT1utrDK52UIVPbebgV2Uu7mnuUAdhmPeTusXEUJQrummrUsE54NiRrDsUncD66VcCyznx0C+16Pctu07bi/09zlF7FnsvtIcyPKJ1RpPCp9vrM7RX1O8Rps6h7/YjOenSiFCVd5Gk60lTwWoeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kqc04odJ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-429c2f6a580so36320f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 05 Nov 2025 08:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762360592; x=1762965392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyN2cVuH6Ij4/l0XiBzPZsewpM0QteHzVTa6BuG8uMQ=;
        b=Kqc04odJNFVZ6Kg6u+BKh/zMe5Nq1JSykuMZOLawMnGZ4dRBhC9u0E8ZUYz3Iuvvt5
         83uruEW2ngl0EKgoKPyX3p5ojT5kO4ZEmz3EIfrxXZdmZ2cBt1uzobXBJXt05UgVBlcG
         jWyb2AOxM5PaiPSNx7ktL1qJdMb2cbtm/Avemk5KNLfL7hOpNHnNxFnhDbr0x6+x6uxe
         dJK0smqOQPnGvC2JvSTRr0PvbE6N9ZD2RiN631zg2SCnzMRPHl5STiqPmUTFjON1Ltsh
         ycLgvdmavO6JG9Wu+3MpMJ3ycl6esUrtrYlO9towlI2ObC8gBYI2ElHeH7VvA+c4S5t0
         YFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762360592; x=1762965392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SyN2cVuH6Ij4/l0XiBzPZsewpM0QteHzVTa6BuG8uMQ=;
        b=lAucRfXymcArleUP8rFib2neBTAEQcXIGbRTXiQBR/pJr4xedWifrrJokUs492Cphy
         pmacb/o3DFiBzTAZs2M9e/rlxGkjKoxI8saFDWRi4GopSikPSb4Nnf3tZ4hgMtPKoOSt
         NYmOCKsG0eTlz6YGZWOaXvxzjm4CHR2bftbCnYplD/56e0szKpAwP+zpPNjWF70OwqTE
         pekgMu+gc6sU/xvCqt50Cw0XScOBxKkiJAt2B58HaWRbeseg33EFszNalMvxs2LbrS7c
         FoR7ovyQ4m9pvUSxyQEaIp712oOpB4/WpmfgeeB/WB+BehKgAnGPsrmHJJ6MCRJWkhLW
         8kMA==
X-Gm-Message-State: AOJu0YxJsS3LParz7fukUGSC6OLQp2N6JWRwD/PLnFK8DQ98Pu7ZI3q1
	U5464ExQgJ5mUdPZAZu5gTHkSP/soVnmVnu5RdIZD6WXR9h+LPvuuhQl
X-Gm-Gg: ASbGncvHm89m8h0gwyRAQ1J9VFcxIOJ7+Mpd45o9h7VyITnXE3VZgSph/1WLsqLwsD0
	PjSO+4hKFTmFbbAENFuMA0O30aCaTPK3A4V2srMPFE9KM/PDPAmdpOqwSFlyT3p47HywDPBhyUt
	dgrYsLco4Xc8SFBVw+gnyzVXVIVa8JzUGckxNssxyYLAiIXvFEawMhSTs2gcHl8rIgqX9OUCPxU
	VYt1+ObROzBHAMn46c+Uo5WVhnuvPqmTzkJbtof75+498EYzfTHtkMqZIHxBIVkIwbrpG0JqtJC
	K8GSGGg+SRMSOcBD8QdCxC+hOAbd4s8jyFnkj4sni3oPprt87+n42tE1kvLcqrilgNBKGapEzls
	Z5ei7yyJNOTgPu35VZy3lvFMeOOqAjBOj2L79WTmr50vY4Vkf6Ud4okxxiPwnwtHKTpkuYTKb7G
	S+UnAlDeQzDAPPqv/282Hn46rS
X-Google-Smtp-Source: AGHT+IGCBw9Dy87KEkMt7Df2kUZ9moWp+TlCQ57nJTSYSofiZKmn+TZAqLy7NV/99LZi7xe+WX7gPg==
X-Received: by 2002:a05:600c:8b54:b0:475:dd7f:f6cd with SMTP id 5b1f17b1804b1-4775ce2b845mr45093385e9.35.1762360591623;
        Wed, 05 Nov 2025 08:36:31 -0800 (PST)
Received: from builder.. ([2001:9e8:f106:5b16:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce3ef38sm57026755e9.17.2025.11.05.08.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:36:31 -0800 (PST)
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
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v5 1/2] dt-bindings: gpio: add gpio-line-mux controller
Date: Wed,  5 Nov 2025 16:36:09 +0000
Message-ID: <20251105163610.610793-2-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251105163610.610793-1-jelonek.jonas@gmail.com>
References: <20251105163610.610793-1-jelonek.jonas@gmail.com>
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


