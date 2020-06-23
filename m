Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F00A204840
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 06:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732132AbgFWECa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 00:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbgFWECa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 00:02:30 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C441C061573;
        Mon, 22 Jun 2020 21:02:29 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id p11so772364pff.11;
        Mon, 22 Jun 2020 21:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FVNCSzVJrhutB9aI+e0UYQU6PJY6RyWwTJaGpn9Y2ls=;
        b=anuYpu7c2w87skv/QxuNWYwdrgqQA7GkypXeXID0CrFFWScHKRCxXPObb98svz7hWI
         6eFu1X8nRLBRC5xZVnAyJxjeWwXIrkTa1QS62eY4lU8wzNH7MVgNwLPvrSLa0qirZIvh
         ubilgPeX6igjL8BLPICXyjqwpBEFDzMviouQtmetOmnEsX4mCBMtJ/3mghWsAAr69teF
         u2ar8mf5nhiGv97T4EYPO/uZzINRCaudxd+k95jumsb6jN9z7N7xS8jovA6CC4U+GV0k
         scphK7CEMBWQ3tM7X/g99GUls9PKYmMqR5Z1Kc9MQgQ5oGmcs9DPDRJDOJLUG7mtxX2O
         JAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FVNCSzVJrhutB9aI+e0UYQU6PJY6RyWwTJaGpn9Y2ls=;
        b=AgRmPnyqp3UPDvWeLtFz/vbAoRUEHbQF9Fge3OEN5LmuMbHhtpYGOrkS61MrH/bHHq
         VBMaPUNxPacOEW/oVXwxapAvlMX86F1xd9wHu3ibANoMrUhXYLbx6JxUrHQ6/GIHPyxC
         9VAqorCsHcnZL7HXBAHX2Lpsfs/06LNmZqGitfsEaSJK4ebgdlRrREj+HZMErJaQKOif
         sDzm0fnql2/sx1rKFoQrNxESTuyo6UhlvsX9YZnvSPq+Izf+PFWuTzmeT3jc1N1Ocany
         gT/VotoGrJ7F/iv95xjTUqEJ/BvUnL/3UGeNSU7Xqvzm6HJBydHS9VxflMPcXsf7U32h
         BmTw==
X-Gm-Message-State: AOAM5334OI2zehNcRdeBVxcleSbkq2TuBhPKdpsJekJPB6T1nb0wTomC
        v3uhjJx+9hao8d6yyRfSIy0z9jgCYaw=
X-Google-Smtp-Source: ABdhPJxl2honAeYfh2duqOSrdT4b7/4tGMNVhVphwUwfgewxS0kfctm38daRWbKUna3ECI8VYI7xvw==
X-Received: by 2002:aa7:8681:: with SMTP id d1mr23526815pfo.230.1592884948234;
        Mon, 22 Jun 2020 21:02:28 -0700 (PDT)
Received: from sol.lan (220-235-126-59.dyn.iinet.net.au. [220.235.126.59])
        by smtp.gmail.com with ESMTPSA id n64sm12442315pga.38.2020.06.22.21.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 21:02:27 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 08/22] gpiolib: cdev: complete the irq/thread timestamp handshake
Date:   Tue, 23 Jun 2020 12:00:53 +0800
Message-Id: <20200623040107.22270-9-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623040107.22270-1-warthog618@gmail.com>
References: <20200623040107.22270-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Reset the timestamp field to 0 after using it in lineevent_irq_thread.

The timestamp is set by lineevent_irq_handler and is tested by
lineevent_irq_thread to determine if it is called from a nested theaded
interrupt.
lineevent_irq_thread is assuming that the nested, or otherwise, status
of the IRQ is static, i.e. it is either always nested or never nested.
This change removes that assumption, resetting the timestamp so it can
be re-used to determine the nested state of subsequent interrupts.

Signed-off-by: Kent Gibson <warthog618@gmail.com>

---
 drivers/gpio/gpiolib-cdev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index d50339ef6f05..1e8e0a0a9b51 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -559,6 +559,8 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
 	else
 		ge.timestamp = le->timestamp;
 
+	le->timestamp = 0;
+
 	if (le->eflags & GPIOEVENT_REQUEST_RISING_EDGE
 	    && le->eflags & GPIOEVENT_REQUEST_FALLING_EDGE) {
 		int level = gpiod_get_value_cansleep(le->desc);
-- 
2.27.0

