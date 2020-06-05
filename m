Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 147D11EEFB4
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2020 05:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgFEDBC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jun 2020 23:01:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbgFEDBB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jun 2020 23:01:01 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86627C08C5C0;
        Thu,  4 Jun 2020 20:01:00 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id i1so6952223ils.11;
        Thu, 04 Jun 2020 20:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=dMlRURD0AMV5m7nsP7Rq9ppWitDs8+6K6/cTTPcy4TM=;
        b=VtUTM0qn7CTaNao5hjVsEXiwUgUnBhKH925UHNI+uAyzcwMhfsq36V6iHXDGgcJKoD
         BmZMuTPjd9qeP5i4yspQEsrfNpGIHzHqBmPEbPaj8JDY1CHTrro1SnYbTKGwd3iwlb5v
         nIiJs1yhqmW/KwPIgKTPkLP5NitRPEPr9fHQ6nf99Ey2lNGBUQIynVyjBbUpy4S2fHF2
         JrnHQi+vt6cNU9JKRRsspY4VihzLZisqneNP1zJMXzRz8gdNX2MzF7mnYHOALiu++cE5
         v8+CPyH6lYqYiPIKJKq7+40FZAK9eSC3z91rlxQzzQv62XJaNlWlZX1FXvxLQq8XdYn0
         d1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=dMlRURD0AMV5m7nsP7Rq9ppWitDs8+6K6/cTTPcy4TM=;
        b=qkVeMHC9wddjWOwLnsoSgHq0rrASVyX4N3z5+6wMDZ9GcfMdGoENm/6vbcxDafwAq1
         NhdRWKCwiZe19ajmMd8PQvbnDe/C9DW2eOUaOXSFIwbp/9uEFGMPvEE13GFiMEdF1rzM
         EY17mc2ap+a1ZtSW6RrUY/81SxEtr3S1e7iyGEqywWXVsZLbOo7x66MW5Xym85EPX6uM
         5Fs7W4oQcHWbF1BlgL69jigt3m54WN8GuqP3B9H0yHAcyOcC+IYgaxRVlZ1wOVwHHY4j
         ga/kn7rKy9LALO+1ELcFC9Wx6yTxvRKeWYkWojvtzC0iDRGc8yg0om0Bhdf82ohdqW8w
         R8Yg==
X-Gm-Message-State: AOAM532m83aOwvU5QGQvsnylnGHL//wCoPlFxOzPuXWBjfqYGACELfYX
        SgqN4mwKCJgsE6Oe1bHgmAg=
X-Google-Smtp-Source: ABdhPJw65TE6nd6bypfAwdXMpluubPfORSaChczPfQHt4+6ldcKas7EH4A/dfERJ++EUdv98ERCbiA==
X-Received: by 2002:a92:b603:: with SMTP id s3mr6921538ili.175.1591326059820;
        Thu, 04 Jun 2020 20:00:59 -0700 (PDT)
Received: from cs-u-kase.dtc.umn.edu (cs-u-kase.cs.umn.edu. [160.94.64.2])
        by smtp.googlemail.com with ESMTPSA id d11sm727854iod.11.2020.06.04.20.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 20:00:59 -0700 (PDT)
From:   Navid Emamdoost <navid.emamdoost@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        patches@opensource.cirrus.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     emamd001@umn.edu, wu000273@umn.edu, kjlu@umn.edu, smccaman@umn.edu,
        Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: [PATCH] gpio: arizona: put pm_runtime in case of failure
Date:   Thu,  4 Jun 2020 22:00:52 -0500
Message-Id: <20200605030052.78235-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Calling pm_runtime_get_sync increments the counter even in case of
failure, causing incorrect ref count if pm_runtime_put is not called in
error handling paths. Call pm_runtime_put if pm_runtime_get_sync fails.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/gpio/gpio-arizona.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
index 7520a13b4c7c..5bda38e0780f 100644
--- a/drivers/gpio/gpio-arizona.c
+++ b/drivers/gpio/gpio-arizona.c
@@ -64,6 +64,7 @@ static int arizona_gpio_get(struct gpio_chip *chip, unsigned offset)
 		ret = pm_runtime_get_sync(chip->parent);
 		if (ret < 0) {
 			dev_err(chip->parent, "Failed to resume: %d\n", ret);
+			pm_runtime_put_autosuspend(chip->parent);
 			return ret;
 		}
 
@@ -72,12 +73,15 @@ static int arizona_gpio_get(struct gpio_chip *chip, unsigned offset)
 		if (ret < 0) {
 			dev_err(chip->parent, "Failed to drop cache: %d\n",
 				ret);
+			pm_runtime_put_autosuspend(chip->parent);
 			return ret;
 		}
 
 		ret = regmap_read(arizona->regmap, reg, &val);
-		if (ret < 0)
+		if (ret < 0) {
+			pm_runtime_put_autosuspend(chip->parent);
 			return ret;
+		}
 
 		pm_runtime_mark_last_busy(chip->parent);
 		pm_runtime_put_autosuspend(chip->parent);
-- 
2.17.1

