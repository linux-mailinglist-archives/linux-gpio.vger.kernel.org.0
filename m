Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3A74156459
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Feb 2020 14:03:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbgBHND1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 Feb 2020 08:03:27 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:47869 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727129AbgBHND0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 8 Feb 2020 08:03:26 -0500
Received: from localhost.localdomain ([37.4.249.150]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M58SY-1izJpq1Aiy-0017de; Sat, 08 Feb 2020 14:03:18 +0100
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 1/4] pinctrl: bcm2835: Drop unused define
Date:   Sat,  8 Feb 2020 14:02:52 +0100
Message-Id: <1581166975-22949-2-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581166975-22949-1-git-send-email-stefan.wahren@i2se.com>
References: <1581166975-22949-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:7poxDZDsc+nCytjwN8LtSgR7ED0PiXCKK7Lt2YkCm/iND1UtSOp
 QV2LAcQ3kUyNZYVk5rrzHMFzzeUo7t4Q5zJgdk5e7uYCjm90vDnbMBs2nj8cd83exIgCWfe
 WFLAPllWyFaqlnv7HJzM/XPiJHMqUwBZobMlekxNQzV+XhN4B2+/HC01ZXqV+dGxPilb0A8
 Lp4Woi1OYSDZ0tCH4gz9g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yx3C1NqXhqY=:kEcetKMpsTsqLpcBrKBTAF
 ppqIic9BHNOoPHgM9Q7hTR4LGvygmjRgpnWLF4600OvZTzpBbv5R3KxRMnTT/6n8WfaqVxdZK
 NYJ9a7Qo4jMqYdZmLY4UoCysyDV0uh10X3UK9OElVPVcyztaHM+jF/oUn3TpyMnpJ/Kpf0a+j
 D6JI76JWLAUmA+/FatBdn6tSNJ3z8+gAqowwHzTdGcVFAK2oJBXM/DTbKjFPsevyTw0tfM0Wx
 pV0aiyPhuogXNk0bVLVKydsBA5FI4oKImQPAfIN9zHXfIahONjUD20BrWK4H18XzMqbRCPI4E
 Kb799iLJD+90yt5nibK8+pKM5QIyiMzF/b9+PC1DEbkH+JYPXGTvDMCEc/gGeU+5KsTGxfxGd
 ceQsaHDJmuLpgpx0S8wE7+uR86ky1hnji0ogeI9UvDThu5UlwLvrBRMY2n+zSaVpAqTcMbzbl
 PXCmvx7EDghhCBWoQzfoFOeWSDieN3y9yLT18GIsmqCs+Y4eJE1VyWnU7JSHTAoM0wD1Jbk6V
 8xy7RIbbQQicMIA24aZZbdw/fOoWDCdcnOLoK124SJ/ZLlhDoz+HpY0J/LTMrcYCMjrIGh2eQ
 wymbXOYchDhpB+87ga4Y/T2Zh0kN3NbYYZuOE04U8fqwYdSSL/gXkCB090oUid9Hw53mUAhFN
 3dKlYavLg1b2myYKZxluZwjB8wlHGDIyEed/hcqvq0pB7L70UIP8gvbcqBEQZtLzgQo6Zi2yy
 QdSFMFrT0juAzEMTrgcUSegil7mBb3rxvtF8h9omwIZ/M9xw6gyXP74zPzcATTM1kV02tibIo
 nYtvRbXj8gL4zecC6ZAk+Q2iCJRqV7sjZLquqAmEQdOfrMtCnewg4DeMH/THjqDpkmuZFEv
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

