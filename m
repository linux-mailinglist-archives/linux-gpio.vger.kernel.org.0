Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 663D432CB00
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 04:45:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232880AbhCDDoI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 22:44:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232941AbhCDDn6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 22:43:58 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03DFBC0613E0
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 19:42:29 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id g4so18022986pgj.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Mar 2021 19:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7dD8l0mb5sDAQVSmMBFA7qaeWU8j70zeIRTlsOReUoY=;
        b=jYfGthLTJ7UnILPrxfDEyfnuE3YVIbtrs4TNr4n7KhPBnuOYoyhBb4oiNyDV5lgLtn
         kIXILi9nTZRmwnDodUzJYN+g+MBqQhE5ojBa0Az2OjPjNRuZX2rBLyBQ6bXYza6yRPJY
         fLxnyo9gvJUCSSAK6AhOckx0uaPaQE7j4uS+g/1p0K2KJbNnrLsmcgU6NO2f7K343Z/X
         xXfjIIRxMioez9qZQ6lyq6a47YThOFjp6gjQKA/7gBs6k7Nr3IEtlSf5eb/9Y+nptHO/
         gGISGy3FX7Gf3yblt8t1xj/j8oe52f0NO8ix3llxy8u7wOHu6UyHDNdvGoWxQIOO2+5H
         Rp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7dD8l0mb5sDAQVSmMBFA7qaeWU8j70zeIRTlsOReUoY=;
        b=Cuw6TEpmXSA9p9ymIGXrT6ixBAMNjqDYFcXW85UYGvvHuaIDHDfuzRhuV/SY0q9ddt
         EfZzbkjlHz+AdYEq9hGyEghNgpXBIYNMpr9Bu9aoPQoZW+J0WSeVFr57W1XsxQkWGfwp
         6v3Nhdr3IO2F97oE+iDjUrDOyLAAu8Pwbp6aHHfN08Oumx+gmGbDr/Gx1BDqbxPc6tJ3
         ySj0YdOQ6JhZQvu5GMxIWrpw7yjt0I8FAyRQAx0yry3RDrllZZnZYItxuaR+9l6wB/wg
         PRGZgd9Pl3xx9E5IRWIGn5OsaZ4QmRw11yli4MCigmxpfSDmr4hB6S+0KgUqa30M8idY
         nnDw==
X-Gm-Message-State: AOAM533RmiopzPAQaFz0rUTJdwlkBajAnd+WrrSOAlbGhzwdnenSRPR9
        PKPTqn0qdMso5kqtVQeBvPXasA==
X-Google-Smtp-Source: ABdhPJxc0749oEr4+QpvMEe4o0sa6qqQ6vfJQgl2a6HS1YjYrOhOFYJiFGgUZDGQH7Y7v+jcIV/3QQ==
X-Received: by 2002:aa7:9d91:0:b029:1ed:e15b:631d with SMTP id f17-20020aa79d910000b02901ede15b631dmr1980685pfq.72.1614829347628;
        Wed, 03 Mar 2021 19:42:27 -0800 (PST)
Received: from platform-dev1.pensando.io ([12.226.153.42])
        by smtp.gmail.com with ESMTPSA id h17sm2403989pfc.211.2021.03.03.19.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 19:42:27 -0800 (PST)
From:   Brad Larson <brad@pensando.io>
To:     linux-arm-kernel@lists.infradead.org
Cc:     arnd@arndb.de, linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        broonie@kernel.org, fancer.lancer@gmail.com,
        adrian.hunter@intel.com, ulf.hansson@linaro.org, olof@lixom.net,
        brad@pensando.io, linux-gpio@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] spi: dw: Add support for Pensando Elba SoC SPI
Date:   Wed,  3 Mar 2021 19:41:36 -0800
Message-Id: <20210304034141.7062-4-brad@pensando.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210304034141.7062-1-brad@pensando.io>
References: <20210304034141.7062-1-brad@pensando.io>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Pensando Elba SoC uses a GPIO based chip select
for two DW SPI busses with each bus having two
chip selects.

Signed-off-by: Brad Larson <brad@pensando.io>
---
 drivers/spi/spi-dw-mmio.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
index 17c06039a74d..417bd2125c07 100644
--- a/drivers/spi/spi-dw-mmio.c
+++ b/drivers/spi/spi-dw-mmio.c
@@ -56,7 +56,7 @@ struct dw_spi_mscc {
 /*
  * The Designware SPI controller (referred to as master in the documentation)
  * automatically deasserts chip select when the tx fifo is empty. The chip
- * selects then needs to be either driven as GPIOs or, for the first 4 using the
+ * selects then needs to be either driven as GPIOs or, for the first 4 using
  * the SPI boot controller registers. the final chip select is an OR gate
  * between the Designware SPI controller and the SPI boot controller.
  */
@@ -237,6 +237,38 @@ static int dw_spi_canaan_k210_init(struct platform_device *pdev,
 	return 0;
 }
 
+static void dw_spi_elba_set_cs(struct spi_device *spi, bool enable)
+{
+	struct dw_spi *dws = spi_master_get_devdata(spi->master);
+
+	if (!enable) {
+		if (spi->cs_gpiod) {
+			/*
+			 * Using a GPIO-based chip-select, the DW SPI
+			 * controller still needs its own CS bit selected
+			 * to start the serial engine.  On Elba the specific
+			 * CS doesn't matter, so use CS0.
+			 */
+			dw_writel(dws, DW_SPI_SER, BIT(0));
+		} else {
+			/*
+			 * Using the intrinsic DW chip-select; set the
+			 * appropriate CS.
+			 */
+			dw_writel(dws, DW_SPI_SER, BIT(spi->chip_select));
+		}
+	} else
+		dw_writel(dws, DW_SPI_SER, 0);
+}
+
+static int dw_spi_elba_init(struct platform_device *pdev,
+			    struct dw_spi_mmio *dwsmmio)
+{
+	dwsmmio->dws.set_cs = dw_spi_elba_set_cs;
+
+	return 0;
+}
+
 static int dw_spi_mmio_probe(struct platform_device *pdev)
 {
 	int (*init_func)(struct platform_device *pdev,
@@ -351,6 +383,7 @@ static const struct of_device_id dw_spi_mmio_of_match[] = {
 	{ .compatible = "intel,keembay-ssi", .data = dw_spi_keembay_init},
 	{ .compatible = "microchip,sparx5-spi", dw_spi_mscc_sparx5_init},
 	{ .compatible = "canaan,k210-spi", dw_spi_canaan_k210_init},
+	{ .compatible = "pensando,elba-spi", .data = dw_spi_elba_init },
 	{ /* end of table */}
 };
 MODULE_DEVICE_TABLE(of, dw_spi_mmio_of_match);
-- 
2.17.1

