Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 444F92BB1AF
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Nov 2020 18:48:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728833AbgKTRrD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Nov 2020 12:47:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728816AbgKTRrC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Nov 2020 12:47:02 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA24DC0613CF;
        Fri, 20 Nov 2020 09:47:02 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id v21so3966079plo.12;
        Fri, 20 Nov 2020 09:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uRfbcvxICboodQKlXinezNDbNPHvNn9T8ybYNIuKq0c=;
        b=QrKRFlMzxWnE/Ue3q/KmittrUjJjuEF4OPURcyVq7nhRqz0JfxrgqLN6zQh+gHym+9
         k7rrN2qLtBi6jxTox7VWExWFFitaOV5Y2ltFx8CjyIxu0YM2sAppHoBXBRdvgYqs/lQE
         qBrhzi7kgGGr+Wreg+KjKM4RPlXsB6E16qVc4mHT5i4Comk6cSRNNVdYPW76IrAmfBSe
         7SV9AVwG9+EcrA5nG81N1NlgMdNmZLicVZlhr7PsN733TGKOfjalgOWGO9HIfT64VKcC
         tn7LGnands5CUXs0q78EzAtbpVkHB1EVSxeyg5tkbBvDRXPha4zokV3Ml95H5qCUfNZE
         iRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uRfbcvxICboodQKlXinezNDbNPHvNn9T8ybYNIuKq0c=;
        b=aXXs39MLWlu/s1IpstfRtATC3ZCSYKg4aOYI7k/F2iTkwCPnbz3UZBT9+KaJAuXUI1
         lU4OsWAwV+vFHh0j4gTJ1qBY+JJ/LQk9/iork8bEaz9Fgpj/7ug9e1jWWcZwHYwVBCqF
         SJF5YvUhbV2yWnoGQNwkzJVseigTn0oF7vpCNymgB5FGMZW/k68zdD8RdpF+Mf57qGX3
         7XzwJsew37fisnNIsp4wLXYESejQIBnbBYC2/axz4ipOC4HjhZKLzNm00ckzD7vDi25p
         qYz3ldjzWEcN8b69wAK1p3YdJP2UPwKtFUrLNsWdVx0BMq1uBQ8q2sZZSBEcPIaqdDqx
         Rmqg==
X-Gm-Message-State: AOAM530f2dg5lDcoMOKndhxkHOkfSDnEJAMq3/1qcDj/QMZA7nkezYwQ
        fISDQpkTcIbpRSqnfHC+9+w=
X-Google-Smtp-Source: ABdhPJwxzFrhgYSWjQYVZb3/YDn5TAj02ZE2o3DR/INcrJCXODyEyqj+UWac7dctbvBTSIVUSUmVvQ==
X-Received: by 2002:a17:902:868e:b029:d7:eb0d:79e8 with SMTP id g14-20020a170902868eb02900d7eb0d79e8mr14536568plo.12.1605894422031;
        Fri, 20 Nov 2020 09:47:02 -0800 (PST)
Received: from syed ([2401:4900:2e82:cfda:fc82:287b:3e19:db98])
        by smtp.gmail.com with ESMTPSA id k8sm4394747pfh.6.2020.11.20.09.46.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2020 09:47:01 -0800 (PST)
Date:   Fri, 20 Nov 2020 23:16:46 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     akpm@linux-foundation.org
Cc:     andriy.shevchenko@linux.intel.com, vilhelm.gray@gmail.com,
        bgolaszewski@baylibre.com, michal.simek@xilinx.com,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] gpio: xilinx: Modify bitmap_set_value() calls
Message-ID: <c509c26eb9903414bd730bdd344b7864aedaa6f1.1605893642.git.syednwaris@gmail.com>
References: <cover.1605893641.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1605893641.git.syednwaris@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Modify the bitmap_set_value() calls. bitmap_set_value()
now takes an extra bitmap width as second argument and the width of
value is now present as the fourth argument.

Cc: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Syed Nayyar Waris <syednwaris@gmail.com>
---
 drivers/gpio/gpio-xilinx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index ad4ee4145db4..05dae086c4d0 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -151,16 +151,16 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 	spin_lock_irqsave(&chip->gpio_lock[0], flags);
 	spin_lock(&chip->gpio_lock[1]);
 
-	bitmap_set_value(old, state[0], 0, width[0]);
-	bitmap_set_value(old, state[1], width[0], width[1]);
+	bitmap_set_value(old, 64, state[0], width[0], 0);
+	bitmap_set_value(old, 64, state[1], width[1], width[0]);
 	bitmap_replace(new, old, bits, mask, gc->ngpio);
 
-	bitmap_set_value(old, state[0], 0, 32);
-	bitmap_set_value(old, state[1], 32, 32);
+	bitmap_set_value(old, 64, state[0], 32, 0);
+	bitmap_set_value(old, 64, state[1], 32, 32);
 	state[0] = bitmap_get_value(new, 0, width[0]);
 	state[1] = bitmap_get_value(new, width[0], width[1]);
-	bitmap_set_value(new, state[0], 0, 32);
-	bitmap_set_value(new, state[1], 32, 32);
+	bitmap_set_value(new, 64, state[0], 32, 0);
+	bitmap_set_value(new, 64, state[1], 32, 32);
 	bitmap_xor(changed, old, new, 64);
 
 	if (((u32 *)changed)[0])
-- 
2.29.0

