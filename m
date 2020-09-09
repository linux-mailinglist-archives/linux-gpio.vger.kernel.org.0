Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFD03262E23
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 13:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729865AbgIILq6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 07:46:58 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:59649 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729961AbgIILnt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 07:43:49 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 05B323E1;
        Wed,  9 Sep 2020 07:43:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 09 Sep 2020 07:43:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=GCzCURw+lR65K
        PqnjNXh/NlBPjWyz8UlafaQL4XINLY=; b=OF8tbqD4f0GClrrWGfCPTbIoyDlnw
        6JGReCQJIe5qcOB78zEm1YOe11ZkqneJdxoJUOqPU54l9TL36i2qw93c3P1KrzQI
        suEcnjLgSdG83xrR5n+Deo0hQiZzWGIQP8bKLb5DR5Q9a8LLehvm8GKQa3MlGgZr
        r/uoBVwwaQHMVSfPQ0WYyqggRkaNMfiaWLlqmFrMrAsvQTrnu8WD6E5UhG/vFdeP
        LJg9x1osgs1K41SvGelZ/25zo3nIok33rZv+ukebR6aPDBvsbIXeRA7hw7kFVeMY
        Ro7MG2pggPS9QX9FZnhDrL2GSeDtQ3hkIeQCtz/gh44MrKJ7zsZSRT1LQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=GCzCURw+lR65KPqnjNXh/NlBPjWyz8UlafaQL4XINLY=; b=IMJxS1uo
        feFxBE8oixjnRqrWd2z+BhKUpx6j3PpQ++Dc0/qvQTKWW9Ss+9vJWOlC/CoeeFZv
        UnKZLyoTNDTcG45iqu6CGzKBEjaNQzdp8xYV9D0u9hCfX1sjEdkzmOZxY2LuQg8p
        3uwGGfjOukxYyzUbCP8X4fi0mexGGS0x/0ScRh9KnjDavOEhL4o+w0tG0229Urfz
        Fp3a5LPNIlDYUdRzyh0gqvdiZl3jk0ZVV0FLCMNUTbxAnTGvtULryCZgU0kh39Nq
        fWGNi5WMznwZfuGmbboMofxiwjM4Avs8golN3Zb0xKY84gV4XWjJvyWWeKgV4+3N
        8NPwCUASWTf2jg==
X-ME-Sender: <xms:5L9YX3WUrAvVj0Rul-AkTbYNemC5tz-A0bKy5rkETV7xJyBhtFcldg>
    <xme:5L9YX_lvrp88qzPHjgcqNo9ZXfaQaBmXRk_2I1PRKGD3f5lZMJ-Skz9UVzHNDO14v
    yZZgjLjpi9QBYb3-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehhedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
    etjeffleffvdduudevieffgeetleevhfetnecukfhppedugedrvddruddtledrkeehnecu
    vehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
    ifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:5L9YXza7y9TOj4mQJ9YQTCk_vBfR3f30lESn2ycIUKLVKjwLbL2Z5Q>
    <xmx:5L9YXyWmnFO0H4RkO8ojQRPZJTP7fe_JKBmI4qI62tyDb7Iu3FoqGg>
    <xmx:5L9YXxnAV9N2dw-kE1yY7xjxzed9QT33PxxRMnym6QYCSKhp5KDQmA>
    <xmx:5L9YX0tOqbFbsu8eAlxDyR2jPnYpRGw6othriM9WpTl9CP-tIBVLUw>
Received: from localhost.localdomain (ppp14-2-109-85.adl-apt-pir-bras32.tpg.internode.on.net [14.2.109.85])
        by mail.messagingengine.com (Postfix) with ESMTPA id CCCC63065C20;
        Wed,  9 Sep 2020 07:43:29 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, joel@jms.id.au,
        johnny_huang@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] pinctrl: aspeed-g6: Add bias controls for 1.8V GPIO banks
Date:   Wed,  9 Sep 2020 21:13:12 +0930
Message-Id: <20200909114312.2863675-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200909114312.2863675-1-andrew@aj.id.au>
References: <20200909114312.2863675-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These were skipped in the original patches adding pinconf support for
the AST2600.

Cc: Johnny Huang <johnny_huang@aspeedtech.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 7efe6dbe4398..34803a6c7664 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -19,6 +19,7 @@
 
 #define SCU400		0x400 /* Multi-function Pin Control #1  */
 #define SCU404		0x404 /* Multi-function Pin Control #2  */
+#define SCU40C		0x40C /* Multi-function Pin Control #3  */
 #define SCU410		0x410 /* Multi-function Pin Control #4  */
 #define SCU414		0x414 /* Multi-function Pin Control #5  */
 #define SCU418		0x418 /* Multi-function Pin Control #6  */
@@ -2591,6 +2592,22 @@ static struct aspeed_pin_config aspeed_g6_configs[] = {
 	/* MAC4 */
 	{ PIN_CONFIG_POWER_SOURCE,   { F24, B24 }, SCU458, BIT_MASK(5)},
 	{ PIN_CONFIG_DRIVE_STRENGTH, { F24, B24 }, SCU458, GENMASK(3, 2)},
+
+	/* GPIO18E */
+	ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_PULL_DOWN, Y1, Y4, SCU40C, 4),
+	ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_DISABLE,   Y1, Y4, SCU40C, 4),
+	/* GPIO18D */
+	ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_PULL_DOWN, AB4, AC5, SCU40C, 3),
+	ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_DISABLE,   AB4, AC5, SCU40C, 3),
+	/* GPIO18C */
+	ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_PULL_DOWN, E4, E1, SCU40C, 2),
+	ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_DISABLE,   E4, E1, SCU40C, 2),
+	/* GPIO18B */
+	ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_PULL_DOWN, B2, D3, SCU40C, 1),
+	ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_DISABLE,   B2, D3, SCU40C, 1),
+	/* GPIO18A */
+	ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_PULL_DOWN, C6, A2, SCU40C, 0),
+	ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_DISABLE,   C6, A2, SCU40C, 0),
 };
 
 /**
-- 
2.25.1

