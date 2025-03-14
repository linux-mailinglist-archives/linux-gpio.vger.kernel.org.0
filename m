Return-Path: <linux-gpio+bounces-17629-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6851A6139A
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 15:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3906B3B6B55
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 14:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE49200BB8;
	Fri, 14 Mar 2025 14:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="A7XGH+OT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5951FFC72
	for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 14:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741962467; cv=none; b=Nk3+hxxS2hlEl1Vb2CH2+UhiD6pUdHORJLsfKTSd7JmAUEGgFFoZjEnwbPCq52rnLFFhtNzauI5nZ7skrVbtNfdKaIFVlyRRsMZbMzXR1m24eDnyZBc7SyjpiG3rZYAhqASi/5j9arXoBkyahbwMO1hLnLI1u+fEeDIhr9YD4Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741962467; c=relaxed/simple;
	bh=RgeUtdIlm0fketWl8KYbwWGkxUv/Xxwz0EpGdR/2drQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hD6W46+mi5qYLmJIMOGZjMl5FiT8sapWCMrOP4HQA47VJJHSGUV0fAumdHNnA741Aes59UeX5LOVU/W7ZCtb4i6IwQg93qR8SyoP70wLva6qGm0lrm+H5BlR87qYVARxMvW00vH2YqwRSGfiy+Co0cFWTnzUwNHwr005AqYpbxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=A7XGH+OT; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38f403edb4eso1227511f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 07:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741962463; x=1742567263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J8JeOtl31HdzN6jUKW4y8ELJUCSs3v6y5I2ghd0PFtM=;
        b=A7XGH+OTKgko44xQs/WAAOGA3JqNFZ5pE+3t6ADSjZa7UDXY+isgRQJK7XE2ZO9VPr
         Z3e64fALODY1aojQ++lj9FOKs6t0IsMW+/WHYorZwKZKLt/6/V0eNh3Hp0Ali5jO4ACy
         rolvLn3h5vJ8Uu0m10jLsvMmFKUKW//rP4PgSNLEMSjqRr1dChZ6AqAVxDgNadw1zSzX
         7FzGK/G7H3ajxrnwumdCH4I9XpddTRdLKOUVJQysK2N648HtaFRchUtge+dklKwI9uc1
         UxQV8SoBShMDKJDJNUBllnkCjqHizJfY8H8jtBpYOMRNaUoLVDY0hvyQLOGiwixrVP1w
         Orsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741962463; x=1742567263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8JeOtl31HdzN6jUKW4y8ELJUCSs3v6y5I2ghd0PFtM=;
        b=Czjl//DI9F+HCdAzZP5+CpkWj1L94jVgmTJyWhLdwXGe8gdTGwe3wjchAG4S4vFcTs
         Dj91qH7AZY1sl0L1O1e1UH52EKmRqRs6xWWebEB4zXnbEQnOzjcY3EcnxfpxfILQR5SA
         S/ZEGn+WeWoDbsApTSxY9FPQRIaZpdbWpkCIgUf2XH5SJMf3sSeNzbi9PCuf0ovh5iLQ
         FHkVhLAKlTJOTiMmaYszP9EKzZztGQE550Kh/XNfkMvj051nkAufpUrVfK5Mxwii8WFn
         y2yoXPxaiRH9+TModB5PCdoTIQ8T68uJbICWOQ39MGJv0IdfBU4Y3tTehv1vDeefIrmM
         JkBg==
X-Forwarded-Encrypted: i=1; AJvYcCUYhGxB8rlIfuK08+r+iWuZBMfrwBwcrVtumj1oGFdtCr37yrZQ0Ejnq91I6T6nEB2X+QmmW/OH2lH+@vger.kernel.org
X-Gm-Message-State: AOJu0YwqEHPvbo5Tvf0b2Jtp5et79E3paY6kZY3EiLoyIzhPHJpBSnEO
	IvOcD9r7P4j70uo+WYLpqxm7x307FibiG+KZ88B/3NS5EB/kNrtj8Lu1CRvqOzk=
X-Gm-Gg: ASbGnctLeL00/Rr8f+cflBsVB414klAiuAJlHJuJFgHE8wxYyQlMCGfgtrnZXlJA+zk
	w6DcqW85JRxwGK0dK6tgQDJzqkEyhhB+MCNmkLXCAabB9kIs9DEvHLKvBVE43CVss1obJe9AAdP
	fsHHqQQJucmlEz4ele7qSu705UJF37HdtInM3593wgtJ+SANc1wYYCu8XqiSUgNb0e4yVmk6VIL
	GYdiQHZMs4gFimXlmLzpiZJHz6r3mSbREJe2gzNwyvTJoam4+clHy5NkDKBsk8hL7Avxs0vZ2xv
	qdoEOkKbs4Lmo0rbvTDvespYjekAzjb9xj9mMxsg6T7Q
X-Google-Smtp-Source: AGHT+IFGdOiD0vYJvINPeEbn5Eoy6ZXFfBenb+Y5x7v2pMRpV/unueJpQBMKaZe/bTflQ+DPn5T8FQ==
X-Received: by 2002:a5d:6d06:0:b0:391:3261:ff48 with SMTP id ffacd0b85a97d-3971f9e496fmr4415505f8f.35.1741962463132;
        Fri, 14 Mar 2025 07:27:43 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5dd0:723b:f16a:8ac4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975afesm5623081f8f.47.2025.03.14.07.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 07:27:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.14-rc7
Date: Fri, 14 Mar 2025 15:27:40 +0100
Message-ID: <20250314142740.49129-1-brgl@bgdev.pl>
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

Please pull the following GPIO core fixes for the next RC.

The first commit is a backport from my v6.15-rc1 queue that turned out to
be needed in v6.14 as well but as the former diverged from my fixes branch
I had to adjust the patch a bit. I will pull in v6.14-rc7 once tagged and
resolve the conflict between the two.

The second commit fixes a regression observed in user-space where closing
a file descriptor associated with a GPIO device results in a ~10ms delay
due to the atomic notifier calling rcu_synchronize() when unregistering.

Please pull,
Bartosz

The following changes since commit 80e54e84911a923c40d7bee33a34c1b4be148d7a:

  Linux 6.14-rc6 (2025-03-09 13:45:25 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.14-rc7

for you to fetch changes up to dcb73cbaaeb39c9fd00bf2e019f911725945e2fe:

  gpio: cdev: use raw notifier for line state events (2025-03-13 09:20:12 +0100)

----------------------------------------------------------------
gpio fixes for v6.14-rc7

- use raw notifier for line state events
- don't check the return value of gpio_chip::get_direction() when
  registering a GPIO chip

----------------------------------------------------------------
Bartosz Golaszewski (2):
      gpiolib: don't check the retval of get_direction() when registering a chip
      gpio: cdev: use raw notifier for line state events

 drivers/gpio/gpiolib-cdev.c | 15 +++++++++------
 drivers/gpio/gpiolib.c      | 35 ++++++++++++++++-------------------
 drivers/gpio/gpiolib.h      |  5 ++++-
 3 files changed, 29 insertions(+), 26 deletions(-)

