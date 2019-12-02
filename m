Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4008E10E5C9
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2019 07:14:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbfLBGMy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Dec 2019 01:12:54 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:36897 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725807AbfLBGMx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Dec 2019 01:12:53 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id A005F224C7;
        Mon,  2 Dec 2019 01:12:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 02 Dec 2019 01:12:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=TtqabJhdBLFnu
        OzhCtXhhJk4fJG130v6hJIWHqb1EQQ=; b=A0t3yxpyK1QZDlhwwlJDWAtN2Y6f3
        xjWDT9pzsiFXm6vWFDIAvEBoJmHGtxUSj6Jjy/xKKmKQjPsEjTSvrocZYLXzIz0n
        6+7G3q3iVpby6bAAyTeBh/t/1uPq0NZxkeSfaLIj9Fb3ZGSpJ8AgrQ5pAIvfOA3s
        DZWSQC459aLA+4nfLolM1m2eTkPbEyWr7euJ6lqq+bhteVJTXxzAHYADx1bMw69Q
        Unqph5c3l6VoJd61HGa2R67BPbtSlXZJvwQcusHU3KlYjq5KmngYJOq/n3g+0lWD
        snwtfJwWp9R6zc8KUOBSvarfD41BmG+1Ap6wW56M8gh0JQWbGdbkenS2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=TtqabJhdBLFnuOzhCtXhhJk4fJG130v6hJIWHqb1EQQ=; b=bbB2Ya0t
        5Ee8PnvIejVToLi6cZG7XKpLMnuo2Kgx8ePZtBpikgeBpKmnJzGBI7GcCuGXEpvO
        +94arYPs7DU4qBOzyx8SHVWwcQOL3OnroGVPOdL7Et6RDgqIyJiMMDLCXyJCl3YX
        Q8pMhoLz2M104C9PzzlZ55RufL8Qnpk3V1XWCI65RHOeItNZ7ODaHj7g/w06gLMp
        5WGOx44WdMdd0sEbR97qFJy0gfwKWwcwTQ8GlTcUk6pGrqpQ/+Ej9quokg7xWkR3
        ThRVo/Rhi0GfJ/pTIug4zJ2Yf+FCTJ49+1LPd+uJj2zLyIbNtJ2sWzv9i3yv8dLb
        mJ2bN3ZMdbI4pw==
X-ME-Sender: <xms:ZKvkXYkA6ZuobEhyDPoDzfMkRsRvcpFuQ5hkI_Us22-c3YOz_fCZTw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudejgedgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecukfhppeduudekrddvuddurdelvddrudefnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
    vgeptd
X-ME-Proxy: <xmx:ZKvkXaxu_RSMEyiLLhJBwOmGpYqfXcjIZFuEiGSDJhxywLBj712D9Q>
    <xmx:ZKvkXe37rixxZhN8U2JKHoIPRNNnUC07jYMTE9qHyEYc_NQ8CALCKg>
    <xmx:ZKvkXTbWTZ7wJZ8FZcgyjyEcucH8_3D2ZnTlOO8qU79_4KLo-h8SSw>
    <xmx:ZKvkXY0OqYrJA8QdjNcbgYWC6d1rquTZqnEcQSif98uYu_wvTWgBnw>
Received: from mistburn.lan (unknown [118.211.92.13])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6169880059;
        Mon,  2 Dec 2019 01:12:49 -0500 (EST)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        joel@jms.id.au, linux-aspeed@lists.ozlabs.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: pinctrl: aspeed-g6: Add USB functions and groups
Date:   Mon,  2 Dec 2019 16:44:26 +1030
Message-Id: <20191202061432.3996-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202061432.3996-1-andrew@aj.id.au>
References: <20191202061432.3996-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The AST2600 provides two USB ports (A and B) that expose various host,
device and HID functions.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml         | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
index 064b7dfc4252..3749fa233e87 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
@@ -54,8 +54,9 @@ patternProperties:
               TACH10, TACH11, TACH12, TACH13, TACH14, TACH15, TACH2, TACH3,
               TACH4, TACH5, TACH6, TACH7, TACH8, TACH9, THRU0, THRU1, THRU2,
               THRU3, TXD1, TXD2, TXD3, TXD4, UART10, UART11, UART12, UART13,
-              UART6, UART7, UART8, UART9, VB, VGAHS, VGAVS, WDTRST1, WDTRST2,
-              WDTRST3, WDTRST4, ]
+              UART6, UART7, UART8, UART9, USBAD, USBADP, USB2AH, USB2AHP,
+              USB2BD, USB2BH, VB, VGAHS, VGAVS, WDTRST1, WDTRST2, WDTRST3,
+              WDTRST4, ]
         groups:
           allOf:
             - $ref: "/schemas/types.yaml#/definitions/string"
@@ -85,8 +86,8 @@ patternProperties:
               TACH10, TACH11, TACH12, TACH13, TACH14, TACH15, TACH2, TACH3,
               TACH4, TACH5, TACH6, TACH7, TACH8, TACH9, THRU0, THRU1, THRU2,
               THRU3, TXD1, TXD2, TXD3, TXD4, UART10, UART11, UART12G0,
-              UART12G1, UART13G0, UART13G1, UART6, UART7, UART8, UART9, VB,
-              VGAHS, VGAVS, WDTRST1, WDTRST2, WDTRST3, WDTRST4, ]
+              UART12G1, UART13G0, UART13G1, UART6, UART7, UART8, UART9, USBA,
+              USBB, VB, VGAHS, VGAVS, WDTRST1, WDTRST2, WDTRST3, WDTRST4, ]
 
 required:
   - compatible
-- 
2.20.1

