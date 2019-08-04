Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A08980B72
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Aug 2019 17:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbfHDP2C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Aug 2019 11:28:02 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39926 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbfHDP2C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Aug 2019 11:28:02 -0400
Received: by mail-pf1-f195.google.com with SMTP id f17so34338952pfn.6
        for <linux-gpio@vger.kernel.org>; Sun, 04 Aug 2019 08:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WU4+Mx9NuRe6kxb4DDqRUrN8Np9FC132eMPZeIsHCBg=;
        b=FARbGjsMpQI67Or8LjUBa8EbGPyWfomxfYMxgXirmIqktacPDhJbUb194gmLHx6ykv
         o5/Y6b0AXUhNiWVZWGZj1P8qYxhFCDh/+PHe3L1O09RE/SD+BQH8rISA33GjWCNwJKKe
         wptZCIjOG+qwNzUz5kBg3yzG0qVWi5U9APrLgkafWDSBgJoLhbxv43BVvVEUXq2sRAnv
         u7bDcT/ZeJ4DduoesFzI+7Dik/maqlaf8Kl8wKdyG7Vi5TmtQS3DmVvbCXLKZj5vDA2M
         mrPmvrhZvdEvLhF8sqtfzXI30DFhiaqEmU3EGHyUxdrn309/8rOZ/a0czgv1yGbc734z
         wK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WU4+Mx9NuRe6kxb4DDqRUrN8Np9FC132eMPZeIsHCBg=;
        b=TBc3K1GmkNnO5bVOBvyi+cU12ljiTuMOu2C1ZBEMm0omN8YyGTJiOZ1JWxRp652l6E
         Xs+dwCJbNBEEuuYdbn0QitzNIHJy/Ul2GHYLTDa5tnKn3SlktkRukA601j8umfvQVfQR
         v0TLRN/qbs1DpUMh3A6gumm35BBEfDnqtphxnB2Tc4ST9m7uTkrQPOMEB4qbffXtazyv
         fEjR4uV3nCYa1qz50AIbDUH0+7UIzaNCqXwQgq2pKav+nTxzut3X/22CZ+Nx6XoGVBiC
         4CGjTKPNWULPd3y8MXF+eoa1Xx8e0nOxJ0xRhgS5ljghgXOF1Ztt3bQkKuxVP/jB/pJ8
         151A==
X-Gm-Message-State: APjAAAUYQfPFN1ye1vC8ftsIMKX31ATnHgmJYoLH8z606DwSjVsk/03g
        HoS+VKGLBkoFNQCZXHUCrqQ=
X-Google-Smtp-Source: APXvYqxRa6v6p8Kkw+UQm8JL+xbmoSDF8rVsUZ0y+BX5r7WynTWWRiVmaSMVXuctQlUwzJPRR/utLw==
X-Received: by 2002:a17:90a:8a91:: with SMTP id x17mr13990663pjn.95.1564932482018;
        Sun, 04 Aug 2019 08:28:02 -0700 (PDT)
Received: from localhost.localdomain ([122.163.105.8])
        by smtp.gmail.com with ESMTPSA id b136sm107537471pfb.73.2019.08.04.08.27.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 08:28:01 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] pinctrl: falcon: Add of_node_put() before return
Date:   Sun,  4 Aug 2019 20:57:45 +0530
Message-Id: <20190804152745.2231-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Each iteration of for_each_compatible_node puts the previous node, but in
the case of a return from the middle of the loop, there is no put, thus
causing a memory leak. Hence add an of_node_put before the return in two
places.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/pinctrl/pinctrl-falcon.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-falcon.c b/drivers/pinctrl/pinctrl-falcon.c
index ef133a82e612..2257803f6f34 100644
--- a/drivers/pinctrl/pinctrl-falcon.c
+++ b/drivers/pinctrl/pinctrl-falcon.c
@@ -455,12 +455,15 @@ static int pinctrl_falcon_probe(struct platform_device *pdev)
 		falcon_info.clk[*bank] = clk_get(&ppdev->dev, NULL);
 		if (IS_ERR(falcon_info.clk[*bank])) {
 			dev_err(&ppdev->dev, "failed to get clock\n");
+			of_node_put(np)
 			return PTR_ERR(falcon_info.clk[*bank]);
 		}
 		falcon_info.membase[*bank] = devm_ioremap_resource(&pdev->dev,
 								   &res);
-		if (IS_ERR(falcon_info.membase[*bank]))
+		if (IS_ERR(falcon_info.membase[*bank])) {
+			of_node_put(np);
 			return PTR_ERR(falcon_info.membase[*bank]);
+		}
 
 		avail = pad_r32(falcon_info.membase[*bank],
 					LTQ_PADC_AVAIL);
-- 
2.19.1

