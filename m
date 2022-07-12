Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4D28571908
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Jul 2022 13:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232883AbiGLLxJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jul 2022 07:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232756AbiGLLwz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jul 2022 07:52:55 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13BEFB38C7
        for <linux-gpio@vger.kernel.org>; Tue, 12 Jul 2022 04:52:13 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2804:14c:485:4b69:755f:8694:ae3:d33f])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: festevam@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3B5078411C;
        Tue, 12 Jul 2022 13:52:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1657626725;
        bh=Mn5brWp0mjNGUL1TxJF2mki0kPB5NopXQXYy8CC2D+I=;
        h=From:To:Cc:Subject:Date:From;
        b=BtaeQVfzKedjFmsyLyC+qrUcQAT+sVkhwQgLxZS2yQAfimPbIWw9ypqgvyZmQ0GuN
         WrhAoWoI4lzvDxZYXYSNNzPhN9q3WKHpSGXdBhpAYKlpp7B5/mKn3nG8nVh3k4vtlY
         Hi1DeVZaaHbwuB9ypxUgMr+r2QLV/P5uP+IJfVx9GNe8rEl0c8aM2ECGzzfz4mEU3n
         PJUzMFJm9SJ8jIEjJM4NHaBn2+aLYuW2qEa0lCQE+72GCypmDfp4OhFIeRcmH7o5ik
         eTUu6IFwdfl9CzMC403RFK9/IeJ9a/xPhbPVkUUviyrTJZpI9bqujXNRVGc7T+AIvP
         VaWKBtXUWjnOw==
From:   Fabio Estevam <festevam@denx.de>
To:     linus.walleij@linaro.org
Cc:     ping.bai@nxp.com, linux-gpio@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH] pinctrl: imx93: Add MODULE_DEVICE_TABLE()
Date:   Tue, 12 Jul 2022 08:51:54 -0300
Message-Id: <20220712115154.2348971-1-festevam@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pass MODULE_DEVICE_TABLE() so that module autoloading can work.

This also aligns with the other i.MX8 pinctrl drivers.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/pinctrl/freescale/pinctrl-imx93.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx93.c b/drivers/pinctrl/freescale/pinctrl-imx93.c
index 417e41b37a6f..91b3ee1e6fa9 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx93.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx93.c
@@ -247,6 +247,7 @@ static const struct of_device_id imx93_pinctrl_of_match[] = {
 	{ .compatible = "fsl,imx93-iomuxc", },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, imx93_pinctrl_of_match);
 
 static int imx93_pinctrl_probe(struct platform_device *pdev)
 {
-- 
2.25.1

