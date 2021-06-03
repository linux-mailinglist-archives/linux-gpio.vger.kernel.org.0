Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A3E39A298
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jun 2021 15:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbhFCN6v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Jun 2021 09:58:51 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:7095 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbhFCN6u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Jun 2021 09:58:50 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FwnSV4w68zYqSw;
        Thu,  3 Jun 2021 21:54:18 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 21:57:04 +0800
Received: from huawei.com (10.175.127.227) by dggema762-chm.china.huawei.com
 (10.1.198.204) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 3 Jun
 2021 21:57:03 +0800
From:   Yu Kuai <yukuai3@huawei.com>
To:     <sean.wang@kernel.org>, <linus.walleij@linaro.org>,
        <matthias.bgg@gmail.com>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <yukuai3@huawei.com>,
        <yi.zhang@huawei.com>
Subject: [PATCH] pinctrl: mediatek: fix build error without CONFIG_PINCTRL_MTK
Date:   Thu, 3 Jun 2021 22:06:18 +0800
Message-ID: <20210603140618.3044976-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If CONFIG_PINCTRL_MT8365 is set without CONFIG_PINCTRL_MTK,
following build errors will be triggered:

aarch64-linux-gnu-ld: drivers/pinctrl/mediatek/pinctrl-mt8365.o: in function `mtk_pinctrl_probe':
pinctrl-mt8365.c:(.text+0x20): undefined reference to `mtk_pctrl_init'
aarch64-linux-gnu-ld: drivers/pinctrl/mediatek/pinctrl-mt8365.o: in function `mt8365_spec_pull_set':
pinctrl-mt8365.c:(.text+0x64): undefined reference to `mtk_pctrl_spec_pull_set_samereg'
aarch64-linux-gnu-ld: drivers/pinctrl/mediatek/pinctrl-mt8365.o: in function `mt8365_ies_smt_set':
pinctrl-mt8365.c:(.text+0xbc): undefined reference to `mtk_pconf_spec_set_ies_smt_range'
aarch64-linux-gnu-ld: pinctrl-mt8365.c:(.text+0xf0): undefined reference to `mtk_pconf_spec_set_ies_smt_range'
aarch64-linux-gnu-ld: drivers/pinctrl/mediatek/pinctrl-mt8365.o:(.data+0xa0): undefined reference to `mtk_eint_pm_ops'

Fix it by adding the dependency that CONFIG_PINCTRL_MT8365 will be
relied on CONFIG_PINCTRL_MTK.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/pinctrl/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index b27c2070559a..3ec12651d4ef 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -157,6 +157,7 @@ config PINCTRL_MT8365
 	bool "Mediatek MT8365 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
+	depends on PINCTRL_MTK
 	default ARM64 && ARCH_MEDIATEK
 
 config PINCTRL_MT8516
-- 
2.31.1

