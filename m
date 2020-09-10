Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7846E263B1D
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Sep 2020 04:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730145AbgIJC6p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 22:58:45 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:40851 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728971AbgIJC5l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 22:57:41 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id CA09C5C0158;
        Wed,  9 Sep 2020 22:57:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 09 Sep 2020 22:57:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=YE2vRbVOU5d4u
        pRUylPGxyphDiisOKAQ6iHDzsqNpKA=; b=lvkLvV+6VfcOhVE157CML9zlZ9bsA
        PhaVE+chAIdJKaOVJCYjxpErC098nDzZMGxe8rNMd36tmemPVjeLJPgWxFVSwvnC
        jnJ9t+ngrlQxiXiM96Xyq8zcSiqodq6spk96teH+aWTKoh6PFkfBzJ0Im313C0vX
        8iz1sssKUKh4cajzVMhAarkf8u3f2ADHFCXY/6ryfrMcGkJ6dKQxtTRKtfaChWwn
        aG5M1EcUV4bjCW7jgQ40R9zhjROoaOb+2d7G7Ap6RhcdHd1W1My288QUqeMnFIvd
        JrufPkBlQ/7i72pwQx69lqGpDzd/rjjJUIyxCLQmnYQW0pCBEByuaAYaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=YE2vRbVOU5d4upRUylPGxyphDiisOKAQ6iHDzsqNpKA=; b=rNCmrSB0
        h3BhRsnE/n2kDKakTNpcx4ooTgWDXtQUi8sHLjsjUvNaLaBDB3iQYpqXvB9b1r5v
        LLIJlTJ/u1wCKgxu7nDsFjGIAoQcGOBhpVF5lVBVQtrn1FSiod51ytPa3yK6SiEK
        kPkQ7R9FY0maLtwhKaNRPcF6mk86XJoSgDQwYf9Xkdsy6ynVirCo/8hItBD1xJWG
        LbhxbwthY/B9ahaibe6Gndf2sx60vYkNxUsluMDoOQKPaohl6BQzPlcTUoxDV2IM
        fhw7D9RWH97arNgrUB0Z5Lvy1rAcHpYCuEj/CrxGZps33yyWph0yUbENRH8A75LO
        hKPkf0u6CkPbGQ==
X-ME-Sender: <xms:GZZZX7i8X6Ez6uBkqYBCQHvUmbz1_lGXc-R6CyfXl68vTX2TaCFC1A>
    <xme:GZZZX4DG5ooYdXGJ98UynOmW0AXJ9MKQ7jji05zfWTfKszDt3TSIPnginyIxttntI
    Qula18JWM_eymckrw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehiedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
    etjeffleffvdduudevieffgeetleevhfetnecukfhppedugedrvddruddtledrkeehnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
    ifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:GZZZX7Hc-W8yrJ8pXreuoONHOGtfNKYuFZwbF5ZPSBwlvd78IMNeKQ>
    <xmx:GZZZX4RpuV-Vyy5OM5WMIlYb3UT7ouqC57B4om3ud2t5XsHsqY4DSQ>
    <xmx:GZZZX4xJslCWETXF9cQsKjChJkNWitGFNovyUpv5shUVdOZlcHfR9w>
    <xmx:GZZZX3rjr-ZXzySYiS8AwnArvp7SK5aKj1HRS5tvyY7aWpvUVT1SgQ>
Received: from mistburn.lan (ppp14-2-109-85.adl-apt-pir-bras32.tpg.internode.on.net [14.2.109.85])
        by mail.messagingengine.com (Postfix) with ESMTPA id CDFF13069096;
        Wed,  9 Sep 2020 22:57:26 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, joel@jms.id.au,
        johnny_huang@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] pinctrl: aspeed: Use the right pinconf mask
Date:   Thu, 10 Sep 2020 12:26:30 +0930
Message-Id: <20200910025631.2996342-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910025631.2996342-1-andrew@aj.id.au>
References: <20200910025631.2996342-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Aspeed pinconf data structures are split into 'conf' and 'map'
types, where the 'conf' struct defines which register and bitfield to
manipulate, while the 'map' struct defines what value to write to
the register and bitfield.

Both structs have a mask member, and the wrong mask was being used to
tell the regmap which bits to update.

A todo is to look at whether we can remove the mask from the 'map'
struct.

Cc: Johnny Huang <johnny_huang@aspeedtech.com>
Fixes: 5f52c853847f ("pinctrl: aspeed: Use masks to describe pinconf bitfields")
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 2e0260c1a57c..6a94eaecf638 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -534,7 +534,7 @@ int aspeed_pin_config_set(struct pinctrl_dev *pctldev, unsigned int offset,
 		val = pmap->val << __ffs(pconf->mask);
 
 		rc = regmap_update_bits(pdata->scu, pconf->reg,
-					pmap->mask, val);
+					pconf->mask, val);
 
 		if (rc < 0)
 			return rc;
-- 
2.25.1

