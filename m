Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB64257425
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 09:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727961AbgHaHOw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 03:14:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727806AbgHaHOn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 03:14:43 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17ECBC061573;
        Mon, 31 Aug 2020 00:14:42 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t11so2599505plr.5;
        Mon, 31 Aug 2020 00:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VHh2Btrj1RMrE2bBjPVgrNRFQFpYqnl0GvDbuvKxlhM=;
        b=S3mcsSWyBk2K7x6lEYbi0LBE2ybIfLvfaX9B7iMhZQwnl4Co+b53YdSainIW4Nq7eq
         LivAwlzS8y7uyOvy9CCdeS39UDVP+oP4l+8wWjSJc+nQypK3LYAQFluxrIWBGlBksYtS
         lnXTp51xYpws1G1UsNjVrZ8Xl3YY1mVJOmrzQkE5WpW+8rh9nsxpCYHE8Bu28jml5gMR
         QBKrDD3jShcfFvYCtsaYEflcF+g28LD3PTLTpleT9T1d/3Tx7v2FrzLtyEyEF6jBUPY+
         Uenapoy8EECWpjHonyHEaLDA6uDbN0mH5rTy5At5d2oE7v4LT+VxYkvM5ytg0Tyd2UD3
         kWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VHh2Btrj1RMrE2bBjPVgrNRFQFpYqnl0GvDbuvKxlhM=;
        b=a9domBBeNMSyoF/CH/vw6m7QkVjM4/Si3dTX26V9v54EElCi5zY6jrGW8Bf6A3WZFL
         GogKvQVVqf8BSfCRjBZGZq44HaIQ0aWRp0HSSjPzzoZzfGGlrUxW/o1k5GrK09pMzoZA
         v64X8UeKfFPLsJMeyEadQ3qy+U82oR5pEhP0Hl91AkkL1hX4hunUXz92Cflm4IGO1i7H
         BfK1CYdkdtBhIBztwEQhVnKmGytVDVTWajci5moAnLlHmnld0eJCQQ8YEjTJiP3Qr9Jb
         NsFKTRRTPp3V0C3jH/iLwRa2C3LU7fJSapB8sS72E+H5gz5H34LP4YRYcCWOUYdQrjPi
         YTFQ==
X-Gm-Message-State: AOAM530Af1/09RGdvcSrZIBnigUzxmS3ni9wmEE1xdDG8eTHVfKi4Ytb
        XyTlro/740yXD2Bdzurk+22NurtcAq1enA==
X-Google-Smtp-Source: ABdhPJy49Sbbd5KsXqCjjYrUmQ0P4bLeuHD9xm+Xx7zfcvXsugr04Cs+z/TJMUSjCrP4mIiQhgxF7Q==
X-Received: by 2002:a17:90b:374b:: with SMTP id ne11mr162280pjb.21.1598858081680;
        Mon, 31 Aug 2020 00:14:41 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.6])
        by smtp.gmail.com with ESMTPSA id s67sm7173587pfs.117.2020.08.31.00.14.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 00:14:41 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     linus.walleij@linaro.org, lee.jones@linaro.org,
        bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        dillon min <dillon.minfei@gmail.com>
Subject: [PATCH: 2/2] gpio: tc35894: Disable Direct KBD interrupts to enable gpio irq
Date:   Mon, 31 Aug 2020 15:14:33 +0800
Message-Id: <1598858073-5285-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598858073-5285-1-git-send-email-dillon.minfei@gmail.com>
References: <1598858073-5285-1-git-send-email-dillon.minfei@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

On tc35894, have to disable direct keypad interrupts to make
it as general purpose interrupts functionality work.
if not, after chip reset, IRQST(0x91) will always 0x20,
IRQN always low level, can't be clear.

verified on tc35894, need more test on other tc3589x.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 drivers/gpio/gpio-tc3589x.c | 10 ++++++++++
 include/linux/mfd/tc3589x.h |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index ea3f68a28fea..760e716468dc 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -334,6 +334,16 @@ static int tc3589x_gpio_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	/* For tc35894, have to disable Direct KBD interrupts,
+	 * else IRQST will always be 0x20, IRQN low level, can't
+	 * clear the irq status.
+	 * TODO: need more test on other tc3589x chip.
+	 */
+	ret = tc3589x_reg_write(tc3589x, TC3589x_DKBDMSK,
+				TC3589x_DKBDMSK_ELINT | TC3589x_DKBDMSK_EINT);
+	if (ret < 0)
+		return ret;
+
 	ret = devm_request_threaded_irq(&pdev->dev,
 					irq, NULL, tc3589x_gpio_irq,
 					IRQF_ONESHOT, "tc3589x-gpio",
diff --git a/include/linux/mfd/tc3589x.h b/include/linux/mfd/tc3589x.h
index bb2b19599761..c18fc7c3c2d6 100644
--- a/include/linux/mfd/tc3589x.h
+++ b/include/linux/mfd/tc3589x.h
@@ -19,6 +19,9 @@ enum tx3589x_block {
 #define TC3589x_RSTCTRL_KBDRST	(1 << 1)
 #define TC3589x_RSTCTRL_GPIRST	(1 << 0)
 
+#define TC3589x_DKBDMSK_ELINT	(1 << 1)
+#define TC3589x_DKBDMSK_EINT	(1 << 0)
+
 /* Keyboard Configuration Registers */
 #define TC3589x_KBDSETTLE_REG   0x01
 #define TC3589x_KBDBOUNCE       0x02
@@ -101,6 +104,8 @@ enum tx3589x_block {
 #define TC3589x_GPIOODM2	0xE4
 #define TC3589x_GPIOODE2	0xE5
 
+#define TC3589x_DKBDMSK		0xF3
+
 #define TC3589x_INT_GPIIRQ	0
 #define TC3589x_INT_TI0IRQ	1
 #define TC3589x_INT_TI1IRQ	2
-- 
2.7.4

