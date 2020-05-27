Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85F391E3DB2
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 11:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgE0JjD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 05:39:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbgE0JjD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 May 2020 05:39:03 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE30C061A0F
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 02:39:01 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id x6so9701487wrm.13
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 02:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HuTzUQHBjzdBav/SqyDAlnPVVzvxtNWxsYv38ESVl/g=;
        b=u2pE53DJyq4YjjqU+rf4tUX1iZYLctgFpSXN848IKwnr+KC2MjzXGQzqZ02UI6oqkA
         3AXy8qIkSLuLgjcRxlQ84ehiCy/ctGlD1+s77fvNUHgZNb6qn4SwLWAVHm567+VyT+h7
         bwsM/UMK5wJkAkLUoHPDB0LF+0MCE8y2CzJxomuQ+QG/jiYkYDna6IGVN1HWzfjtnjwz
         UO43o1Xyh1Of524esC2Rd/3R8TK0a4ex/bUnMELC8tYIsPn2qmu9ls9EpvhamNesgYvX
         xsSLDH99T1mJAQlYiq52JVUpt/27wMyaVxjBKgbauQwD9TspaH0O84flbk5VMwVtJLap
         YGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HuTzUQHBjzdBav/SqyDAlnPVVzvxtNWxsYv38ESVl/g=;
        b=lp95xoyS/4pPxHtycJQIKQj5Zk3aduEdxH4RvtkHvV0Ff/jtjdnBVbJFA3QvrJ5nSS
         nCSg/PG9G2n4rNDqsoS5RQb64KlNd5smOzvcbSxp/ITDnWKxquThsr8jjNncSuQSe2fh
         QxuM7bhnzPUN/eJ/2SkzI2qHGyzpK6W1ens5N4HWIPLKeL7sMImbcdQmDvAQR85hQyw1
         +fQXQ7ZldJwyBg3SMVCkWbYhFMUJPS6T+GkN3icDv8l0eb0fw/fkmbHoDZtxfd3iIO0Y
         bniNKsyxG5HJcyx8YZkv/MspY6Opr06kLzVztcMMCmhurMAgNHDpPTatK/9Y/ySudbtQ
         huIA==
X-Gm-Message-State: AOAM533S3rPzAFipHpY/ivcAtznJXOszKgyk1BQA10GMivnyo/TcWn+A
        Ms6LBlHG0yoEo7G1jYzu5Mkjfw==
X-Google-Smtp-Source: ABdhPJxsjct/WnTXKksP9VnskcL17cgYExNQGs2rVTGxg86ljSTPYmEyIkC77UZllKFI2U5Vl4JQeA==
X-Received: by 2002:a5d:5492:: with SMTP id h18mr23468247wrv.330.1590572339994;
        Wed, 27 May 2020 02:38:59 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id w10sm2340198wrp.16.2020.05.27.02.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 02:38:59 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: fixes for v5.7
Date:   Wed, 27 May 2020 11:38:55 +0200
Message-Id: <20200527093855.31024-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Linus,

This is the last batch for fixes I'm sending your way in this release
cycle. Please pull.

Bartosz

The following changes since commit e75dfba311f478f1c2bf928284e1949c20594336:

  Merge tag 'gpio-fixes-for-v5.7-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into fixes (2020-05-18 09:40:50 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v5.7

for you to fetch changes up to 98f7d1b15e87c84488b30ecc4ec753b0690b9dbf:

  gpio: bcm-kona: Fix return value of bcm_kona_gpio_probe() (2020-05-25 11:17:18 +0200)

----------------------------------------------------------------
gpio fixes for v5.7

- fix mutex and spinlock ordering in gpio-mlxbf2
- fix the return value checks on devm_platform_ioremap_resource in
  gpio-pxa and gpio-bcm-kona

----------------------------------------------------------------
Axel Lin (1):
      gpio: mlxbf2: Fix sleeping while holding spinlock

Tiezhu Yang (2):
      gpio: pxa: Fix return value of pxa_gpio_probe()
      gpio: bcm-kona: Fix return value of bcm_kona_gpio_probe()

 drivers/gpio/gpio-bcm-kona.c | 2 +-
 drivers/gpio/gpio-mlxbf2.c   | 6 +++---
 drivers/gpio/gpio-pxa.c      | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
