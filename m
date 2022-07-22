Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C033757E3CF
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jul 2022 17:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbiGVPdv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jul 2022 11:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232331AbiGVPdu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jul 2022 11:33:50 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B43556758F
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jul 2022 08:33:48 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id bv24so7001057wrb.3
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jul 2022 08:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IbHv1ilHVAOjIbmK59r3a9pxoIQSMjUu48FCOhQ1ewo=;
        b=2D9K15O6AoQkwR7KGyFE/D8/n0fAeTgDR1hAIOed7PSfXtblS1VvfS3xqzShOQQaNR
         l4xEec766GtTTGTLzNId0ImFMm60Vf9Iz+FGXsa8LebTW1yFE+5UbindLMnF2zea9+Ad
         K8D/CuA/km7+VoIawiklt/CCB0ts8xzl/24SK9zJVWktOeTc9uVqqhhh5lv6ytX/ZPah
         v2UW9qBdaudzKhA+NhXzN+JdG8mg1E2hlFNdv7L1DnLznWHgd2ljJFH0IzaGy5Z1zR94
         g+oVySnS/1+yZq2cn6wpqJvIq4t3dTrCKhdLkx/rwicoG/VlU3Qltz1dX1Z3hNyIB7wH
         y4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IbHv1ilHVAOjIbmK59r3a9pxoIQSMjUu48FCOhQ1ewo=;
        b=u6jq0CNfBdNCN3WL1nxpNdFSsBePPUGyglpSc1Gmf1/6+96pKWW7vrIHd2LqpSJjq3
         j7gO4KFCR0hqe2eJpXkFYSEK4t2FYnubbW8EDkDxPgZR8zc7RnU6A08XD0pbDba9Iwmv
         1cgJn/wuOOkILeHW+oS7oalGyB3p1rLQ0qf+j4FpxnwDjz7zHuxawZlPN+3LbTbqNpTM
         FxIGdhVKXYj0O4ocvPA/R0mqzHJD7ldgXLjpzi4KWE0dDZd6amGUC3A8R6fi5Xd9xI5D
         or0TMtdTshWt+wCAj34zJkbtvdFIF2qVXHMP9x/1WXM0PkmKF8tBNNPLUoShtZPhPlFU
         8E9w==
X-Gm-Message-State: AJIora+saWZJlRaUeSyScow3QobD7QCKSF/9a2NqKlUHx1nAKY8D5UCY
        hnqRvygzpa/uaf0FB6Zh348DcKaeOyHpuA==
X-Google-Smtp-Source: AGRyM1vH0uHaF6qZmsswXb00Adkp+77isec24O4sHNHbQMpkDA6oVgFobfiPSyLqpyn0cI9tRaXP/g==
X-Received: by 2002:a5d:638e:0:b0:21d:68bc:17c8 with SMTP id p14-20020a5d638e000000b0021d68bc17c8mr324423wru.467.1658504026741;
        Fri, 22 Jul 2022 08:33:46 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fb61:1204:cd3d:b6b6])
        by smtp.gmail.com with ESMTPSA id y18-20020a056000109200b0021e61cd711bsm1781655wrw.100.2022.07.22.08.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 08:33:46 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] gpio: fixes for v5.19-rc8
Date:   Fri, 22 Jul 2022 17:33:44 +0200
Message-Id: <20220722153344.151561-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus,

Please pull the following set of fixes for the upcoming rc.

Thanks!
Bartosz Golaszewski

The following changes since commit ff6992735ade75aae3e35d16b17da1008d753d28:

  Linux 5.19-rc7 (2022-07-17 13:30:22 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.19-rc8

for you to fetch changes up to 32c094a09d5829ad9b02cdf667569aefa8de0ea6:

  gpio: gpio-xilinx: Fix integer overflow (2022-07-22 09:17:03 +0200)

----------------------------------------------------------------
gpio fixes for v5.19-rc8

- fix several regmap usage issues in gpio-pca953x
- fix out-of-tree build for GPIO selftests
- fix integer overflow in gpio-xilinx

----------------------------------------------------------------
Haibo Chen (3):
      gpio: pca953x: only use single read/write for No AI mode
      gpio: pca953x: use the correct range when do regmap sync
      gpio: pca953x: use the correct register address when regcache sync during init

Kent Gibson (1):
      selftests: gpio: fix include path to kernel headers for out of tree builds

Srinivas Neeli (1):
      gpio: gpio-xilinx: Fix integer overflow

 drivers/gpio/gpio-pca953x.c           | 22 ++++++++++++++--------
 drivers/gpio/gpio-xilinx.c            |  2 +-
 tools/testing/selftests/gpio/Makefile |  2 +-
 3 files changed, 16 insertions(+), 10 deletions(-)
