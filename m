Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3E95AC839
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Sep 2019 19:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728603AbfIGRjX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 7 Sep 2019 13:39:23 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37470 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728507AbfIGRjW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Sep 2019 13:39:22 -0400
Received: by mail-pl1-f195.google.com with SMTP id b10so4683888plr.4;
        Sat, 07 Sep 2019 10:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=2KMuFO88h4dqtRFksVWPbsERLEItvuarbLDPbK83xVg=;
        b=ItY/6wspleVE4P1m5L5CmpSqDmbYqq6dHJW4Hb6JuBMBOU0ybKcuOD2Se+gc5wWc3F
         dTCFsjnotuqe8pG72zgtHuLBRnE+TyewhmyrKY3TpzQdWD7dtPLK9GeC1jTxm4dyF0EI
         38QfZ+CCRclUYUwZw+nJfz5DVkXMsBQwU7DyVNTPzk+1BM7Gsf29EX039Qg5U1Q+schx
         dY6G+xKM3EQD9wzGaI23xvQ7mctqWCWOI8zUOikylk2jGKo+pho1z3E70ebMup1+OBsW
         cmIzLJcJluQG3s/MaSL6p/8JpBHsivGAsnHt72d4XUNjoqcwfRa8tAF/ykJMFkT9ngF3
         zhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=2KMuFO88h4dqtRFksVWPbsERLEItvuarbLDPbK83xVg=;
        b=tcvqOHd3d5WyYk/4xPSxKhnPzspK1jjLnblGWG8HwnBfk23h20dPoKmI2Ru8oV3vpI
         P3Pi8D0xxtVlh85NNJsptOeN2j+JwbtPClq/M0BrM54T7FRLibElu5J5w5FS5DDHiHGr
         csQ+MU/JfqOnYilIRSXjkFjKTo9NMOHZn2kWqDbDBVobCFZ4q9uTmkUjaUceKB0mlrW0
         28RWhPlmoyxeA+GD4FakP1rp6sAa47Hnx8ATwTHrHC5PfI4hSffUwYF/Kx7jFrpHHLPO
         eEQaU+80okWBFAP4SS9fmDwiBNp+BpVxVE61sDJw3zcI5kCL7eOalrPfSvTXSg0dmBVC
         SfWQ==
X-Gm-Message-State: APjAAAX0cWPJ+aQ3uOuBlFP4911o6QgPFMdvymecgBryEhVtb/rqGdiE
        j51YI4MKwVuHNph6qO4dO9vvcjVx
X-Google-Smtp-Source: APXvYqxTlLwakNL8qZirgYaEuHGK3Wx/zUjUZAjYDnBi9JJvc7O/JkuWz9bLtdF/Q/4I0F3+HS5Nlw==
X-Received: by 2002:a17:902:461:: with SMTP id 88mr14851087ple.296.1567877962086;
        Sat, 07 Sep 2019 10:39:22 -0700 (PDT)
Received: from SD ([106.222.7.162])
        by smtp.gmail.com with ESMTPSA id p11sm10886343pff.136.2019.09.07.10.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Sep 2019 10:39:21 -0700 (PDT)
Date:   Sat, 7 Sep 2019 23:09:10 +0530
From:   Saiyam Doshi <saiyamdoshi.in@gmail.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: remove explicit comparison with 0
Message-ID: <20190907173910.GA9547@SD>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

No need to compare return value with 0. In case of non-zero
return value, the if condition will be true.

This makes intent a bit more clear to the reader.
"if (x) then", compared to "if (x is not zero) then".

Signed-off-by: Saiyam Doshi <saiyamdoshi.in@gmail.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index edc1ea68db20..847cb0c522d0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -851,7 +851,7 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
 	}
 
 	ret = kfifo_put(&le->events, ge);
-	if (ret != 0)
+	if (ret)
 		wake_up_poll(&le->wait, EPOLLIN);
 
 	return IRQ_HANDLED;
-- 
2.20.1

