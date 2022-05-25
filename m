Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3405343F6
	for <lists+linux-gpio@lfdr.de>; Wed, 25 May 2022 21:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238463AbiEYTKe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 May 2022 15:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344399AbiEYTJ6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 May 2022 15:09:58 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA5B14001
        for <linux-gpio@vger.kernel.org>; Wed, 25 May 2022 12:08:07 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id br17so25177945lfb.2
        for <linux-gpio@vger.kernel.org>; Wed, 25 May 2022 12:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KU9+qwhHB1Ar5tyxTZPIqMZrcyxNkwuy0eiQFgt4/6o=;
        b=bAluZQ2GRhXKyS4fhjaoe9noG35MJw0O7C1jBNwDmVpe7bwhwvhHAtH9e108qV3tXp
         YoH4v/NOwfj7GpdBpOhqQmYlHY2le4VIAT2P1A/+iRelQRvtb5Z0LpVty4SNAoW5mDam
         9IS9MBHN2jiy6Dlyh6jPNrscTMUk/H0S+xbQnAfLwV908dm4VFJJBnbkgLhDEW1tYc3Q
         dohxBDXqj7xXlrlVg1a+e/aQVX9wZcE7IBcJbOdF7GycEbj55TNy1srlwtauEzQ/GWqO
         rDycNreKCKmj98UUwnS6IjdT5HBf/kIEeSlqboVWsWMDQWdKimhAdL31wi8CtKmCVSz0
         9dyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KU9+qwhHB1Ar5tyxTZPIqMZrcyxNkwuy0eiQFgt4/6o=;
        b=12Gfk9ulOJ/n5bC5Vo2mDQQ3Tjnz+bXI5Nflp49kafCrcHUTSuidyJ02InPxz/lC/T
         XGkThJOyrso3PfEhaybh78D/kNtUicu8C4CmPLRBRGOyja4lQsOHu8Et3M+hHPq0Kc/k
         qgrMrUjhXD4hNyKG+mrxpckiyWDDwGNfCMD0vOCmYcW/yb+wT2ZKwkf4jVgRaBNEYYSS
         Dz7yEPKHhIhJuvwctjp9b3i+utSr3c+qbqZBbuKtCNw5CvmMSE7nTDhNHtLTyOwbvhFU
         n12nBtv9XxQgvBzuZ14sh3fQwUDynYvAfjHm7sBLx7wxbPMysulaD1wpFrHDqDLnneIr
         oeMQ==
X-Gm-Message-State: AOAM53109oCJrY99zIZDYl8EJY2kdH0QyE8yc1IuTPhSxIaOJ60/WI2Q
        vaAWpJ3zGRuSl9JUxB9/Ec4=
X-Google-Smtp-Source: ABdhPJw6EjIkKOzP9HxhzTYGrvznFY1KvX5eYDo6K7ZL7L2sldypEM757VkkM+G3pOcsSphhpx9nVw==
X-Received: by 2002:a05:6512:b07:b0:473:c26a:7095 with SMTP id w7-20020a0565120b0700b00473c26a7095mr24299905lfu.603.1653505683994;
        Wed, 25 May 2022 12:08:03 -0700 (PDT)
Received: from localhost.localdomain (ppp78-37-196-203.pppoe.avangarddsl.ru. [78.37.196.203])
        by smtp.gmail.com with ESMTPSA id t26-20020ac243ba000000b0047255d211a0sm3248144lfl.207.2022.05.25.12.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 12:08:03 -0700 (PDT)
From:   Andrei Lalaev <andrey.lalaev@gmail.com>
To:     linus.walleij@linaro.org, wens@csie.org, jernej.skrabec@gmail.com,
        samuel@sholland.org, linux-gpio@vger.kernel.org
Cc:     linux-sunxi@lists.linux.dev,
        Andrei Lalaev <andrey.lalaev@gmail.com>
Subject: [PATCH] pinctrl: sunxi: sunxi_pconf_set: use correct offset
Date:   Wed, 25 May 2022 22:04:25 +0300
Message-Id: <20220525190423.410609-1-andrey.lalaev@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some Allwinner SoCs have 2 pinctrls (PIO and R_PIO).
Previous implementation used absolute pin numbering and it was incorrect
for R_PIO pinctrl.
It's necessary to take into account the base pin number.

Fixes: 90be64e27621 ("pinctrl: sunxi: implement pin_config_set")
Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index d9327d7d56ee..dd928402af99 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -544,6 +544,8 @@ static int sunxi_pconf_set(struct pinctrl_dev *pctldev, unsigned pin,
 	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 	int i;
 
+	pin -= pctl->desc->pin_base;
+
 	for (i = 0; i < num_configs; i++) {
 		enum pin_config_param param;
 		unsigned long flags;
-- 
2.25.1

