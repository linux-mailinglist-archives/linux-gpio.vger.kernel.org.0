Return-Path: <linux-gpio+bounces-26677-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E58BACC3D
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 14:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1378D3AB294
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 12:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668DA2F9987;
	Tue, 30 Sep 2025 12:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QhDzpsm+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2092F7AB9
	for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 12:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759233800; cv=none; b=FEvVNNUxpx4SvsRSDa7Dh9YZ1qWqi39vyh6lLgehnx0x7Obon7pMecEgMdslk7YAsuGO7S3o0TF+sohHxh2sjaTJ18U863WcymsowODxMt6hICaAkNcZuzwnmYIh67VW3fqT5EzN9sEK2W7fiXnkeykRf+U6Zh/8WpxEXo6gjjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759233800; c=relaxed/simple;
	bh=fOtw8gAyCH4mQS9rjon3MxYmvNIyUlZMtCK81zOCPeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J0c3GG+4O6oD0Y8zmC4OseFBxsQAtJPcvHJP1/W5nFk+XHAtYEZaUCZ0IokTGYNGGzYAp1hxlNvDwgUSa4RByC0kOPMzOXyjhBOb4B4RrkhGpJ/d0sHSerAPgJXdmLbIhun/TeintEcTvZqf4s3JeqLY45yzXtbMljLFrvo7O3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QhDzpsm+; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8582a34639aso388790785a.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 05:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759233797; x=1759838597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0zjmpx78ma5TPDlcHVuSGO5uslS5ssftuNZub90mYg=;
        b=QhDzpsm+7Z34kuEwSX7MUmfHugKxpY8mtLgwzKGPuw7vh0O5pnvNzmxOCyqa5h8ZSa
         CxHDP+l7T+CKXKVxPKfW3zdk4/eUYZYTITF3ePc80PDowI1zbxYlzXyzdTWfMm/B3GKL
         urO9yV4bUcYfHATGlUIyiIU+qQ+Pj5dGVTzUqq7TKrHj76lSias+oyh4CDcuTd68BaWF
         +5ZJ7HoSo78xSdlewhqGEOAPotqRbumz+UK8OZBXMbzj3dXOKbb2up144ZNPg1gK4DZf
         sHY60c/HN9fPbdNGJUWnZcO7tq25Qirb0qp4Gf5oaweEUNb5OFR6OFSxYsUKTmwV3ONh
         WpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759233797; x=1759838597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0zjmpx78ma5TPDlcHVuSGO5uslS5ssftuNZub90mYg=;
        b=HI3nwZS3cIYl7gelOEZC0JqKrM8m+MqrCGu3oDyTKvlAYnPTkwYAF7VPmFs/r/xVEN
         D3k03U7yQ+IUiCxgHVr7YKN6EcpfpC2SPhFfothbAXQmYEfb/o6fRsDGhhkdnc8aQzu+
         HZwlIaSkEW+eqFMtRLjlpSNs7BlCM3l7JHpe/ey1829ErV0U8URxnMG6VR6bobsxC8fG
         WEiU1RT2uqUq3MS304gIJzwM7VqgMtfQ45IeBOl8b75Dw4lvkIBX1/jHOqWm1c2zAuX6
         ivpeZj+E/nOgppDbjJ4Lb9zPweZVfc3H5Qe91pdKMrn6Cvqho6Ga/kfxpIN/zcK4GU3U
         GAPg==
X-Gm-Message-State: AOJu0YylTowYIStTFNTwCDnwcYOOBsXcwnBCA5PZdWzlOvG3qOCekIJY
	dsvFfCIE6RHUTd8RQsHUxon9Fy/L4pXELWzUsh8iqZ2xc9ATQlNPBTmI8VkvBhpY+uE=
X-Gm-Gg: ASbGncufEhG00VYUJQwztOGgYMyXS/shP0byOYHmYcfVmRyzedf3xug41r7/dYnwoap
	9Q7BqPYde18WFPOB5FaEqLCYb/RPCizoGcrx7FoDJX6b8+xFQIN50MWChUntaZ8OcgU0rqZO5kt
	+hPu2pqEvLs7thhAy4ddF1BkrXUwspw8FfOi13NkV6t64KphTq7iINF/2L1QwZYNKAG3lVXSDf4
	Qms5fp8DtA2cWoMuV/ifpcJnv8MNxK/YkIwbcW2VHSf74NgAHRLVLOoBjajFQJl3iwXh2ShXVMg
	1MFcxUoTp4AfxzPShFjZ7yqm/Ws/RR4Yc6BpQgpC2z+I9N2SuIomsQxiDXuTWWSxzPIdHsxRLWt
	hYHyTkG/dekW//Xb/iuSt+YO1/7eIYGm/YwMtQs9CJhZYE04vyj08c5/kLJoQqo606hOj
X-Google-Smtp-Source: AGHT+IFNY4IcJFcTa1nePnQ7Sjmv3FYs4pnZY26vDEJ5Fsbdrsl7ETv/71KyLahB3VGUfn6af6Mx6A==
X-Received: by 2002:a05:620a:2697:b0:861:5b8c:3c1f with SMTP id af79cd13be357-8615b8c4961mr1693574485a.54.1759233796792;
        Tue, 30 Sep 2025 05:03:16 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c306b5f64sm1020160885a.32.2025.09.30.05.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 05:03:16 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 30 Sep 2025 14:02:52 +0200
Subject: [PATCH 5/6] dt-bindings: pinctrl: Add binding for BCM6846 pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-bcmbca-pinctrl-v1-5-73218459a094@linaro.org>
References: <20250930-bcmbca-pinctrl-v1-0-73218459a094@linaro.org>
In-Reply-To: <20250930-bcmbca-pinctrl-v1-0-73218459a094@linaro.org>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

This SoC is part of the Broadcom Broadband Carrier Access (BCA)
series. The BCM6846 has 79 muxable pins, these bindings define
functions and groups for these.

The bindings are inspired by the other BCA pin control bindings
for the BCM4908.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/pinctrl/brcm,bcm6846-pinctrl.yaml     | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6846-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6846-pinctrl.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e9c3b1e9ae0501574b5c15d4adfc5421f535c306
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6846-pinctrl.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/brcm,bcm6846-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6846 pin controller
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description:
+  Binding for pin controller present on BCM6846 family SoCs.
+
+properties:
+  compatible:
+    const: brcm,bcm6846-pinctrl
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '-pins$':
+    type: object
+    $ref: pinmux-node.yaml#
+    additionalProperties: false
+
+    properties:
+      function:
+        enum: [ led_0, led_1, led_2, led_3, led_4, led_5, led_6, led_7, led_8,
+                led_9, led_10, led_11, led_12, led_13, led_14, led_15, led_16,
+                led_17, ser_led, nand, emmc, spim, usb0_pwr, usb1_pwr, i2c,
+                rgmii, mii, signal_detect, one_sec_pls, rogue_onu, wan, uart0,
+                uart2 ]
+
+      groups:
+        minItems: 1
+        # SPIM uses up to 5 groups for different select signals
+        maxItems: 5
+        items:
+          enum: [ led_0_grp_a, led_0_grp_b, led_1_grp_a, led_1_grp_b,
+                  led_2_grp_a, led_2_grp_b, led_3_grp_a, led_3_grp_b,
+                  led_4_grp_a, led_4_grp_b, led_5_grp_a, led_5_grp_b,
+                  led_6_grp_a, led_6_grp_b, led_7_grp_a, led_7_grp_b,
+                  led_8_grp_a, led_8_grp_b, led_9_grp_a, led_9_grp_b,
+                  led_10_grp_a, led_10_grp_b, led_11_grp_a, led_11_grp_b,
+                  led_12_grp_a, led_12_grp_b, led_13_grp,
+                  led_14_grp, led_15_grp, led_16_grp, led_17_grp,
+                  ser_led_grp_a, ser_led_grp_b, nand_ctrl_grp, nand_data_grp,
+                  nand_wp_grp, emmc_ctrl_grp, spim_grp_a, spim_ss0_grp_a,
+                  spim_ss1_grp_a, spim_ss2_grp_a, spim_ss3_grp_a, spim_grp_b,
+                  spim_ss0_grp_b, spim_ss1_grp_b, spim_ss2_grp_b, spim_ss3_grp_b,
+                  spim_grp_c, spim_ss0_grp_c, spim_ss1_grp_c, spis_grp_a,
+                  spis_ss_grp_a, spis_grp_b, spis_ss_grp_b, usb0_pwr_grp
+                  usb1_pwr_grp, i2c_grp, rgmii_grp, rgmii_rx_ok_grp,
+                  rgmii_start_stop_grp, mii_grp,
+                  signal_detect_grp_a, signal_detect_grp_b, one_sec_pls_grp_a,
+                  one_sec_pls_grp_b, rogue_onu_grp_a, rogue_onu_grp_b,
+                  wan_mdio_grp, wan_nco_grp, wan_early_txen_grp_a,
+                  wan_early_txen_grp_b, wan_nco_1pps_sig_grp_a,
+                  wan_nco_1pps_sig_grp_b, uart0_grp, uart2_grp ]
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pinctrl@ff800550 {
+        compatible = "brcm,bcm6846-pinctrl";
+        reg = <0xff800550 0x10>;
+
+        led-0-a-pins {
+            function = "led_0";
+            groups = "led_0_grp_a";
+        };
+    };

-- 
2.51.0


