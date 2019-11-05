Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3E6AEFAF9
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388363AbfKEKYL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:24:11 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34061 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388166AbfKEKYL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:24:11 -0500
Received: by mail-lj1-f194.google.com with SMTP id 139so21205781ljf.1;
        Tue, 05 Nov 2019 02:24:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mn1lUL+cF0iyYDnoMGPe70AhLdUgNla1po75o8XNDJ4=;
        b=ZugkWOVisIFeZySyKekmApzUUFXxluOelOdWK4B4uc0JOsquaNkgKn6IOq2PdGLvIl
         YeIESps95f6s2WNIpCyBNNyUzt6eswoljxUdRk1EQtM48YOULxuoDRc7oEhJbafl5Rqz
         s4M/WfsNPhrLYekmMdGJh5IpckRB0SQCOkofGBtrFq3AaNO5/b7JzCwLBfEENyIxm7q1
         EMrpFgoeNESmUGl72NCaXyPYZX/J5wvd4cHgRyPfS9NGgwKTZ64NL06WcIpQHjv3rh83
         a1g2b2eW/I5XUVNCLbyByGyLwvL5BXgGK9UWsZRM+2mR6Z9O5u+rdyNUyTSEuoMcSSir
         JSsA==
X-Gm-Message-State: APjAAAWrB/nvUd55zZ2UhYByARBoZulyKpRJ+xfaxe4UHv2QffD6BAzU
        YxYpcWMTTfpN2ysC27jo8C4=
X-Google-Smtp-Source: APXvYqypuK9Q+P28kWExMGDAUWjISZsQXDzXTCFz9f0wYAi95lL7yAwVF6EJAzJVjBznJbW5l6HPSg==
X-Received: by 2002:a2e:8e27:: with SMTP id r7mr768920ljk.101.1572949448567;
        Tue, 05 Nov 2019 02:24:08 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id o196sm9230433lff.59.2019.11.05.02.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:24:08 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:23:52 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Marek Behun <marek.behun@nic.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 25/62] gpio: gpio-moxtet: Use new GPIO_LINE_DIRECTION
Message-ID: <980eece590eaa6c1c83332ff9fb198a033dca803.1572945817.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945817.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945817.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It's hard for occasional GPIO code reader/writer to know if values 0/1
equal to IN or OUT. Use defined GPIO_LINE_DIRECTION_IN and
GPIO_LINE_DIRECTION_OUT to help them out.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/gpio/gpio-moxtet.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-moxtet.c b/drivers/gpio/gpio-moxtet.c
index 3fd729994a38..8299909318f4 100644
--- a/drivers/gpio/gpio-moxtet.c
+++ b/drivers/gpio/gpio-moxtet.c
@@ -78,9 +78,9 @@ static int moxtet_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 
 	/* All lines are hard wired to be either input or output, not both. */
 	if (chip->desc->in_mask & BIT(offset))
-		return 1;
+		return GPIO_LINE_DIRECTION_IN;
 	else if (chip->desc->out_mask & BIT(offset))
-		return 0;
+		return GPIO_LINE_DIRECTION_OUT;
 	else
 		return -EINVAL;
 }
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
