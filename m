Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB72759E63
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jul 2023 21:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230509AbjGSTVJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jul 2023 15:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbjGSTVI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jul 2023 15:21:08 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BECC61FC8
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 12:21:06 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fcd615d7d6so11356770e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 12:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689794465; x=1690399265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CqCq/WNW98PnxdDgHMZhstDk8/eyCF3J+cI1dZ+sk1A=;
        b=uU4p/C+prg7OeBDg8DVEQrZU58bEB8yZ83nnPnjQtS+Pw8L4yd6omyUDs+uJcxgR6H
         nctfXS+fT1sap0CGYViSLuT2nSCDfwFHOB2Sl7+7WiZ1GFTxdBtO+aMC/uykRxqz6I/3
         iw4QqF02CyfHdg0BcFac28PpJ7hLyYramECX4Fe6JafGVq6n8dLEcNwAFTFIdm8uUYdz
         5CG9gOSddMsctSZTuXxuzR/WKLG1xYqGjBj+5PpyQYGqAJknwdQsifI1+XcA1bpbZWAO
         fpOvMqn5kYO6ZVYpK1eEZ3LLsshdBu4Ej0RXUhHQ1w232NIrKDtQBLKwTVeBrBZXKz7N
         RM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689794465; x=1690399265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqCq/WNW98PnxdDgHMZhstDk8/eyCF3J+cI1dZ+sk1A=;
        b=VM9FiRV4ufttWBEe4fIRL/jITArkD0txCC1ewF4o7LkjUd35Mhh+nyQaMVpTLfQx4B
         pgZLKtHKAyL6lfTOWxrx5ZH+ZdWwoWYzUZyHjUtjkJ+5RUm3EwsyS3EtXU/Wjmuy2tWn
         u/OJaYt5saiaSfcBLHsjLtQJ9bKDhII6OQBIh2Ax9bDiJkYW1eOaOl+HWCxijaolrF0Q
         jqGins1aWKKmuIdlkvl9VuF3bk80QKawG9/mZMpPFMNdTYisK/N5Q03qU0J5yrOeAnua
         /Ghy7TJiS/7G3o72BFcGunB36xHo0CDvKtUbRISDms0l6rc8c0wEiTThA6emSaUJaArS
         vXyQ==
X-Gm-Message-State: ABy/qLb/9R9c0zKdZ1lxlTqoZ0etq53IDyQbGpV7Zhk966t7Ktq9iyX5
        r8oVLjkrVmngY4CZs6EYidKIElKxqUoBlaonpU4=
X-Google-Smtp-Source: APBJJlFgK01c9/bqyecifkIgSzVhoX3rC+sofe2TnP/GJyQ9CLb+nn0NOb3IyuQbTy5vPkFxVWPUmg==
X-Received: by 2002:a05:6512:ac4:b0:4fd:d4b4:faba with SMTP id n4-20020a0565120ac400b004fdd4b4fabamr683435lfu.51.1689794464619;
        Wed, 19 Jul 2023 12:21:04 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f884:f48d:2867:5c1d])
        by smtp.gmail.com with ESMTPSA id b14-20020a05600c11ce00b003fbc0a49b57sm2373454wmi.6.2023.07.19.12.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 12:21:04 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 0/5] core: provide information about the parent chip in line requests
Date:   Wed, 19 Jul 2023 21:20:52 +0200
Message-Id: <20230719192057.172560-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
from the request but we can at least provide the path to the character
device used to open it as a way of providing some context for the offsets.

This series adds a new getter for struct gpiod_line_request and wrappers
for it for all bindings. This will be used in the upcoming DBus GPIO
manager code.

Bartosz Golaszewski (5):
  core: provide gpiod_line_request_get_chip_path()
  tests: add a test-case for gpiod_line_request_get_chip_path()
  bindings: cxx: provide line_request::chip_path()
  bindings: python: provide the chip_path property in line_request
  bindings: rust: provide LineRequest::chip_path()

 bindings/cxx/gpiodcxx/line-request.hpp       |  7 +++++++
 bindings/cxx/line-request.cpp                | 10 +++++++++-
 bindings/cxx/tests/tests-line-request.cpp    |  6 ++++--
 bindings/python/gpiod/chip.py                |  1 +
 bindings/python/gpiod/line_request.py        | 12 +++++++++--
 bindings/python/tests/tests_line_request.py  | 13 +++++++-----
 bindings/rust/libgpiod/src/line_request.rs   | 12 +++++++++++
 bindings/rust/libgpiod/tests/line_request.rs | 13 ++++++++++++
 include/gpiod.h                              |  9 +++++++++
 lib/chip.c                                   |  2 +-
 lib/internal.h                               |  3 ++-
 lib/line-request.c                           | 20 ++++++++++++++++++-
 tests/tests-line-request.c                   | 21 ++++++++++++++++++++
 13 files changed, 116 insertions(+), 13 deletions(-)

-- 
2.39.2

