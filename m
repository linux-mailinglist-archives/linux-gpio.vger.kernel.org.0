Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66764262E34
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 13:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgIILvH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 07:51:07 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:34497 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729953AbgIILnt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 07:43:49 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id BE898814;
        Wed,  9 Sep 2020 07:43:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 09 Sep 2020 07:43:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=LcSEf2owcJHCj
        Pa16Zg09G2i2DUcxJkRqFzecAp/HtA=; b=bZ6AbRD7u66dko5cTz3cpWVpzed9w
        q6uumoWgfaNL43r9tYEKf7oL5mQGAE4nuWIW8GqP0Mp44uIdcZD69B0HkU6EqK55
        kBrzB0YNHNQxFH7QdeeFO0OWBExzesHRDBvinTr63Cw5LZxnJDdI4pgnIOXt7ZiO
        5O1MYu3oHwigU2rILT+IIErLqZ4ENCxC/QxaYar/OK8FW0qbwv9FMXZ1uVNnPuLl
        5D0vWT8BhaDxpZl1Xgg5qm0Bq+tjBdtR7nZKb9pPvIp8IoKMsPszAAXSqyF49sf2
        TiicuHQQSU6ONvU3P4wNu4iDQdOHBqzBOZ2VEzddCPPJPKnTmKa19rNJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=LcSEf2owcJHCjPa16Zg09G2i2DUcxJkRqFzecAp/HtA=; b=EXv2/wL+
        jTUD01yoC/djmvaabRGRZnLTOm2QlHzPoxahe5va0saui1v08s7D5/emBYyR/fc4
        iC9B5eZykQMAAdeoTQ/QwGG48nbrzt25DiCFzfdfpN7gOTYYjfDUxPL/IQPuQKML
        7IDbZ0g/MNQOK9dCFhK9O/2h6CQ62nSF5pSo/dZh8OMC5WVc2T+ROBnSQbO5mViY
        ZOVWus9SjkXc68/eZ8OjB9cZJQF4punfMvHlCt+dN9DkDmtpVMOqxTKct5vnpB3Q
        2fvxXy4bsyLIAxAUdsAhE8MTw5ZqIPZD9QRy5Sj50FLFf5i0ErNx4uKGjiHxl9KM
        uEBHsJTsd3TMIQ==
X-ME-Sender: <xms:4b9YXz8lSYKNgUBLxa6eCdp9mqTneq5uXQ-eis1nzbAiqAmdOtnZ3Q>
    <xme:4b9YX_uRpXAX0DdE4ZHDN1wa_BnSXLvMcKklegrEnxnW3H8gFxkE2wLCanr-kjN5x
    eQ-MWEcSZxi6IcLxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehhedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
    etjeffleffvdduudevieffgeetleevhfetnecukfhppedugedrvddruddtledrkeehnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
    ifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:4b9YXxACa-y3zhQ5FEIbVuI00gMTRVss4w4yUsT5gGreecWvvKxMNg>
    <xmx:4b9YX_esDdlOKPLkMDKygvQPYjXZFdGNyWONNBT4rG-riWtJNnCc4Q>
    <xmx:4b9YX4NTMJaAL5dHRCFuG__KT2Ois28Enqf5h2_aLTwCX_BV9GC-Mg>
    <xmx:4b9YX308xn8AVqfutDB0HjFF7xvr031lQFuwJF3HKufu11Rd0Mh-hQ>
Received: from localhost.localdomain (ppp14-2-109-85.adl-apt-pir-bras32.tpg.internode.on.net [14.2.109.85])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9B53B3065B97;
        Wed,  9 Sep 2020 07:43:26 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, joel@jms.id.au,
        johnny_huang@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] pinctrl: aspeed: Use the right pinconf mask
Date:   Wed,  9 Sep 2020 21:13:11 +0930
Message-Id: <20200909114312.2863675-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200909114312.2863675-1-andrew@aj.id.au>
References: <20200909114312.2863675-1-andrew@aj.id.au>
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
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index d8972911d505..e03ee78b2434 100644
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

