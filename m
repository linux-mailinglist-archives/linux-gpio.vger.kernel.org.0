Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9A045D946
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 12:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234416AbhKYLgy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 06:36:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbhKYLey (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 06:34:54 -0500
Received: from nbd.name (nbd.name [IPv6:2a01:4f8:221:3d45::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC5D1C061761;
        Thu, 25 Nov 2021 03:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
         s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=fk+bKLrSCUs1PLZU0e7CNrETFL3XqqVC8RHX60LIQ6A=; b=tB8B4poTv5zrOWrcTEZGToPK3D
        rY2p/SAi8mfZW4FFGImdSMv0EFx8i2HebqW50W0K3C1e5z20QCXjB/AvrxEqOkICamyQ7NG40vMFd
        yzM0A35JqUhpla/0gRgKDAzkQBsAd1cl7lBOBzhb2shSBFKTykFI0IA+1VmUet4L5WmQ=;
Received: from p54ae9f3f.dip0.t-ipconnect.de ([84.174.159.63] helo=localhost.localdomain)
        by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <nbd@nbd.name>)
        id 1mqCbX-0002ws-LR; Thu, 25 Nov 2021 12:07:51 +0100
From:   Felix Fietkau <nbd@nbd.name>
To:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        John Crispin <john@phrozen.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 11/12] dt-bindings: arm: airoha: Add binding for Airoha GPIO controller
Date:   Thu, 25 Nov 2021 12:07:37 +0100
Message-Id: <20211125110738.41028-12-nbd@nbd.name>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20211125110738.41028-1-nbd@nbd.name>
References: <20211125110738.41028-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: John Crispin <john@phrozen.org>

Airoha's GPIO controller on their ARM EN7523 SoCs consists of two banks of 32
GPIOs

Signed-off-by: John Crispin <john@phrozen.org>
---
 .../bindings/gpio/airoha,en7523-gpio.yaml     | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/airoha,en7523-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/airoha,en7523-gpio.yaml b/Documentation/devicetree/bindings/gpio/airoha,en7523-gpio.yaml
new file mode 100644
index 000000000000..9ab36a7c1a3c
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/airoha,en7523-gpio.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/airoha,en7523-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha EN7523 GPIO controller
+
+maintainers:
+  - John Crispin <john@phrozen.org>
+
+description: |
+  Airoha's GPIO controller on their ARM EN7523 SoCs consists of two banks of 32
+  GPIOs.
+
+properties:
+  $nodename:
+    pattern: "^gpio@[0-9a-f]+$"
+
+  compatible:
+    items:
+      - const: airoha,en7523-gpio
+
+  reg:
+    maxItems: 4
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - gpio-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio0: gpio@1fbf0200 {
+        compatible = "airoha,en7523-gpio";
+        reg = <0x1fbf0204 0x4>,
+              <0x1fbf0200 0x4>,
+              <0x1fbf0220 0x4>,
+              <0x1fbf0214 0x4>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
+
+    gpio1: gpio@1fbf0270 {
+        compatible = "airoha,en7523-gpio";
+        reg = <0x1fbf0270 0x4>,
+              <0x1fbf0260 0x4>,
+              <0x1fbf0264 0x4>,
+              <0x1fbf0278 0x4>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
+
+
+...
-- 
2.30.1

