Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35E4710FD0C
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2019 13:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbfLCMCu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Dec 2019 07:02:50 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:58355 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725954AbfLCMCs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Dec 2019 07:02:48 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 4163E22387;
        Tue,  3 Dec 2019 07:02:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 03 Dec 2019 07:02:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=HvGKvLGsejv5q
        6GtTUOtGOukBgIcidGBW9MonuS68ho=; b=ZhrnwV6uViMAZA7DE3VsRIv2y8sXN
        5hjKHMWJ5RYy9gvC9/tDa/mbWucW2WyxnS8FwW1AWnkdNLaDGfxda3KuB3/81y4j
        cW8JaWy0IOTZaho+6PeoguX7l0sgJbWlHwrEENGPUqTs15nzNG976FKax/nQXDBN
        VAgTCntkVjKE49ShbL/PZOuhzJ1EcpAFARviacyck2vqg4KHgnjYFTVTeHi3n+B9
        iPDYjLBMJRhIgH1Mx98lb2L0hADXmBQcimcoprWRN1SkT3BPAnzI5FaAJMoMPQ/B
        MXacJHmGEZuiIsNp2GA/1m+QVpVnJ/tb0BxCaJyjxEgFvexJ9TxI5LqFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=HvGKvLGsejv5q6GtTUOtGOukBgIcidGBW9MonuS68ho=; b=sl0EBSwP
        fgLfdNvtYWMq/0qrx0ZGOv27mt4dcztUaChUrZSERre07/ihve3kCbQCOjm3Voqk
        MRlo1nOvuXOveWhBPRLP03b86a8F+hNZjuL72+V7zau/vOzmvCfJGx8ShAD5lfUA
        f4zujIHv0dBHSZnocs88gc5oRZQ/rzDVwN3WkKUX7+8pocg9S4vfs3Mc0ievGkHL
        mEk071WC5LjbtQWZkI544+n+zDbtS+2t86TkFgLVZXZgRNbxuukVGtaScoiy3EHb
        rw83Ewf+/9xPZBonrbAhRnM5ipX3MKBRVx7bDjibtpVLn63sj+f3phhz/Qd8stkB
        KQZJ0JxpCFCTOQ==
X-ME-Sender: <xms:507mXXpS44J2E45MefSpX8tSikwu0lYlyK0wFrrO7Br3OmtqoYhWYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudejjedgfeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgv
    ficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfkphepudduke
    drvdduuddrledvrddufeenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegr
    jhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:507mXRn7vMqPqPrN5DsJ7J780TPxURG48xFaDKotRxQJuBiqvk4kOg>
    <xmx:507mXfx9HFVOZVZ9rm2-i11nHBTD0drKeWLmkbEXfm3j-L84tyWUAg>
    <xmx:507mXf1gat-BVlWeMrbE2wx9uiqEqMZWk4cNFfU4RAGKjQGkbI1I-Q>
    <xmx:507mXWbxXFwHAE-iFS9J3-ByRyCdtVYORzJCkbx3s-aS0YvpX-dEYA>
Received: from mistburn.lan (unknown [118.211.92.13])
        by mail.messagingengine.com (Postfix) with ESMTPA id C0480306010D;
        Tue,  3 Dec 2019 07:02:43 -0500 (EST)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-aspeed@lists.ozlabs.org
Cc:     joel@jms.id.au, robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: [PATCH 01/14] dt-bindings: pinctrl: aspeed: Add reg property as a hint
Date:   Tue,  3 Dec 2019 22:34:02 +1030
Message-Id: <b65a012a91b49352c0cdef01e8959a62537c8d76.1575369656.git-series.andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.08e3a6c95159f017b753d0f240086d1a7923758b.1575369656.git-series.andrew@aj.id.au>
References: <cover.08e3a6c95159f017b753d0f240086d1a7923758b.1575369656.git-series.andrew@aj.id.au>
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
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml | 3 +++
 Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
index 39ad8657d018..bb690e20c368 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
@@ -22,6 +22,9 @@ description: |+
 properties:
   compatible:
     const: aspeed,ast2400-pinctrl
+  reg:
+    description: |
+      A hint for the memory regions associated with the pin-controller
 
 patternProperties:
   '^.*$':
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
index 3c6405be07ed..f7f5d57f2c9a 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
@@ -23,6 +23,9 @@ description: |+
 properties:
   compatible:
     const: aspeed,ast2500-pinctrl
+  reg:
+    description: |
+      A hint for the memory regions associated with the pin-controller
   aspeed,external-nodes:
     minItems: 2
     maxItems: 2
-- 
git-series 0.9.1
