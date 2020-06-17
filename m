Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5002E1FC7AA
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 09:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726025AbgFQHkp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jun 2020 03:40:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgFQHkp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jun 2020 03:40:45 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48F01C061573;
        Wed, 17 Jun 2020 00:40:45 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id p5so1211550ile.6;
        Wed, 17 Jun 2020 00:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JHfmeKqqt+QslrWvaGtda80Cg4S3Y6HmuFyLaNggFFw=;
        b=gh3xc2V4aXL5yUN+zGT7RWRNEBR0HBX3deIFpZ8dYsREpXojS1s1CVFVMDKl/1S2yE
         1T8WX1+kWzVin16rCRD1TYIQDHw5wc7U/FH2i/8Nk+bLwk6/fZiuOSs4BDQPyZtpFT26
         x1Ctst9IWRIjThg90bJ+PvGlieo6Q3+cIkwj7W2+0Ctddbk7aq7OmS20MRxYfkra02pj
         dXLjn0pP8ROFVkIe1OBN/hTxf3KaxTyL4OmHCoYybA6TPlNbwnzlqoxC3JLXV/T+LXrd
         M3OH+txrubobi9YmmLPTb4JJk6zvwTAhztWiVAWou3ZKiTNfOGkrjoPI6D+aiQGxzdDW
         X82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JHfmeKqqt+QslrWvaGtda80Cg4S3Y6HmuFyLaNggFFw=;
        b=GhzxskxK8MVPzy935vXtQ7A73lGbM+5ozRU/BkXcc0BcmI8xSWV7a9gzRKXFEqGyam
         C+NeUODpYYAoDbbfoRNWmNDlajV8Y+MsgFGo9V1C9w0+pGfFL4UGUTpu0dLzLfcBpu9f
         zT6uKccURZw7h8haoMaVfv9xTee9AzAoYG+YgOS33/ZqhhaUN28fN5pKVhg0jWmnLaP/
         y0PUhpiipECQoZJWZHqF0qkfzNHuMzV+/lnvMiHB0yrSAFisXfu3hPLj8NiXHVLVTOKI
         YxgfHC0KI70qmGns7XK1OhmREep3YOLfxRKRz/94E5GLDCfnrgXhNc07CCZgqk27zv9Z
         ab8g==
X-Gm-Message-State: AOAM530dGFyE2xrc9Qt7X0ftYntV66syC3kADeCR/lrVl4YElc5EMbw8
        4Jr5nLoiH0+g3wog5HwhoAk=
X-Google-Smtp-Source: ABdhPJyAsrfP4SUFzookJbLZbg7GMAgBfzpWyMZOru1nuPolwYhvLVYFVyn1D+xNMPlQx9BTxDtwPg==
X-Received: by 2002:a92:1bd2:: with SMTP id f79mr7248438ill.115.1592379644698;
        Wed, 17 Jun 2020 00:40:44 -0700 (PDT)
Received: from cs-u-kase.dtc.umn.edu (cs-u-kase.cs.umn.edu. [160.94.64.2])
        by smtp.googlemail.com with ESMTPSA id w15sm10984885ilq.4.2020.06.17.00.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 00:40:44 -0700 (PDT)
From:   Navid Emamdoost <navid.emamdoost@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     emamd001@umn.edu, wu000273@umn.edu, kjlu@umn.edu,
        mccamant@cs.umn.edu, geert@linux-m68k.org,
        Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: [PATCH v2] gpio: rcar: handle pm_runtime_get_sync failure case
Date:   Wed, 17 Jun 2020 02:40:23 -0500
Message-Id: <20200617074023.30356-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAMuHMdXHT9y09L19j2K=oQ1W+7x=SE7MEyjj6r1i=DPcokvWzg@mail.gmail.com>
References: <CAMuHMdXHT9y09L19j2K=oQ1W+7x=SE7MEyjj6r1i=DPcokvWzg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Calling pm_runtime_get_sync increments the counter even in case of
failure, causing incorrect ref count. Call pm_runtime_put if
pm_runtime_get_sync fails.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
Changes in v2:
	- use pm_runtime_put_noidle
---
 drivers/gpio/gpio-rcar.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 7284473c9fe3..8fb9079a1d60 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -250,8 +250,10 @@ static int gpio_rcar_request(struct gpio_chip *chip, unsigned offset)
 	int error;
 
 	error = pm_runtime_get_sync(p->dev);
-	if (error < 0)
+	if (error < 0) {
+		pm_runtime_put_noidle(p->dev);
 		return error;
+	}
 
 	error = pinctrl_gpio_request(chip->base + offset);
 	if (error)
-- 
2.17.1

