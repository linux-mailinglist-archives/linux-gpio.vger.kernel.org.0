Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFA986D92D6
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Apr 2023 11:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236485AbjDFJeV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Apr 2023 05:34:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236418AbjDFJeT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Apr 2023 05:34:19 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D2AE30FD;
        Thu,  6 Apr 2023 02:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1680773657; x=1712309657;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ynEZcqNy/IaT++AxOWRMNMVKii1jBSvUZHK9u0RsDq8=;
  b=X2EKQh6JPHhnpQn+RjzFEtfsCU9sc7Vt0pFiNKx8p9dPjmYF0fNtuX1Q
   aQu+GVCc8a4XhV0nI4DncrttVHMkjUPvOobVcjOcJlEe7HlEVdcVTafKm
   VouvJZmK58ofrE3YEg7HQul+FJ6XSUxVODqbohL/mhsnAqu6uAzJee7t7
   rAdHoRdbbp8jiA096uLG/3edp2/mOOGgf43e0hhkbh2F+J9NdY1E0oi1I
   15oyFmqaW5cLfjucHohsZMjyP8TurZBEHV+aBH7iiVLUYLF2cEN2xDPsv
   ymNcxlrfw5ezp+bmqLHWLV2ecH9EAk/b7K+e9AtQk5U+gNDvgZiLFC0ES
   w==;
X-IronPort-AV: E=Sophos;i="5.98,323,1673910000"; 
   d="scan'208";a="30188774"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 06 Apr 2023 11:33:52 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 06 Apr 2023 11:33:52 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 06 Apr 2023 11:33:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1680773632; x=1712309632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ynEZcqNy/IaT++AxOWRMNMVKii1jBSvUZHK9u0RsDq8=;
  b=ifZ4BZ6Q1Ok9S7Gf/SDDJpyFE9FnGgBDUcNobRTbMwFv4qvV4eWPDNUM
   hj5POs4Y7gm0XKsi9RX1mi1CyxRWE3UYwPsYJMsuEIz9OBkM4PX0PXOW4
   oXF4WK4yNXPFPgvalPV18IQgDcreJcPY6bG58Va8RrWqOtQIzPPzEOWBx
   vdndptVxeiwk/dOtZ0KRYqvDAoWNpovjAjS8Yp7z/zWbBTkEJQOL7S2QG
   yN8i6xdpkfz4xW11I+UHLc4BTkidH+nGmoHXLvMmzMYhGdrxi2KLPWWA9
   MK6nfcpK7I9V0GiDkLhK061q4AZTneIpNGi94eg2ngZakIfLrBNi02RHG
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,323,1673910000"; 
   d="scan'208";a="30188770"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 06 Apr 2023 11:33:52 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 2F313280072;
        Thu,  6 Apr 2023 11:33:52 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 1/3] dt-bindings: gpio: Add gpio-delay binding document
Date:   Thu,  6 Apr 2023 11:33:42 +0200
Message-Id: <20230406093344.917259-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230406093344.917259-1-alexander.stein@ew.tq-group.com>
References: <20230406093344.917259-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds bindings for a GPIO enable/disable delay driver.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes since RFC v2:
* Remove 'input' prefix for GPIOs
* Add minItems/maxItems for GPIOs
* Adjust example
* Added Linus' A-b

 .../devicetree/bindings/gpio/gpio-delay.yaml  | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-delay.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-delay.yaml b/Documentation/devicetree/bindings/gpio/gpio-delay.yaml
new file mode 100644
index 000000000000..7c16a4e1a768
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-delay.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-delay.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO delay controller
+
+maintainers:
+  - Alexander Stein <linux@ew.tq-group.com>
+
+description: |
+  This binding describes an electrical setup where setting an GPIO output
+  is delayed by some external setup, e.g. RC curcuit.
+
+  +----------+                    +-----------+
+  |          |             VCC_B  |           |
+  |          |              |     |           |
+  |          | VCC_A        _     |           |
+  |  GPIO    |             | | R  |  Consumer |
+  |controller|        ___  |_|    |           |
+  |          |       |   |  |     |           |
+  |      [IOx|-------|   |--+-----|-----+     |
+  |          |       |___|  |     |   input   |
+  |          |              |     |           |
+  +----------+             --- C  +-----------+
+                           ---
+                            |
+                            -
+                           GND
+
+  If the input on the consumer is controlled by an open-drain signal
+  attached to an RC curcuit the ramp-up delay is not under control
+  of the GPIO controller.
+
+properties:
+  compatible:
+    const: gpio-delay
+
+  "#gpio-cells":
+    description: |
+      Specifies the pin, ramp-up and ramp-down delays. The
+      delays are specified in microseconds.
+    const: 3
+
+  gpios:
+    description: Array of GPIOs which output signal change is delayed
+    minItems: 1
+    maxItems: 32
+
+  gpio-controller: true
+
+  gpio-line-names:
+    minItems: 1
+    maxItems: 32
+
+required:
+  - compatible
+  - "#gpio-cells"
+  - gpio-controller
+  - gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    enable_delay: enable-delay {
+        compatible = "gpio-delay";
+        #gpio-cells = <3>;
+        gpio-controller;
+        gpios = <&gpio0 3 GPIO_ACTIVE_LOW>,
+                <&gpio3 1 GPIO_ACTIVE_HIGH>;
+    };
+
+    consumer {
+        enable-gpios = <&enable_delay 0 130000 30000>;
+    };
-- 
2.34.1

