Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE9275B188
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 16:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbjGTOsC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 10:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbjGTOsB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 10:48:01 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE9DAE60
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 07:47:59 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3143ccb0f75so782093f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 07:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689864478; x=1690469278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ui9LYJV8T/mE3zJIZwY/fa2UvJiexI4yY+mIR8shHik=;
        b=qRoOHle7wVcVnrSZs7ocwozJOpSA3NrTbUHne2ILh7Hruaik3DX/NhTMOusAOWhNZO
         1p1T/TNnvjGPo6ic/bOYQj1mlaky2T4yB9i7gaVPdQprLUusZACn57CjRYio/0jSgpCB
         Zssu4Jl5A4Tbr7Y/rPRSU7EpHimU4G+mkew4UyU7th9W3qGraTVNyFAWUnezqTfjykgl
         /6ws0M7W/FEIXNa1kd6YgD5PN7R4NyOHhYyKH9dFdeRozYRBfuCrTN6P1uYzJDTJ2bZw
         O9HJzXYOu3Y4K8hr1cbonWbqWILIZUkL8cytUlnDbBRplRXTRvszie0+CHhJbriMnz5M
         oVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689864478; x=1690469278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ui9LYJV8T/mE3zJIZwY/fa2UvJiexI4yY+mIR8shHik=;
        b=gSOSWuioXv1o0eRq4wRxraq3gzOXkfQUAEzNMq6WO6Vmf60P4JB0roOup96+nr8+ai
         rc4DNdWoB5XhMKpq2atj1r2eQHnq22FqrXpFL/DzqlPj9PRiHtRGp0h/QYTAkm5bbTLY
         pGiND+bcKDFOnPNo66J91lMXYTQFysPT6XpC8TREJF9MP7Nc0KUd91U6Ny2f1NRtcC6D
         SKF1QdsFN0CnqL8So/1oWtciH8StVfUXwEdLqKXZnsZPwVHvh0B544yc2ZTnioz96/ZA
         AwcqxhAGmeVZp1p2SsXm9PHfZqjZPN9pMO0TuaLBR+UO8nSDVnjpQEPk/WT17KrIDma/
         10Mg==
X-Gm-Message-State: ABy/qLazSBoOy4QnPzfEPWAhtgVA0TO+gVaPPndf2bWP0EDA0onXhFJe
        k6bt/UrDGQrO4cpUHql/nE8nV4GY+BnfHrKHTy4=
X-Google-Smtp-Source: APBJJlGkUwgLMxO0SX9Y1CrJWNnGohX2xp3IpYlTSp4yXNkhct8sgxjnK/mTSTtZ8oFIK7vuz3UOgQ==
X-Received: by 2002:adf:e749:0:b0:314:77a:c2b9 with SMTP id c9-20020adfe749000000b00314077ac2b9mr2569608wrn.39.1689864478346;
        Thu, 20 Jul 2023 07:47:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:bd83:c166:7e2d:3d74])
        by smtp.gmail.com with ESMTPSA id r1-20020adfce81000000b0031128382ed0sm1550906wrn.83.2023.07.20.07.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 07:47:57 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v2 0/5] core: provide information about the parent chip in line requests
Date:   Thu, 20 Jul 2023 16:47:42 +0200
Message-Id: <20230720144747.73276-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

While working on the DBus API, it occurred to me that while we can obtain
the list of requested offsets from a line request, this information lacks
context if we cannot get any information about the parent chip on which
the request was made.

We cannot reference the chip in any way as its lifetime is disconnected
from the request but we can at least provide the name of the chip used
to create the request providing some context for the offsets.

This series adds a new getter for struct gpiod_line_request and wrappers
for it for all bindings. This will be used in the upcoming DBus GPIO
manager code.

v1 -> v2:
- provide the chip name, not its filesystem path
- fix UNSAFE comments in rust bindings

Bartosz Golaszewski (5):
  core: provide gpiod_line_request_get_chip_name()
  tests: add a test-case for gpiod_line_request_get_chip_name()
  bindings: cxx: provide line_request::chip_name()
  bindings: python: provide the chip_name property in line_request
  bindings: rust: provide LineRequest::chip_name()

 bindings/cxx/gpiodcxx/line-request.hpp       |  6 ++++++
 bindings/cxx/line-request.cpp                | 10 +++++++++-
 bindings/cxx/tests/tests-line-request.cpp    |  6 ++++--
 bindings/python/gpiod/chip.py                |  1 +
 bindings/python/gpiod/ext/request.c          | 11 ++++++++++
 bindings/python/gpiod/line_request.py        | 12 +++++++++--
 bindings/python/tests/tests_line_request.py  | 13 +++++++-----
 bindings/rust/libgpiod/src/line_request.rs   | 16 +++++++++++++++
 bindings/rust/libgpiod/tests/line_request.rs | 14 +++++++++++++
 include/gpiod.h                              |  9 +++++++++
 lib/chip.c                                   |  7 ++++++-
 lib/internal.h                               |  3 ++-
 lib/line-request.c                           | 20 ++++++++++++++++++-
 tests/tests-line-request.c                   | 21 ++++++++++++++++++++
 14 files changed, 136 insertions(+), 13 deletions(-)

-- 
2.39.2

