Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA854FA06B
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 02:44:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbfKMBov (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Nov 2019 20:44:51 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39188 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727001AbfKMBou (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Nov 2019 20:44:50 -0500
Received: by mail-lj1-f194.google.com with SMTP id p18so632304ljc.6
        for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2019 17:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TSetjMkcf4RpuPYXlFbAM0zaTljwaDUanV3PLKAWDpw=;
        b=Gx9/4wLyPBmCchNwrslkyoWt00c+XPhTBrtJRbJaQthp30BZrJ0iqN1q5jOKigdLIS
         TMxaZcP9iVEuxOhzinjmVT4Y+80rqdy7XN8YBtK5Qk4XgW1U2Ufoqy7Hl0+O+r5FJvH9
         pUgtMI6o2fbew8jPafNEBEyf1Tg8exaG55ESxXy2zs39Cs7lXPuCo5XJ2wMcLTBXLh9K
         uVhlE/lDu7PjVrlKD44Ue2/cUaYZPWvzGIB1lD/IvAa6uHvVHad+s/h+fzg4fkGk0wBM
         vPbXsSCVEAgA441J0C4I8L2Kjb8/VCG2MSDx1mb1AJYo89N0gRRF43oy9qBv5J5w7dNP
         ARlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TSetjMkcf4RpuPYXlFbAM0zaTljwaDUanV3PLKAWDpw=;
        b=BQ5/x4cFqtYSfGWFRM59pDdzI/7EuzjYR2lQRim1pFUBGOVvaGboszCKRxlm3adlXv
         NGJ+lAnYD5xIy8KcCzXsCALXjsZdtPlekIgB+3aVrFeKimbrhJjzJdJHPEeyENooZsZi
         lzuIChTp9CI0xYRzIMN7x4ceGoDTbv6+S0a1l5s7TxbO+ttDlAeWuUar1U0e5UK6jwSz
         UDNtNHe1e7KbGgjGCVcG7WczdA4ZuBP3FnXQghX74FXvz08INYoSjQf2Web3liQcTbL4
         IWgHRVGIxb2/tuWUIuphGDh19nm+IIx7Q8VikHgdCZvnx6vQ1PXrsRbtjpwO7LMZFOvu
         lnzA==
X-Gm-Message-State: APjAAAXU/3JweWo9sZ/T0vhdL9B38en40Vc5E+6/FChksyk2Zg9D+pa5
        c/Jnp5XfYkrci5UlRmhAya7c0w==
X-Google-Smtp-Source: APXvYqwCX2MBzMEReXX1xV3jUFGB08L4MJtEtvR5BzsZ84X6TT2Gnq8chd6RudqzVPTvjBW857cnqQ==
X-Received: by 2002:a05:651c:87:: with SMTP id 7mr506151ljq.20.1573609487372;
        Tue, 12 Nov 2019 17:44:47 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-79c8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.200.121])
        by smtp.gmail.com with ESMTPSA id n19sm190440lfl.85.2019.11.12.17.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 17:44:46 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] spi: fsl-cpm: Correct the free:ing
Date:   Wed, 13 Nov 2019 02:44:42 +0100
Message-Id: <20191113014442.12100-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The fsl_spi_cpm_free() function does not make the same
checks as the error path in fsl_spi_cpm_init() leading
to crashes on error.

Cc: Fabio Estevam <festevam@gmail.com>
Reported-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/spi/spi-fsl-cpm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-cpm.c b/drivers/spi/spi-fsl-cpm.c
index 858f0544289e..54ad0ac121e5 100644
--- a/drivers/spi/spi-fsl-cpm.c
+++ b/drivers/spi/spi-fsl-cpm.c
@@ -392,7 +392,8 @@ void fsl_spi_cpm_free(struct mpc8xxx_spi *mspi)
 	dma_unmap_single(dev, mspi->dma_dummy_rx, SPI_MRBLR, DMA_FROM_DEVICE);
 	dma_unmap_single(dev, mspi->dma_dummy_tx, PAGE_SIZE, DMA_TO_DEVICE);
 	cpm_muram_free(cpm_muram_offset(mspi->tx_bd));
-	cpm_muram_free(cpm_muram_offset(mspi->pram));
+	if (!(mspi->flags & SPI_CPM1))
+		cpm_muram_free(cpm_muram_offset(mspi->pram));
 	fsl_spi_free_dummy_rx();
 }
 EXPORT_SYMBOL_GPL(fsl_spi_cpm_free);
-- 
2.21.0

