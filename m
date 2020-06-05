Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 186181EEF9E
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2020 04:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbgFECt1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jun 2020 22:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbgFECt0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jun 2020 22:49:26 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D641C08C5C0;
        Thu,  4 Jun 2020 19:49:26 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id r2so8700655ioo.4;
        Thu, 04 Jun 2020 19:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=m4JBrQLU9j68jdVov8Re9jkn4rmu/LsHOY21OSp01uo=;
        b=CNlMs2qGApz3O6STGqKMu+TNa8kXVV+xawEo1JOHuC6p1h6nWG/JjrDynlohD+2L+6
         O1MDMz2tcxItl4OeKS1SCCrXrLI8mUrRvXIpauENeO+SHg24riAKEwhPp/gNpAOc7ENm
         JqLAaijwUZa94yqXe2EmpcJb8ed4l/u2PAIk3pkUyBUZJwcVyc3jINZ0PnHo/EEupJXp
         5ler2opm+MXjUFBtbjYzjWvAYAiIhJvAtCo26R5aJF0T2JJKQqnwRTMKpO7rj+hBBG+m
         tsnDFVnseXRrLjuy+oZXCz8RhVNLovx73zs3LZejXNOGUe+P7w9mLEiEhjG948BqHfTG
         fplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=m4JBrQLU9j68jdVov8Re9jkn4rmu/LsHOY21OSp01uo=;
        b=ofEcOYE3OzQqrUHjk5dfE8CHyNnm6wQcZwUa8OPZhzka6YCVr+heIdhTtn+Mx8X/9h
         offGY2Q5JVjSOeyFJKu+9+p9eLrjQUrelArRAvbRrnUAftXyB8zy2lLcsSCw4baBzBX9
         VHMTsYmQF5eGz0Cz9r120qiqy8o4W5AYqimsVrE2nYhis/Kw7o2S8tACMsjpbHsXdLYU
         vIvB4Ml5IwYHpi9Scn6ybeSxN2vHSIASK2jTynGLiCjVLqfoRZfXKV5B2PacB54eayjc
         ytIC1xr4AUCGJzJRXdfvcNxOfNsc7hMVKEj+X+6zTHaUcaRJF2CN0tKDvHFSW3iR0Nbk
         Piwg==
X-Gm-Message-State: AOAM531mjsEk5O54b7ewnUt2Taw37HmimnpF7ZH2FW6bVUynuwAKJMqV
        t1a6NrZdcTaii2jrJjO6wP4=
X-Google-Smtp-Source: ABdhPJykYzKRH6jgA3/JejtF17DWNLIjQDhZ9hYio2QW4tE8fpiGfswJULieGVvX95ElDQ/yFXwDgQ==
X-Received: by 2002:a02:6007:: with SMTP id i7mr6759168jac.1.1591325365617;
        Thu, 04 Jun 2020 19:49:25 -0700 (PDT)
Received: from cs-u-kase.dtc.umn.edu (cs-u-kase.cs.umn.edu. [160.94.64.2])
        by smtp.googlemail.com with ESMTPSA id w78sm2366272ilk.14.2020.06.04.19.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 19:49:25 -0700 (PDT)
From:   Navid Emamdoost <navid.emamdoost@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     emamd001@umn.edu, wu000273@umn.edu, kjlu@umn.edu, smccaman@umn.edu,
        Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: [PATCH] gpio: rcar: handle pm_runtime_get_sync failure case
Date:   Thu,  4 Jun 2020 21:49:19 -0500
Message-Id: <20200605024919.56177-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Calling pm_runtime_get_sync increments the counter even in case of
failure, causing incorrect ref count. Call pm_runtime_put if
pm_runtime_get_sync fails.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/gpio/gpio-rcar.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 7284473c9fe3..eac1582c70da 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -250,8 +250,10 @@ static int gpio_rcar_request(struct gpio_chip *chip, unsigned offset)
 	int error;
 
 	error = pm_runtime_get_sync(p->dev);
-	if (error < 0)
+	if (error < 0) {
+		pm_runtime_put(p->dev);
 		return error;
+	}
 
 	error = pinctrl_gpio_request(chip->base + offset);
 	if (error)
-- 
2.17.1

