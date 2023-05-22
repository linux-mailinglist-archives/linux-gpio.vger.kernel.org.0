Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7202E70B6C1
	for <lists+linux-gpio@lfdr.de>; Mon, 22 May 2023 09:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232685AbjEVHpK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 May 2023 03:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232683AbjEVHpE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 May 2023 03:45:04 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04E9ABB
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2023 00:45:02 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3093eb8cd1fso3459477f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2023 00:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684741500; x=1687333500;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fK5OlSXfyjg+PIj6n2SWaCH/4TNSGUudVW8DAjwbfY8=;
        b=uce9yY/OrL3g60RXng9VMAfduLSdJkYexFX0xENne74CleCGslxAPiQ6Fc8WDNjqdu
         1YRnB4Z2ZYG0FSwpz/cR3UUbKS6v87L6T7b2IKvqvSxH3sWQ8TOU6aP9t5gK8fNZAF06
         75plrMUoKQuCymOGcMQpNRoE2CGXnWlMNJoRZVl7lCg1Ww5qlZ9/htb0yFcpDinrcItB
         PgTLH0ugM05hYZfLSb6jiQ5Wm00qyy3GVEgD3XoYx/3vtEQudzd2tpGnj5GowJCSIKcb
         h2RAKrukmLZr3mJaezNyGS7xJvcEg3flE2w0OhEbWa1niKl6UmBoU4WdxSEzLpFeig+F
         HqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684741500; x=1687333500;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fK5OlSXfyjg+PIj6n2SWaCH/4TNSGUudVW8DAjwbfY8=;
        b=YJZ6ImZakHgR/IBStl5xH1upWlHIOtPWMc/pYIE2NnJj0BdA1zrp9Ntw0NOMEWY6c9
         Q4vx2XYFP1BPx45IfomFtIuCTvt8V1fmJuqGrfjrwyA+71WefcKNm5WP/XJ86dm/Trcw
         3yaYmSEK0j4U4/fIGHic6sohs+Aa6z2+bysjBKZcn2YeFw6TMUcktioigtHE4txsmbQa
         pEtDRI2AMTLXDKhXXf65LVU1C7+7QWFiVqUAO6Rp5UfD733ZEyGse9RFBf6PzXTufZvG
         FncNnChKvY2qi+r0s1vLKYoa8IILWZV6Lg90Un/pffIyM31B8gehrhhheN/TJoQAPG6v
         +d0A==
X-Gm-Message-State: AC+VfDzZETu4I9/HWdzjcM3yBFEZS+plclhkYAuP8A3cj0N2kw9lcvZ0
        l9OKKsEbKuJa7tNZxJZfpLSqqA==
X-Google-Smtp-Source: ACHHUZ4MjtjGRJcUmU60f6IgVu2SGKTWjWtgXlKvxz5kw67Ocqrdp3qBoQbYOImigp48OWEBy8tpXg==
X-Received: by 2002:a5d:4bd2:0:b0:307:a910:f9d5 with SMTP id l18-20020a5d4bd2000000b00307a910f9d5mr6445867wrt.35.1684741500503;
        Mon, 22 May 2023 00:45:00 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k15-20020a05600c1c8f00b003f1978bbcd6sm23918328wms.3.2023.05.22.00.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 00:44:58 -0700 (PDT)
Date:   Mon, 22 May 2023 10:44:54 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] pinctrl: at91: fix a couple NULL vs IS_ERR() checks
Message-ID: <5697980e-f687-47a7-9db8-2af34ae464bd@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The devm_kasprintf_strarray() function doesn't return NULL on error,
it returns error pointers.  Update the checks accordingly.

Fixes: f494c1913cbb ("pinctrl: at91: use devm_kasprintf() to avoid potential leaks (part 2)")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/pinctrl-at91.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 871209c24153..39956d821ad7 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1389,8 +1389,8 @@ static int at91_pinctrl_probe(struct platform_device *pdev)
 		char **names;
 
 		names = devm_kasprintf_strarray(dev, "pio", MAX_NB_GPIO_PER_BANK);
-		if (!names)
-			return -ENOMEM;
+		if (IS_ERR(names))
+			return PTR_ERR(names);
 
 		for (j = 0; j < MAX_NB_GPIO_PER_BANK; j++, k++) {
 			char *name = names[j];
@@ -1870,8 +1870,8 @@ static int at91_gpio_probe(struct platform_device *pdev)
 	}
 
 	names = devm_kasprintf_strarray(dev, "pio", chip->ngpio);
-	if (!names)
-		return -ENOMEM;
+	if (IS_ERR(names))
+		return PTR_ERR(names);
 
 	for (i = 0; i < chip->ngpio; i++)
 		strreplace(names[i], '-', alias_idx + 'A');
-- 
2.39.2

