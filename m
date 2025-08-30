Return-Path: <linux-gpio+bounces-25226-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CBBB3CF2E
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Aug 2025 21:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 318C73ABECA
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Aug 2025 19:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500AE2DF3F2;
	Sat, 30 Aug 2025 19:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bNtKBn2P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD8D2DECD4
	for <linux-gpio@vger.kernel.org>; Sat, 30 Aug 2025 19:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756583665; cv=none; b=ppWUjweTuw4HT2+RT+uSkYBqwE7P3ocPeiUMSJYWrHnYXqZMZ2ZUrkCjhfKT+UWfpULQeh24H2ftms+ZvuhIC8sZDY8gWntcqUQ2DOABV5XyYjtKW+c4xmi1OuGTQ//R3XGRzk2D5pqAO7caeOiXw8F8iAFHiGxZrjPCxzB23+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756583665; c=relaxed/simple;
	bh=VcMB6i9mLkUmp4G6fTpg7CesKanMOCwBBXFfIoLjtrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F453YIT6ZsYYa31TojlX60mdaw3fr91bz4+fQ+QEiVNzzJCeJYVDLQszYgTwzdeXa3N+46oR0eIG9FdAym+s2sY031QfdixpD4mNvFQ4XeUdRjCAXsvZjSoJrvFGJCPMiNsrBOozuxHrE2td9VykBhfk3fmfRUukyWAVunJkVTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bNtKBn2P; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso2468003f8f.3
        for <linux-gpio@vger.kernel.org>; Sat, 30 Aug 2025 12:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756583661; x=1757188461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WWCJ+1za7yqATipqpoHH2837nCEX0b9cfMM3RbSb7qI=;
        b=bNtKBn2PmGS2A08cqTfCLHvhDobUCX6JzRXpxClB8cbI93zrvW5mO9Y6TqPbkJ8KoR
         celyidiXgS0Q5Z7rQMVyZlknkpOoRkbntGVz05+KoHxT/4cI/Dq3QvnOA87GOyL7Ppbe
         IiuYQUakjcpsIhSsJNo/M1ioaVKHzCklWpMcFqVYwFL1yj1FTrD4mZhBQbHrm9G0mPLo
         pvymA3QOFuDQy0kV94eASY5Iyo6AtRrxK/YahtmJcyur9griw0olX/LDkWuov21H4Jqp
         RsTNfpUg3wq6Ax71hz6+xSDRpRLDDWPGpQl8W9azNxXmbW0UUHW0BAfSjzGBiVQJ5rAB
         phQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756583661; x=1757188461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WWCJ+1za7yqATipqpoHH2837nCEX0b9cfMM3RbSb7qI=;
        b=riPCiWmodJIBacOlBYDVJlpAblGe0TGuUgT3gcESlRCEEoJ0rKTaUNtVtfcoiGvWQ4
         xqnaoYYybaSgzFeaQ84WRmvGv5KG3p08aqJ7rRBFcKTkpgyOzYa7FVzfT8OtXB5NHSsO
         qoyD7kZJ4WKlMOnRdfY6HuRYJkWt8RIB0g7XIDHKwSTvUUeVItgoFu6R/Nnx8hsCjMCm
         Za3ppf/QbHE2M8ZoCPRaplXTXBTyEjhP2U6fUOpvLoO6YbBhaslFqhbTRGa+UrtpcSM8
         mK4PqQWePeNReUvZ0v826nNn18vYwl+JeIq4VzWblgh0Ynj10tOWglG7jG7BfypoxFJO
         7jwg==
X-Forwarded-Encrypted: i=1; AJvYcCXJWCN/hvYrtvinZ1I9st3WiDa8cbuBB3rcqU2BIhjPjVS1fVL5rgFNFhPOyCxWLxG8/gA/jr9TaQNi@vger.kernel.org
X-Gm-Message-State: AOJu0YxbN+P9V0JMDsi1EgDC0rJP4Uz8D0y1Yc0uPNuEVEPpvPGDZXPy
	Kl+rXWP85gquHnMLiLwd3P9y0cudMv5KccKv04dKLmeROlDRZTJ6XPkWc9pQaHeJO4U=
X-Gm-Gg: ASbGncuhp05Ffqb/2vdFKdvhq9hgt3Vk/RP4TtvEn2LCVcl8ewhdwRjDqNH9S/2iT5m
	g4ikEsCc81Ly4qeY2ARAv849HVQE9t9TPu1kLI7CI/FgWDsTDycT3NZzDj3k5JU7G9DXVDUUyfm
	bohYEP5atBbWufIuLOy8srPoagif9hp6yU0sY8bZJgnoPq76Ufh35waukfgXUGEY54DWBL5D+cS
	kumt+bPCyNnA5nGpN28Q9cF4XRnZA+UYJHv9MxltxemvP7ZNodXxrj0me17dLZ5vdyMtVdil9ZV
	g3/5JbYwN7Xvsoraa+p57ffyGvxvNg/SmPCIO4PN0NJEwVDTDlhXAxaoLrw/H56cSq7PRAW8l1K
	8/DYBI8ybjqqj6penigWKvsKA
X-Google-Smtp-Source: AGHT+IF/Ozf3VwEqoSzRGTCZ2bOJ0FXinNTHiBmEMhey6+4fvCJAgqEnaUl1gG/65IwAcEHSH6K+Yg==
X-Received: by 2002:a05:6000:21c2:b0:3d3:494b:4e5d with SMTP id ffacd0b85a97d-3d3494b514cmr504381f8f.0.1756583660998;
        Sat, 30 Aug 2025 12:54:20 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7402:75f4:2258:3fae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf270fc496sm8456113f8f.1.2025.08.30.12.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 12:54:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.17-rc4
Date: Sat, 30 Aug 2025 21:54:17 +0200
Message-ID: <20250830195417.8262-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
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

The following changes since commit 1b237f190eb3d36f52dffe07a40b5eb210280e00:

  Linux 6.17-rc3 (2025-08-24 12:04:12 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.17-rc4

for you to fetch changes up to 6fe31c8b53003134e5573cfb89aea85f96a43afd:

  MAINTAINERS: Change Altera-PIO driver maintainer (2025-08-26 12:17:39 +0200)

----------------------------------------------------------------
gpio fixes for v6.17-rc4

- fix an off-by-one bug in interrupt handling in gpio-timberdale
- update MAINTAINERS

----------------------------------------------------------------
Adrian Ng Ho Yin (1):
      MAINTAINERS: Change Altera-PIO driver maintainer

Junjie Cao (1):
      gpio: timberdale: fix off-by-one in IRQ type boundary check

 MAINTAINERS                    | 2 +-
 drivers/gpio/gpio-timberdale.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

