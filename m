Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7D104438E6
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 23:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbhKBW7q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 18:59:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231250AbhKBW7n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 18:59:43 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28D3FC061714;
        Tue,  2 Nov 2021 15:57:08 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id b11so605595qvm.7;
        Tue, 02 Nov 2021 15:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1lbIDqyGLdbXsMTaJFigQLBXeHoAC+c2dOleBvZzrOk=;
        b=LdLZa8kCuWAzCIm3jAya3scpUj2pOI5HGoRJvDR6+H3Rh8bkMawqOoCW2cieCeBmIr
         uwQUJXqmugNdQEqqvLrca/NOTYGKrWsbMCx+kGMudy92516tPRy6FlEcLoqyk434q1pe
         tfi4DrJioBJi3pzLJ0K0mBtzpbR/t7AMS6iWhoXk8CTml0x9D8gNF4AkHwcOlxYB/kZu
         yWK2RXAi7qr7XJ0jDlI7Mr4rEr24VNd644kZ5tfz0Q+rIj/atFx1rlc0tBPqji6sjGma
         YzYJ50GvdKF9fUu+DCJK6I77tGuYbvZ9XdniHPqfUHC3yQAhVT4FRTYgW6woRVYc/Fku
         csjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1lbIDqyGLdbXsMTaJFigQLBXeHoAC+c2dOleBvZzrOk=;
        b=cgw+NDwU2JTLHnjFkXGSORw0puDinHMfjaMn5RzW/PTVkCbusbMZlmBWXjtcgN9syj
         YffstJlRiLUDnD1CtstHgQ2tlYgtyg7kuuzAKJYoY3UCXi+Up4lTfF/h4WstytWaa4us
         AldadV33ZDqJdKIJE+XMFjKu+G+J6G7PZB+5sREEXGTPT0ZryliGAiFdfo2RCBUk7O3T
         6tTUn8xgNRpGywE5ZGopQZZLXbWKI9sihm8daoA4xPFtbU71VCoVWc/bCLMVjd3oVqfM
         SeThMzUPyYDrl8V7MMh9Ns8xNG2kw6VtilmH88oz9CUZGS5o0XqOiJ3SfmDLEQkSz4NF
         V6Lg==
X-Gm-Message-State: AOAM532scDpdwP4zWEPq/f+VYeTjTYFOInz2ZVEsZxcFpKkT5UZ7m7o2
        SCYBeodtfs1wxN4+Fn2WU/U=
X-Google-Smtp-Source: ABdhPJw9h1fxmIGxSbw++N+ahnTzWcZlnmga1RLIhVC83mPu1wJ7SIp5MuEKxT09GJLgJoTzpi8Ivw==
X-Received: by 2002:a05:622a:612:: with SMTP id z18mr17396283qta.411.1635893827282;
        Tue, 02 Nov 2021 15:57:07 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id v19sm351222qtk.6.2021.11.02.15.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 15:57:06 -0700 (PDT)
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
Subject: [PATCH v2 02/13] dt-bindings: pinctrl: add i.MXRT1050 pinctrl binding doc
Date:   Tue,  2 Nov 2021 18:56:50 -0400
Message-Id: <20211102225701.98944-3-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
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
---
 .../bindings/pinctrl/fsl,imxrt1050.yaml       | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
new file mode 100644
index 000000000000..07e1afb15e54
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/fsl,imxrt-pinctrl.yaml#
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
+      compatible = "fsl,imxrt1050-iomuxc";
+      reg = <0x401f8000 0x4000>;
+      fsl,mux_mask = <0x7>;
+      pinctrl-names = "default";
+      imxrt1050-evk {
+        pinctrl_lpuart1: lpuart1grp {
+        fsl,pins = <
+          0x0EC 0x2DC 0x000 0x2 0x0	0xf1
+          0x0F0 0x2E0 0x000 0x2 0x0	0xf1
+          >;
+        };
+      };
+    };
-- 
2.33.1

