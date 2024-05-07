Return-Path: <linux-gpio+bounces-6190-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6348BE1C4
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 14:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E41A4B240B2
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 12:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58386158A14;
	Tue,  7 May 2024 12:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vi0bfqdY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205B1156F48
	for <linux-gpio@vger.kernel.org>; Tue,  7 May 2024 12:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715084043; cv=none; b=K5PksESEDunnqhpF8iKFLKbwESO3QE0VnmDTZbat4mITVOExQPXCMjI43Hf/WDecD0xojco0YtclcVLiT006Ye2YxuQZ42EaIs+22qFEAdTap89L4AToRg9FZT7lGJGQG9tNrsCe0JrmiApkMIrsdzG9en1vRN4ab32q+6o2qyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715084043; c=relaxed/simple;
	bh=YmEEmeOOuxBpCRFm3B7ZNV+yLdnCW/FwbQ/WUKdOoGs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LCPzC6rIC8oPDgciRrIFVchkhhrPONDcPQpUYADmGMLuMarf9CcGOVCNd8+bu3kGWh4ClFWBGiY3l/AddOU7BVsAOFNKW61XYJ8ZjMpBuVqNDloV057qUhx/szXTPrkfEGzI07NFWHTKbYH8WGNCwp792GGjuzUCMPnqQcFLfow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vi0bfqdY; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2df848f9325so36079641fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 May 2024 05:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715084039; x=1715688839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t0xYGvyCqThiXi92JPmsLGgx6g9ZynPSql0gnOVBw6A=;
        b=vi0bfqdYdCQkAWqd+sPGUSvGpUCeiEgbsObSGsvBhZkMV/rqlZxdyATojFeycXRzQM
         GHLKbYOUOJcN2sLH28IZX2GTJteKKGyHZAhja8VwJmmGjkmCcCpbTJBagWpn7Qj2hKbq
         rZEPfOSH4BDvzfSlQ/fP2+LEPHkW2xsK5+UOuk6hJx0PQoLu2yd++Xd28XoDg/O9B4Ns
         8/MaXj+1Q/miPqF6tyUiptpSL8iA4Kwtp3zx72TZZ/qyWNCmhYmH+oGY4Xu8l3LyL9zU
         wg0YH8s68d7pMIjMG2j97O7jzenebd8UYJwRA1wuMqHS3lXGS7a2EC7xqzXkMq/SDpMj
         lz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715084039; x=1715688839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t0xYGvyCqThiXi92JPmsLGgx6g9ZynPSql0gnOVBw6A=;
        b=seSYT6S6gSxNMllKo/1aqMCn+JoMhHhWQ47Yy8z4UDafjR6oZ7c9qcYLJQugWvkzl2
         8F8ztUQcqoUlBxfk6MFrle6R/BTKP9FJKLx8rPn1o6WBTlmBw23fERvewI2iXn3g0qGC
         I1PlACTVU5k10mNYNn4S+WFSsa4BOmN3NLh/yk5yafLUlj824GrFxMBHWOLVCmWEPrxs
         ePTjM0PjAFH0YkmAki1IQGz2sppLpYmtysqW3DB6D8edKtQWWUReVs7XiVHLQJo2Dovh
         2M2x7TidiqeVmrjkOgoFjTbJN1dffLs8XUIt0iRWUrkT95oKP1koG149EKdBZl2zvq7X
         E2Rg==
X-Gm-Message-State: AOJu0YwWT4JAfTcwUpb0GrvGNHoCND+8/qiG8jvkq+cZSkd5fKMMjocf
	ycEfiWN+8gL7it3VG3rNHo4nqYBSlJU2u+NZ3ElP7PrMAlXmrUwqjq1SiO9uQNQ=
X-Google-Smtp-Source: AGHT+IHqZmm/9CXxuZRWSrHF2jIwUqNosYeCMXFgKJuOogWtmjLuPQQfv8CHvd9GnoCq1Y37CfxRcA==
X-Received: by 2002:ac2:53b3:0:b0:51c:1cdb:566f with SMTP id j19-20020ac253b3000000b0051c1cdb566fmr7964786lfh.11.1715084039082;
        Tue, 07 May 2024 05:13:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:581a:1d:3b79:3b03])
        by smtp.gmail.com with ESMTPSA id bg5-20020a05600c3c8500b0041bbec72670sm19585693wmb.39.2024.05.07.05.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 05:13:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	"Paul E . McKenney" <paulmck@kernel.org>
Subject: [PATCH] gpiolib: fix the speed of descriptor label setting with SRCU
Date: Tue,  7 May 2024 14:13:46 +0200
Message-Id: <20240507121346.16969-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Commit 1f2bcb8c8ccd ("gpio: protect the descriptor label with SRCU")
caused a massive drop in performance of requesting GPIO lines due to the
call to synchronize_srcu() on each label change. Rework the code to not
wait until all read-only users are done with reading the label but
instead atomically replace the label pointer and schedule its release
after all read-only critical sections are done.

To that end wrap the descriptor label in a struct that also contains the
rcu_head struct required for deferring tasks using call_srcu() and stop
using kstrdup_const() as we're required to allocate memory anyway. Just
allocate enough for the label string and rcu_head in one go.

Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
Closes: https://lore.kernel.org/linux-gpio/CAMRc=Mfig2oooDQYTqo23W3PXSdzhVO4p=G4+P8y1ppBOrkrJQ@mail.gmail.com/
Fixes: 1f2bcb8c8ccd ("gpio: protect the descriptor label with SRCU")
Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 31 ++++++++++++++++++++++++-------
 drivers/gpio/gpiolib.h |  7 ++++++-
 2 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 94903fc1c145..2fa3756c9073 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -101,6 +101,7 @@ static bool gpiolib_initialized;
 
 const char *gpiod_get_label(struct gpio_desc *desc)
 {
+	struct gpio_desc_label *label;
 	unsigned long flags;
 
 	flags = READ_ONCE(desc->flags);
@@ -108,23 +109,36 @@ const char *gpiod_get_label(struct gpio_desc *desc)
 	    !test_bit(FLAG_REQUESTED, &flags))
 		return "interrupt";
 
-	return test_bit(FLAG_REQUESTED, &flags) ?
-			srcu_dereference(desc->label, &desc->srcu) : NULL;
+	if (!test_bit(FLAG_REQUESTED, &flags))
+		return NULL;
+
+	label = srcu_dereference_check(desc->label, &desc->srcu,
+				       srcu_read_lock_held(&desc->srcu));
+
+	return label->str;
+}
+
+static void desc_free_label(struct rcu_head *rh)
+{
+	kfree(container_of(rh, struct gpio_desc_label, rh));
 }
 
 static int desc_set_label(struct gpio_desc *desc, const char *label)
 {
-	const char *new = NULL, *old;
+	struct gpio_desc_label *new = NULL, *old;
 
 	if (label) {
-		new = kstrdup_const(label, GFP_KERNEL);
+		new = kzalloc(struct_size(new, str, strlen(label) + 1),
+			      GFP_KERNEL);
 		if (!new)
 			return -ENOMEM;
+
+		strcpy(new->str, label);
 	}
 
 	old = rcu_replace_pointer(desc->label, new, 1);
-	synchronize_srcu(&desc->srcu);
-	kfree_const(old);
+	if (old)
+		call_srcu(&desc->srcu, &old->rh, desc_free_label);
 
 	return 0;
 }
@@ -697,8 +711,11 @@ static void gpiodev_release(struct device *dev)
 	struct gpio_device *gdev = to_gpio_device(dev);
 	unsigned int i;
 
-	for (i = 0; i < gdev->ngpio; i++)
+	for (i = 0; i < gdev->ngpio; i++) {
+		/* Free pending label. */
+		synchronize_srcu(&gdev->descs[i].srcu);
 		cleanup_srcu_struct(&gdev->descs[i].srcu);
+	}
 
 	ida_free(&gpio_ida, gdev->id);
 	kfree_const(gdev->label);
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index f67d5991ab1c..69a353c789f0 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -137,6 +137,11 @@ int gpiod_set_transitory(struct gpio_desc *desc, bool transitory);
 
 void gpiod_line_state_notify(struct gpio_desc *desc, unsigned long action);
 
+struct gpio_desc_label {
+	struct rcu_head rh;
+	char str[];
+};
+
 /**
  * struct gpio_desc - Opaque descriptor for a GPIO
  *
@@ -177,7 +182,7 @@ struct gpio_desc {
 #define FLAG_EVENT_CLOCK_HTE		19 /* GPIO CDEV reports hardware timestamps in events */
 
 	/* Connection label */
-	const char __rcu	*label;
+	struct gpio_desc_label __rcu *label;
 	/* Name of the GPIO */
 	const char		*name;
 #ifdef CONFIG_OF_DYNAMIC
-- 
2.40.1


