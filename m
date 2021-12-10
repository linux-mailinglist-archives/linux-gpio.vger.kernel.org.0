Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39E7C47022E
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 14:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239100AbhLJOBh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Dec 2021 09:01:37 -0500
Received: from smtpbg587.qq.com ([113.96.223.105]:60543 "EHLO smtpbg587.qq.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238967AbhLJOBg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 10 Dec 2021 09:01:36 -0500
X-QQ-mid: bizesmtp40t1639144536tvnd59ok
Received: from wangx.lan (unknown [171.221.148.2])
        by esmtp6.qq.com (ESMTP) with 
        id ; Fri, 10 Dec 2021 21:55:29 +0800 (CST)
X-QQ-SSF: 0100000000200070C000B00A0000000
X-QQ-FEAT: PdU/eI8FBMAIesJWzIvv6OITyZsnI+Id1P1RgWPlqUcRxIJkEHIEW9fPtRFBL
        7cSMALBMF2ziOCBD6PwRpUUgRQ3OO3jA5A3q+ao4XJD0wXmtM33SRXyFj8L9gn5MrAS59ts
        yxRS0Ne5UiP3aZYYkiBnRGgrruZ8f59vftXdsNiFCxgAxFbg9SK1L7pMduIqcZ9re8+FDku
        aSonoMAiGANlzmYhbuAh/MaIDDhL+1m1e5/+/yC/Bi/4PQeOQeHXgtAR0jag8FGbJe6VoJe
        0pr/iaD2IRPcv38+Xrt9HYAHtIBZ4r9U2zApNmvrxDEy/zFc/w33DNiuabHO6E2/VmlC+Og
        6yKJZX4bflpaKIo4yI=
X-QQ-GoodBg: 0
From:   Xiang wangx <wangxiang@cdjrlc.com>
To:     linus.walleij@linaro.org
Cc:     rjui@broadcom.com, brgl@bgdev.pl, f.fainelli@gmail.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xiang wangx <wangxiang@cdjrlc.com>
Subject: [PATCH v2] gpio: bcm-kona: add const to of_device_id
Date:   Fri, 10 Dec 2021 21:55:27 +0800
Message-Id: <20211210135527.28194-1-wangxiang@cdjrlc.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam3
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

struct of_device_id should normally be const.

Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>
---

Changes since v1
* Change subject log

 drivers/gpio/gpio-bcm-kona.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index d329a143f5ec..9cb3587d1441 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -505,7 +505,7 @@ static struct irq_chip bcm_gpio_irq_chip = {
 	.irq_release_resources = bcm_kona_gpio_irq_relres,
 };
 
-static struct of_device_id const bcm_kona_gpio_of_match[] = {
+static const struct of_device_id const bcm_kona_gpio_of_match[] = {
 	{ .compatible = "brcm,kona-gpio" },
 	{}
 };
-- 
2.20.1

