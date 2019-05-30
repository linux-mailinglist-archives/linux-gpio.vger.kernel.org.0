Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA11130415
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2019 23:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbfE3VSk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 May 2019 17:18:40 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38439 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbfE3VSj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 May 2019 17:18:39 -0400
Received: by mail-ed1-f66.google.com with SMTP id g13so11134216edu.5
        for <linux-gpio@vger.kernel.org>; Thu, 30 May 2019 14:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=r5R6tZfjTNjpig1YwvQcPmHOMI9F55RZALKjyS8amew=;
        b=J/rGTs6BFPCdzdCLidoE6OepNbdigl1AKH1hoOtNyZeutIHxfAfVzeG8nqpsuxPcJy
         XfTlgfkCNlJFx70ZkJ5ZuqKZZI6+gEr/LMPXdTfCiy+lbBG025jLyf2GGuUbq0SiEmqI
         psp8x+YqsasWYtIUMLJdxjPqQ5m5/PscrdgktVyj8CHNuSDg3k87PmHId6wqH0ihjtmT
         mwgsd4waBsfEK/itidN8Xu+AQCVog7b4hTQ6LpW89vKeDnkaPzZ8R6Fn4xx/aQ6dIFd8
         4KxdG1+sK3P7Hnwcdw9y2Crk188CwHRjqDmtiIAZJ+Cu/uWWc/4iWgzP1/DNJVtAtr29
         lxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=r5R6tZfjTNjpig1YwvQcPmHOMI9F55RZALKjyS8amew=;
        b=GjKhqhQwuKrosb/VLqO0m0Z9KdIBJB9gSNGQRNPamxyxHaTar+RCo2zWyD5U6GNz5T
         PIbBoZJXdy3UZQEizrHRnl/R2/e4qC2KEIiV+2X315yWG8rIfgYOfHE5VbPLMPEGvzNU
         NcXfdn9ghS2ujopD7Gilsvcp5ZooLLwG/y2ujNjc+vAH9eMbmb29aV3BntVqjyZTfaQ+
         lHeMb5SLg0dLa2Mn6vcRC1bdVzwoOqLxd2LiDJfcD5fD32zzGmjHuvoF+Wmb2oTn/YIg
         o1b/vH+JMrPhIgEjO6qTnonoZTNm3PZ7VcUedSSIZN+fHYqJNk++1HQI1LSaGWeKYDj8
         ZGkQ==
X-Gm-Message-State: APjAAAV/QkSV+todOA3rbiJHyPcnIuONVcFFN8/0l6edlHgGLQtV8ALJ
        dBTtZgDvay4CwA1/pZWn/J8=
X-Google-Smtp-Source: APXvYqxkI9VkTvL9lfaZtu6FtNliD/B6QRXIDnG2qA6xuMGuFQtuMCoMbLYqWqzGOZpiEu62+73eUw==
X-Received: by 2002:a50:ca45:: with SMTP id e5mr7217191edi.1.1559251118310;
        Thu, 30 May 2019 14:18:38 -0700 (PDT)
Received: from smtp.gmail.com (86-40-30-62-dynamic.b-ras2.prp.dublin.eircom.net. [86.40.30.62])
        by smtp.gmail.com with ESMTPSA id c20sm615474ejr.69.2019.05.30.14.18.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 14:18:37 -0700 (PDT)
From:   Tomasz Kazimierz Motyl <tomasz.motyl666@gmail.com>
X-Google-Original-From: Tomasz Kazimierz Motyl <tomasz.motyl@se.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org
Cc:     butterfly_tm666@yahoo.com,
        Tomasz Kazimierz Motyl <tomasz.motyl@se.com>
Subject: [PATCH] When ones changes the state of any input pins of a PCA9555 chip before setting up the IRQ mask through i.e. SysFS e.g. echo "both" > /sys/class/gpio/gpioXYZ/edge the epoll_wait shall not exit on the subsequent change of the GPIO state. The reason behind it is that the IRQ status is not being saved when the IRQ is masked.
Date:   Thu, 30 May 2019 14:18:32 -0700
Message-Id: <20190530211832.23889-1-tomasz.motyl@se.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

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

