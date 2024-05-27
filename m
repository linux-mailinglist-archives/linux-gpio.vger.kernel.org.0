Return-Path: <linux-gpio+bounces-6643-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B458CFF69
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 13:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2CC328545D
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 11:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F23415E5C9;
	Mon, 27 May 2024 11:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KG64d+DC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8899313AA31;
	Mon, 27 May 2024 11:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716810884; cv=none; b=MR09q4QFHeXdQWtm5OQsaNMK/nwW+/sV6iIwRMGWqFFE2Ulfe7mp0gugBnhPLV2F96Qn7Ta2MxQIvhf6DZXgq++NpAqvf6J9heSBEIsJ8FPs0YAUMnxAwzrMDeJAndIyzbDg17Vqz+4pus5GiqJc9Y4OfqgIRBwSfpajRCpAD4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716810884; c=relaxed/simple;
	bh=UeKu1anSSx/heAnksOb9OY/e1ocsm3apk+xTukJJzeY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iqvQ6FDTUlqeXCXao/uVT02gg15eHsBycI0Pw/UJJz5D/Qc0s+OsswRYE7vzH+34VtZcFTCY+/4DE5y4+y4xopHlmv0laq/NmNInGShpN/+tO0DPScRyl3iJqPZC9qAizHAgeA2I4Z+DycsU32piPT6bbQ5FjmZVOeQ99PKwT0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KG64d+DC; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6f8ec7e054dso1964658b3a.2;
        Mon, 27 May 2024 04:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716810883; x=1717415683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jYNZGuufvcnAd1nYnzFJWOOAgslXCStrEQYQHkxTy0=;
        b=KG64d+DCxca9U6AdJWl9146yeeIsvLTJnahgEQY2G04c3Y7QmZ8WDGEPqJOFylDS+S
         9ucQYJJ8CMWutZeiqw0Ni1g6y3a0dDxoZ3n9hsPq+iIE7fDPZQKCcgA/u2axdqP6oXcJ
         neyVlDoHFfS5iVhqo+TPql5RgQaWaiP9E8TQeH24i74gxhyx9cujspLdS9vxvQOjO2fK
         cAUNIbygRzHsdOGCC3ctemlxfzRgEdwCpzcqnxzL9C2k7NAwgIHt8s5stI3rPa+HF182
         0yWYtCqCWDJZVGw9lfkXu+Koe/cOlfoGsRHbH+6n0CBVt8C+IfbgjNjsifG6KHE8l1+8
         H7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716810883; x=1717415683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jYNZGuufvcnAd1nYnzFJWOOAgslXCStrEQYQHkxTy0=;
        b=B59Zr1SVtP9jKlmRls+rO0/R9LPViqlV289VsyaaRo9hBnYGpYiF2hMBLGnf0zAm0M
         j9ShPVbx0KYtliDtHx248Ari11oNcH8F1g/UrEdjYlfznyKAdZKzQOyIHkbtPXsFagAq
         s3GiFZwgkwh9HS8DEE2HooZMEviWZV8hPlBnt4vxonkGzb+D6T9/CZQ6omolyHFHSFQP
         IhfIw7HSiHB8Q/b6GPgOfwLzLHWOjFWgNTJWHxNcDA0CY6X/XGKeP9AkDkwywCf6Wk7m
         D2C/ODz9c/IJ7gflJBAlOBlrdYDpq2ksKdKFpuRh/Gd99XSRE4nmSrfymLjOkhdRTcye
         5tAg==
X-Forwarded-Encrypted: i=1; AJvYcCVxLu3BlTSlXMj68ZxHX9TszKNGBcbX3O0dX344n/KOHzODBOX81qy7RxN+ROqHdPdc6k3Ea45TeNXvFfZbeCTh6BvtJsCIIGCvGA==
X-Gm-Message-State: AOJu0Yz7jvnjNlFkObU6tMGVJHxUiyljF6r3ln12gcDu68VMxl8UYkFK
	aU4WIK8Xjkn7+Hgsnp1X38iP2BsVOhIM1kKdXeJXAUXYeQ5RPvIGDy52EA==
X-Google-Smtp-Source: AGHT+IFA14Kq8CMO1mVJAzbZbOFEgQFNvES93H+6KUiHExk9/vPw6dyfDPxBDNlv2Mgs4WrQgzyv9A==
X-Received: by 2002:a05:6a00:27a9:b0:6ed:d8d2:5040 with SMTP id d2e1a72fcca58-6f8f3b38a8emr13144173b3a.21.1716810882608;
        Mon, 27 May 2024 04:54:42 -0700 (PDT)
Received: from rigel.home.arpa (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fcbea8a9sm4749256b3a.139.2024.05.27.04.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 04:54:42 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 1/3] gpiolib: cdev: Add INIT_KFIFO() for linereq events
Date: Mon, 27 May 2024 19:54:17 +0800
Message-Id: <20240527115419.92606-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240527115419.92606-1-warthog618@gmail.com>
References: <20240527115419.92606-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The initialisation of the linereq events kfifo relies on the struct being
zeroed and a subsequent call to kfifo_alloc().  The call to kfifo_alloc()
is deferred until edge detection is first enabled for the linereq.  If the
kfifo is inadvertently accessed before the call to kfifo_alloc(), as was
the case in a recently discovered bug, it behaves as a FIFO of size 1 with
an element size of 0, so writes and reads to the kfifo appear successful
but copy no actual data.

As a defensive measure, initialise the kfifo with INIT_KFIFO() when the
events kfifo is constructed.  This initialises the kfifo element size
and zeroes its data pointer, so any inadvertant access prior to the
kfifo_alloc() call will trigger an oops.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 9dad67ea2597..d4e47960cc98 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1774,6 +1774,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 
 	mutex_init(&lr->config_mutex);
 	init_waitqueue_head(&lr->wait);
+	INIT_KFIFO(lr->events);
 	lr->event_buffer_size = ulr.event_buffer_size;
 	if (lr->event_buffer_size == 0)
 		lr->event_buffer_size = ulr.num_lines * 16;
-- 
2.39.2


