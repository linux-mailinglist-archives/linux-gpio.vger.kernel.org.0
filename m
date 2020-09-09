Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE86F262E30
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 13:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728971AbgIILu7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 07:50:59 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:34581 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729942AbgIILnt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 07:43:49 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 7B9A7B1D;
        Wed,  9 Sep 2020 07:43:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 09 Sep 2020 07:43:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=3TprZpZYiej8Q
        BnZ1/atazNQk9ZaL0CMY1DZDwMLWxE=; b=mMBwDrXf5DtkgEfztV5cAi7Gbs3cE
        BdnyRQf42pdYbinZmTh9oAosGlA6/1x6Z6fgGN9ZUAFppL4/0WlERBDNcq3ipUKJ
        HSrsvPCqwQSUzgYT1D5mSRRRslYhUaI70qOHFabFyBrv+KzClQTNwoRcRIpUGtnV
        ckxMZmUL9tCnQ43FbRLcvofnyzbXrQLs1Bw961kUFOZno88ZUGoGqHxBY37ZzQfn
        3+SNvXoAj3zSQ4FGaJe8zpKCMLF9EalgvcY+dVSpyy3bf2/bTAzov/AjKffXBIKp
        7CTFQ7jt4C1Mu60MU78uVVqpyn1y52REf1u61JqvaztxDQgYnQ+jua2RA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=3TprZpZYiej8QBnZ1/atazNQk9ZaL0CMY1DZDwMLWxE=; b=g9QJGl0e
        q7rfVaWTycqmqLuqOc8LRwiIfeQdi0zeObit9gL2e+hOOgBBKJ0fidBmTD1qR/ys
        3TpeD+r84jisjflcTWF1kDTrrlYQ2PID0ijL87nVlIlrraHGDBVSBYOnnKCMBHyn
        eYe2VO9obddLQnLdV+iosjMFDRHPOa3MgtKyRA6vymgBI7k6pCIqrvpHKDo2puSz
        ul3gny53838HSzfo8T6rTTVY/bJN8+edloxznYnI92XLoQRzFgQmIUzgHIfo/izN
        PD7Jk3SbMU/63HeZLTRlmxy8u4i+SXpQq9SnJ5Gvl0xqdEOnwQ7J62Sb71fn7+uU
        LeOZ3C9HsEp2vQ==
X-ME-Sender: <xms:3r9YX6UbZzA1osqut4kmG61598Uo1gJ8XqWjMCWlZ1W0frslsm6FOQ>
    <xme:3r9YX2kfzxhWzI-w7qFtrHwgokeb0dv7C-JSrE0OpH-11NiEdUcSyPyZDKuF4J7r3
    Fwzjy2wLqDWdrH7TA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehhedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
    etjeffleffvdduudevieffgeetleevhfetnecukfhppedugedrvddruddtledrkeehnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
    ifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:3r9YX-YNlaBTyWRrAkx31f3krTHCqZyjDFyTjboqrgP3uv92s41-eA>
    <xmx:3r9YXxX73tJZVokSz0AKRluvmMWT-RwitorpOMq5tlpHOssa9217sw>
    <xmx:3r9YX0mKJQhBc__tuVw2ip_MyiXG_ecWqGoLTNSvaWDAmqIlK1cfFQ>
    <xmx:3r9YXzuQ3gbBOKLg6inJTNG_5M8ZcvkEowjJcjzvx6LSvTs6ddAE0Q>
Received: from localhost.localdomain (ppp14-2-109-85.adl-apt-pir-bras32.tpg.internode.on.net [14.2.109.85])
        by mail.messagingengine.com (Postfix) with ESMTPA id 53ABD3065C1E;
        Wed,  9 Sep 2020 07:43:23 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, joel@jms.id.au,
        johnny_huang@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] pinctrl: aspeed: Format pinconf debug consistent with pinmux
Date:   Wed,  9 Sep 2020 21:13:10 +0930
Message-Id: <20200909114312.2863675-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200909114312.2863675-1-andrew@aj.id.au>
References: <20200909114312.2863675-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When displaying which pinconf register and field is being touched, format the
field mask so that it's consistent with the way the pinmux portion
formats the mask.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 53f3f8aec695..d8972911d505 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -539,9 +539,9 @@ int aspeed_pin_config_set(struct pinctrl_dev *pctldev, unsigned int offset,
 		if (rc < 0)
 			return rc;
 
-		pr_debug("%s: Set SCU%02X[%lu]=%d for param %d(=%d) on pin %d\n",
-				__func__, pconf->reg, __ffs(pconf->mask),
-				pmap->val, param, arg, offset);
+		pr_debug("%s: Set SCU%02X[0x%08X]=%d for param %d(=%d) on pin %d\n",
+				__func__, pconf->reg, pconf->mask,
+				val, param, arg, offset);
 	}
 
 	return 0;
-- 
2.25.1

