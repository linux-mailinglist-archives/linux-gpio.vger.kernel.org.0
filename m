Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA19E650D5
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2019 06:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbfGKEUJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jul 2019 00:20:09 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:59879 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727831AbfGKEUJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Jul 2019 00:20:09 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id C84A62F17;
        Thu, 11 Jul 2019 00:20:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 11 Jul 2019 00:20:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=X7ftRY0n/ppqJ
        obOZqCX51ux9OAohStr29ZTJLcVjmQ=; b=cGoviOEEGwngfl6VLqBvD9tiTy+gn
        5Z5a3WRS4Jp+DhIPj9NCeJ+FOceFEGaby0LVjS8GPNDesOjagd+nqS3FBtxK/53t
        MgArao16EwjPNtcdSfCqq3tgB9XlapxIZ3nLZvH42soA1Uf+2QiHgKk9Qe+r+Smk
        Zd09Estv6fuJawoAkUVDJejc14sz34VpIuN7U3Y7mEll4HsYm6FRHizPDHGV5IZR
        t96aAGYDKgr7SPYh98Ancjrc4voIfX/E70R/R3jJyk40FW2JgiSmi8xTKbbXFNhP
        ihDOyu6c5swp9yxWTpPKMCxqB6xGgZ9/Z7qxb3fpUNDU49WjSZNJY691g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=X7ftRY0n/ppqJobOZqCX51ux9OAohStr29ZTJLcVjmQ=; b=UgY7pz68
        LTye52h5TiicEDEpqC9kIgHe78P6MqZ1z4BtIVmInsFFpGjXKcK4wuVc2TNx52N/
        zxLMOjAS+UTtTY3pYZq6MOMJFffT9eiHZa+Fb/Yi+2IE6mK5HAiCnIht6SDQGIG3
        gY4gxvQMKMpd7tQtIc32NrnJBrBIv/osIzubYmXvhzvPvC8i++0ywi7TcIXBgzL4
        /RhK5wcaUG2HfbJNOySVAR+E/9OmdlHZg43t3+HdJuiP14pG0SYGw8PqLFSLY/tU
        N8NYwQ4c8Zck5G2vwFzU/9CU10HfAPld883+R/rf5rLwsonEX3M4hCD94u5Eekhi
        3aNWRzo935K2kw==
X-ME-Sender: <xms:97gmXSHWdXyR8jU9L3NN6LNlUybENPp3FLyCGAzC9-dWXbYtRQbkxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgeejgdektdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucfkphepvddtvddrkedurddukedrfedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
    ud
X-ME-Proxy: <xmx:97gmXfq-pKLObp_zTxyhqgp9iLqK3do0nZW9TuGKbrS718HwzSvr9Q>
    <xmx:97gmXe71MC2DH0aPGg9NkavMTrCyZWynrfJn7YJB3IYbukWsLgVMQQ>
    <xmx:97gmXd4pyC5Up-NMHZdcVogvRXYmgbvT7abDPFds3f2zk-breMQEtg>
    <xmx:97gmXbC5x8nZyc7P83_laengR_lNbP4XtV2YgKuwBddGBGtLebKNKA>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
        by mail.messagingengine.com (Postfix) with ESMTPA id 67E8780060;
        Thu, 11 Jul 2019 00:20:02 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     Andrew Jeffery <andrew@aj.id.au>, linus.walleij@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au,
        ryanchen.aspeed@gmail.com, johnny_huang@aspeedtech.com,
        linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] pinctrl: aspeed: Add PIN_DECL_3() helper
Date:   Thu, 11 Jul 2019 13:49:39 +0930
Message-Id: <20190711041942.23202-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190711041942.23202-1-andrew@aj.id.au>
References: <20190711041942.23202-1-andrew@aj.id.au>
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

