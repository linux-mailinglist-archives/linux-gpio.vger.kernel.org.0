Return-Path: <linux-gpio+bounces-15519-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F55A2BE42
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 09:42:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 319123A6EAB
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 08:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7AB41AAA2C;
	Fri,  7 Feb 2025 08:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HgR19E+l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372167DA8C
	for <linux-gpio@vger.kernel.org>; Fri,  7 Feb 2025 08:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917737; cv=none; b=LJBkVyzotR1YBdS/r6LY+V9ypD6YFfysWzD+oRDOwa0SMJl4FOmOXZZq1gQfOPhSF0kFvxTpcVb/eXXrbCsrVIDUSSRfWkm0vWwtKrMd9ojTf1qmmCbM8Je3VC1bWJn2WWZdfWYF8U2AVUu+krPfp80ULWfMd6bVn/jPZJpC8lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917737; c=relaxed/simple;
	bh=ZX8n7LuVn5k6x5twX1Hoq4Vhle7NZg+4Zf7HsTeEAWE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LhzadcrwwvDQnynbN8Q5Q2xpa06kto79iHPapqQ1f0U6Lin6XtvhnQFvl8o9pktd0g+i8ZSx/wXbmTmG3iAgsnzECOusRV4WbfTJN1Ox37WdmDYloLItbMTJuE4pbFFGQY86Uux62Dnj/EYsrrx2Yn84BO9pL0wWHJYfnic1x3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HgR19E+l; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso10472965e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2025 00:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738917734; x=1739522534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gFwnqBFWgDM8SO4w0yhAcF1pXvEQEwNsk7HECA68mAc=;
        b=HgR19E+lzC0rSpLHWzj7OSsjS+GcabLpw0ZQv2+p8QkBSFkSGJa2XRvX2dCmWupioR
         nV4uC/GIdMvy8TunLGe6NTqNsugWZe7iFnc2AcbBPtet+XM73NytdPZabcF8dbubPtUc
         sE5DafUufrdvv3e4RomhT5RgcH+fdimzkZvXkAuX2mgRiTgWRlOfjOEAc4QznRA/8rb0
         H5EdyIHtM8qH2gqbHRE+VUeagYFMyeNngY9S/uMy5wb7ltL2atK9E2CQmMWBLh5Ink9+
         tHo5h7Jcb3EuZCLgzKSTLN8tRvYyC7LgQ0UwRVewfyFZbZDvIzqCl7qJe7BXP0u7GKeH
         RabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738917734; x=1739522534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFwnqBFWgDM8SO4w0yhAcF1pXvEQEwNsk7HECA68mAc=;
        b=gz37I2qI3HDYNAJFX79jCki/qvGjk2h2Ewv+TpSYeXOCSFsxJ3Xdtbo3nzOB1vKY/Z
         ZYMsV+1guSn4VgEu0hxHmfGcZvfeeJK79riJcYQ+IEZ+ljlkBNDg/PKv7Q1a97mw4kpk
         XMMoLflUpZNDzLSOfJOJwq8K5bLGRTHyamsJVVL03ZannnuMYFksViqe20KKq8W1y4+N
         E/uZ6maUMdAF0vwmnFlGPxBhuL9EgyDAFlGkUOk+OMKlFjLKXP+/yQSf+JLLx1AaaBPM
         IUcFBwYVxNcfWTVZ5dD5o35ARzfiPTIV9X4ekGKOyrPL+fFiIYH6Sa8FcM2EAHS4UcBB
         sdng==
X-Forwarded-Encrypted: i=1; AJvYcCW6BhgMTwdPLEUp6n4p3Iw72+LVS2j/bn3gRZb9nBIEhp8Zkx7TtzTXb8HpLp9J0Qh7/aoXf0bDQsCO@vger.kernel.org
X-Gm-Message-State: AOJu0YwoRTj88S5Lg3A2XtDVrmU0PZQ7r9ObFiytfdHKfJcN23P6My81
	p8v2GSGJ2Xm+Mt3cbRF5xyDEPvp2pOfByZ3nJD7zU7JUCfvIrahfVvoR+AI8Cnc=
X-Gm-Gg: ASbGncsmO5BuK3uMdMlmzzmTE6KEBXpeZkOC87pbAcOfx1dWRni2B9+Zl/C+G/ts0//
	5reZcU6tgMSyI+sZNyb3gWG2t4yQ59NUSycHdoprbszwO9QhnCIF1TchQCYU2lgYVSNXYXADXbs
	hlYwMufscH/XDfGQ9kLA9Gcthj08+pjSo50yS7KCFl42PmR4Dp5NpKJMyJnmiJIOrJi+bdV/sXM
	1BW5pFN5hOPJAFQdg2V8nUDZmNU3OVU7VFRsnCu4MBhOL1ur8/94LQITDYUUWY3hWRmeIsgHoQm
	hZRr7QOuKvcs3A==
X-Google-Smtp-Source: AGHT+IGhVY3Tt3MMVCmyWfF7lOSCfftHwRPlkoWYLa4lhF+bK+VaxojI/dVskS55Z71J90dOQs1S0A==
X-Received: by 2002:a05:600c:c7:b0:434:e65e:457b with SMTP id 5b1f17b1804b1-43912d0f1eemr48321615e9.3.1738917734389;
        Fri, 07 Feb 2025 00:42:14 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ae69:c28e:8e23:dca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390daf7dbcsm83964035e9.30.2025.02.07.00.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 00:42:14 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.14-rc2
Date: Fri,  7 Feb 2025 09:42:11 +0100
Message-ID: <20250207084211.35316-1-brgl@bgdev.pl>
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

Please pull the following set of driver and Kconfig changes for the next
RC.

Thanks,
Bartosz

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.14-rc2

for you to fetch changes up to 59ff2040f0a58923c787fdba5999100667338230:

  MAINTAINERS: Use my kernel.org address for ACPI GPIO work (2025-02-05 14:38:33 +0100)

----------------------------------------------------------------
gpio fixes for v6.14-rc2

- fix interrupt support in gpio-pca953x
- fix configfs attribute locking in gpio-sim
- limit the visibility of the GPIO_GRGPIO Kconfig symbol to OF systems
  only
- update MAINTAINERS

----------------------------------------------------------------
Bartosz Golaszewski (1):
      gpio: sim: lock hog configfs items if present

Geert Uytterhoeven (1):
      gpio: GPIO_GRGPIO should depend on OF

Mark Tomlinson (1):
      gpio: pca953x: Improve interrupt support

Mika Westerberg (1):
      MAINTAINERS: Use my kernel.org address for ACPI GPIO work

 MAINTAINERS                 |  2 +-
 drivers/gpio/Kconfig        |  1 +
 drivers/gpio/gpio-pca953x.c | 19 -------------------
 drivers/gpio/gpio-sim.c     | 13 ++++++++-----
 4 files changed, 10 insertions(+), 25 deletions(-)

