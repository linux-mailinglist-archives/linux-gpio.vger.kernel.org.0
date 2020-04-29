Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B85721BDD83
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 15:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbgD2NZA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Apr 2020 09:25:00 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:58085 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbgD2NY7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Apr 2020 09:24:59 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MN5W9-1jmHai06Xl-00J200; Wed, 29 Apr 2020 15:24:45 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Light Hsieh <light.hsieh@mediatek.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Sean Wang <sean.wang@mediatek.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pinctrl: mediatek: fix mtk_eint link error
Date:   Wed, 29 Apr 2020 15:24:22 +0200
Message-Id: <20200429132443.1295194-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:b2K8SGt0tNbKweRcNNd5na2gw56bnc7GqSkapPSRkiyRREMbXnV
 mXoroDsDHSuU5UDemW+096Q1oGLBjSb9A8Q0oGheHoi6a2eWYKpL9j2P6FuZgQX7IeczDrW
 dwxi0yxqo0aWJTzwXgrZJ/4d15zI6Rog4TWtotc5l3cB8KfW+IoAMQzurz+hLhsY3jkN6mR
 YdY+2SSUVRM3JY69A4Ilg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tIEy99GNx+8=:kozTZI20UsvqYUvArP7lrr
 CVSueE5VSluslq5ErNIWyj2CWFhgMtHmXt3v/rGC9X/UHxPaqC6LLL5noG0k4Dq5j41EXHWCb
 PMCNwTdKHUWN7fgmBpIjU4XPqpfHUH7QjTCqCZ5VnwonmySixRq/IaLaahcEMNm+XBu5NVV7h
 ROxryqcjmRKSV1UYN1qIEVJ6hSQEaHnkncCnI/ytOdhIZcz5LzUlvCE4Lir6+xxNkpB344DM7
 ljN/nt5iPRp+jhgNSvTe+zFPC8IURT295IA1JzDCSL9t4ueK+qD3QiuK57tJnHlITjKTqwN96
 F6KAPbHCFr/8pswmCN1jvldq/Z+76YbCHp+O2rSTTgaTTtzyM8IhfOKSW2PnP6iAfU0/qtvUc
 wAn+TTxJsVRKcHwW6DB/WQTbw3uRrJXs8OIUbqzVCq2BFazyT+12LVD2iEiZ0WFMTKEkRfCpX
 FTeFLNHCNkEOZ2V3gyE5XZcK0A8h+hHbjg2CvXmWyqrVDLkyf6ulkl8J3ZaBy8DD7i6iYs1SF
 NLDTEZrh5IRuSqTzXGjHdZ4BAcT+7k4CaiWVYGiLPHAOo5iy0bhN1962tmSTdUKH2f/yl6gUv
 qZxwcFLKnqH1cLBdstIpvMOo98khu7iN5Ae3ffSf12Lfzqq7W5tD72pU12fmGOa3ScgKo++eV
 rlKjKWK9To2C68fLzv0YtoPT190SQ0/2hGz4P5iSl4kVdtqg2lzNtCYAyKKj3GZfqF3QvpKVW
 7z1cbRxFdgv2pbmIdbkW4gC5TLeHnAkMZ7SbwAsr/FtwiodtzHLJdfMR2m+bkNPRRUsuQv75P
 0xarjRVA9hEnrsUt/yUbISYhgeHa+OrMmkGh8ORCnQZWR5f9Wg=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In a configuration with CONFIG_PINCTRL_MTK_MOORE=y and CONFIG_PINCTRL_MTK_PARIS=m,
we end up with the mtk_eint driver as a loadable module that cannot be
linked from built-in code:

aarch64-linux-ld: drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.o: in function `mtk_build_eint':
(.text+0x304): undefined reference to `mtk_eint_do_init'
aarch64-linux-ld: drivers/pinctrl/mediatek/pinctrl-moore.o: in function `mtk_gpio_set_config':
pinctrl-moore.c:(.text+0xf80): undefined reference to `mtk_eint_set_debounce'
aarch64-linux-ld: drivers/pinctrl/mediatek/pinctrl-moore.o: in function `mtk_gpio_to_irq':
pinctrl-moore.c:(.text+0x1028): undefined reference to `mtk_eint_find_irq'

Simplify the Kconfig logic to always select EINT_MTK when it is needed, and
remove the 'default' statements.

Fixes: 8174a8512e3e ("pinctrl: mediatek: make MediaTek pinctrl v2 driver ready for buidling loadable module")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/mediatek/Kconfig    |  4 +---
 drivers/pinctrl/mediatek/mtk-eint.h | 28 ----------------------------
 2 files changed, 1 insertion(+), 31 deletions(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index f32d3644c509..b6a8d91f4885 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -7,8 +7,6 @@ config EINT_MTK
 	depends on PINCTRL_MTK || PINCTRL_MTK_MOORE || PINCTRL_MTK_PARIS || COMPILE_TEST
 	select GPIOLIB
 	select IRQ_DOMAIN
-	default y if PINCTRL_MTK || PINCTRL_MTK_MOORE
-	default PINCTRL_MTK_PARIS
 
 config PINCTRL_MTK
 	bool
@@ -20,6 +18,7 @@ config PINCTRL_MTK
 	select OF_GPIO
 
 config PINCTRL_MTK_V2
+	select EINT_MTK
 	tristate
 
 config PINCTRL_MTK_MOORE
@@ -38,7 +37,6 @@ config PINCTRL_MTK_PARIS
 	select PINMUX
 	select GENERIC_PINCONF
 	select GPIOLIB
-	select EINT_MTK
 	select OF_GPIO
 	select PINCTRL_MTK_V2
 
diff --git a/drivers/pinctrl/mediatek/mtk-eint.h b/drivers/pinctrl/mediatek/mtk-eint.h
index 48468d0fae68..f40dab50a5f3 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.h
+++ b/drivers/pinctrl/mediatek/mtk-eint.h
@@ -68,7 +68,6 @@ struct mtk_eint {
 	const struct mtk_eint_xt *gpio_xlate;
 };
 
-#if IS_ENABLED(CONFIG_EINT_MTK)
 int mtk_eint_do_init(struct mtk_eint *eint);
 int mtk_eint_do_suspend(struct mtk_eint *eint);
 int mtk_eint_do_resume(struct mtk_eint *eint);
@@ -76,31 +75,4 @@ int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_n,
 			  unsigned int debounce);
 int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n);
 
-#else
-static inline int mtk_eint_do_init(struct mtk_eint *eint)
-{
-	return -EOPNOTSUPP;
-}
-
-static inline int mtk_eint_do_suspend(struct mtk_eint *eint)
-{
-	return -EOPNOTSUPP;
-}
-
-static inline int mtk_eint_do_resume(struct mtk_eint *eint)
-{
-	return -EOPNOTSUPP;
-}
-
-static inline int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_n,
-			  unsigned int debounce)
-{
-	return -EOPNOTSUPP;
-}
-
-static inline int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
-{
-	return -EOPNOTSUPP;
-}
-#endif
 #endif /* __MTK_EINT_H */
-- 
2.26.0

