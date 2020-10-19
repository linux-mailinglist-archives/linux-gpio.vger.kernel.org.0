Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D237C2928FE
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Oct 2020 16:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729182AbgJSOKX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Oct 2020 10:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729295AbgJSOKX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Oct 2020 10:10:23 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEF1DC0613D0
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 07:10:21 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id az3so5384288pjb.4
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 07:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W7YA8x/YJ4hzstR6fHI6wY0DfW4AJFQtQe/riUUB+yw=;
        b=T9yXXAo2lls4cGBq9D+RVumXVsoXW+ItpctPehVNWYA68UIJ+EU0DTyZ26m7NGtrxU
         dBfTHx0jxt18mlTxv8ecE1P+QH3jzG8CDOUO3Xow1U17SLr0ja2nSQz1AuYb481cDk94
         4RteL8SZnhOkVwWbjttU/0cK8GyDQMivD/DpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W7YA8x/YJ4hzstR6fHI6wY0DfW4AJFQtQe/riUUB+yw=;
        b=N2O0dC/8pycA5onMoU3NrtGAG9XouyHAnTA5c38mr1mAnq8nHrZk79GzV3rIEMqMY/
         4OnGW6Ccm8DXLWdKOm2ole5pfwbbAcsgYr1U2Yn3Q1+IpnJm/Q2djs7NpAzZ+cFJ/TjP
         F9KrdcaShNsoHXC15y4IxYwCZvdslnqVSkgvWITcuk4msFG/PMlZPk72Rs2qeCVvWV4l
         HFFLd6cF4QeM9plsEXcHYq8L2323cyIkd5UJRH7n9t/SBPf87FLlWLiiD8ylzp9DckcR
         +ypiCKANvV71F7xG7LMSVqWl80dWuO7m2z/Pl9gsWS2wRPJ9X9vJrEOw8DfzpxLkw1tj
         yd4A==
X-Gm-Message-State: AOAM530GMRJ3buvnzo35Ps3xqUwKcxlPja7RMEUMlndnmzc/Tlmbi8Ve
        2zTM/rkwTjXq59/GzaLcY7sCJceslz+EDg==
X-Google-Smtp-Source: ABdhPJy7b/9ZGZ6Y4S/BLeEOCApn/XzXT6jUA59yxj+eeHb2wmqtJDbFERQXT8y/nyT0EC0uxO8Qlw==
X-Received: by 2002:a17:90a:5889:: with SMTP id j9mr17886422pji.109.1603116620985;
        Mon, 19 Oct 2020 07:10:20 -0700 (PDT)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id 131sm78999pfy.5.2020.10.19.07.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 07:10:20 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-gpio@vger.kernel.org
Cc:     devicetree@vger.kernel.org, arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 2/5] dt-bindings: gpio: Binding for MStar MSC313 GPIO controller
Date:   Mon, 19 Oct 2020 23:10:05 +0900
Message-Id: <20201019141008.871177-3-daniel@0x0f.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201019141008.871177-1-daniel@0x0f.com>
References: <20201019141008.871177-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a binding description for the MStar/SigmaStar GPIO controller
found in the MSC313 and later ARMv7 SoCs.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../bindings/gpio/mstar,msc313-gpio.yaml      | 61 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml b/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
new file mode 100644
index 000000000000..8c69153ac27e
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/mstar,msc313-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MStar/SigmaStar GPIO controller
+
+maintainers:
+  - Daniel Palmer <daniel@thingy.jp>
+
+properties:
+  $nodename:
+    pattern: "^gpio@[0-9a-f]+$"
+
+  compatible:
+    const: mstar,msc313-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-ranges: true
+
+  gpio-ranges-group-names:
+    $ref: /schemas/types.yaml#/definitions/string-array
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+
+examples:
+  - |
+    #include <dt-bindings/gpio/msc313-gpio.h>
+
+    gpio: gpio@207800 {
+      compatible = "mstar,msc313e-gpio";
+      #gpio-cells = <2>;
+      reg = <0x207800 0x200>;
+      gpio-controller;
+      gpio-ranges = <&pinctrl 0 36 22>,
+                    <&pinctrl 22 63 4>,
+                    <&pinctrl 26 68 6>;
+      #interrupt-cells = <2>;
+      interrupt-controller;
+      interrupt-parent = <&intc_fiq>;
+      status = "okay";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index a188fae8c04e..102aedca81dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2130,6 +2130,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	http://linux-chenxing.org/
 F:	Documentation/devicetree/bindings/arm/mstar/*
+F:	Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
 F:	arch/arm/boot/dts/mstar-*
 F:	arch/arm/mach-mstar/
 F:	include/dt-bindings/gpio/msc313-gpio.h
-- 
2.28.0

