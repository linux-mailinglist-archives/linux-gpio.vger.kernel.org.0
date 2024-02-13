Return-Path: <linux-gpio+bounces-3228-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B175E852C3F
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 10:31:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A49E28462A
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 09:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06AF8225A9;
	Tue, 13 Feb 2024 09:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Fd7Rhiyl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262A222319
	for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 09:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707816676; cv=none; b=beOvH+ie5vJ6MpmfabqRvpOz7Iyd4nPj1HrrazN9NRKl3HYkZFKw+4MRJEp9BoSRelsICozQrFFn6jdg/QIOS7tz7EncRRqfj0xS7K1Osj7UX4YKDqvfRZ822JYwizK3d63Z4lsfQNIuWjh3OCf4ujgYJNNJM+wC37iRcrPM574=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707816676; c=relaxed/simple;
	bh=una9vqr9afr38wBVZw0pqukTIf2ij0dBOF7F5Fkbkck=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=etpqcTSdzOVXiYKAcX+GEDkYFfKkZlwHoWI22DUyIdHN2SRW8yFg+zwHVsbeT3g9y2S31lSIuHsb6qhRNAtkO9pD5f/bO19oFwE6PbxmAw1D/CHwuW7DmpA2I5LxCqpTaMh7Q3CeHO2wr54enEX4mblBV1iKJlLONXNzN4Iu37U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Fd7Rhiyl; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33ce0730e25so73906f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 01:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707816672; x=1708421472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wG6v3UogFkM+UNCdDFGKO2I94s5BqeEYEkiY+5bnH8M=;
        b=Fd7RhiylHIo9uPmZ7YhBGmnlLqbgsyqGu+Bylz5c184pkmkMOpxSfxhyYM32Q4ZIUl
         wlE0VxOsTUBQ3MjgTnokL2KmzGLI3KXFgE19GnEZKbMFB+DjYU1CXbRFxiQx66yIoSkA
         Fnf+mWWc9e8xmw2JKoFSxbOSACS39Qp2WVbheCZrBCOAAyC30CfkpLwVXBn4d7+mft+B
         Ncax6JnMo+dQDUEKZwkw+8kzLjwkUcJNO22XNRZr34Vpq0WCDtgNJMjBzB7yFge9SVQe
         7tJ15MOXAmIQ1Uks5bGJbuIAYQsmwwdwSRZZ/QSsjNO6uyyftB34VCcc+ZqOPEi/CPSu
         Nhpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707816672; x=1708421472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wG6v3UogFkM+UNCdDFGKO2I94s5BqeEYEkiY+5bnH8M=;
        b=bKiKp5t/egFjiFhGySTHfe//h4DI3Z5mkCp+bmg/awMaUdRSVUuBxsjGsjxo8t/XoZ
         4jjf/jOhj1p1b2HPJXbj21JHBwxMJEt5349ZFSr6XwG3guyrMKxayrsq1MQijYHla3sR
         gDLDmxZa2yuh35xTOX053oSSKAzfCAJ+HyQSJTZTMkLxafRXqDGOhy/Czex/57wSW9g9
         cAG0hcUMygklQeC1eoBGIpSh4b/ndtxQSsEbk400WfM4sdKixp8aAbbDLTscMer9ZQmf
         Jl15bcyJBZQIH2rT9OuBdtK0G7izDp/RUn6TREE/Dfq7Uw6n1WMjXtV4Ch72y7c2BYyU
         IjRQ==
X-Gm-Message-State: AOJu0YygMg3/YyyY4IOtv7gMB+hzrjbQDqnaAC6ovGLuw978hClW2h1n
	Zig69DE46UgcR5Uk+JdQ4OYBcKAa3fe/kj3FafiQkVOPMILv9LCYK1Tamo7HDYY=
X-Google-Smtp-Source: AGHT+IHrGOprDXRDU7JOCzMSSH5ai8tt7kG/V3VKXT3yiXGl9NEsi00kOEQxL3WcZ+0+OI+DO65/Bg==
X-Received: by 2002:adf:fd4e:0:b0:33c:e1ec:1963 with SMTP id h14-20020adffd4e000000b0033ce1ec1963mr74560wrs.64.1707816672453;
        Tue, 13 Feb 2024 01:31:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVDrLAvbks5O/HaHn03tFg6aPUQ5rLMoNBA4lCA8LPd5q0Qxkfzkhm0ucHBOyIJnKADycj5qtAhKGbpSIGFcPS8aZILTvcbC+L7TtIXphpiMpxB+tSKC+suPw+HRlf7QiOeuzD3Xd07BgTByqrngMxBOSuBCwf5H+uZxsiYUdGcLTygewrGk4IGuZKG4gSacqNCgqPf2MAjkra5tSRjDWtncG9YmBLRnYThmsygbJKpMqI6QsslPSWjEzkD+PPtD+13VyAss/bPdlk91p3wrgiLauwL8XNrMLs+Fo2ZBO6vdQm6LbKLiCUCwJJ2Gxn2tlzAkbphOG0yzFCePFG2tcYWnFwgDzV4LS2y3KmqUm0=
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f634:2e37:58a9:242a])
        by smtp.gmail.com with ESMTPSA id p16-20020adfcc90000000b0033b2497fdaesm8980897wrj.95.2024.02.13.01.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 01:31:11 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@the-dreams.de>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel test robot <oliver.sang@intel.com>
Subject: [PATCH 1/3] gpio: take the SRCU read lock in gpiod_hog()
Date: Tue, 13 Feb 2024 10:31:06 +0100
Message-Id: <20240213093108.13922-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240213093108.13922-1-brgl@bgdev.pl>
References: <20240213093108.13922-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

gpiod_hog() may be called without the gpio_device SRCU read lock taken
so we need to do it here as well. It's alright if someone else is
already holding the lock as SRCU read critical sections can be nested.

Fixes: d83cee3d2bb1 ("gpio: protect the pointer to gpio_chip in gpio_device with SRCU")
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202402122234.d85cca9b-lkp@intel.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 82811d9a4477..c1391a9a0af6 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4492,24 +4492,27 @@ EXPORT_SYMBOL_GPL(gpiod_get_index_optional);
 int gpiod_hog(struct gpio_desc *desc, const char *name,
 	      unsigned long lflags, enum gpiod_flags dflags)
 {
-	struct gpio_chip *gc;
+	struct gpio_device *gdev = desc->gdev;
 	struct gpio_desc *local_desc;
 	int hwnum;
 	int ret;
 
+	CLASS(gpio_chip_guard, guard)(desc);
+	if (!guard.gc)
+		return -ENODEV;
+
 	if (test_and_set_bit(FLAG_IS_HOGGED, &desc->flags))
 		return 0;
 
-	gc = gpiod_to_chip(desc);
 	hwnum = gpio_chip_hwgpio(desc);
 
-	local_desc = gpiochip_request_own_desc(gc, hwnum, name,
+	local_desc = gpiochip_request_own_desc(guard.gc, hwnum, name,
 					       lflags, dflags);
 	if (IS_ERR(local_desc)) {
 		clear_bit(FLAG_IS_HOGGED, &desc->flags);
 		ret = PTR_ERR(local_desc);
 		pr_err("requesting hog GPIO %s (chip %s, offset %d) failed, %d\n",
-		       name, gc->label, hwnum, ret);
+		       name, gdev->label, hwnum, ret);
 		return ret;
 	}
 
-- 
2.40.1


