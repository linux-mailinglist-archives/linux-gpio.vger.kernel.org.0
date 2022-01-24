Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34D3F49849D
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jan 2022 17:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243676AbiAXQYM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jan 2022 11:24:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243273AbiAXQYK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jan 2022 11:24:10 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 035D5C06173B
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jan 2022 08:24:10 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id l12-20020a7bc34c000000b003467c58cbdfso34601530wmj.2
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jan 2022 08:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1vOgEFd58mdyDRf/HwezA0vMBaBiDKTl45QD7sB5Hkc=;
        b=begChpZm/uCSNXvRfz6ysZQghy6ZysJ4dCAu0hu2wXZQnfovApR6QIspTga1Hwejeh
         rIXCdgim8Yt49reYcnIixYsaAtKKKGEts78y9J74cPDoZXCEnkME6spOYAOh5UNEzCn1
         67AgHFq+nhAJgpS78D4uigxPrLGaPMDaDoctwYXZNzOy8YyWm/c7P3nA3mnNIpVCJ9lx
         M6mzbq92XhPXuhO2p9qPYuGE5SUEutdjzxln39LNSfKIa3cnA9hl62MXnBmClCljKw1x
         jwJXhN97pmmXymlKAY7u2YombttmIPuNzMyfqgrl8gBGo5fvRpXy4pL7JZW6ZAOEhQ7d
         uc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1vOgEFd58mdyDRf/HwezA0vMBaBiDKTl45QD7sB5Hkc=;
        b=LG+0Vwedrtuve8HSaPsLifHhGhNDciLPlf4WDO0SVkfP8qaBbOK1aQ2nrhzNauoDOh
         MeRXpRdTGQ//z7DZvduQPiysZwn+XI187LPJ02Iwu0TjkmiBa3G1m5QxrAzBbZof+Mit
         g2bWdwAK9b593xHH+GjKYmmTNkegnX5b8677X47MhwJF4/gbH4IOVY2U7RlfeB7e9M8A
         BTsFDOoF9eLeboEFw/IPXCBWYds1N9b/hPKuNwfWM1DSSOGQGiMEYPlItfPL7eN9yTbz
         XnCBU86hwSQqkiqaQujtjHiaYTCLFsOunArwcQmvMXzDFKI7oVzBtYVsrz6CXd7fWEY5
         TQIA==
X-Gm-Message-State: AOAM533yFXzj8+v6Yglg2/NyX2XpZZwwTa46eebYOjZK1NMF0yqN7W5O
        GJS6H9VoJoQSj+E+rGMRr58CJw==
X-Google-Smtp-Source: ABdhPJyowkN5wqaSmJiqdYUVtvZcC8bp9IC5D7kCPasDxrk5rFMr7hhVmT/vtBc+i9qgJF4l4QTNeA==
X-Received: by 2002:a05:600c:4fcb:: with SMTP id o11mr750654wmq.152.1643041448581;
        Mon, 24 Jan 2022 08:24:08 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id j15sm2661784wmq.19.2022.01.24.08.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 08:24:08 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][PATCH v2 0/2] libgpiosim: new testing library
Date:   Mon, 24 Jan 2022 17:24:04 +0100
Message-Id: <20220124162406.140961-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I'm resending this with some improvements resulting from actual test writing
with this library + with the right label this time.

This adds the library that talks to the new gpio-sim module. The module is
not yet in any linux release so we'll update the kernel requirements once
v5.17 is out.

The first patch adds the library and the second converts the C tests to using
it.

The plan is to use it to completely rewrite the tests for v2 so I don't
envision any more porting work for v1. Once we are on libgpiosim for all
test frameworks in v2, we'll remove all gpio-mockup code from the project.

v1 -> v2:
- add new functions allowing to retrieve the parent dev of a bank and the
  parent context from a device
- add a function allowing to check if a device is live
- fix writing to configfs and sysfs attributes

Bartosz Golaszewski (2):
  libgpiosim: new library for controlling the gpio-sim module
  tests: port C tests to libgpiosim

 configure.ac                     |    7 +-
 tests/Makefile.am                |    8 +-
 tests/gpiod-test.c               |  143 +++--
 tests/gpiod-test.h               |    4 +-
 tests/gpiosim/.gitignore         |    4 +
 tests/gpiosim/Makefile.am        |   16 +
 tests/gpiosim/gpiosim-selftest.c |  157 +++++
 tests/gpiosim/gpiosim.c          | 1030 ++++++++++++++++++++++++++++++
 tests/gpiosim/gpiosim.h          |   69 ++
 9 files changed, 1391 insertions(+), 47 deletions(-)
 create mode 100644 tests/gpiosim/.gitignore
 create mode 100644 tests/gpiosim/Makefile.am
 create mode 100644 tests/gpiosim/gpiosim-selftest.c
 create mode 100644 tests/gpiosim/gpiosim.c
 create mode 100644 tests/gpiosim/gpiosim.h

-- 
2.30.1

