Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF025FECAE
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Oct 2022 12:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbiJNKrg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Oct 2022 06:47:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiJNKrd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Oct 2022 06:47:33 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DE152AE0E
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 03:47:30 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id l4so4370112plb.8
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 03:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dWliNAgvEJ9c9Gfsx09MUoezWlT9Y/c9xScwXmHPPFI=;
        b=idI7bdx9sOPp550WlgExz+fKIHx4IaInv1ltJXjQ76p7DGJg2Aegx+rjVLBmKjZ68G
         Ygq5uBDRUUg8+3dUzdOFWouP5A/gaHyHdk5h60K1fG8HwpEW8dNubdzoHaICLR9EbmqO
         DxUsFRjrNunIGSaN3qPco49l7Xk/bc7T/BTATUxU4v3SztJsmu/V3jaXdKUxKnrlSMM3
         m7nBBa4kDZ8kfbqb73Zlksm/y/1kcOgdgz71Fkzvb9ZX1WI0dzDd/b3+PP8BpNz5QXcD
         8XROSmU+rR+SW/4rhS6giJIx9Lb6AKXS2BGcTxLye0DwPfWrBhNqSCkjyhryjTme0XCB
         6HHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWliNAgvEJ9c9Gfsx09MUoezWlT9Y/c9xScwXmHPPFI=;
        b=Fjfcs495qB7NJYS7jsqoBkFzfVjiqUAxlqEPnjFcdjsQSK6N+rDuTv/9HevmHk5nGB
         isL5+jGgsSOLnBZZm1MsTrFo6D4kPykDehWuu6Q0MvmoIzao2KvIJ9GR7UKWlrX7IcjV
         mLNdKmxZd5ZmNLrC3OJZSXylUYcrOcTX6SGBzSYmM2GcGbDqUnFNNWjB77s9WcL9lOIf
         Z2qNOmxHMxWxqf+7JUsTDiCzreLIpJnvlNMFYdhXKAZx/DlFr43E49EA10dH+Y5eGduM
         gcDk5lk/B48UvS5H7YVogiHpU8aiPg/Xvi+G0PoLl7loyX2VzBYi3VoPmbe8WypApYOl
         5uSA==
X-Gm-Message-State: ACrzQf0qaSSsHwHIvGasJyhCNA+kI3ElFjPl4bKHv5HF8fcppbpw+9bW
        2C0BzCVMLIsP0wo7vz0LGw3vcg==
X-Google-Smtp-Source: AMsMyM7yXWy9aeiDwCxNv+1bqEcuK8lUezbtLM6Hku4CZjIXcWlzBPzmJVSS3rXh9llVU0fALD5V/A==
X-Received: by 2002:a17:902:64c2:b0:17b:6546:54be with SMTP id y2-20020a17090264c200b0017b654654bemr4672967pli.60.1665744449588;
        Fri, 14 Oct 2022 03:47:29 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id iz13-20020a170902ef8d00b00174abcb02d6sm1391506plb.235.2022.10.14.03.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 03:47:28 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: [PATCH V7 0/8] libgpiod: Add Rust bindings
Date:   Fri, 14 Oct 2022 16:17:17 +0530
Message-Id: <cover.1665744170.git.viresh.kumar@linaro.org>
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

https://github.com/vireshk/libgpiod v7

[I have pushed v6 and v5 there too, in case someone wants to look at the
changes].

V6->V7:
- Don't let buffer read new events if the earlier events are still referenced.
- BufferIntenal is gone now, to make the above work.
- Update example and tests too for the same.

V5->V6:
- Updates according to the new line-settings interface.
- New file, line_settings.rs.
- Renamed 'enum Setting' as 'SettingVal' to avoid conflicting names, as we also
  have 'struct Settings' now.
- Support for HTE clock type.
- Implement 'Eq' for public structure/enums (reported by build).
- Remove 'SettingKindMap' and 'SettingMap' as they aren't required anymore.
- Updated tests based on new interface.

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
 bindings/rust/gpiosim/src/bindings.rs         |  180 +++
 bindings/rust/gpiosim/src/lib.rs              |   25 +
 bindings/rust/gpiosim/src/sim.rs              |  323 +++++
 bindings/rust/libgpiod-sys/Cargo.toml         |   15 +
 bindings/rust/libgpiod-sys/README.md          |   11 +
 bindings/rust/libgpiod-sys/build.rs           |   41 +
 bindings/rust/libgpiod-sys/src/bindings.rs    | 1173 +++++++++++++++++
 bindings/rust/libgpiod-sys/src/lib.rs         |   13 +
 bindings/rust/libgpiod/Cargo.toml             |   16 +
 bindings/rust/libgpiod/examples/gpiodetect.rs |   30 +
 bindings/rust/libgpiod/examples/gpiofind.rs   |   35 +
 bindings/rust/libgpiod/examples/gpioget.rs    |   42 +
 bindings/rust/libgpiod/examples/gpioinfo.rs   |   95 ++
 bindings/rust/libgpiod/examples/gpiomon.rs    |   73 +
 bindings/rust/libgpiod/examples/gpioset.rs    |   60 +
 bindings/rust/libgpiod/examples/gpiowatch.rs  |   54 +
 bindings/rust/libgpiod/src/chip.rs            |  253 ++++
 bindings/rust/libgpiod/src/edge_event.rs      |  101 ++
 bindings/rust/libgpiod/src/event_buffer.rs    |   66 +
 bindings/rust/libgpiod/src/info_event.rs      |   68 +
 bindings/rust/libgpiod/src/lib.rs             |  471 +++++++
 bindings/rust/libgpiod/src/line_config.rs     |  118 ++
 bindings/rust/libgpiod/src/line_info.rs       |  180 +++
 bindings/rust/libgpiod/src/line_request.rs    |  246 ++++
 bindings/rust/libgpiod/src/line_settings.rs   |  277 ++++
 bindings/rust/libgpiod/src/request_config.rs  |   96 ++
 bindings/rust/libgpiod/tests/chip.rs          |   97 ++
 bindings/rust/libgpiod/tests/common/config.rs |  134 ++
 bindings/rust/libgpiod/tests/common/mod.rs    |   10 +
 bindings/rust/libgpiod/tests/edge_event.rs    |  296 +++++
 bindings/rust/libgpiod/tests/info_event.rs    |  125 ++
 bindings/rust/libgpiod/tests/line_config.rs   |  105 ++
 bindings/rust/libgpiod/tests/line_info.rs     |  279 ++++
 bindings/rust/libgpiod/tests/line_request.rs  |  519 ++++++++
 bindings/rust/libgpiod/tests/line_settings.rs |  226 ++++
 .../rust/libgpiod/tests/request_config.rs     |   38 +
 configure.ac                                  |   16 +
 46 files changed, 6020 insertions(+), 11 deletions(-)
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
 create mode 100644 bindings/rust/libgpiod/src/line_settings.rs
 create mode 100644 bindings/rust/libgpiod/src/request_config.rs
 create mode 100644 bindings/rust/libgpiod/tests/chip.rs
 create mode 100644 bindings/rust/libgpiod/tests/common/config.rs
 create mode 100644 bindings/rust/libgpiod/tests/common/mod.rs
 create mode 100644 bindings/rust/libgpiod/tests/edge_event.rs
 create mode 100644 bindings/rust/libgpiod/tests/info_event.rs
 create mode 100644 bindings/rust/libgpiod/tests/line_config.rs
 create mode 100644 bindings/rust/libgpiod/tests/line_info.rs
 create mode 100644 bindings/rust/libgpiod/tests/line_request.rs
 create mode 100644 bindings/rust/libgpiod/tests/line_settings.rs
 create mode 100644 bindings/rust/libgpiod/tests/request_config.rs

-- 
2.31.1.272.g89b43f80a514

