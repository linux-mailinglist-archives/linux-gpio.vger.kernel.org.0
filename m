Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2B6A67516A
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 10:45:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbjATJp0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Jan 2023 04:45:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbjATJpZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2023 04:45:25 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F4027AF0B
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 01:45:23 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so3238058wmq.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 01:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fzZOFVHmWXbEgEH1wZSuDr3JWgPu736BjvGEUQ7nbcE=;
        b=ay8cZtcRBRH2ld0YqRrqhB7tBziXaD03gA9H7CzpEW78Z2wxG4DaQnaX0WYjzxdgRT
         mmsi+9oHqf7rWzPc9XbVcZXe0Zl/UMpAMemCY9jPOaF7JkC4uhlTQhsCoGAD7Yie77xr
         QJGaBMRPbraXQboYYXZIdoXf/N6LgIVMAehdROP5XQbVn/BQF82NMuzQ0In/OK2FklFp
         t2BbCOVh5qvpkELtsqou8uHR7vdlALWYqHqmSoiBOmW1bwgWoiq3moc3HOzR+32agB5j
         7hevpFwBNPzdEiBxv/DxF2+7NomrtHUfn60t9fXVKVm8HJGcjUYZrecsJ9lTk1pxnDRg
         e4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fzZOFVHmWXbEgEH1wZSuDr3JWgPu736BjvGEUQ7nbcE=;
        b=F+uE29GCfnwQAnEAqZzCoXDCAmmC4r/QndfLHMSBubPoSWGhbDXovdNNRxOCbmnZKa
         ucS/rtEPhRuyWDhgQhpHqG0VB9nhdJn5NsSXebYfWcga8ij4bnSSKmVruTmWNmo5d2uP
         /6ecc18+0vx5HZamOre/KrPFJrzeVDqjcb7IGV5zj4hHQMKOc0VmRyHvbxr9E8tbsJow
         pNHWPGPg3ty+2AjUbvYrzF3+JEO0rkQeZYmYtkIrQgIgM+wLOh9ow4YmamCbczV3w4EM
         621lJbknRPTBAEI9XR8OSxrqBJt8938uyD4fl4ph0mFy0XtMT/1bWh0ASO+UFzW9JQud
         +ZcQ==
X-Gm-Message-State: AFqh2krvtYJkO6r8TgSjCd2VH6pOSB/jwqNsM5vKfL8MCqfYbAXChf6Z
        zNkSBdpMZda6y7YzjsqtJTQMOw==
X-Google-Smtp-Source: AMrXdXukoPHq+91eZyHLT46Iz1hX+USARXRCRcCwIf543FXRaA4M2N9Aegiak5Iy6kMckJjk381aqw==
X-Received: by 2002:a05:600c:6011:b0:3cf:85f7:bbc4 with SMTP id az17-20020a05600c601100b003cf85f7bbc4mr13508910wmb.2.1674207922042;
        Fri, 20 Jan 2023 01:45:22 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:580c:7b02:3ffd:b2e])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c445100b003d9e74dd9b2sm1800485wmn.9.2023.01.20.01.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 01:45:21 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v2 0/8] treewide: continue beating libgpiod v2 into shape for an upcoming release
Date:   Fri, 20 Jan 2023 10:45:07 +0100
Message-Id: <20230120094515.40464-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This series contains an assortment of smaller and bigger changes. Some are
just simple updates to docs, some fix bugs and we have two more changes to
the API: unifying the get_offsets functions for line config and line request
as well as providing an interface for setting multiple output values at once
in line_config before requesting lines.

Rust bindings have also been updated slightly so Viresh please make sure to
take a look and review.

I really hope this is the last set of bigger changes and that I'll be able
to tag an RC and release v2 in the next couple of weeks.

v1 -> v2:
- apply non-controversial patches and drop them from the series
- fix README as per Andy's suggestions
- extend the test cases for gpiod_line_config/request_get_offsets()
- improve rust code for getting line settings from line config
- improve the documentation for gpiod_line_config_set_output_values()
- extend the python support for setting global output values by allowing
  to pass mappings from line names/offsets to line values

Bartosz Golaszewski (8):
  README: update for libgpiod v2
  treewide: unify gpiod_line_config/request_get_offsets() functions
  core: provide gpiod_line_config_set_output_values()
  gpioset: use gpiod_line_config_set_output_values()
  bindings: cxx: add line_config.set_output_values()
  bindings: python: add the output_values argument to
    Chip.request_lines()
  bindings: rust: make mutators return &mut self
  bindings: rust: provide line_config.set_output_values()

 README                                        |  33 ++--
 bindings/cxx/gpiodcxx/line-config.hpp         |   7 +
 bindings/cxx/internal.hpp                     |   1 +
 bindings/cxx/line-config.cpp                  |  33 ++--
 bindings/cxx/line-request.cpp                 |   6 +-
 bindings/cxx/line-settings.cpp                |   5 +
 bindings/cxx/tests/tests-line-config.cpp      |  51 +++++++
 bindings/python/gpiod/chip.py                 |  30 ++++
 bindings/python/gpiod/ext/line-config.c       |  64 ++++++++
 bindings/python/gpiod/ext/request.c           |   8 +-
 bindings/python/tests/tests_line_request.py   |  55 +++++++
 .../rust/libgpiod/examples/gpio_events.rs     |   2 +-
 .../examples/gpio_threaded_info_events.rs     |   6 +-
 bindings/rust/libgpiod/examples/gpioget.rs    |   4 +-
 bindings/rust/libgpiod/examples/gpiomon.rs    |   2 +-
 bindings/rust/libgpiod/examples/gpioset.rs    |   4 +-
 bindings/rust/libgpiod/src/lib.rs             |   1 +
 bindings/rust/libgpiod/src/line_config.rs     |  84 +++++-----
 bindings/rust/libgpiod/src/line_request.rs    |  24 +--
 bindings/rust/libgpiod/src/request_config.rs  |   8 +-
 bindings/rust/libgpiod/tests/common/config.rs |   8 +-
 bindings/rust/libgpiod/tests/info_event.rs    |   6 +-
 bindings/rust/libgpiod/tests/line_config.rs   |  76 ++++++++--
 bindings/rust/libgpiod/tests/line_request.rs  |  73 ++++-----
 .../rust/libgpiod/tests/request_config.rs     |   2 +-
 configure.ac                                  |   1 +
 include/gpiod.h                               |  87 ++++++++---
 lib/line-config.c                             |  97 +++++++++---
 lib/line-request.c                            |  23 ++-
 tests/gpiod-test-helpers.h                    |  10 ++
 tests/tests-line-config.c                     | 143 +++++++++++++++---
 tests/tests-line-request.c                    |  49 +++++-
 tools/gpioset.c                               |  21 +--
 33 files changed, 777 insertions(+), 247 deletions(-)

-- 
2.37.2

