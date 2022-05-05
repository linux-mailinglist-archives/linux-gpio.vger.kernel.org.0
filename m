Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91DD151C29C
	for <lists+linux-gpio@lfdr.de>; Thu,  5 May 2022 16:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380698AbiEEOe2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 May 2022 10:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380681AbiEEOeV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 May 2022 10:34:21 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEA9F5715D
        for <linux-gpio@vger.kernel.org>; Thu,  5 May 2022 07:30:41 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id i10so7763842lfg.13
        for <linux-gpio@vger.kernel.org>; Thu, 05 May 2022 07:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DWZhZt9P/AT5Z6hJLZmRKixZgWkk4/it9JPnRy975aY=;
        b=zmZYu5J/K7BmNjRd2fO546TTGVdZRmUZuDnEzf5sGkAoTRJHfzo20CTAtVtHNps2OJ
         ecjD3ytfbmGjMswULTb9Dgip53AvXqF9vLfruQE5kw8A/gSrS4MvX9senxPc+EzQV5tT
         vQ13/R2kiR1fA9oZ4unlOcgAhJgYEpHt6Gm/IViu1Vvj5kS0EQyUm0aFIcCkpeGxGOsF
         6BhxoKPW94lvp+FYa7ZwSzVgEmTQRvN2NzPe/mOEkeImfV/4J/RH+/XzzTqwx2kjII9H
         VPLmsaargMoONPSzloXmnUSIcRWGpTV3LmN6bu6bHfPaCQmpUPbmZvshBtH8c9nS1YJN
         px6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DWZhZt9P/AT5Z6hJLZmRKixZgWkk4/it9JPnRy975aY=;
        b=yB1eB3bU1wuPxsUFbA/77qRQcMe2siwdoykRleB07y//t9MyQUEZQEGKfRpikKp9BP
         lnMrc2EOf3WxYydzRR+ptZz7GzSyrjeLnI9RuitcfyteSFpXgY57NN1rrK54BSkTeRGQ
         sbhC6LlY/ogqPYuiaNd2ktqxqH8y3OBG4SrQywNjOlo4NGRYMfiHVvBU+O5zh4rccCnV
         c3epXxHKmwjWzuKAeQ/ApuTRlIHgLEH7eCQm9QtyR/IWjzfiGdq80U7TT3UglRiW7rlR
         NoeldqlNtSBBNjI5+JAW8ixvRpOsXnveboXivNiHSL42KzyECpDjO0stSCsrbVBRDrok
         NJ1g==
X-Gm-Message-State: AOAM530M4eUkN1pvuw4/Jmj0lQXp3AsZ7vMXHaKOa3mm/gUGksIKhksu
        NnPnyO3xHk2XGvz5Vr09aOZZgvXL0kSfhw==
X-Google-Smtp-Source: ABdhPJyX6coYDHssd1zfMNxhVsOGRPauwtLSEF0sCOOcKalTL6R+UavzeXODJJMNiNfJFo+v5Q885A==
X-Received: by 2002:a05:6512:553:b0:472:205b:97ba with SMTP id h19-20020a056512055300b00472205b97bamr18080288lfl.314.1651761039773;
        Thu, 05 May 2022 07:30:39 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id u8-20020a2e8448000000b0024f3d1daea5sm223555ljh.45.2022.05.05.07.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 07:30:39 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] pinctrl: stm32: Fix up errorpath after merge
Date:   Thu,  5 May 2022 16:28:37 +0200
Message-Id: <20220505142837.165499-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When merging the for_each_gpiochip_node() changes, I made
some mistakes by not disabling the clocks on the errorpath,
fix it up.

Fixes: a0912083086d ("Merge tag 'intel-gpio-v5.19-1' of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel into devel")
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Fabien Dessenne <fabien.dessenne@foss.st.com>
Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 0f7d608151ff..88da8ac0b252 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1614,6 +1614,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		ret = stm32_gpiolib_register_bank(pctl, child);
 		if (ret) {
 			fwnode_handle_put(child);
+
+			for (i = 0; i < pctl->nbanks; i++)
+				clk_disable_unprepare(pctl->banks[i].clk);
+
 			return ret;
 		}
 
-- 
2.35.1

