Return-Path: <linux-gpio+bounces-16883-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F033EA4B162
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Mar 2025 13:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96BC53AC261
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Mar 2025 12:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3EA1DF980;
	Sun,  2 Mar 2025 12:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vVEwMdHV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382D678F52
	for <linux-gpio@vger.kernel.org>; Sun,  2 Mar 2025 12:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740917068; cv=none; b=EGl1SJDnUk/L7/+NkCgX7f6umgA9DAanMyyuq4Jm0flBWDXXrfHkpxXPrQOBiIHri1sV+Aifj3PKLE5aafiGK9ZzKemz7el4md6nEwsU+oIUzxpE7xXFy1IyD5ACPlN9tiIy+6zTEDm+j7yrcOloC0m73a8PFUVj2uDpGiB/y7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740917068; c=relaxed/simple;
	bh=JY2SMHuBAeQA5ymjsS5TI2bhfemIjAsjx0CTHtgqxv0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jZ8ItPLPCBvUVB6so5LxKW915Cx2FyQK1j0Dd5X1gMcUK8jrmr3dvs7dMr3/nRiMSwPtHc22vhOjkNqJB1ZTgx9+pCNE/LIKUiion++6yS7TA7vdOW4rh3nF9zp813GWC67zzj7PISimcYtVnsUnPzUrq7mo41hE58E3M3rMcFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vVEwMdHV; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-390eebcc331so1117810f8f.1
        for <linux-gpio@vger.kernel.org>; Sun, 02 Mar 2025 04:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740917064; x=1741521864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E1qy2jLougotV3caTX4Ep2cJ4NAMVmZ8tLXJeXGlG68=;
        b=vVEwMdHVUQlSITNi3K+AfdgGK9jwdHrfAjPio47pfPuyd0IQevJ5cTicHKcZi/vw11
         dwPTQ6O9lveA171y9jwcG7jQKF+I5c4WMPFOy+6cqJR5uwIrSg3WB2mQusfWJlhftjQ8
         xcm7gQRAauWyAkL9tQ8EhJ0zLPmdejE91w7Ja0qfaXVUh9a+H2hEQ3QOfnQdR4/6YnS1
         dyzBJtMbgocRxo/zABmLwQfljGdCLzNoeafOwO78mNmHUnSRw/NdAHbJ+4zjSvG8Hf6A
         lb0Y64BHwos/oLJ+IOYzqhjKZ1waOrDElt0yZzyYHytvj8vxYZwsExZ6jJD2cHZlDGSM
         YAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740917064; x=1741521864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1qy2jLougotV3caTX4Ep2cJ4NAMVmZ8tLXJeXGlG68=;
        b=fYWq620MlSzchBiUbanOz11Ce6gU3SwB7+xWSSA0bfd1GqP0vfLYWGMsa4whNrr7Q1
         vEWuzvZlM6WaSeDAaNlrOhOYAP+iuq3K3pK1ll1phibNlOH4AbVRHoBpZxjDFmaWbA/f
         LMCTLjjGVHTZpTy27vyxbxCr+ImHiZx4RxQ8ouBv+EARpKYlobAPZXpjgZ+1klkMDRvV
         Jz+WrPmtK/5b4Knh+lio/e8Vh6VW/C7esxwaXFtS/a+7GsxVjtNdDGX17RRE2gyarp4C
         rmeDE3Pd/OkuRdH4c/O4Z2+fCrpNMnbrEvEuQ1pSWn+qjhYUhId1pFOaGvlXQPeg2uz4
         BwMg==
X-Forwarded-Encrypted: i=1; AJvYcCUm2RWsze5cxNtuGyVrXyuzRqFlONmFdhgWLe4TUp0HFpHEzBvIJ3vWXFofqsW9RXxA1bfKlieylLmO@vger.kernel.org
X-Gm-Message-State: AOJu0YwFj2+f2NBvbT/oH/jq7ILYZDc1fmq7ul/c9ppkHorRO6TrC6QY
	EbYwnTYzGMNAg2UG7LFTEbqUPtCG8deOH7I1vOfN3/pkWvW+u4m97r0UWZFChxImHpPl6nSEJHw
	p
X-Gm-Gg: ASbGncs9h9WsT+YoQtOhXqdFdVFjT5xnVfoR3r6egJ9QQeS6fLQAE9q+6q4cz3zVdj3
	VQWRDOXZguQHec1NJohLz0/RmZu6VpXB8RRp+a9uP+akNK9eEe+2Z8mhIsRLzYzhCNn069gsS+U
	YoUBAoPJ+yyQrIsxyboJexSs2K84jjuHTU6HMgczfYXPgpXE1GFtxiBxr422Die1tRw1DzwlD1P
	Z2ULtYHe5nx6PJBtyhOeYApkEAhuQKBG9/kp6C6pJ2LEJA5TkM5eRIs2iNoJIaL9OOvYC+U9fOT
	Gmp9bYls0afbG7rVMveSFUF4OaAUpahB++ZgFhQPGDoPDruvdAw59hPq+RNz0OrxVkJWr9lInpZ
	3+OMdV68kUN4i/4PHduzJUvIqTUpF
X-Google-Smtp-Source: AGHT+IHR3hYe7lOWShj1M4Lnoxwgm4CAjYEMp+mZTw1yhNs6P9tuRCYrU+0kbP1EGX8xC7w5mMYf4A==
X-Received: by 2002:a05:6000:188d:b0:390:f8b9:7b18 with SMTP id ffacd0b85a97d-390f8b97d3emr4041145f8f.12.1740917064292;
        Sun, 02 Mar 2025 04:04:24 -0800 (PST)
Received: from brgl-pocket.. (2a02-8440-e500-b74f-e98c-3c2c-6d88-f923.rev.sfr.net. [2a02:8440:e500:b74f:e98c:3c2c:6d88:f923])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b7d69sm11436906f8f.60.2025.03.02.04.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 04:04:23 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.14-rc5
Date: Sun,  2 Mar 2025 13:04:10 +0100
Message-ID: <20250302120410.5600-1-brgl@bgdev.pl>
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

Please pull a follow-up fix for a previous commit that introduced a
potential crash and was already backported to stable.

Thanks,
Bartosz

The following changes since commit d082ecbc71e9e0bf49883ee4afd435a77a5101b6:

  Linux 6.14-rc4 (2025-02-23 12:32:57 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.14-rc5

for you to fetch changes up to 64407f4b5807dc9dec8135e1bfd45d2cb11b4ea0:

  gpiolib: Fix Oops in gpiod_direction_input_nonotify() (2025-02-28 16:30:48 +0100)

----------------------------------------------------------------
gpio fixes for v6.14-rc5

- fix a buggy get_direction() retval check

----------------------------------------------------------------
Dan Carpenter (1):
      gpiolib: Fix Oops in gpiod_direction_input_nonotify()

 drivers/gpio/gpiolib.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

