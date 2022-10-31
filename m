Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9D06134DA
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Oct 2022 12:47:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbiJaLrf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Oct 2022 07:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbiJaLre (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Oct 2022 07:47:34 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59E71203
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 04:47:30 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id k15so2395193pfg.2
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 04:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=joRxYO8gCYRnDL/9lFGoldAUjQyKYgPTGuvWgb6JlTs=;
        b=Ya/dHglECt7OXXYmDOxr6fr3+dnIAZpjG9zLbTiJUEFhB8wcpTpCkl30TTMyi3uTU+
         FEiEkni+WKT1wu0uJTCikeTUWJ/2lVzdFuTNLe5zXlIbeaXlJ7FWQk9ndHo7hgPHm75/
         p9joniClnRY1NfI2ijXkzLaTGjiyd2kHCHSdJTCFDFlq/ccE/JX791Pz7RY7os/nAT7U
         nmBv5OzhUJ+4DCOS8e0oaooplMmNzAStVFwEKuD1vOTUGZHKtZYX7u9wUPL/X0eVhtYG
         rWy0ZLXoijlf8nYO9ZYtNH5ErkwluhDALrqYiOaHdq/75gEIxgEdehyceETDfY6U6qpY
         9a5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=joRxYO8gCYRnDL/9lFGoldAUjQyKYgPTGuvWgb6JlTs=;
        b=xl3rQXHIOt1af7A3q17q2hvC645nHjROjnsnorOaLZot8naRske7yrJTilkFKbh00h
         P65BbtBucrZ+ZlgyXZIsVtw7oIKYGPadpbfSc+LLTrlvQjbZABdF8uSOF5tx4fO6fMbx
         /0svF4nKdUp0v6MidGSReF0P5aWBCR5gBgwohN7VrgILHyRT0ftAIsphZS8mDutkOeJX
         qj+pGXv33VzybOA7KdZ7s84V/UMb35bIh5wWz0D8VQc7C6HkRds+xHjCOmhtSoma5a68
         i+8b4iTk16PB4Sax74jyEStsHlES9XHh1H+9Has7MI3GO79m7+Z/LZ9O+xfLUheIONbo
         AmKw==
X-Gm-Message-State: ACrzQf2SaKQZKO48l7u8JE/2JimoCBhH+FDOXumxL7BgPPhR6a5WbWPu
        rKKQOcClmcgjfgqaSSLiEJsTIQ==
X-Google-Smtp-Source: AMsMyM6jK2tH28mNkX+KgFpJUTqtS8YhP6QRMmDwIZ+nFLDe17zcL2khYlpYmbwoQjD93h8floa3zA==
X-Received: by 2002:a05:6a00:1304:b0:555:6d3f:1223 with SMTP id j4-20020a056a00130400b005556d3f1223mr14120444pfu.60.1667216849662;
        Mon, 31 Oct 2022 04:47:29 -0700 (PDT)
Received: from localhost ([122.172.84.80])
        by smtp.gmail.com with ESMTPSA id g23-20020a63e617000000b0045fcfde8263sm4009878pgh.53.2022.10.31.04.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 04:47:28 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Subject: [libgpiod v2][PATCH V8 0/9] bindings: rust: Add libgpiod-sys rust crate
Date:   Mon, 31 Oct 2022 17:17:08 +0530
Message-Id: <cover.1667215380.git.viresh.kumar@linaro.org>
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

Here is another version of the rust bindings, based of the master branch.

Pushed here:

https://github.com/vireshk/libgpiod v8

V7->V8:
- Several updates to cargo.toml files, like license, version, etc.
- Removed Sync support for chip and gpiosim.
- Implemented, in a separate patch, iterator support for Events.
- Fixed missing SAFETY comments.
- Fixed build for 32 bit systems.
- Use errno::Errno.
- Removed Clone derive for many structures, that store raw pointers.
- line setting helpers return the object back, so another helper can be called
  directly on them. Also made all helpers public and used the same in tests and
  example for single configurations.
- Enums for gpiosim constants.
- New examples to demonstrate parallelism and event handling.
- Separated out HTE tests and marked as #[ignore] now.
- Updated commit subjects.
- Other minor changes.

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

Viresh Kumar (9):
  bindings: rust: Add libgpiod-sys rust crate
  bindings: rust: Add pre generated bindings for libgpiod-sys
  bindings: rust: Add gpiosim crate
  bindings: rust: Add pre generated bindings for gpiosim
  bindings: rust: Add libgpiod crate
  bindings: rust: Add examples to libgpiod crate
  bindings: rust: Add tests for libgpiod crate
  bindings: rust: Integrate building of bindings with make
  bindings: rust: Implement iterator for edge events

 .gitignore                                    |    5 +
 README                                        |    8 +-
 TODO                                          |    8 -
 bindings/Makefile.am                          |    6 +
 bindings/rust/Cargo.toml                      |    7 +
 bindings/rust/Makefile.am                     |   18 +
 bindings/rust/gpiosim/Cargo.toml              |   24 +
 bindings/rust/gpiosim/README.md               |   11 +
 bindings/rust/gpiosim/build.rs                |   43 +
 bindings/rust/gpiosim/src/bindings.rs         |  180 +++
 bindings/rust/gpiosim/src/lib.rs              |   79 ++
 bindings/rust/gpiosim/src/sim.rs              |  331 +++++
 bindings/rust/libgpiod-sys/Cargo.toml         |   22 +
 bindings/rust/libgpiod-sys/README.md          |   11 +
 bindings/rust/libgpiod-sys/build.rs           |   41 +
 bindings/rust/libgpiod-sys/src/bindings.rs    | 1173 +++++++++++++++++
 bindings/rust/libgpiod-sys/src/lib.rs         |   13 +
 bindings/rust/libgpiod/Cargo.toml             |   23 +
 .../rust/libgpiod/examples/gpio_events.rs     |   89 ++
 .../examples/gpio_threaded_info_events.rs     |  133 ++
 bindings/rust/libgpiod/examples/gpiodetect.rs |   31 +
 bindings/rust/libgpiod/examples/gpiofind.rs   |   37 +
 bindings/rust/libgpiod/examples/gpioget.rs    |   46 +
 bindings/rust/libgpiod/examples/gpioinfo.rs   |   98 ++
 bindings/rust/libgpiod/examples/gpiomon.rs    |   74 ++
 bindings/rust/libgpiod/examples/gpioset.rs    |   64 +
 bindings/rust/libgpiod/examples/gpiowatch.rs  |   54 +
 bindings/rust/libgpiod/src/chip.rs            |  317 +++++
 bindings/rust/libgpiod/src/edge_event.rs      |  110 ++
 bindings/rust/libgpiod/src/event_buffer.rs    |  179 +++
 bindings/rust/libgpiod/src/info_event.rs      |   69 +
 bindings/rust/libgpiod/src/lib.rs             |  480 +++++++
 bindings/rust/libgpiod/src/line_config.rs     |  135 ++
 bindings/rust/libgpiod/src/line_info.rs       |  162 +++
 bindings/rust/libgpiod/src/line_request.rs    |  227 ++++
 bindings/rust/libgpiod/src/line_settings.rs   |  297 +++++
 bindings/rust/libgpiod/src/request_config.rs  |   95 ++
 bindings/rust/libgpiod/tests/chip.rs          |   99 ++
 bindings/rust/libgpiod/tests/common/config.rs |  143 ++
 bindings/rust/libgpiod/tests/common/mod.rs    |   10 +
 bindings/rust/libgpiod/tests/edge_event.rs    |  299 +++++
 bindings/rust/libgpiod/tests/info_event.rs    |  167 +++
 bindings/rust/libgpiod/tests/line_config.rs   |   96 ++
 bindings/rust/libgpiod/tests/line_info.rs     |  276 ++++
 bindings/rust/libgpiod/tests/line_request.rs  |  510 +++++++
 bindings/rust/libgpiod/tests/line_settings.rs |  204 +++
 .../rust/libgpiod/tests/request_config.rs     |   39 +
 configure.ac                                  |   16 +
 48 files changed, 6548 insertions(+), 11 deletions(-)
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
 create mode 100644 bindings/rust/libgpiod/examples/gpio_events.rs
 create mode 100644 bindings/rust/libgpiod/examples/gpio_threaded_info_events.rs
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

