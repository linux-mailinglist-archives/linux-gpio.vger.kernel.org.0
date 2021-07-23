Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE653D35D8
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 09:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234372AbhGWHS5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 03:18:57 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:40317 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234350AbhGWHSz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Jul 2021 03:18:55 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 1EAE1581648;
        Fri, 23 Jul 2021 03:59:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 23 Jul 2021 03:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=FL7d3DKD/w/mD
        2Cy6ISU7AvGUnJr6NtK3PC+jbi7Vek=; b=JSZnIxLpHBR3Njwf2tb7V9IoNe/HJ
        jylTJnK1aspzSiYLtzIXiWXN0emgYGI7xozW+Xobmzh0k+s08qPx3qT9G/m6XNNM
        M3ExHWI34mojpdfjTqDgMHXrUHFtcvklGzx2hYcjy2vjCjLtXlCvrjHNlR+bb2iy
        zsNftFoEgxWr9dW2wbs9CWwHErsfz563TCpqBUPJH1TJdy8HM05B8o/3aTpFplmx
        ozGxM50nYeZ/XlEnyhYqcVwFNcBSjD5tV+Yk2wI0vLy0lbsIXml0MbQzqkdKcwkM
        wtMaZcNzUP1UR1AjcXAyEP9yqMd90265R8QimGMDhKNLeJCBk/MrmtwoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=FL7d3DKD/w/mD2Cy6ISU7AvGUnJr6NtK3PC+jbi7Vek=; b=EeTsDFpJ
        AHLazN3xvoV6v35U9PMiextcf+3Jrm7k51n6N/W6EdwQoCOdjRvAZttJGCow4/SA
        9vtMd0JULQzphfOkUNBCYpIcPyLIjcFplJvE4TXYLU/ADy2PJkVAt4yNa2p3tTqy
        Tlr/jmVdSIG8iZ1BbxxKdU1anCBrQYQyneIE6NmAX9BGuITYMzEFTBlVg0KTmf5y
        q0G6s4akqYkmP6KA9FOxCyyaoVoWuCstE2jAUvQlDdbCEPsTATEDutKn4LpLjz3W
        c4cyDeIdm4vS8CelnRSCOuagPTGQooqA2f4d8M41Idyp7Rp8zKlhxsT1/Bl/0jmK
        5bberMT3Bc6cZQ==
X-ME-Sender: <xms:4Hb6YEVdM6piquGt5Q6Ee6U0l4JiHVTShf_TFjK4ihAt4AF-OK6iPg>
    <xme:4Hb6YInQPLe19jkBnz1RloDT4bRIW-aG5mIc5Bvuc_PvNJxcreqBtCXhkI2ImAQgS
    scf-QTnr4rBImlqpA>
X-ME-Received: <xmr:4Hb6YIY47Ksx5e8NCSP9J54FohptXMT-ie_JMb4MGQDKP37S2KT-lvPQoAY3dWqs9sPR0YOq2YJaNdiJaLhGvPnz2yz7po-dafA4xyglCUz5t6hEPSTVBVksxvLwt7hcvGaepg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeejgdduvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
    etjeffleffvdduudevieffgeetleevhfetnecuvehluhhsthgvrhfuihiivgepudenucfr
    rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:4Hb6YDXhxwIZv9hQeoKLOmhqwIPcYj389UpJQspeyJ5iAaVr2hMUKA>
    <xmx:4Hb6YOlFkJJzAZSfIoo800VTgv3Ro8SnvgP8zkuFYtf2U2iUtMBilg>
    <xmx:4Hb6YIe27wchFW2sDHbQo3E0gVrXDqH0utiv6zOwdms-aqeJCxnV0Q>
    <xmx:4Hb6YDi5m00nPkURVXoqVhl7PUCQhJ-QRvJApJMBg9EQzrhpDpBeuQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Jul 2021 03:59:23 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     clg@kaod.org, robh+dt@kernel.org, joel@jms.id.au, pavel@ucw.cz,
        linus.walleij@linaro.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/6] pinctrl: Add hook for device-specific map parsing
Date:   Fri, 23 Jul 2021 17:28:54 +0930
Message-Id: <20210723075858.376378-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210723075858.376378-1-andrew@aj.id.au>
References: <20210723075858.376378-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The devicetree binding for the PCA955x LED/GPIO expanders was not
written with pinctrl in mind. To maintain compatibility with existing
devicetrees while implementing pinctrl support for the PCA955x devices,
add the ability to parse a custom device node layout to pinctrl.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/core.c          | 6 +++++-
 include/linux/pinctrl/pinctrl.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 9c788f0e2844..e4862552eb9b 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1063,7 +1063,11 @@ static struct pinctrl *create_pinctrl(struct device *dev,
 	INIT_LIST_HEAD(&p->states);
 	INIT_LIST_HEAD(&p->dt_maps);
 
-	ret = pinctrl_dt_to_map(p, pctldev);
+	if (pctldev && pctldev->desc->pctlops->dt_dev_to_map) {
+		ret = pctldev->desc->pctlops->dt_dev_to_map(pctldev, dev);
+	} else {
+		ret = pinctrl_dt_to_map(p, pctldev);
+	}
 	if (ret < 0) {
 		kfree(p);
 		return ERR_PTR(ret);
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 1ceebc499cc4..2eeec0af61fe 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -95,6 +95,7 @@ struct pinctrl_ops {
 			       unsigned *num_pins);
 	void (*pin_dbg_show) (struct pinctrl_dev *pctldev, struct seq_file *s,
 			  unsigned offset);
+	int (*dt_dev_to_map) (struct pinctrl_dev *pctldev, struct device *dev);
 	int (*dt_node_to_map) (struct pinctrl_dev *pctldev,
 			       struct device_node *np_config,
 			       struct pinctrl_map **map, unsigned *num_maps);
-- 
2.30.2

