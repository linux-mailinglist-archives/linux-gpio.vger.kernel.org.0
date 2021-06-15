Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3BC53A8380
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jun 2021 17:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbhFOPDQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 11:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231274AbhFOPDP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Jun 2021 11:03:15 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C081C061574
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 08:01:11 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id e25so4335215ljj.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 08:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yro0N735BUc6Dtw9i+RlBgWclZDebWseV4SlcJC2l0M=;
        b=vTX2AUk5GAH7nfJtbSNIU4AvFKLa3ddt70j0MG+kcNmVcXSi8mfupnrL/bcEctkFr9
         em98RSfUViNftXMTBj78s2KFVSIwGd4ACzAp6asE1P3e9EBxqA1wknoORL7elitssppJ
         g1FyOIO3h+djRlpQYJhw/o41SICUGoQAPmVdTBsco9eKxbg2lyY5RXJbve6xb7p81sy9
         2Y5fcSMaaoRNexTJQeu//Ik8IsHxuyiXZ05rCM2gMG+8KviPqwWFrGgoAbOiJTy8osp6
         XwJlLYESsoZSR2LEVO0Sm2+A7Fto8YmvHHZ0m30VeVTBaBI4t0kYYXWpDhytDDU63pxp
         evfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yro0N735BUc6Dtw9i+RlBgWclZDebWseV4SlcJC2l0M=;
        b=pD3eEC6mMXzOduAJkhANVmnf5qYt+t3H3ZH/hJ4K1t57fIblR9MyQiaMiodOZ68td1
         RjndLFDUKywIZ8/fWq+ym8Dnrn0GwM3qOH8OyTa1+QVXW9oSVh9F4afsteecIfnw3P3p
         UBJUB5iZ4RnSKyszSdv30QefSnJBXL+NI0Bg/le7c0HrnP32B6eaJ71g23JqCu8ABMgH
         K+gtgdJ+9QVm8bVJ+hxUiud2YYweejVZ+JM2g/yPQo8IjOwpohOtTka5iqnsppijlBTo
         l7LyvxUugBp44cBVpLrd9o2bcI+wsLqXdrqO7fx8GNNHc5plRO17I59pkblUy+7VGLBr
         klWQ==
X-Gm-Message-State: AOAM533Vp1le/yks46otmvxMouj7OIvUkhrBSSMO2kgym+Aj3n4tW//8
        idD2FNA80hz1+MJd9AQGk9V7gCZQIrrAQA==
X-Google-Smtp-Source: ABdhPJx9TjM+KvrfhHbYm/fCp0+h5yWyQsP9BXuVXzLDEwy/Rylmpz4MGECRiScd2aH/T8Cy0cP00Q==
X-Received: by 2002:a2e:b0e8:: with SMTP id h8mr55369ljl.42.1623769267956;
        Tue, 15 Jun 2021 08:01:07 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id c18sm788914lfd.51.2021.06.15.08.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 08:01:07 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sekhar Nori <nsekhar@ti.com>
Subject: [PATCH 1/3 v5] gpio: pcf857x: Name instance after dev_name()
Date:   Tue, 15 Jun 2021 16:59:01 +0200
Message-Id: <20210615145903.634565-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Put the label on this gpio_chip from the dev_name() instead of
the client name.

The client name will be pcf8574 etc for all instances even if
there are several chips on a system.

This manifests on the DaVinci DM6467 (non-devicetree) which
will contain 3 different pcf8574 devices that as a result cannot
be told apart because they are all named "pcf8574", affecting
the GPIO descriptor tables which need a unique label per chip.

By passing in .dev_name in the struct i2c_board_info we can
explicitly name each instance and use that to discern the chips
when using board files.

Cc: Sekhar Nori <nsekhar@ti.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog ->v5:
- New patch to deal with the chip label
---
 drivers/gpio/gpio-pcf857x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index b7568ee33696..2271ec86e414 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -311,7 +311,7 @@ static int pcf857x_probe(struct i2c_client *client,
 	if (status < 0)
 		goto fail;
 
-	gpio->chip.label = client->name;
+	gpio->chip.label = dev_name(&client->dev);
 
 	gpio->client = client;
 	i2c_set_clientdata(client, gpio);
-- 
2.31.1

