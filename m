Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD915632C
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 09:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbfFZHVf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 03:21:35 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:50413 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726942AbfFZHVP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 Jun 2019 03:21:15 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 9F1741C43;
        Wed, 26 Jun 2019 03:16:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 26 Jun 2019 03:16:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=pMNNPoQe+cIMw
        sr4Ftl9UjYzpm9TC5xQDxPLRq/8iWw=; b=EII53qjcSoRmTCoxy6HJ8mpMYyOdU
        Ux/7cDyNYEm7mZnHJ3VEFKB67RbgNZRo/xNnkSQCm7IWRvxbwUZyS026w/ohyfFK
        CWhTZjp23bJrFk/H2dNeb1dSUM+3DRlQjT2kQxkSXk6UUsqtpDxsXCv3MlALK7Oa
        hdN+z/8jjWHjElnqCZwkKUujlYaSJWRvCPTWJWKHmXuc0cjqD0JvsksurGyPzSbA
        q1WS2siaCVCqyRyiBij5qpxR0//LrIr0JhojWYdZ38xYGBhpbtxentTCylya1/ui
        7m3Dxam45kt1Ryx6ATFBvwJI9wI86svlEKn+XmU0A1Jon0IJtiqg3Nwew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=pMNNPoQe+cIMwsr4Ftl9UjYzpm9TC5xQDxPLRq/8iWw=; b=OqGgN44J
        wdcFVvWoTKGnXcMHxXvp4ZmIlKzc7FrtD7LhPxkqdQJr/XZZXQZJ2IcuaLQ3vvA1
        h3+0o0G0FTRKOrNq1dKJJ56dbyeFXJpJoaD0sKtmZ7jhCHreMQLQmMGZH0yGKFFM
        uM0J48B0VnbQREVESjMjPhFFfs38VUQsUdwfewHszd4k9P0SrouBOHyibjXEcfHf
        qOAVmyJ9srnUTrcoA9kseww2nnrkJ/nm7qr+BysMpCTdLMNKgLpkL2Pk2jPAQviH
        LmjwKlcJBkT4BqcffjHV044iyATmar5nuscQ7PgNBLaKeeBTn6DgmG6rHQ+CkAho
        dBtU1wFQW/CKRQ==
X-ME-Sender: <xms:shsTXWjurTNokRIg06YfKTJu7OmYb1r62pzxrj4TmgQ2TQytzMTVfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehgdduudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecukfhppedvtddvrdekuddrudekrdeftdenucfrrghrrghmpehmrg
    hilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigv
    pedu
X-ME-Proxy: <xmx:shsTXbTnRN7c9pqULVlUcbujM_08ygLDhgGNxQ773PkLXquA4EgEYQ>
    <xmx:shsTXZFMHf9STnAX_TBspcp3o86TJ1LHHun_00MhaLlXEuOojaqdmg>
    <xmx:shsTXTnp7lSNMxhXTZMJ_5eMR3DqRWwJLweIRiSmBCYpKQTPRQCuCw>
    <xmx:shsTXWwSG7xu4OG-kOhNcWrvJBIc-agPSgp0X-h1AhtIMpJ5tlzlFw>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
        by mail.messagingengine.com (Postfix) with ESMTPA id B8DCA380083;
        Wed, 26 Jun 2019 03:15:58 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     ryan_chen@aspeedtech.com, Andrew Jeffery <andrew@aj.id.au>,
        linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        joel@jms.id.au, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] pinctrl: aspeed: Correct comment that is no longer true
Date:   Wed, 26 Jun 2019 16:44:27 +0930
Message-Id: <20190626071430.28556-6-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626071430.28556-1-andrew@aj.id.au>
References: <20190626071430.28556-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We have handled the GFX register case for quite some time now.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
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

