Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E19DE2B4174
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 11:45:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729213AbgKPKmv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 05:42:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727282AbgKPKmu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2020 05:42:50 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79E11C0613D2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 02:42:50 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id r17so18164332wrw.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 02:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5he8TNmm5mbVIm4qwCj0n+AT880D6huUC6HghVpVCsk=;
        b=ssb1fPhw+AYT1ZEpimGiGnY8xzlxxsENO9CdyP0qEH0OgfCq5ZCi3hHmzsUTn+jVWO
         VVqnwUVUjfW8kbpFfrFaHic4ZALwBGjDXZ+pWbyAt9lzCyg1kRRRoXg8skKsoSqIUeF4
         MfmVX3vDSd7RUXU6HhigSUY9m31RSGLdMEWWK9Wxcd2tD4lvQfj4m9skPnf5dmF+mVsv
         sH5rWKfTUom2OepOXdqSPh+BQAeKYjcGWBSmK4ZKAO3vqEvlYWeorm/e9LgR8WAderXH
         elNM/Tw3pto06gkp0hCDUXStnDCjc5FiRkIkQWBAz4ee1G7PnLaERquDjoN/gUokJikG
         pkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5he8TNmm5mbVIm4qwCj0n+AT880D6huUC6HghVpVCsk=;
        b=XAo2DGScKhs1A5jLH4HVJqdX9XB8hyggRaOQqTNp4WoRFGcdqZVrvxHWl+DDZKUTlG
         vu5NXZfXKCZOVConJxO1YgRW8KwKo/TlPQDRnZFKbCIs8kpWcNWwzwfA0SkuysGhAjyI
         OtyLHS1+BWjaKao1/EbD06UewaEZa9BonYtPLhvwXqRJUQZF0rKjDpkUR6X1NcH24KMW
         kj57iE08Grx3lW13+Rq7EQnfUYXzQ6rWh4Z8GWQhNbkRtzHhlbpTR5Tq0whlos2lEPv6
         soAzYqIFfam8jAVcygOwnj/4pNTGw8j10W4ek3es+uI6Gmm/OonfdZPmgiLbaF70RHKV
         dL6g==
X-Gm-Message-State: AOAM53351+lznHGhnEoqra0UHavPq9MpQegDFyCQtSZ6C7omujPkSD5+
        wM54Hc4q2fmd2GdcRE0SUdagTw==
X-Google-Smtp-Source: ABdhPJyHLzn4LpWuQ4zkHXYmdFJsiI9j8LrsDeRga0DLxOWIOCgrd3dKRc+NSbh/JWeIrgucZEmioQ==
X-Received: by 2002:a5d:5643:: with SMTP id j3mr18033539wrw.43.1605523369284;
        Mon, 16 Nov 2020 02:42:49 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id v16sm20583283wml.33.2020.11.16.02.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 02:42:48 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 3/7] gpio: exar: switch to a simpler IDA interface
Date:   Mon, 16 Nov 2020 11:42:38 +0100
Message-Id: <20201116104242.19907-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201116104242.19907-1-brgl@bgdev.pl>
References: <20201116104242.19907-1-brgl@bgdev.pl>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

