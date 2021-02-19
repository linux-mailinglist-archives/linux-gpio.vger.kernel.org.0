Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3201F31FAAE
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Feb 2021 15:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231129AbhBSO2V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Feb 2021 09:28:21 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:36381 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230510AbhBSO2F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Feb 2021 09:28:05 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 581FB5803C3;
        Fri, 19 Feb 2021 09:27:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 19 Feb 2021 09:27:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=VNXUckXhWf104
        SCgHGqEwb2slaaFyK0SHtZQq67z01A=; b=LuAdh3bT24Cvz7Rbc4zR45ImmSGbg
        0Yz58kKjoaHl2THSVhpgfLhcVDP4szp1uO2/Kmk8kQb7683v6VaqoRpGw06ItnVc
        6bHe7X5azvxR2+Kas625hwwoM+XAZPJvOZG8eN4zH8UoDwmYJxMhlIM3p/AowYSd
        ZUUZnCQUHDlTPO2d893A3eP1ul4yqTcvYvFlPOMt1UCt5GIxhnGF0OW35NPyF4EL
        +ponm44NZfc/nXhcRZwVIcoTSl0vYzzpnEZqlmtwylQW18pJqSO/ji7qDre5oyHK
        7qU87c114lBEA+FujeS1MVhAjLtZs9RxbTZPO7+Wni8goexS4uTTonBIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=VNXUckXhWf104SCgHGqEwb2slaaFyK0SHtZQq67z01A=; b=VCr6wQiG
        IctyXO7SLN9mFvT6o++LRDoYmgrWh6CDC045msp3FkToGtudYMYfY7PTs1mQMT+E
        4fJ9i8WoDNrWcD903JvBxycvAt9TqQMyu2ijas5gKcYjkioMVX9/guUyDMfaLTYj
        qqRcuGKZv4fAlNyv5czCGzPnRFpJv92pVo9I+wj4BTrUSWtpitMayFLfkKF/1miL
        YNQPMxZIA5te7C9Pt6/eiG6zZkJ8p6vPM9Chtv17/lF9OnBvJDLyGhIfqHJ1svxF
        iLTWuvdLwi7GzkJAXThVBbwAUcRYkIdGqeLAzRPYH5SyoH5scKydiEDyPFv77MP2
        8ZQigCW0YSTSKA==
X-ME-Sender: <xms:3covYGMvKRsIfOvVfmeijimdV3GtAHANZiw2JVn0lM956G6l--B-iA>
    <xme:3covYE87VmJ3utNkw0IOb4n3uM7PM4ZVOxTdOg5cMf9JodhDTBx9kmHh0L0ZB1xki
    kaLi96vair6A3-y6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdeigecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
    ejffelffdvudduveeiffegteelvefhteenucfkphepudegrddvrdeluddrfeejnecuvehl
    uhhsthgvrhfuihiivgepleenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
    grjhdrihgurdgruh
X-ME-Proxy: <xmx:3covYNSSNH6BgmqXNgqPF0O0ENakk2A5vV22P5MP8z0qwzJLZvRhFw>
    <xmx:3covYGtooHBVwAgY6YdDapYLHsb8y-EeIyQhvgQY8vy5IShQ1J-_Zg>
    <xmx:3covYOdbBFvWMvNj9W7N7ILEZ9ydQK7RBVoCciNWGCZ3G5ALJqSS3g>
    <xmx:3covYBtyTHAKfBFJrw4hgNXud8JAP7AQOO2tuPsJfrqpClLBFiZlSA>
Received: from localhost.localdomain (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
        by mail.messagingengine.com (Postfix) with ESMTPA id DAE33240064;
        Fri, 19 Feb 2021 09:27:34 -0500 (EST)
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
Subject: [PATCH 17/19] dt-bindings: ipmi: Add optional SerIRQ property to ASPEED KCS devices
Date:   Sat, 20 Feb 2021 00:55:21 +1030
Message-Id: <20210219142523.3464540-18-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210219142523.3464540-1-andrew@aj.id.au>
References: <20210219142523.3464540-1-andrew@aj.id.au>
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
index 1c1cc4265948..808475a2c2ca 100644
--- a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
+++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
@@ -47,6 +47,18 @@ properties:
       channels the status address is derived from the data address, but the
       status address may be optionally provided.
 
+  aspeed,lpc-interrupts:
+    $ref: "/schemas/types.yaml#/definitions/uint32-matrix"
+    minItems: 1
+    maxItems: 1
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

