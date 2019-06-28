Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA70E59151
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 04:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbfF1Cji (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jun 2019 22:39:38 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:51419 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726748AbfF1Cjh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 Jun 2019 22:39:37 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 074DF2DE9;
        Thu, 27 Jun 2019 22:39:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 27 Jun 2019 22:39:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=dkailpDyj7vUI
        txB8Vs9sL40BUOIyxRITgSOEfzO07k=; b=JSrUAZ8lW608Xlb0i4jxGz5M0lCm6
        hL3hy88SEw8o3eHtB42JUfTUOOJfQQurqCeN/B2wV2hOUofHMRrdGXkND6UBUDSs
        NUUGtpMwYtuBiQa9jRT1VvdAabNU2unU2bMxObJUOpYOnHM3KXL3xi4sz5+V4Klb
        XYsKHf9ZAvH42k1S3KcoLSI44HaDFUsxMo3oXsfw/DiV7NtYA0+7REe6LVL7P2Ya
        rYpYYARf6joLvi71TdUyNUN1IRVfTHG7JLKSUFWgt3po65+17zVCCh7haS/4Qc2G
        4C2dYcV1EyY6Z/k0e+7ziX4hhftFPdMQWxSZlt5SXtGaWpWa5iwjT+0Mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=dkailpDyj7vUItxB8Vs9sL40BUOIyxRITgSOEfzO07k=; b=nhPowcNo
        yBqX1mv2xtH4kEyeJXoNbiL4OwHRGKlKefjuMTSd+JUy1jGKtah6ramJOjBDKaQB
        s8qxgJOSnyE7DIPO5EMKutnUfa3SaQlCqZkZHdLMh7+fDMzU7Wbt4leT0pApxPJO
        Ucgl0C/lF5+lpuMx9q1d7qJnSMaC0FE3d1yJXljAfnmdLJ5Ib8bVAsUuaEPnkPYm
        cSy+3TkHkwLQ6K11PH5hwhVAENULTPzKgGt/d7PmjhfoNGpyUCj9HSFeHwpWRGeO
        Q9dDRAgvshC/akiT6AxitkgyChhy30dOUW2Gc5OfQ661gkAjVaYv6J233KVd2KnU
        zmCD4II2U9sd2A==
X-ME-Sender: <xms:6H0VXQqJ6glKWOVBBKDwGN1xIFb-aPx1esmLo-Pcwb01sd5pf7fz4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudelgdeiudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughrvgif
    ucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhppedvtddvrd
    ekuddrudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdr
    ihgurdgruhenucevlhhushhtvghrufhiiigvpedv
X-ME-Proxy: <xmx:6H0VXY5ZAfAOBaWzGw6NJ8MEYE9-tZTB3lkJFLX1gS1x0R1HwGWAOw>
    <xmx:6H0VXXeRNAVbiXnpwDwYBmKf7IkoDHFdQuizoywqeETG8gFJMDq_uA>
    <xmx:6H0VXd5Hdkx54YTCoiecEXw3xlxVSael4fdUF20lQg-tW3fqABb9IA>
    <xmx:6H0VXX7j7mtJMBAOZA6IE_9AhNUN5wxC1L4JOiKvHxFJEoBkQxoScw>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
        by mail.messagingengine.com (Postfix) with ESMTPA id C946D380074;
        Thu, 27 Jun 2019 22:39:32 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     ryan_chen@aspeedtech.com, Andrew Jeffery <andrew@aj.id.au>,
        linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        joel@jms.id.au, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Johnny Huang <johnny_huang@aspeedtech.com>
Subject: [PATCH v2 5/8] pinctrl: aspeed: Correct comment that is no longer true
Date:   Fri, 28 Jun 2019 12:08:35 +0930
Message-Id: <20190628023838.15426-6-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628023838.15426-1-andrew@aj.id.au>
References: <20190628023838.15426-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We have handled the GFX register case for quite some time now.

Cc: Johnny Huang <johnny_huang@aspeedtech.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Acked-by: Joel Stanley <joel@jms.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
index 4b06ddbc6aec..c5918c4a087c 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
@@ -240,8 +240,7 @@
  * opposed to naming them e.g. PINMUX_CTRL_[0-9]). Further, signal expressions
  * reference registers beyond those dedicated to pinmux, such as the system
  * reset control and MAC clock configuration registers. The AST2500 goes a step
- * further and references registers in the graphics IP block, but that isn't
- * handled yet.
+ * further and references registers in the graphics IP block.
  */
 #define SCU2C           0x2C /* Misc. Control Register */
 #define SCU3C           0x3C /* System Reset Control/Status Register */
-- 
2.20.1

