Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C84EA438A40
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Oct 2021 17:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232013AbhJXPnx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 11:43:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232012AbhJXPnS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 11:43:18 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 459F4C061235;
        Sun, 24 Oct 2021 08:40:45 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id r15so9513367qkp.8;
        Sun, 24 Oct 2021 08:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KLaMi0PjecgqH9q6xdREGuXIuHpv+l05lfMg4lrWRM0=;
        b=U2sUeme9KDMAkiU+LubwbYqgrPTmBpkB3glBm48fRP3JvzUaGRsf16LZQFndRgfQVy
         BCRE5GOdG+Eqr9FVP7gFxa8mRSUtdhOE6VBowIZyKlGrX7qmVP5OtxK/CtItSfeKSxZT
         AKRicU+TXJ4iIaXmODjoA13KK+pHaElZ6csBw01V7NPPzyUotOMuosojuggPMPVP5jG0
         lwIEs74cMs7gtoYj7H9dM3ZrN7siDs99tk3o7X5k4nhIDqSYC4NxFIqg1JHH4LRrQipz
         Uy6ErKUVnxgdvJwrxRmYZVQ0eBd3i75qqpx3ZfQTBbNsJ8V70iSzM36+F0OEt5MElssa
         ftQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KLaMi0PjecgqH9q6xdREGuXIuHpv+l05lfMg4lrWRM0=;
        b=K0+V5oUQb6aVe/ABdllR4FD/hxvbfJ4rLVgH1cC9mr41E50qZpFwlN4qmcuhnueHHQ
         U+nO8eQjSfn6gG7Hn3ofM/Vhpnp2ZwzUNan4TtSRBd+7T6gbPVu7a2klr06aDTr7/B2P
         PJDG6hH+q/sPmdbqPV8jiOEx9q0jxELi2LjXc4vIlvXjMK6V4CKJ4KvS6EId+u9r9pGf
         OM0fxe215uoPw472wYiWFAN9DbFkoi8Uo2udO6O6Fw2frLQ3F+3PXcjk/5em+AfXUFzD
         /JOCnTmF5s6WWw5gU3tW2bXJBwlBtBKVwy+8fXC1t9tiNuZao1RY3ccUoBqRGJQPKtJe
         EoJg==
X-Gm-Message-State: AOAM532meyLCpXdPwae8HSkAMfRJrl99ZvrITiO6Uo5EbIvnlg2/v3Xw
        1MmspA+9hNlLFxsgui3r5vk=
X-Google-Smtp-Source: ABdhPJy9P9jjgymuGD+hjGuutud3QqZ6FQXwfzaibrHuMzBaHwHpi8yxpzE1VeuLxZa7eKj8Aj9T+w==
X-Received: by 2002:a37:9307:: with SMTP id v7mr9447815qkd.371.1635090044481;
        Sun, 24 Oct 2021 08:40:44 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id x9sm7291731qtw.84.2021.10.24.08.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 08:40:44 -0700 (PDT)
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
Subject: [PATCH 05/13] dt-bindings: clock: imx: Add documentation for i.MXRT clock
Date:   Sun, 24 Oct 2021 11:40:19 -0400
Message-Id: <20211024154027.1479261-6-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add DT binding documentation for i.MXRT clock driver.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 .../bindings/clock/imxrt-clock.yaml           | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/imxrt-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/imxrt-clock.yaml b/Documentation/devicetree/bindings/clock/imxrt-clock.yaml
new file mode 100644
index 000000000000..f432aa81b849
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/imxrt-clock.yaml
@@ -0,0 +1,57 @@
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
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
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
+      clocks = <&clks IMXRT1050_CLK_OSC>;
+      clock-names = "per";
+    };
-- 
2.33.0

