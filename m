Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA7A710E5CA
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2019 07:14:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbfLBGM6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Dec 2019 01:12:58 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:42291 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726474AbfLBGM6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Dec 2019 01:12:58 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 2D37E224A7;
        Mon,  2 Dec 2019 01:12:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 02 Dec 2019 01:12:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=jlWllcUTVv5SX
        2RtZ9JYjgUykmxfyTIbsbM3/crA7Bk=; b=SiFFskpvT863fYykSPWCZxSQxS/7a
        OGo2IfpYymebOZam21NPxk14QRZpNHuSgx3CoC5wvrdf0LXBhcYbuEUnF7g2lGRq
        4XuCMBFXEmgaU0SsYw0Ep8ZthBwPTEop1gXVTZYTyQW6EgOCQLB8pgUG7a+cdJGq
        XgZlat0xGEd/tLSsXUcJPQ16nytxC4qnnKJH47vAqHG40lx0oFC9x54QR+1rk095
        waUhkktCW/sHxf17QZjsSeiPg0hgrZorw5dOKdqT8PkDnoaTYUSo9PLBhnYDOeNt
        8Lw/LKm8EVsE5rIvXF8H3eAAVrDdKKja7c5BTqRfiAAFWV/Z+DZVoJAvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=jlWllcUTVv5SX2RtZ9JYjgUykmxfyTIbsbM3/crA7Bk=; b=TB+uzLSI
        OXoNTZaBtPf91ojLROKEoRTRKCB5IqxtZDrkFthHhZEGvskldl6fnqxOBGXRaX/b
        cSj7o6zgDwt/ELLkoHf+WBDOy84LXh1EgcCEjm4j/di79WXrnnaE1l/Sl3QAIhB/
        h8tkOdbjHBgKB29lniqcGDJyt4Hlob8tp+EMDoMEboGJ+sjifb80P2e4/vLGbvNF
        XfBxr0PIIDHcPySxf94BVRgdfIK9051y4UWIN1RTscKntJsNIhyR8p2UdaH+jGMF
        VREWQaa925o/vLzwnAqIHMF5bjo8CCpszvDxzGD1G8J/pyndOwWOU8un80aljOPb
        6+voZYLL7xj+/w==
X-ME-Sender: <xms:aKvkXRexa_jaylCUU4jPDhz6-gjGbynbjPpKPPzZyoLUZmBpDKGRJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudejgedgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgv
    ficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfkphepudduke
    drvdduuddrledvrddufeenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegr
    jhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:aKvkXf4ccZ_Y1VcKSjHwy951XsrLFEfQaNJm_kJ345N3bIRM5X5HcQ>
    <xmx:aKvkXVnzVLBxVC9VfXBpzvmNoj5yz6biii4FhTKH8cCpuxTWLcllog>
    <xmx:aKvkXa9kqk3vXxjmWWDf89PumX5Q14GXqiq8omf8QVhWZRqZP8Nc9A>
    <xmx:aavkXSZMYI4-PxUJxKNSJ6l0LVQqgveNS6IeGa43fz1SjZyjvkcp7Q>
Received: from mistburn.lan (unknown [118.211.92.13])
        by mail.messagingengine.com (Postfix) with ESMTPA id F0AFD80059;
        Mon,  2 Dec 2019 01:12:52 -0500 (EST)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     Johnny Huang <johnny_huang@aspeedtech.com>,
        linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        joel@jms.id.au, linux-aspeed@lists.ozlabs.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] pinctrl: aspeed-g6: Add AST2600 I3C1 and I3C2 pinmux config
Date:   Mon,  2 Dec 2019 16:44:27 +1030
Message-Id: <20191202061432.3996-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202061432.3996-1-andrew@aj.id.au>
References: <20191202061432.3996-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Johnny Huang <johnny_huang@aspeedtech.com>

These pins only expose a single function but are not fixed-function as
their I3C capability can be disabled.

Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
[AJ: Tweak commit message, sort pins list]
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 30 +++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index c6800d220920..49fc4824ccee 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -37,7 +37,7 @@
 #define SCU510		0x510 /* Hardware Strap 2 */
 #define SCU694		0x694 /* Multi-function Pin Control #25 */
 
-#define ASPEED_G6_NR_PINS 248
+#define ASPEED_G6_NR_PINS 252
 
 #define M24 0
 SIG_EXPR_LIST_DECL_SESG(M24, MDC3, MDIO3, SIG_DESC_SET(SCU410, 0));
@@ -1542,6 +1542,26 @@ GROUP_DECL(I3C4, AE25, AF24);
 FUNC_DECL_2(I3C4, HVI3C4, I3C4);
 FUNC_GROUP_DECL(FSI2, AE25, AF24);
 
+#define AF23 248
+SIG_EXPR_LIST_DECL_SESG(AF23, I3C1SCL, I3C1, SIG_DESC_SET(SCU438, 16));
+PIN_DECL_(AF23, SIG_EXPR_LIST_PTR(AF23, I3C1SCL));
+
+#define AE24 249
+SIG_EXPR_LIST_DECL_SESG(AE24, I3C1SDA, I3C1, SIG_DESC_SET(SCU438, 17));
+PIN_DECL_(AE24, SIG_EXPR_LIST_PTR(AE24, I3C1SDA));
+
+FUNC_GROUP_DECL(I3C1, AF23, AE24);
+
+#define AF22 250
+SIG_EXPR_LIST_DECL_SESG(AF22, I3C2SCL, I3C2, SIG_DESC_SET(SCU438, 18));
+PIN_DECL_(AF22, SIG_EXPR_LIST_PTR(AF22, I3C2SCL));
+
+#define AE22 251
+SIG_EXPR_LIST_DECL_SESG(AE22, I3C2SDA, I3C2, SIG_DESC_SET(SCU438, 19));
+PIN_DECL_(AE22, SIG_EXPR_LIST_PTR(AE22, I3C2SDA));
+
+FUNC_GROUP_DECL(I3C2, AF22, AE22);
+
 /* Pins, groups and functions are sort(1):ed alphabetically for sanity */
 
 static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
@@ -1633,6 +1653,8 @@ static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(AE16),
 	ASPEED_PINCTRL_PIN(AE18),
 	ASPEED_PINCTRL_PIN(AE19),
+	ASPEED_PINCTRL_PIN(AE22),
+	ASPEED_PINCTRL_PIN(AE24),
 	ASPEED_PINCTRL_PIN(AE25),
 	ASPEED_PINCTRL_PIN(AE26),
 	ASPEED_PINCTRL_PIN(AE7),
@@ -1642,6 +1664,8 @@ static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(AF12),
 	ASPEED_PINCTRL_PIN(AF14),
 	ASPEED_PINCTRL_PIN(AF15),
+	ASPEED_PINCTRL_PIN(AF22),
+	ASPEED_PINCTRL_PIN(AF23),
 	ASPEED_PINCTRL_PIN(AF24),
 	ASPEED_PINCTRL_PIN(AF25),
 	ASPEED_PINCTRL_PIN(AF7),
@@ -1855,6 +1879,8 @@ static const struct aspeed_pin_group aspeed_g6_groups[] = {
 	ASPEED_PINCTRL_GROUP(I2C7),
 	ASPEED_PINCTRL_GROUP(I2C8),
 	ASPEED_PINCTRL_GROUP(I2C9),
+	ASPEED_PINCTRL_GROUP(I3C1),
+	ASPEED_PINCTRL_GROUP(I3C2),
 	ASPEED_PINCTRL_GROUP(I3C3),
 	ASPEED_PINCTRL_GROUP(I3C4),
 	ASPEED_PINCTRL_GROUP(I3C5),
@@ -2087,6 +2113,8 @@ static const struct aspeed_pin_function aspeed_g6_functions[] = {
 	ASPEED_PINCTRL_FUNC(I2C7),
 	ASPEED_PINCTRL_FUNC(I2C8),
 	ASPEED_PINCTRL_FUNC(I2C9),
+	ASPEED_PINCTRL_FUNC(I3C1),
+	ASPEED_PINCTRL_FUNC(I3C2),
 	ASPEED_PINCTRL_FUNC(I3C3),
 	ASPEED_PINCTRL_FUNC(I3C4),
 	ASPEED_PINCTRL_FUNC(I3C5),
-- 
2.20.1

