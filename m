Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 330501F360E
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 10:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728107AbgFIIXq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jun 2020 04:23:46 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:38602 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728034AbgFIIXo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jun 2020 04:23:44 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200609082342euoutp02be50a41ba2a97f5688d7fcc819b4f83a~W0o0tnTsm2018120181euoutp02c
        for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2020 08:23:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200609082342euoutp02be50a41ba2a97f5688d7fcc819b4f83a~W0o0tnTsm2018120181euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1591691022;
        bh=BGalV4SWoQktnTM1smyzt1YMdWYXcGcpHw/UIPU9QfY=;
        h=From:To:Cc:Subject:Date:References:From;
        b=DDtw0tA9I3zr0EpRkI94+4tgsN+oC4v+GjIsyjhL2qzhHNtQpyOkvQQWUkWwBSqhq
         B+5GlI4STrhx09lViCvdqTSa4Eqa8xjp3dTWbM3/RBxYKgYVmjNW/TkfVlE5XKDAOo
         FYO8Gz8B+iunAkkK6UhY1x5Gt+cgkSp37pfO1z/M=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200609082341eucas1p2c3a4166cdabbe42dffa2247274efd3aa~W0o0baGNz0783307833eucas1p2P;
        Tue,  9 Jun 2020 08:23:41 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 08.72.60698.D074FDE5; Tue,  9
        Jun 2020 09:23:41 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200609082341eucas1p2e24e71598af14d994520b79494e96b15~W0oz-h0we0586405864eucas1p22;
        Tue,  9 Jun 2020 08:23:41 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200609082341eusmtrp13f3232debefbe006bf5db6b998b6c47d~W0oz_vRrt1700117001eusmtrp1H;
        Tue,  9 Jun 2020 08:23:41 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-4d-5edf470d9af8
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id FB.74.08375.D074FDE5; Tue,  9
        Jun 2020 09:23:41 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200609082340eusmtip174a5d456d5afdee3c869087bc138ef55~W0ozjWR9q1237712377eusmtip1T;
        Tue,  9 Jun 2020 08:23:40 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH] pinctrl: samsung: Use bank name as irqchip name
Date:   Tue,  9 Jun 2020 10:23:29 +0200
Message-Id: <20200609082329.10184-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBIsWRmVeSWpSXmKPExsWy7djPc7q87vfjDFaf1rXYOGM9q8X1L89Z
        Lc6f38BuMeXPciaLzfP/MFrMOL+PyWLtkbvsFofftLNarNr1h9GB02PnrLvsHptWdbJ53Lm2
        h82jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4Ms78ucxY8Fy84uX9lywNjA+Euhg5OSQETCRa
        H01l6WLk4hASWMEosenvU2YI5wujxOQ3h5lAqoQEPjNKvHgmD9PxbuE7qI7lQPFTN1nhOia2
        /mcGqWITMJToetvFBmKLCDhK/NywCqyIWWAbk8T5rkNACQ4OYQEHiasPGUFqWARUJe6v3AG2
        jVfAVmLbimYWiG3yEqs3HAA7SULgOZvE08UXGSESLhIn2m+zQdjCEq+Ob2GHsGUkTk/uYYFo
        aGaUeHhuLTuE08MocblpBlS3tcSdc7/ArmAW0JRYv0sfIuwo0f1zFztIWEKAT+LGW0GQMDOQ
        OWnbdGaIMK9ERxs07NQkZh1fB7f24IVLzBC2h8TSp9fApggJxErMP1s/gVFuFsKqBYyMqxjF
        U0uLc9NTi43zUsv1ihNzi0vz0vWS83M3MQLTw+l/x7/uYNz3J+kQowAHoxIP7w3xe3FCrIll
        xZW5hxglOJiVRHidzp6OE+JNSaysSi3Kjy8qzUktPsQozcGiJM5rvOhlrJBAemJJanZqakFq
        EUyWiYNTqoFx8/Zt5peq1r62bhL31xVUfuE1J9VZZbpz32fF63LKkcy1oYcWct7azRZvI1QQ
        4OPsr/zo93aO5j7pVpv3RjV9ui2r1VylM+Mf9s3gtEgWWZsVfzKd81XMwcp3LP7dzn/Dfav6
        1231n+oZktn3QVZwT+Ea0dYVRR/WtMximsbK4tcRVr7pjxJLcUaioRZzUXEiAGX6MMkLAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHLMWRmVeSWpSXmKPExsVy+t/xu7q87vfjDB4+E7TYOGM9q8X1L89Z
        Lc6f38BuMeXPciaLzfP/MFrMOL+PyWLtkbvsFofftLNarNr1h9GB02PnrLvsHptWdbJ53Lm2
        h82jb8sqRo/Pm+QCWKP0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJS
        czLLUov07RL0Ms78ucxY8Fy84uX9lywNjA+Euhg5OSQETCTeLXzH0sXIxSEksJRR4vCsGywQ
        CRmJk9MaWCFsYYk/17rYQGwhgU+MEtP+moDYbAKGEl1vIeIiAs4SN17tBRvELLCLSaJlzWGg
        BAeHsICDxNWHjCA1LAKqEvdX7mACsXkFbCW2rWiG2iUvsXrDAeYJjDwLGBlWMYqklhbnpucW
        G+oVJ+YWl+al6yXn525iBIbltmM/N+9gvLQx+BCjAAejEg/vDfF7cUKsiWXFlbmHGCU4mJVE
        eJ3Ono4T4k1JrKxKLcqPLyrNSS0+xGgKtHwis5Rocj4wZvJK4g1NDc0tLA3Njc2NzSyUxHk7
        BA7GCAmkJ5akZqemFqQWwfQxcXBKNTB6Lyjyk1S5U5blbfd9yZKjp+bL3tc/kubZxFscn8Id
        zCwSJHZzSc6ZX58vb6i1tptSWLapvera329MijsXTlwece/bvnMODur3G7Izha1amQzn9KWK
        /LvxqVe8V23NiuyrabePrJ21pCU53/Ri7tZz1+NE7069tYjvSqOkYv0VXwmBMyvinsgosRRn
        JBpqMRcVJwIAgt8GL2ECAAA=
X-CMS-MailID: 20200609082341eucas1p2e24e71598af14d994520b79494e96b15
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200609082341eucas1p2e24e71598af14d994520b79494e96b15
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200609082341eucas1p2e24e71598af14d994520b79494e96b15
References: <CGME20200609082341eucas1p2e24e71598af14d994520b79494e96b15@eucas1p2.samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the bank name as the irqchip name. This name is later visible in
/proc/interrupts, what makes it possible to easily identify each
GPIO interrupt.

/proc/interrupts before this patch:
143:    0     exynos4210_wkup_irq_chip   7 Edge      hdmi
144:    0     exynos4210_wkup_irq_chip   6 Level     wm8994
145:    1     exynos4210_wkup_irq_chip   7 Edge      max77686-pmic, max77686-rtc
146:    1     exynos_gpio_irq_chip   3 Edge      3-0048

/proc/interrupts after this patch:
143:    0     gpx3   7 Edge      hdmi
144:    0     gpx3   6 Level     wm8994
145:    1     gpx0   7 Edge      max77686-pmic, max77686-rtc
146:    1     gpm2   3 Edge      3-0048

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 27 +++++++++++++++---------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 84501c785473..1c87cf41602a 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -207,7 +207,7 @@ static void exynos_irq_release_resources(struct irq_data *irqd)
 /*
  * irq_chip for gpio interrupts.
  */
-static struct exynos_irq_chip exynos_gpio_irq_chip = {
+static const struct exynos_irq_chip exynos_gpio_irq_chip __initconst = {
 	.chip = {
 		.name = "exynos_gpio_irq_chip",
 		.irq_unmask = exynos_irq_unmask,
@@ -313,7 +313,13 @@ int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
 			goto err_domains;
 		}
 
-		bank->irq_chip = &exynos_gpio_irq_chip;
+		bank->irq_chip = kmemdup(&exynos_gpio_irq_chip,
+					 sizeof(*bank->irq_chip), GFP_KERNEL);
+		if (!bank->irq_chip) {
+			ret = -ENOMEM;
+			goto err_domains;
+		}
+		bank->irq_chip->chip.name = bank->name;
 	}
 
 	return 0;
@@ -521,7 +527,7 @@ int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 	struct samsung_pin_bank *bank;
 	struct exynos_weint_data *weint_data;
 	struct exynos_muxed_weint_data *muxed_data;
-	struct exynos_irq_chip *irq_chip;
+	const struct exynos_irq_chip *irq_chip;
 	unsigned int muxed_banks = 0;
 	unsigned int i;
 	int idx, irq;
@@ -531,12 +537,7 @@ int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 
 		match = of_match_node(exynos_wkup_irq_ids, np);
 		if (match) {
-			irq_chip = kmemdup(match->data,
-				sizeof(*irq_chip), GFP_KERNEL);
-			if (!irq_chip) {
-				of_node_put(np);
-				return -ENOMEM;
-			}
+			irq_chip = match->data;
 			wkup_np = np;
 			break;
 		}
@@ -557,7 +558,13 @@ int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 			return -ENXIO;
 		}
 
-		bank->irq_chip = irq_chip;
+		bank->irq_chip = kmemdup(irq_chip, sizeof(*irq_chip),
+					 GFP_KERNEL);
+		if (!bank->irq_chip) {
+			of_node_put(wkup_np);
+			return -ENOMEM;
+		}
+		bank->irq_chip->chip.name = bank->name;
 
 		if (!of_find_property(bank->of_node, "interrupts", NULL)) {
 			bank->eint_type = EINT_TYPE_WKUP_MUX;
-- 
2.17.1

