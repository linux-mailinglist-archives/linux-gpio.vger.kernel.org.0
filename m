Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D89B947D8B7
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Dec 2021 22:28:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238650AbhLVV2a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Dec 2021 16:28:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238633AbhLVV23 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Dec 2021 16:28:29 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC87EC061574
        for <linux-gpio@vger.kernel.org>; Wed, 22 Dec 2021 13:28:28 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id b19so5784983ljr.12
        for <linux-gpio@vger.kernel.org>; Wed, 22 Dec 2021 13:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dGdI8QtbU0WUh2YDCEexSXRgsm3VPR2+FtVmusVlaPI=;
        b=Ht+0/oGmG81OCKPiuE70yuoqRTiWE+qP2jT3xtAukrKMvmmDf3Dy4nx951o47PUY+g
         0Z4FqywqsuM7enl6EXVFLpBbGwoiI+F+cboci9VBj6Oh5xITWXdJVHWVgTF6+Vblv6XZ
         QGd2xHilpdEUjLdliI4qppnnWP5FM2O68N72EohczeqCmPklO73d1WXff5Tw+myD5x6A
         50ol/GoPGRHVIgHdN9uzw79SGru1hA3V83yIfvt4RZwRRgln0uMz+/6NBb7JBClXwrXv
         GpytFkRJmwoQk2K6ptkoDVRSw19XTWSE6c2lf8eXemLcbDVQUedIPlXkPFQr7hFkVZh5
         ztNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dGdI8QtbU0WUh2YDCEexSXRgsm3VPR2+FtVmusVlaPI=;
        b=Ac0Y6O/MNCjv+xy0MqcTgQFWHt/TrFDUNJBOYGDufImZkrfEsCeSkZfzobObnpkYm/
         LZPjyGcYRYZHq7ETuX/DH7ZTVBet6XdyDg00Vw+rVjx72a1obqTqcLAquTHzMGegTlPV
         izRX6Su+DjJ325sSBYFiQPxJSBbZDgg1aCk90qLbeUZlVJ4oeNOba0/ULmI5hJ5W8vT7
         ahjmsJqtKTsB/w1N/O6GFys4CgI0h6dbO4ody3pGhZXEfwOEEOEew9ImgS1+hznOXcdG
         b+f2DyOltl72wrLB0aPGcb59oVoYjef8PJd6PLnMWpa0ZrXpe/2yqQiCWarUQpZi0RZH
         izPA==
X-Gm-Message-State: AOAM531u77sxueZla9kHvKPPfQlnPH17ApLAx0NqqLevBTa88cfNgB14
        bN9LkUvqNZW2pdHc2fDWfK8=
X-Google-Smtp-Source: ABdhPJzpYuCe/stuodM78DJuGM4howH7gd3A1SP8vswfiw8F7MmUg+dsql+AdjdtlHfvD1oLlWKJZQ==
X-Received: by 2002:a2e:2e0e:: with SMTP id u14mr3284766lju.28.1640208506647;
        Wed, 22 Dec 2021 13:28:26 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id f1sm318758lfg.89.2021.12.22.13.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 13:28:26 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
        Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH] pinctrl: imx: fix allocation result check
Date:   Wed, 22 Dec 2021 22:28:07 +0100
Message-Id: <20211222212807.27122-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

Fix code to check correct variable value.

Reported-by: Abel Vesa <abel.vesa@nxp.com>
Fixes: 02f117134952 ("pinctrl: imx: prepare for making "group_names" in "function_desc" const")
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
Linus: I'm not sure if you can rebase your tree. Treat it as separated
patch or fixup. Depending on how to manage your repository.
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 47b2ab1a14d0..16bc1bfc03e4 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -667,7 +667,7 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 
 	group_names = devm_kcalloc(ipctl->dev, func->num_group_names,
 				   sizeof(char *), GFP_KERNEL);
-	if (!func->group_names)
+	if (!group_names)
 		return -ENOMEM;
 	for_each_child_of_node(np, child)
 		group_names[i] = child->name;
-- 
2.31.1

