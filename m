Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11EA51C5838
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2020 16:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729072AbgEEOJW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 May 2020 10:09:22 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:42261 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727857AbgEEOJV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 May 2020 10:09:21 -0400
Received: from localhost.localdomain ([149.172.19.189]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MOAJt-1jl13t3uIr-00OWri; Tue, 05 May 2020 16:08:53 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Light Hsieh <light.hsieh@mediatek.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Sean Wang <sean.wang@mediatek.com>,
        YueHaibing <yuehaibing@huawei.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: mediatek: add pinctrl-mtk-common-v2 module license
Date:   Tue,  5 May 2020 16:08:40 +0200
Message-Id: <20200505140848.554957-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8x+ElLntw4n38VdOKQUn1jKkUwp0cPhTkte/vCk9MXw5FBuRYzO
 aZCQhDaNInbB9duIFcVfR+IrIflB0RYYyOkVYS+7peR9ZqSuhIWA6dAu6Kmf7ot1i92NWvY
 g4FHlV3Nxs5+999B1PWHrMh56vUvgHX/CSR4cbVxkw/sSiBqgJtnIGYO7lq9SLmnrmL6//Z
 vY9Ixf3Ex6196kbCI/h3g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zcGuDdea3AI=:9gaJ956+e/S10zq8UOB7AR
 ZbUbesdyNXz+lmJ0cSTddlrcznHhOKalZ1lW/bayZKFtHepB5SJgtExFff1e8kaB+fmQTgOrV
 QYvRc1Wm0rfQgZBSGJZX2YOK9lXDjtny/xA8L153JTjJm/QvEStKSRCsXMUpMQGKmDbggABSJ
 6neIeahH7BGIuHJs0Fir45FWoGg6/anKlb31ekSjm4pOStevMTmVC+lDMV0bP95Pd1mul7j59
 y/YryQKIyKKfsKuOTXQ6h+zaXUsgKXDofLkn6egv6vDfz+0RQZKGx/rAYHElCIXKpZMLmYL1S
 M/bObKTqpNgi19LZokBLdy1BveelcokBT0uTNFPaTMq1Mtk2D4A2uN1EkoYb2G4EaFLQj+TBI
 w2lbaF4Ihl80niu4bAyHI5gx6a+Wo+5mpV7GyxvT1XGLGBlZGSjwSVu451HDlRO4d+jHxSxfg
 B75g+s2zKXfUSuZ/1dAJGPd/IZZr2N+AbTI8qj+eBKv7bdOG0XB50FNFH0e8aNxzk8aNZf4dr
 zElEykIHEdaZba0MaFXH9ZTXmlFFcJjNLV7dlhUUiqieOOnfMZNMH8sPSoXTf+w9wMmgOw/W7
 c7+NQZqZgb3jIwNSsebo3NQ7GqujbDEQv1wHCFxWVzASUlFy6xAuf/vpb7z7MrflX32NZv4Qg
 GkpStsiq59TeUo3TyBesfD6QAsc4leX6g9tV83XTBOd7Quuk/Fe4e6GgJv0C9cqWZPNyjBaTf
 LLoqUYqdn6JVmbYkchP6+hbypYs0N858++nrLcQHQ40j1e1BPPjvvNSHtc1MiYm6mLy/7zVR0
 VakUMnxloNVNdH0eJnsGjvF/dgyYo2igsrU85G/lFPCccAnP4Q=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Kbuild warns when this file is built as a loadable module:

WARNING: modpost: missing MODULE_LICENSE() in drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.o
see include/linux/module.h for more information

Add the missing license/author/description tags.

Fixes: 8174a8512e3e ("pinctrl: mediatek: make MediaTek pinctrl v2 driver ready for buidling loadable module")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 6ea40b501328..b77b18fe5adc 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -993,3 +993,7 @@ int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_get);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
+MODULE_DESCRIPTION("Pin configuration library module for mediatek SoCs");
-- 
2.26.0

