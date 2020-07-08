Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7D4A217E0B
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 06:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgGHETC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 00:19:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgGHETC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 00:19:02 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D987C061755;
        Tue,  7 Jul 2020 21:19:02 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id d10so17635270pls.5;
        Tue, 07 Jul 2020 21:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=97IajNvsl9y2bLP52rhhZb3Pr52WjicYWnAeK4dyEeU=;
        b=TXOm5CrS3XQG+gQAdKgXW89QqIPDg8rPRIVIB2tDEOM045M5M+OZSzEtKD5tcwRYvP
         bwPMddwiYWR+VjS1UWUpoHzJkLJS3IZFb1E+PPk2wre1/DNqXIWFNUWYRdOrzSlAfVwp
         jC2VV/7zD8TXDJmvfWgTeFZNklfAj8WRp+T2Z9VfsLKp6MVy/Gr+zLvrj79as8j+OIk9
         2u/PHFUwwL8c8GghnBOD+UMTw1eZ69SvZBEExOoPOESFaiHfx5ub06dlNQAggROE5q3O
         LW+zJwtqaIPPehPHjch0R//hYIudRAjvwD9E9PoHw7vYELGWhgdDqlF9c2Ofqc8n/56H
         6jWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=97IajNvsl9y2bLP52rhhZb3Pr52WjicYWnAeK4dyEeU=;
        b=DCe54wqTyb97nzaGPnMojHVZSTkMsL0JEsG5Noa0uCcIOBDvtWwDjoEBfBWO51ALZF
         PslGL/0N9y+N9+S83ckE01onoDUXXKiLidQ8Y+rm2UonX/6d71pXx/emiJSQQab1Mwx6
         7yynEIW+xxugwV/cAGvIzNAjf9VbxsBVOSmi6PREPHsTJlHv/5ZjJT25H/mgQA9L+WnW
         OTfVLTLhIBrhwyRCzTrr8KEsQ+pVeor14BE+C10EtVJnxgSAq8KkMh9V7uFH2DP1FEMY
         MRTuKItpy7wKUJCYeiZjoZJIVzujK0BReC521hm3kFhqb0Rqb1pmxCH+HDQSz9esgeYn
         8MgQ==
X-Gm-Message-State: AOAM5302YO9dWjSzS4WbhgLUEKXUssbU1MIW4Z5hucus+dNDC5USRQV0
        d3uEBpyRaMXnKWWSr2lZGIQEn8De
X-Google-Smtp-Source: ABdhPJwNGqu/k1mFqMjZJyUCVSPtP9SjsIJvdBxgOtXaWTdfzVTTsNCpLwVCQCoduJGkrKjS3SLzjw==
X-Received: by 2002:a17:90a:1a8a:: with SMTP id p10mr7518643pjp.236.1594181941201;
        Tue, 07 Jul 2020 21:19:01 -0700 (PDT)
Received: from sol.lan (106-69-191-222.dyn.iinet.net.au. [106.69.191.222])
        by smtp.gmail.com with ESMTPSA id gx23sm3821951pjb.39.2020.07.07.21.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 21:19:00 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 04/17] gpiolib: cdev: refactor gpiohandle_flags_to_desc_flags
Date:   Wed,  8 Jul 2020 12:15:47 +0800
Message-Id: <20200708041600.768775-5-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200708041600.768775-1-warthog618@gmail.com>
References: <20200708041600.768775-1-warthog618@gmail.com>
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

