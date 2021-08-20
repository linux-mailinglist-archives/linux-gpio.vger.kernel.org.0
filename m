Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 357413F3725
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Aug 2021 01:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238009AbhHTXBG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Aug 2021 19:01:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230303AbhHTXBG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Aug 2021 19:01:06 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D82FFC061575
        for <linux-gpio@vger.kernel.org>; Fri, 20 Aug 2021 16:00:27 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id i9so23589900lfg.10
        for <linux-gpio@vger.kernel.org>; Fri, 20 Aug 2021 16:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V+/U9FpQyY4U//iKVyDtUsveyTibEXlro27MkRbNWVk=;
        b=c9aS7ULVPcx2QXgHIjuFJrVMHy38F8f/e3aeCtMCpOYUeSsob4okqYL/ACkJRyeEQk
         wnj0/n3Ua+3dCkiF1q3cjlm51oTzhx95i8IndOpYlmyF56n/r5Bf9JDEFk2ZPHAfKKc+
         axl38K9nxdNc7hfoXwXnjzfCOHumu2xLtHJ8VW4mpwQDXxrHLsNVvDo2r1RVc4qeIbH7
         D3pbgsvmljbv8VY5jefWwP5d9leuUi8b761h7y7qdrP16LMxkd2oZwFOG/b/ynQFb+Gn
         Ht7uWDEdvD3wdj5p4VxCbuf/QUvKdpSKL2nx+sz44HQg1PXpVb/ecTCLFwmJWYca+dGE
         qYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V+/U9FpQyY4U//iKVyDtUsveyTibEXlro27MkRbNWVk=;
        b=m5lOoggBlSAh941OJilbp/fVkLXn/GJZFdUX+RuQQGijqLxi3RkjZ9I4JRzmk5j5NT
         jMPnIQsVKZ14lP82A2DcDFR2AxeIGzTDeyfILu016ub8OyImzZreZl8nyqARIqW9utDs
         Bbvzpi1btFE32zQ8VVddYiLW6FiZl9nJrWLFIsmpbqP67m2j8dSrvN2NaWagk/cd3y04
         XP6jV99nPPefTfKuGt4i0FQgsCVUN2an3LfJKAkFqLh3mzzJjB0oZjzxS8panlqzH+1H
         Wlz9f7V3hjQqjsmmEyYXz5pog6Xx/jYEX5tsBPZ6UHME53F/jr9ykNVgh2SOJG/S+6oN
         dSOw==
X-Gm-Message-State: AOAM533L573PH2bgGGjuQILbyoAJYreGun56PCuVnoNTUwX8Wh+ztLX7
        bjt8YETRC6sGGApvdqrvpvpSlUzHpYG3xg==
X-Google-Smtp-Source: ABdhPJw4umd96KmnM6lxsTS3NHgkVYYA6bafCNblPXcy/+jiqgJOTLIznwCcBtRPcmNbiCmx8QmVUQ==
X-Received: by 2002:a05:6512:1589:: with SMTP id bp9mr16338425lfb.567.1629500425822;
        Fri, 20 Aug 2021 16:00:25 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id r25sm636046ljc.118.2021.08.20.16.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 16:00:25 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: max730x: Use the right include
Date:   Sat, 21 Aug 2021 00:58:21 +0200
Message-Id: <20210820225821.103070-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

<linux/spi/max7301.h> despite the placement of the header, is
used by drivers/gpio/gpio-max730*.

The include needs struct gpio_chip and needs to include
<linux/gpio/driver.h> not the legacy <linux/gpio.h> include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/linux/spi/max7301.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/spi/max7301.h b/include/linux/spi/max7301.h
index 433c20e2f46e..21449067aedb 100644
--- a/include/linux/spi/max7301.h
+++ b/include/linux/spi/max7301.h
@@ -2,7 +2,7 @@
 #ifndef LINUX_SPI_MAX7301_H
 #define LINUX_SPI_MAX7301_H
 
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 
 /*
  * Some registers must be read back to modify.
-- 
2.31.1

