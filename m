Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37FF861EFBD
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Nov 2022 10:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbiKGJ5s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Nov 2022 04:57:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231898AbiKGJ5r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Nov 2022 04:57:47 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B2772D2
        for <linux-gpio@vger.kernel.org>; Mon,  7 Nov 2022 01:57:41 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id e129so9992447pgc.9
        for <linux-gpio@vger.kernel.org>; Mon, 07 Nov 2022 01:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UG98czeWwu51y30/ObRlcBkZxgkeXvkJ7CHo4eyxu+M=;
        b=gXVvBPD+Fy1CEa1cAZYW8eeq5YYETYzgcxlQF1EoBfsmtqly9pDSqVky3ledeJitzM
         8+LUotwzyrcOP48N7XU+xEcefx4FgQ6WhnGfDrcgZc6OtV+xqg8JjnbcuPcbYkWS5FzD
         qvCaTP84XUM043GpiZVc3jz1MnilfqX4VZAPK1NFCmLBbn06jTILTNg+hbOYnDXUZmJZ
         9GAupnt/o+uT4ZO/x3rs/Vg2ztfrZrPk7EnfuSe9xx/c9+AEqjKUFttLRmwNRoCmBtXE
         Jczgg7V4t5jlWb2r3XEPFtzLZpjT3l0LtwKJwA5RAw6B9sy6JZDsl9w0MLyBWYVcb88B
         sMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UG98czeWwu51y30/ObRlcBkZxgkeXvkJ7CHo4eyxu+M=;
        b=UtvIdkyHgLWxPf8BxXXFMaol+lEkZ7wggAqYnxoZ9fg9gjEkPZ4z9BUi5ovL7KDhm2
         WuGhot0Kk3KRg0FiZJl1S8YBspjuBY0lErkO3xLCY7w3sdNzUrA1zJNAaOvJC71IFSko
         uW6eYDa9bH1SdrLN+167iglDsN4BbWzw42+f/vsuy42Uqx9q3X9AIJ61lVLQ9mUsCHvQ
         eYClKZBp1DrK/OCY187iYHgj2DHTwuods97a68tKUWXGBNOhEUTP1yDosFWQrkx4043V
         6cYU9rcZDhsEV0DGcogxR9RJZ3fKzaVDTjN68Ov3YgxpsXPYnz65ZNaIiMx3LWdTSR0F
         NG/w==
X-Gm-Message-State: ACrzQf0cjJP67tcPJpUtpi03r0wYJYnAT/ZY0b1t42Rm/3+SjbwxSnW/
        K9ralWZND5xqgZWEccL8UvnN+w==
X-Google-Smtp-Source: AMsMyM5ocQOkhND+AZA3mYozExQHVgJTK6LhxKZybJHM1+Z52TFXAGWYxKjVbpjnUcrgZYAzvQy8lg==
X-Received: by 2002:a62:cdcc:0:b0:56b:a319:7b52 with SMTP id o195-20020a62cdcc000000b0056ba3197b52mr790385pfg.21.1667815060614;
        Mon, 07 Nov 2022 01:57:40 -0800 (PST)
Received: from localhost ([122.172.84.80])
        by smtp.gmail.com with ESMTPSA id x11-20020a170902ea8b00b00176ab6a0d5fsm4584844plb.54.2022.11.07.01.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 01:57:39 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Subject: [libgpiod][PATCH V9 0/8] libgpiod: Add Rust bindings
Date:   Mon,  7 Nov 2022 15:27:26 +0530
Message-Id: <cover.1667815011.git.viresh.kumar@linaro.org>
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

https://github.com/vireshk/libgpiod v9

V8->V9:
- Merged the last patch (supporting Events) with the other patches.
- Events implementation is simplified and made efficient. nth() is also
  implemented for the iterator.
- Unnecessary comment removed from Cargo.toml files.
- Updated categories in libgpiod's Cargo.toml.
- Updated gpio_events example to show cloned events live past another
  read_edge_events().
- Implement AsRawFd for Chip.
- Other minor changes.

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

Viresh Kumar (8):
  bindings: rust: Add libgpiod-sys rust crate
  bindings: rust: Add pre generated bindings for libgpiod-sys
  bindings: rust: Add gpiosim crate
  bindings: rust: Add pre generated bindings for gpiosim
  bindings: rust: Add libgpiod crate
  bindings: rust: Add examples to libgpiod crate
  bindings: rust: Add tests for libgpiod crate
  bindings: rust: Integrate building of bindings with make

 .gitignore                                    |    5 +
 README                                        |    8 +-
 TODO                                          |    8 -
 bindings/Makefile.am                          |    6 +
 bindings/rust/Cargo.toml                      |    7 +
 bindings/rust/Makefile.am                     |   18 +
 bindings/rust/gpiosim/Cargo.toml              |   22 +
 bindings/rust/gpiosim/README.md               |   11 +
 bindings/rust/gpiosim/build.rs                |   43 +
 bindings/rust/gpiosim/src/bindings.rs         |  180 +++
 bindings/rust/gpiosim/src/lib.rs              |   79 ++
 bindings/rust/gpiosim/src/sim.rs              |  331 +++++
 bindings/rust/libgpiod-sys/Cargo.toml         |   20 +
 bindings/rust/libgpiod-sys/README.md          |   11 +
 bindings/rust/libgpiod-sys/build.rs           |   41 +
 bindings/rust/libgpiod-sys/src/bindings.rs    | 1173 +++++++++++++++++
 bindings/rust/libgpiod-sys/src/lib.rs         |   13 +
 bindings/rust/libgpiod/Cargo.toml             |   21 +
 .../rust/libgpiod/examples/gpio_events.rs     |   89 ++
 .../examples/gpio_threaded_info_events.rs     |  133 ++
 bindings/rust/libgpiod/examples/gpiodetect.rs |   31 +
 bindings/rust/libgpiod/examples/gpiofind.rs   |   37 +
 bindings/rust/libgpiod/examples/gpioget.rs    |   46 +
 bindings/rust/libgpiod/examples/gpioinfo.rs   |   98 ++
 bindings/rust/libgpiod/examples/gpiomon.rs    |   75 ++
 bindings/rust/libgpiod/examples/gpioset.rs    |   64 +
 bindings/rust/libgpiod/examples/gpiowatch.rs  |   54 +
 bindings/rust/libgpiod/src/chip.rs            |  310 +++++
 bindings/rust/libgpiod/src/edge_event.rs      |   93 ++
 bindings/rust/libgpiod/src/event_buffer.rs    |  167 +++
 bindings/rust/libgpiod/src/info_event.rs      |   69 +
 bindings/rust/libgpiod/src/lib.rs             |  479 +++++++
 bindings/rust/libgpiod/src/line_config.rs     |  135 ++
 bindings/rust/libgpiod/src/line_info.rs       |  162 +++
 bindings/rust/libgpiod/src/line_request.rs    |  227 ++++
 bindings/rust/libgpiod/src/line_settings.rs   |  297 +++++
 bindings/rust/libgpiod/src/request_config.rs  |   95 ++
 bindings/rust/libgpiod/tests/chip.rs          |   98 ++
 bindings/rust/libgpiod/tests/common/config.rs |  143 ++
 bindings/rust/libgpiod/tests/common/mod.rs    |   10 +
 bindings/rust/libgpiod/tests/edge_event.rs    |  298 +++++
 bindings/rust/libgpiod/tests/info_event.rs    |  167 +++
 bindings/rust/libgpiod/tests/line_config.rs   |   96 ++
 bindings/rust/libgpiod/tests/line_info.rs     |  276 ++++
 bindings/rust/libgpiod/tests/line_request.rs  |  510 +++++++
 bindings/rust/libgpiod/tests/line_settings.rs |  204 +++
 .../rust/libgpiod/tests/request_config.rs     |   39 +
 configure.ac                                  |   16 +
 48 files changed, 6504 insertions(+), 11 deletions(-)
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

