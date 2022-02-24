Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10A264C2855
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Feb 2022 10:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232840AbiBXJnZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Feb 2022 04:43:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232839AbiBXJnY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Feb 2022 04:43:24 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6853A27DF1F
        for <linux-gpio@vger.kernel.org>; Thu, 24 Feb 2022 01:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1645695774; x=1677231774;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KXxfnsxQFIgyXErpGtiY7KH71rfyFFJ7BOtUpwzHCJc=;
  b=Bsb+8ocuC66P7okFTdfhYBvr2PobzTYP16jA1aQCSMjwky9ApE1g3v+b
   wpLueUsP8XvoWPLbpGaHt0fZTny7YA5mBAErMeZBd+4AXIgQbAsfNbsos
   HNvRiE1fo1otlMFObdyqVfglP6L5qV4qXLcX21nYauMFnAyY82FS924KS
   4ZL+lhenpD2j060JyBB8+ycigAV7BSvf9S7QHt6WtGKZADXFei0uO6InT
   ZZFTWVoLDnTvzk56fJD1mUTdnUQtTB40IXa7jn/2vknPmNHILKkF237Yw
   ZqDoaMB6wkSgG1s3RON3odVYrUe6Ag6A8CEhGb1ky7vEogNWGvPFBm5UD
   g==;
X-IronPort-AV: E=Sophos;i="5.88,393,1635199200"; 
   d="scan'208";a="22288062"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 24 Feb 2022 10:42:52 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 24 Feb 2022 10:42:52 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 24 Feb 2022 10:42:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1645695772; x=1677231772;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KXxfnsxQFIgyXErpGtiY7KH71rfyFFJ7BOtUpwzHCJc=;
  b=Xz9yzHbuKaMF5QbnyAYf+XSIARRKXgrkeIKcnm6YxEn7M4A5yXm65kkP
   SrBXVr2z6ui5i8gOgdo4sZF2QEDkfYfR8mGJ3Q8mWGirA7+WWWhpWwiDA
   szJ+S/BC6maIY/lGXnttsKGcG3SThlTd1KVFymWiUaUv5aL3xNnrOZdzB
   E/dKIVPKa+NxnfTmkydL3tO6XA0uSgmfuWZl9WvwCtnjhqoh9GEZKNkIc
   2ghBuvumAJsy0gv58Y1utVceedRYjFsRAq/UIo/R8ddJVfvnz2H1bEDNs
   7Ccsogimikb0sIxXMMcUGmfv6RIKwLiny21i3n6KIAuak0JjGPxFJ4d2/
   A==;
X-IronPort-AV: E=Sophos;i="5.88,393,1635199200"; 
   d="scan'208";a="22288061"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Feb 2022 10:42:52 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 893E3280074;
        Thu, 24 Feb 2022 10:42:51 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 1/1] pinctrl: imx: Reduce printk message level for empty nodes
Date:   Thu, 24 Feb 2022 10:42:43 +0100
Message-Id: <20220224094243.1376965-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

iomuxc_snvs from imx6ull supports 2 boot mode and 10 tamper pins.
Probably most users won't use them, causing this error message during boot:
  no groups defined in /soc/bus@2200000/iomuxc-snvs@2290000
This is actually not an error in this case, so reduce the level
accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
This issue was raised during release test: Why is there an error if
nothing is wrong?
Memory only devices are enabled by default, which I agree, but this
causes the mentioned error message unconditionally, unless some muxing is
configured. I would argue that even a warning is not correct either,
nothing is wrong here.

 drivers/pinctrl/freescale/pinctrl-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index fa3cc0b80ede..3a7d2de10b13 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -661,7 +661,7 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 	func->name = np->name;
 	func->num_group_names = of_get_child_count(np);
 	if (func->num_group_names == 0) {
-		dev_err(ipctl->dev, "no groups defined in %pOF\n", np);
+		dev_info(ipctl->dev, "no groups defined in %pOF\n", np);
 		return -EINVAL;
 	}
 
-- 
2.25.1

