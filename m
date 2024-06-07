Return-Path: <linux-gpio+bounces-7261-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E967900C37
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 21:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2F5828869B
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 19:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46EA913E3FD;
	Fri,  7 Jun 2024 19:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uc2J6KzB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E9F2AD2C
	for <linux-gpio@vger.kernel.org>; Fri,  7 Jun 2024 19:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717787152; cv=none; b=PsnYoCRpKq2qIpk7lLOhpgcuPhTGdjb5u6Y+w2M0uUAyQkeYEaN9tiqRf6Kb0kgHsSZSsn67MFTu6/J4l7ij322wz1sKFEIxnT8NVIWD6Yc7Vi/i1lANLadeqOZdqAyWCA8a1aUa5ISdnEqY00uddt4C6n3i32uoaq59xwBUCeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717787152; c=relaxed/simple;
	bh=ngIRetO5CkzK9IehqPyRMoWnWCmFj8wR8sAvGODMxoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FeTxhVqa6gRSFJVCi8HYi+7I9vI3PeW9mCFSNCqJYxGmKeH43p0gLj3oIgku/Ox9Fo4phPg2WsVVMuNs4niCEwpHxLQLwoqkziIOa12kD66mQIWsgNy1jA1D5mZtYkn+vcWkZ1NANhJc1JKpuZW/h6mhR6xC5ydjfxNzGvz3WUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uc2J6KzB; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52bc335e49aso735851e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2024 12:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717787148; x=1718391948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HxA1BM/AGy1NJKtSG9weBu/7I9Z1wHNH2yZVYRhiSUs=;
        b=uc2J6KzB0KGOJZsAZru7aXcHjV6viq0bWYprxqt86vuwkWDOBcbDunnO6Orp6I9L7R
         Loo2bIc/h/fUwf/g/l3bRZvZoyue8gezZym/hPWKMgasZ1bqqOIj9UJgFIlg8Ka3QIve
         AaJL9Rk4V7xJa0CSaLaFWf4I+2vwo3Wx8dkNOTJVHmrCY3ZMx9XC8RFX2oFRo0Z3fYov
         gLU0XYbyAb4droaYIA4xEb2uqklQpJ+yVF9slSvBX3iqdmHSDQkOdWQTa44uhhVn5fqV
         GUxmhKv4DgMgTIcTk7YMkS/u91KjNyEyLnuiis/knCyvfhkNOWpKU1F/PbLHxTVnI51e
         M8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717787148; x=1718391948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HxA1BM/AGy1NJKtSG9weBu/7I9Z1wHNH2yZVYRhiSUs=;
        b=Lv8sN1vPrS/7Bj2MoZhYRNVuABbwR2UgXTln+frMJEtpVOKLya+DuuTTL1O885Dv80
         zjXUgzJDeuQRpLyd7FWiegm2dYhdidqd7pCUkFTsr+6QeNaX8lLmoGjG0t8St3xoi3ik
         yNpXjRWfSis9Vem8WIscY5ny80RYOfSN0icpHGjdptHoYRlU5ootKACdQhx7+4c+XVDy
         GgVZplyjwPS54CBbwMUOgWjEbnIjbtYwhxqUoK5h46S4U1cC/L/jEKntVLGSD6fPTHqy
         qhGui+gx7cCX8o+PpGZtZBwcvuEw5KaYIA2h13fzpJZMCKgfj6ZONkxw62lQQXUF2EnE
         9nNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5IG+5rEQJpxu0xyd1O+TRB3eLKnFJN41Nx6tWXlQ/dBr7I9l6QMUtlqlPmPGj1f/NFxUbruG/Z/3q9sxrfc9m3THffW2N7cdvXA==
X-Gm-Message-State: AOJu0Yxllx6TLBJl2mlOJUehrzWW7A3mZ+pYJcWDrjfmQOtkg+vLkuC+
	FuCE5vtSj75n5jJuV3ByESAiyVMpdfDLXSJ9IqSMKvAp277bKcoMp4LdSRBOf5Q=
X-Google-Smtp-Source: AGHT+IHVKb+PdYi2LkaUjU+Hnrgq0RwwwvnqIkhYpv6Wpv6EPxqYa+IjzsJMUHeSRfkORqd071am5Q==
X-Received: by 2002:a05:6512:6c9:b0:52b:51f9:a37d with SMTP id 2adb3069b0e04-52bb9fd2d5amr2767729e87.56.1717787148108;
        Fri, 07 Jun 2024 12:05:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:69a7:93d5:5355:af67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215811d49esm91861115e9.27.2024.06.07.12.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 12:05:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
X-Google-Original-From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.10-rc3
Date: Fri,  7 Jun 2024 21:05:40 +0200
Message-ID: <20240607190540.30622-1-bartosz.golaszewski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please pull the following set of driver fixes for the next RC. Most of the
diff concerns a single driver - gpio-tqmx86. Details are in the signed tag.

Bartosz

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.10-rc3

for you to fetch changes up to 64054eb716db52e4246527dc9414377c5bc5b01d:

  gpio: add missing MODULE_DESCRIPTION() macros (2024-06-07 10:05:21 +0200)

----------------------------------------------------------------
gpio updates for v6.10-rc3

- set of interrupt handling and Kconfig fixes for gpio-tqmx86
- add a buffer for storing output values in gpio-tqmx86 as reading back the
  registers always returns the input values
- add missing MODULE_DESCRIPTION()s to several GPIO drivers

----------------------------------------------------------------
Gregor Herburger (1):
      gpio: tqmx86: fix typo in Kconfig label

Jeff Johnson (1):
      gpio: add missing MODULE_DESCRIPTION() macros

Matthias Schiffer (3):
      gpio: tqmx86: introduce shadow register for GPIO output value
      gpio: tqmx86: store IRQ trigger type and unmask status separately
      gpio: tqmx86: fix broken IRQ_TYPE_EDGE_BOTH interrupt type

 drivers/gpio/Kconfig        |   2 +-
 drivers/gpio/gpio-gw-pld.c  |   1 +
 drivers/gpio/gpio-mc33880.c |   1 +
 drivers/gpio/gpio-pcf857x.c |   1 +
 drivers/gpio/gpio-pl061.c   |   1 +
 drivers/gpio/gpio-tqmx86.c  | 110 ++++++++++++++++++++++++++++++++------------
 6 files changed, 85 insertions(+), 31 deletions(-)

