Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ECDB3415B0
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 07:30:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234153AbhCSGaT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 02:30:19 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:42085 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233919AbhCSGaH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Mar 2021 02:30:07 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id F2BC2580A85;
        Fri, 19 Mar 2021 02:30:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 19 Mar 2021 02:30:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=QRDiTNGJwy42h
        fOUMjmwo2Lxr+h4OGF8vd82Dnei0yg=; b=aKKxtWkePJOP9OvXvaQqpJcmnBjD3
        QLcjC6VhCh3bstlp3BeT8dbN3iw7wOTvgAlYrP6CwMllYSjzwKjhJ36Hdd5Z4zrJ
        hPQ23U1dSzbv4ZJn6jnw+brIZoeGIYnXok/vD0en4lYGWdbTFSiTC2r4hiTde26f
        i/eynZitLYZ92+VX1abe/ZHyvIk+zVaBcMGGmKsXMqbWH+eu3HCbUXy3j9AP8KJR
        Ae+cA5YZialf4g9cH4boJRbB38M9i3OfBzoPrDmqTFx1PiknNPDUMQiZ8Yh/aVVA
        JMSHz0r9Q7qCyFXW5wsDfdPtR3ZrOXOOtMOBb9zV6W28YnqDEOl3gaeVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=QRDiTNGJwy42hfOUMjmwo2Lxr+h4OGF8vd82Dnei0yg=; b=Pr7RXhlX
        GP817mV0vLm6R7wuf2pubbnEco69DyrHkGoNglo5tOpBsp8bdcIlQOLq6jo2CZCc
        saiGrjX9dWQgvbgNPD5mhV4H5EkEaoBZhSJO7QzK4wcfT1O+VwVSNbYmLEZPVj02
        XJppEoGHvzr5BFLDGRZhHVqXVnGUKUa3X3lmzSJLjQYS91eitGtAh8WDzR0U/JCz
        /Bqb8VDsmChgYXoIc/bjhmo7okuXweAUvC5+Pnnf4LWvhpJ+VWMjXHylfqJFC2jO
        5o1CEyhEhGKrjiSCOrsfAZUBpQcGbgrp6rl/g4Ez/dzl2uIGHgBsrLKfBC7upJMv
        vTaZQVpUQBDasQ==
X-ME-Sender: <xms:7kRUYAPz2ssjNruzlDvnfIlV-DnZq5IFCjb70_aDFn032M8XalQ1PA>
    <xme:7kRUYP6nGA3tpM4ZgJiiEoOrWvz7vpjw2VBD1nGazCQIuthIHm4R-81JsFxT9e6PR
    _gtrR925tOAhp5PfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefjedgleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
    etjeffleffvdduudevieffgeetleevhfetnecukfhppeduudekrddvuddtrddukedurdeh
    heenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
    gurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:7kRUYJOmLXqdlP0EBEawQTaCEZzuMSQya0Ar9eggXOQHRT8trQl86A>
    <xmx:7kRUYFmxMO5BS9hFFcN-eKtjRPLXfMWt_0eGEiyxWKvewyQWRoykBQ>
    <xmx:7kRUYIRw74ecXDgcW8IXSdR23G2lfmhsxagZ-9XcO_yARV1MbbWaKA>
    <xmx:7kRUYIx2gFbQh8I4aXgwoo8sWdgYiorT9_DzmcgoBFRFvIdWjz66hQ>
Received: from localhost.localdomain (ppp118-210-181-55.adl-adc-lon-bras34.tpg.internode.on.net [118.210.181.55])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6B13A240057;
        Fri, 19 Mar 2021 02:30:01 -0400 (EDT)
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
Subject: [PATCH v2 18/21] dt-bindings: ipmi: Add optional SerIRQ property to ASPEED KCS devices
Date:   Fri, 19 Mar 2021 16:57:49 +1030
Message-Id: <20210319062752.145730-18-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319062752.145730-1-andrew@aj.id.au>
References: <20210319062752.145730-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allocating IO and IRQ resources to LPC devices is in-theory an operation
for the host, however ASPEED don't appear to expose this capability
outside the BMC (e.g. SuperIO). Instead, we are left with BMC-internal
registers for managing these resources, so introduce a devicetree
property for KCS devices to describe SerIRQ properties.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
index 697ca575454f..4ff6fabfcb30 100644
--- a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
+++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
@@ -49,6 +49,18 @@ properties:
       channels the status address is derived from the data address, but the
       status address may be optionally provided.
 
+  aspeed,lpc-interrupts:
+    $ref: "/schemas/types.yaml#/definitions/uint32-array"
+    minItems: 2
+    maxItems: 2
+    description: |
+      A 2-cell property expressing the LPC SerIRQ number and the interrupt
+      level/sense encoding (specified in the standard fashion).
+
+      Note that the generated interrupt is issued from the BMC to the host, and
+      thus the target interrupt controller is not captured by the BMC's
+      devicetree.
+
   kcs_chan:
     deprecated: true
     $ref: '/schemas/types.yaml#/definitions/uint32'
@@ -84,9 +96,11 @@ allOf:
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/irq.h>
     kcs3: kcs@24 {
         compatible = "aspeed,ast2600-kcs-bmc";
         reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
         aspeed,lpc-io-reg = <0xca2>;
+        aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
         interrupts = <8>;
     };
-- 
2.27.0

