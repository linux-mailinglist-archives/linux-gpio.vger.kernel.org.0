Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4092A204836
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 06:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731977AbgFWECC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 00:02:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbgFWECB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 00:02:01 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83CC2C061573;
        Mon, 22 Jun 2020 21:02:01 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id ga6so910797pjb.1;
        Mon, 22 Jun 2020 21:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0FgTxUzz+w3uq8vispnW3M0gHTXLq8lEJYcL3RfDb/M=;
        b=U2W84ThBLBxe5recJA4ic4JY6zgQXz7I9Jb/txRHXcZUJOEUpK7F303nniNfIP/g24
         zbiYX+C/FKZBZku4kqk2hOsRJ3uSH7EQGBIQX7qxybTRvnWlb6WZ8OwZ5NqqRQ+l6YCs
         +4ZkldRuiWEmxvus9wdlw88wocZwruWEYrh4NhQmzAPlP1qm4IUx0whFMVirqJ3aCw4J
         eg24k9JjovCT/8BKlPKzdijXdUVmcmIXipxXhkqVzNec12gO1DrQzEOBIoaRvZEFz/PR
         /mDk5cz+SAxdsXNwSHuJl3WeSNTCFmklFePscK1K3HTYQevvKdutExqFzBt12T3o0HU3
         AeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0FgTxUzz+w3uq8vispnW3M0gHTXLq8lEJYcL3RfDb/M=;
        b=K/OD/9nFPgKad6h/ToRO1RyDtDmGvoCq80trHmjsQOt75OGvf3QSum1Q3n8GGYPU7g
         ue/V54uEmqfRkRxjmL56DLdU3d5sHYaEUj1KEUoPIB/IyTnn+QG+xf57he/sPmUVn+au
         6rChml/rDUu4KskbWarA8fXSmFD7wLD1N6H4aqtyhJeG6gcsxrNwrOjcdPZCS2SHSAWn
         rbEu8jjNmbANnkcSFbs0HSQbXZLUc6hy8r4lN9qk5/pHh/gBPp+Hb2UTfHeUr80EupQh
         8mQQ5kaplSR37XwrJoFINWE+QnlYV7QmB6f/pbqaNtPD666Hh41yXSd6pO5PDCiOiE6o
         XqcQ==
X-Gm-Message-State: AOAM531fBjL10jMgSE3jsbvs3bez9tJdXfimp3mZGg2Le3MvK8nIiZUI
        bi/wZzDILFBrOcBjHVI9hptOhf7DIz0=
X-Google-Smtp-Source: ABdhPJzeDLPeuRLzK/5qPKN53/vQOosTI09Re4Jw6xFC3K5qsQ4ZpYTyAWQysiiYJBK16ev6/2K3Ww==
X-Received: by 2002:a17:90a:fd87:: with SMTP id cx7mr21074054pjb.62.1592884920503;
        Mon, 22 Jun 2020 21:02:00 -0700 (PDT)
Received: from sol.lan (220-235-126-59.dyn.iinet.net.au. [220.235.126.59])
        by smtp.gmail.com with ESMTPSA id n64sm12442315pga.38.2020.06.22.21.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 21:01:59 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 03/22] gpiolib: cdev: minor indentation fixes
Date:   Tue, 23 Jun 2020 12:00:48 +0800
Message-Id: <20200623040107.22270-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623040107.22270-1-warthog618@gmail.com>
References: <20200623040107.22270-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make indentation consistent with other use to improve readability.

Signed-off-by: Kent Gibson <warthog618@gmail.com>

---
 drivers/gpio/gpiolib-cdev.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 55a9b7b44304..889ed2dc9e58 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -98,7 +98,7 @@ static int linehandle_validate_flags(u32 flags)
 	/* Only one bias flag can be set. */
 	if (((flags & GPIOHANDLE_REQUEST_BIAS_DISABLE) &&
 	     (flags & (GPIOHANDLE_REQUEST_BIAS_PULL_DOWN |
-			GPIOHANDLE_REQUEST_BIAS_PULL_UP))) ||
+		       GPIOHANDLE_REQUEST_BIAS_PULL_UP))) ||
 	    ((flags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN) &&
 	     (flags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)))
 		return -EINVAL;
@@ -212,11 +212,11 @@ static long linehandle_ioctl(struct file *filep, unsigned int cmd,
 
 		/* Reuse the array setting function */
 		return gpiod_set_array_value_complex(false,
-					      true,
-					      lh->numdescs,
-					      lh->descs,
-					      NULL,
-					      vals);
+						     true,
+						     lh->numdescs,
+						     lh->descs,
+						     NULL,
+						     vals);
 	} else if (cmd == GPIOHANDLE_SET_CONFIG_IOCTL) {
 		return linehandle_set_config(lh, ip);
 	}
@@ -225,7 +225,7 @@ static long linehandle_ioctl(struct file *filep, unsigned int cmd,
 
 #ifdef CONFIG_COMPAT
 static long linehandle_ioctl_compat(struct file *filep, unsigned int cmd,
-			     unsigned long arg)
+				    unsigned long arg)
 {
 	return linehandle_ioctl(filep, cmd, (unsigned long)compat_ptr(arg));
 }
@@ -428,7 +428,7 @@ struct lineevent_state {
 	GPIOEVENT_REQUEST_FALLING_EDGE)
 
 static __poll_t lineevent_poll(struct file *filep,
-				   struct poll_table_struct *wait)
+			       struct poll_table_struct *wait)
 {
 	struct lineevent_state *le = filep->private_data;
 	__poll_t events = 0;
@@ -720,11 +720,11 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 
 	/* Request a thread to read the events */
 	ret = request_threaded_irq(le->irq,
-			lineevent_irq_handler,
-			lineevent_irq_thread,
-			irqflags,
-			le->label,
-			le);
+				   lineevent_irq_handler,
+				   lineevent_irq_thread,
+				   irqflags,
+				   le->label,
+				   le);
 	if (ret)
 		goto out_free_desc;
 
@@ -1052,7 +1052,7 @@ static ssize_t lineinfo_watch_read(struct file *filep, char __user *buf,
 static int gpio_chrdev_open(struct inode *inode, struct file *filp)
 {
 	struct gpio_device *gdev = container_of(inode->i_cdev,
-					      struct gpio_device, chrdev);
+						struct gpio_device, chrdev);
 	struct gpio_chardev_data *priv;
 	int ret = -ENOMEM;
 
-- 
2.27.0

