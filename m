Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6CCF44C584
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Nov 2021 17:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231612AbhKJRA3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Nov 2021 12:00:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbhKJRA2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Nov 2021 12:00:28 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBBA9C061764;
        Wed, 10 Nov 2021 08:57:40 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id f3so7465046lfu.12;
        Wed, 10 Nov 2021 08:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y/P/FKCsip4vvL8CYBILiZsl8K5MvDCB+u90gDR1sgM=;
        b=Ce8f2X3b3tRJAwk+uI6D0DopAqsggfNoACs4smqLiAq9ZmWig6sKz9zqaBANQLxPax
         SLE2iC3DRazS/kkry0wk3mAzfhA6smQbHazVpnX6RejMm3DPTHcP8unPjgcHNzG5R2DE
         H/I40Dbu5szQTdE5PfqbSEJdEpfFAgZSsDTsSI5XSR3qOapTfpc3XkCOfrV8teDQTdd9
         FPbEPDtKUJifMJ7TuWXhJi1fXwxp+njuI95RSjxvpDV8/hj9SAVlD3J6U82NqVvSItut
         y2WOO3V140w4avX5eMiFuGni9ECEiBASOG+5mg38B6ePIVY86TOtLSwJlHG3QX/WBezj
         ITTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y/P/FKCsip4vvL8CYBILiZsl8K5MvDCB+u90gDR1sgM=;
        b=jftrGQV+qLzCXvbFS0mr/61neKlqJ1a0vxOVySCSqNcvtvdJ1wVudqv6uh44O/Sjae
         8hgmE7/kX7eKD6p/+2//wyOYjIfgyO5FI6kJj41T7xYCZzMwknLdPwqSOYrjr0W44lEk
         4GtRTjB2jFY2HbrwabD1MeqJLNKw0yAL9I/3qCDFPSlmvdgRyMyr+qJuuSuIVKNH6MpU
         GZ8IBUrF53T28EEVJht7qERaTBvRy74wogt+WeCIiscPsq7MwyI/XIUdKLndnlMaKkXb
         ct3fPtpxoaOwefGqao4NwiZ/Jb6V1FvuOc0AaMDcoO8LwmT+N+surrpYxnnToVQlqQN1
         AnZA==
X-Gm-Message-State: AOAM5307KnySDvbf9jFWoviv8ShrJis8LH6k2qTHF04HlNbVHsfuYzZ7
        xEZA2j+Uq1UdcrkpPcv9BCY=
X-Google-Smtp-Source: ABdhPJy9FfCdkvV2H1S7vI7xF5LgX2fBK/z83g1q5iCBiaMe6vtWvyMKReG15iiA4jQDlIllfC9WmQ==
X-Received: by 2002:a19:c74a:: with SMTP id x71mr537853lff.354.1636563459296;
        Wed, 10 Nov 2021 08:57:39 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id z28sm29213ljn.77.2021.11.10.08.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 08:57:38 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] dt-bindings: pinctrl: convert controller description to the json-schema
Date:   Wed, 10 Nov 2021 17:57:19 +0100
Message-Id: <20211110165720.30242-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This helps validating DTS and writing YAML files.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bindings/pinctrl/pinctrl-bindings.txt     | 41 +----------------
 .../devicetree/bindings/pinctrl/pinctrl.yaml  | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+), 40 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
index 9dae60acf950..6904072d3944 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
@@ -97,47 +97,8 @@ For example:
 	};
 
 == Pin controller devices ==
-Required properties: See the pin controller driver specific documentation
 
-Optional properties:
-#pinctrl-cells:	Number of pin control cells in addition to the index within the
-		pin controller device instance
-
-pinctrl-use-default: Boolean. Indicates that the OS can use the boot default
-		pin configuration. This allows using an OS that does not have a
-		driver for the pin controller. This property can be set either
-		globally for the pin controller or in child nodes for individual
-		pin group control.
-
-Pin controller devices should contain the pin configuration nodes that client
-devices reference.
-
-For example:
-
-	pincontroller {
-		... /* Standard DT properties for the device itself elided */
-
-		state_0_node_a {
-			...
-		};
-		state_1_node_a {
-			...
-		};
-		state_1_node_b {
-			...
-		};
-	}
-
-The contents of each of those pin configuration child nodes is defined
-entirely by the binding for the individual pin controller device. There
-exists no common standard for this content. The pinctrl framework only
-provides generic helper bindings that the pin controller driver can use.
-
-The pin configuration nodes need not be direct children of the pin controller
-device; they may be grandchildren, for example. Whether this is legal, and
-whether there is any interaction between the child and intermediate parent
-nodes, is again defined entirely by the binding for the individual pin
-controller device.
+See pinctrl.yaml
 
 == Generic pin multiplexing node content ==
 
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
new file mode 100644
index 000000000000..d471563119a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Pin controller device
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+  - Rafał Miłecki <rafal@milecki.pl>
+
+description: |
+  Pin controller devices should contain the pin configuration nodes that client
+  devices reference.
+
+  The contents of each of those pin configuration child nodes is defined
+  entirely by the binding for the individual pin controller device. There
+  exists no common standard for this content. The pinctrl framework only
+  provides generic helper bindings that the pin controller driver can use.
+
+  The pin configuration nodes need not be direct children of the pin controller
+  device; they may be grandchildren, for example. Whether this is legal, and
+  whether there is any interaction between the child and intermediate parent
+  nodes, is again defined entirely by the binding for the individual pin
+  controller device.
+
+properties:
+  $nodename:
+    pattern: "^(pinctrl|pinmux)(@[0-9a-f]+)?$"
+
+  "#pinctrl-cells":
+    description: >
+      Number of pin control cells in addition to the index within the pin
+      controller device instance.
+
+  pinctrl-use-default:
+    type: boolean
+    description: >
+      Indicates that the OS can use the boot default pin configuration. This
+      allows using an OS that does not have a driver for the pin controller.
+      This property can be set either globally for the pin controller or in
+      child nodes for individual pin group control.
+
+additionalProperties: true
-- 
2.31.1

