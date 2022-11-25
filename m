Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF6776387B0
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Nov 2022 11:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbiKYKko (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Nov 2022 05:40:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbiKYKko (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Nov 2022 05:40:44 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13AFE3F04A
        for <linux-gpio@vger.kernel.org>; Fri, 25 Nov 2022 02:40:43 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id h5so478712ljk.11
        for <linux-gpio@vger.kernel.org>; Fri, 25 Nov 2022 02:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SbHUNOcm6mm8KmWhLRQt6+nBNeRWARS6M5q2AUS84qc=;
        b=l22ta+6XGx948pnWnUCEwjJaSgm0hZWJoRopYIDzuccnHjufTTqe3eicY0bd+GkURQ
         LFiywP7XLAbDAEU8Faa7jgWpEe+R7I2PhII6GPw/MLKPNOT8uH2M1o7tK8KCW8O5saGE
         TnO4fAglNC3xfM1Q2uQpvlQTtiGc5o9V1WLG0ZGLkfauEcSUqppseh0/yKmwL9BtXXPC
         F5ox7mIJk2jhxdPGzuJbXoJk37ogDnHPGZez/8i5/aobZ9ouQyIG0f7rAuKtzVj0EyGl
         2GfQXlJiM8uHZp83kQ80R1Tr2A9TfSI9KT8/oatWTI1RrE3ELqQtxgz+Qnd/WT3lZJAe
         faeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbHUNOcm6mm8KmWhLRQt6+nBNeRWARS6M5q2AUS84qc=;
        b=evxnpISSaLonXm/lwrlACd6Fmt+tXloqbxDGt6aHK9FBdK2eOQkDdAwzn41bhi/UXP
         glW1hjriOzKO2nzQf/kajXzxItUoX2sh5gHhMQzXCfln1i6j9YnxdpQtFL22DVgfy6Hm
         FfSCMI7y8qkv3pq+OqLUpN34ZoIVsOVr3iAq2v8PukybYNDk2aXYZRXp1ARnYtlnxFo1
         wbMKZSZqpZ0EFYPoqyv5MO634sZIrU0eMLD+8PcMuMtPD26NFmAlOeBBLAyn57nJOt+x
         m9/ipAYPBcJTGjFnImSD4xWzlR9EyoKsoOfmh00yikiR0gdQibK9vDC0iyrMFstOeYkD
         +fxg==
X-Gm-Message-State: ANoB5pkmmjT1+mTbyo8qUy6IWwi5Vgv+CA2sMpm3H9d88TZ+w5Wbwl9B
        lXUjoS2iKz/7AspIx4MLZKZDe24IBIKK4A==
X-Google-Smtp-Source: AA0mqf5xcvL23eXr6pOAALlGC9gW5alpthUez4UexNlopqHetOPrqyidGQYcUftSW3eH13/IjBCR1g==
X-Received: by 2002:a05:651c:b14:b0:277:7eef:1d97 with SMTP id b20-20020a05651c0b1400b002777eef1d97mr5908634ljr.516.1669372841162;
        Fri, 25 Nov 2022 02:40:41 -0800 (PST)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id u7-20020ac258c7000000b0048aa9d67483sm474880lfo.160.2022.11.25.02.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 02:40:40 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        zhanghongchen <zhanghongchen@loongson.cn>,
        Yinbo Zhu <zhuyinbo@loongson.cn>
Subject: [PATCH] pinctrl: loongson2: Fix some const correctness
Date:   Fri, 25 Nov 2022 11:40:38 +0100
Message-Id: <20221125104038.7638-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The kernel robot using sparse is complaining like this:

drivers/pinctrl/pinctrl-loongson2.c:212:21: sparse:
 sparse: incorrect type in argument 1 (different address spaces) @@
 expected void const volatile [noderef] __iomem *addr @@
 got void *[noderef] __iomem reg @@
(...)

I think the problem is simply that the register base is defined
as void * __iomem instead of void __iomem * and this is because
of the way const correctness works with pointer infix order.

Fix it up. I think.

Cc: zhanghongchen <zhanghongchen@loongson.cn>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>
Fixes: f73f88acbc18 ("pinctrl: pinctrl-loongson2: add pinctrl driver support")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-loongson2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-loongson2.c b/drivers/pinctrl/pinctrl-loongson2.c
index 1e9ec87e6930..a72ffeca26fb 100644
--- a/drivers/pinctrl/pinctrl-loongson2.c
+++ b/drivers/pinctrl/pinctrl-loongson2.c
@@ -45,7 +45,7 @@ struct loongson2_pinctrl {
 	struct pinctrl_desc desc;
 	struct device_node *of_node;
 	spinlock_t lock;
-	void * __iomem reg_base;
+	void __iomem *reg_base;
 };
 
 struct loongson2_pmx_group {
@@ -202,7 +202,7 @@ static int loongson2_pmx_set_mux(struct pinctrl_dev *pcdev, unsigned int func_nu
 			      unsigned int group_num)
 {
 	struct loongson2_pinctrl *pctrl = pinctrl_dev_get_drvdata(pcdev);
-	void * __iomem reg = pctrl->reg_base +
+	void __iomem *reg = pctrl->reg_base +
 				loongson2_pmx_groups[group_num].reg;
 	unsigned int mux_bit = loongson2_pmx_groups[group_num].bit;
 	unsigned int val;
-- 
2.34.1

