Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2191FD9FA
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2020 01:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgFQX6x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jun 2020 19:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbgFQX6w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jun 2020 19:58:52 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73D3BC06174E;
        Wed, 17 Jun 2020 16:58:51 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id q14so3055521qtr.9;
        Wed, 17 Jun 2020 16:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=jGy72MS6gZKYHJ1vR4n9374W/R354yQ24JMckZsZxVk=;
        b=PGiayrYQUm5naVpGdTdNvZd567DY9WtY7O7CabtImTleiqrdAcr8pVh6Sv4AFXyoHH
         Z1FyPJh1BTRW4ErAB6BpIkOIFHOvQ+7wJzReTlFwhfqaepfK7RYkA76EojBOBLflqMJV
         nW423Ijic5ljepsDOD6qlqVlHZ4oTUdbfsQAl4RE9bT6n8Eoc8EclMe431HznPklvRcY
         6aI+CJs5L/elIztypPD8r54DTkxiXEgV2alGtlq676KmoGirw5V1UAeooiEjm2vCnKc5
         Evg7MPT00OBwWPr9+y4rQsZVS9g9PYkVNfzHOh7kq/N5wni6QHEiHJ0jOTBJYmz2Gw7i
         V2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=jGy72MS6gZKYHJ1vR4n9374W/R354yQ24JMckZsZxVk=;
        b=WkYcWY96BwGSmUyDsT0V2kdGtfbs3eIRJSdmuCQdt5K/Eh2X2IWoyHXwYCBI+660YH
         tZ9qbJq53cSWuFSL5ZD2OIAaV5eqKJYv7AhIZitVTrpjVUJSz8hN0gp8Skg1X/kmWzAF
         drh15rhNv7WpE8ZYPFW+TifjMs9PGhSAzXGKQ0mX3oS6VOzVt7tA+VCWkbmcm47xISbW
         iZWkuaC9HSXLCXQudMdf1QD9+foLDVlQPp0k1jBNI8qAnIyDeeS91leEerPJzzfITOI2
         nXhM65PnIUca1H4HnTdLV0zQVrjlD+Qv/u+nuzQTWgqKPAN33Dtn05dK+Ty42WWL0XyC
         k4eg==
X-Gm-Message-State: AOAM533j3Efu1sbQJk7slvTwNlNUHK/sF5SP8iPdXicZT9/8jPmCG2Z5
        NH9ux0Q0R4S8+8Kbalvtb/0=
X-Google-Smtp-Source: ABdhPJyY8d28wSSZaDFBJ71V7MlCpga0K4kCntcxasPuh4S0OAA0LRGw8uC2Imyr866Fi8ug6MeYhQ==
X-Received: by 2002:ac8:3682:: with SMTP id a2mr1771825qtc.137.1592438330707;
        Wed, 17 Jun 2020 16:58:50 -0700 (PDT)
Received: from linux.home ([2604:2000:1344:41d:9c3:b47c:c995:4853])
        by smtp.googlemail.com with ESMTPSA id f30sm1356774qtb.9.2020.06.17.16.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 16:58:50 -0700 (PDT)
From:   Gaurav Singh <gaurav1086@gmail.com>
To:     gaurav1086@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] max732x_probe: remove redundant check
Date:   Wed, 17 Jun 2020 19:58:19 -0400
Message-Id: <20200617235831.25671-1-gaurav1086@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The check : if (pdata) is redundant since its already
dereferenced before: pdata->have_64bit_regs;
pdata is not initialized after that hence remove 
this null check.

Signed-off-by: Gaurav Singh <gaurav1086@gmail.com>
---
 drivers/gpio/gpio-max732x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 5fb0bcf31142..63472f308857 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -703,7 +703,7 @@ static int max732x_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
-	if (pdata && pdata->setup) {
+	if (pdata->setup) {
 		ret = pdata->setup(client, chip->gpio_chip.base,
 				chip->gpio_chip.ngpio, pdata->context);
 		if (ret < 0)
-- 
2.17.1

