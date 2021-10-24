Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B42C438A2E
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Oct 2021 17:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232498AbhJXPnb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 11:43:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232270AbhJXPnA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 11:43:00 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B5E6C061231;
        Sun, 24 Oct 2021 08:40:39 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id bp7so9437200qkb.12;
        Sun, 24 Oct 2021 08:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HZ8vL0g7vf5CLqx1Rw8klwqcAlI5fsNiFDxviXL0Y+M=;
        b=KezdmQSZTtCeVZgg9OZf3oY4wv7MsJcqd1y3rW7y866clqS+YAFXt8LPyz6VijuCDq
         r2TX32vD6U3//hfdh1f0MxqcX7HmASZHOJhNsZPVLThUR/ohPVSai8aTb3jPrEQGWvNv
         t/pILtw8LOMcBI3T9GX2SdoxDLQmqX2nkRUxlz2wwsXgQHOweKR65Bs3GSee3kn252+E
         +vsKstp1njWSuTKPhbaygpcG4aG13HKOiZ8cUSRB9j+wL9oZnI4Zla/VJapeTAdh6q7J
         bjmQ1kb7buaXki9RSh3aS+k/UgwoENKMaFDuPqXO11ojI5NHmtqDcjfpQ4wZwrMmtjl+
         eEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HZ8vL0g7vf5CLqx1Rw8klwqcAlI5fsNiFDxviXL0Y+M=;
        b=enVsQHCzGcacWi64xT17W3ukQxXrFSjWpFVpcF/uGFOlcT6P4DopgGYBMQVkfov3xr
         4njeA4TuqnR0uwglA6NYs9oUAsR4R/MB28wJ++lkmYZYzUxpzKCT7zNeVI21oRLibbIT
         fBl+LeIbPawex349h8oQWT+aUvMa4vsJSKamQ1mu70qjgMLomVSIcCbzbZhM7Kuk6i7r
         fb6DXZyebVh5a8VswtXWVvl2UTmLY+9tKChCE97Uk0vwOZ5BBwFSehU9fm7xbkw0hEk+
         p+jDWEFTZ1DOj++xjasxhWlLgY2ek3ZfeDFi10RbcRXe+A/lXm4sl8TUbE14m1j21UEr
         /6hg==
X-Gm-Message-State: AOAM532KEpFVlUrmQ00sReODHkv/yueepWG+DN7IXXlaQt00HY4V55lU
        EQdl9tQhDMTvJq2T2H4xXJI=
X-Google-Smtp-Source: ABdhPJzYq58MkBV+/oQ42fToDw6FyMyangrabwoFnHuqK/S++onj7WLZBfgQL4nPSxd2prl8YJPtfA==
X-Received: by 2002:a37:9404:: with SMTP id w4mr9730042qkd.469.1635090038229;
        Sun, 24 Oct 2021 08:40:38 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id x9sm7291731qtw.84.2021.10.24.08.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 08:40:37 -0700 (PDT)
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
        nobuhiro1.iwamatsu@toshiba.co.jp, leonard.crestez@nxp.com,
        b20788@freescale.com, Mr.Bossman075@gmail.com, fugang.duan@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH 02/13] dt-bindings: pinctrl: add i.MXRT1050 pinctrl binding doc
Date:   Sun, 24 Oct 2021 11:40:16 -0400
Message-Id: <20211024154027.1479261-3-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add i.MXRT1050 pinctrl binding doc

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 .../bindings/pinctrl/fsl,imxrt1050.yaml       | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
new file mode 100644
index 000000000000..2f3e41b40782
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
@@ -0,0 +1,85 @@
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
+          MXRT1050_IOMUXC_GPIO_AD_B0_12_LPUART1_TXD
+            0xf1
+          MXRT1050_IOMUXC_GPIO_AD_B0_13_LPUART1_RXD
+            0xf1
+          >;
+        };
+      };
+    };
-- 
2.33.0

