Return-Path: <linux-gpio+bounces-16393-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40861A3F7B4
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 15:51:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F911177600
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 14:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B301D9688;
	Fri, 21 Feb 2025 14:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BkkJ9/Ma"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7416E7080D
	for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 14:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740149293; cv=none; b=NBzI563JsAimNfxn6BhscFW4XJwjctIMDJBGmPD28VQKwzJpvq60vL8N1WeW3Vko4myaAVcluXp86N1WPT/wCM7Mg00Ek9Q+ipy/ILeKFlAwnkzxAEn7j7IrqaSnz+t7+mfADmHJrQzVchWSPjf7sz0oX3Aai95yuV5VyO7Rw3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740149293; c=relaxed/simple;
	bh=VJc2fD5OV7xtJnzZHXcMaP4k2Fxqrl7cLt4EomVW+yU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fJvDoK8qZESO/nn0UBlw6HOA0o9YUb8dbMmDyXLZC1wquQWskNn00J76LW7XlfG8vvim7E/7vNZqRkvYZdxClJqoPooK5cCDXpGaiD0Yn/FXJOreKIune3yaN9Y7OBqwvw4iVy2IhBsLsgA49r2zNgimJq5r+B0qSm+tfJThGNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BkkJ9/Ma; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30930b0b420so19236471fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 06:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740149288; x=1740754088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KHIl+3dGIE27mXpj3uMGQAy606qGwuorLow6X3a4wQA=;
        b=BkkJ9/MaHRka3oTqVwLy+NoNcS81ChGr/wb3b/UvpLG2ohxMt67zJJQi/nWb79GtzB
         KPC4SnEbYmvfBFP082CqFLoMKiYA/SJA66WdRrOyJKPWbZyq0M+uakkOUPeoPPunmMT4
         o3PllVhnPDfBThC+4WcXpLGGSP0BPNtDY4spA8Sgs2pdSbsfJIYrLvj7h4cplgGKE9Dp
         Pn2seKih1woT4v9MhpObSSnpyGjHk1a8vIgM8ZXRU4RZ5uI3WZNqWinp9AeJfBowRvZV
         8zYkItV4OWY41VW0crpKGMv/+con7y7CNieP1ZvdVBir/mlCc+z+UhhDxz69XPPIAEO3
         ynSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740149288; x=1740754088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KHIl+3dGIE27mXpj3uMGQAy606qGwuorLow6X3a4wQA=;
        b=YT8BXUbZDtHPH1gLNVvyTUcZZJB6sIYNrYMekVQ0LPl/hVDIhgGogxUqi2k7sGB8g0
         5a0dEdsT7oIbzW/+gqz2qF0eZoQL+6XukYmhJMlppzDEf/2Dvu6rEX6ztIICWyPqUp0c
         VhuyGY2qcLUK6aJe25LdPCOuQNBMfptfZwYd6qyxdpjxnhHck1h5igswslAmpqszyCpF
         2zfd1clq9Dhu2G1kxsjVVVNBBjxa9t+EJBoHggqY9/Z8ZS4jn50iX98dKNhrpp0X9xTK
         wDS2Kk121MXdzh0cHeYaqNYuijV8Lnfy5WFDikwlKofpwd1ig+fSnCrvclVUMGhwb8SC
         nKtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcWVkGM6Bal7Xh+aoeLKQWsBHNp+xn9OlmisTlRld8inQGfEZcjGgyXZjJB69GLHgPZzD6KGihqOu0@vger.kernel.org
X-Gm-Message-State: AOJu0YwvSIPYBCUrj+Ws6oSRbaK7cjYT2syD48N9opR8mo+//Qx3daVG
	5Ce0Ncth5LUMNpm2ug3QUyh8huN7NWfuTKxgfLbHnbCmS+lXzsZr/C/gpf+iibnRqDRP7drsPod
	CrVo=
X-Gm-Gg: ASbGncvDilndYwE1Y0zRYsiTkYEejfbgPCGuLqpVXQOnvHCELHExmFfcgWzJ0bj0HvZ
	a4uznWntF+dEKRetzjm/aJ1cDDcW8V7EpatWVSEI05D5BXOkJ5MEX5AdkzNK0QZH8NUmfxCdYI0
	wqdiMFpCeXJds9iSp+82GmU7o23uNEkZlT8Ja7M+1bzjCQEC29Z0/Z2c1aeKKk4V3gH9iUVs3B0
	wN+OT6hK9UurTy9qjHwSK5Xa3GKj1GJ4bKeG1/eDGyhiQqathmxPRsizkwK22WZV7dO4JYDGnxG
	oi66Ces3BoIcokEuxUAV4uIU9Q==
X-Google-Smtp-Source: AGHT+IGZ83OKySBHkM2i7Fteix9HZI2XYcQ7YK7UCGOFlxTyWB4ysreuxLKAdoAc9mvwA33dt4t4AQ==
X-Received: by 2002:a05:600c:4f91:b0:439:98b0:f8db with SMTP id 5b1f17b1804b1-439ae1f1903mr36508685e9.16.1740149277752;
        Fri, 21 Feb 2025 06:47:57 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6cbc:77f7:6f0e:5a7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4399be79d92sm57998475e9.0.2025.02.21.06.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:47:57 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.14-rc4
Date: Fri, 21 Feb 2025 15:47:50 +0100
Message-ID: <20250221144750.108147-1-brgl@bgdev.pl>
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

Please pull the following set of GPIO fixes for the upcoming RC. There
are two fixes for GPIO core: one adds missing retval checks to older
code, while the second adds SRCU synchronization to legs in code that
were missed during the big rework a few cycles back. There's also one
small driver fix.

Best Regards,
Bartosz Golaszewski

The following changes since commit 0ad2507d5d93f39619fc42372c347d6006b64319:

  Linux 6.14-rc3 (2025-02-16 14:02:44 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.14-rc4

for you to fetch changes up to 96fa9ec477ff60bed87e1441fd43e003179f3253:

  gpiolib: don't bail out if get_direction() fails in gpiochip_add_data() (2025-02-20 14:08:18 +0100)

----------------------------------------------------------------
gpio fixes for v6.14-rc4

- check the return value of the get_direction() callback in struct
  gpio_chip
- protect the multi-line get/set legs in GPIO core with SRCU
- fix a race condition in gpio-vf610

----------------------------------------------------------------
Bartosz Golaszewski (3):
      gpiolib: check the return value of gpio_chip::get_direction()
      gpiolib: protect gpio_chip with SRCU in array_info paths in multi get/set
      gpiolib: don't bail out if get_direction() fails in gpiochip_add_data()

Johan Korsnes (1):
      gpio: vf610: add locking to gpio direction functions

 drivers/gpio/gpio-vf610.c |   4 ++
 drivers/gpio/gpiolib.c    | 100 ++++++++++++++++++++++++++++++++--------------
 drivers/gpio/gpiolib.h    |   4 +-
 3 files changed, 76 insertions(+), 32 deletions(-)

