Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0EB445E22D
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 22:17:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357321AbhKYVUy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 16:20:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350831AbhKYVSx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 16:18:53 -0500
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 940A6C0613F9;
        Thu, 25 Nov 2021 13:14:57 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id l8so7235588qtk.6;
        Thu, 25 Nov 2021 13:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=shY4K6DMiasewXh6nPnHULhX8SHX+OpI+nOPrrUtKu8=;
        b=lgBwL8Wy8XRkgIORpbgabdSpoqqCsFDlYlzUN0b6eGNB+zPm9eGmQrscJ036fQueZ7
         QNtXkJz6MCAuTpgJpBzDoPHXxZbuTdrolMAAdgZgZkCWNk+lvz2jpi0+pzVspIvTUNGz
         RHpZR+gkWjYhLqbK8aLfywHY5SCLDH8FvtqGi5j/IsQHpkObmRPb5gW9RDpyprts/rrS
         RZiv2byH+XT1aWLlDPfhQF01+S3fbckWoBR46aSdkmxMc5ZzcvB0rZ01TFx9kczctGfU
         rLZkoCkRv0uP8D1ORFkSqt3SiDX+ZSGsglmROtJkZQ3R9LWNj1TfY+kQm/M3inWNFndg
         MVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=shY4K6DMiasewXh6nPnHULhX8SHX+OpI+nOPrrUtKu8=;
        b=b/FEh+KeeA+ZpVtlR+B/yf03qiZm8yS5crO2p0ry4PKD9SEbiQXbWvjaxzFac4nPbh
         I+0i34RSPoORRGFur0UXSA5f62f7JxSUxhRT+jcVzZCMj1Rhc6CQA5+FDBc7WeNB0B5g
         bzbcwSHsW6MWFpAQ4XJcBTgI7lEj/lsG8JfhZpbg08YCzIbD/B0zYjkPY26igpkQdvIf
         ct6F+OWfjW/dR2AmpflolXBkP5PlhOSxCKzhDfSkSLjodgsVCwRyE0j6b9QpFPK8osbs
         5atlPOnD4ug2B22EuQQ56pSND0fl8R4o13YdHOoDQRU0SLFP3yy1EbqD/I9lbJJ+t2Zk
         3TDQ==
X-Gm-Message-State: AOAM532j/hjk2LXVMFsDZ8ptrva6GBcEoHIHPDEKOlZrMolC4JQFCY24
        whGQmMnN31DcLOxxmMey9Y8=
X-Google-Smtp-Source: ABdhPJxaqvi0zIXHzlqvtSZaqXxe8ThgQa5y7+xGgMqOyKNQBi3wXRJUUhq5mqDV+95zQOXYTZprJw==
X-Received: by 2002:ac8:588c:: with SMTP id t12mr20658010qta.325.1637874896807;
        Thu, 25 Nov 2021 13:14:56 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id j22sm2068175qko.68.2021.11.25.13.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 13:14:56 -0800 (PST)
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
Subject: [PATCH v3 06/13] dt-bindings: clock: imx: Add documentation for i.MXRT clock
Date:   Thu, 25 Nov 2021 16:14:36 -0500
Message-Id: <20211125211443.1150135-7-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
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
V2->V3:
* Remove anatop
* Use lpuart not gpt
* include imxrt1050-clock.h
* 2 space tabs to 4
* Remove oneOf enum
* Change maxItems to 2
---
 .../bindings/clock/imxrt-clock.yaml           | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/imxrt-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/imxrt-clock.yaml b/Documentation/devicetree/bindings/clock/imxrt-clock.yaml
new file mode 100644
index 000000000000..8af48c59ff99
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/imxrt-clock.yaml
@@ -0,0 +1,67 @@
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
+
+properties:
+  compatible:
+    const: fsl,imxrt1050-ccm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 2
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
+    #include <dt-bindings/clock/imxrt1050-clock.h>
+
+    ccm@400fc000 {
+        compatible = "fsl,imxrt1050-ccm";
+        reg = <0x400fc000 0x4000>;
+        interrupts = <95>, <96>;
+        clocks = <&osc>;
+        clock-names = "osc";
+        #clock-cells = <1>;
+    };
+
+
+    lpuart1: serial@40184000 {
+        compatible = "fsl,imxrt1050-lpuart";
+        reg = <0x40184000 0x4000>;
+        interrupts = <20>;
+        clocks = <&clks IMXRT1050_CLK_LPUART1>;
+        clock-names = "ipg";
+    };
-- 
2.34.0

