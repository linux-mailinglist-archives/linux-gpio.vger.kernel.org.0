Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3005F784A9
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 07:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbfG2F4N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 01:56:13 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:37159 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726832AbfG2F4N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Jul 2019 01:56:13 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id C153622A8;
        Mon, 29 Jul 2019 01:56:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 29 Jul 2019 01:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=X7ftRY0n/ppqJ
        obOZqCX51ux9OAohStr29ZTJLcVjmQ=; b=EUGH7THdAQOM3iG1Id8jiHV8FZjwQ
        C3hzDk4fQZDzd+y44ucWCSN1MuY8302J8cKFOZzRVdt0+RIQGc2rdP7z/EpcNg5Y
        XPZpBXVjHrwzA7IQTfjYBO3x2IVhNCf3LSN+DYr83pokjOtN6LeMJaKe6kF4dH9m
        A4QXFeik6mO16MK9zyb+uRYJlaHRab+1lz7BXfkmOfQDPAi5jKaKs0GUeFr++qGH
        BsdTMvMQDX04Z4ONup731fYihnUtIbwnJmvJwVut8bFpfGZLGYsltG6bdPnovrod
        Vf0+5JzAuWphnJ1oYY3kn8wFYD0kbxL8/lujjpEmCXQfa4gbCs4qeMECA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=X7ftRY0n/ppqJobOZqCX51ux9OAohStr29ZTJLcVjmQ=; b=bNjOWRxl
        25J8pw0RHXBsJOEzEhKiCTz2e0jvKKsXnTFpEwT2m8t8HYArZNbhVdmMSHPTgCc3
        02RPkuJMhPctf2DMZcNhNfhEmVAXMoqhq7mhiZYHj6EOEFycTLdnYFoDBPRrAJ3R
        JJ8dBmGxv3yEsy/PQcfBG3CwkdR5FWIooFUkIlCIyaDgqHjL095cfmIqm3irHfiu
        xlBhERNxGpo16htg6+Y5YRGUxOjDlc5mZr8XCU+FsHroNfcBodODrV8Fuo93Dgi6
        Qw0QsuCeckuTzNIS7FGu+JBjUBPgQkxr5iXnG0FAsmTAhAuxUpXuLXRRtjgVCABd
        OPbUG7u1bvEIGw==
X-ME-Sender: <xms:fIo-XTzWFpMswbo4cgeSSr5i0Nt4KNTeCNoecqnCLpCXL1ixKtS0AA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrledtgddutddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecukfhppedvtddvrdekuddrudekrdeftdenucfrrghrrghmpehmrg
    hilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigv
    pedu
X-ME-Proxy: <xmx:fIo-XR1gy1Lz874ZpvXOjqMDKi5SkSSwgg-ti5Aup7l8Uq9V3c6upQ>
    <xmx:fIo-XagmNyvH2cujLiMIaAkxCaoneW69btXVUbkATWQapf_xWk0hog>
    <xmx:fIo-XflGS1NUezg5Ah4iVwiVa5_Je1JmckekKwoHacTS-j2T5gGlFw>
    <xmx:fIo-XYkfdj7PEE7V22i8z8udPQ20GZlls2bNk-XeJQ-8-jNUZnXScA>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
        by mail.messagingengine.com (Postfix) with ESMTPA id D2DCD8005B;
        Mon, 29 Jul 2019 01:56:08 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     Andrew Jeffery <andrew@aj.id.au>, linus.walleij@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au,
        ryanchen.aspeed@gmail.com, johnny_huang@aspeedtech.com,
        linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] pinctrl: aspeed: Add PIN_DECL_3() helper
Date:   Mon, 29 Jul 2019 15:26:01 +0930
Message-Id: <20190729055604.13239-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729055604.13239-1-andrew@aj.id.au>
References: <20190729055604.13239-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This case is common in the AST2600, so add to the collection.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinmux-aspeed.h | 72 ++++++++++++++------------
 1 file changed, 40 insertions(+), 32 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.h b/drivers/pinctrl/aspeed/pinmux-aspeed.h
index 0406beedd5ba..964dd5b242ac 100644
--- a/drivers/pinctrl/aspeed/pinmux-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinmux-aspeed.h
@@ -604,38 +604,6 @@ struct aspeed_pin_desc {
 	static const struct aspeed_pin_desc PIN_SYM(pin) = \
 		{ #pin, PIN_EXPRS_PTR(pin) }
 
-/**
- * Declare a two-signal pin
- *
- * @pin: The pin number
- * @other: Macro name for "other" functionality (subjected to stringification)
- * @high: Macro name for the highest priority signal functions
- * @low: Macro name for the low signal functions
- *
- * For example:
- *
- *     #define A8 56
- *     SIG_EXPR_DECL(ROMD8, ROM16, SIG_DESC_SET(SCU90, 6));
- *     SIG_EXPR_DECL(ROMD8, ROM16S, SIG_DESC_SET(HW_STRAP1, 4),
- *              { HW_STRAP1, GENMASK(1, 0), 0, 0 });
- *     SIG_EXPR_LIST_DECL(ROMD8, SIG_EXPR_PTR(ROMD8, ROM16),
- *              SIG_EXPR_PTR(ROMD8, ROM16S));
- *     SIG_EXPR_LIST_DECL_SINGLE(NCTS6, NCTS6, SIG_DESC_SET(SCU90, 7));
- *     PIN_DECL_2(A8, GPIOH0, ROMD8, NCTS6);
- */
-#define PIN_DECL_2(pin, other, high, low) \
-	SIG_EXPR_LIST_DECL_SINGLE(other, other); \
-	PIN_DECL_(pin, \
-			SIG_EXPR_LIST_PTR(high), \
-			SIG_EXPR_LIST_PTR(low), \
-			SIG_EXPR_LIST_PTR(other))
-
-#define PIN_GROUP_SYM(func) pins_ ## func
-#define FUNC_GROUP_SYM(func) groups_ ## func
-#define FUNC_GROUP_DECL(func, ...) \
-	static const int PIN_GROUP_SYM(func)[] = { __VA_ARGS__ }; \
-	static const char *FUNC_GROUP_SYM(func)[] = { #func }
-
 /**
  * Declare a single signal pin
  *
@@ -670,6 +638,46 @@ struct aspeed_pin_desc {
 	SIG_EXPR_LIST_DECL_SINGLE(other, other); \
 	PIN_DECL_(pin, SIG_EXPR_LIST_PTR(sig), SIG_EXPR_LIST_PTR(other)); \
 	FUNC_GROUP_DECL(sig, pin)
+/**
+ * Declare a two-signal pin
+ *
+ * @pin: The pin number
+ * @other: Macro name for "other" functionality (subjected to stringification)
+ * @high: Macro name for the highest priority signal functions
+ * @low: Macro name for the low signal functions
+ *
+ * For example:
+ *
+ *     #define A8 56
+ *     SIG_EXPR_DECL(ROMD8, ROM16, SIG_DESC_SET(SCU90, 6));
+ *     SIG_EXPR_DECL(ROMD8, ROM16S, SIG_DESC_SET(HW_STRAP1, 4),
+ *              { HW_STRAP1, GENMASK(1, 0), 0, 0 });
+ *     SIG_EXPR_LIST_DECL(ROMD8, SIG_EXPR_PTR(ROMD8, ROM16),
+ *              SIG_EXPR_PTR(ROMD8, ROM16S));
+ *     SIG_EXPR_LIST_DECL_SINGLE(NCTS6, NCTS6, SIG_DESC_SET(SCU90, 7));
+ *     PIN_DECL_2(A8, GPIOH0, ROMD8, NCTS6);
+ */
+#define PIN_DECL_2(pin, other, high, low) \
+	SIG_EXPR_LIST_DECL_SINGLE(other, other); \
+	PIN_DECL_(pin, \
+			SIG_EXPR_LIST_PTR(high), \
+			SIG_EXPR_LIST_PTR(low), \
+			SIG_EXPR_LIST_PTR(other))
+
+#define PIN_DECL_3(pin, other, high, medium, low) \
+	SIG_EXPR_LIST_DECL_SINGLE(other, other); \
+	PIN_DECL_(pin, \
+			SIG_EXPR_LIST_PTR(high), \
+			SIG_EXPR_LIST_PTR(medium), \
+			SIG_EXPR_LIST_PTR(low), \
+			SIG_EXPR_LIST_PTR(other))
+
+#define PIN_GROUP_SYM(func) pins_ ## func
+#define FUNC_GROUP_SYM(func) groups_ ## func
+#define FUNC_GROUP_DECL(func, ...) \
+	static const int PIN_GROUP_SYM(func)[] = { __VA_ARGS__ }; \
+	static const char *FUNC_GROUP_SYM(func)[] = { #func }
+
 
 #define GPIO_PIN_DECL(pin, gpio) \
 	SIG_EXPR_LIST_DECL_SINGLE(gpio, gpio); \
-- 
2.20.1

