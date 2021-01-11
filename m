Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E45EC2F1514
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 14:35:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732093AbhAKNfN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 08:35:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731259AbhAKNfL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2021 08:35:11 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 322E6C061786
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 05:34:31 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id y17so16423177wrr.10
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 05:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7t04GSheOQRVVcWG8j8bszkBKGmuW9GgLM9ZzWToJtQ=;
        b=kU2GLLLWA/Onhu5+ZM+h7CjAWv4doxg60fgLsMjB1Uvj99xmx5xfdq0IEd9d03hpDW
         SrBL/hM6su34OZ8OYU64sir10YpVR9VbR5a8F4NbY1yVUdgss32YnNK45B05I8xuwYaz
         ypYpnND7GCn+OXih02iTIfiMb1uQAIrf0z6NBCqeOn/UXY0Ya2FYGWXqEqlJkUSekKMY
         VtSunWm4eKxaeB3QOTGcdYoHQp448eHhd5CJdvmMkMyC7QugzGpOLGIpV7vJZRbKkx0D
         yLTUVsbmXNdvqv+yLLUs8nGJPySgbmQq1KTWFWSq9kshkbljwrhMsDUQ4WYh7HPxhOft
         yKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7t04GSheOQRVVcWG8j8bszkBKGmuW9GgLM9ZzWToJtQ=;
        b=kENGC5csz/bahZxCUFOl5s9kQ9+h7clFuVJX1XpJxvZ43WE5RQkLsiaCUN0RFhCc9Q
         9897rT1pYtFff078dBGqtvMK8cRUsRV9Cf2o6SQ/8jlhKewXd718Ooh8WQcInxp5xcWW
         YvmU5x7QQtlIdyC/Lmsx5bsqkTTwxQUzXtlO50YnZfMLXZgXDCEyFQn5pYgB1PYCpbIr
         nqB+D0kFEHeqgCb/RKL5q6lxpLE+UtqlRbasZnyPkZAz/0FFVJbxmEzJmaSpL939TKHo
         E9lJi+/0snhmTOLc/yrp1OrHudSmUX/2mo8quWSQSIfHsVlbKzYLkBP5XRQZchW/dDxd
         RtLA==
X-Gm-Message-State: AOAM531gY9fYz1uXLwfcuHNlxCixEN6OsVerX5A9zaBdIS2ewckLNCfF
        AdJKvLO8vMQy/dbG1I2PySeybg==
X-Google-Smtp-Source: ABdhPJxtv4KXLEbVBE+A3naBUw+pHH7EHlgrCcJOAa8NZr9vUvtP/rJwv1iHyoeIP9unz8YdL6Z9eQ==
X-Received: by 2002:adf:f58a:: with SMTP id f10mr17049958wro.338.1610372070002;
        Mon, 11 Jan 2021 05:34:30 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id m11sm21456741wmi.16.2021.01.11.05.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 05:34:29 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 0/6] treewide: remove more cruft and 
Date:   Mon, 11 Jan 2021 14:34:20 +0100
Message-Id: <20210111133426.22040-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This is another batch of improvements to libgpiod before we overhaul the
data structure model.

The last patch adds the kernel uapi header to the repository so that we
no longer depend on its presence on the host system.

Bartosz Golaszewski (6):
  treewide: remove helpers for opening chips by name & number
  treewide: simplify the active-low line property
  treewide: rename BIAS_AS_IS to BIAS_NONE
  treewide: make drive settings an enum
  bindings: cxx: line: reorder bias mapping entries
  core: add the kernel uapi header to the repository

 bindings/cxx/chip.cpp                  |  41 +-
 bindings/cxx/examples/gpioinfocxx.cpp  |   3 +-
 bindings/cxx/gpiod.hpp                 |  57 +--
 bindings/cxx/line.cpp                  |  28 +-
 bindings/cxx/tests/tests-chip.cpp      |  97 +----
 bindings/cxx/tests/tests-event.cpp     |  14 +-
 bindings/cxx/tests/tests-iter.cpp      |   2 +-
 bindings/cxx/tests/tests-line.cpp      |  93 ++---
 bindings/python/examples/gpioinfo.py   |   4 +-
 bindings/python/gpiodmodule.c          | 167 +++-----
 bindings/python/tests/gpiod_py_test.py | 173 ++++----
 configure.ac                           |  12 +-
 include/gpiod.h                        |  65 +--
 lib/Makefile.am                        |   2 +-
 lib/core.c                             |  29 +-
 lib/helpers.c                          |  57 ---
 lib/uapi/gpio.h                        | 522 +++++++++++++++++++++++++
 tests/tests-chip.c                     |  41 --
 tests/tests-line.c                     | 100 ++---
 tools/gpiodetect.c                     |   2 +-
 tools/gpiofind.c                       |   2 +-
 tools/gpioget.c                        |   2 +-
 tools/gpioinfo.c                       |  28 +-
 tools/gpiomon.c                        |   2 +-
 tools/gpioset.c                        |   2 +-
 tools/tools-common.c                   |  57 +++
 tools/tools-common.h                   |   3 +
 27 files changed, 903 insertions(+), 702 deletions(-)
 create mode 100644 lib/uapi/gpio.h

-- 
2.29.1

