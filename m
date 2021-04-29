Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B287536E82B
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Apr 2021 11:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237694AbhD2Js1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Apr 2021 05:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbhD2Js1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Apr 2021 05:48:27 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E995C06138B
        for <linux-gpio@vger.kernel.org>; Thu, 29 Apr 2021 02:47:41 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id z6so4918657wrm.4
        for <linux-gpio@vger.kernel.org>; Thu, 29 Apr 2021 02:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gwn4BAWblm+H0n+mPt+a4QTxTKvNjNK+L18hOF3OETk=;
        b=aJKuo5/NEM2my0Y/QgOAw+3j8mCjdMnglZEURMxet1KyR9hFde6S0SfjNc8GBnQ52N
         oq2wOUvUD+8LFYnpk1F9psDUdnM2vT5AuMDpmAwvsAFjl/H8zNtvfWmAdoSlkOgYo0Xf
         g/8VYKohxEPzMuFLG2TQ7mG1eX1jZQSRL6/YDOkp9OlQO023hcYzdAr+5gaj5WMZxc3K
         boz+VmFsS/HsU/KLqpL/wO2i6lomneXm7Dldd32y8K4Ogg2kM+nfbRWlHpFpaaCQkrWI
         bgZ55S3H4S0ZIB3NoONAasCKGigVVraidRm4Qxs60K8lIcCl6Q3E48QphQ9Rk9cyWEhX
         fAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gwn4BAWblm+H0n+mPt+a4QTxTKvNjNK+L18hOF3OETk=;
        b=T7ljNMWeJIiBcg+2qgypMlvH7+f5D+tip2DCO3SDQWd2aCTzTtf9yMuz6Mit/klOAC
         5nQHuRbC1qS9lCnTMu7Hm2DplmUzgXcd03u87Qtf5200N6KrFxPNsStikCJRk09UIV37
         GB2Pge0UKtPxTEjWFlr/EQBuDzQwpi6Y7Xdqz0Gc/c2FcT2MHX9Tg7ZAKRR+HufDrhuI
         cDzhbqTP7lJD8CEQ2O0GOB8q0OCz8G+QYynfBkrOVDejZ7gbRNhKA8MrhwUyZZh9KewX
         NM59Ncd4laYONmxV1Xx6IozQgHQ9E6ozU93bUStP3J/mTpTEvhYGfbWZ94s1YHsw4vJ2
         /z3g==
X-Gm-Message-State: AOAM530LLGozgmhxt2Ke7lz4T49D0x6XZmRujas+9Ns4k+BikhNFyecE
        h4A7qwfdgRiVC+zeiME5SFwSelBigeMHbg==
X-Google-Smtp-Source: ABdhPJwQpS/0eGqfyJqspieodUJr7+QoSlvtnG5K/L/XPo57flPE+fEFMAB0LmBR+TU2bbQzmWbH9A==
X-Received: by 2002:a05:6000:12ca:: with SMTP id l10mr35811431wrx.145.1619689660035;
        Thu, 29 Apr 2021 02:47:40 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id j22sm4101247wra.46.2021.04.29.02.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 02:47:39 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][PATCH 0/3] tests: add support for the gpio-sim kernel module
Date:   Thu, 29 Apr 2021 11:47:31 +0200
Message-Id: <20210429094734.9585-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series implements user-space support for the gpio-sim kernel module
and ports the core C tests to using it. The goal is to entirely drop support
for gpio-mockup from libgpiod.

The new library is designed in a way that allows multiple test suites to run
at the same time as any process using the library only ever interacts with the
simulated chips it instantiated itself. The new kernel driver also doesn't
require the user to unload the module to change the chip setup.

The first patch removes leftover code. The second adds the new library and
the last one does the porting of the core code.

In the future - once v2 for language bindings is done, we'll port other
test-suites to the new library.

Bartosz Golaszewski (3):
  tests: remove gpiod_test_chip_num()
  libgpiosim: new library for controlling the gpio-sim module
  tests: port C tests to libgpiosim

 configure.ac                     |   5 +-
 tests/Makefile.am                |   6 +-
 tests/gpiod-test.c               | 134 ++++--
 tests/gpiod-test.h               |   3 +-
 tests/gpiosim/.gitignore         |   4 +
 tests/gpiosim/Makefile.am        |  16 +
 tests/gpiosim/gpiosim-selftest.c | 103 +++++
 tests/gpiosim/gpiosim.c          | 743 +++++++++++++++++++++++++++++++
 tests/gpiosim/gpiosim.h          |  42 ++
 9 files changed, 1012 insertions(+), 44 deletions(-)
 create mode 100644 tests/gpiosim/.gitignore
 create mode 100644 tests/gpiosim/Makefile.am
 create mode 100644 tests/gpiosim/gpiosim-selftest.c
 create mode 100644 tests/gpiosim/gpiosim.c
 create mode 100644 tests/gpiosim/gpiosim.h

-- 
2.30.1

