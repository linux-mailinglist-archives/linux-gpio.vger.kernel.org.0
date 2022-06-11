Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C993C547781
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jun 2022 22:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbiFKU1j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Jun 2022 16:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231324AbiFKU1i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Jun 2022 16:27:38 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B3576A430
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jun 2022 13:27:36 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id r123-20020a1c2b81000000b0039c1439c33cso1188795wmr.5
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jun 2022 13:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nFNaxUZNCpwtJNNLY7AYmusKJ3kJUrDC+YV49C9O30c=;
        b=xapK7w9Mp0+G8h+Q+vNaAd2AWR7BcAEpYzR8DL/+kEsxbCaf85qQyDgYBgZNCyeblC
         S6XerCCZxg906asAmR3Fh9b2tzqOs/RBiEvevcBmWPiRAbqT02hfODBBQBi3ESm+pVRK
         e1tLhsj1dUJHhRox9XtJXh3zlAY+pZfgEytKHCaNdsS7Zzlxr7JCtNQR7J+ABSv21R19
         pBReugPHq6gGG9MT8IZzsET7UZY8m4mkqq+PU9mMJMfmICwyjj7S5bU8eD10l6znkA85
         fZ4cyxy6Da6jdFJKp1KXcejnoDYR510PkphvLeQmhkn5OA5drmjkFJ4/YpAfMcnVDl0j
         Z+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nFNaxUZNCpwtJNNLY7AYmusKJ3kJUrDC+YV49C9O30c=;
        b=5gSaqDUaj9hYcou6N/BlTFWqi7gUDCJe3MqhVfJtsnFZPlA1s4ZokQYtUggMOF6HPv
         R8BiMI6CzdOllqAjdCY8KCVsJJMicsFEQTrn+Z11zWSdL5JyJtzaJYYWpF2pdXOwruXN
         6mb8X+Hawrl+atX6l+G/+6UtcB6wycmFG4ln1qsMTz1ZrdzK403siFt+CWF/9SafkBGq
         /3rtoXEl1UqZSZKiZSpGSuNsKzliSgqowB1JmviIfHCRXdxE17zk8QELyyzWyPuyweWc
         OCojg8YuDRQPyKrRuKBzT6qI1pUHuJpotGY+PiALC2E/YQ1n2D8TuC8UQ0VlElhNIuh6
         /LFA==
X-Gm-Message-State: AOAM532eLeVobs3ea7jL2xWR121MRSqawuGWJwdtXnX7OQmygFtUhLkE
        LjFL0YkejqvBL0U8zDzYvLs3OgPRhGpBzg==
X-Google-Smtp-Source: ABdhPJzdHDOInnFkPrwicvPSpk+IUUMH8dbzNdVQe+zzy7teM4yj2g7KQMQBM3gU+9RioHq3G08ENw==
X-Received: by 2002:a7b:c341:0:b0:37b:ed90:7dad with SMTP id l1-20020a7bc341000000b0037bed907dadmr6234923wmj.138.1654979255002;
        Sat, 11 Jun 2022 13:27:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f2fe:1d3f:7d24:f28f])
        by smtp.gmail.com with ESMTPSA id z18-20020a05600c0a1200b003973435c517sm3629501wmp.0.2022.06.11.13.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jun 2022 13:27:34 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] gpio: fixes for v5.19-rc2
Date:   Sat, 11 Jun 2022 22:27:32 +0200
Message-Id: <20220611202732.6602-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus,

Here's a set of fixes for the upcoming rc. Most address the new warning we
emit at build time when irq chips are not immutable with some additional
tweaks to gpio-crystalcove from Andy and a small tweak to gpio-dwapd.

Please pull!
Bartosz Golaszewski

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.19-rc2

for you to fetch changes up to 77006f6edc0e0f58617eb25e53731f78641e820d:

  gpio: dwapb: Don't print error on -EPROBE_DEFER (2022-06-10 14:26:15 +0200)

----------------------------------------------------------------
gpio fixes for v5.19-rc2

- make irq_chip structs immutable in several Diolan and intel drivers to
  get rid of the new warning we emit when fiddling with irq chips
- don't print error messages on probe deferral in gpio-dwapb

----------------------------------------------------------------
Andy Shevchenko (7):
      gpio: crystalcove: make irq_chip immutable
      gpio: crystalcove: Use specific type and API for IRQ number
      gpio: crystalcove: Join function declarations and long lines
      gpio: wcove: make irq_chip immutable
      gpio: merrifield: make irq_chip immutable
      gpio: sch: make irq_chip immutable
      gpio: dln2: make irq_chip immutable

Bartosz Golaszewski (1):
      Merge tag 'intel-gpio-v5.19-2' of gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-current

Serge Semin (1):
      gpio: dwapb: Don't print error on -EPROBE_DEFER

 drivers/gpio/gpio-crystalcove.c | 70 ++++++++++++++++++++++-------------------
 drivers/gpio/gpio-dln2.c        | 23 ++++++++------
 drivers/gpio/gpio-dwapb.c       |  7 ++---
 drivers/gpio/gpio-merrifield.c  | 22 ++++++++-----
 drivers/gpio/gpio-sch.c         | 35 +++++++++++++--------
 drivers/gpio/gpio-wcove.c       | 10 ++++--
 6 files changed, 99 insertions(+), 68 deletions(-)
