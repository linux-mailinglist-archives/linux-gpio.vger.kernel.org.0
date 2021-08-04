Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 642423E028D
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Aug 2021 15:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbhHDN7k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Aug 2021 09:59:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238053AbhHDN7j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Aug 2021 09:59:39 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0086C061798
        for <linux-gpio@vger.kernel.org>; Wed,  4 Aug 2021 06:59:25 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id l18so2377997wrv.5
        for <linux-gpio@vger.kernel.org>; Wed, 04 Aug 2021 06:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C8AVWyR2/nU5NIf312f2J5aD2AcP4YWEdaMMUYDNvZQ=;
        b=0DzaXrDnbqZ/EIwUGa4zxn1I2cVvf1w4L1g2rlLfhCHtVWcASETR7t4UQiJyhQh0Op
         WT18dAxniDN002X7En7j36OymTUdH51EVypI9Hz4R/g9LXiMA3XdqeXH4M78qOsNvaRU
         3l3xGfuCIoYbdVclBsxsBB7/D5iE/X9HtYSScjTbqGzGr1PCsh8SwFXIplu1NQ6nEtAK
         nEZkgmxIeUOEcLlcbcbqjuLKdUwcxtl2BEOab1Du4NneowbFUG4hp3BNqwtnNH1+HLpH
         rt+gZbbRYRF1eh95SQN11MfZ/3lah3jAUIvdsEgsAUN2yrTHk0laNlihVS2pRxVfg/eq
         wgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C8AVWyR2/nU5NIf312f2J5aD2AcP4YWEdaMMUYDNvZQ=;
        b=MRDDRrk8fzMpkA0+WCEUSiS7poOQBuUSWtrByFH2gJXdewFER3iv1tfVQ8VzbrYiI2
         Vsnan+mzBoaPNCBwd8s9dkpBzN7w85sbzvbHZ+z0FDsxJfIE/FlXL2ULKNJmXmUBfCF+
         CBMt0DygBryxFblVBF2Z75VZGYgOrCopJCCOCSZ4VNGEIx/zv3SfxlSqGD01x3G1sVx9
         W2Gncx8mUEmBSHBpj43mr+vt+PO8NuCUhUKTGpHVLlwUobeQrLRMK+3ErVY/8CAUzx4P
         JwU/2968q/obAkPGpMhY8+BRW/AMnmEAc9b93jP34sm80YgukwsksvnQUv0uL78HObcP
         mBLw==
X-Gm-Message-State: AOAM531do0412HerOI9ROtsbiKpuSbYIYOQqjNJ7MvvnIk/MGBFJLzrH
        S57RgF4uxhzjR1XCOdbJO+XFxA==
X-Google-Smtp-Source: ABdhPJwhH+IrL5qDPqg0/PiBZf7SiY9LChCd5dJcrcOKywNuI+ir6xENLzMaG2fRYlW5Ab67k9FwWw==
X-Received: by 2002:a5d:63cf:: with SMTP id c15mr28949764wrw.230.1628085564164;
        Wed, 04 Aug 2021 06:59:24 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id g16sm3071637wro.63.2021.08.04.06.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 06:59:23 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] gpio: fixes for v5.14-rc5
Date:   Wed,  4 Aug 2021 15:59:22 +0200
Message-Id: <20210804135922.13050-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus,

Please pull the following GPIO fixes for the next rc.

Thanks!
Bartosz

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.14-rc5

for you to fetch changes up to 9b87f43537acfa24b95c236beba0f45901356eb2:

  gpio: tqmx86: really make IRQ optional (2021-08-02 17:17:27 +0200)

----------------------------------------------------------------
gpio fixes for v5.14-rc5

- revert a patch intruducing breakage in interrupt handling in gpio-mpc8xxx
- correctly handle missing IRQs in gpio-tqmx86 by really making them optional

----------------------------------------------------------------
Matthias Schiffer (1):
      gpio: tqmx86: really make IRQ optional

Rasmus Villemoes (1):
      Revert "gpio: mpc8xxx: change the gpio interrupt flags."

 drivers/gpio/gpio-mpc8xxx.c | 2 +-
 drivers/gpio/gpio-tqmx86.c  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
