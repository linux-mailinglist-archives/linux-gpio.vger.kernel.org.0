Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBDECA1D03
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2019 16:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727956AbfH2OiQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Aug 2019 10:38:16 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38841 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727986AbfH2OiP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Aug 2019 10:38:15 -0400
Received: by mail-wm1-f67.google.com with SMTP id o184so4136838wme.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Aug 2019 07:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wvm5jhfZdBAjiVI0fMQa3wyfT8pVsOoRMdM2UQ5EVAc=;
        b=Gn5aTJaW0lhbDQWyYFqDBkrdNnFy2pGrPIg9uFcSU0QDrKLANwjVThGZPuAKLE95y6
         PXgyzsxKFqZzbh35PUrCyLRVoJ6/TM5gO3zvjyXoIGe2F+a44h45x4ntyUH2R9K/8cer
         BeLiukfqMO5AwUsbhhH+vawbOADQgyod20IzadiyA9ufUf4775gkItruHuFcBiZ+BFVO
         OfDktx/jfQqMWmlIB0pvioN4mmJ2KnMbs3Z4fCMXu7cQr+0MgZ6j1tz2YEHxpUare8iy
         RpQ8bZzMq7EY7hZuuUVYJ0ULMsjbZIwfeG16WX1G2RrY2rGVkY5CnetDJwPeb1Lms6T5
         VNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wvm5jhfZdBAjiVI0fMQa3wyfT8pVsOoRMdM2UQ5EVAc=;
        b=C9c1i0yOCNGLYYL4rySv42nAvtIGaF8VJuVnzhTOXGEts1Bp4yNv7Fiv1rHFqWjb+G
         wikq+tOusTVBHFVQ8b1IWKwFCWC46E7Zp6dBEy5Of4ynLFEj5jbwlzbWzUSveyDbb/oj
         KYYf4ytS3PWuNCCk6fO/RyXB8GthYL7g280kpT85K9iTbwXKMMwRQMrivUKI1v+QSI/W
         tz3EEwB+ROc/pWZYOWjShzcLnbg7grsnDiCLyPmHDuM/eRT3f0L9o2X4W5yv5eyf+Z6T
         /vZQPl5bezITD7NcN/iFCDnd1z4ogvjRQv6E53eFetgFCyyvFOKqcHmkNyJbZEvtcVDF
         k3aA==
X-Gm-Message-State: APjAAAWH4qgS245qx5819ikLdO5I3+exLvJ7fFKL9xBIanms05G9kGFf
        04nX1/3ED4HQX7h3NR6M0afR3A==
X-Google-Smtp-Source: APXvYqyIGe38MXQx8iatCV54dE9UCR5qWcasMJ6961l0x1sY1UGN6+ZmbFEIsoWLeRqF7iEbp26wzA==
X-Received: by 2002:a7b:cbce:: with SMTP id n14mr11150614wmi.47.1567089493399;
        Thu, 29 Aug 2019 07:38:13 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id g15sm3241925wrp.29.2019.08.29.07.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 07:38:12 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Alban Bedel <albeu@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 9/9] misc: sram: use devm_platform_ioremap_resource_wc()
Date:   Thu, 29 Aug 2019 16:37:42 +0200
Message-Id: <20190829143742.24726-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829143742.24726-1-brgl@bgdev.pl>
References: <20190829143742.24726-1-brgl@bgdev.pl>
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
2.21.0

