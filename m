Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC05C2DFF3
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 16:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbfE2Oji (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 May 2019 10:39:38 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:17623 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726012AbfE2Oji (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 May 2019 10:39:38 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 839FE90B79A7527E41A8;
        Wed, 29 May 2019 22:39:35 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Wed, 29 May 2019
 22:39:27 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <info@metux.net>, <dvhart@infradead.org>, <andy@infradead.org>,
        <linus.walleij@linaro.org>
CC:     <linux-kernel@vger.kernel.org>,
        <platform-driver-x86@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] x86: apuv2: Make two symbols static
Date:   Wed, 29 May 2019 22:38:44 +0800
Message-ID: <20190529143844.23084-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix sparse warnings:

drivers/platform/x86/pcengines-apuv2.c:80:27: warning: symbol 'gpios_led_table' was not declared. Should it be static?
drivers/platform/x86/pcengines-apuv2.c:113:27: warning: symbol 'gpios_key_table' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/platform/x86/pcengines-apuv2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
index c1ca931e1fab..b0d3110ae378 100644
--- a/drivers/platform/x86/pcengines-apuv2.c
+++ b/drivers/platform/x86/pcengines-apuv2.c
@@ -77,7 +77,7 @@ static const struct gpio_led_platform_data apu2_leds_pdata = {
 	.leds		= apu2_leds,
 };
 
-struct gpiod_lookup_table gpios_led_table = {
+static struct gpiod_lookup_table gpios_led_table = {
 	.dev_id = "leds-gpio",
 	.table = {
 		GPIO_LOOKUP_IDX(AMD_FCH_GPIO_DRIVER_NAME, APU2_GPIO_LINE_LED1,
@@ -110,7 +110,7 @@ static const struct gpio_keys_platform_data apu2_keys_pdata = {
 	.name		= "apu2-keys",
 };
 
-struct gpiod_lookup_table gpios_key_table = {
+static struct gpiod_lookup_table gpios_key_table = {
 	.dev_id = "gpio-keys-polled",
 	.table = {
 		GPIO_LOOKUP_IDX(AMD_FCH_GPIO_DRIVER_NAME, APU2_GPIO_LINE_MODESW,
-- 
2.17.1


