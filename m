Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B7976EF35
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jul 2019 13:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbfGTLcE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Jul 2019 07:32:04 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36057 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728037AbfGTLcE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jul 2019 07:32:04 -0400
Received: by mail-wr1-f65.google.com with SMTP id n4so34727957wrs.3
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jul 2019 04:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=y1DgajEy2wBaMjnleDlKvTbnzQUhSLoATqVXxMZ4yOY=;
        b=mhIvRWJ9id5PxUoR1fNC9fdbFAtS/0PM4qAytnpMw48tlTwce2QCbWvgv1+Xb01i/o
         mU5qHuG+NCUvlgcE+zbcdOZNg2hFd5hzQGCiOqOl880HP2a8OaXS3wWHbdMRGhxpqlSH
         /4xHMJI3QLL9z6yzyp/YGc8Me0onYVPdJPh8G1sa0WWJbx61YU46MEqXSHloBSS0oG9D
         87A6Zi7D+xz2tiqBBaiLDs5YVA+ADKmaOJSmFj8K8wjcjpBut9GduxqAXC36QhXpWWN1
         r+sX47VwNamoZ6IJQNkZncZwF9YDu7mZr0Gccl0TNewXXxstrFSC3oDmP+ItLa2OIWAW
         PBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=y1DgajEy2wBaMjnleDlKvTbnzQUhSLoATqVXxMZ4yOY=;
        b=LWldP8zfdX0/9sEvIhS07Ew5KePaowbTBEFTwMXxWmgAqqi9hvtYgkyw+ne0WPr1Io
         XyOB0fMvE9aFt09lHwBPKc6/d/ymxL4MPhNFXaWH1h6NvNs18d0iRftQOG2oSVtWtrBS
         ZrclxBaf7UbvKxTeQbVYR8UpFwsb010K0CyejCFTngEkhMWl8vHapqoK2WSwfkfRMFan
         Ef4lBJ0d8q7xQbLQoiFe5esFEYAZsGRAMOcghReJ1HsDuAHtkSZNOkwiMNgW2S05xLWf
         aH9upTIGr01g4YiHLeDjwA8kMZ/QZZn6jNYVMu5eG/H8RAkCRJnz8X1NpXILFsBch7+Y
         UPOg==
X-Gm-Message-State: APjAAAWts6E9IIYUtFASJ14eRR0TCdMKckP2GQMJEsLWQAnGTZMWqO17
        /XFxS4Rwln7sM/rhGMEGLRA=
X-Google-Smtp-Source: APXvYqzp3Hzx3u8EMCqrr1ygV7S+rEv2vYBK5SsRnzGwZf78z9C0/XekZWLSxBd1kBR8JkKEFbfajw==
X-Received: by 2002:a5d:5012:: with SMTP id e18mr34029874wrt.166.1563622322585;
        Sat, 20 Jul 2019 04:32:02 -0700 (PDT)
Received: from smtp.gmail.com (86-43-168-87-dynamic.b-ras2.prp.dublin.eircom.net. [86.43.168.87])
        by smtp.gmail.com with ESMTPSA id j189sm35657661wmb.48.2019.07.20.04.32.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 20 Jul 2019 04:32:01 -0700 (PDT)
From:   Tomasz Kazimierz Motyl <tomasz.motyl666@gmail.com>
X-Google-Original-From: Tomasz Kazimierz Motyl <tomasz.motyl@se.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org
Cc:     butterfly_tm666@yahoo.com,
        Tomasz Kazimierz Motyl <tomasz.motyl@se.com>
Subject: [PATCH] Record interrupt status when an IRQ is masked
Date:   Sat, 20 Jul 2019 04:31:55 -0700
Message-Id: <20190720113155.12276-1-tomasz.motyl@se.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

 When one changes the state of any input pins of a PCA9555 chip before
 setting up the IRQ mask through i.e. SysFS e.g. echo "both" >
 /sys/class/gpio/gpioXYZ/edge the epoll_wait shall not exit on the subsequent
 change of the GPIO state. The reason behind it is that the IRQ status is not
 being saved when the IRQ is masked.

---
 drivers/gpio/gpio-pca953x.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 7e76830b3368..088bef902156 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -716,13 +716,16 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, u8 *pending)
 		trigger[i] = (cur_stat[i] ^ old_stat[i]) & chip->irq_mask[i];
 		if (trigger[i])
 			trigger_seen = true;
+
+    /* We want the current status recorded in the chip->irq stat regardless the
+     * chip->irq_mask setting in order to have a change detected when the interrupt
+     * mask gets changed i.e. echo "both" > /sys/class/gpioXYZ/edge */
+    chip->irq_stat[i] = cur_stat[i];
 	}
 
 	if (!trigger_seen)
 		return false;
 
-	memcpy(chip->irq_stat, cur_stat, NBANK(chip));
-
 	for (i = 0; i < NBANK(chip); i++) {
 		pending[i] = (old_stat[i] & chip->irq_trig_fall[i]) |
 			(cur_stat[i] & chip->irq_trig_raise[i]);
-- 
2.17.1

