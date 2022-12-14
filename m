Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C78264C662
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Dec 2022 10:54:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237896AbiLNJyX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Dec 2022 04:54:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238054AbiLNJyA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Dec 2022 04:54:00 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBA7421E30;
        Wed, 14 Dec 2022 01:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1671011632; x=1702547632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jSMLFNgpl5itBCtqAbPyBTBI01DUvC31suIJbP6CgHc=;
  b=O0QOUHJb7Ksd8AyUauV5cpnTp5U7l3hviL3mU3WUrwFUFTRYCLyMsKhU
   Wg1zBa3n8AadMOhAzy+Hu6PcTonZaae6jlN8mLOu2TdyxkTKXaAUbbFYT
   hDLyB4FnP51MfKUpvgoJP8zzP7tYC3LoTK3tsndOoSFcgkX4JFZ7GLPCH
   9tCmpb/u3xvrLfKEaI47gBRV9l6eDl2R6BoVzh6vIKPvoPD6y4ss4Feah
   9zifDVzkKKH/yABYVjUmXIbieRin22N9OLcfCMnUObBDq1H8oGssxJGI0
   KO8onK3M83ZvbaxQiw2/APVaTMxrQaR96DzWb3nfYlNmEcBXsmuG5vA3G
   g==;
X-IronPort-AV: E=Sophos;i="5.96,244,1665439200"; 
   d="scan'208";a="27943175"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 14 Dec 2022 10:53:48 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 14 Dec 2022 10:53:48 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 14 Dec 2022 10:53:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1671011628; x=1702547628;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jSMLFNgpl5itBCtqAbPyBTBI01DUvC31suIJbP6CgHc=;
  b=dcZYhwA3uBPFpLldGv6hzb64iagtMAJEzDy2E0R33jrJF6RdGGUQgSW+
   m70LMcbIK+jE/TvIphh1ZzJmK4tTKmluaInJUM2solC8K/BS9pdGO6oCU
   VkrKFBBUTlumfd/WhrYKDaWW+GEyt2zqrQO1a8csbqizseTii67nDKwWI
   bpOVUB3k/95A5TBnFeQeKofuu36iOoNHsaFS2aa6v4eaeclqaRNKqEfNd
   SNqKUsANAQbfJtMkt94jkOZM6ojqfFbUYNDrrDQ4mJEOB0DmLy7INMpJc
   cRbGPCn+MLS42NMttSdnSIQXYu9upp6HLV7GDdPIFSlusjbTAFAQ+F8Ei
   A==;
X-IronPort-AV: E=Sophos;i="5.96,244,1665439200"; 
   d="scan'208";a="27943174"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 14 Dec 2022 10:53:48 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D8B3F280072;
        Wed, 14 Dec 2022 10:53:47 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [RFC PATCH v2 1/3] dt-bindings: gpio: Add gpio-delay binding document
Date:   Wed, 14 Dec 2022 10:53:40 +0100
Message-Id: <20221214095342.937303-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221214095342.937303-1-alexander.stein@ew.tq-group.com>
References: <20221214095342.937303-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds bindings for a GPIO enable/disable delay driver.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../devicetree/bindings/gpio/gpio-delay.yaml  | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-delay.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-delay.yaml b/Documentation/devicetree/bindings/gpio/gpio-delay.yaml
new file mode 100644
index 000000000000..20871356e9b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-delay.yaml
@@ -0,0 +1,75 @@
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
+  input-gpios:
+    description: Array of GPIOs which output signal change is delayed
+
+  gpio-controller: true
+
+  gpio-line-names: true
+
+required:
+  - compatible
+  - "#gpio-cells"
+  - gpio-controller
+  - input-gpios
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
+        input-gpios = <&gpio0 3 GPIO_ACTIVE_LOW>,
+                      <&gpio3 1 GPIO_ACTIVE_HIGH>;
+    };
+
+    consumer {
+        enable-gpios = <&enable_delay 0 130000 30000>;
+    };
-- 
2.34.1

