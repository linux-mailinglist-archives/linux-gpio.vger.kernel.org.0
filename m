Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42FC0DFFD4
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2019 10:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388618AbfJVInw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Oct 2019 04:43:52 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35520 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388518AbfJVIn3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Oct 2019 04:43:29 -0400
Received: by mail-wm1-f65.google.com with SMTP id 14so8631201wmu.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2019 01:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lF0rxmNWyqU1JeqNwoctp95mlhu+5uGfp5ZbeCzqTpo=;
        b=N+EZgZF8RQP5/8GqOnG3JYNlg3vedBnTgEWesw5+MnrBsb0HMrss3o+obg9jmM3hi+
         JXazfzwRpHztMHjSymlPadeAkotn0I5y3bD6/akHpBFxgp6o1iJXM+FpZLaAn1IM4a6X
         7KpyUpaSPIr64+24miNqMyZfyxQqt8PHIEGs+mUOU2sH6WwGrQ8qDsfacOCHGeAOXTsd
         TVlF5wpAyHuWshufzjRmJDYHwkzTvwy9aCn/Luazg9uhP5T0WpXn6OfTB7+biPvzpbxV
         nlSRtGDKaZROzrEelkFmzhrr6K+OnBDzB2ZWHbl0BemOjuAyLkdrf1z3w/a8T4a8aNPl
         zhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lF0rxmNWyqU1JeqNwoctp95mlhu+5uGfp5ZbeCzqTpo=;
        b=DOxMpX8tyz+mHh5nUB/6os7v9OgyISD+AUDA4lUQEZrLLiTPRgI/D11TZK+gmajvlV
         5CNVSFY4i5ZYEbF1f01pjH9UzXLhdG0gdFZwvGMKrFOijGsUYb4Ud9Ao6bJLpkTJl1Xi
         J8tDRdQdTYPkeRfxMZjfkL5g6yV/zcoCrRtb6Xqh8ghpFDfalflnDz53k6m0Cdwzw/i0
         DC2JUZRYMYPXgQQlTnAcZ3FA6TvaFhNuFaTTqunV0SICloDuk4nzzpVxwSHw5pswkyEo
         u+uiwGiSv+d2HqWVm/nMcRSvKhxgLM+GBYyUqsjLa6sIUXlOCOiZnVjCJoKLVVjf1Zdd
         XjRw==
X-Gm-Message-State: APjAAAXzJTDEur4cb/oxbWS6+1TMf56SVuBhuwXykMWdUl2skEXdeyVH
        5bDvseHw4DNA5ywcuojpdMBckg==
X-Google-Smtp-Source: APXvYqztDYYsnFdiDGD+fiyY6ct9bi/pTDXqTQExcOzyynd+wJCuOrmecP003ynHnveZyqfhkGb9ng==
X-Received: by 2002:a1c:7e57:: with SMTP id z84mr1960221wmc.84.1571733808309;
        Tue, 22 Oct 2019 01:43:28 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id q25sm477231wra.3.2019.10.22.01.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 01:43:27 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [RESEND PATCH v3 5/8] misc: sram: use devm_platform_ioremap_resource_wc()
Date:   Tue, 22 Oct 2019 10:43:15 +0200
Message-Id: <20191022084318.22256-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022084318.22256-1-brgl@bgdev.pl>
References: <20191022084318.22256-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the new devm_platform_ioremap_resource_wc() helper instead of
devm_ioremap_wc() combinded with a call to platform_get_resource().
Also use devm_platform_ioremap_resource() where applicable.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/misc/sram.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
index f30448bf3a63..6c1a23cb3e8c 100644
--- a/drivers/misc/sram.c
+++ b/drivers/misc/sram.c
@@ -340,8 +340,6 @@ static const struct of_device_id sram_dt_ids[] = {
 static int sram_probe(struct platform_device *pdev)
 {
 	struct sram_dev *sram;
-	struct resource *res;
-	size_t size;
 	int ret;
 	int (*init_func)(void);
 
@@ -351,25 +349,14 @@ static int sram_probe(struct platform_device *pdev)
 
 	sram->dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(sram->dev, "found no memory resource\n");
-		return -EINVAL;
-	}
-
-	size = resource_size(res);
-
-	if (!devm_request_mem_region(sram->dev, res->start, size, pdev->name)) {
-		dev_err(sram->dev, "could not request region for resource\n");
-		return -EBUSY;
-	}
-
 	if (of_property_read_bool(pdev->dev.of_node, "no-memory-wc"))
-		sram->virt_base = devm_ioremap(sram->dev, res->start, size);
+		sram->virt_base = devm_platform_ioremap_resource(pdev, 0);
 	else
-		sram->virt_base = devm_ioremap_wc(sram->dev, res->start, size);
-	if (!sram->virt_base)
-		return -ENOMEM;
+		sram->virt_base = devm_platform_ioremap_resource_wc(pdev, 0);
+	if (IS_ERR(sram->virt_base)) {
+		dev_err(&pdev->dev, "could not map SRAM registers\n");
+		return PTR_ERR(sram->virt_base);
+	}
 
 	sram->pool = devm_gen_pool_create(sram->dev, ilog2(SRAM_GRANULARITY),
 					  NUMA_NO_NODE, NULL);
@@ -382,7 +369,8 @@ static int sram_probe(struct platform_device *pdev)
 	else
 		clk_prepare_enable(sram->clk);
 
-	ret = sram_reserve_regions(sram, res);
+	ret = sram_reserve_regions(sram,
+			platform_get_resource(pdev, IORESOURCE_MEM, 0));
 	if (ret)
 		goto err_disable_clk;
 
-- 
2.23.0

