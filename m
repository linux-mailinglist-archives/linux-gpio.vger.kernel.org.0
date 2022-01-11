Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9488748AE88
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 14:37:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240582AbiAKNh3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 08:37:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240572AbiAKNh3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jan 2022 08:37:29 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8E49C06173F
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 05:37:28 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id o3so32996178wrh.10
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 05:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lt97++RqSZgZNXyxd80eKpiBj5VXEKK71hWocgDFRqY=;
        b=3ttBJ121ZFNV9bywYvOLD+5BHnQXy8JY9SpExX+dF6JNdwWVWg2x5h7Gcyh1GAJYyA
         k2P9L2uddSFpoUfoz7l3Z+ujXt3A5rpnyvcTYlVQlGnoTLivhEYNLAkjbLasn7u1aZC3
         8QfGpmjiiurdq5x2aQziRc/VhOdLObmHypfoRW5X6eKmK+zTVWAFBOae9/lhqvi8OJLg
         QgudhNg6GqRjO8PQnCMDEdUkvgtuA8stLoVAILs88D+gh5JlBAnsvwJP1ZERDQAaSF//
         CGqLEDIUdrQ7jb9vjOVFqABzHhVf6ke6P4Gx/1sms4acesCP6n4RwaYt9yWib1pelsXm
         Ra5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lt97++RqSZgZNXyxd80eKpiBj5VXEKK71hWocgDFRqY=;
        b=my8FEMxSzHfYIERIZ42t5RZP3Zu1xvZ6F+vIgkLJ1XZ4Vpj/huiji/LzdjUVJrWnf0
         Ubg7qyzLFcKFwxw/5RiMHsdQ3ydpZc77LXaVq0B3QA2BuvxmRSRyc33ILYp5uo9ht9z5
         8j+q0XV9sBUXx544baouoh2zV/yredyZMpYSZKm2qhcFcPvOm1tmkzUGmn6EMobNpF+Q
         u4vVmuXfSGr2921LdvmfehcFi+i6wlE90OZ7ymNr7fUYbXePguNoejHC9kiEOv9mbrqt
         rooBpychWpcl1JTvpXK/1oBKoCpo5a+h+CoKMBg/PW0r2sXDcvL/plGVpzKIVqU4XpkY
         vP7A==
X-Gm-Message-State: AOAM533aqRTxh8XrALDkY3+lfTtGqZUfX58RSowjrgGXW9hK7ONjK0aj
        He6mfNxgVNIwaDYQmX3w1CHFnA==
X-Google-Smtp-Source: ABdhPJz0iqwAbhk8zwLbVEvqVDjUjnztPMYpBrGvgaWJ/KIcYeYk+9haSiVkVoqo91uJpv2O4JwVew==
X-Received: by 2002:a05:6000:188f:: with SMTP id a15mr3913086wri.153.1641908247371;
        Tue, 11 Jan 2022 05:37:27 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id f9sm1976186wry.115.2022.01.11.05.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 05:37:27 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] libgpiosim: new testing library
Date:   Tue, 11 Jan 2022 14:37:18 +0100
Message-Id: <20220111133720.713541-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds the library that talks to the new gpio-sim module. The module is
not yet in any linux release so we'll update the kernel requirements once
v5.17 is out.

The first patch adds the library and the second converts the C tests to using
it.

The plan is to use it to completely rewrite the tests for v2 so I don't
envision any more porting work for v1. Once we are on libgpiosim for all
test frameworks in v2, we'll remove all gpio-mockup code from the project.

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
 tests/gpiosim/gpiosim.c          | 1009 ++++++++++++++++++++++++++++++
 tests/gpiosim/gpiosim.h          |   64 ++
 9 files changed, 1365 insertions(+), 47 deletions(-)
 create mode 100644 tests/gpiosim/.gitignore
 create mode 100644 tests/gpiosim/Makefile.am
 create mode 100644 tests/gpiosim/gpiosim-selftest.c
 create mode 100644 tests/gpiosim/gpiosim.c
 create mode 100644 tests/gpiosim/gpiosim.h

-- 
2.30.1

