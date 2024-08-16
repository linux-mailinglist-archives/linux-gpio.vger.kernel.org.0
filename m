Return-Path: <linux-gpio+bounces-8764-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5839545DD
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Aug 2024 11:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 425B31F26E35
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Aug 2024 09:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F691304AB;
	Fri, 16 Aug 2024 09:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Zsj9ssTr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7551214373F
	for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2024 09:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723800870; cv=none; b=dZx1tBdHaA7uMFuaxlT9+vbgqD/s2bI2rIGRW+E4U8puq/nlsVxVJRwbHdebJiHWd2XSbLkHfdJf2HDEAjCDXGWp1s04jOQQt1d15fkWZ/x+2zZuB7vEbysViLhacf5ZxavXfs8/Womx759cEU1Zx6loRt9Dblt0Odbki8M9mjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723800870; c=relaxed/simple;
	bh=G+FeStMU2scmZhdWu0qFXGPtfM2I8vVu2NtqTriWF/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lTgwZhKmbjsnUxanU03tR0tRZ1WYiRoLUd7IM985F4tT21+aHIHqPAuGm6Jo6QJ+Q39G8ve3N7wh7a+mgPVwkKjPMUSHbnfUVrzJ9HbpXACq3B31FNoDQyxWUo15PlaoM+osNIO1bNMY+3o+5yiIOBgjNYzl/uF1L0b1CN1qRHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Zsj9ssTr; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37196c68073so195315f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2024 02:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723800867; x=1724405667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vX9qDv+2qVxfqHPc5bssG0UIDXBfDyrqbrBJRY4zjpE=;
        b=Zsj9ssTr4NXverPgL/1SD2t/C+/XXFm+YIoM3YoJ1/V3InpEVEQAPUJTM84OEYP65Z
         4ifwHjwck/Y4qOLfhdCHUxivApzp8cJG04bQ9oE/kDcFkvAVHo/O4/F9eaXD++4mzYMo
         /TAtQDTAjAJBZpo2l1Vy4fdP68vZHa8Hjp0vh27VhLdRG+BIgvAni+3YPb/khUn11hPR
         pa2CVrfVrB366iFVcft4u7ZDa55RIWDKIkhInWb/Jwpi5MRkCr5O5NmxAOJLlZBp8fFr
         DFeq9BWjUvSLEKmk3w7hTSLl1Bby+/iF7Lg2D5hUmA/lvIyUcSGVnG6p8b7HXgNLytIB
         fpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723800867; x=1724405667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vX9qDv+2qVxfqHPc5bssG0UIDXBfDyrqbrBJRY4zjpE=;
        b=Az22nLAuQT8UwV1QVIKyomg0hDrxvY9PoPjZkbStyDNgEcyCTxMjtNTMtAUc0vUOsq
         JUGqiu9Xh264B4N4owfVtXEMeeYtMzD8RhcgJmy+MO3kpgxyeov6WmkXTgjITx2L5nJ0
         5Ak3qr9+HMVvAO0ovZWR1NK6UyWDTGanWTFVp/pgDWuy90vkN5i1wXMzAGeQj8Vx9k8c
         CquOXLc64qO0mZf94rouE91u2Ta0oOgnGCRRFAT5nwBVWa4lwMJoD4JlDPA/xjAgGL+A
         T/0Cs/pSgL+mr/FiGvUdu3/DC9CJA89BJ3UJg6yrqRk4K3bPF7Zf/hNgG5gLg/neM3B2
         yZqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyyrCwDgRVkjoYD6WIjVyiWZaNSv19lO0c7TMqonudoZgcdeJqDf8pFlMY5IE9p1HWb8Lxj2MVMPMpx6zQhVSulqNhIYCRTPUvvw==
X-Gm-Message-State: AOJu0Yxq7N/4+HuSTFiQp/t1N3uNU8h2fXGalZy6wVDOpzLwvwO2Eqp+
	8+aejiQ+4w7QPFgTQxkG+Mz0WZgrySx4NvstZw7S5iZnXwKccBNmoDJJSt8+/Fo=
X-Google-Smtp-Source: AGHT+IGgtC2cxTMbZif7IqcMevbWdY6uWFHd/nzCSbeVPSEnWDm3kqpPbo059EvqeLFokloCeitP0g==
X-Received: by 2002:a5d:51c9:0:b0:360:9cf4:58ce with SMTP id ffacd0b85a97d-371946a44c7mr1123283f8f.46.1723800866069;
        Fri, 16 Aug 2024 02:34:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:aff3:cc35:cd8f:c520])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985d9d6sm3212232f8f.64.2024.08.16.02.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 02:34:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.11-rc4
Date: Fri, 16 Aug 2024 11:34:23 +0200
Message-ID: <20240816093423.12622-1-brgl@bgdev.pl>
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

Please pull the following fix for one of the GPIO drivers for the next RC.

Bartosz

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.11-rc4

for you to fetch changes up to aad41832326723627ad8ac9ee8a543b6dca4454d:

  gpio: mlxbf3: Support shutdown() function (2024-08-10 21:35:16 +0200)

----------------------------------------------------------------
gpio fixes for v6.11-rc4

- add the shutdown() callback to gpio-mlxbf3 in order to disable
  interrupts during graceful reboot

----------------------------------------------------------------
Asmaa Mnebhi (1):
      gpio: mlxbf3: Support shutdown() function

 drivers/gpio/gpio-mlxbf3.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

