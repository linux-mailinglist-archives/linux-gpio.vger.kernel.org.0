Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69CB4414CB4
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 17:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236164AbhIVPI7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 11:08:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:42914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236303AbhIVPI6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Sep 2021 11:08:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7EB9E60F9D;
        Wed, 22 Sep 2021 15:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632323248;
        bh=NCoE/uRUoAqUdii3VBHrxnUaKdd75sKAWSnUsOSHpMw=;
        h=From:To:Cc:Subject:Date:From;
        b=O1VpMva2HZS/+CojTuvcjsByvGqeJMZSD+kpHTAKAB0PtPD/4RjVhT6xk5xrg9tt7
         8omIwJZTmb7umdCjjwXBW48TtarKr9gEI8vl3ZifL8qt5SNghODFIpl81CEC3l02C8
         bgTwaFvKWTMSoZ6j1+ePX7IQdUpOaNEoP44CqFW0rXukAIe5w+VRVmO62c/GkV51hp
         4Ygpj+XxCrx8SQxTIfeg9maGGMfkaMvOO3xVW3TdVM5QuCVfEHiJ48bzPSmYxAQZK3
         a3HREc+qyqfNn8uDHGPj2nEl7ap6kli857VJKQvoQVcD8+/hfH6tFON2yBvDT9mo1o
         Bgv2tv5qvoosQ==
From:   Mark Brown <broonie@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [PATCH] gpio: 74x164: Add SPI device ID table
Date:   Wed, 22 Sep 2021 16:06:16 +0100
Message-Id: <20210922150616.27408-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305; h=from:subject; bh=NCoE/uRUoAqUdii3VBHrxnUaKdd75sKAWSnUsOSHpMw=; b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhS0ZL7hUKUYHOWsTSYyVYrqD2dXlCqrBDmsrIj8w7 nD8zyseJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUtGSwAKCRAk1otyXVSH0GgNB/ kB79GBhMbNCqM1ZeWWTPstAzGYoVeDGxIfz+M9RmXDh/Do8n0Fh4RWvPfnzLZMeahckCb6jqKjKXld FcVhUpB9QIr1fg5kUypadUq9fD1YGI7z77UXRRyJON/Mntd/VJq+j3CpPUzTdMG8RC2NFs0KFFxgC0 C4qpHOb2UC4JFmEx7YTEHE+8Jk1MhfOIuaVqlxWXKJ8JMwi+1w8zYKmb3cLqhLchtE17cI7FlfvpXD o/Qs3xLdmugQ8GRuqxaAT5AkOQI8txdF4lP1kPu8pcghzfLTGA7XNXlNrap+9VRNUyx4zIx8VM9CDb xDeV5rNBtgsZQd4qOhqL1iGipdHpR9
X-Developer-Key: i=broonie@kernel.org; a=openpgp; fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
---
 drivers/gpio/gpio-74x164.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 05637d585152..6595a9595d04 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -174,6 +174,13 @@ static int gen_74x164_remove(struct spi_device *spi)
 	return 0;
 }
 
+static const struct spi_device_id gen_74x164_spi_ids[] = {
+	{ .name = "74h595" },
+	{ .name = "741vc594" },
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

