Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F339C75E70
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jul 2019 07:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbfGZFkk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Jul 2019 01:40:40 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:39753 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726327AbfGZFkj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 26 Jul 2019 01:40:39 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 6B0D422131;
        Fri, 26 Jul 2019 01:40:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 26 Jul 2019 01:40:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=when0qkXTHByR
        DowfQK5HCqanY/vJnQ/jMJsPByOs70=; b=a+CsVaRljZpVprqFBSgnzv1R850JX
        PCONSeS5+Ns5kCX0vf9uiRklR7xqNHVA8dCG5aWQ1wfFQ7M+V86wIKOaIT22hEXW
        P0ARVGiZR6OpJ7Rm9o+snxwiR307GmPLwOOSm8jcrRTXmIDOUwzUwwys83rP374M
        XKw1WxYNTj/dD87o2UKjyzcn+XTZp1pgV5u5kbA1slt+/z9j5htO9pLinfkdNE8N
        qH4F/8NtIVod//rxJCPYPjEZpdaARnqnz+Ucpkd4a6oi08IcmN/a7ML5kZ+tO16K
        oDz2XYJPx+VWcbNytfBQJQ1Oh/Vum4DHwaPDET1PXFZB6d7jVztfj6MXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=when0qkXTHByRDowfQK5HCqanY/vJnQ/jMJsPByOs70=; b=YpAITDH0
        YCCMpCLlYpIqhTuGOmwJDSUyHp8A8PfR6q3vnmHz6svTlYDvd93NitxgP43l9uUr
        gdDFE5S+qMhu6z68iHBNxSrNZmhZc46dlLY5HEP/MHkdYG6SzgCqm37NJ2+Kuy/p
        LtNT/VOPnMgNHUEcAy6lkEndVQlIeZe6GrvkLdnr6OHA2EqYXe3vGLc3LsmlqHuZ
        Y2mRkTl4J4KQZj1ISi9j5YcQeqVFD3a1MlCvP6BiNvbwczh79TVRugtRlEJSdu1w
        0eJ184nSGWeDU9lAJ6nBWHDibaG7Oq3Amqm3XTMS2aP4a7doD0JN+Bq/v0b5iGt6
        agct9Yw1VBaHYw==
X-ME-Sender: <xms:VpI6XSUyElCjY3qdtf00HZIAG_hSVIbO-u6z1VBshCUOWuiObz5I0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkeefgdeljecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughrvgif
    ucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhppedvtddvrd
    ekuddrudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdr
    ihgurdgruhenucevlhhushhtvghrufhiiigvpeek
X-ME-Proxy: <xmx:VpI6XRJ4nPPL2gcdzB_nCByc1LTGBGOSJM3V6qBS4jfu3A_jPyhxxA>
    <xmx:VpI6XaAgNSFu9RngqpfdeMiKVW3-nLr0WUbbwuCaAvsR3K4w1vNQCw>
    <xmx:VpI6XZdZ-7-7Z8qAWQuK862fS9g8Ju22NEgkupI227yUg7mfPCbxsw>
    <xmx:VpI6XZImWUphZneqP7nvCHXjY8voYYEn7t4v53TCl2GLxSHVBh49hg>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
        by mail.messagingengine.com (Postfix) with ESMTPA id 02E35380074;
        Fri, 26 Jul 2019 01:40:34 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-aspeed@lists.ozlabs.org
Cc:     Andrew Jeffery <andrew@aj.id.au>, robh+dt@kernel.org,
        mark.rutland@arm.com, joel@jms.id.au, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: [RFC PATCH 10/17] dt-bindings: pinctrl: aspeed: Add reg property as a hint
Date:   Fri, 26 Jul 2019 15:09:52 +0930
Message-Id: <20190726053959.2003-11-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726053959.2003-1-andrew@aj.id.au>
References: <20190726053959.2003-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pinctrl node sits under a syscon device, and can assume offsets from
the base of the syscon based on the compatible. However, for devicetree
correctness allow a reg property to be specified, which an associated
driver may choose to use to discover associated resources.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml    | 3 +++
 .../devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml    | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
index 125599a2dc5e..629a55c167ae 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
@@ -25,6 +25,9 @@ properties:
     enum:
       - aspeed,ast2400-pinctrl
       - aspeed,g4-pinctrl
+  reg:
+    description: |
+      A hint for the memory regions associated with the pin-controller
 
 patternProperties:
   '^.*$':
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
index 3e6d85318577..2e8971e23a02 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
@@ -25,6 +25,9 @@ properties:
     enum:
       - aspeed,ast2500-pinctrl
       - aspeed,g5-pinctrl
+  reg:
+    description: |
+      A hint for the memory regions associated with the pin-controller
   aspeed,external-nodes:
     minItems: 2
     maxItems: 2
-- 
2.20.1

