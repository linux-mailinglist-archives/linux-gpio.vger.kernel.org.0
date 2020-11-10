Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9602AD980
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 15:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730980AbgKJO4K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 09:56:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731269AbgKJO4H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 09:56:07 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C575C0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:56:07 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id a65so3278363wme.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t/9DP21Y/K7Z/VraeZB1byIXgPmUm3+JNNTaYKuJoag=;
        b=yCgj1oxmbWVJO6aVvwgbnT+plK9gHErnJySsC0rvLE93LMEFpncao3WCRK2Vup/Ftp
         EvrQK5aOtyaqccw82bjKKT0By1YBbO6mB2VIUCHAs1BbXmyAlUn7ZNr5rYeSkQPOoA2g
         HLnjsndjEM2rY7DKAdnMVkgmpOUSzOsEVMsrr00Sq5MfBYkn29umHdi7QLVBeUWLlzJh
         AcX1onVuBbUB7J66a6ZCYYynMVjHjNWINKWUBDoPAPe0xKULJ/5USryuRpPm/r7V8OKC
         gonR75UmoEROFpEIYWd867tsCTBgFsPGlbv7w/XO8HO33JKkV1F4f489NxT8OFiHWdSm
         Wk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t/9DP21Y/K7Z/VraeZB1byIXgPmUm3+JNNTaYKuJoag=;
        b=JmtM2UaG+X3Gh+7KfuSb6p1pgVAojuJiywxL3sLUDk9vB9bJT0hOBVJdS1+KDTG+//
         OxiqI05G7TQHwtnBdcb4mIfIgiaJu3L85j04+S6VD5yv7epYDyv13bbhwaSFF7+dZjMq
         60yPLTr7am57q7vPs2EsSKSDFAyMvn+U6k34U1k5SjKTHrMA7MjLaFyfMWxrlYgtknEy
         TZhPmc+s+uStdmrAeXnpFLG2ft/QNkk7OInTGVNYBE31PdNV0zFJvDHJ7yiJVHFw+edp
         afz5KxaFoReykbDcYxiMzDfP0pPKs5oXt0+RAkRzbn4UGvmaFEsDjvjA4J2YtpvstIfB
         GLFA==
X-Gm-Message-State: AOAM533ftiI4C7fUfkYIynfuwYmgunxW8GBs99SjnVJNf0S3Sa7zkktQ
        qPwc+2bDThwBqkH5MUeWRvfAU1HzpktMpQ==
X-Google-Smtp-Source: ABdhPJzM0Wppb5vLfoZiyRJDDDkhJ0pmMKa0I+sNKbEvWvqYYWvGmSu7oNwQqM1QJgr9I+msZ4mQWQ==
X-Received: by 2002:a1c:dc43:: with SMTP id t64mr24205wmg.93.1605020165987;
        Tue, 10 Nov 2020 06:56:05 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id f17sm3261827wmf.41.2020.11.10.06.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 06:56:05 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 2/7] gpio: exar: include idr.h
Date:   Tue, 10 Nov 2020 15:55:47 +0100
Message-Id: <20201110145552.23024-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201110145552.23024-1-brgl@bgdev.pl>
References: <20201110145552.23024-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This driver uses IDA APIs but doesn't include the relevant header. This
fixes it.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-exar.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index 4202dd363a11..1941ae533418 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -8,6 +8,7 @@
 #include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/gpio/driver.h>
+#include <linux/idr.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.29.1

