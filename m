Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E983E31FAC1
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Feb 2021 15:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbhBSO3s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Feb 2021 09:29:48 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:45143 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231173AbhBSO2q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Feb 2021 09:28:46 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 6311E5803C1;
        Fri, 19 Feb 2021 09:27:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 19 Feb 2021 09:27:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=VWc2JEncu0Xjp
        jSk1gHgmKo9FZz2GeTal7pM7FnaRmE=; b=ZmxHCyKA+DmQpbU9OsyjEMSRvfGLn
        i8ZGPSuEpTbDvpiAIPZAK+C3WnpOC9KbQODumo6lQzQje3zJjldGhYEuZTGSH8nH
        XWLwnJuWINuEueYK1zPNirrRau5eBy45Xg7/Cb4Gi97TTFYHUFHAoXDOeAIbVxho
        NZ07FCuL4La4Y+SsZgYUyeYsCBFtOevO+3Bk/vO3SmZjNdqBIEA2ea21kCEG1NKf
        LKcgH7zSwqv8C3s7TVBRYX23ExuHPoqgi9bv8SdXMCIE6dSxo+1gGRprmvcQeXnh
        XaKemHE+c85eucvF6UEX4WTxf2uswGOgKiDkU5CsdHliFr+JACoJ4fUAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=VWc2JEncu0XjpjSk1gHgmKo9FZz2GeTal7pM7FnaRmE=; b=wOjiBr6C
        3FKA2E08WwIXAneLYATEvnwQQ6rq0Liz6uWDKoLWVaTpmMlxu3nNsFiK8yLhz1lz
        LqeaOJMruYL2+6pNvsUxxEKZqb58PyWNWRkwjvU8JhaOUTwVq4CbdBpxFzqRfrw8
        WY4BaKwNH6ecyaRr69RY+s3E1lm+eu6ViUjdXCCCrfq84HI3x1XXqqSlRSTDYvUa
        CKTpQYzQy7bg90HnQa94q2IgXTk3WPyPK51dXG+MYmcZv5gSU0/UXuDGJ2pDllGQ
        j3ZfRRuiD38IwUokjxfEyoMbduNbzg5xKEhhD3guQ2WfXlFJgmN1IXFW2hBoIO1I
        FVnWzVC/GvtZpw==
X-ME-Sender: <xms:1sovYJnPPN9wsanteCFAX4NtDIkV-GOiFxBh2C1FwRHwEr_VnXAHiA>
    <xme:1sovYE32aQbolyg6BCf-q6IQqsNsUQqNqvlMm42uXfq4gvb86oCrC6CfjkMYw0omc
    JuQR8DCV2BVTHKrMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdeigecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeeluedvvedtgffggefggfeugeevgffhje
    efiedtvdehvdfhtefftefffeeihfevvdenucffohhmrghinhepuggvvhhitggvthhrvggv
    rdhorhhgnecukfhppedugedrvddrledurdefjeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:1sovYPpkw7rkIX7tN6pVChDLuOVvY7M6zKCfnzGWEDJpN9xKLmN0rw>
    <xmx:1sovYJkGRjm2eUeJhkODiKsQHs1Xr-x76m0NTjoDDwRmoljdnoymEQ>
    <xmx:1sovYH0JDkzcUMxTtE9r_1RbbNkofwtn3xR_HVAKNxEXKUlOJxJANA>
    <xmx:1sovYIEof0nrw5RmzAnkiGUawSoPqqi8Cqzuz6xnyAYlfNii6ma8IQ>
Received: from localhost.localdomain (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
        by mail.messagingengine.com (Postfix) with ESMTPA id F4057240057;
        Fri, 19 Feb 2021 09:27:27 -0500 (EST)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
        minyard@acm.org
Cc:     robh+dt@kernel.org, joel@jms.id.au, lee.jones@linaro.org,
        avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        linus.walleij@linaro.org, chiawei_wang@aspeedtech.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org
Subject: [PATCH 16/19] dt-bindings: ipmi: Convert ASPEED KCS binding to schema
Date:   Sat, 20 Feb 2021 00:55:20 +1030
Message-Id: <20210219142523.3464540-17-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210219142523.3464540-1-andrew@aj.id.au>
References: <20210219142523.3464540-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Given the deprecated binding, improve the ability to detect issues in
the platform devicetrees. Further, a subsequent patch will introduce a
new interrupts property for specifying SerIRQ behaviour, so convert
before we do any further additions.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml | 92 +++++++++++++++++++
 .../bindings/ipmi/aspeed-kcs-bmc.txt          | 33 -------
 2 files changed, 92 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
 delete mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt

diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
new file mode 100644
index 000000000000..1c1cc4265948
--- /dev/null
+++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED BMC KCS Devices
+
+maintainers:
+  - Andrew Jeffery <andrew@aj.id.au>
+
+description: |
+  The Aspeed BMC SoCs typically use the Keyboard-Controller-Style (KCS)
+  interfaces on the LPC bus for in-band IPMI communication with their host.
+
+properties:
+  compatible:
+    oneOf:
+      - description: Channel ID derived from reg
+        items:
+          enum:
+            - aspeed,ast2400-kcs-bmc-v2
+            - aspeed,ast2500-kcs-bmc-v2
+            - aspeed,ast2600-kcs-bmc
+
+      - description: Old-style with explicit channel ID, no reg
+        deprecated: true
+        items:
+          enum:
+            - aspeed,ast2400-kcs-bmc
+            - aspeed,ast2500-kcs-bmc
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    minItems: 3
+    maxItems: 3
+    description: IDR, ODR and STR register addresses
+
+  aspeed,lpc-io-reg:
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    minItems: 1
+    maxItems: 2
+    description: |
+      The host CPU LPC IO data and status addresses for the device. For most
+      channels the status address is derived from the data address, but the
+      status address may be optionally provided.
+
+  kcs_chan:
+    deprecated: true
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    maxItems: 1
+    description: The LPC channel number in the controller
+
+  kcs_addr:
+    deprecated: true
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    maxItems: 1
+    description: The host CPU IO map address
+
+required:
+  - compatible
+  - interrupts
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - aspeed,ast2400-kcs-bmc
+              - aspeed,ast2500-kcs-bmc
+    then:
+      required:
+        - kcs_chan
+        - kcs_addr
+    else:
+      required:
+        - reg
+        - aspeed,lpc-io-reg
+
+examples:
+  - |
+    kcs3: kcs@24 {
+        compatible = "aspeed,ast2600-kcs-bmc";
+        reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
+        aspeed,lpc-io-reg = <0xca2>;
+        interrupts = <8>;
+    };
diff --git a/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt b/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
deleted file mode 100644
index 193e71ca96b0..000000000000
--- a/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-# Aspeed KCS (Keyboard Controller Style) IPMI interface
-
-The Aspeed SOCs (AST2400 and AST2500) are commonly used as BMCs
-(Baseboard Management Controllers) and the KCS interface can be
-used to perform in-band IPMI communication with their host.
-
-## v1
-Required properties:
-- compatible : should be one of
-    "aspeed,ast2400-kcs-bmc"
-    "aspeed,ast2500-kcs-bmc"
-- interrupts : interrupt generated by the controller
-- kcs_chan : The LPC channel number in the controller
-- kcs_addr : The host CPU IO map address
-
-## v2
-Required properties:
-- compatible : should be one of
-    "aspeed,ast2400-kcs-bmc-v2"
-    "aspeed,ast2500-kcs-bmc-v2"
-- reg : The address and size of the IDR, ODR and STR registers
-- interrupts : interrupt generated by the controller
-- aspeed,lpc-io-reg : The host CPU LPC IO address for the device
-
-Example:
-
-    kcs3: kcs@24 {
-        compatible = "aspeed,ast2500-kcs-bmc-v2";
-        reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
-        aspeed,lpc-reg = <0xca2>;
-        interrupts = <8>;
-        status = "okay";
-    };
-- 
2.27.0

