Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3964438F2
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 23:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231889AbhKBW7x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 18:59:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231778AbhKBW7s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 18:59:48 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5835C061203;
        Tue,  2 Nov 2021 15:57:12 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id bu11so644338qvb.0;
        Tue, 02 Nov 2021 15:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ntlpWtm8EgDO0Wkv+UfSBg+xWTj50Z2iH5hgbvU4PL8=;
        b=jbdhvZqP/khetaBd25GPUIC8KKp6G8CIWqbF+kAae1Mm6ndkl30HGld0B5FKKstfJF
         NmKmq/hd7ogyivGJVgEp9gJQamLNnJlJK/UzT9/lvegLHfMqdu4PZNdPLxbYsO1aC5Tv
         +zY2pgm+7US8cOhMEmIMFflQH9zws/icWPXWL/I0C8L+kdB7F82s0u1Gf4JLQoovW+Ji
         MSCG7FkNf5567qr8K1/wbCNZr6hDz6qjDZ/g8r7kFPw2qAX8Fzx/Zc5dbcDTOKR8ZHg1
         GzSf63Oc5kmKXW5aOAvDY3dZRyxULF9odmrthySEmkpgLkYDiimHBzkHHC5/qvTUV35f
         TVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ntlpWtm8EgDO0Wkv+UfSBg+xWTj50Z2iH5hgbvU4PL8=;
        b=Q50HBBUpotjSdUqk1BNjTHwt3uUITIsKemfpK5M8pt10VeB95W0u5uUjei8M6Ux9m9
         QuVaZagKeqjbxEsSZdGtsopQDDMaEJkUFlvlghxdY6wGoUg0gcLGBldSVYMDARb48n+e
         eGV6NxX8DhwFRMO11p0KeRL2oYgydezINMSVmOvDNdf6hSNqVLF06pCjesqNrVLOU5+n
         +mwfmrI3v5eoqfJUkMSw6tE19np5lztSoRwFmauXaaUhiGzGKKTOlfaRIZEG+8aazszy
         /AabXsSiSLk9AL6CWGCxowlZjm0aKQR0ZlRj6hOTCqgFSCIki+kbhUp9oRCSc9nR1Z0D
         D2GA==
X-Gm-Message-State: AOAM531xtESSR0FfTScSpuGz7aa8DZKJ+eBOKzDt6Z2O24u0M9jEkoc9
        cVxGh4f49RPHU6kkupaRh9s=
X-Google-Smtp-Source: ABdhPJydtr9n2nXsMTCBsPhs3XyUPUffhsLXvdp9cZeuTXGS6Tvae9yYxXbqmET6ZPBBrD9P+fb/zQ==
X-Received: by 2002:a05:6214:8c8:: with SMTP id da8mr3102336qvb.23.1635893832137;
        Tue, 02 Nov 2021 15:57:12 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id v19sm351222qtk.6.2021.11.02.15.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 15:57:11 -0700 (PDT)
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
Subject: [PATCH v2 05/13] dt-bindings: clock: imx: Add documentation for i.MXRT clock
Date:   Tue,  2 Nov 2021 18:56:53 -0400
Message-Id: <20211102225701.98944-6-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Jesse Taube <mr.bossman075@gmail.com>

Add DT binding documentation for i.MXRT clock driver.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1->V2:
* Replace macros with values
---
 .../bindings/clock/imxrt-clock.yaml           | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/imxrt-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/imxrt-clock.yaml b/Documentation/devicetree/bindings/clock/imxrt-clock.yaml
new file mode 100644
index 000000000000..4e92f79cf707
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/imxrt-clock.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/imxrt-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Clock bindings for Freescale i.MXRT
+
+maintainers:
+  - Giulio Benetti <giulio.benetti@benettiengineering.com>
+  - Jesse Taube <Mr.Bossman075@gmail.com>
+
+description: |
+  The clock consumer should specify the desired clock by having the clock
+  ID in its "clocks" phandle cell. See include/dt-bindings/clock/imxrt*-clock.h
+  for the full list of i.MXRT clock IDs.
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - fsl,imxrt1050-ccm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+
+  clock-names:
+    minItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    anatop: anatop@400d8000 {
+      compatible = "fsl,imxrt-anatop";
+      reg = <0x400d8000 0x4000>;
+    };
+
+    ccm@400fc000 {
+      compatible = "fsl,imxrt1050-ccm";
+      reg = <0x400fc000 0x4000>;
+      interrupts = <95>,<96>;
+      clocks = <&osc>;
+      clock-names = "osc";
+      #clock-cells = <1>;
+    };
+
+    gpt: timer@401ec000 {
+      compatible = "fsl,imx53-gpt", "fsl,imx31-gpt";
+      reg = <0x401ec000 0x4000>;
+      interrupts = <100>;
+      clocks = <&clks 3>;
+      clock-names = "per";
+    };
-- 
2.33.1

