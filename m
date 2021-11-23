Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA13459DD1
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 09:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232270AbhKWI0T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 03:26:19 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:15851 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbhKWI0S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Nov 2021 03:26:18 -0500
Received: from dggeml709-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Hyxw34kysz91Hw;
        Tue, 23 Nov 2021 16:22:43 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 dggeml709-chm.china.huawei.com (10.3.17.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.20; Tue, 23 Nov 2021 16:23:09 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, David Virag <virag.david003@gmail.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] pinctrl: samsung: Make symbol 'exynos7885_pin_ctrl' static
Date:   Tue, 23 Nov 2021 08:36:17 +0000
Message-ID: <20211123083617.2366756-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggeml709-chm.china.huawei.com (10.3.17.139)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The sparse tool complains as follows:

drivers/pinctrl/samsung/pinctrl-exynos-arm64.c:490:31: warning:
 symbol 'exynos7885_pin_ctrl' was not declared. Should it be static?

This symbol is not used outside of pinctrl-exynos-arm64.c, so marks
it static.

Fixes: b0ef7b1a7a07 ("pinctrl: samsung: Add Exynos7885 SoC specific data")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index b174796081ef..2e490e7696f4 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -487,7 +487,7 @@ static const struct samsung_pin_bank_data exynos7885_pin_banks3[] __initconst =
 	EXYNOS850_PIN_BANK_EINTG(8, 0x200, "gpc2", 0x40),
 };
 
-const struct samsung_pin_ctrl exynos7885_pin_ctrl[] __initconst = {
+static const struct samsung_pin_ctrl exynos7885_pin_ctrl[] __initconst = {
 	{
 		/* pin-controller instance 0 Alive data */
 		.pin_banks	= exynos7885_pin_banks0,

