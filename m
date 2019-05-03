Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9981113615
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2019 01:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbfECXUg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 May 2019 19:20:36 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41363 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbfECXUg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 May 2019 19:20:36 -0400
Received: by mail-lj1-f195.google.com with SMTP id k8so6537629lja.8
        for <linux-gpio@vger.kernel.org>; Fri, 03 May 2019 16:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OK5m9Cm+xqBfZ44Cyga28760Sdb3iwEFSEr+ygWKg7U=;
        b=rL7RJVIBUhs2AdbiNVGZze5zull8Coo79gMzUTRL0lVRRctqV9jVwk7mRRs9VOqS3a
         HXadrXXdgMPedF6sp0tKj7qTlTEViTsjxYN5qGHwYEXm8meeHKh7OR6qJC3IRvARgMkK
         xrNDAOU0p4PRNlPEHQz+brbgXbZF8fmB6UOhQpC7XyqjhVX8nPvIw58cNvwNd7rvdYuA
         ZtRe++8hA96PFbYGyXMOr/mQ9AOneu696yVU0SRl1tJuX6D59DS856+KBVr5hgWXFwko
         qjnxJRbtUT8v0mr/C1qw28ALIOdwRfkmLAkdByBJm5VF7mm4Lsugdv7GlfNP7c9YeGp1
         KlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OK5m9Cm+xqBfZ44Cyga28760Sdb3iwEFSEr+ygWKg7U=;
        b=auo4SeB97tGCKIF3d3hU7Pp/dlgI/yI9LXij3yVcS2iGr1TOTCDtdhOmDxrCnmvxWF
         bzuiJpd0OI7ZVsIGaFeG5OxMzcrfinUZQydvOAfe9QQmw4Zaf+4eaZ2VJvDiivRU+eQ8
         2dJaUnjGNbybx9PUJlKi9z57WngVuxSOOZ8MlwM5JzzxApajG8h6+NcjZncU9Xsaaa41
         SdSMswU9YHQW+3aruumqXcABxRVnhvJaCTpghvftofqi6W+kO+MEPRZXS7l0c7vfZj5/
         Z0635Ik0G+9aljXeSOixe760rjijHOTJ2a7q14n5K2i64TRZsRfj5/cNIVAfq7ZnSR5f
         4K4Q==
X-Gm-Message-State: APjAAAUFfKRUhjBbUhnpMoFe4QfP+MTzSu7VxCEpDfTU8xW10XkFHOTg
        lwuUs1zO+9KY8Mkv0cCcpU0KgQ==
X-Google-Smtp-Source: APXvYqwLyiQb6ULEsADXURyxHy7G4e4SeR5cyeXbGeusD3xdAZrq/YN7PPbN+oebJkilhYAvmpQE7Q==
X-Received: by 2002:a05:651c:111:: with SMTP id a17mr6341289ljb.195.1556925634581;
        Fri, 03 May 2019 16:20:34 -0700 (PDT)
Received: from localhost.localdomain (c-d2cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.210])
        by smtp.gmail.com with ESMTPSA id t8sm622511ljc.25.2019.05.03.16.20.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 May 2019 16:20:33 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] spi: ep93xx: Drop unused variable
Date:   Sat,  4 May 2019 01:18:29 +0200
Message-Id: <20190503231829.4112-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

My previous patch leaves a dangling variable in the driver.
get rid of it.

Fixes: 06a391b1621e ("spi: ep93xx: Convert to use CS GPIO descriptors")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/spi/spi-ep93xx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/spi-ep93xx.c b/drivers/spi/spi-ep93xx.c
index 47e39251bad9..81889389280b 100644
--- a/drivers/spi/spi-ep93xx.c
+++ b/drivers/spi/spi-ep93xx.c
@@ -651,7 +651,6 @@ static int ep93xx_spi_probe(struct platform_device *pdev)
 	struct resource *res;
 	int irq;
 	int error;
-	int i;
 
 	info = dev_get_platdata(&pdev->dev);
 	if (!info) {
-- 
2.20.1

