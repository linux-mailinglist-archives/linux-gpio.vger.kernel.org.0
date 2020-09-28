Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5982227AC1B
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 12:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgI1Kml (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 06:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726590AbgI1KmE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Sep 2020 06:42:04 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13FA7C0613D3
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 03:42:04 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l15so4078250wmh.1
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 03:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zg75WLPDLUTD/dO6gE79rZ4YNo3MHudSB6Cl7I/Dq3Q=;
        b=ScYcOk2gYrPUF+aDftw5XnbeNkA0ruf2onhIh0ABlCuUjDkJDerZAn7q1QXNQ1RNrW
         B48J7+lPhjb4yeERjOnSs3arx8Mrld4olbl9cBlF+e7u8ecfH6qBSVCue/4dr6a6ddQE
         cvWP19IelW8Gwd6omyP5cGFLQ1g7P8VSpQJanly6F+bAbfuto0XFUSVFjX8zffy5XwaQ
         5ent6yYRAXC+tM/uhwc+/7Ya5fSsB4HcC2s5SOr1hiirYTzh+y6CXBgoZDyAkNLdpoP2
         N/xUrI8qDX3nd2aJ9j6OWgBuf1753b7p7OJRE6tLuwIKDccOp7tT28qQOSxWdCyP+9qd
         up9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zg75WLPDLUTD/dO6gE79rZ4YNo3MHudSB6Cl7I/Dq3Q=;
        b=rTM1EOra+a6EQsY18F6rInaImWwmuiK19FOU/YXFEb01HOw5WH34dW9gFG5NYbwpsw
         DWvXzNaveNquiJIC7WeCRf1P3IM2M3SOfc4ttBQpM4DISWa7EDLS5YHuIh+mvACim5Oo
         gTJh6YZs7nxslR4rReS0ETu28mx3M/KY8PctcX9k1603qi2o5lR8E7n6/b+V59w7JRaC
         1jG59iW4OlPaagl1JBT+0ZS9JGKTbc8X45AsEUbWmH+X+wlm3LTP0V3UhB38YJN35xjt
         yfo7fZuKxgD1Y6wfyAfKkWFCYbqixLOnxClJO3TSiYmIzUvTlJB7ALF37E9Yzl4RhSHc
         eQIg==
X-Gm-Message-State: AOAM530NJf4v+29Aowdo1Amwpd3xrxPhs2bJhNzqiC5ouglkqz8o2pwx
        2CFkclFszQ6GvDBn5NfQysGXlQ==
X-Google-Smtp-Source: ABdhPJxnb9lRsJOBi124nd5PEFi5RPTF9+iWsUyLiJLnsQi4cRUlKeW5N7Q2dB1SEdnBlCLzwXmR5g==
X-Received: by 2002:a1c:2903:: with SMTP id p3mr986048wmp.170.1601289722823;
        Mon, 28 Sep 2020 03:42:02 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id f14sm939258wrt.53.2020.09.28.03.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 03:42:02 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 3/9] gpio: mockup: drop unneeded includes
Date:   Mon, 28 Sep 2020 12:41:49 +0200
Message-Id: <20200928104155.7385-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200928104155.7385-1-brgl@bgdev.pl>
References: <20200928104155.7385-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This module doesn't need gpio/consumer.h - it's a provider. It also
doesn't use any symbols from init.h so let's remove both includes.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-mockup.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 1652897fdf90..c5092773afd8 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -8,9 +8,7 @@
  */
 
 #include <linux/debugfs.h>
-#include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
-#include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irq_sim.h>
-- 
2.26.1

