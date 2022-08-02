Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6252587C2F
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Aug 2022 14:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233811AbiHBMSZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Aug 2022 08:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236865AbiHBMSY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Aug 2022 08:18:24 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE334F6B9
        for <linux-gpio@vger.kernel.org>; Tue,  2 Aug 2022 05:18:19 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 12so12220642pga.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Aug 2022 05:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PTXnDqvXM6hhp9RNPTChfixjy4jkyWBITtOvPMvZnR4=;
        b=iApGZBVRXbSeGZ0NNdpMXlmIkMZ8uMHoVuJEg4ZmIT48J/zMfY4WC3AhRljpdVGuLj
         rBH5yjx9K0Xz9XeNmyBxco4iX10CAwzuj+ZJ9fkHwsnDnfO9YuAauAD1Mu65Fp+TmiZh
         4ptcESLFTKcsQnHGhMefiyGy4BhsqDNluODTMis2xn0ajl+SBUCJGosZq1XR5kdkLYSK
         IfW/mpfvLAvyhZYvbKVb3Vzhh0C4NPsWDtyJe9oPDQv3iHpucHgpPkfjgj7XwkNtS67/
         +qP4xCsSaItNmxQ9ox0atxy3qA7WzHf4fiW0vJEVj7GhXZb2WT2bFRcXsLJV3mU0BYL0
         mQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PTXnDqvXM6hhp9RNPTChfixjy4jkyWBITtOvPMvZnR4=;
        b=d/XCBPpTuDXrqzbgVMos+Fjo13qKUX+nh+XC8Ac3rhMY9NMzOKePRFj3EMbQjv4l4d
         9SNMMNJifPfT9QlHdw05bUysFZtnRDYb9KuxiuJMSOaHM2usCY1Ep/kWu07qEqS9jNM6
         bJLtBHKOGwVah+ge1BZ3JxRaJnhYvqdbm5jkWzPyHVA7pNpZ2GOI+wEYi8xYNyOWh1BY
         cjQWc1/nbUjW8wJ5SklcIcqL6MDzBryEfv/FnJdSvJY9drGuhGMYO0BkDUsACDc6+OW1
         1ewQKe+DiNAZqxpnvvoCGThu0NLmgMUJemstQvAAPyKePY/F7FIA6LVcxKBREuEVHHqv
         pPvA==
X-Gm-Message-State: AJIora/vvb39nb4Wt+Q2YXIoy5uIo340PG7M2QxC+xBBHSAsmkndwKy/
        NhDE8Gut6PYi2f7LXLpzyvPrZw==
X-Google-Smtp-Source: AGRyM1t3g94zgtT6bTHATndnwZuwW0cOPWfOynP30+eHHUGXE90oDhsT9XDBrlHJQKPwWuojpekJbw==
X-Received: by 2002:a05:6a00:2312:b0:52b:928:99dd with SMTP id h18-20020a056a00231200b0052b092899ddmr20317232pfh.77.1659442698917;
        Tue, 02 Aug 2022 05:18:18 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id v66-20020a622f45000000b005254535a2cfsm10671579pfv.136.2022.08.02.05.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 05:18:18 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: [PATCH V5 0/8] libgpiod: Add Rust bindings
Date:   Tue,  2 Aug 2022 17:48:04 +0530
Message-Id: <cover.1659442066.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

Here is another version of rust bindings for libgpiod v2.0, based of the
next/libgpiod-2.0.

Pushed here:

https://github.com/vireshk/libgpiod master

Kent, I hope I haven't missed any of your comments, there were too many of them.
Thanks for your review.

V4->V5:
- Arrange as workspace with crates for libgpiod-sys, libgpiod, gpiosim.
- Use static libgpiod and libgpiosim libraries instead of rebuilding again.
- Arrange in modules instead of flattened approach.
- New enums like Setting and SettingKind and new types based on them SettingMap
  and SettingKindMap.
- New property independent helpers for line_config, like set_prop_default().
- Improved tests/examples, new example for gpiowatch.
- Add pre-built bindings for gpiosim too.
- Many other changes.

V3->V4:
- Rebased on top of new changes, and made changes accordingly.
- Added rust integration tests with gpiosim.
- Found a kernel bug with tests, sent a patch for that to LKML.

V2->V3:
- Remove naming redundancy, users just need to do this now
  use libgpiod:{Chip, Direction, LineConfig} now (Bartosz);
- Fix lifetime issues between event-buffer and edge-event modules, the event
  buffer is released after the last edge-event reference is dropped (Bartosz).
- Allow edge-event to be copied, and freed later (Bartosz).
- Add two separate rust crates, sys and wrapper (Gerard).
- Null-terminate the strings passed to libgpiod (Wedson).
- Drop unnecessary checks to validate string returned from chip:name/label/path.
- Fix SAFETY comments (Wedson).
- Drop unnecessary clone() instances (Bartosz).

V1->V2:
- Added examples (I tested everything except gpiomon.rs, didn't have right
  hardware/mock device to test).
- Build rust bindings as part of Make, update documentation.

Thanks.

--
Viresh

Viresh Kumar (8):
  libgpiod: Add libgpiod-sys rust crate
  libgpiod-sys: Add pre generated rust bindings
  libgpiod: Add rust wrapper crate
  libgpiod: Add rust examples
  libgpiod: Add gpiosim rust crate
  gpiosim: Add pre generated rust bindings
  libgpiod: Add rust tests
  libgpiod: Integrate building of rust bindings with make

 .gitignore                                    |    5 +
 README                                        |    8 +-
 TODO                                          |    8 -
 bindings/Makefile.am                          |    6 +
 bindings/rust/Cargo.toml                      |    7 +
 bindings/rust/Makefile.am                     |   18 +
 bindings/rust/gpiosim/Cargo.toml              |   18 +
 bindings/rust/gpiosim/README.md               |   11 +
 bindings/rust/gpiosim/build.rs                |   43 +
 bindings/rust/gpiosim/src/bindings.rs         |  180 ++
 bindings/rust/gpiosim/src/lib.rs              |   25 +
 bindings/rust/gpiosim/src/sim.rs              |  323 ++++
 bindings/rust/libgpiod-sys/Cargo.toml         |   15 +
 bindings/rust/libgpiod-sys/README.md          |   11 +
 bindings/rust/libgpiod-sys/build.rs           |   41 +
 bindings/rust/libgpiod-sys/src/bindings.rs    | 1535 +++++++++++++++++
 bindings/rust/libgpiod-sys/src/lib.rs         |   13 +
 bindings/rust/libgpiod/Cargo.toml             |   16 +
 bindings/rust/libgpiod/examples/gpiodetect.rs |   30 +
 bindings/rust/libgpiod/examples/gpiofind.rs   |   35 +
 bindings/rust/libgpiod/examples/gpioget.rs    |   44 +
 bindings/rust/libgpiod/examples/gpioinfo.rs   |   95 +
 bindings/rust/libgpiod/examples/gpiomon.rs    |   71 +
 bindings/rust/libgpiod/examples/gpioset.rs    |   64 +
 bindings/rust/libgpiod/examples/gpiowatch.rs  |   54 +
 bindings/rust/libgpiod/src/chip.rs            |  253 +++
 bindings/rust/libgpiod/src/edge_event.rs      |  102 ++
 bindings/rust/libgpiod/src/event_buffer.rs    |   90 +
 bindings/rust/libgpiod/src/info_event.rs      |   68 +
 bindings/rust/libgpiod/src/lib.rs             |  477 +++++
 bindings/rust/libgpiod/src/line_config.rs     |  586 +++++++
 bindings/rust/libgpiod/src/line_info.rs       |  180 ++
 bindings/rust/libgpiod/src/line_request.rs    |  246 +++
 bindings/rust/libgpiod/src/request_config.rs  |  119 ++
 bindings/rust/libgpiod/tests/chip.rs          |   97 ++
 bindings/rust/libgpiod/tests/common/config.rs |  142 ++
 bindings/rust/libgpiod/tests/common/mod.rs    |   10 +
 bindings/rust/libgpiod/tests/edge_event.rs    |  294 ++++
 bindings/rust/libgpiod/tests/info_event.rs    |  120 ++
 bindings/rust/libgpiod/tests/line_config.rs   |  293 ++++
 bindings/rust/libgpiod/tests/line_info.rs     |  272 +++
 bindings/rust/libgpiod/tests/line_request.rs  |  473 +++++
 .../rust/libgpiod/tests/request_config.rs     |   42 +
 configure.ac                                  |   16 +
 44 files changed, 6545 insertions(+), 11 deletions(-)
 create mode 100644 bindings/rust/Cargo.toml
 create mode 100644 bindings/rust/Makefile.am
 create mode 100644 bindings/rust/gpiosim/Cargo.toml
 create mode 100644 bindings/rust/gpiosim/README.md
 create mode 100644 bindings/rust/gpiosim/build.rs
 create mode 100644 bindings/rust/gpiosim/src/bindings.rs
 create mode 100644 bindings/rust/gpiosim/src/lib.rs
 create mode 100644 bindings/rust/gpiosim/src/sim.rs
 create mode 100644 bindings/rust/libgpiod-sys/Cargo.toml
 create mode 100644 bindings/rust/libgpiod-sys/README.md
 create mode 100644 bindings/rust/libgpiod-sys/build.rs
 create mode 100644 bindings/rust/libgpiod-sys/src/bindings.rs
 create mode 100644 bindings/rust/libgpiod-sys/src/lib.rs
 create mode 100644 bindings/rust/libgpiod/Cargo.toml
 create mode 100644 bindings/rust/libgpiod/examples/gpiodetect.rs
 create mode 100644 bindings/rust/libgpiod/examples/gpiofind.rs
 create mode 100644 bindings/rust/libgpiod/examples/gpioget.rs
 create mode 100644 bindings/rust/libgpiod/examples/gpioinfo.rs
 create mode 100644 bindings/rust/libgpiod/examples/gpiomon.rs
 create mode 100644 bindings/rust/libgpiod/examples/gpioset.rs
 create mode 100644 bindings/rust/libgpiod/examples/gpiowatch.rs
 create mode 100644 bindings/rust/libgpiod/src/chip.rs
 create mode 100644 bindings/rust/libgpiod/src/edge_event.rs
 create mode 100644 bindings/rust/libgpiod/src/event_buffer.rs
 create mode 100644 bindings/rust/libgpiod/src/info_event.rs
 create mode 100644 bindings/rust/libgpiod/src/lib.rs
 create mode 100644 bindings/rust/libgpiod/src/line_config.rs
 create mode 100644 bindings/rust/libgpiod/src/line_info.rs
 create mode 100644 bindings/rust/libgpiod/src/line_request.rs
 create mode 100644 bindings/rust/libgpiod/src/request_config.rs
 create mode 100644 bindings/rust/libgpiod/tests/chip.rs
 create mode 100644 bindings/rust/libgpiod/tests/common/config.rs
 create mode 100644 bindings/rust/libgpiod/tests/common/mod.rs
 create mode 100644 bindings/rust/libgpiod/tests/edge_event.rs
 create mode 100644 bindings/rust/libgpiod/tests/info_event.rs
 create mode 100644 bindings/rust/libgpiod/tests/line_config.rs
 create mode 100644 bindings/rust/libgpiod/tests/line_info.rs
 create mode 100644 bindings/rust/libgpiod/tests/line_request.rs
 create mode 100644 bindings/rust/libgpiod/tests/request_config.rs

-- 
2.31.1.272.g89b43f80a514

