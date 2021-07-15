Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7E763CA175
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jul 2021 17:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238859AbhGOPb4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jul 2021 11:31:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238855AbhGOPb4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jul 2021 11:31:56 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FA82C061760
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jul 2021 08:29:03 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id bn5so9050896ljb.10
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jul 2021 08:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4zXOWLxK3mPjdxHJneIRA4HXCtIcK5HkOCCx6jSBP68=;
        b=wHMHNF4OguhcOZhW/m1XpozEkYUZoDuvjK+tWO4VAs8w/R6IxnFTohcLH+qEezHDd0
         x5Io1lPFtHTnrHaceFZ30wp0VrRdeBT9NB2ATz4aebDMIThaUTbn19EVZDqIP0gr8qgq
         0okJmAbuV5OSv1rTK7P98CCSbfhO4EW1PkwIVDZoTWmPRicQqDoh6SAEaZNBXtszwXke
         k4ze0XK9EUBFv3Q6TNXjeRXtwjDc2RJdekzKcVpNp/5jNdWJtLWBVmWbIYtfZZnjvHwX
         2mRzolJmJGhwDU3uMLAvA3U9dXuBV28aVCUIWnTtxjfOXnp37Tw7Atybg1Lgijg99Uem
         wPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4zXOWLxK3mPjdxHJneIRA4HXCtIcK5HkOCCx6jSBP68=;
        b=PRZMnDllbWbGrR5ff7tTaLSiF26itn9xrosO4mGNONHCRnyo5eJcMVlx3RR5J/ZY9k
         uHL+2zg3IxNeIMyroCGIBnWcWM+fau0ZJC/ifu/kOekf0EzrrLNLucsqIzK07fBcF1I8
         97UoQjSTRxQ84Iv8Zb3kFphRz/RUl+2eOOZ6P8l6xXnGeAI3y6epJJ1GrcGM1Q+FPioX
         pnjm8cDBDVOdYAfPpoNpg8XmM+Fk4LPXDJMmKY3P6xoskGkNCqJzG53b5m5Ib82ELuKj
         DFE8xdpXrf8L9Xfwi8dx81qZKzWVJ7MLKPfN9Y8yhBJ5r4IBkxJSpXkmaVJEHOjBsUJe
         +eEA==
X-Gm-Message-State: AOAM531nRysp7iLBkTKNISxELy8rgb2HTxuz2w5WKPu5tr/aUNP8qazC
        54lpUvxJqtBfaHQ85Lz7J/O28A==
X-Google-Smtp-Source: ABdhPJzx5J4Ka8IS6E1arp4w6wJbg294hGBpyIBi5rf8ELg2F7ZX8zceScs+VJOmG5OYHTFaCSKgDQ==
X-Received: by 2002:a2e:6111:: with SMTP id v17mr4688272ljb.27.1626362941508;
        Thu, 15 Jul 2021 08:29:01 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id m5sm53599ljq.22.2021.07.15.08.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 08:29:01 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] extcon: max3355: Drop unused include
Date:   Thu, 15 Jul 2021 17:26:57 +0200
Message-Id: <20210715152657.396185-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver includes the legacy <linux/gpio.h> header but
does not use it. Drop this include.

Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/extcon/extcon-max3355.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/extcon/extcon-max3355.c b/drivers/extcon/extcon-max3355.c
index fa01926c09f1..d7795607f693 100644
--- a/drivers/extcon/extcon-max3355.c
+++ b/drivers/extcon/extcon-max3355.c
@@ -7,7 +7,6 @@
  */
 
 #include <linux/extcon-provider.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
-- 
2.31.1

