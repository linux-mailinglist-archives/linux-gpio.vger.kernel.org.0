Return-Path: <linux-gpio+bounces-8398-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 650B493E0BB
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jul 2024 21:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 013291F21827
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jul 2024 19:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD5422EE5;
	Sat, 27 Jul 2024 19:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oAR1iXyq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F291B86C2
	for <linux-gpio@vger.kernel.org>; Sat, 27 Jul 2024 19:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722109517; cv=none; b=FtxKqLn2IBYAvSBVsWp2i30Q7yS3oNtNODV8A9Iru+xpOM/MWDQ8OPT1FDl6NRLPxsiOV5MIYRaokPibAtomqyUlhJUg+6jKTt/AWn66WNnqy5InZXf59HNCfqGI+NVkdihOziBiWAD5P19bP2g4nLUm66tghd9jhQa5BNGxdDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722109517; c=relaxed/simple;
	bh=Ys8jpFhJ6wVpL85Kq5iGVVH2LBWXP5tdPOwBXVjy4h8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HTUTNRGS48m8F6alqFqjF/5nWTc4/yV6LE8unx//iyDDNmka/rU6u3ox/UAlDBI8yVDphyg7ti8UqtGjgsmImujFgVZtsT7mqNv1UfuyF8dXlMBfvh6QZ7f3QFEggV9PVj3K163Y7sZM8rkHSgKMky6Z4IwJhfQ/gR5o05pRMnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oAR1iXyq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4280c493719so5382025e9.3
        for <linux-gpio@vger.kernel.org>; Sat, 27 Jul 2024 12:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722109514; x=1722714314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RrDTas98pBu0wGaxfBeY4MXiXoO3QUidF6ItBOkKdCQ=;
        b=oAR1iXyq4pXaV2776ugwMFZCuY6DnaHEL077DdQN7lCrb1n3omXgh9e+QanvXAAcim
         tYLr3TiIK6W4qYU9+jX/4WQDU7OWLoCzRM6JUg1v4ERw3Oec//iRnwbVK+mskzmGxGRn
         K4KpqRbdOH/lAWY6lYQTwWM35WHfSxtoXKaNz0de0fMjrI3hCH0Xa8w/N1hJKBSYYz1b
         rEIgAwWwH1mIGgtEtHCEqJs3p0Xo/YNP+OcOUazFISz41odmlHN6FW0ta5AHhbWQE9pQ
         5VVtsIh0JnKGQZJip2ebu23O6u9CI1J5GeyTLXvBT873heTPLk0u96y8F0GuHUEN6mw4
         pWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722109514; x=1722714314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RrDTas98pBu0wGaxfBeY4MXiXoO3QUidF6ItBOkKdCQ=;
        b=WTuxNPpIzI1THBfyTfBHDbybiK8V6ND8AOK/T9ZRsIR6w95dnbgmFxWwZ539CMXjv8
         IFXKeNCSTXCcZs88vnwtWbhSX1iTHtMFxko2m85TFWaBNGiw/57wn+lUNZGARuQnu/LQ
         B68uZFwgvY9QEb87moQ9vaOlsSRMwMevb6WiFBkdTq1rEqGEVyrX2FprZs/74zrO3sZz
         kiwkCERA9MyU2fXJSWOgrMyKwy5sZsuMwh3k3AxUJyfBPvH48pt6gB3BnaX1HgVDQq45
         xHRa2HPGPoMEPPbLxzOh87dtgn2cqWskfHNgr+6gCsBBOdKpK2NwBhi0Qqc8bTMXRgEG
         t9LA==
X-Gm-Message-State: AOJu0YwJKJR5Hof9YeQWnnA1Bpbp4jimxPIrJfJlR9cfa1Sm3Ydjg++Y
	u+CSSk/sZ2AiDnDflTxbFabJ4QlV8QHuI8xGhAA/l4K5DbYQ2piwiExzytytjzU=
X-Google-Smtp-Source: AGHT+IG9Jw7eBdenAV6HXldMRTnnGFgXgz7V+8Sa6r7njTBGXz+xHtf7DXeaAX5M4Nck7FYukoWKrw==
X-Received: by 2002:a05:600c:354a:b0:426:6c70:dd9c with SMTP id 5b1f17b1804b1-42811e0b770mr22159115e9.31.1722109513570;
        Sat, 27 Jul 2024 12:45:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:492:8758:7b33:d2a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428057b7218sm122354125e9.47.2024.07.27.12.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 12:45:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.11-rc1
Date: Sat, 27 Jul 2024 21:45:10 +0200
Message-ID: <20240727194510.5454-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following fix for the upcoming RC.

Thanks,
Bartosz

The following changes since commit b3c0eccb485404d3ea5eaae483b1a2e9e2134d21:

  Merge tag 'gpio-updates-for-v6.11-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux (2024-07-15 17:53:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v6.11-rc1

for you to fetch changes up to 3ae08e47742eeebf2190900d31ddac53fdd13a5b:

  gpio: virtuser: avoid non-constant format string (2024-07-19 16:56:27 +0200)

----------------------------------------------------------------
gpio fixes for v6.11-rc1

- don't use sprintf() with non-constant format string

----------------------------------------------------------------
Arnd Bergmann (1):
      gpio: virtuser: avoid non-constant format string

 drivers/gpio/gpio-virtuser.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

