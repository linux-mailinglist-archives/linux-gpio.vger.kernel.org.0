Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF9481191E5
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 21:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbfLJU3A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 15:29:00 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:46139 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbfLJU3A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2019 15:29:00 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1N8GdE-1hjJuA0Kdk-014Ebs; Tue, 10 Dec 2019 21:28:46 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc:     Arnd Bergmann <arnd@arndb.de>, Hongwei Zhang <hongweiz@ami.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: aspeed: avoid return type warning
Date:   Tue, 10 Dec 2019 21:28:31 +0100
Message-Id: <20191210202842.2546758-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wVxlXYdoiPhUAJZhlt2X1D7PcABmLjxtergfMBgekFChQe6tWpZ
 I8w8dAsL3MhlxAzx3aJut0o8lNQ+huDa+/03lMKZtybCPmqB0AJTOBwNTfynmFBoPF8q11X
 0fl7rzVQ5Q2JVM39J6A/ntiE4ZYpUnCxy8/sdi3n7INo3/32jvI6513Rf/7/e+EF6ypwqMw
 7jpgkIgG3VV33LgyN3ZHw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y4ivtR1MltI=:StSJ9oDv/HYfCyShHA3Kln
 HJlWZ7FKH4rMnxsdZ2nBl/UW6bh5gdRtvDC7vF0RXZcURVmMYONqK3dKQBoPqnUs6OhRdRvaV
 fGRHQlH3Z4dy1+lh4Usamimlb50nX1pL7c9XXCvkaICeUSQb8GGTdQvjgtx7F0KKDME5TkrrG
 vcp+5d7zxDK4UzkAyOGGEsZkm8a7Lb7eAXSdnHsCYArnYzOVliIUeGcAHVK0/Lu0TCj5hXX7X
 fVbLVxTGXu+UAWIRrGCHtKxuOwtL/a7TQA1fFTMG2QD/PtZ/3n/g9rWSL6dwcbLFmZmqxJnIQ
 chErrX1bOl0U93KPojuBe+zu9gXC02JfzeqL5MrH61EibZylCVWR3xu+FHuLkjaZmXNiDycMn
 6y3zUNhipDojd9jN3Um/lKDi7Cq7OaHbPTDsQGqV8HeUeOcz0OBgMOaASpgoXrWskpkHBWmyW
 TzqkRJsMdb9nxCuAeOdozIL6fP3g8bdnCo3mnXrwKSU03CIdxjC6swqjGA71WzxIz1NzjJoC9
 bCf2p/keV+p7B2b37XKapDRGpDbzrdWy0dSwsYqsF4VuPQWtjRLV3YGHbMocgckkIOG3yWaHn
 54sLNcUWiHO80jq9qRFMPmG8nldxRxceGtieFYJ4M4LfP+q+X+oQSgrnq2xZgRNd4/QvaKGji
 ApkJsGJbhOaXlkdON4aoL2l6aixNE6Gdh14opggsVlJaKt5rkxyIDWFhyuFzXyuSMnFMBnACj
 SARPLDbBB6oLHVI2K3Xe4enmJcz10DTzP2urQVQvpLd+8OHImMx1O7a3tHAPP9GV1e9RE4ZY/
 PeTepEbRI5+/RQ+0bq+NqBLvowYmvTpaLLeP5M1fc3LBgWW32wURRueAs/HhIgpuXzvt6f/OG
 eMl+mUJZ38GzOcZdS6EQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

gcc has a hard time tracking whether BUG_ON(1) ends
execution or not:

drivers/gpio/gpio-aspeed-sgpio.c: In function 'bank_reg':
drivers/gpio/gpio-aspeed-sgpio.c:112:1: error: control reaches end of non-void function [-Werror=return-type]

Use the simpler BUG() that gcc knows cannot continue.

Fixes: f8b410e3695a ("gpio: aspeed-sgpio: Rename and add Kconfig/Makefile")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 7e99860ca447..8319812593e3 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -107,7 +107,7 @@ static void __iomem *bank_reg(struct aspeed_sgpio *gpio,
 		return gpio->base + bank->irq_regs + GPIO_IRQ_STATUS;
 	default:
 		/* acturally if code runs to here, it's an error case */
-		BUG_ON(1);
+		BUG();
 	}
 }
 
-- 
2.20.0

