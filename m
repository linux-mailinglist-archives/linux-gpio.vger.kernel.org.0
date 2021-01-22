Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79AA8300C65
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 20:23:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729284AbhAVTWD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 14:22:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728931AbhAVTAS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 14:00:18 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498ACC061788;
        Fri, 22 Jan 2021 10:59:33 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id f11so7696336ljm.8;
        Fri, 22 Jan 2021 10:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ohGFiXHYHoTonBgXCTi8H38fPiR4kxhD0+dqMp2Wuxs=;
        b=Sl5Bmy/whDelcTQo7BO1xlfxmw6kEcYt3iREEv+lw16mkKg6m3S+yZ63rPpLgiKkL2
         U0GYQGKSKOVz+0v4/qPJo0WMqbjQBxkKzfnPix3Pz7d7cTESMr4lnSyOSSN/kUXHamJ0
         b/bvFvFcfc9x3fKo4gPXBf0dinETePRXflDuw91Z9+eF9fA+CvFX0vYQ+CssEBegnUVh
         ln+RaxUhcYQuAvJM2VtGrXMFF2TxObeS5yv/jlHksL8CPYIvunNcm/RDRVdM67e0P4Ft
         zLfPe9IyXjf3DqovYsdT91GHL7Wt3+NXii3CmlBOKYO5c6QI0/j7IsxH41wZ5gRsGii7
         H+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ohGFiXHYHoTonBgXCTi8H38fPiR4kxhD0+dqMp2Wuxs=;
        b=l+BREk+u5IfNl0lqnVRtOxF+30NN6SLbsrCerj3KBlgycSCqexHBTvv7SPQki/VE14
         CSXGAoqhBOCl/sACm9WuicftPpuvgO7jp+NRf4dpFgadym96MqWe7ZhTSseWLMUemaSA
         Kw7okAWV9fXgldAG4SXpppM9riwshXyRQWdkzNbvVVVUVh/LR0f1XFt+QU6EyQW6C588
         Z3nyfDt3eiYLYAt3QUUJLAnxEtkC4v+tj8Ss63iHpDUBfYLXGoJqfyKFKY9HHcZj/7yK
         GRnd2wCGTTOXvhPGcRRyLcV6b9mIQi/K2fPoJn5kFQaYlPyCXdVW83zJy56OF2jOaMhu
         iP8A==
X-Gm-Message-State: AOAM532IhVO2ffuNcIuYiPhaBffc18OEjXIQ8OFPFgOpF5KMwNtmNHM+
        4AS/45kU1ruAwunLksy153o=
X-Google-Smtp-Source: ABdhPJwyqsPT02bv5GCgIRPJ/swOskozutRVMKsDZpT6MjF6G7odbMvIZKvIWF7QcAaNnNJnSvtIDw==
X-Received: by 2002:a05:651c:282:: with SMTP id b2mr1575237ljo.52.1611341971885;
        Fri, 22 Jan 2021 10:59:31 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id 19sm994783lft.90.2021.01.22.10.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 10:59:31 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] gpio: tegra: Use debugfs_create_devm_seqfile()
Date:   Fri, 22 Jan 2021 21:55:41 +0300
Message-Id: <20210122185543.16554-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122185543.16554-1-digetx@gmail.com>
References: <20210122185543.16554-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use resource-managed variant of debugfs_create_file(0444) to prepare code
for the modularization of the driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-tegra.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 9a43129313fa..06f033375e40 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -605,7 +605,7 @@ static void tegra_gpio_irq_release_resources(struct irq_data *d)
 
 static int tegra_dbg_gpio_show(struct seq_file *s, void *unused)
 {
-	struct tegra_gpio_info *tgi = s->private;
+	struct tegra_gpio_info *tgi = dev_get_drvdata(s->private);
 	unsigned int i, j;
 
 	for (i = 0; i < tgi->bank_count; i++) {
@@ -627,12 +627,10 @@ static int tegra_dbg_gpio_show(struct seq_file *s, void *unused)
 	return 0;
 }
 
-DEFINE_SHOW_ATTRIBUTE(tegra_dbg_gpio);
-
 static void tegra_gpio_debuginit(struct tegra_gpio_info *tgi)
 {
-	debugfs_create_file("tegra_gpio", 0444, NULL, tgi,
-			    &tegra_dbg_gpio_fops);
+	debugfs_create_devm_seqfile(tgi->dev, "tegra_gpio", NULL,
+				    tegra_dbg_gpio_show);
 }
 
 #else
-- 
2.29.2

