Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 983BD2CB8EE
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Dec 2020 10:34:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729256AbgLBJcz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Dec 2020 04:32:55 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:8553 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgLBJcz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Dec 2020 04:32:55 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CmDJ3263szhjXc;
        Wed,  2 Dec 2020 17:31:47 +0800 (CST)
Received: from huawei.com (10.69.192.56) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Wed, 2 Dec 2020
 17:32:06 +0800
From:   Luo Jiaxing <luojiaxing@huawei.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC:     <andy.shevchenko@gmail.com>, <andriy.shevchenko@linux.intel.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linuxarm@huawei.com>
Subject: [PATCH v1 3/3] arm64: defconfig: enable GPIO_HISI
Date:   Wed, 2 Dec 2020 17:32:23 +0800
Message-ID: <1606901543-8957-4-git-send-email-luojiaxing@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606901543-8957-1-git-send-email-luojiaxing@huawei.com>
References: <1606901543-8957-1-git-send-email-luojiaxing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Enable GPIO controller for HiSilicon's ARM SoC.

GPIO is common driver for HiSilicon's ARM SoC and it provide support for
some function of I2C and SPI.

Signed-off-by: Luo Jiaxing <luojiaxing@huawei.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5cfe3cf..b5cdf5e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -498,6 +498,7 @@ CONFIG_PINCTRL_SM8150=y
 CONFIG_PINCTRL_SM8250=y
 CONFIG_GPIO_ALTERA=m
 CONFIG_GPIO_DWAPB=y
+CONFIG_GPIO_HISI=y
 CONFIG_GPIO_MB86S7X=y
 CONFIG_GPIO_MPC8XXX=y
 CONFIG_GPIO_MXC=y
-- 
2.7.4

