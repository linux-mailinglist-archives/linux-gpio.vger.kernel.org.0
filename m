Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7DD1412DFB
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Sep 2021 06:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbhIUElf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Sep 2021 00:41:35 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:60749 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229988AbhIUEle (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Sep 2021 00:41:34 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.west.internal (Postfix) with ESMTP id BC2DB2B01433;
        Tue, 21 Sep 2021 00:40:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 21 Sep 2021 00:40:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=UMFOw7vbwhDOl
        T/6/dntbRu7oRn9RKWKLkg+EamTaYY=; b=R0T9Pb5SZ+4yxZc07SWcc2cgpW4Ei
        GjRBNl5luMuLSwhYzK0M6b4O289/LCQp1YHlC1W2v3LQddoi8xObda/Y2niNBp5V
        49NjstgoULPBXBGG4raqp7ZGi0WOLB1QinMIJjco4FEPiQF23tX8AYBU4uHqbJ+V
        Y7OOMrRJybrTUutdYNN/Eha1NPKA3wCLg1S3Va8/7VPH8lv9rjrZpIZILWWAyGyq
        deFa4Sfrt0hUTPR7xAX9m7Oi+wWq8j1wzQHa1sHU+byowM/jhZbmkjx9/Ix94rmt
        joVqLmpMmure/uZsOj4Iinzxj9oWVG0iajwAwh7GblgnhjowH+QI43mXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=UMFOw7vbwhDOlT/6/dntbRu7oRn9RKWKLkg+EamTaYY=; b=cP6M/PE0
        +9ReKlONMlBaU4X07LBpC8imUWgWAK9IG8zLrxXudSrHJyk45CWJJlIC6GSTheja
        ILwrsx2fV+f2rYMMOyHJ/9iXEA/eCs1AA8ENhiktkJJOTtY8E913vz0FPJr4lOl/
        3doxcADRUGKCz5fSN6pmRs0NKFdHEYKkeT6vCEqZzIhhR6xRprclTwjyc2+fgq6k
        FulVx6ZayP7FhtrjdAdAL+swUjsFq9ok9fLko7cXdRO5brAGvPuDb9c1eFuvg/HQ
        0NuaOs8FZwZtDRDDln1CWHFlh44+zdDWe5C1YMIDFx33lFm4IkvIBPFM5cbln/n9
        k1+IDCcCYiervw==
X-ME-Sender: <xms:JGJJYb_Kwwv4eSON9kMtZgL4XlO-k9KVjFA_GBxA6jJ01IpFYnmH8A>
    <xme:JGJJYXsJj7z-thxhTufz1LOe7G4gqyNLBLpOlvOVa3dlVTpq6FKsfcxWfysznQq6y
    Z61OWF52fJiVH92Wg>
X-ME-Received: <xmr:JGJJYZDjLyqMOsUmLsVP-bZxEwfwyqCiOUgn_vPs0C2tlEw-F1EMtOrlHC6wohm4R1qxsmtqtr15XD4WEdX2Ba-2G0ojaEGW0-sVbajYiwWqd9_Mi405OPIWCU4n8GKu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeifedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
    etjeffleffvdduudevieffgeetleevhfetnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:JGJJYXeweurpS3bg_med2GjX-hkOd-RGQsVJNTqGMedrftvykvTqqg>
    <xmx:JGJJYQPRvyyFL5x-W5q3xP66PldTCvNzinPdpqwjbXtybc0BK96Gng>
    <xmx:JGJJYZlMHy0zp36jc4j0EfiL5s4e_GTiTlg7dWVrymXEF0rJmFgYig>
    <xmx:JWJJYRGqGEJw5XxS3fK35STFU730lNNhdDrCFz2M23SRYMA6N5UKk0Q-e2A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Sep 2021 00:40:00 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     clg@kaod.org, robh+dt@kernel.org, joel@jms.id.au, pavel@ucw.cz,
        linus.walleij@linaro.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        andy.shevchenko@gmail.com
Subject: [PATCH 2/2] leds: pca955x: Allow zero LEDs to be specified
Date:   Tue, 21 Sep 2021 14:09:36 +0930
Message-Id: <20210921043936.468001-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210921043936.468001-1-andrew@aj.id.au>
References: <20210921043936.468001-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It's valid to use the PCA955x devices just for GPIOs and not for LEDs.
In this case, as PCA955X_TYPE_GPIO is now equivalent to
PCA955X_TYPE_NONE, remove the test for whether we have any child nodes
specified in the devicetree.

A consequence of this is it's now possible to bind the driver to a
PCA955x device when dynamically instantiated through the I2C subsystem's
`new_device` interface.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/leds/leds-pca955x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 77c0f461ab95..81aaf21212d7 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -429,7 +429,7 @@ pca955x_get_pdata(struct i2c_client *client, struct pca955x_chipdef *chip)
 	int count;
 
 	count = device_get_child_node_count(&client->dev);
-	if (!count || count > chip->bits)
+	if (count > chip->bits)
 		return ERR_PTR(-ENODEV);
 
 	pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
-- 
2.30.2

