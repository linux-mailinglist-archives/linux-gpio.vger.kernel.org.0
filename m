Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B81163415AF
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 07:30:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234138AbhCSGaR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 02:30:17 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:40449 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234210AbhCSGaB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Mar 2021 02:30:01 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 09A5E580A82;
        Fri, 19 Mar 2021 02:30:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 19 Mar 2021 02:30:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=5oH72UxBPItkL
        oFd6WxftMKWTkqg+oELaFqx3t9Isv4=; b=pLi8bbgzq0NFo60Xqb1DadiWgiMls
        Pb/V3jQk6WETOMg75ytPqsfh2mVvyUBbopCOUNqDSuzgSMl+KoLEhxiHCjegk5zM
        j8/Z1jI2CWansfOmHKshN6INyUlihKbvPaZXb9GJdnQ/G8NADL9VlyqbklDy0jMy
        CCllKEVFdIPL5bkQBKw3lTS0fZjNFReFLJPiN+LyefmkNbW6maLSOrOomUCbdWyG
        cb8ERlp8SK/W16HrTCNCI9mB/Iyzr/s0FUAY/FgRgJxeOU2ZgmExixEE/2P4/Xiz
        FxtSKXHT28+UkGdDhZEslhL3J8JU0mUUlUHX+5SEUVnEJYSbe7at8resA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=5oH72UxBPItkLoFd6WxftMKWTkqg+oELaFqx3t9Isv4=; b=FdRKCSBx
        Eahm0Ck+tyEfJ5SLdBOsRsYs+hKCUAVOPIfRWYgOWeP7dWWy8NKkiGq0VPsnxtVX
        IG9r92So6Biv8DXhzG9Xmuh0t226GKATX8C8GnFCBH7iUAw41EiDjArWJW45pLGY
        j36t8Qao3rykRrRXqr/QIGae8tQ1OO8Gs2zyY/GWxqa+w2KlEMWvZjtAOkr3pn/k
        xc632J6cF8gpQAnaSlr1OJB3+d5YVI1YdmDqXz4GqyxgEXeqROYt34518pkYX9Zb
        73crvzj4qx5sqT88mRV6nExs7DHfjH1qHF6JK/jC4VZbm9BUjn9VtzJvKW45bZbc
        nw69al8hM1t/Dw==
X-ME-Sender: <xms:6ERUYHpblTfYAGoT3zAe9FhU9ivCd9cXszp5wdmarVFL8fmeNjeHYg>
    <xme:6ERUYBqrNUMvO6CbVUBtED2VLnPn5JN_SqouxWhYSSZrysVDxx_e8iWa7wZwORkrP
    5zz0P8le_3zPLQcNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefjedgleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepleeuvdevtdfggfeggffgueegvefghf
    ejfeeitddvhedvhfetffetffefiefhvedvnecuffhomhgrihhnpeguvghvihgtvghtrhgv
    vgdrohhrghenucfkphepuddukedrvddutddrudekuddrheehnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgr
    uh
X-ME-Proxy: <xmx:6ERUYEOO6xTVtpjCCrypItKwnHNPI6XUMWojnBbb4RJKP35BJSxtgg>
    <xmx:6ERUYK4www73o6y44TCFqaWlZfs1Puqc0WMA153pLGF4XPPnVZaNGA>
    <xmx:6ERUYG7Sg6fHOyb4IZp3cz3yZUHz1pb8N0eFvk7uBrrN9rnJerl7JA>
    <xmx:6URUYCr-buEXlZ4_LbPW4jY--HSAE4cjmGrB73ORkqLjwGwyZzm5Fg>
Received: from localhost.localdomain (ppp118-210-181-55.adl-adc-lon-bras34.tpg.internode.on.net [118.210.181.55])
        by mail.messagingengine.com (Postfix) with ESMTPA id 720E0240057;
        Fri, 19 Mar 2021 02:29:55 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
        minyard@acm.org
Cc:     joel@jms.id.au, ryan_chen@aspeedtech.com,
        devicetree@vger.kernel.org, tmaimon77@gmail.com,
        linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        avifishman70@gmail.com, venture@google.com,
        linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        tali.perry1@gmail.com, robh+dt@kernel.org, lee.jones@linaro.org,
        chiawei_wang@aspeedtech.com, linux-arm-kernel@lists.infradead.org,
        benjaminfair@google.com
Subject: [PATCH v2 17/21] dt-bindings: ipmi: Convert ASPEED KCS binding to schema
Date:   Fri, 19 Mar 2021 16:57:48 +1030
Message-Id: <20210319062752.145730-17-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319062752.145730-1-andrew@aj.id.au>
References: <20210319062752.145730-1-andrew@aj.id.au>
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
index 000000000000..697ca575454f
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
+    # maxItems: 3
+    items:
+      - description: IDR register
+      - description: ODR register
+      - description: STR register
+
+  aspeed,lpc-io-reg:
+    $ref: '/schemas/types.yaml#/definitions/uint32-array'
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
+    description: The LPC channel number in the controller
+
+  kcs_addr:
+    deprecated: true
+    $ref: '/schemas/types.yaml#/definitions/uint32'
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

