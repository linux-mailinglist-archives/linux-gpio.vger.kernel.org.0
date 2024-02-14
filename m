Return-Path: <linux-gpio+bounces-3255-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EECD854428
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 09:44:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B70EAB24762
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 08:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 795DF6FA8;
	Wed, 14 Feb 2024 08:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wrVVXI0B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A48125DD
	for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 08:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707900266; cv=none; b=X2EfMW1ngmbVfJbHkbFwfPcraIsoUbyB7qTiuYrfBeC8aywkliQOdq9qyAChCQgnWi0ixtm1oHGygSHAuwUV+okX323qeLJeKmZxaP8oTUjdcIuz8bFFF4D4w20Hn93DukPjaI3UGMc6mVUysssULer3Lbt9SH46ljNYddTy2nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707900266; c=relaxed/simple;
	bh=sPVJWBFhHnYwYzLri16FPQ1ykc29PKVbAmCqTRjyvs4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IoKiT1CYKJNqNjDu/X/LV2sSa5cqjpQlNGqrr5XjCgoSkJpUQrz00XBOhO19gccKSLgcP6U7PS9SKGFldll9cwzBEFtwiFn1rJXc/LWnLJ4YM6zD92j1kjqH+IBvwGnjX3dwpuAlrU9xzbf7C3IAi2VSDMI5GsXMPdLzbhYldu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wrVVXI0B; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33cec9ca791so154005f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 00:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707900262; x=1708505062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PeHLcdFBBuPcGUe0rxv/ey6NmJBek3qex+u/1JyeGNk=;
        b=wrVVXI0Bjefxht2+lAciUzT4oliFOjNSvEkwYC0KCsUONTXoklKJrQb+McthJHiJZr
         AxqGb1F26Z5Mj9iwxd2vj/NpBlhKUiETiXwG9cjsYItlYX3MVqEYVPqjsgJzorO2gsmd
         pDTF5IF7mroWbL22ZZ84jbEtV9PS3T3iOVN76dZIQbgL5dYk5gBVMB+2yN5kRbfSSg5l
         Jz2IOWzJju+0J1PTUOS8ClBFL84GQ5PT8qg9iwww6gQHkK3kjeYWBxFOhU74cEVZQjTr
         hMpc9WT6RM9ZRWACBtGgmkOX0nLLrnsNi8c9hWoPgom1RtZ3MaeHNemxca/LV9GEW9w/
         pZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707900262; x=1708505062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PeHLcdFBBuPcGUe0rxv/ey6NmJBek3qex+u/1JyeGNk=;
        b=sy8OxPELxf0iSJuGfPAVn0TsG7pnrhqY8cDc3e2iRYuOP+Z4tq/xcFdv2i1Mr+l6dL
         2ah9Aius1t1AxHpAIB9n9wEfL3szDb3l3Am8/QXRUoKS0qU6Col5NYLspL3GvZJkq2pw
         9lKpciq/qByxC6cfW8gMAaDr6pgFOkkgRO5sWhoijmL4xG1E27DZGn3HUXBu0cdQDDu1
         E4byPmtIqZzF7zBMtoEUIYOYfHETMp9Aase9E2mXBanIBnFrMG6s5ukNoySdwxCS1ppL
         +/WT1mxaye12+OOcL+iF12N2h98qXr30ecRV/s8HqdNQPLF4OhzZYLu+Fu3QVTdAo8OK
         HALg==
X-Gm-Message-State: AOJu0Yzu30mJg57SNlrWbYUixwkXL+sn5LbdJJPF5TtQ5JQrPdkDFqFz
	aR6wzzM2FUv1/1HMuk9Au+bwUsjNWMkILxCIjDOcR8xDA7XGgDO9WTKL+Y2dYJ0=
X-Google-Smtp-Source: AGHT+IEyWGMHOn/MS8Tw7+Lmt0Oz2TP2JbnPPBnXth9rOrDfkZ6ZpXwkc/HHKV3cSu3Bs/Pqzp56+g==
X-Received: by 2002:adf:ee91:0:b0:33b:136b:1ea0 with SMTP id b17-20020adfee91000000b0033b136b1ea0mr1024576wro.21.1707900262517;
        Wed, 14 Feb 2024 00:44:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU4OLn3gMgKl50SOh4/dhj+WRte5xM70xG95aJxs3r8+cP5gEjf2U9PTXrtHwfzmKrqx1/d7esSrZ+fGIZ0f1aYTc/2Dt/AXA2HvoMQ5TjEo1QtENQQGQ7+SIv3H2bnd3qUNWAtKQTA1AjbyevJGn90bfCFSQEA87NRQqaTVGl1s/oqzEM/CgmArw8De66Ciu4foqCBi2Xh7cldUqp+imyPcK0uxMtgr0xMVG7vpXsHus7mJHoBhlgMT4e4O7awAj6p330p3aOb+XLTjqbphILQGeVaejgZ3m92jqTT+wK+yZ5GAqf6UNlnxFE64eSDKv7k6izl7P/NMxWHE4IJUFMWXJkGtCwMGd7/Z5TSpx7vZ9rZw7HGPIVrkBql6P2eAya2MiMhNQ==
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:cfee:a5b6:1f9b:9c9b])
        by smtp.gmail.com with ESMTPSA id fa1-20020a056000258100b0033b79d385f6sm9494731wrb.47.2024.02.14.00.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 00:44:22 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@the-dreams.de>,
	Mark Brown <broonie@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 0/4] gpio: fix SRCU bugs
Date: Wed, 14 Feb 2024 09:44:15 +0100
Message-Id: <20240214084419.6194-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Here are four fixes to some bugs in recent SRCU changes. The first one fixes
an actual race condition. The other three just make lockdep happy.

v1 -> v2:
- use srcu_dereference() instead of rcu_dereference_protected() as
  advised by Paul
- add a patch using rcu_dereference_check(..., 1) in deprecated
  interfaces that return the address of the RCU-protected chip structure
  to external users (who shouldn't use it anyway but well...)
- pick up review tags for patches 1/4 and 2/4

Bartosz Golaszewski (4):
  gpio: take the SRCU read lock in gpiod_hog()
  gpio: cdev: use correct pointer accessors with SRCU
  gpio: use srcu_dereference() with SRCU-protected pointers
  gpio: don't let lockdep complain about inherently dangerous RCU usage

 drivers/gpio/gpiolib-cdev.c  | 25 ++++++++++++-------------
 drivers/gpio/gpiolib-sysfs.c |  5 +++--
 drivers/gpio/gpiolib.c       | 32 ++++++++++++++++++--------------
 drivers/gpio/gpiolib.h       |  3 ++-
 4 files changed, 35 insertions(+), 30 deletions(-)

-- 
2.40.1


