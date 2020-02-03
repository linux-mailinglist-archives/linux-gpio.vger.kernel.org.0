Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEA46150663
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2020 13:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727723AbgBCMxe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Feb 2020 07:53:34 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42260 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727695AbgBCMxe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Feb 2020 07:53:34 -0500
Received: by mail-pl1-f195.google.com with SMTP id e8so3217447plt.9;
        Mon, 03 Feb 2020 04:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d1PUOvezlc86nnJ2EdYIPACzogxXlrOQENYR7d2+L4M=;
        b=Rb2qXbEoBWs7d+Nii1uAAhEC5ATNVcKqnSsAQ57yKx/Nes3NssuIoBMh81ho9c+hyG
         0clFIPoVcUMCnxRq1yLQHno2dmmwyzVwP04QJbj2T3EJKGSL6cJ5nfxCEhPtX2LX15WN
         QIWF9Jtht9xDHrZ+2kVrCq+VmYKgRrRub1M5okBag25cbJrkPnfAFRAqiNHmXQurlAPq
         /tO6OH9LHJZSL4iSvpFCW2i7ZwMf4GpkFBGP5NZT3HpH0Ok0a+4TkTYTIfU4AQweMBaF
         3cIdB7btebTX7sANEqzlbAA2SqMC0f6Jww15MPqYq6RZJ5b9buhzaTk/0Re4h85dflhU
         Of4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d1PUOvezlc86nnJ2EdYIPACzogxXlrOQENYR7d2+L4M=;
        b=oD6XY0WJ2d0sJFdOPZ73IFm1C+L1M+RzTIfDMirs6Ir1UFA13JXDjryczbhS9oqRch
         2yj8cnD8hpkOyhoM3b3j6Tmg7j6Wuvekc/TzE348NIBgfCR9AwwGFCLd8nc2tX/LZCxT
         gUsfyvsFJtfBuREm+8vzvXS83xy5s4Yl0ngqh0ZkCK9NkOuE8voxED61fs+nVFNOfU49
         PVsezk2URLvtRrz6ut76nU30gveUKt2R+C7l0BccfFNDZAeCIoJVd/XlLkRnzbH/fYYE
         oeXipfZjlChhwecFLfLC1Vc7xH6PiTVpxNZWJ01t38qtx+EmF6+wZlL5rwcuOBZpkD53
         Wldg==
X-Gm-Message-State: APjAAAVZWiiYQghmD52ZUEk/LuvkErNlHsZX8WNcPeOto7vqF3o5KdnN
        Lab+aLPDfEFhCzhtnJNPitc=
X-Google-Smtp-Source: APXvYqxxwozPvOlt7D3pUmlPv7ZHqnNAe5uYIAMEgCjobqoM7le5Sish89wfUBjG1egNCN7Cfc4bDA==
X-Received: by 2002:a17:902:104:: with SMTP id 4mr1436768plb.24.1580734413877;
        Mon, 03 Feb 2020 04:53:33 -0800 (PST)
Received: from localhost.localdomain ([27.59.202.234])
        by smtp.gmail.com with ESMTPSA id 26sm12723577pjk.3.2020.02.03.04.53.29
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Feb 2020 04:53:32 -0800 (PST)
From:   sachin agarwal <asachin591@gmail.com>
X-Google-Original-From: sachin agarwal <sachinagarwal@sachins-MacBook-2.local>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        andy@kernel.org, asachin591@gmail.com
Subject: [PATCH 5/6] gpio: ich: fixed a typo
Date:   Mon,  3 Feb 2020 18:22:55 +0530
Message-Id: <20200203125255.84705-1-sachinagarwal@sachins-MacBook-2.local>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: sachin agarwal <asachin591@gmail.com>

we had written "Mangagment" rather than "Management".

Signed-off-by: Sachin Agarwal <asachin591@gmail.com>
---
 drivers/gpio/gpio-ich.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ich.c b/drivers/gpio/gpio-ich.c
index 2f086d0aa1f4..9960bb8b0f5b 100644
--- a/drivers/gpio/gpio-ich.c
+++ b/drivers/gpio/gpio-ich.c
@@ -89,7 +89,7 @@ static struct {
 	struct device *dev;
 	struct gpio_chip chip;
 	struct resource *gpio_base;	/* GPIO IO base */
-	struct resource *pm_base;	/* Power Mangagment IO base */
+	struct resource *pm_base;	/* Power Management IO base */
 	struct ichx_desc *desc;	/* Pointer to chipset-specific description */
 	u32 orig_gpio_ctrl;	/* Orig CTRL value, used to restore on exit */
 	u8 use_gpio;		/* Which GPIO groups are usable */
-- 
2.24.1

