Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A15132AD29
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381777AbhCBV1O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:27:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347495AbhCBSHF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 13:07:05 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E71C0611C0;
        Tue,  2 Mar 2021 10:06:24 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id w11so20850976wrr.10;
        Tue, 02 Mar 2021 10:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lTvhVz2v7k6JSGm/xWxNNMGIYRhbmQsgAUucRJDnU94=;
        b=p/2jZTHjp+7yhTswHRLMx1qtkVEFwMP4pq9SIkYsDsyyP4rzDprJlJmICqPGA8RHiN
         kkAjyLapxecVkWrhjDv+9A6M0sUwHnv8MuIDnOzWdW6hKZ6gq0JzcvwW0SuiO1OXAwCl
         L5uSZHijLbfjD8bbx4yWM7Zi6FJsi6OZ5qp98vwwaQD+Xfb5oG0UAJT4Ke5KZ63l3M8m
         B6WpC+jXyH3SA2fBpAKlzkbHMFR2DtjeDFw2XqBMMDAxfQJNe1MfTht+OZCYXlXaK6PS
         kfpeb0XKF67zypzR9y6YYaAI4T5VPhbFWgFee7wmAg3XDZOO7104RmDWaul1+fuvap5T
         Sw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lTvhVz2v7k6JSGm/xWxNNMGIYRhbmQsgAUucRJDnU94=;
        b=YeMzEp/zwlTq4vyAvAD7bR2hhKOrxm/e0KhegwGaFWzL/7ApQeLaZSAFae7R26nYEi
         lW6q9wEvLrHrJYdCwKGZ4ILFsdUprGRugcQgNHcxQUNWlxun6lWdGPOPc7y7haZZm9/E
         nuL8+AFm2IhUfHcPU0hBkYc2q/hpn7Q8Nxfd1qAVvmAG8ZMASCKYSJ4BDECIJvJJHr/c
         Rn/2qpEPQblz38CmcJXB9BAC4u5L9oa2dwa4doYnHF6aCoM4zu7ZSwXd8FCOG1AwFLYq
         h0iEu247nyxs1VVRnluV9vpkHRkOmd5C06tb3P56sLeywmB5D0mU+nLdBn5t+ZG45Pek
         1Xrw==
X-Gm-Message-State: AOAM533BghHVewon2zvJESMyJR6R+tlnVQlrtNhnKEGzz1Ao0+wltVqC
        DEqGgcKo07uWU45CrGM1H3k=
X-Google-Smtp-Source: ABdhPJzitEtdDC5zcxKH+YT5Ja2sYpMAdN+ABfx0hDSJrbv9M3XaOsAtlJqqsK4owYF2z+EjGCdh9w==
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr4297424wrn.338.1614708383267;
        Tue, 02 Mar 2021 10:06:23 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id z1sm227004wru.95.2021.03.02.10.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 10:06:22 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH] gpio: regmap: fix direction register check
Date:   Tue,  2 Mar 2021 19:06:21 +0100
Message-Id: <20210302180621.12301-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If there's a direction register, we should also have dat or set registers.
However, we only need one of them, not both.

Fixes: ebe363197e52 ("gpio: add a reusable generic gpio_chip using regmap")
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 drivers/gpio/gpio-regmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 23b0a8572f53..5a9fca00b5e8 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -194,7 +194,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 
 	/* if we have a direction register we need both input and output */
 	if ((config->reg_dir_out_base || config->reg_dir_in_base) &&
-	    (!config->reg_dat_base || !config->reg_set_base))
+	    (!config->reg_dat_base && !config->reg_set_base))
 		return ERR_PTR(-EINVAL);
 
 	/* we don't support having both registers simultaneously for now */
-- 
2.20.1

