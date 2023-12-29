Return-Path: <linux-gpio+bounces-1920-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 108F0820135
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Dec 2023 20:42:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADD95283802
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Dec 2023 19:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9695912E6D;
	Fri, 29 Dec 2023 19:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="x152BwaC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E68D12E5C
	for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 19:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40d5b89e2bfso30642415e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 11:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703878943; x=1704483743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NgntDhYc8DJ9nZgWa+zaEF/5fvlN1hFZrs4j0lTtCX0=;
        b=x152BwaCWjrKdjQqknTosRC/KuGu/4XfknemxDw1n6TGVv6aA26i59Sj6W3ju3bQEk
         H/yKafM8AlsTd9eFMiAOnQRLKLoPy6QYYbMAWnGl65+u8j3O31rIfa0nXTt4KK5BAPY5
         bQDFGLXHh08O8Trco6nGobEcB+mrD8uLojFfzxKQQdjKRGYqJWwp2SxUSKCexEyFpJ+v
         sIUwOdYU2Ae5XMsAPfiYMXJXyHcAiNmatYyy+bldXcIvupnpQ3T1sLpFjW7o2fwsebN/
         RdywfSPV5okaUs6j5sWM9Po4NU2qQ890MMgtMUXDoxg7xv8Jt1ykSb87JTsQoHFOuFu0
         8zsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703878943; x=1704483743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NgntDhYc8DJ9nZgWa+zaEF/5fvlN1hFZrs4j0lTtCX0=;
        b=TNVsogcRjzbsoQHa7EhXwI5Nw8Y+/0AE4Vmqfx/9tnQ9YXZ+EFBMl1pAZCOTu5571E
         +JEYfISt9i2NGXJvMWqTWcA9EtATToPcPHC9gJ+afZ+nhm2cCyG5j7Tn+UGE9HqW7o1i
         w3ZkhgmNaqACObhtpPx4y581gICa1BkcY4CaysTOAMXU0M3IBHl+5owdNMqhZfDx5Uj/
         zZsbFP/WXxhdmZ73P4OM936Xf9CpCN3BRxNigZ8+4vQHNgvySOJjk2M2n7Imjgd7G8hx
         3QFvpmLaBwz/KTTf+CJPZRYrYIGDVP69/O9XpRw+B+riGRZiE8t3LG80rUPsgsCRvU5s
         L/Ww==
X-Gm-Message-State: AOJu0YxcL8pfTc8tUkEH+xN80maTuJ/YzFU+SJigPxmQyI4baSLISVmu
	I9ez/VPNHopND13O5/7KOEKcNOVb2f/0bqtaWLrBHdHC/g0=
X-Google-Smtp-Source: AGHT+IHF7I910HNtMADesG+78goQVzXaVQF/TyfVSc1zofDnf2jnbSKyluUBwBhEs85INla9jRNc4g==
X-Received: by 2002:a05:600c:45cf:b0:40d:5ccd:4f93 with SMTP id s15-20020a05600c45cf00b0040d5ccd4f93mr2230387wmo.94.1703878942597;
        Fri, 29 Dec 2023 11:42:22 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:b37:e8fb:2482:e47])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600c350900b0040d5aca25f1sm13038779wmq.17.2023.12.29.11.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 11:42:22 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.7-rc8
Date: Fri, 29 Dec 2023 20:42:09 +0100
Message-Id: <20231229194209.13630-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Here is a set of updates to the MAINTAINERS file, please pull for
the upcoming RC.

Thanks,
Bartosz Golaszewski

The following changes since commit 861deac3b092f37b2c5e6871732f3e11486f7082:

  Linux 6.7-rc7 (2023-12-23 16:25:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.7-rc8

for you to fetch changes up to ad5575eb6278892aa25a5d249c5009860d6d8bbc:

  MAINTAINERS: Add a missing file to the INTEL GPIO section (2023-12-27 15:55:44 +0100)

----------------------------------------------------------------
gpio fixes for v6.7-rc8

- Andy steps down as GPIO reviewer
- Kent becomes a reviewer for GPIO uAPI
- add missing intel file to the relevant MAINTAINERS section

----------------------------------------------------------------
Andy Shevchenko (2):
      MAINTAINERS: Remove Andy from GPIO maintainers
      MAINTAINERS: Add a missing file to the INTEL GPIO section

Bartosz Golaszewski (1):
      MAINTAINERS: split out the uAPI into a new section

 MAINTAINERS | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

