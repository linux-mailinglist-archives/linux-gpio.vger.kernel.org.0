Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75FD6CE49F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2019 16:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727744AbfJGOGC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Oct 2019 10:06:02 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50516 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727490AbfJGOGC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Oct 2019 10:06:02 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iHTeC-0001ld-4b; Mon, 07 Oct 2019 14:06:00 +0000
From:   Colin King <colin.king@canonical.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: rzn1: array reg_drive static, makes object smaller
Date:   Mon,  7 Oct 2019 15:05:59 +0100
Message-Id: <20191007140559.11840-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array reg_drive on the stack but instead make it
static. Makes the object code smaller by 32 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  31991	  15696	      0	  47687	   ba47	drivers/pinctrl/pinctrl-rzn1.o

After:
   text	   data	    bss	    dec	    hex	filename
  31863	  15792	      0	  47655	   ba27	drivers/pinctrl/pinctrl-rzn1.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pinctrl/pinctrl-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rzn1.c b/drivers/pinctrl/pinctrl-rzn1.c
index 0f6f8a10a53a..39538d40dbf3 100644
--- a/drivers/pinctrl/pinctrl-rzn1.c
+++ b/drivers/pinctrl/pinctrl-rzn1.c
@@ -487,7 +487,7 @@ static int rzn1_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 {
 	struct rzn1_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
 	enum pin_config_param param = pinconf_to_config_param(*config);
-	const u32 reg_drive[4] = { 4, 6, 8, 12 };
+	static const u32 reg_drive[4] = { 4, 6, 8, 12 };
 	u32 pull, drive, l1mux;
 	u32 l1, l2, arg = 0;
 
-- 
2.20.1

