Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27FBF7BA168
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Oct 2023 16:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236112AbjJEOm2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Oct 2023 10:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236163AbjJEOgo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2023 10:36:44 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A31E0497AD
        for <linux-gpio@vger.kernel.org>; Thu,  5 Oct 2023 07:01:54 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-406402933edso8891855e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Oct 2023 07:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696514489; x=1697119289; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W8BwQ3IP0CHV2dHAgfr58wuL/lxT2QhMZVJPK4cP22Q=;
        b=QoXjL6YaDoXHL2lQQOvKosMu0kfGoVZSVPT0sX5GHS2MtaFJ5LUJ8wp53hgnC5qs1E
         SuJa23cI8sZ0VkyctyQ/8j15aAKu4f2QcRNECK39exkZCUDPZJ4SRbxchoPE0Pb897PK
         849c+dxzGSAh+zH2BgQWw4qlRH2a/vuAetGsN0m3oqBanHk30i3lamPN5ZqBq2G0tKrq
         Y7Llzgg1dNZOba3+k+d9O3g5N/u1E6lbv6DCaI6z2R3BgbjFQkT3vzZcmApE8XiK+bxR
         GAlsFvnm1G3jo+B7cebveLASuzUulM7fD2UOL+CasrDnBWmtQ/NzSFeDR7qoBktXfIK2
         mvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696514489; x=1697119289;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W8BwQ3IP0CHV2dHAgfr58wuL/lxT2QhMZVJPK4cP22Q=;
        b=dLXz7/b+Y0SIP81Gi/3UI20vwKc7ZNEGgWEsV26XfiK+Y1xjeb9gP6F84f+umVgujy
         VFJl5ttWdTTe4SzQC7YBAKHbGUZvncEV4xU04xC6OqCZUa2pGjGM0UBcMNDqVtRzeKLq
         7I9PkSdyUToaHatLHGUyUz81T3B5SPHwJoW5EXdMyqmdtxG8dt+yX/psGCdQ+V/K9XbS
         fkrjiGQ+QXqALzWsjbRq94hlxcEPnD3JMTJLK426utF4WI7tee64kdD2+JNzPN+60umc
         gcHDVerK8w8AhtMl/KjDbTAJE4ZdwySASFMmaKaBd/9p7IBwmIuXdHrrDa1kSu0LF22r
         svCA==
X-Gm-Message-State: AOJu0YyMPQjLATjeekmv1sfudMoXFtcIzixYDxjJprHAaZgtzFM9pzx8
        AlhyY+JQM55HyggX268emsLrT8qfLeb3U70dVUo=
X-Google-Smtp-Source: AGHT+IG0ZEP6rYEhZohaIubCmSt7nEhccGbk/yon9cOa/OMeRwiJeM+DhepxTXfUwcJtiWkWOHLS3Q==
X-Received: by 2002:a5d:40c6:0:b0:31f:dcbb:f81c with SMTP id b6-20020a5d40c6000000b0031fdcbbf81cmr4388076wrq.10.1696514488977;
        Thu, 05 Oct 2023 07:01:28 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b15-20020a5d4d8f000000b0031f300a4c26sm1854246wru.93.2023.10.05.07.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 07:01:28 -0700 (PDT)
Date:   Thu, 5 Oct 2023 17:01:25 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Tzuyi Chang <tychang@realtek.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] pinctrl: realtek: Fix error handling in probe()
Message-ID: <590b337a-13ce-4391-a09d-d2b06fbc912d@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are several issues in the probe function:
1) of_iomap() return NULL on error but the code checks for error
   pointers.
2) pinctrl_register() is the reverse.  It returns error pointers
   but the code checks for NULL.
3) The error paths need to call iounmap(data->base) before returning
   to avoid a resource leak.

Fixes: e99ce78030db ("pinctrl: realtek: Add common pinctrl driver for Realtek DHC RTD SoCs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/realtek/pinctrl-rtd.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index bafe27face80..6c6aa9c3c567 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -535,14 +535,15 @@ static struct regmap_config rtd_pinctrl_regmap_config = {
 int rtd_pinctrl_probe(struct platform_device *pdev, const struct rtd_pinctrl_desc *desc)
 {
 	struct rtd_pinctrl *data;
+	int ret;
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
 	data->base = of_iomap(pdev->dev.of_node, 0);
-	if (IS_ERR(data->base))
-		return PTR_ERR(data->base);
+	if (!data->base)
+		return -ENOMEM;
 
 	data->dev = &pdev->dev;
 	data->info = desc;
@@ -561,18 +562,25 @@ int rtd_pinctrl_probe(struct platform_device *pdev, const struct rtd_pinctrl_des
 	if (IS_ERR(data->regmap_pinctrl)) {
 		dev_err(data->dev, "failed to init regmap: %ld\n",
 			PTR_ERR(data->regmap_pinctrl));
-		return PTR_ERR(data->regmap_pinctrl);
+		ret = PTR_ERR(data->regmap_pinctrl);
+		goto unmap;
 	}
 
 	data->pcdev = pinctrl_register(&data->desc, &pdev->dev, data);
-	if (!data->pcdev)
-		return -ENOMEM;
+	if (IS_ERR(data->pcdev)) {
+		ret = PTR_ERR(data->pcdev);
+		goto unmap;
+	}
 
 	platform_set_drvdata(pdev, data);
 
 	dev_dbg(&pdev->dev, "probed\n");
 
 	return 0;
+
+unmap:
+	iounmap(data->base);
+	return ret;
 }
 EXPORT_SYMBOL(rtd_pinctrl_probe);
 
-- 
2.39.2

