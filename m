Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6A5E124973
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 15:25:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbfLROZB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 09:25:01 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54241 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbfLROZA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 09:25:00 -0500
Received: by mail-wm1-f65.google.com with SMTP id m24so2032676wmc.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Dec 2019 06:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nn/KRQfGAOpLMIozgAkS2/UpT2LQKqzYyFnIUYqjdc8=;
        b=PbfrBKd7sk9jBy/VZfBGda7e0Ya/uc2qye9uZ6reXavLIvkJZsL0c0fBVYvb/fYaU+
         Z1rg0BV/imcaTobRWfopvly992mCM8lBvzu4VfZ3AhC6Xzdt89X6ZTRq0P9vfci7w3jD
         51rV+7mTtgVQHvCBV2Y4anxsAQ4p5ADldJW822ArxwfH2LvvsU/izUNsvD/J72y5pWlj
         cNPNhzatgjMpw6cIx4ieqH60n2HIZX5MvvL1GeKt+84Ya6sHH1mDCfxkrytdtDuBdoZV
         m6mdbu+3g0RcBPpRvR/9JH81yWCG+8YiVIXxG4SpkRPoPB8YzbQiN76DaQthIn78WUp5
         W1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nn/KRQfGAOpLMIozgAkS2/UpT2LQKqzYyFnIUYqjdc8=;
        b=avAYNUOXyXU7kuFYbEbQZEOeLZz4ctrSLcrvCM4f2e2K44lXiYTlwCIi4r1dez9zHv
         F9O6vbzMkqG9RzA00qr3gmf1hHM1c2+4ptKTQjzVbav3u1jnEzWEuHqOLKXLMSMbRMsa
         Yuwj6+dhGq64naSed9/owYSZ/Fk1oQZhCbldPBqLG+3jGNDgdArV02c5UVo81xnFQ0Og
         X5fHqmxG0cdwFWV8W5Hpe6KHZCO7nxJQsNDiGA7nMa9hanIfwZmFbO+hpVqwdIejHHaS
         cCSf0xwowKZLEhpygxZYzsusFyihJIiy/ZHxLA0ulqjemrF/qZpYxSVSNvvXfkOdL19B
         UIxA==
X-Gm-Message-State: APjAAAWFyyL1RFkVYWZ19Xp1gphdsEv+tSuq3CR3XJoo0P0F8VU7uz1Z
        qEjhZhouhb7NU5Ub/NjwLQMliA==
X-Google-Smtp-Source: APXvYqwszVHo6nOMtIewbPrWCdR1DqzwDIGQNIivQBNDUYmC62l7fg2aYmk4Pjt7PiWlt8XyemZZHw==
X-Received: by 2002:a1c:1fc5:: with SMTP id f188mr3808523wmf.55.1576679098584;
        Wed, 18 Dec 2019 06:24:58 -0800 (PST)
Received: from debian-brgl.home (amontpellier-652-1-53-230.w109-210.abo.wanadoo.fr. [109.210.44.230])
        by smtp.gmail.com with ESMTPSA id x11sm2889981wre.68.2019.12.18.06.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 06:24:58 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 0/7] teach libgpiod to read multiple line events at once
Date:   Wed, 18 Dec 2019 15:24:42 +0100
Message-Id: <20191218142449.10957-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

In v2 of my series adding the line status watch I introduced a regression
that made it impossible to read more than one event at the same time. This
is because I use libgpiod for testing and it doesn't allow to read more
than one event from user-space.

This series adds this missing functionality so that we can test v3 and avoid
this problem.

Bartosz Golaszewski (7):
  core: use gpiod_line_event_get_fd() in gpiod_line_event_read()
  core: provide functions for reading multiple line events at once
  tests: event: extend test coverage for reading multiple line events at
    once
  bindings: cxx: provide a method for reading multiple line events
  bindings: cxx: tests: add a test-case for reading multiple line events
  bindings: python: add a method for reading multiple line events
  bindings: python: tests: add a test-case for reading multiple line
    events

 bindings/cxx/gpiod.hpp                 |  7 +++
 bindings/cxx/line.cpp                  | 45 +++++++++++---
 bindings/cxx/tests/tests-event.cpp     | 31 ++++++++++
 bindings/python/gpiodmodule.c          | 57 ++++++++++++++++++
 bindings/python/tests/gpiod_py_test.py | 22 +++++++
 include/gpiod.h                        | 25 ++++++++
 lib/core.c                             | 68 ++++++++++++++++-----
 tests/tests-event.c                    | 83 ++++++++++++++++++++++++++
 8 files changed, 314 insertions(+), 24 deletions(-)

-- 
2.23.0

