Return-Path: <linux-gpio+bounces-3227-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D853852C3C
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 10:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1334B21D3C
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 09:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E582231C;
	Tue, 13 Feb 2024 09:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2ux5irU2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077362208B
	for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 09:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707816674; cv=none; b=Kow7FT10fv43I1gjGpYzf81m7+NF2ayod10yJ1EIfIl3Vbel61L/96m1UFLbn3rMQmK1rmXkvYyzIu1uT4+HCFMTAd8YCKs3ID55SX/5yiTEdOvbgnwKQQW7M6XEDeS2OY0FwXRpYGsGOTV9KDiU3wVwJM34hx05sZlkzcGZPe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707816674; c=relaxed/simple;
	bh=34ghv65tX01VnUZyJ9HjaQTEN9as/t/Pt7zLckOf0g8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G3PqRYRy0DLnEUYFwgCtkx3HBAvaCFVbHA0jHbof2wdhtKRO+q2ssWkEeFukB6fc1FTzBiwbI5HBQzbZ70mE5xXAlxgRBLSLFJ6ozj1qQ19lU7kMuxWVcI0jxSmDEq5BypiDD7O6ar7s0+NzdntnWrF8nauvA4AG21Qf71B6pHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2ux5irU2; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33cd57b7eabso277410f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 01:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707816671; x=1708421471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XO2K1jFKhfKBm39xDO4kMzNEQW0DrH5Tam/IhQbNI0g=;
        b=2ux5irU2OzIGmy6A+4QdgV6NL5nC1ntPufxOQog2qx41Xpsh/AnD+CwEqizSD1Tu1B
         cJLO7ackFqKqDAG6Xxt7KJ/eE4wuQ/yg0qaqqUFP18fGnCbfR7r5HNY/2KJueHCZDCWV
         V8mSeogS1JQJ+IXKpaAFvDzUMCVSiCt9Lmi1bCprQQenagU9zVZyZjY0gSJ7DgTwhfZY
         5Z6HvCUezekwlbAYWeGerFX6hkgOkp+Wt9EZG8uTrqsNBDKNKr+S7fDCKjqyii8OXTD8
         3kk2Sg3WPw+yB4dMt0lE4sSR1DDXJ/HHBruQ8neuliQgmX0/SRfQd+3RjjR9UquN2VxU
         +HRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707816671; x=1708421471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XO2K1jFKhfKBm39xDO4kMzNEQW0DrH5Tam/IhQbNI0g=;
        b=pKcJrZbClxVAAOazoo6A/+7ChVtxjhGKkEbernujsJP8vaaX28zJ3/8EESkcZO91TZ
         cXWUukBbxQjLvQlGOI/zvarYNBXxte5Dti5xJbuDJEqy+MMtAheLrrepvN0UUgs4QNYL
         L4NUa5Tg0/3+OSy3WPeuBd6Ho6lv3oFXUsgMu1wC5nLuXne/BNZ+83YgyWfkPVL/hPjD
         LXpj6D1zGik1NR1vDbXQW01kem4Co5beV3Lfz2ZD6u9TKOKj1ncBxGgstIGlInyJKD1o
         h9ZyQIuwdDB3uCA2lut5bi/2ETL7s8j93T/TRtLvGYXYivZ7IY09rRWZFGQXmgUUGkzx
         OETQ==
X-Gm-Message-State: AOJu0YzV7NhyaUKCynRZNJa6NW1ZHifoE6Tu2JIsoO6xY1qzIfMgYhwe
	m68/AuU1iVcKF+NKfBrPNalfuvKyWxwytPzJFOvLgi7M17DmFd6p0Hf19Wlf1Wg=
X-Google-Smtp-Source: AGHT+IGa8HG0pjhyJFF0NNhKEiWnY7s09LgDrEFjD9McGCysp+GPat0YeIIq5taZ0wqc8AS2LPdoQw==
X-Received: by 2002:adf:ef4c:0:b0:33b:4aeb:82f0 with SMTP id c12-20020adfef4c000000b0033b4aeb82f0mr6678179wrp.49.1707816671160;
        Tue, 13 Feb 2024 01:31:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW9YFy+pSQkDsUJRsKwWplxwHNE6vtS9EZMiQtxiKDwYCLt2+Rij8l2aCNWY0MuonMv1nguXi8LyS/9uz1FVmDOcOsZMeStpOulk6DP+aUeqUMCdHWi7Ko6nfYBT/2QMJqGGExOxd8cLJNhlt7UMp1ERBTnBzUxMctnJpYSI22KpehFJ/wZJiWzRh1mJrQWNConmKDE9nBseZGD6w9O5F2g7WCBgsidLTd6VrzDPvj9F6lZS1XZbXzbYeh5wzVdRWCCn5wBjpUMdUxrbA3zZiq5+PPaZLkhGB6Cvw9yGcrIaNgdu9l3Lwq2lJG7MHFHDy3vxo5NfM5r
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f634:2e37:58a9:242a])
        by smtp.gmail.com with ESMTPSA id p16-20020adfcc90000000b0033b2497fdaesm8980897wrj.95.2024.02.13.01.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 01:31:10 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@the-dreams.de>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 0/3] gpio: fix SRCU bugs
Date: Tue, 13 Feb 2024 10:31:05 +0100
Message-Id: <20240213093108.13922-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Here are three fixes to some bugs in recent SRCU changes. The first one fixes
an actual race condition. The other two just make lockdep happy.

Bartosz Golaszewski (3):
  gpio: take the SRCU read lock in gpiod_hog()
  gpio: cdev: use correct pointer accessors with SRCU
  gpio: use rcu_dereference_protected() to make lockdep happy

 drivers/gpio/gpiolib-cdev.c | 25 ++++++++++++-------------
 drivers/gpio/gpiolib.c      | 23 +++++++++++++++--------
 drivers/gpio/gpiolib.h      |  4 +++-
 3 files changed, 30 insertions(+), 22 deletions(-)

-- 
2.40.1


