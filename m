Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18466263B18
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Sep 2020 04:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729865AbgIJC6I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 22:58:08 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:53671 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729781AbgIJC5l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 22:57:41 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 6AA4B5C018A;
        Wed,  9 Sep 2020 22:57:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 09 Sep 2020 22:57:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=dgZLZNVKsJXTQ
        b5CVCCPBkn89T6dD0JdMbFAfUWYzyY=; b=WoIbRmFoNgdsdl4Mx/dKhsrX8fQdS
        5miTRILtAsDgU+86pbvuVn99pQa66NsX0cOeKEsP1CJ+TwmJ7qmp9i2h1TT2ajp1
        /Xq1CyBoomewt68M0JJZCrGv/OyIVr3CI9dSK4KrVygyG00UhaBJkoo8eLOkRtZw
        EswdDTh1JPSIkDl//b3eCma02Fwm7mAwYfmKGZn/TyPfwPrTrzhylMCmPb2mDaQ4
        2cARlPm9W93KSVdbzk2PUW+opLTiUQ+6VL0iWArwERwHONSui+R3covCnicAUulJ
        FV8pnTTTtG6NG8nfpyy+fv6L8xkK8jkJEUz8oS29AhSdf5+yGq/PBQeFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=dgZLZNVKsJXTQb5CVCCPBkn89T6dD0JdMbFAfUWYzyY=; b=K68zuYHJ
        84yqXRLUJjdIMoeHPa4hAY1pR5D+a51AK892C0TVSh5AKL688xsT4KU8Zn5YZrad
        ybALuOPdY9nkKUFQSh+HgVF13UowfrftPkXlmHvqiNgyx+9pDi9n0J5XnVvQGYtp
        xwrOm3f2cVsH9RNbTFTKSbogwtd3OTeXasD0yqYhQS16iyX+bIyeJdwF8YS55v4x
        fOGRU9lODchc6iSHty+GJmYrhHdAiH48m8BiFUM1kcN4kdrI7kPQHd01zKt7jRjM
        +r8dY3RMlhiIpMwTRKNOTIJMWHHC2bQv1KGyb0Lhgcbt+9hp+cTT5nAiPkrQByC1
        GEXKuWU2wYHmnQ==
X-ME-Sender: <xms:FpZZX1rZKnLMD2yOxgoq18zx66FnueqaS9l4Bg2UEjVIYM1LAazjlQ>
    <xme:FpZZX3qDc87_wkxEKaQ7amVIQx2rY95oDO3pl57M-A73k1lLow84FKeORYPTEVIRz
    xBL6fva6pxXd7sU9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehiedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
    etjeffleffvdduudevieffgeetleevhfetnecukfhppedugedrvddruddtledrkeehnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
    ifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:FpZZXyPvJqemn-zh8-IqqWxERskZo5ydrte-71jQdcoKNm6v9gUm2Q>
    <xmx:FpZZXw6wlDnwrshsblZdhFeAa9MJ0HTwjwDY3mN5WDa0xp_XCkAb8w>
    <xmx:FpZZX05Op8dnssekPDZFc1ok3JtpmZF1c8FtGnAeJa5lmnbdHzjhFw>
    <xmx:FpZZX-SDKGHQACWRyPBai7B3eP00EnOGcoI6aBZjdW20-VtNlPkRyg>
Received: from mistburn.lan (ppp14-2-109-85.adl-apt-pir-bras32.tpg.internode.on.net [14.2.109.85])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2A6643068C6A;
        Wed,  9 Sep 2020 22:57:22 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, joel@jms.id.au,
        johnny_huang@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] pinctrl: aspeed: Format pinconf debug consistent with pinmux
Date:   Thu, 10 Sep 2020 12:26:29 +0930
Message-Id: <20200910025631.2996342-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910025631.2996342-1-andrew@aj.id.au>
References: <20200910025631.2996342-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When displaying which pinconf register and field is being touched,
format the field mask so that it's consistent with the way the pinmux
portion formats the mask.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
In v2: Format val with %X as suggested by Joel
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 53f3f8aec695..2e0260c1a57c 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -539,9 +539,9 @@ int aspeed_pin_config_set(struct pinctrl_dev *pctldev, unsigned int offset,
 		if (rc < 0)
 			return rc;
 
-		pr_debug("%s: Set SCU%02X[%lu]=%d for param %d(=%d) on pin %d\n",
-				__func__, pconf->reg, __ffs(pconf->mask),
-				pmap->val, param, arg, offset);
+		pr_debug("%s: Set SCU%02X[0x%08X]=0x%X for param %d(=%d) on pin %d\n",
+				__func__, pconf->reg, pconf->mask,
+				val, param, arg, offset);
 	}
 
 	return 0;
-- 
2.25.1

