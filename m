Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7628CF1FA
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2019 06:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729790AbfJHEvd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Oct 2019 00:51:33 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:36403 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729686AbfJHEvc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Oct 2019 00:51:32 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id B47C25A48;
        Tue,  8 Oct 2019 00:41:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 08 Oct 2019 00:41:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=ax8qcZm5J10I8
        ZqNRzWuYcCjYIxStOA2LR/uq7PYupM=; b=gyS4nkCr9Aj2SXWt3U7s3s70q95MR
        +GXnEFWqz3+e2Wen6veC4E+REJ/L34v+UCMMPiKgmoZEgFwtr2EqPiGBTT6vHnyk
        yy5bNiPdsm3jbHuSJy0NdjAZn5XTdD2qB+WrBNBfBbCXLoDQxppYMF0Oq4Rh9v4S
        oDpiATWs6kWpnYyYW6u+xZdbKIP19CX0cIEmfsUV9iG+j1MggQSfES5isLGnGHRf
        5rAn5/I+WQKHojWMpZeoiZFUMUyV+Xg/wWu7A0NKn6BVzbL3yIdPPh3xdcUbxLQo
        Y+N1EpPEgz63cqAA5fhn1/ldzMX83m4qwPOb5CiKM1rc0ZkR+3HrhDKdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=ax8qcZm5J10I8ZqNRzWuYcCjYIxStOA2LR/uq7PYupM=; b=byvdso2y
        UMVSaY0snt3ucRV3C0N2c12ysBCWp+rH9dDrXol5f98F1Hkof6PCCRbZuKbFGjWi
        II6pV+Lrj7yUE5nIahlEHm6MxccbHtcymUna3oUs4k3dI3xIoB+pFtbgFWSiTExk
        BGPTSh1dS8OCIzzcbDMNMFzoBnMjvvvpPpf5PrmUgtDafvgeJ6G9GGi/uOiXmQ1E
        2W468xBAaW+3L9nTpeCaflDHU+FL8uQSkxjvtRKl1vfRZCkx5grc5hq6s3XdN8wA
        yOHMJegSMz549KoWO4oQzopT+A3jC8t+CnFx5OWwkMr5q8GiL6PKGdFe3TnhD9po
        aY4GMT4TVz6+SQ==
X-ME-Sender: <xms:fxOcXeG4gQ6Uzx_FTOqqFcJDqtovhk4IgEG6HFnWcDg-7JW1l5aWIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheekgdekgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughrvgif
    ucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhppedvtddvrd
    ekuddrudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdr
    ihgurdgruhenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:fxOcXWQtDmv2sCA9B6EmsY0r1Kvr-WlHeCLzRha2Llh_vxnUgfKReQ>
    <xmx:fxOcXdRHyKOKC8fbsQGj1skpKpVwNbhpWAaiAN7jn25ggFH1hrFV4g>
    <xmx:fxOcXcebV3HCadTVz2DNNFDv70osmmxjIAgqVDR6vH6Ml7aAligIPg>
    <xmx:fxOcXa_Crtl6ynhEsZ72H9Fw0rTvspXdudGpq_wjyzerlk8sVSqLyA>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
        by mail.messagingengine.com (Postfix) with ESMTPA id EF0C980064;
        Tue,  8 Oct 2019 00:41:31 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     Johnny Huang <johnny_huang@aspeedtech.com>,
        linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        joel@jms.id.au, linux-aspeed@lists.ozlabs.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, ryanchen.aspeed@gmail.com
Subject: [PATCH 4/7] pinctrl: aspeed-g6: Fix I3C3/I3C4 pinmux configuration
Date:   Tue,  8 Oct 2019 15:11:50 +1030
Message-Id: <20191008044153.12734-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008044153.12734-1-andrew@aj.id.au>
References: <20191008044153.12734-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Johnny Huang <johnny_huang@aspeedtech.com>

The documentation to configure I3C3/FSI1 and I3C4/FSI2 was initially
unclear.

Fixes: 58dc52ad00a0 ("pinctrl: aspeed: Add AST2600 pinmux support")
Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
[AJ: Tweak commit message, resolve rebase conflicts]
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 24 ++++++++--------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 9079655cc818..68b066594461 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -1513,18 +1513,14 @@ FUNC_GROUP_DECL(VB, Y1, Y2, Y3, Y4);
  * following 4 pins
  */
 #define AF25 244
-SIG_EXPR_LIST_DECL_SEMG(AF25, I3C3SCL, I3C3, I3C3, SIG_DESC_SET(SCU438, 20),
-			SIG_DESC_SET(SCU4D8, 20));
-SIG_EXPR_LIST_DECL_SESG(AF25, FSI1CLK, FSI1, SIG_DESC_CLEAR(SCU438, 20),
-			SIG_DESC_SET(SCU4D8, 20));
+SIG_EXPR_LIST_DECL_SEMG(AF25, I3C3SCL, I3C3, I3C3, SIG_DESC_SET(SCU438, 20));
+SIG_EXPR_LIST_DECL_SESG(AF25, FSI1CLK, FSI1, SIG_DESC_SET(SCU4D8, 20));
 PIN_DECL_(AF25, SIG_EXPR_LIST_PTR(AF25, I3C3SCL),
 	  SIG_EXPR_LIST_PTR(AF25, FSI1CLK));
 
 #define AE26 245
-SIG_EXPR_LIST_DECL_SEMG(AE26, I3C3SDA, I3C3, I3C3, SIG_DESC_SET(SCU438, 21),
-			SIG_DESC_SET(SCU4D8, 21));
-SIG_EXPR_LIST_DECL_SESG(AE26, FSI1DATA, FSI1, SIG_DESC_CLEAR(SCU438, 21),
-			SIG_DESC_SET(SCU4D8, 21));
+SIG_EXPR_LIST_DECL_SEMG(AE26, I3C3SDA, I3C3, I3C3, SIG_DESC_SET(SCU438, 21));
+SIG_EXPR_LIST_DECL_SESG(AE26, FSI1DATA, FSI1, SIG_DESC_SET(SCU4D8, 21));
 PIN_DECL_(AE26, SIG_EXPR_LIST_PTR(AE26, I3C3SDA),
 	  SIG_EXPR_LIST_PTR(AE26, FSI1DATA));
 
@@ -1533,18 +1529,14 @@ FUNC_DECL_2(I3C3, HVI3C3, I3C3);
 FUNC_GROUP_DECL(FSI1, AF25, AE26);
 
 #define AE25 246
-SIG_EXPR_LIST_DECL_SEMG(AE25, I3C4SCL, I3C4, I3C4, SIG_DESC_SET(SCU438, 22),
-			SIG_DESC_SET(SCU4D8, 22));
-SIG_EXPR_LIST_DECL_SESG(AE25, FSI2CLK, FSI2, SIG_DESC_CLEAR(SCU438, 22),
-			SIG_DESC_SET(SCU4D8, 22));
+SIG_EXPR_LIST_DECL_SEMG(AE25, I3C4SCL, I3C4, I3C4, SIG_DESC_SET(SCU438, 22));
+SIG_EXPR_LIST_DECL_SESG(AE25, FSI2CLK, FSI2, SIG_DESC_SET(SCU4D8, 22));
 PIN_DECL_(AE25, SIG_EXPR_LIST_PTR(AE25, I3C4SCL),
 	  SIG_EXPR_LIST_PTR(AE25, FSI2CLK));
 
 #define AF24 247
-SIG_EXPR_LIST_DECL_SEMG(AF24, I3C4SDA, I3C4, I3C4, SIG_DESC_SET(SCU438, 23),
-			SIG_DESC_SET(SCU4D8, 23));
-SIG_EXPR_LIST_DECL_SESG(AF24, FSI2DATA, FSI2, SIG_DESC_CLEAR(SCU438, 23),
-			SIG_DESC_SET(SCU4D8, 23));
+SIG_EXPR_LIST_DECL_SEMG(AF24, I3C4SDA, I3C4, I3C4, SIG_DESC_SET(SCU438, 23));
+SIG_EXPR_LIST_DECL_SESG(AF24, FSI2DATA, FSI2, SIG_DESC_SET(SCU4D8, 23));
 PIN_DECL_(AF24, SIG_EXPR_LIST_PTR(AF24, I3C4SDA),
 	  SIG_EXPR_LIST_PTR(AF24, FSI2DATA));
 
-- 
2.20.1

