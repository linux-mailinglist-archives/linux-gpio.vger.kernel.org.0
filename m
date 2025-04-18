Return-Path: <linux-gpio+bounces-19062-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E66BA93E69
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Apr 2025 21:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AE448E3D93
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Apr 2025 19:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9DE2248A8;
	Fri, 18 Apr 2025 19:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pI/aWJxC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CEF29CE6
	for <linux-gpio@vger.kernel.org>; Fri, 18 Apr 2025 19:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745005790; cv=none; b=M9pQV00q7ZhuD449zmmeBPGFTjvBgPtVN7zm11ZlQ9lY/VHKc18LQ8LF30Ibf7fCvDrP2SFAgCTAVbpS9mxwFCFkQeCrlFMiFBauLkVSyef5k5rjQJMqlmTaXIwSrAvg0oyoyEqqB4JaACvUMdFzzqskPLhTsqjvcQuzjzfET9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745005790; c=relaxed/simple;
	bh=Y3uL99Kqb5E5URdOgn/HDsBLA/QVSVh7R87wvzeJQZk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ky43B3rltzQNZ9tNPmi7wZGLkhzoRYSwl2q7ZFjeZGRhzP09jPMsG7G8mV3nPkTgO7IEsLd+ZPP+2JSKLpQoIb/oQmkIAQfUABJwYA1+uE76jHxuTxsRb2Cp4ObJtPyN2F9rdOTR8AngMlQY0iM7bW7gtxNG155iw1C0d+fn74Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pI/aWJxC; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso2048978f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 18 Apr 2025 12:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745005787; x=1745610587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SWcOQWb/FzwxcsBkXjqRrzLFD5Nt+phtJhswCCZfnng=;
        b=pI/aWJxCYYWAjFV+Udr0Z3ZlS3VhFm050iJ9NeQ1l7PcQ487LgmJPi9mJyr7YIZyGB
         sJwfwBFeNX9RNj2H3mVP7GQUL2n11yPCEsorDtpBpXirneApbkSq6AvlZNULxDjppyMY
         3NpuQ1qD0naRlf1GvI0HAi46wOVJgblfZvFoAi1r8Qb2WcdFqvw4ZPgOWl4hk5VlqugM
         5pBhbTRgkgBPWkOOVeB+xy7HjZt9TZusyiLpiK8K+7zNzWgxyRFbQ1wYPjRt7okjl4Ho
         0gy+tyqcSqsHV2dqySgCyibRpZTdlbTYGKcNlAexBTRvcu+DpQdVGszNEDKmAAm72R2A
         1XZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745005787; x=1745610587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SWcOQWb/FzwxcsBkXjqRrzLFD5Nt+phtJhswCCZfnng=;
        b=IwAK9pfrMh7rwKmJyarHbjtDmAHnxfDKqRMAzV8HaD+3+Tf0lJp8miwjLkqTeFuw40
         AZiwV0He4fRLH3YFNKgv09F09irjGSMw/VG04MOGLuBC0W4TZ9/Tb14ZA7d94AYxNNoe
         vL0h2cJk1AIjcmCoOfL2uhcaNTyacLPg2OyQY9KYlaSGzxqyvOKN1Ywc9ikryjBr9JyC
         R6aA00pBUwu8dsGdzlBW7sKlg9P8Ad1LC+8i8N7LENASqblzspZsNA2+katLObVOzsh7
         JkqTwWYzBIYCrMEQEysw9qfjn2fqu8NWgh0EeE/JdLj8JN49M62yGoNtHruCwJOWdwR3
         VSKw==
X-Forwarded-Encrypted: i=1; AJvYcCV61DPe8y4BJXZTY+vGOVNdfJjBzCvb0t2J8bxEx0AhFLQoyF9wiMwmc5T0b+QaZh7CrWl8i6RYt68Q@vger.kernel.org
X-Gm-Message-State: AOJu0YxPz+W9uFZn+yMfabz28UJCkY8niiIUsbl7reKsq8ze0xvjm4fJ
	mzpK8ca9IOmefZ3lwRR/MrltLooRb5/ZW0q6IrWtEZiK7xCho18xbbIqZVQmWH0=
X-Gm-Gg: ASbGnctSFpO8NY8HPlwzi1cIa2FaDUNmcHrPcsviZghQbz1uqhbFY8oIW6MS1eJeTM1
	Pp9G0/2DNBpqPgSkTXg3LiuUVzw/LinZZ2jdLU42ZeObfO3l12YNl7h88zN51OXFYkeF9hZZKC+
	gYRIALBel0Q/NpDoltVW8/i3P79KLy0qqFUkpDgbqu5gocKOoZGBLV//LDL3rxXAQfycVoM2Brx
	vkLUOoRX47H4dAzeNoyG/todCnUHianzHoVg7OOgsqSWcoIc+DQoVHl55swTlFXP9jV8Ide5q1Y
	E2i7/Y/5DzFDYdIQg81sCLZfADUV8Uqdi/BMVU9m
X-Google-Smtp-Source: AGHT+IGfV2eBKHkjGdNUHgY7tqbduGqKcd0lyO45b1jqOpy/gF1E7xdvbOat2/h/MTv/N6tXoS1yrw==
X-Received: by 2002:a05:6000:2907:b0:39e:f89b:85e2 with SMTP id ffacd0b85a97d-39efba5ae96mr3212423f8f.26.1745005786648;
        Fri, 18 Apr 2025 12:49:46 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2c35:5ff2:b98f:4e61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43be53sm3559480f8f.41.2025.04.18.12.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 12:49:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.15-rc3
Date: Fri, 18 Apr 2025 21:49:44 +0200
Message-ID: <20250418194944.37742-1-brgl@bgdev.pl>
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

Please pull the following fix for GPIO core addressing an issue in
the line value setter callback conversion.

Thanks,
Bartosz

The following changes since commit 8ffd015db85fea3e15a77027fda6c02ced4d2444:

  Linux 6.15-rc2 (2025-04-13 11:54:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.15-rc3

for you to fetch changes up to b424bb88afb6719b30340f059bf50953424cdd9d:

  gpiolib: Allow to use setters with return value for output-only gpios (2025-04-14 20:31:00 +0200)

----------------------------------------------------------------
gpio fixes for v6.15-rc3

- check for both the new AND old (deprecated) setter callback when
  changing GPIO direction to output

----------------------------------------------------------------
Mathieu Dubois-Briand (1):
      gpiolib: Allow to use setters with return value for output-only gpios

 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

