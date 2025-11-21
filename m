Return-Path: <linux-gpio+bounces-28957-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC91C7A558
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 15:57:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 3D96D36B82
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 14:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16B334AAF8;
	Fri, 21 Nov 2025 14:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GqLM9SPI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5AA33BBB7
	for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 14:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763736061; cv=none; b=oaCWfeRvn3wlGgOLFMw0Jth2iyHdsOas2BxF2YFegC43bMR8btJgXlPyKrHsuFpsTPX9U2ONAV2xmT3E7wkmHv5myVXeYCW6vxU3+I/US0rt/qdWPYRuMyxSpa4wO2V+ufWsygasDaDTNAxmxSRdmxmOtRQBQ1koGNInlEplbOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763736061; c=relaxed/simple;
	bh=B144/+aoYj2BusHMCYydjkBpbUK3ivmVDmR2STeUh5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O8+E2dTVRjwfLjGNcBUlIk66is4czZLOcq3oXqyqbjLYMin6wPwKOxQoUMUkNl7HSzofZLhuOT6qGBoGLbHu46LcIC+ZJOmrqpzau4yjPwW/FHyuSHh5lRVsrizBrOCQk/XhLKjaLoY9qWPFZcGco5/q1HqF+I9WYqj6W51bt+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GqLM9SPI; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso1753904f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 06:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763736058; x=1764340858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Da8bwtwxqZtTC6P5cEHULshapZezHJKeGtNSttI2v60=;
        b=GqLM9SPIppE4UGiJaSKMYgJKEPismwDXUgTzLiiWxPeW4g9a6BdeTHleHGxEJb1R3V
         Y18ykwOMfxY815Wa2rkL40opyiiR9fHrXHRebFu7ZD7Wog2ZhLTtk47gEB+8IJUD2NNR
         94fYIgSm4OLhY6pvfNNAHZoz6VReltxOOt/HY+yPDzDCiAyMy2czGc0ZJ1g+dOgJgbc5
         yUy6IFxccWXwAQ/jHaqF8zi5Bn3zjMfpq7AboAeVg7AM/htkMxQmscRHrsG3zav/4Oog
         HqYdTvB/T0RCLnSljqmTq1iD+NVhpem4txaI2WNjdROxSPZMZTD+8lQc3vE6LgROYlfg
         kZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763736058; x=1764340858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Da8bwtwxqZtTC6P5cEHULshapZezHJKeGtNSttI2v60=;
        b=iyJP95D00YNBU98z6/3ppTxDF/B8DWhYa1S7dNrVXspMNYsECmOBiDQq2GJaMK1gZh
         cfj9peKhJvkag/C1kkMli4rPFZxjuBGV7bgHbaZugCukJyCfIFaGpCMBf1MTepqyHOr9
         Lk2lHncLz3eb4/8x7LAu7EJttHuSVm9DBnuB605XLI92+79n7d5EQA4lyP8mYpqG5/DR
         zwXERTFR3T2zNgoIZj9Ar+31PbqQzrDJCPpMR+SaI2GWiUGrrbgUnDivW9HQeeThqumE
         bjZDWbF6kmD/q/+kBYiziF/AvVhE0FQZIn8CDnHtEbHIVuz8tqh3Xt95C8iDdjP9QAKg
         R6eA==
X-Forwarded-Encrypted: i=1; AJvYcCUiBYF1jZMOagA2kW/MUP3WENeI03fQj2rpXq+niJit5RZtXhJ4LSz0kLKh/FAV4J6DoDtjOx30S/x3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx41j0pYd+PzMCYiyCYNoDwneh2NwQDnwre0yxL+RoeThkrIy2a
	CjlbZsplcnTMoXAHbqN+EfVTknHlPGn37ne48orQWAAl3zQHhf23Vg7QOR+J6XMUnJE=
X-Gm-Gg: ASbGncsR7MMX9fV76tY+DzIjYklThawLjt0bFrVCleShcpmmz31vEo4lhhYLHH4xtaT
	ALxaVAyLi8nkOmJNAdnjN62iT6dfAr9Ub//7kUp1rad69malC750VYPy79WRD8G/gJo2IXgpsOV
	uS/K8rG9/bYXzuK6P0YxaVwOIGeR2isWkzb0R+9oQSmGLJZEIV6dUNuP1P3NHZakM/+m1YkbrpS
	/ZZdNMnjNITmyhfV8BDKzCFOU2IcWudby2U33ZeTaEej1M6Kchq6prKkiF2FkdGrgMW4XhSdBjg
	ctLMf+5ZgMmOcqGNsWUQCspVZY9qAz45ptKaweCPaKiKiBopd9WZeoPI8o1xkBnvecD4nlOduBg
	eZZ2s0B8z4D9FhsH+ahr69UNxdDaRNwLwVo4NLwFVLU75nQ5cS/fhjZo75nKyyGtkp/2SGQXmU/
	mTsEPEqGqzBBHWoJk=
X-Google-Smtp-Source: AGHT+IF88wwfgkypaZ9NbjRdsx3BZGdKPrU1YYKWPFNealCPjIvbKUNGenl6jOJj1zmu4+HhJeYaMg==
X-Received: by 2002:a05:6000:3105:b0:42b:a40d:713d with SMTP id ffacd0b85a97d-42cc1cbd756mr2490173f8f.21.1763736058304;
        Fri, 21 Nov 2025 06:40:58 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:ab1f:63b4:bcef:12ba])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e574sm11458974f8f.3.2025.11.21.06.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 06:40:57 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.18-rc7
Date: Fri, 21 Nov 2025 15:40:56 +0100
Message-ID: <20251121144056.70302-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following set of fixes from the GPIO tree for the next RC.
There's one fix to a bug in the GPIO character device handling and an update
to the MAINTAINERS file.

Thanks,
Bartosz

The following changes since commit 6a23ae0a96a600d1d12557add110e0bb6e32730c:

  Linux 6.18-rc6 (2025-11-16 14:25:38 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.18-rc7

for you to fetch changes up to 2b6d546ba83e8332870741eca469aed662d819ff:

  MAINTAINERS: update my email address (2025-11-19 12:02:59 +0100)

----------------------------------------------------------------
gpio fixes for v6.18-rc7

- fix a use-after-free bug in GPIO character device code
- update MAINTAINERS

----------------------------------------------------------------
Bartosz Golaszewski (2):
      gpio: cdev: make sure the cdev fd is still active before emitting events
      MAINTAINERS: update my email address

 MAINTAINERS                 | 16 ++++++++--------
 drivers/gpio/gpiolib-cdev.c |  9 +++++++--
 2 files changed, 15 insertions(+), 10 deletions(-)

