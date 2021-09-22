Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA979414DF6
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 18:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236597AbhIVQT4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 12:19:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:52432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236478AbhIVQTw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Sep 2021 12:19:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F65260231;
        Wed, 22 Sep 2021 16:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632327502;
        bh=LykCJdYEu+CSSrJhONDiTLZGQKY4d7xGa9K05rFbmY8=;
        h=From:To:Cc:Subject:Date:From;
        b=OuvUqNSoYvwgjQvNtEMYHsYzMh2TvR9ifZ7WkZfncshbIqylC6t7tQaRsuVwRTS6R
         SxC9UrsCQ0CJcRFhIrdK/vTLDDVOaep0vN+HXUDeoN4l749jz75/Fw3DcbEX6lDKiI
         rP6hrqOKBrBBLFFauaY/ixDDlD5JED4RU5hkIuk/yJuQwYi5zlVjqrEtEDltTeGEoN
         /RyPMe8+BwwLIm60WCgJvryG3VIAl+OdTQfH9KatYoj4EsTTvnmD6KfM26LC92zk+P
         pxs9LDrQstJRI7B6KW8LZHycug0021Jt3kFAHPSvZvzguQSAE9prvCL2MTbdlG8oD1
         Vlu92QnL+E2ZQ==
From:   Mark Brown <broonie@kernel.org>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] gpio: 74x164: Add SPI device ID table
Date:   Wed, 22 Sep 2021 17:17:36 +0100
Message-Id: <20210922161736.9064-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently autoloading for SPI devices does not use the DT ID table, it uses
SPI modalises. Supporting OF modalises is going to be difficult if not
impractical, an attempt was made but has been reverted, so ensure that
module autoloading works for this driver by adding a SPI device ID table.

Fixes: 96c8395e2166 ("spi: Revert modalias changes")
Signed-off-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---

v2: Fix typos in the device names, sorry.

 drivers/gpio/gpio-74x164.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 05637d585152..4a55cdf089d6 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -174,6 +174,13 @@ static int gen_74x164_remove(struct spi_device *spi)
 	return 0;
 }
 
+static const struct spi_device_id gen_74x164_spi_ids[] = {
+	{ .name = "74hc595" },
+	{ .name = "74lvc594" },
+	{},
+};
+MODULE_DEVICE_TABLE(spi, gen_74x164_spi_ids);
+
 static const struct of_device_id gen_74x164_dt_ids[] = {
 	{ .compatible = "fairchild,74hc595" },
 	{ .compatible = "nxp,74lvc594" },
@@ -188,6 +195,7 @@ static struct spi_driver gen_74x164_driver = {
 	},
 	.probe		= gen_74x164_probe,
 	.remove		= gen_74x164_remove,
+	.id_table	= gen_74x164_spi_ids,
 };
 module_spi_driver(gen_74x164_driver);
 
-- 
2.20.1

