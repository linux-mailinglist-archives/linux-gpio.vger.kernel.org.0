Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED8645E215
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 22:17:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357177AbhKYVU2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 16:20:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357179AbhKYVSY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 16:18:24 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C35BC0613F4;
        Thu, 25 Nov 2021 13:14:50 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id m192so12935125qke.2;
        Thu, 25 Nov 2021 13:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mWlDE9wPN5DJ1yGQE4Tgk+m6TLyjhj2NB8c5F++tYPw=;
        b=YZTFvs7LTHYPL6rcFc+BTkIR3jloR5ewoukXlkcVc/fR/aDhITNYRj1UNhzzEUBRdw
         vO2/SMlYNG/9L7iEloT3JLMZ4wsSrls029KtKgGEt3x6vso9WqACsM+XR+h9HNznwkhJ
         qf0r83NQx6l2/xPrfdXbRVRE4kW+S3WA784811vDZklc7rUbYSgB2qxoPE16rcO0mZ/R
         zQBfZOSrx0HrxuOwrxFVBhXESEbkKj8d4GkMsQ74gpb9VgFxvtr4toLL0iPL/YmFfshq
         IxGIowUjXnVQQ6EsqD6ouB5KKZMR1p6wlBwOqmUZRTjWRPtzUA3jHheADspSsuGMA0Fv
         sbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mWlDE9wPN5DJ1yGQE4Tgk+m6TLyjhj2NB8c5F++tYPw=;
        b=SZj5QKqX/oZUnlpl7W15IKfBV69ED6EdHYULbjSGb+I4KKdManrxapgLUoLhyXvHcr
         bqYwGbetPXNeG/V3qT2idJ5xQupOLWpK0aR60kT+fVXn+MRpilmEtlbloBJKdE6NP7+E
         fluUSifogtemTi+KTLLu58YKjRTVcdL5cmTUV3YVyh8gI3JowUllNajmw08oHntGUzla
         uL9DBa7Ly2t2Ok77QADe9x6qS3AhhNPUMVNyupWX6f9spZCOGSD0bwedpjaTl6Rp5pva
         tpdWcA+EJbaoio42p8O2lb5Uz8APJ+GgSIXhhiA3Dri0FhXkNmRNUprtFZ8tLzlsPAeY
         XfyQ==
X-Gm-Message-State: AOAM531zRX4YgrehrnizNCGVHfUZ7pmMhrqmUAGXUKk+Xe0FFRBkDJqy
        GawjWOGQCaIOVsxi9IMvr3U=
X-Google-Smtp-Source: ABdhPJxsERgerN73f2lBXqrIay0q2SfiEQHG5N7slGfb7mqoA0oI9us+PKc4oChZfqLoVy9rR6HrdA==
X-Received: by 2002:a05:620a:1350:: with SMTP id c16mr18629492qkl.229.1637874889415;
        Thu, 25 Nov 2021 13:14:49 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id j22sm2068175qko.68.2021.11.25.13.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 13:14:49 -0800 (PST)
From:   Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To:     linux-imx@nxp.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
        stefan@agner.ch, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
        adrian.hunter@intel.com, jirislaby@kernel.org,
        giulio.benetti@benettiengineering.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, Mr.Bossman075@gmail.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>
Subject: [PATCH v3 02/13] dt-bindings: pinctrl: add i.MXRT1050 pinctrl binding doc
Date:   Thu, 25 Nov 2021 16:14:32 -0500
Message-Id: <20211125211443.1150135-3-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Jesse Taube <mr.bossman075@gmail.com>

Add i.MXRT1050 pinctrl binding doc

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1->V2:
* Replace macros with values
* Add tab for last pinctrl value
V2->V3:
* Remove imxrt1050-evk container
* Remove unnecessary handles
* 2 space tabs to 4
---
 .../bindings/pinctrl/fsl,imxrt1050.yaml       | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
new file mode 100644
index 000000000000..1278f7293560
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/fsl,imxrt1050.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale IMXRT1050 IOMUX Controller
+
+maintainers:
+  - Giulio Benetti <giulio.benetti@benettiengineering.com>
+  - Jesse Taube <Mr.Bossman075@gmail.com>
+
+description:
+  Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
+  for common binding part and usage.
+
+properties:
+  compatible:
+    const: fsl,imxrt1050-iomuxc
+
+  reg:
+    maxItems: 1
+
+# Client device subnode's properties
+patternProperties:
+  'grp$':
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+
+    properties:
+      fsl,pins:
+        description:
+          each entry consists of 6 integers and represents the mux and config
+          setting for one pin. The first 5 integers <mux_reg conf_reg input_reg
+          mux_val input_val> are specified using a PIN_FUNC_ID macro, which can
+          be found in <include/dt-bindings/pinctrl/pins-imxrt1050.h>. The last
+          integer CONFIG is the pad setting value like pull-up on this pin. Please
+          refer to i.MXRT1050 Reference Manual for detailed CONFIG settings.
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        items:
+          items:
+            - description: |
+                "mux_reg" indicates the offset of mux register.
+            - description: |
+                "conf_reg" indicates the offset of pad configuration register.
+            - description: |
+                "input_reg" indicates the offset of select input register.
+            - description: |
+                "mux_val" indicates the mux value to be applied.
+            - description: |
+                "input_val" indicates the select input value to be applied.
+            - description: |
+                "pad_setting" indicates the pad configuration value to be applied.
+
+    required:
+      - fsl,pins
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    iomuxc: iomuxc@401f8000 {
+        compatible = "fsl,imxrt1050-iomuxc";
+        reg = <0x401f8000 0x4000>;
+
+        pinctrl_lpuart1: lpuart1grp {
+            fsl,pins =
+              <0x0EC 0x2DC 0x000 0x2 0x0	0xf1>,
+              <0x0F0 0x2E0 0x000 0x2 0x0	0xf1>;
+        };
+    };
-- 
2.34.0

