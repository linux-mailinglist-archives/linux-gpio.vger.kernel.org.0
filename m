Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2F1C298F08
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 15:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1781112AbgJZOS4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 10:18:56 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37462 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1780407AbgJZOSz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 10:18:55 -0400
Received: by mail-wm1-f68.google.com with SMTP id c16so12657916wmd.2
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2020 07:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lQQN2ZXT/G4B3VsGNJyIkmXWhvmT1sWJqpvE2SPt6Is=;
        b=ZxnMHYSFOUulXDxL+4xjW3ZbztSXxsofF2iOprGDW7au+9/inxzprjpawGC8XE5PDp
         hL0LG/mBPxWfBER19aTZEmmOKKjE/5tAnzRdPbffZF8IR5pmnhLpifusoSDz0dFYPSKg
         ysXESusFqBEruE/EOvEPPKCMNdG8HnHRt4gR4EfE1LX6Ej8PRy8eMuKL0mzbCUlR3xMR
         iofrd6NHXXQcaEn85CFUYR0sNsR99BVyVKFsQa41iiEYrREjtoqV+Z0QNbTeNiZUjKJ3
         vwYJKRDCw+IyM8LKQ2eMoPBUlXnqPJ7Kixg7NcWxyQcLfKavbmKydOUBIhIIYOUyk05g
         UZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lQQN2ZXT/G4B3VsGNJyIkmXWhvmT1sWJqpvE2SPt6Is=;
        b=Y/Mfpnj7EHyMr+jSGahSFViobJeF/YQW3jK9qV6BompdrhhFA5+yT9Lyc5B64Uth+R
         lHwFSO9ryQzaXqs1RndII3W/jAHaFdS6gu4ieTVIP1JQaPoZMcC/HtUQX9o/MQ6gXQIi
         BYIC2YpwQNfaRwOVSNwFQ9NSggomKNYQ/aGa3Flhx+c5zTS/AAmd2kls965nCu0ljS1c
         UMVjM5apg03af+MT9X1tXzOF1/o9vNztocbbKnNheOSRq1Hqj//CRXhsEB96mPv3NVnj
         ONuJOcqCph4RMapsnosdmPWFV0hrZ+D+eY0bWBjrbyTQBSsAn/IN8KCrEBL0R1W4NJaF
         gi9A==
X-Gm-Message-State: AOAM533fD1uGPSggnAgJhrJn93BLGKYrpU/cKO5/wFZHA7GgbiRAG1Rv
        lXYNfzfSRvLjbm6Y0beMmfbA3A==
X-Google-Smtp-Source: ABdhPJw3ILVPqzXaP0J4qthEjWOqza5rXxTayT7WtRhNfox/0YLIDsOSTBnt3lwxo2tpWHWEz1QIuA==
X-Received: by 2002:a1c:99d3:: with SMTP id b202mr11193600wme.0.1603721932973;
        Mon, 26 Oct 2020 07:18:52 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id e15sm21920841wro.13.2020.10.26.07.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 07:18:52 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 3/7] gpio: exar: switch to a simpler IDA interface
Date:   Mon, 26 Oct 2020 15:18:35 +0100
Message-Id: <20201026141839.28536-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201026141839.28536-1-brgl@bgdev.pl>
References: <20201026141839.28536-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We don't need to specify any ranges when allocating IDs so we can switch
to ida_alloc() and ida_free() instead of the ida_simple_ counterparts.

ida_simple_get(ida, 0, 0, gfp) is equivalent to
ida_alloc_range(ida, 0, UINT_MAX, gfp) which is equivalent to
ida_alloc(ida, gfp). Note: IDR will never actually allocate an ID
larger than INT_MAX.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-exar.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index 1941ae533418..752e8437ff80 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -149,7 +149,7 @@ static int gpio_exar_probe(struct platform_device *pdev)
 
 	mutex_init(&exar_gpio->lock);
 
-	index = ida_simple_get(&ida_index, 0, 0, GFP_KERNEL);
+	index = ida_alloc(&ida_index, GFP_KERNEL);
 	if (index < 0) {
 		ret = index;
 		goto err_mutex_destroy;
@@ -179,7 +179,7 @@ static int gpio_exar_probe(struct platform_device *pdev)
 	return 0;
 
 err_destroy:
-	ida_simple_remove(&ida_index, index);
+	ida_free(&ida_index, index);
 err_mutex_destroy:
 	mutex_destroy(&exar_gpio->lock);
 	return ret;
@@ -189,7 +189,7 @@ static int gpio_exar_remove(struct platform_device *pdev)
 {
 	struct exar_gpio_chip *exar_gpio = platform_get_drvdata(pdev);
 
-	ida_simple_remove(&ida_index, exar_gpio->index);
+	ida_free(&ida_index, exar_gpio->index);
 	mutex_destroy(&exar_gpio->lock);
 
 	return 0;
-- 
2.29.1

