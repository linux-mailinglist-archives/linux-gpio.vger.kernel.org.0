Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9E1E27C1F9
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 12:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728112AbgI2KKi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 06:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728120AbgI2KKY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 06:10:24 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC446C0613D0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 03:10:22 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id x14so4664214wrl.12
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 03:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1YXp6sKFkcXTnpolw457jZq5A6kI2Z1eojr6/yOZQYQ=;
        b=ge2csPM7d7wiy+ReKUocCYslodvdh3SSXOALUd8ycsfl0rZtLzeSFE2dUrDD32GwF6
         vp8RJ+qdV3WQUrAyI/x8+P+De7X8f0sDguglqoR+aH7v1gLVsrW2NHm2NYXvnYRvZV19
         ypwxsKd7wGuCA9B6xwjLYZvogu6KOdeT6jLO9LfgmjwA7NAV4Cqi61c5S06Glmay/dgz
         nZhvYzjZKvzHlho6c3VE5bSQm6S8j8IdrPmVqpN8bttA0MYKhwcE50qRuY3ui7DwhuZ8
         UC3mwppiKSzb19Dr84/F3BTcoc4kg6SyGaZ9sGFVYd0dEYWGdmW/gWyLKn3wSy1Nfb+W
         n7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1YXp6sKFkcXTnpolw457jZq5A6kI2Z1eojr6/yOZQYQ=;
        b=nPA2vHOs9hHPe/xcrw65vKK5n7Ite91ZjIG6PIWsQe8Lz9B7ER2PikP8blWlrFwzpf
         I+B5RViXIIX7+pjO0QZB2IpjALcsRy+FSr3We0qUVl52RbU2gvBy7U+RuagXQYTpAoXW
         mxYe8hAHAOVqXGdpNtq8BzC7esbt72A7C7rh30xbpWX2UMrZRlh2+5gSX1vmTvHTbawd
         UibOVN/KAWVC+IPVUP2scxZNU4YmdoyR4+bF6NmK+NQRCq6ubYkgm3PGm4qUdZLeZSsN
         DQMN95K26iAaO7j/FJU5XLgXAC+ONcyHXpRaSdBBBIW3rltL09EcYTrRtMK/dhQoiO+b
         vPkw==
X-Gm-Message-State: AOAM53117Rh9ZtAmJtTt4/Wg7SkjhSe99ExwUcmvW/9iFlmKaosRqeSF
        DGRYL7j2UVrmJ65kFCiSQtUDHA==
X-Google-Smtp-Source: ABdhPJzr+SMqMXUVznjXpDoZixQSjynbGp17eZgZW2xiWb7SeLlO4WpMUbvk0t9wdmsawJSm6npr7A==
X-Received: by 2002:adf:f5c7:: with SMTP id k7mr3518386wrp.246.1601374221447;
        Tue, 29 Sep 2020 03:10:21 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-68-189.w109-210.abo.wanadoo.fr. [109.210.51.189])
        by smtp.gmail.com with ESMTPSA id x19sm3380680wmj.48.2020.09.29.03.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 03:10:20 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 06/10] gpio: mockup: remove unneeded return statement
Date:   Tue, 29 Sep 2020 12:10:00 +0200
Message-Id: <20200929101004.20288-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200929101004.20288-1-brgl@bgdev.pl>
References: <20200929101004.20288-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

There's a return; at the end of a void function. This is not needed so
remove it.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-mockup.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index c2b2f7d5ff34..de778b52f355 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -372,8 +372,6 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
 		debugfs_create_file(name, 0200, chip->dbg_dir, priv,
 				    &gpio_mockup_debugfs_ops);
 	}
-
-	return;
 }
 
 static int gpio_mockup_name_lines(struct device *dev,
-- 
2.26.1

