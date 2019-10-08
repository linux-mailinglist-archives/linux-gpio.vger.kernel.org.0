Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0DFFCF1FE
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2019 06:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729799AbfJHEvd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Oct 2019 00:51:33 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:41273 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728297AbfJHEvd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Oct 2019 00:51:33 -0400
X-Greylist: delayed 592 seconds by postgrey-1.27 at vger.kernel.org; Tue, 08 Oct 2019 00:51:31 EDT
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id BD4BF531E;
        Tue,  8 Oct 2019 00:41:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 08 Oct 2019 00:41:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=M1iyDZQoxGoqP
        BEuWgwS+K5O8DqyhEij/CquYJUJoaw=; b=NcX1aAJhfI2m+KY1MqxeL5glZ8dlm
        MQtK1zf9enX1F/D9v4LBYV0TO1CgzpfTuv3qrMB3AiISoXNrnlfKp0QvHDVBa2YL
        HAo4thHiEqwosYGd/370kDe0/W3GGM83OKIFs3F4y/a/4Ha9BK7Gno+3YVoGB3tL
        H8STlOLLsPc/vgIs8F7se78tle+jo/1YiYfF+ccCMKf9V1NPAZYYsEnggVa/ohha
        m1tQfd6I7Gh+JDYcn2ZQv0e0JRM3iG+YTpPPCY5mgx1bfOph1ppmUkWPCC5JgUxx
        isCr0if/vNia579GamANLzP+ydQWNG06o2Y4d+MILTEnEC0/P4b13TN+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=M1iyDZQoxGoqPBEuWgwS+K5O8DqyhEij/CquYJUJoaw=; b=kQVGJmp8
        j+HdX5TRgaW2zULCxq8T1QJbxdfmr+ZIOC7ewEGjLuuDA8fm+nhwBKBez/prRlfX
        b2amqO3D2BIwuywb0E/L669kz2Fl1xS3L7T1oseZgtpcrNq3ryyJU1HhSxRIc+jh
        ZeXjuHXXPWk+AfYYAnS00yU/BZc9fgi1IRyECgY3lYryUhgshaQT+nYzCjWaldog
        MUCj//Ihs/egJtlURe7oHGIqBMcn1YX3dBqRlECr47+GdUYutYM27XOw4ag58I9j
        7o8Habj8TxXJfYamHAhXGkwr7Cx1C1Ba4UmT8qu/O6Q8S+XNrEufXIZ8xrTMlt9K
        b3zC7cP6q1ptlw==
X-ME-Sender: <xms:exOcXcxw3io__sw_1WbFc3cL7cdzvlkU5g28VkHiKrQC4e0MxP5CmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheekgdekgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucfkphepvddtvddrkedurddukedrfedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
    vd
X-ME-Proxy: <xmx:exOcXanJcndheNID_1QJZo5UqlblEluqqSLEVcXVUycFhuMDit_A1g>
    <xmx:exOcXWgsuruBvYRyNKmw9Kjgl0VhqPtFQjZ1swOtuB0R8HfDXcpYzw>
    <xmx:exOcXVd0-h2D7dXrATaeallC2mQCJGVE7FuJxJEF58QpkOOtPihTFA>
    <xmx:exOcXYfC4AGe1h1j8maPIOz4r8QjFtJ2yF-dQ0xJce5V-AGK4BhIkg>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
        by mail.messagingengine.com (Postfix) with ESMTPA id 09B4C80064;
        Tue,  8 Oct 2019 00:41:27 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        joel@jms.id.au, linux-aspeed@lists.ozlabs.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, johnny_huang@aspeedtech.com,
        ryanchen.aspeed@gmail.com
Subject: [PATCH 3/7] pinctrl: aspeed-g6: Fix I2C14 SDA description
Date:   Tue,  8 Oct 2019 15:11:49 +1030
Message-Id: <20191008044153.12734-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008044153.12734-1-andrew@aj.id.au>
References: <20191008044153.12734-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The I2C function the pin participated in was incorrectly named SDA14
which lead to a failure to mux:

[    6.884344] No function I2C14 found on pin 7 (7). Found signal(s) MACLINK4, SDA14, GPIOA7 for function(s) MACLINK4, SDA14, GPIOA7

Fixes: 58dc52ad00a0 ("pinctrl: aspeed: Add AST2600 pinmux support")
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index ff208b7c75a8..9079655cc818 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -87,7 +87,7 @@ FUNC_GROUP_DECL(MACLINK3, L23);
 
 #define K25 7
 SIG_EXPR_LIST_DECL_SESG(K25, MACLINK4, MACLINK4, SIG_DESC_SET(SCU410, 7));
-SIG_EXPR_LIST_DECL_SESG(K25, SDA14, SDA14, SIG_DESC_SET(SCU4B0, 7));
+SIG_EXPR_LIST_DECL_SESG(K25, SDA14, I2C14, SIG_DESC_SET(SCU4B0, 7));
 PIN_DECL_2(K25, GPIOA7, MACLINK4, SDA14);
 FUNC_GROUP_DECL(MACLINK4, K25);
 
-- 
2.20.1

