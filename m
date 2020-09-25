Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79CB42789EC
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Sep 2020 15:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728551AbgIYNts (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Sep 2020 09:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728121AbgIYNts (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2020 09:49:48 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB33AC0613CE
        for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2020 06:49:47 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id w5so3670656wrp.8
        for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2020 06:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kfb+3x7/ayy3+ZXIqoIrlZ8UH+ptKhwWB7+u4YM2giE=;
        b=BOTMI2WRbfnHw5JUMJDRCevVZMeU2321PhlP8XDYRJrBldJXcYs8syWtwcIIb2e5gi
         XCCFhQO0Zqgjhk0yFVScmAz42pUQ6aVQ2Q65TqISgS0lm5i4BF6fo09S47ScOdwmiqZz
         uJmQv4t3rMV2wQR9fLlW33hsBv4klV7kwKU2CbyJZiueJp6ZCvooXzFDSIh0qeKTByx9
         1X0Nz0SYOvr/NoBB8GCYGHU1CILsOvhpR0Z9iIDLG35eRNLntWHsCJtORvBiN+9iEott
         HkOOGIFohCKUJPoI8OQeRhvEqnXvfTfKn4eULJg2Rff0QdaNUPZr7RwCd1f+jaN7HWxP
         b0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kfb+3x7/ayy3+ZXIqoIrlZ8UH+ptKhwWB7+u4YM2giE=;
        b=n3JpQ3ysd5RLORH+cFb6iwI1n05/VCIEkqCf+DQmpyhI0e+v3rfuNozXJjl0Kx6hgp
         nIxcmReZgIwG48mf5pjzZWICiqc3pY9PqTrjvphrLpOPitaqlQUCwLN6ZUq6ExeO+aOs
         4IwRz1I/0V+x/0RKcd60wMyIMdWWnPq7pcmGxso3Krop5B6v6Nsm70e7zWt6XaZ72Bdk
         Y5HqdqXntPn3daSLOTACBxw2wcqBiXcJHxLT+g5Dsau1LkbjB6BA15+eis7Sv1XL7eCz
         C5Bih4nyxG4xS1FU94+tLofLf91Y95pDnqch7Gel1sTykkdSoezywAbDHoeRdcUFmblu
         cXiA==
X-Gm-Message-State: AOAM533b1RBRz6GU5nZX/+IfFOFZpL0aCcWA2YusFVrxrciHfpUQP8II
        dfFp8mtD86OPN3J7FwHnf9mEIQ==
X-Google-Smtp-Source: ABdhPJxXyftqO5H0DvRjjCdjQ1ysYQOwIKKnUG97/HtML0wH5+uVKUqQFy4inhPVoeTuyeXJfG/Qhw==
X-Received: by 2002:a5d:668b:: with SMTP id l11mr4506831wru.89.1601041786616;
        Fri, 25 Sep 2020 06:49:46 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id c14sm2952825wrm.64.2020.09.25.06.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 06:49:45 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: fixes for v5.9-rc7
Date:   Fri, 25 Sep 2020 15:49:43 +0200
Message-Id: <20200925134943.12169-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Linus,

Here's another batch of fixes for this release cycle. Please pull.

The following changes since commit 5ad284ab3a01e2d6a89be2a8663ae76f4e617549:

  gpiolib: Fix line event handling in syscall compatible mode (2020-09-17 12:03:37 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.9-rc7

for you to fetch changes up to 3e640b1eec38e4c8eba160f26cba4f592e657f3d:

  gpio: aspeed: fix ast2600 bank properties (2020-09-24 15:37:18 +0200)

----------------------------------------------------------------
gpio: fixes for v5.9-rc7

- fix uninitialized variable in gpio-pca953x
- enable all 160 lines and fix interrupt configuration in gpio-aspeed-gpio
- fix ast2600 bank properties in gpio-aspeed

----------------------------------------------------------------
Jeremy Kerr (2):
      gpio/aspeed-sgpio: enable access to all 80 input & output sgpios
      gpio/aspeed-sgpio: don't enable all interrupts by default

Tao Ren (1):
      gpio: aspeed: fix ast2600 bank properties

Ye Li (1):
      gpio: pca953x: Fix uninitialized pending variable

 .../devicetree/bindings/gpio/sgpio-aspeed.txt      |   5 +-
 drivers/gpio/gpio-aspeed-sgpio.c                   | 134 +++++++++++++--------
 drivers/gpio/gpio-aspeed.c                         |   4 +-
 drivers/gpio/gpio-pca953x.c                        |   2 +-
 4 files changed, 93 insertions(+), 52 deletions(-)
