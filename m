Return-Path: <linux-gpio+bounces-20252-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67612AB99D9
	for <lists+linux-gpio@lfdr.de>; Fri, 16 May 2025 12:13:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02F524E6AAC
	for <lists+linux-gpio@lfdr.de>; Fri, 16 May 2025 10:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8088233706;
	Fri, 16 May 2025 10:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="m5hUg6hk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5224233145
	for <linux-gpio@vger.kernel.org>; Fri, 16 May 2025 10:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747390350; cv=none; b=mhC8olM2aTF281VRHu9xaTqbHhve9C4RyW9sm3sbG3ZxeOuKUcyXda4Lg5urPHVD77dwGJcZvkBSwzoUQyiFFYbbGo0FpVPsfkDOIT+rJJmz1Qk0Os2wu5kyINNSl7V2to23+u9OECdku9HJGU7lk2wi3I2eshNaXActsAtYvaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747390350; c=relaxed/simple;
	bh=WKbPTQZBPp47OtTMaeJRnZhprrR+QWUIIiMdvhk6O+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R38KrVJGM5tzG4q83uCgLCDrSW3CYE5VMUWv+ILLX2fJc6LYByY8wrCSjvGviFNc1JutER3+SIyn8eXyowQ2EkE+wql8Lzl+mGszLrcLFL9M7iGsop1YzMwnQp2Mo46D2/zR864r4zz2KsAzDq0YybRVBh/wi7H+YQLDu+9iScc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=m5hUg6hk; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a0b9af89f2so1232196f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 May 2025 03:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747390347; x=1747995147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Jdh/6Db9vqcLBveWLXLf8Yh1TWM9Tit87sYsSf0o3I=;
        b=m5hUg6hkeLZjk3n9iEKWJYcDbkx1FtRNAAXucQ5yGnetGFAWb7N4XyJSkaHx7ppHBd
         dpekFXGczQg0Wesn+zan1HYInIOTOP4/DCZ47z81BazdSuk9JBYrH3sP4RSCSOO0AQkY
         BTC2mKmkc8Ht7Pjobc/iXSXPOmr9+LP0Sgd1VOns/Mj/t0zRpVNOIB/XKB4qwrJEe7Pz
         wn6q8EN0ZfFgRIwtkMXcoId06/NSXsZfxCFtkD/TGu0/KsSumk9CgIAZYDG/EQyoP3Yx
         DtQ535fd5mhJYhZfL79dxUxoRUrtWYf+77mU61NlMA7CdfVO9PaXOiRQQgMi6yC/REgg
         VONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747390347; x=1747995147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Jdh/6Db9vqcLBveWLXLf8Yh1TWM9Tit87sYsSf0o3I=;
        b=QDwzHdGkvpcAjahtCOnRCIJWYmQttbO9hTFWH6XAoMW9BtTfcZjl2vNQOCtV7hKtnP
         jn/JVyQsr7W3eUENAhCC+Dnwu7MzSNqoCR7JyZ5fbhrYrN6moLaLORAStiCdfsWHPa96
         oAEDMjGSqZyrwoyUk7sc4qBkR9ddtmrhnTuKxKHqKcHdcCdXoBBE3vW+Z/QEQ8zIg8/0
         X8QAu64dUwdIIypzC4hNJ6v5o9bCpn8yJjp+5wmFpU6NruwvXs49h7Cr3VewWtEc36hJ
         lEOKLkO64jNeXx4lA2WrOP787db9AeWfpiE6TquHozXxqDJnw6k5bT4REPjmYgIapK10
         Pe5A==
X-Forwarded-Encrypted: i=1; AJvYcCXPdvIAc+orDMX6Z1bSkM/PIyzA4blqij7FoqdYfd0l8rL3/569naff9651/8AQE9iCN1RaeeqgMrFQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyNGfcl2ZNPQqoGuL1P6rwWR2jJcOu7NnwvXo9d3zKcqBig/hCK
	Y+QsnN8z4N2B3GohZoyBxfjOPRe4dQqMlw2NQTTU0Y3NUVdepERbg2qknMkN+s8yQtw=
X-Gm-Gg: ASbGncvyO2B5+ti8scotozHR7jWpKdvZEIPRwmIFVdf1igvcIS1yRP6YEF9ghzuX13L
	TZ8RBPhNXCLuAzR3hzy2WzeuWXbRtZpEWzO1wu7WesIz6I6Ar8Jy2Ammq/8ebr9l+EKxLPzxw96
	X1bAzhT9IGjCLL/SZZ/JH//It8slZjZs3Y1HHiQITrPBY6Zvjjgq+xZpYGfrsSLLJ4kMGqjdjse
	0IGkZNIHOx9L3FQl1dE9lOfKde/LjeMNwpJUWYdeusMbGPHxBstGmNUGQQr2NtfcZ3MmlIK31ak
	A/OjqZ8CV20Fgh80kE9KsVGvBOSPb1xru+CQDJdgvPu6FsmWP8wfxu5QOUn+s2AMuOl9Es8T7VM
	uJ7HxSS4iQq/dd4TfqoCDuBhT
X-Google-Smtp-Source: AGHT+IFY05grmJG5DGrrM8YVQcuoQDtg1Q4hmlnX23ww3Y30lFYb2wKVFkildRKC0v7s0IYcCizWww==
X-Received: by 2002:a05:6000:1862:b0:391:2e6a:30fe with SMTP id ffacd0b85a97d-3a35ffd2829mr1719553f8f.39.1747390346542;
        Fri, 16 May 2025 03:12:26 -0700 (PDT)
Received: from brgl-uxlite.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3951b57sm103875685e9.21.2025.05.16.03.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 03:12:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.15-rc7
Date: Fri, 16 May 2025 12:12:15 +0200
Message-ID: <20250516101215.5822-1-brgl@bgdev.pl>
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

Please pull the following set of GPIO fixes for the next RC.

Thanks,
Bartosz

The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:

  Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v6.15-rc7

for you to fetch changes up to 7118be7c6072f40391923543fdd1563b8d56377c:

  gpio: virtuser: fix potential out-of-bound write (2025-05-13 12:59:30 +0200)

----------------------------------------------------------------
gpio fixes for v6.15-rc7

- fix an interrupt storm on system wake-up in gpio-pca953x
- fix an out-of-bounds write in gpio-virtuser
- update MAINTAINERS with an entry for the sloppy logic analyzer

----------------------------------------------------------------
Emanuele Ghidoli (1):
      gpio: pca953x: fix IRQ storm on system wake up

Markus Burri (1):
      gpio: virtuser: fix potential out-of-bound write

Wolfram Sang (1):
      MAINTAINERS: add me as maintainer for the gpio sloppy logic analyzer

 MAINTAINERS                  |  7 +++++++
 drivers/gpio/gpio-pca953x.c  |  6 ++++++
 drivers/gpio/gpio-virtuser.c | 12 ++++++++++--
 3 files changed, 23 insertions(+), 2 deletions(-)

