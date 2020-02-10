Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF921572DB
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2020 11:30:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgBJKal (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Feb 2020 05:30:41 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51942 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbgBJKal (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Feb 2020 05:30:41 -0500
Received: by mail-wm1-f67.google.com with SMTP id t23so9293009wmi.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2020 02:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QjCT7DGcknRZr660o4Tl2Ax7WhSF9Ik0datfUyTdHpY=;
        b=tz62J9x3mFQtm2Nc/aAgnxL7BjYIu7nStxJVlPRQyfNOelVB3VuZP5DO87L0m+mT8+
         fSOjQi9Rdwnp4qBrT66hAGOSpGlJ56WYt38aubGvJG6lQnAC8ha/5UPF7Yc5+LiBt0nc
         gDmCvjRocnayOTzzAGHXiVckvJK6zbLzUqSltr4rMiEG4d7pP4LkTWS2xJOHmkbnud6D
         Y99zfaP+dvmwoBKwnBrdwuKRxl+jNmLlKLUCIoOzia7QG9vsRPFg7GFc2Kd9801A4sCv
         JVsvpWug/+AJWZWYukqf1VBGZ4ICBP3fm7ZxZsVoy6n4TUv3OPRryO8ApTBFjmY7DMFT
         FCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QjCT7DGcknRZr660o4Tl2Ax7WhSF9Ik0datfUyTdHpY=;
        b=gv7agr0etS/lsAXhxXA6rT4BkuH/yK8uvtpiNtGxQW0TzuD/6dvpu1AIiWvzuB4IW1
         9X7z5HCS+UszgdBFipOrjKnheHqXE6m52h1vuDF4pb1MUYYwV6ESyvLy3zxyc3vvlzAL
         xGywLsh970LteLNda6Ska56ok0C/fpboL2koVUifqNYCHLbuhB4zJBValcv8IVygC7RI
         vDTnjCqpGPdgzdS7lHcKOPJIvF6vnODERoo4Ztp4O8IBbe7ZXBK3kZL9z+Ik6xgCp1sm
         Hv4DUK3JN6Jr/oCkKsZITECKowG5HTm7+ZRuXewmRzdHTnaRMM4amaeaOffjLVm1C5n2
         eisQ==
X-Gm-Message-State: APjAAAWSwDeh3LtxQoCmcQcWwf6iNaQ/ykVwhsFtCZEt1HGaKQbAOh9Y
        HyVmCOlpTeRw3o5OpEndeFwp7w==
X-Google-Smtp-Source: APXvYqxzpLLPYkGAYETVLr8MLz4P96Jxel0uBUKZ77P3N1+hsWLbsq0MXvj09Tp1WHNJDzrCeIRIjQ==
X-Received: by 2002:a1c:7205:: with SMTP id n5mr15360060wmc.9.1581330638075;
        Mon, 10 Feb 2020 02:30:38 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id f11sm33443wml.3.2020.02.10.02.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 02:30:37 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: fixes for v5.6-rc2
Date:   Mon, 10 Feb 2020 11:30:35 +0100
Message-Id: <20200210103035.16406-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Linus,

these are fixes I picked up during the merge window. Details are in the
signed tag. Please pull.

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.6-rc2

for you to fetch changes up to 8131b73b22c25e57e926874bb284f61cc3f8ac5e:

  gpiolib: remove unnecessary argument from set_config call (2020-02-10 10:55:18 +0100)

----------------------------------------------------------------
gpio fixes for v5.6-rc2

- fix a regression introduced by gpio_do_set_config()
- sort GPIO entries in MAINTAINERS
- remove leftover defines in gpio-bd71828
- remove an redundant switch case in gpio_set_config()

----------------------------------------------------------------
Andy Shevchenko (1):
      MAINTAINERS: Sort entries in database for GPIO

Axel Lin (1):
      gpio: bd71828: Remove unneeded defines for GPIO_LINE_DIRECTION_IN/OUT

Bartosz Golaszewski (3):
      Revert "gpiolib: Remove duplicated function gpio_do_set_config()"
      Revert "gpiolib: remove set but not used variable 'config'"
      gpiolib: fix gpio_do_set_config()

Kent Gibson (1):
      gpiolib: remove unnecessary argument from set_config call

 MAINTAINERS                 | 28 ++++++++++++++--------------
 drivers/gpio/gpio-bd71828.c | 10 ----------
 drivers/gpio/gpiolib.c      | 30 +++++++++++++++++++++++++-----
 3 files changed, 39 insertions(+), 29 deletions(-)
