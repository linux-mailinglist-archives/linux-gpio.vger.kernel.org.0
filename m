Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2055631F
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 09:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfFZHVO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 03:21:14 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:47393 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725954AbfFZHVN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 Jun 2019 03:21:13 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id BE8CD1BF1;
        Wed, 26 Jun 2019 03:16:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 26 Jun 2019 03:16:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=sPAC0J8p45pKU
        IB1y6CiuAxrWpJQyOXW/mBGynYgVGo=; b=jS6RELUF8TCzRMu17+SPj9n1b41sJ
        QokyV+t3NTZ9ClJmuKx0pjL6cqJKTvWbOhO0Be25AzkZD1lEGSuBTTWEHRWl5nDE
        9L40m6+fuh2t845SBkcQKcAmMWvmfnZfoRsclfkSWKxQ+uo6BMJHDXbJpvAb8jRC
        +8RKoyzAb4habhgwt3RpnFFtfzwaRpsoo2GcqajxPTWHwj3CL0LWAvm3HJVqPle4
        qNAXNyiZM824YBWjT8fEa6cOXVdT/kL6r2VMLJlTLfb0VUUtW3DsaSdHekg1uOLN
        jQ09zwZ0sEcQWezJYR060JUOwFWG/DQYbSp4aqXI8+4wJ5emRfuGJXyPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=sPAC0J8p45pKUIB1y6CiuAxrWpJQyOXW/mBGynYgVGo=; b=t8TMror0
        MPgbGjfekJoOyYvbaClZHHC+SIb9IkdsMw18NjLOyETWY3gG2syVjyoOTvh/lB0A
        OEaCm8T8/3MlbMWXcUS6BwY3rld8XbTUWLl0YncyKp6UzwDzN2AhyyL5V7CbeqNK
        BtjQUt+2EBI22iP+WIXqJfoJGMyHB5YECfJsP9/iqnIV55EPaADqDkRABJLq/tMa
        NHTE3zfcpKP7GWJr7vyGwXyblezTigqlcT+g2augAB2zeWqk0mCmSHDhzaWfmdRW
        m99Bs1CpaoL2Py/Bdz4em9WtrOSOtvvjyfVLivY8Rk53nW09D7FQ3/zcs30SSXYL
        2IJv5XG/Cu4ORA==
X-ME-Sender: <xms:thsTXQ2yBSqrxwI-NsK3aKv1468aASSeUtDEw9ixOnP1eDRa8h8ueA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehgdduudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecukfhppedvtddvrdekuddrudekrdeftdenucfrrghrrghmpehmrg
    hilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigv
    peef
X-ME-Proxy: <xmx:thsTXRifKna8wrjp_t4AM3Es96LpdH4g3QMUIWKEl09Q4ivtlaEudA>
    <xmx:thsTXWYBRN_MJihtVW-SptsH7ZaMl_L8e_nXmj2LpeyvUxBhQFTQmw>
    <xmx:thsTXSNK-GUf8JpuCej_RHncPuEQ_EqwIKBkGkU5ODAg0pEjy-xwuQ>
    <xmx:thsTXQ-BUGlDhmOd80plI751UFHPNUERccd8wFF590q7ighhN_BkOQ>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
        by mail.messagingengine.com (Postfix) with ESMTPA id DED11380083;
        Wed, 26 Jun 2019 03:16:02 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     ryan_chen@aspeedtech.com, Andrew Jeffery <andrew@aj.id.au>,
        linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        joel@jms.id.au, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] pinctrl: aspeed: Clarify comment about strapping W1C
Date:   Wed, 26 Jun 2019 16:44:28 +0930
Message-Id: <20190626071430.28556-7-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626071430.28556-1-andrew@aj.id.au>
References: <20190626071430.28556-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Writes of 1 to SCU7C clear set bits in SCU70, the hardware strapping
register. The information was correct if you squinted while reading, but
hopefully switching the order of the registers as listed conveys it
better.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 4c775b8ffdc4..b510bb475851 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -209,7 +209,7 @@ static int aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
 		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP2)
 			continue;
 
-		/* On AST2500, Set bits in SCU7C are cleared from SCU70 */
+		/* On AST2500, Set bits in SCU70 are cleared from SCU7C */
 		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP1) {
 			unsigned int rev_id;
 
-- 
2.20.1

