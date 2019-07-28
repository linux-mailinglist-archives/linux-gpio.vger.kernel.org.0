Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA0DB77F19
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jul 2019 12:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbfG1K4m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Jul 2019 06:56:42 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39027 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbfG1K4m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Jul 2019 06:56:42 -0400
Received: by mail-wm1-f67.google.com with SMTP id u25so40684640wmc.4
        for <linux-gpio@vger.kernel.org>; Sun, 28 Jul 2019 03:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ReiPg+C6vzpc6vip+cxYwwua/MLHEFF1E3CpGtt7X1E=;
        b=DnPvAe5xrPclAFxrLHzNULtSz9mCIwDH2K7uYtPOVJtE6udIfPmDC6ihwlWMytUeyF
         s3v7TjllFIVzXxIu5t0AglHUL9vBXspg1fGErZ07Q508PQxQ5bY6BS7+imioOC3d0DPK
         M0itRiwAlbF+g/NjLo04H1Owpf9/bcPvjaf8x4kmLl/gmsGoZ2A1FAMvuac9qeRprqqz
         8s9ia1lCQ37e4O96V3sCGoKLqS7j6dxjOfXfzCdsT0Ymq8hCmUDx2KrXcDrnYX89Dy/p
         c1CeGOdA7LMTK+fmUUpSbATzB3y97APT5uEBt0s4NJk12Mi1x6flZuv/RReF8LDccwC/
         eZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ReiPg+C6vzpc6vip+cxYwwua/MLHEFF1E3CpGtt7X1E=;
        b=kgcHFKUTwjwYbw4Ltwg5l0zfQpKw69m3wB9dzuEVIuT/s89L2CXo7qN+McFQNDo9Ik
         QVveR0xAqbWzAuxck/ecviRIZ6wfWUEvozIVc3YPTBiW/J10K3pLFBDBpnWXcnPHUYlU
         8cw4lP7A5hvZqizkKzLt6itA2/SvMttk2hyTgPmlfpPkSdMdcBQN5/Eu7nthsnk4RMXv
         7Hv9/l2jRCxVz/LMFXm/xxueUL/VhhOIzH0jcGK4C2A8hB7BycmVlXd3bT7VSuMyUpZt
         l2/OfOy55BKllDco7ZbDI+0DZtcWKzVl9duke1gaUKmBuprRL/FfpGrkscC50wj1nd1m
         NMLw==
X-Gm-Message-State: APjAAAVF7TA9N0DalKcvIIlxbM69RJYJcmuRcCmns7KL/NX7PuiRhlsv
        6L+zj3JV/6FIEJmhgvHcSOU=
X-Google-Smtp-Source: APXvYqyZBIi9amhkGYhXl+YdsvdeEiX/CVFCioB7mX5DYdKRP/l65L94fRzi1/y8y0bQ5XYDdefKzg==
X-Received: by 2002:a1c:b706:: with SMTP id h6mr91791744wmf.119.1564311400583;
        Sun, 28 Jul 2019 03:56:40 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id a2sm58581321wmj.9.2019.07.28.03.56.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 28 Jul 2019 03:56:39 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: fixes for v5.3-rc3
Date:   Sun, 28 Jul 2019 12:56:35 +0200
Message-Id: <20190728105635.25057-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Linus,

I guess it's too late for rc2 so I'm aiming these at v5.3-rc3. Please
pull.

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-v5.3-rc3-fixes-for-linus

for you to fetch changes up to ffe0bbabb0cffceceae07484fde1ec2a63b1537c:

  gpio: don't WARN() on NULL descs if gpiolib is disabled (2019-07-28 12:44:14 +0200)

----------------------------------------------------------------
gpio fixes for v5.3-rc3

- fix for user space handling of active-low flag for GPIO events
- fix the stubs for gpiolib: don't WARN() on NULL gpio descriptors
  if gpiolib is not compiled

----------------------------------------------------------------
Bartosz Golaszewski (1):
      gpio: don't WARN() on NULL descs if gpiolib is disabled

Michael Wu (1):
      gpiolib: fix incorrect IRQ requesting of an active-low lineevent

 drivers/gpio/gpiolib.c        |  6 ++--
 include/linux/gpio/consumer.h | 64 +++++++++++++++++++++----------------------
 2 files changed, 36 insertions(+), 34 deletions(-)
