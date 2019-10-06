Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08468CCED1
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2019 07:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbfJFFj5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Oct 2019 01:39:57 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41890 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbfJFFjo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Oct 2019 01:39:44 -0400
Received: by mail-pg1-f193.google.com with SMTP id t3so318716pga.8
        for <linux-gpio@vger.kernel.org>; Sat, 05 Oct 2019 22:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S1RoqAjzF3G4A46AecyEHP/0DwVF1CG1yV8jnN1Ft9k=;
        b=hyFNBkwR6pg4p2eP93SG+NV9NB6qex5OhttYUFQQ6YYwbqNCH7zkzB5piC0+tBTw48
         F58jCN/ZpyGGindrO/Wc0hhpOxNWsEYHQAz9mj/oIXSdGHZbn4NQaqjSsmOs//W6DBQd
         f+uDQ9TgGa/BNGOArhl170R7Wi/pIINMsXlu773pSyTG3QprqAU8PFA70O8EVEWdD7fP
         hyHe+sLP/XXL+NRZkXXP+ck2ECaN0PxD8kWPDu5jMuWtIh+D7FcvJ4nvp9xmRQO1L65l
         H4k9qxbUB7dTVWG4yk1nRknlTy/l6eW5frqYnukesY4vFAv5UkT54+0LptcnfywUiaIu
         NxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S1RoqAjzF3G4A46AecyEHP/0DwVF1CG1yV8jnN1Ft9k=;
        b=XLIOvO59Nj9G1sYAkHPxr3sykrNtUmlVYAKGqDspAE96dOFCz32/CWONolUtZCkK41
         3QeWuD6g/kvHxs5f44lLLZZWEyuJXBYQ+G/rcJKc1wK4GKoqEwZZqEjo/N1eHROeIZ2Z
         zAtkZrXt+jN7JPdMLi4PgN92dIjvFWp07Wqqmrt/0QgRWYGRITiwFSZ+EQwrE2KLo8or
         j7qx2sE9PS6U/NEySUvW+8VsDATeLSxcFR/pX7j6Bclq9e0WVPGgVapYv/fSnz08+QV9
         bMqOpPrBru7SGzMRF0/QvwUxUpNxhPUQi2uqBSgkGthVWovKDjCM6J3A837gYGdvA7a9
         k3Hg==
X-Gm-Message-State: APjAAAW24iBJQd388Y0mlS9y0AR//luk2d9zL94u+A6wCaFtPu+cu0CX
        Eyl3szHLp4qoerNtH/dQVSWFQA==
X-Google-Smtp-Source: APXvYqzHcMrU1J/wYWP4lNtuoIic5NFXBS/1cEIovdr3sk+TlnhzhcSpbI9EoYFtfyNFlucLPo5HTg==
X-Received: by 2002:a62:583:: with SMTP id 125mr27004540pff.69.1570340382559;
        Sat, 05 Oct 2019 22:39:42 -0700 (PDT)
Received: from debian-brgl.local (50-255-47-209-static.hfc.comcastbusiness.net. [50.255.47.209])
        by smtp.gmail.com with ESMTPSA id q30sm10019320pja.18.2019.10.05.22.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2019 22:39:42 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 5/8] misc: sram: use devm_platform_ioremap_resource_wc()
Date:   Sun,  6 Oct 2019 07:39:13 +0200
Message-Id: <20191006053916.8849-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191006053916.8849-1-brgl@bgdev.pl>
References: <20191006053916.8849-1-brgl@bgdev.pl>
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
2.23.0

