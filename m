Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31B2D14A993
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jan 2020 19:15:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgA0SPs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jan 2020 13:15:48 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:42581 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgA0SPs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jan 2020 13:15:48 -0500
Received: from localhost.localdomain ([37.4.249.152]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MRmwM-1j2Dig1rly-00TAt5; Mon, 27 Jan 2020 19:15:40 +0100
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [RFC PATCH 1/4] pinctrl: bcm2835: Drop unused define
Date:   Mon, 27 Jan 2020 19:15:05 +0100
Message-Id: <1580148908-4863-2-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580148908-4863-1-git-send-email-stefan.wahren@i2se.com>
References: <1580148908-4863-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:lGg05mfNcExFSuIdqSja3VB+cOAOOVkxA1mUl+WjJLfuDEYN48s
 KCpfgqk9HemEgzwKhTMkYEgexHNzZfeVG5k5xAbv9CDheeQx24pa/Pz7dPaHD9i2zVtcPEX
 ugday3kFGFOvKGH3QCW8oxkE91P2/fJaGsnynRzDkoSe3RjqXABLPjZW+febQ6xUrd9aF8p
 OvDdu6E+cBesU1loyk22g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FBYTcl5hsyU=:/uJXPKY5G3RK2HKm3g2afF
 CA5JAlk5ZwkebJLV4bbQfKqE89ChkfNCYzAIhT9SgQhi22RYSBr1LmN//FwU0R3diFEvflVI4
 OPkci48gv0sh+mZnsk9a5fiLs2oAnSh5hggie4G8ZelqhAZ6n4CYEWIp+lz1bo5KPywuZxqek
 T8GpkbU4eb/oEicxOhC8lN0DwOFD5W3GliKQ1IpWDarfz8Y9a4d+EgeY0+iBjelJHlfR3e1Q4
 5TOF82NxXDkBp/4GoxSxM5JDUgoTnPvWCJ7ZFIchyrHbjc5NauAb/4e//OnNTPB8e7bKoOaH2
 HQ6XUp0Da/6crl8QtfuGEbHRAtkNZFJTRdT07zQtpcH89Cqto3IYQ9ND/7ijWcWxu5wb7Ve34
 RPM8gzArJAvou4fFeqPnnHkVmPuq3p5Xua81P7sTqXQN3m5U5RqmH8Lzr8w92FQrloZ2SMe9z
 XjYOrjAoxuxpe2x+H3tUoY4PwEgZjz7swAA8BeyYnRzumaAVvQgvNKrW2Qj9V73nKPwgtehvz
 hZDfvJgFBHEyfHVj4Fcz+N3r4xFIWS5o2UW5P2M2L2v7bQsckL4EkHWUHSjK5sJhQVDongIHo
 /+aJJViGcVBiAGrzvEW2ksFVnPP5X7R2pBxPckyIx3WhJaGzC1OGqA3Wg/a2k08Ewtt7m2DXz
 yYvnBfgEsV57VS3aLe8dsbJ2HqKMcqeahm6FQesAnangl4BtG6RH1BMKAaaaMeuJm2DQO+UUA
 PELxUMq3dBDAOEuSMNSdvN15BCqDxAajjVLnv+b/+pnKsJ/31p3YVryA78eJ6/kZm1a/DobHg
 vNu1QLjbpYkq/WH/K/LaUxt+YpwMi8egvQPLH32zMRACRbsqlMQ7nAGsZtdEkU8zYbp38yV
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no usage for this define, so drop it.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 0de1a3a..3fc2638 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -40,9 +40,6 @@
 #define BCM2835_NUM_BANKS 2
 #define BCM2835_NUM_IRQS  3
 
-#define BCM2835_PIN_BITMAP_SZ \
-	DIV_ROUND_UP(BCM2835_NUM_GPIOS, sizeof(unsigned long) * 8)
-
 /* GPIO register offsets */
 #define GPFSEL0		0x0	/* Function Select */
 #define GPSET0		0x1c	/* Pin Output Set */
-- 
2.7.4

