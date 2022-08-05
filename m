Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F44458AACE
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Aug 2022 14:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240645AbiHEMWa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Aug 2022 08:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240695AbiHEMW0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Aug 2022 08:22:26 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CE51D6C
        for <linux-gpio@vger.kernel.org>; Fri,  5 Aug 2022 05:22:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E37A1B828AF
        for <linux-gpio@vger.kernel.org>; Fri,  5 Aug 2022 12:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E635C43141;
        Fri,  5 Aug 2022 12:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659702142;
        bh=vn2WUAHXHsGKqG8gx4eiUN1YZXYE9u0alZ+b+BqHmrc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CtQeO32aRLqO9+w82Hnf5qznoVF09qVAciLzX/GGJDxgfG9TVmcDn1/v30nv1x1YE
         kbEpDumT9M5EXHS+ntYBZQy34mwVUzHWV3MqT2/rPtOHyWC2L8pd62k8RF8+jOtmoQ
         ooaccg9kjd5uw2dRM8d1tGp7eUxmcrFBKOIBXHoVRvc8v++jESTngKpIxhEECtzXkh
         lAma4bbHOHUfmwmLkgUfj51n+3VTal1XnBN9U8GNHP6A7V5/JhTUE/12ndRsxRmqZf
         Cy0JSPnzceXTi6/0OSEV59MUFvN+iBfsJE+/XEClbDedgrjg+hk/A0BM7P0Od2p3Vv
         pedOodH1X/edA==
Received: by pali.im (Postfix)
        id CE15E96D; Fri,  5 Aug 2022 14:22:19 +0200 (CEST)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2 3/4] pinctrl: armada-37xx: Checks for errors in gpio_request_enable callback
Date:   Fri,  5 Aug 2022 14:22:01 +0200
Message-Id: <20220805122202.23174-3-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220805122202.23174-1-pali@kernel.org>
References: <20220805122202.23174-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Now when all MPP pins are properly defined and every MPP pin has GPIO
function, always checks for errors in armada_37xx_gpio_request_enable()
function when calling armada_37xx_pmx_set_by_name(). Function
armada_37xx_pmx_set_by_name() should not return "not supported" error
anymore for any GPIO pin when requesting GPIO mode.

Fixes: 87466ccd9401 ("pinctrl: armada-37xx: Add pin controller support for Armada 37xx")
Signed-off-by: Pali Rohár <pali@kernel.org>
---
Changes in v2:
* add missing int ret;
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index e5e5f0ea0e77..3227f70922fc 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -500,11 +500,15 @@ static int armada_37xx_gpio_request_enable(struct pinctrl_dev *pctldev,
 	struct armada_37xx_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 	struct armada_37xx_pin_group *group;
 	int grp = 0;
+	int ret;
 
 	dev_dbg(info->dev, "requesting gpio %d\n", offset);
 
-	while ((group = armada_37xx_find_next_grp_by_pin(info, offset, &grp)))
-		armada_37xx_pmx_set_by_name(pctldev, "gpio", group);
+	while ((group = armada_37xx_find_next_grp_by_pin(info, offset, &grp))) {
+		ret = armada_37xx_pmx_set_by_name(pctldev, "gpio", group);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.20.1

