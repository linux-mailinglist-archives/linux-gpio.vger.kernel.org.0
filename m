Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2894BE19C
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Feb 2022 18:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344348AbiBUPlX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Feb 2022 10:41:23 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235639AbiBUPlW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Feb 2022 10:41:22 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D735220F0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Feb 2022 07:40:59 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id d28so21482wra.4
        for <linux-gpio@vger.kernel.org>; Mon, 21 Feb 2022 07:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UwlPYM85IMjWgj6bkGfPm2+nHJ1vu3EuY0EbX/m/8d8=;
        b=7KpjWW+4pLOp6TXv/hZZjMRQ87wyRc27GkerjY8DQDkdUrPnYTFkWcE3T95gNIBgtk
         1cKdoh1orqYp/MxxHYNtb59qwnIAc9znBXhl4M32hh5qSvnE0iZtY5OtZFFE0/HH8kvC
         Ntbu/3y8azAxFbfwtXExJT412pj1mD3LwIqWXiELGSYwTaX/3dM2r8Xg1o3y9XILZ6is
         0YtbuDhCCYHvfx3aggHmchpJlWRYEM4JTPDO7wzaNQDtqwwCLUfJBuvtb8++cQ60dhLd
         jahMS8RWzZk5DmOiFJucMGBF42H/dbqA9lenPAnsGDIKaVekLB9DrZzY2kqfsmRG7BuX
         yMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UwlPYM85IMjWgj6bkGfPm2+nHJ1vu3EuY0EbX/m/8d8=;
        b=PfJy160/Dplfe/lGcLfbaPehmDxkwHVCCyjPfj7xBggeevmIYDobW37+IIm3nqNZ64
         o5AQb9z4N2sgmjtDTQ+vPrVNKLqQiaFY1gK7YIRejUkJxncC0vL9kmg2z0IsMav+sCKK
         /kNk1rmIgEbZdtktivJmPu3nOvDltlH/4t442PYDrrMkhTCrEfY6FmcEBE9WsKRN2pQE
         D/uKdTCHMJb7ZAMMz1rUWbUEGTPPWVeYZpHz/GISaq7YqxMvt2ExEYdp32NdWtlo8WaJ
         YUoII9XPmELwFV/TjA9XG3KpCc0VFp29m25A8GopyNw2GTTKCW8hg7LGYTo0mm5LW/f1
         lqVA==
X-Gm-Message-State: AOAM530aWFxW0XRxop5dxOGOdEsxjacXuMk8CEJAqaHZmXuHhFHd4RrK
        D/F3yMLhQw/rrF6AvgJHjshGgA==
X-Google-Smtp-Source: ABdhPJx4ghL5/Wwqd9MFHVKqAwHTn+fUfC32mLNZ1An67qjJd460Xm7CWbGyJMU9Gcr9/LGKNYL3Tw==
X-Received: by 2002:a05:6000:188f:b0:1ea:80ef:c530 with SMTP id a15-20020a056000188f00b001ea80efc530mr71109wri.317.1645458057648;
        Mon, 21 Feb 2022 07:40:57 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id f18sm13770099wre.66.2022.02.21.07.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 07:40:57 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH v2 0/2] libgpiod v2: rewrite tests for the C library
Date:   Mon, 21 Feb 2022 16:40:53 +0100
Message-Id: <20220221154055.654819-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
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

This series contains a rework of the line_config interface and a bit patch
that replaces the old test suite for libgpiod v1 based on gpio-mockup with
a one covering around 95% of the libgpiod v2 code based on the upcoming
gpio-sim module.

v1 -> v2:
- drop applied patches
- improve documentation
- skip offsets that are overridden in line_config but not actually requested

Bartosz Golaszewski (2):
  line-config: expose the override logic to users
  tests: rewrite core C tests using libgpiosim

 configure.ac                 |    8 +-
 include/gpiod.h              |  509 ++++++++++------
 lib/line-config.c            |  752 ++++++++++++++---------
 tests/Makefile.am            |   20 +-
 tests/gpiod-test-helpers.c   |   49 ++
 tests/gpiod-test-helpers.h   |  139 +++++
 tests/gpiod-test-sim.c       |  303 ++++++++++
 tests/gpiod-test-sim.h       |   42 ++
 tests/gpiod-test.c           |  233 +-------
 tests/gpiod-test.h           |   81 +--
 tests/gpiosim/gpiosim.c      |    1 +
 tests/mockup/Makefile.am     |   11 -
 tests/mockup/gpio-mockup.c   |  496 ----------------
 tests/mockup/gpio-mockup.h   |   36 --
 tests/tests-chip.c           |  282 ++++-----
 tests/tests-edge-event.c     |  420 +++++++++++++
 tests/tests-event.c          |  908 ----------------------------
 tests/tests-info-event.c     |  301 ++++++++++
 tests/tests-line-config.c    |  448 ++++++++++++++
 tests/tests-line-info.c      |  316 ++++++++++
 tests/tests-line-request.c   |  468 +++++++++++++++
 tests/tests-line.c           | 1091 ----------------------------------
 tests/tests-misc.c           |   86 ++-
 tests/tests-request-config.c |   90 +++
 tools/gpioget.c              |    6 +-
 tools/gpiomon.c              |    6 +-
 tools/gpioset.c              |    9 +-
 27 files changed, 3630 insertions(+), 3481 deletions(-)
 create mode 100644 tests/gpiod-test-helpers.c
 create mode 100644 tests/gpiod-test-helpers.h
 create mode 100644 tests/gpiod-test-sim.c
 create mode 100644 tests/gpiod-test-sim.h
 delete mode 100644 tests/mockup/Makefile.am
 delete mode 100644 tests/mockup/gpio-mockup.c
 delete mode 100644 tests/mockup/gpio-mockup.h
 create mode 100644 tests/tests-edge-event.c
 delete mode 100644 tests/tests-event.c
 create mode 100644 tests/tests-info-event.c
 create mode 100644 tests/tests-line-config.c
 create mode 100644 tests/tests-line-info.c
 create mode 100644 tests/tests-line-request.c
 delete mode 100644 tests/tests-line.c
 create mode 100644 tests/tests-request-config.c

-- 
2.30.1

