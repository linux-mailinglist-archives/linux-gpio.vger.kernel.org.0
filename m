Return-Path: <linux-gpio+bounces-15097-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4161A22A5F
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 10:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01F22164DEE
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 09:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 686A31A7046;
	Thu, 30 Jan 2025 09:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="b/rwV8AB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E08A15C0
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jan 2025 09:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738229703; cv=none; b=R9BLRPngw4qqc5+5p5MXekC0qUjYqLsnCox0Y6DCSl6V1Bu9PpbPFxMnuw/uT/Ct/nYVxm+u5w4RIMgYecjhEzuP3YIz6aLxR5nX0ZvccpFrEXN1UjxKELrN43YDuEmX1hBcz3CCcfeRJMeqDrPTpa6PhUSmvbHaAgzVrW7f9r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738229703; c=relaxed/simple;
	bh=xc4ELH0oFFibv3guQwRbvL5jq5ER+aQUIwoOEf5VieE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ACjovP5/KUT8AWTJhfTbqQApNLMoB+O/eRaa7Sz2R37BLGeI8cf1A/fU6dkFTj4rCC9vDoUymljLK9Gsuvucw6nMbEwbpowECcxzUAZxVlCmg0W1BBTpsZlj1ltz0JGQeDgPIXgo/DfGGyNds9Sg1z0Svq+TmnHfkLo37m+U5G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=b/rwV8AB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43635796b48so3126125e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jan 2025 01:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738229698; x=1738834498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rCSZkLmd87J+p3Gt97ywpEqoOmcq5P4BFSZvxAfGIHM=;
        b=b/rwV8ABI5nYr/4fiX5v88Mn0+25O6xUxjxGVipfVcNj3zaSWNycyDSaeScWdq2JGv
         WImdv6dd5Pnt+GPEHrCsJHNPxN/Fb0xAmaZ3rnp+kvHkqNaxqj0a68NF5Wcvc3PxOGw0
         u/6Rm50EUPrbffdMIUM38OsW5+SEt6nkEGxY4Iu4AT4PeRd+6bzrvyaPXxKxhN+XzHl7
         A6Pu6M4Rj93247gzH98ctOXdQlfncjYbqDLyTae8bE0uralKMmjO1B65N/tEWZL/jkVc
         7YoBZTS/1criRf5Kaex7JSDlXzrH7hZDakOUimzUC0hA1ias7BmHcf3RvfbHxzOICVDq
         HKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738229698; x=1738834498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rCSZkLmd87J+p3Gt97ywpEqoOmcq5P4BFSZvxAfGIHM=;
        b=kiTUAvYQSFOrVs8fJxFwXBQZiP/byjQWkpI5LQE5/zDfOK7EW5toD+iTPvu5mrklLB
         HLGCgwQrfO0QSIXhhZZuk9h4JqsXT3xLCa8JUw1vjB8q8bWefd2V5uRnaqOqQvL0lkrP
         21quAHjIKd6/sYIC55TIXLywSZ5L0JmVGuHZApN1QkN9kal8/r/skiVgAmLE6mAWuy/z
         9DOnSjEx/Su7/POpEwlOey7JQrfuylvccC2bWM5pzGuDdtoErs1OQ7YdBtffbyC/c4hR
         F+dUIAB15lJX1pN+jzw7g+j9zj/E6Zoi/WLbqPLVY5yHAqYVtomab2nBspXXqU8XDrPl
         2eZg==
X-Forwarded-Encrypted: i=1; AJvYcCUWMKNm6UiCvFxpZbjCkCb879Fu6fh5S9py/tfkD4bratHQW1nbyQMbLeizpZQvq4wnRTXVuPKeN6L/@vger.kernel.org
X-Gm-Message-State: AOJu0YzoX48EclCnyLvVc8LD7ekjwCDfGCMVD2aiULvxqSsr4nMU1L62
	xh3725HAjnSrRHKiX8dI94VTVNrbtWDJU/GuZHsF9o6O1ebmp71zEa3rjhPxgkQ=
X-Gm-Gg: ASbGncveIHiN/iEV+qjGMvWFBxnB9CvrmW0rXP7bQHJ7cR5UBGUNmnmRRnrLOpQk+Y1
	TOKpSiqliHbxOppt/p+xbf5gBdMt7ZP5v7JNmib4pXWa8N2BmqMZIonNI+mExQpfy07qHToGvUN
	erj7hei1PzefygjUjmov0fAEd+P+VSsRRr5KPMI79SeqcKexTQ9yb5Vg+utOLm4LkWMqwWP7XHA
	dhdDZ2hEAmteZyLdavx6cWqSauAfy2Hdz6w9VvFQKApacqzvONFyH1r/UYyg5ezg2ipbyHWFLm5
	yxAiSOqQ5+ciPKU=
X-Google-Smtp-Source: AGHT+IFzBjXuzrIBGDmUC2JKEWFepdBNmuLP1BuRm1yt6BvEzzR/DXv8vtpiKd7cVq/Tc/3hfJbxQA==
X-Received: by 2002:a05:600c:3d0d:b0:434:ff08:202e with SMTP id 5b1f17b1804b1-438e15ee1cemr19665025e9.8.1738229697826;
        Thu, 30 Jan 2025 01:34:57 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fc6d:e56b:f84b:f494])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23de35csm16705785e9.10.2025.01.30.01.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 01:34:57 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.14-rc1
Date: Thu, 30 Jan 2025 10:34:54 +0100
Message-ID: <20250130093454.17264-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following set of GPIO fixes for the upcoming rc1.

Thanks,
Bartosz

The following changes since commit 4abae5b6af811ab2b53aa761bf9ae2139757d594:

  Merge tag 'gpio-updates-for-v6.14-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux (2025-01-22 08:47:54 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v6.14-rc1

for you to fetch changes up to f8524ac33cd452aef5384504b3264db6039a455e:

  selftests: gpio: gpio-sim: Fix missing chip disablements (2025-01-23 15:44:48 +0100)

----------------------------------------------------------------
gpio fixes for v6.14-rc1

- update gpio-sim selftests to not fail now that we no longer allow
  rmdir() on configfs entries of active devices
- remove leftover code from gpio-mxc

----------------------------------------------------------------
Ahmad Fatoum (1):
      gpio: mxc: remove dead code after switch to DT-only

Koichiro Den (1):
      selftests: gpio: gpio-sim: Fix missing chip disablements

 drivers/gpio/gpio-mxc.c                  |  3 +--
 tools/testing/selftests/gpio/gpio-sim.sh | 31 +++++++++++++++++++++++++------
 2 files changed, 26 insertions(+), 8 deletions(-)

