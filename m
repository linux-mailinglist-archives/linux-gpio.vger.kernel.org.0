Return-Path: <linux-gpio+bounces-17233-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD7DA567DE
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 13:33:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EBCE189533D
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 12:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F6B2192F6;
	Fri,  7 Mar 2025 12:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AYBYWcuQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECC31E1E0E
	for <linux-gpio@vger.kernel.org>; Fri,  7 Mar 2025 12:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741350778; cv=none; b=Cg6GCGE3jsTuva1X0LflCNR7YCapCEcqzWB+UYLv4QlB8d/utvGOtgaPgSN97mVLPotFk4UBZbMEN3VBN8x8vPb57jQ4VKcDbE/WGdHuxIo6bMJGKAMb1Sq/BEEJLIwgtFou/Z0h0Odeu5hpPpWKqknFFr2OR/S24sEEYU8PkFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741350778; c=relaxed/simple;
	bh=x0KNblaIRgSJMApw2q2ASsM7BQ2eIFQHYxnjbxM69Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cREsVIfgiYZPEqilKUSTrd3SHtwbgB1PKWgh9PYfy8ahoLDlKopRugiN0+myrzoy72cxEAx9Z84RWnx0TGkByZJJv1Qz7/brCQa93DjiBCGGsznDZVZ0pEhOH9Voc5xWzIy9ZUXIvX6VXZ9IG4IS1DIuzgjCrdReTHy0rnNV634=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AYBYWcuQ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-390effd3e85so1629896f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 07 Mar 2025 04:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741350774; x=1741955574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xVLNbVcf5J5tHPSW2EA0QuyhFRjDh+ZXmGhDgOad+9g=;
        b=AYBYWcuQ1uBII9L4+9FLTon/N0j84KTL2d0XiP4aLQh+tqIf13oqnMLISGbjtoW6wO
         wSf71eVCEs8Q+2LQXNIJlyusa9GucxV8tveNS6Otxd2kXgs62Mu6ssoBrpUU00oiwEEl
         RYvjYH/uFIpsTGDkC4fftuzcunmYgSLVJmV9EWCK3+H+apNkrafgm09wSbWgqANulPPL
         HuKJBIblJnNzmYrHfv9BwgNuFOQPZhqp1fDpHPPd09mtsb8l6vZJqJXfb+FJ3gUKfGEL
         Q58nZ2bWeJV83DoBz5RBsLUPtR13VSv2tjjl1SHVf2EJJUFYmECxfT21fSsfgscrpKa3
         /wig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741350774; x=1741955574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xVLNbVcf5J5tHPSW2EA0QuyhFRjDh+ZXmGhDgOad+9g=;
        b=pUQIN5bi0pknKjIfI6oX1Nhy+RNGQDmWOn2bQsqFQq90Hed2E8HhPJjJZI8qOhmklS
         18bb2CkReYttjIewYz9KQI3MRk0tjqDcpuEIOSXm63czbyF9EFUj8fRDwJ/AWCQ0jIpA
         pN9B9BIyb667gy9MsGyIyhzPfqVBlk0s3hX/GVBzumstuUAW8efgjN44afU/KXuje+bN
         5xh9m3YSf1B2AItZL9JCiQD4tjRR+cX7zli7kHXp4bX+OR6IXARVciVMUVUVB/yZmy1e
         /Ts7eEZZwWhW551JTODMDqzJkfMyyD5vwUz55U8f06R9xdf5eXVA+Kc3q3sqD9sZ/ZH4
         io1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCPGWx3IPByeRzUeXk2kAMfepVmHH8tlo5vv0S+hLtdknLcraMsWuKhO+TlhdChS/8bDHGLNRgEXOx@vger.kernel.org
X-Gm-Message-State: AOJu0YyhjQV0g2vnMV18CzM8MeTrFJFViAZ9QpYN22kUYUymalXpcVCC
	LmN6NiS+a/RBGE9teQyLB03bgLrTuWp9UzxOawzP8ZIm/l8K6D6u+zW9KXTqxVh02+Qij1+NZl9
	E
X-Gm-Gg: ASbGncsK2E+87jYPVNkWQsypkHRs5lZ7QfYN9HNprDsKfx9dhUoxlK9OHEuozYXdRb4
	6DND2WhmUA2hq9Eo7yMMXtl3kAL2DgAkDJyrB8ioyE5Po+y66WcRJTiLSOUCwg8MaSbmgvY1WPR
	SEGE8mZ/16y3murnR8Qd5H8B00YzB1Ea9K8+HotEWGKrKF+iBQTrSZqyPKx66pCD+J3ikYEG85F
	ogCIaEUbulfaHK3B67rsaGWrMgLcMvKfkd0aYNNwgn/l0CmFwjj/nPYxoDNvZ2lz6rc2xH6TtZF
	Ls7dS6QGCHmCeYkixCAiA9z5/GFJfMOg6hkIrjI2zoA=
X-Google-Smtp-Source: AGHT+IGuef6pKgiNyF2uu3DNvcdOFkH4Hdb6WvXNB65WXsz2EKPw7vJT7pFnYFyhkFEZzi3HaKoaLQ==
X-Received: by 2002:a5d:6d8c:0:b0:391:2a9a:47a3 with SMTP id ffacd0b85a97d-39132b5b802mr2169697f8f.0.1741350773976;
        Fri, 07 Mar 2025 04:32:53 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:f9a:e2a6:5c12:124a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfbab43sm5297046f8f.15.2025.03.07.04.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 04:32:51 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.14-rc6
Date: Fri,  7 Mar 2025 13:32:47 +0100
Message-ID: <20250307123249.28832-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following set of GPIO driver fixes for the next RC.

Thanks,
Bartosz

The following changes since commit 7eb172143d5508b4da468ed59ee857c6e5e01da6:

  Linux 6.14-rc5 (2025-03-02 11:48:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.14-rc6

for you to fetch changes up to 391b41f983bf7ff853de44704d8e14e7cc648a9b:

  gpio: rcar: Fix missing of_node_put() call (2025-03-06 15:51:27 +0100)

----------------------------------------------------------------
gpio fixes for v6.14-rc6

- protect gpio-aggregator against module unload
- use raw spinlock in gpio-rcar to fix a lockdep splat
- fix OF node leak in gpio-rcar

----------------------------------------------------------------
Fabrizio Castro (1):
      gpio: rcar: Fix missing of_node_put() call

Koichiro Den (1):
      gpio: aggregator: protect driver attr handlers against module unload

Niklas Söderlund (1):
      gpio: rcar: Use raw_spinlock to protect register access

 drivers/gpio/gpio-aggregator.c | 20 +++++++++++++++++---
 drivers/gpio/gpio-rcar.c       | 31 ++++++++++++++++++-------------
 2 files changed, 35 insertions(+), 16 deletions(-)

