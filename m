Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5991534C18E
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 04:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbhC2CAL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Mar 2021 22:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbhC2B7t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Mar 2021 21:59:49 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7F45C0613B2
        for <linux-gpio@vger.kernel.org>; Sun, 28 Mar 2021 18:59:48 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id j25so8891394pfe.2
        for <linux-gpio@vger.kernel.org>; Sun, 28 Mar 2021 18:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jzL4wAf/JEuHNxXJJeldkC8oZAN75IBXktG7WKUVTJQ=;
        b=QVO2DpN/ZNhiGgaDrXRsnZKtIhmWo2iLsYmbfxzyYywy5M50THoO4Wy+K87savMaNo
         8Q5h3StgJ39CA2acLnFqIJPSXf9Wn7yHiPRMdJ4L9z3IocsGK6SslBkrwcd/Q62eocWf
         a1WjkVeSsQeWJ/YYg5B2x7wktJkkgjJsSj53Tw9ccnBaVjAOL64ulxktJnQ6s0XumhLM
         6+2q+D7Qw1d00TdVPjzgPcRIw73tFq+idUQkw72ElBQn+HzsJ0Ju9+ikgG++hynhJo8z
         mGocgnPKGngb+siUHMlTwvQeeU7xAcAYxpQS4NPduTydvxXHPpqr6myuJU8c9RtZEsIB
         Uqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jzL4wAf/JEuHNxXJJeldkC8oZAN75IBXktG7WKUVTJQ=;
        b=ow44UmKsDmIYIF1Ce7ooEaQbjpj+Ram0ro22Z96JvVKktrKI0c8M/xXbI0HOxLm5NL
         HhZOqSo+eFfd0qzedpi9DLg8WRhapo6CcG0VR1J3mKLdy4tP3ClXV1YUdAj5v7s0rRMw
         QIO5IIOuLaj3wrYzdfFoMaPAwlXRVAlWjx/KwLDBE+R1PgXQeWzj6Cx1/DXO8tGKItpk
         4J4B5cf+K3zpcoHc1xO/FmH106SmJOhLt79DWwPyYHFIBtfIBp7MrALG/KBMJ8HKe0J9
         UPuU90enRbtQTZSC9/H00Nfy7MwnCdyiLEvno38LRdMTC/pwIAFpig96i++y0NTdMiyP
         t6WQ==
X-Gm-Message-State: AOAM533x5/mrXnlegQZEXOLnRiFZdvUisRXOiU5QeUnUPuo6Dtz8XqYB
        8cl2+wE+MvirgZiUNsDWOQZYUQ==
X-Google-Smtp-Source: ABdhPJxWn+mrLsvMwHqEoEq/Dz3B6oSSzwrNyCrjMBbbLg3zgg93fDeGEt9/bqgjfnIU4E7wnhNFPw==
X-Received: by 2002:a63:c02:: with SMTP id b2mr22045085pgl.79.1616983188412;
        Sun, 28 Mar 2021 18:59:48 -0700 (PDT)
Received: from platform-dev1.pensando.io ([12.226.153.42])
        by smtp.gmail.com with ESMTPSA id w37sm14728027pgl.13.2021.03.28.18.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 18:59:48 -0700 (PDT)
From:   Brad Larson <brad@pensando.io>
To:     linux-arm-kernel@lists.infradead.org
Cc:     arnd@arndb.de, linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        broonie@kernel.org, fancer.lancer@gmail.com,
        adrian.hunter@intel.com, ulf.hansson@linaro.org, olof@lixom.net,
        brad@pensando.io, linux-gpio@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/13] spi: cadence-quadspi: Add QSPI support for Pensando Elba SoC
Date:   Sun, 28 Mar 2021 18:59:27 -0700
Message-Id: <20210329015938.20316-3-brad@pensando.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210329015938.20316-1-brad@pensando.io>
References: <20210329015938.20316-1-brad@pensando.io>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add QSPI controller support for Pensando Elba SoC

Signed-off-by: Brad Larson <brad@pensando.io>
---
 drivers/spi/spi-cadence-quadspi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 52ddb3255d88..4aacb0b2dbc7 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -1353,6 +1353,7 @@ static int cqspi_request_mmap_dma(struct cqspi_st *cqspi)
 	cqspi->rx_chan = dma_request_chan_by_mask(&mask);
 	if (IS_ERR(cqspi->rx_chan)) {
 		int ret = PTR_ERR(cqspi->rx_chan);
+
 		cqspi->rx_chan = NULL;
 		return dev_err_probe(&cqspi->pdev->dev, ret, "No Rx DMA available\n");
 	}
@@ -1633,6 +1634,10 @@ static const struct cqspi_driver_platdata intel_lgm_qspi = {
 	.quirks = CQSPI_DISABLE_DAC_MODE,
 };
 
+static const struct cqspi_driver_platdata pen_cdns_qspi = {
+	.quirks = CQSPI_NEEDS_WR_DELAY | CQSPI_DISABLE_DAC_MODE,
+};
+
 static const struct of_device_id cqspi_dt_ids[] = {
 	{
 		.compatible = "cdns,qspi-nor",
@@ -1650,6 +1655,10 @@ static const struct of_device_id cqspi_dt_ids[] = {
 		.compatible = "intel,lgm-qspi",
 		.data = &intel_lgm_qspi,
 	},
+	{
+		.compatible = "pensando,cdns-qspi",
+		.data = &pen_cdns_qspi,
+	},
 	{ /* end of table */ }
 };
 
-- 
2.17.1

