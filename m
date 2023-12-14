Return-Path: <linux-gpio+bounces-1445-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0096B812C55
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 10:58:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9562E1F21852
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 09:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DAF0381BF;
	Thu, 14 Dec 2023 09:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BY8cFaej"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 187CB93;
	Thu, 14 Dec 2023 01:58:26 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3b9fcb3223dso4646909b6e.3;
        Thu, 14 Dec 2023 01:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702547905; x=1703152705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mBj7RL25jbZQJZu3V58QPdOY7UU4w5KbjP1/HAQoJQc=;
        b=BY8cFaejWGj+Kn+tbBWZBjenbCe6FqxPpf4lc/Lq5InXB+iaY0o8wYFe+reW7fkBKa
         ZLvU2d/M6M/ZEnP03EUJR0Pp7zpsZk8Ro3tHqUluMthTmHlgTHhHt61m3Xeiq8RiQT5S
         ubsH9w8nKlXO1tW132kiTYiCL0O/22IzCAnKc6EW2AajENItYgzEc/b/q1jNhO/KDh7I
         oa6R+C1PxLNzlja8ZFrwPGIcwLoVpm5YSWu0/lWMU3mij/vv3Bp1ThVb4Mq9o0SNqiEn
         HbJ6AWVyaUQGX26LmiGPNeqrQba2sVSgfrW96GNQ5MDmtqsvHJ9oJpnSHcUey39J6ru1
         6MEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702547905; x=1703152705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mBj7RL25jbZQJZu3V58QPdOY7UU4w5KbjP1/HAQoJQc=;
        b=Yt91U5YtGWNoK7UTmPpDTMSXsD4fPynVYHJKaCVpNrVvrjI59TXBIomIUcFdbDuDpr
         lWWoz55SNi2dfCSfDbMnQQKQUUYEPCvDr0oOE4G8wi55tISBcu8PyjYVj1VAJuTNlCGi
         ePhvPDcR8ua1nEQMf5ZtpDOXx4YDfa2poCxIQ/73o7yAohRb9VvQA8QPkdFHnE+Qi/I9
         IptN8wMnUrT3hco3jg26ecsB2qdFHzwa8k+mOPfPf+FsxSxmYW7ms2GNyHedqVNNyGwT
         AKqEZbl1voeFBUBhkYl7M1K/1fXEV+dMlZKUR7/knZyWz21OzIqOSwUwPnIrbaYNQ8Xw
         yiNA==
X-Gm-Message-State: AOJu0YyoqGMO2pl7A/FWQq3SkOxaKP1dr0ig9O6w0Gnu7XMXW2rVNQgm
	0cyWZiIsiIGOkfjl9XAJF4FVsfcdfOk=
X-Google-Smtp-Source: AGHT+IFkF+ufeIwxlSBBBhlDMQFiZZHm5xWiEx6PZerY3d8RjVQhhodheaErJGLQAEzehKGK/D6N+w==
X-Received: by 2002:a05:6808:1a20:b0:3b8:b063:adf7 with SMTP id bk32-20020a0568081a2000b003b8b063adf7mr13044206oib.84.1702547905174;
        Thu, 14 Dec 2023 01:58:25 -0800 (PST)
Received: from rigel.home.arpa (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id r2-20020a1709028bc200b001bc6e6069a6sm922807plo.122.2023.12.14.01.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 01:58:24 -0800 (PST)
From: Kent Gibson <warthog618@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org,
	andy@kernel.org
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 0/5] gpiolib: cdev: relocate debounce_period_us
Date: Thu, 14 Dec 2023 17:58:09 +0800
Message-Id: <20231214095814.132400-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains minor improvements to gpiolib-cdev.

Patch 1 replaces discrete lock/unlock calls around critical sections
with scoped_guard().  Excludes desc_gpio_to_lineinfo() as delaying
the change until patch 4 produces a cleaner change.

The banner change is relocating the debounce_period_us from gpiolib's
struct gpio_desc to cdev's struct line.  Patch 2 stores the field
locally in cdev.  Patch 3 removes the now unused field from gpiolib.

Patch 4 is somewhat related and removes a FIXME from
gpio_desc_to_lineinfo().  The FIXME relates to a race condition in
the calculation of the used  flag, but I would assert that from
the userspace perspective the read operation itself is inherently racy.
The line being reported as unused in the info provides no guarantee -
it just an indicator that requesting the line is likely to succeed -
assuming the line is not otherwise requested in the meantime.
Give the overall operation is racy, trying to stamp out an unlikely
race within the operation is pointless. Accept it as a possibility
that has negligible side-effects and reduce the number of locks held
simultaneously and the duration that the gpio_lock is held.

Patch 5 is unrelated to debounce or info, but addresses Andy's
recent complaint that the linereq get/set values functions are
confusing and under documented.
Figured I may as well add that while I was in there.

Changes v1 -> v2:
 (changes are to patch 2 unless otherwise noted)
 - adopt scoped_guard() for critical sections, inserting patch 1 and
   updating patch 2 and 4.
 - move rb_node field to beginning of struct line.
 - merge struct supinfo into supinfo var declaration.
 - move rb_tree field to beginning of struct supinfo.
 - replace pr_warn() with WARN().
 - drop explicit int to bool conversion in line_is_supplemental().
 - use continue to bypass cleanup in linereq_free().
 - fix typo in commit message (patch 4)

Kent Gibson (5):
  gpiolib: cdev: adopt scoped_guard()
  gpiolib: cdev: relocate debounce_period_us from struct gpio_desc
  gpiolib: remove debounce_period_us from struct gpio_desc
  gpiolib: cdev: reduce locking in gpio_desc_to_lineinfo()
  gpiolib: cdev: improve documentation of get/set values

 drivers/gpio/gpiolib-cdev.c | 403 +++++++++++++++++++++++-------------
 drivers/gpio/gpiolib.c      |   3 -
 drivers/gpio/gpiolib.h      |   5 -
 3 files changed, 260 insertions(+), 151 deletions(-)

--
2.39.2


