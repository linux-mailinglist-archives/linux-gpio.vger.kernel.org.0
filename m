Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD0B204838
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 06:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732031AbgFWECK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 00:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbgFWECI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 00:02:08 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5073C061573;
        Mon, 22 Jun 2020 21:02:06 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id m2so962510pjv.2;
        Mon, 22 Jun 2020 21:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XEdwtZn26imrCkt25Pr1evOid1QRT01u+KZPl8Fb7qQ=;
        b=ujx/8WkDTr1gvPUZeSWQDcxlimdLIW78wuspbic1RDxHgIVT3T9RBr0/soB0lWqyk0
         od0W/auoMk3GYEi7/3is39NtNmi89wum+PMB8d4WWZ4mhTlFlFVkk6YhKD7UIYVVyz99
         MzYosbaErkzmVRS40p4GUuHHDEZkbzZrx8FeIWCWIrFLtjEmFQGotvyisaoRejx7X6rQ
         KhT5TG8xDqPi5nM9AP9IlCv0TjGGUnm0FyHvAtqgrtDta71lJFH4FdEmXOcIXh9mPPHC
         0wsRbd2zPuvxUAOoLr64b3ZMYCXAeMkxCKpdb3V1YZHnXE/HkFVMMnb8tyMD42s1bitG
         zFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XEdwtZn26imrCkt25Pr1evOid1QRT01u+KZPl8Fb7qQ=;
        b=EDRq+ZnneQmQoiAmn1b+5FMdES8hgaYcdGeEvpLp8Yz7jLlQ3y7O+LgPh5UgD/mCZg
         xU3UpLSOGkgQ3VLAy2DYykS6n36rG4diS84Rd2JiiOs1JrFSg5xFErR9mocVzr7PbYLi
         gay8K7U519gssAPAQxFYVaTur6d8GPDZcglnWVkVklqPFhA+2Os5CHfGxm8UEAhfC/TN
         d0aJZUvK2HiwdlxiX2+IOwKwFRFvJxfs5g4g079KaZ/jj3d3bwAIna8uui25smTMZCnQ
         vk9hMw0CembbMeScUn6QgHwnH5Y5daU3T1FwUCXtblHVy2eBEp9SpJ2ANeKoUvbqeR7O
         8LNw==
X-Gm-Message-State: AOAM533QYJ0NEujmP1Z8rRvp2QLHD+z+Dxs4oqovDiXoyXQ5CXqF7hTf
        dG08dWnmATcqfwrF+LYQfg/+r7buOrQ=
X-Google-Smtp-Source: ABdhPJyzvr4iYOzQUIJTNl9GLeQL5qbXQqESEcOabhcWJdff532qsngCzdfitfYynNZmfZ40Z4aSKQ==
X-Received: by 2002:a17:902:6ac2:: with SMTP id i2mr21689981plt.243.1592884925931;
        Mon, 22 Jun 2020 21:02:05 -0700 (PDT)
Received: from sol.lan (220-235-126-59.dyn.iinet.net.au. [220.235.126.59])
        by smtp.gmail.com with ESMTPSA id n64sm12442315pga.38.2020.06.22.21.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 21:02:05 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 04/22] gpiolib: cdev: refactor gpiohandle_flags_to_desc_flags
Date:   Tue, 23 Jun 2020 12:00:49 +0800
Message-Id: <20200623040107.22270-5-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623040107.22270-1-warthog618@gmail.com>
References: <20200623040107.22270-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Refactor the mapping from handle flags to desc flags into a helper
function.

The assign_bit is overkill where it is replacing the set_bit cases, as is
rechecking bits known to be clear in some circumstances, but the DRY
simplification more than makes up for any performance degradation,
especially as this is not a hot path.

Signed-off-by: Kent Gibson <warthog618@gmail.com>

---
 drivers/gpio/gpiolib-cdev.c | 60 ++++++++++++-------------------------
 1 file changed, 19 insertions(+), 41 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 889ed2dc9e58..e64613b8d0ba 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -106,6 +106,22 @@ static int linehandle_validate_flags(u32 flags)
 	return 0;
 }
 
+static void linehandle_flags_to_desc_flags(u32 lflags, unsigned long *flagsp)
+{
+	assign_bit(FLAG_ACTIVE_LOW, flagsp,
+		   lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW);
+	assign_bit(FLAG_OPEN_DRAIN, flagsp,
+		   lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN);
+	assign_bit(FLAG_OPEN_SOURCE, flagsp,
+		   lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE);
+	assign_bit(FLAG_PULL_UP, flagsp,
+		   lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP);
+	assign_bit(FLAG_PULL_DOWN, flagsp,
+		   lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN);
+	assign_bit(FLAG_BIAS_DISABLE, flagsp,
+		   lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE);
+}
+
 static long linehandle_set_config(struct linehandle_state *lh,
 				  void __user *ip)
 {
@@ -113,7 +129,6 @@ static long linehandle_set_config(struct linehandle_state *lh,
 	struct gpio_desc *desc;
 	int i, ret;
 	u32 lflags;
-	unsigned long *flagsp;
 
 	if (copy_from_user(&gcnf, ip, sizeof(gcnf)))
 		return -EFAULT;
@@ -125,25 +140,7 @@ static long linehandle_set_config(struct linehandle_state *lh,
 
 	for (i = 0; i < lh->numdescs; i++) {
 		desc = lh->descs[i];
-		flagsp = &desc->flags;
-
-		assign_bit(FLAG_ACTIVE_LOW, flagsp,
-			lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW);
-
-		assign_bit(FLAG_OPEN_DRAIN, flagsp,
-			lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN);
-
-		assign_bit(FLAG_OPEN_SOURCE, flagsp,
-			lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE);
-
-		assign_bit(FLAG_PULL_UP, flagsp,
-			lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP);
-
-		assign_bit(FLAG_PULL_DOWN, flagsp,
-			lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN);
-
-		assign_bit(FLAG_BIAS_DISABLE, flagsp,
-			lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE);
+		linehandle_flags_to_desc_flags(gcnf.flags, &desc->flags);
 
 		/*
 		 * Lines have to be requested explicitly for input
@@ -306,19 +303,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 			goto out_free_descs;
 		lh->descs[i] = desc;
 		count = i + 1;
-
-		if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
-			set_bit(FLAG_ACTIVE_LOW, &desc->flags);
-		if (lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN)
-			set_bit(FLAG_OPEN_DRAIN, &desc->flags);
-		if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
-			set_bit(FLAG_OPEN_SOURCE, &desc->flags);
-		if (lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE)
-			set_bit(FLAG_BIAS_DISABLE, &desc->flags);
-		if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)
-			set_bit(FLAG_PULL_DOWN, &desc->flags);
-		if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)
-			set_bit(FLAG_PULL_UP, &desc->flags);
+		linehandle_flags_to_desc_flags(handlereq.flags, &desc->flags);
 
 		ret = gpiod_set_transitory(desc, false);
 		if (ret < 0)
@@ -685,14 +670,7 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	le->desc = desc;
 	le->eflags = eflags;
 
-	if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
-		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
-	if (lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE)
-		set_bit(FLAG_BIAS_DISABLE, &desc->flags);
-	if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)
-		set_bit(FLAG_PULL_DOWN, &desc->flags);
-	if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)
-		set_bit(FLAG_PULL_UP, &desc->flags);
+	linehandle_flags_to_desc_flags(lflags, &desc->flags);
 
 	ret = gpiod_direction_input(desc);
 	if (ret)
-- 
2.27.0

