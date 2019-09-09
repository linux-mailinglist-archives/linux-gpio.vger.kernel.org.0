Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0D8AD230
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2019 05:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387403AbfIIDYS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 Sep 2019 23:24:18 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42996 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729790AbfIIDYR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 8 Sep 2019 23:24:17 -0400
Received: by mail-pg1-f196.google.com with SMTP id p3so6954598pgb.9
        for <linux-gpio@vger.kernel.org>; Sun, 08 Sep 2019 20:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RG63HmNP+fK4fLyIjPyj97gm4iK8J3U3u0TzHeViZHk=;
        b=hhYP4RBAP2Eq0iNJwxitYTpV52OTrfD5Scwe4XaIDDcCFoQA5xmVe51H3G0H6wBDdR
         MZ3KrJHqnpWmEkzWjPHoxtiyzICw5+6tUbaV51mjZDcb9xMgf09mZuEdqsnowoCWyLeh
         YdeEP3POAwh8zgl5ECibdw/u2nlROjngE7ABOT+KBCi01cId1dd4WE9zUoeKiQdbD7Pe
         qtkvRn6EQKkz72Qgy/QyNWrYhS/YMSnjx2dt7PWLuJtlCIR/0op6IbWcw8akvsNu3tkU
         yJcnznKsA9B7JsVC/vIP8YiS/0BXAXaY8D9clgBxznHjjNvXbrVZpl41DCrpmD4aOGeg
         2k+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RG63HmNP+fK4fLyIjPyj97gm4iK8J3U3u0TzHeViZHk=;
        b=Z4TicLlZE5IRv7X3J5S0tmWpoNE6fq2ECyJIKNJHzmnqxUk9AOH40y4JaZsWmM7ZGU
         sAIw4ZDeWMS4q6RIMDN0qsgfIK01AOaqUBI2PMINav5ZM6U4Bi+QMec6noM2R5YDoD62
         DvyVljITSAXCu1596Eyie2ZuzyIEDa97jbGYFHqCaB/EI2ulRKxOl06EuLbVAQ9beZnr
         4rI+OoBZ14mxHALd4R3+DY/3sl+zY6BBzG5ioZhApyYvFCmq0IMfo4zCqE/132TChFlF
         Cnm9Z1KdkdbKioaWfmoCyLq5FLV2lZ2pAb+5lmq82wH8+fSn1zKJ8P7RznMtHbp41KWS
         50RA==
X-Gm-Message-State: APjAAAXbyxKY5ieemN5HA20Ork2jdi71ghgPgJakcCWpN1WRFWerSKPc
        AEPrcRu9Vj26BUQ6UmVHWsQpLm2YZOaI2g==
X-Google-Smtp-Source: APXvYqw7grb/67hQAecp13TcuYBB537mqK3blJbjcRcQ0cniTWxqw0UJfnD64OeC7yh0NoEhbcraFA==
X-Received: by 2002:a63:e948:: with SMTP id q8mr18893490pgj.93.1567999455320;
        Sun, 08 Sep 2019 20:24:15 -0700 (PDT)
Received: from firefly.lan (220-235-119-39.dyn.iinet.net.au. [220.235.119.39])
        by smtp.gmail.com with ESMTPSA id g8sm11113819pgk.1.2019.09.08.20.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2019 20:24:14 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH] gpio: fix line flag validation in lineevent_create
Date:   Mon,  9 Sep 2019 03:24:06 +0000
Message-Id: <20190909032406.1952-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

lineevent_create should not allow any of GPIOHANDLE_REQUEST_OUTPUT,
GPIOHANDLE_REQUEST_OPEN_DRAIN or GPIOHANDLE_REQUEST_OPEN_SOURCE to be set.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index cca749010cd0..5499ec7bc783 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -918,7 +918,7 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 		goto out_free_label;
 	}
 
-	/* Return an error if a unknown flag is set */
+	/* Return an error if an unknown flag is set */
 	if ((lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS) ||
 	    (eflags & ~GPIOEVENT_REQUEST_VALID_FLAGS)) {
 		ret = -EINVAL;
@@ -926,7 +926,9 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	}
 
 	/* This is just wrong: we don't look for events on output lines */
-	if (lflags & GPIOHANDLE_REQUEST_OUTPUT) {
+	if ((lflags & GPIOHANDLE_REQUEST_OUTPUT) ||
+	    (lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN) ||
+	    (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)) {
 		ret = -EINVAL;
 		goto out_free_label;
 	}
@@ -940,10 +942,6 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 
 	if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
 		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
-	if (lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN)
-		set_bit(FLAG_OPEN_DRAIN, &desc->flags);
-	if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
-		set_bit(FLAG_OPEN_SOURCE, &desc->flags);
 
 	ret = gpiod_direction_input(desc);
 	if (ret)
-- 
2.23.0

