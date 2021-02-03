Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41F2530DAA1
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Feb 2021 14:10:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbhBCNJr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Feb 2021 08:09:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbhBCNJp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Feb 2021 08:09:45 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B0F2C061573
        for <linux-gpio@vger.kernel.org>; Wed,  3 Feb 2021 05:09:05 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id e15so5184483wme.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Feb 2021 05:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kITRYmL9gYyUSTr+OQk1FZU6u9l8o2aUuI4jTkAxf4o=;
        b=DrATJn7fPqQ32wdnSdxvpOC6uLX5INiZsvqke4K8loBMQBpGV+//FTFikEkBm9piMi
         wFTQL/UAq+cPx7wvB6erw5tHB1rl1xQg+GsyrvcYtMF28IceHmDwJ8D+9OCU+mXDhFQg
         82+VnSzu4OXHxsCWAok2O4DW8GYjgf0HTXbhxroChvIz8pl4gtp7H+TtYnUoywfAD48D
         Z5RQARvDlf+944xs2X40nfT983qEq1LrIykuRWfTi4D1WtqC4UVq7n0WhvWHOERvos6z
         YFR3QeNJlwGyz+2NdFf9sad4eNGIvI1W77HCNBmNGgRP+9pHGyQ4y8rjZEIAVRocUGtV
         j2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kITRYmL9gYyUSTr+OQk1FZU6u9l8o2aUuI4jTkAxf4o=;
        b=V8zmazqObzZpxS9baBRjeJ0M3R4D16hswB9yt8gs40V3thBKQJrU4vqd5k03S0iVti
         QRBhw1TgE/1laC1wYnJct1ICIaZTBBdYWPTdvM3nw2KmLgzftpizBJhl4yB7toOq4ZX7
         FTgc9ZrY3I3KrMmHrsYf0oXkengL+3vH6bClPVyCu4zq3/9NQNhxty+8x+juVQ8xwhzU
         H6AuCkmCyaNwcecavcKIbZoxx+jvYuxHf/LpcV15zzdSRG+D+NjyRHTbJm+GjvdKlE4D
         ls3FbaOboqpblY3pExeIpu5Ti+F2A4WlNSg3/eM8mSb8Wbf73WgXj50GyK8JuuMEAGa9
         nTHg==
X-Gm-Message-State: AOAM531NQKEth6Eb6xP+wa4obbGcq4/zW6lW+vDUSNsu85o5rSdIGrRJ
        A1Bwi/UcK8GEBAGlhGqhx52VnA==
X-Google-Smtp-Source: ABdhPJxuOMj9hloUakkWJIg9DRccJERGx8rzkaFXU90o6FHTSQ5YHjTLuy5KIh2B+HrDu+rqZkR1JA==
X-Received: by 2002:a05:600c:3591:: with SMTP id p17mr2834006wmq.153.1612357743323;
        Wed, 03 Feb 2021 05:09:03 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id g16sm2624414wmi.30.2021.02.03.05.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 05:09:02 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] gpio: fixes for v5.11-rc7
Date:   Wed,  3 Feb 2021 14:08:57 +0100
Message-Id: <20210203130857.17648-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus,

here are some more fixes from the GPIO subsystem for this release. This
time it's only core fixes. Details are in the signed tag.

Please pull,
Bartosz

The following changes since commit 6ee1d745b7c9fd573fba142a2efdad76a9f1cb04:

  Linux 5.11-rc5 (2021-01-24 16:47:14 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.11-rc7

for you to fetch changes up to c07ea8d0b170c0cf6592a53981841c7973e142ea:

  gpio: gpiolib: remove shadowed variable (2021-02-01 13:24:28 +0100)

----------------------------------------------------------------
gpio fixes for v5.11-rc7

- fix a memory leak in error path in gpiolib
- clear debounce period in output mode in the character device code
- remove shadowed variable

----------------------------------------------------------------
Kent Gibson (1):
      gpiolib: cdev: clear debounce period if line set to output

Quanyang Wang (1):
      gpiolib: free device name on error path to fix kmemleak

Wolfram Sang (1):
      gpio: gpiolib: remove shadowed variable

 drivers/gpio/gpiolib-cdev.c |  2 ++
 drivers/gpio/gpiolib.c      | 12 +++++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)
