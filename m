Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB2863BF02
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 12:31:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbiK2Lbq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 06:31:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233148AbiK2LbV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 06:31:21 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 947514B76D
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 03:31:20 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id ho10so33051435ejc.1
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 03:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4SBREMO46IWUVHDdknE2mCnK5ku/aIdl62hn5ufWe8c=;
        b=GOT6wc5D9VGVXXeMCBS4529s09Y666ibvEIulR/fQNvZhtOoeOoDhXj3eoHLQsugPI
         RrvTPkqioQy9R4UWLKywOGa8k4jNFvLOd8j6hS52UkNn1PyfD4uOXUTHR+eFV57cIxxD
         a5gRu35Qubgqk5CMepGOQYdZgStCgQ59QePpsaBsXHbFALDYgdtJiE7Gog4Purh2uTWQ
         tREVvROCnwRCWRr9jACpYzLvj3Grp+xg/Wjmq+iL7HMiA/KQVgGsjAKuXhmk1DSxSEU1
         DFNR0qcJCyFrVHlcyYlDxLVlvpymN9ZNUJ4yWoamzs8TeCnqac7GDsr/1uhOESHbsY/f
         gkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4SBREMO46IWUVHDdknE2mCnK5ku/aIdl62hn5ufWe8c=;
        b=lu0oKfUig4noX2QoKBMA9QLmhScHQ6uJB7SQMSs0p7KXx1anC2Te0H1DZP0WY867zS
         7PDUP6gxEqyf+vpw2Jw39pyseSYH+Nn2S+aU90I/QYkmaj2QdSXSxOP8qEWCN3P1iern
         DzRKYs8tEgRhng24p/SJNVaQS00lsCGD28GZ5+lr8npD4gGJAHOWEMPmj6gK4wRptfJt
         39vR29w4fUtxq2579/TDsInStPzGaFKdNGJs70n30N4ynMr91o85/pDtvaIS18nQDzGX
         Z+jZ7+sHoBk6AD7l6U1/EL0swSdoYktKeMee2aluLzViHEf8zHaCAViKeH40H1CPZyDu
         Atpw==
X-Gm-Message-State: ANoB5pkalxFMeFE7Be6u41QVGJEI0S1ueiuNXyD4XNAuaNG2cnLOBapZ
        UpbEeoqzf3z7r139k5dG040=
X-Google-Smtp-Source: AA0mqf6tVT3cveJ3vxMslDzdW8O/6bnUH3rTf0e4oPrFLwU24+MJgg1wbKTWJHvYcanj5ZRRAxp5XQ==
X-Received: by 2002:a17:906:6a8e:b0:78d:a136:7332 with SMTP id p14-20020a1709066a8e00b0078da1367332mr46868120ejr.355.1669721474666;
        Tue, 29 Nov 2022 03:31:14 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id sb16-20020a1709076d9000b0078db5bddd9csm6055883ejc.22.2022.11.29.03.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 03:31:14 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
        linux-gpio@vger.kernel.org, Gaosheng Cui <cuigaosheng1@huawei.com>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] pinctrl: keembay: fix memleak in keembay_build_functions()
Date:   Tue, 29 Nov 2022 12:31:08 +0100
Message-Id: <20221129113108.17127-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

Add missing kfree().

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
This is NOT run-time tested, Lakshmi would you like to test it first?
---
 drivers/pinctrl/pinctrl-keembay.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 152c35bce8ec..51b684201b20 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1599,6 +1599,7 @@ static int keembay_add_functions(struct keembay_pinctrl *kpc,
 static int keembay_build_functions(struct keembay_pinctrl *kpc)
 {
 	struct function_desc *keembay_funcs, *new_funcs;
+	int err;
 	int i;
 
 	/*
@@ -1643,7 +1644,11 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 		return -ENOMEM;
 	}
 
-	return keembay_add_functions(kpc, new_funcs);
+	err = keembay_add_functions(kpc, new_funcs);
+
+	kfree(new_funcs);
+
+	return err;
 }
 
 static const struct keembay_pin_soc keembay_data = {
-- 
2.34.1

