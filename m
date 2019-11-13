Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 360B7FB3BF
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 16:30:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfKMPab (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 10:30:31 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40184 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbfKMPab (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 10:30:31 -0500
Received: by mail-wm1-f68.google.com with SMTP id f3so2474132wmc.5
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 07:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G8sRoBFc9X72jIl9g4YTmp1K2pu22F88N/5vcjCjclE=;
        b=gnyxzG8tbob2YkHjaJ6LeyYJ15Izms6xun6dAxHKOtAuvrF8veYJbkUmpFWnPnhKcq
         gi1D+F4HmU7GXi/WzIlFfEqitxEtpeVTqupr6HMGX47hLX4sy/KfzEdmHP1zGoogUfub
         ZePAWsTF7wNPKN0ibgNOMQEetZg0+9qcsnBXuLa0orxXrJzR3edztiGIuCNQXTx5AHgC
         uRhHxaVywTtYBrx2WnppWXmYmCfV5TCjW/swOEkjXeW94LzmEtzpsRZqGYJJj53+2Y7x
         fbu9U/rK+G6KLHkH46cCnn0vEJRcHzFlLfowAwNBeI6NOHLFKMJUCPU71vTTqacqqYmh
         3KhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G8sRoBFc9X72jIl9g4YTmp1K2pu22F88N/5vcjCjclE=;
        b=M2osbRu+nUEvbgwEIYzMiRJ54z+S3bx8Ua99KY6qQhHDZPfT+aOoCY+G70Zl+jSup9
         b4Pr6q74wBVjBVog7+YEwJBtG+3MLGaOV3M+uuB4jbFRWCsddFtqrXvylDj6DeKVloD7
         F5tg59v0N45gF5AQpb3FmC3y+nbhc2bNrQVyYAV61Q8PROtudd0+M2+e2MOqRmsDJpEm
         xK+Y227eKBGrmY11o0SLVI3dA118jS0PjMC9CYJU1Ayo+/Pz0Wl9bZCUg3aNztM7QsyI
         zZZEKF76fTmi/9hawLhTFVBvZbIu12q7FgcDFTJiUhPbhz4dkLr4r2ws9CrmP/GulKFr
         klbA==
X-Gm-Message-State: APjAAAUdM1eoqakk6wPvcXIkkgDP2cQQZ4C5Fj14pRdvTXaTbnUx/19d
        5KfNO+wrs7RFGkn9hNDw5uW07oGyEzw=
X-Google-Smtp-Source: APXvYqyUwBENgZ1vVOE2DonHgiG+9yDsT8D2yuDhqge34T8rZZZI/nf2bXYs2b6KDrb+OHNq0OiJLg==
X-Received: by 2002:a1c:f20c:: with SMTP id s12mr3098059wmc.37.1573659029491;
        Wed, 13 Nov 2019 07:30:29 -0800 (PST)
Received: from debian-brgl.home (lfbn-1-7087-108.w90-116.abo.wanadoo.fr. [90.116.255.108])
        by smtp.gmail.com with ESMTPSA id x9sm3235573wru.32.2019.11.13.07.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 07:30:28 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: fixes for v5.4-rc8
Date:   Wed, 13 Nov 2019 16:30:24 +0100
Message-Id: <20191113153024.18507-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Linus,

this is probably my last batch of fixes for this release. Please pull.

The following changes since commit 31f4f5b495a62c9a8b15b1c3581acd5efeb9af8c:

  Linux 5.4-rc7 (2019-11-10 16:17:15 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-v5.4-rc8-fixes-for-linus

for you to fetch changes up to 0161a94e2d1c713bd34d72bc0239d87c31747bf7:

  tools: gpio: Correctly add make dependencies for gpio_utils (2019-11-13 13:46:04 +0100)

----------------------------------------------------------------
gpio fixes for v5.4-rc8

- fix debounce times in max776520 and bd70528
- fix parallel build of gpio tools

----------------------------------------------------------------
Laura Abbott (1):
      tools: gpio: Correctly add make dependencies for gpio_utils

Thierry Reding (2):
      gpio: max77620: Fixup debounce delays
      gpio: bd70528: Use correct unit for debounce times

 drivers/gpio/gpio-bd70528.c  |  6 +++---
 drivers/gpio/gpio-max77620.c |  6 +++---
 tools/gpio/Build             |  1 +
 tools/gpio/Makefile          | 10 +++++++---
 4 files changed, 14 insertions(+), 9 deletions(-)
