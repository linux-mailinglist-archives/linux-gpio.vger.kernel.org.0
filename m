Return-Path: <linux-gpio+bounces-26906-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C53FCBC3AED
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Oct 2025 09:37:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A07903B5C3A
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Oct 2025 07:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22982F3612;
	Wed,  8 Oct 2025 07:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lz5ji5s+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38E32FBDF8
	for <linux-gpio@vger.kernel.org>; Wed,  8 Oct 2025 07:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908716; cv=none; b=kzeknoZqY+YEQeeT6vrKZnT92oB5qu+XIx3Arz6WFTs/ip8flEVZJGAKiX0Z7N5IS8zV725Ha/la1bBENC4HzhoAW1hYYbZSbOXeH052oJq5GypbkqBS15VJABEoQ/SluRE9fCvSM5JV1KihdfkdVC6J+4oQmDcXGLiO8ytktso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908716; c=relaxed/simple;
	bh=c2pf6RUA6JS/iU2qUlSvT28AQiDs7K4PthlzccZwX40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RYK7wv475MohBMhrXWqewPexQdD3docJQz0WfVjxUMQ7FEQJ5jBK0mNsvQwHkP1EQIYRPmgmKOaqgPzKr9KNAu+mZOalvN8UaCI94ycgtAEgbUk6lK2CpFqa+O8GrbAcNyWnpNEg8aWi1I2PKG1yl8HATmse3sb3V388XgK9MuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lz5ji5s+; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-57edfeaa05aso8453805e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Oct 2025 00:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908711; x=1760513511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4Sd98a7JjnJau3gJskbN1AlGmAjhGwkl8sNjJesON0=;
        b=lz5ji5s+16C1x0LUOCyBrXXOcjxWbymnh8kSnSKaZk6tufTLNHTAL685jyCrdWyi5t
         GmDld4D9/NDixRSYDjRyj0Q0XwLi3wRzqi1537pZomhywmBApPy/FnejIKO0HcUZyq28
         rZQHzhw30PD0brmpPkQR+MAkP4VOe9O9Z7vL/rvKoHRkpbz2BDQZHDuV7st7XmlRTNpa
         CQBonfxVW4EJdVGU/Q6sR4x9BeJFmwnQX4O3Ge/eRKytR3OXu9DfmIWRH8Bho+FcS3wj
         QKNKSKfMv+Fb+W5pKeJdqiUQ8sWUrkRcvz2ioS0NVVuRchkK2unEkKbA+Hb+/p0pVLO1
         f78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908711; x=1760513511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4Sd98a7JjnJau3gJskbN1AlGmAjhGwkl8sNjJesON0=;
        b=AsHUtgI1KpTSljNQUJWHTTgj1Y9JwuFww5cgAihyNOFWyuvUjvgLv+IaqQStJ54VRd
         TIcbNDnGJG99Oz0mJFqiem90rvryRaENW569x1dI92DWDT2yrz9kvMDYacBKvWdDSzOY
         hU3jIsl+0FY2gHtO5nW2lUCzqKj8OPX+VefX+zFIMpJsMgGPDE7FLwOYXRivO0eGRvBU
         HsMH/Sx5y6B5HJmkAqIZMmDuBdGFWf7RKjLpJXE+nHr08ytGJnQ7SaEipwRgyMzzZTIE
         mlK2zvlQhnhZTvc8evIHtABD6O+YxmGzTP4CoHvGFaXn+7umtB2A+ywwwrCxln7iLt1O
         7JLw==
X-Forwarded-Encrypted: i=1; AJvYcCXfa/Oo68dRAj2MIbo+xIiUzak82pMFxTNfZ/s7mZ6yzxL2UgQJmLxcTxGbKQ0CP7N3EWBruT752/gB@vger.kernel.org
X-Gm-Message-State: AOJu0YwT9+yRJw4TbSob2pYtqjlSTmZ5HECGyzRw88CH92LI6Zqbpj6v
	Ns6nTmhqXx87AqHzLzBH2aaaYKOWBpF8dU/gOTiJZwAEmC217GYmjfoS
X-Gm-Gg: ASbGncuD3uXB9rCvSsXgom91RDMh5QcBWoIz7X3rCqG0nJG2psWBLnLJUYHmf7dCFkE
	Qg7eBnimqTPe9PGkmazIrnHnFyP8KtcL6dWds7LuYKDVZ6aC9Nzm6AcQ3HopRhEO21HvZ0F8DNH
	gHJFNoIWUNS4i3IzLNgpGKYiCh5aBjbRGZUESabSlGV4uN2ymTaZm70w9PHA/CMk67jn6W7Usnq
	SMBS4aHERfjmJWh3JOQhVfkZ/nOYnVfDF2pt8P+XdQzeNNNS/BoF8clDOwMlbcM99ZQ1mQarK6U
	dlkn2/50sCi0hYbYNP6yjnvSIp7767QXSbXAQPvIVJ+GqDEjYREBf5HkDBGjSY6/lDakbOJb7Ig
	WbcVpN4mP0faIeCkP2IvHR7YtqaSRGW+yTQt4fg==
X-Google-Smtp-Source: AGHT+IG6FlNISKtPx2gRqF9MdRRkmvlkKIifRDzcNapSupdgygQ65tibf3VBpyfWyT/MoNFC/LyfEg==
X-Received: by 2002:a05:6512:1055:b0:590:5995:6dda with SMTP id 2adb3069b0e04-5906d896c12mr674942e87.7.1759908710509;
        Wed, 08 Oct 2025 00:31:50 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:50 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 22/24] dt-bindings: display: tegra: document Tegra20 and Tegra30 CSI
Date: Wed,  8 Oct 2025 10:30:44 +0300
Message-ID: <20251008073046.23231-23-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document CSI HW block found in Tegra20 and Tegra30 SoC.

The #nvidia,mipi-calibrate-cells is not an introduction of property, such
property already exists in nvidia,tegra114-mipi.yaml and is used in
multiple device trees. In case of Tegra30 and Tegra20 CSI block combines
mipi calibration function and CSI function, in Tegra114+ mipi calibration
got a dedicated hardware block which is already supported. This property
here is used to align with mipi-calibration logic used by Tegra114+.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-csi.yaml     | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
new file mode 100644
index 000000000000..817b3097846b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-csi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra20 CSI controller
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra20-csi
+      - nvidia,tegra30-csi
+
+  reg:
+    maxItems: 1
+
+  clocks: true
+  clock-names: true
+
+  avdd-dsi-csi-supply:
+    description: DSI/CSI power supply. Must supply 1.2 V.
+
+  power-domains:
+    maxItems: 1
+
+  "#nvidia,mipi-calibrate-cells":
+    description:
+      The number of cells in a MIPI calibration specifier. Should be 1.
+      The single cell specifies an id of the pad that need to be
+      calibrated for a given device. Valid pad ids for receiver would be
+      0 for CSI-A; 1 for CSI-B; 2 for DSI-A and 3 for DSI-B.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^channel@[0-1]$":
+    type: object
+    description: channel 0 represents CSI-A and 1 represents CSI-B
+    additionalProperties: false
+
+    properties:
+      reg:
+        maximum: 1
+
+      nvidia,mipi-calibrate:
+        description: Should contain a phandle and a specifier specifying
+          which pad is used by this CSI channel and needs to be calibrated.
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: port receiving the video stream from the sensor
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            required:
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: port sending the video stream to the VI
+
+    required:
+      - reg
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+      - port@1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra20-csi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: module clock
+
+        clock-names: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra30-csi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: module clock
+            - description: PAD A clock
+            - description: PAD B clock
+
+        clock-names:
+          items:
+            - const: csi
+            - const: csia-pad
+            - const: csib-pad
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+
+# see nvidia,tegra20-vi.yaml for an example
-- 
2.48.1


