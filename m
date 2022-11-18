Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73B7962F2DE
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Nov 2022 11:45:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241780AbiKRKpx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Nov 2022 05:45:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241782AbiKRKpY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2022 05:45:24 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD20D97084
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 02:45:05 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id 4so4252650pli.0
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 02:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yGY30DuB5f9MAWVXe4gMa8Bs2Y459ZfpkLn3OxCvudU=;
        b=XWAVJ6yjPzMESV7DR1fnd9ECPbrhKmC+S0RICyBiUGKMKWKbL328lqih9Nhmf+bNtY
         Ct6rMCjy1fsjC5YN0D/lXPYbXQyH8V6OSp7yFpx1j+Elw+PXM2sZ+/d9axOtPono09JL
         s1OmGn40F4cE5Ivi1ylKT1GJJ0saZWdBsLnQxxKF0+O2JXjwHWqpdyQbVtko/McdezNb
         VVWnfHdRrs41iaMEdGoILYSyQSDnzsjXjeaJbVgAdhtGXg/7NpzBsY9zvAjKZMWpuzUx
         wHscW4B95kIBR8MN62xKTQH49cx9EvFI6YS/uKqnWpsA50OGz8ZOzVg/fIgKHnW7v2Kr
         RuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yGY30DuB5f9MAWVXe4gMa8Bs2Y459ZfpkLn3OxCvudU=;
        b=q/oPu5vF2zy0HwwZ+aGI32RAkgim9lVxeUd3RIvRJGNfs4lHWpG8rAd96/yVh9ehq7
         1E6Oeed+kAcloUr3CS/CBNjVWqviBadImRai9u3PDoMe/9UWeTlsjQ5xAjdwnPDNuBQD
         n1V2GOTSwCToMGzN5p6g+a1/6xsPg9CZqjrsiFhz1yHOknVpYz+pPDmM5RprdUtlF0n9
         AMuFANkQZiF/rbDFFRk7i/iWkxZVpEjSDIppAexVXMQ9UPn+Aq+jIFR4wNA3+ILZ6pPn
         h0qpQzGY1tpP91pQuY1mNbqm3z4BPCJIQKPZGAgysYOz6gOn/83u5gggFrXxw8lqOqHc
         v3uA==
X-Gm-Message-State: ANoB5plt1SUsIxSThgmUoFEj1fa9vUU4vNznZnnc2SxZSEJOlRlFOjPY
        QdOqOeRI8Eyb2PQMBYcQhskCRg==
X-Google-Smtp-Source: AA0mqf5y82APQBrrBCWanlKlFIkNerHKqlFvYQItpZuAFe51En8bx7Bwv6WG4Lki8I9/cqyrkwBnCQ==
X-Received: by 2002:a17:902:7049:b0:186:d5b9:fbcd with SMTP id h9-20020a170902704900b00186d5b9fbcdmr7235461plt.64.1668768304934;
        Fri, 18 Nov 2022 02:45:04 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id y15-20020aa79aef000000b00565cbad9616sm2835983pfp.6.2022.11.18.02.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 02:45:04 -0800 (PST)
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
Subject: [libgpiod][PATCH V10 0/6] libgpiod: Add Rust bindings
Date:   Fri, 18 Nov 2022 16:14:36 +0530
Message-Id: <cover.1668768040.git.viresh.kumar@linaro.org>
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

https://github.com/vireshk/libgpiod v10

V9->V10:
- Removed auto-built bindings.rs files.
- Updated license and copyright information for all files.
- Renamed gpiosim crate as gpiosim-sys.
- Cargo specific .gitnore changes moved to bindings/rust/.gitignore.
- Fixed few SAFETY comments.
- Added Reviewed-by tag from Kent. Since the changes were all minor, I haven't
  dropped them.

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

Viresh Kumar (6):
  bindings: rust: Add libgpiod-sys rust crate
  bindings: rust: Add libgpiod crate
  bindings: rust: Add gpiosim-sys crate
  bindings: rust: Add examples to libgpiod crate
  bindings: rust: Add tests for libgpiod crate
  bindings: rust: Integrate building of bindings with make

 README                                        |   8 +-
 TODO                                          |   8 -
 bindings/Makefile.am                          |   6 +
 bindings/rust/.gitignore                      |   4 +
 bindings/rust/Cargo.toml                      |  11 +
 bindings/rust/Makefile.am                     |  19 +
 bindings/rust/gpiosim-sys/Cargo.toml          |  23 +
 bindings/rust/gpiosim-sys/README.md           |  14 +
 bindings/rust/gpiosim-sys/build.rs            |  43 ++
 bindings/rust/gpiosim-sys/src/lib.rs          |  74 +++
 bindings/rust/gpiosim-sys/src/sim.rs          | 330 ++++++++++++
 bindings/rust/libgpiod-sys/Cargo.toml         |  21 +
 bindings/rust/libgpiod-sys/README.md          |  14 +
 bindings/rust/libgpiod-sys/build.rs           |  41 ++
 bindings/rust/libgpiod-sys/src/lib.rs         |  11 +
 bindings/rust/libgpiod/Cargo.toml             |  25 +
 .../rust/libgpiod/examples/gpio_events.rs     |  88 +++
 .../examples/gpio_threaded_info_events.rs     | 132 +++++
 bindings/rust/libgpiod/examples/gpiodetect.rs |  30 ++
 bindings/rust/libgpiod/examples/gpiofind.rs   |  36 ++
 bindings/rust/libgpiod/examples/gpioget.rs    |  45 ++
 bindings/rust/libgpiod/examples/gpioinfo.rs   |  97 ++++
 bindings/rust/libgpiod/examples/gpiomon.rs    |  74 +++
 bindings/rust/libgpiod/examples/gpioset.rs    |  63 +++
 bindings/rust/libgpiod/examples/gpiowatch.rs  |  53 ++
 bindings/rust/libgpiod/src/chip.rs            | 309 +++++++++++
 bindings/rust/libgpiod/src/edge_event.rs      |  92 ++++
 bindings/rust/libgpiod/src/event_buffer.rs    | 168 ++++++
 bindings/rust/libgpiod/src/info_event.rs      |  68 +++
 bindings/rust/libgpiod/src/lib.rs             | 478 ++++++++++++++++
 bindings/rust/libgpiod/src/line_config.rs     | 134 +++++
 bindings/rust/libgpiod/src/line_info.rs       | 161 ++++++
 bindings/rust/libgpiod/src/line_request.rs    | 226 ++++++++
 bindings/rust/libgpiod/src/line_settings.rs   | 296 ++++++++++
 bindings/rust/libgpiod/src/request_config.rs  |  94 ++++
 bindings/rust/libgpiod/tests/chip.rs          |  97 ++++
 bindings/rust/libgpiod/tests/common/config.rs | 142 +++++
 bindings/rust/libgpiod/tests/common/mod.rs    |   9 +
 bindings/rust/libgpiod/tests/edge_event.rs    | 297 ++++++++++
 bindings/rust/libgpiod/tests/info_event.rs    | 166 ++++++
 bindings/rust/libgpiod/tests/line_config.rs   |  95 ++++
 bindings/rust/libgpiod/tests/line_info.rs     | 275 ++++++++++
 bindings/rust/libgpiod/tests/line_request.rs  | 509 ++++++++++++++++++
 bindings/rust/libgpiod/tests/line_settings.rs | 203 +++++++
 .../rust/libgpiod/tests/request_config.rs     |  38 ++
 configure.ac                                  |  16 +
 46 files changed, 5132 insertions(+), 11 deletions(-)
 create mode 100644 bindings/rust/.gitignore
 create mode 100644 bindings/rust/Cargo.toml
 create mode 100644 bindings/rust/Makefile.am
 create mode 100644 bindings/rust/gpiosim-sys/Cargo.toml
 create mode 100644 bindings/rust/gpiosim-sys/README.md
 create mode 100644 bindings/rust/gpiosim-sys/build.rs
 create mode 100644 bindings/rust/gpiosim-sys/src/lib.rs
 create mode 100644 bindings/rust/gpiosim-sys/src/sim.rs
 create mode 100644 bindings/rust/libgpiod-sys/Cargo.toml
 create mode 100644 bindings/rust/libgpiod-sys/README.md
 create mode 100644 bindings/rust/libgpiod-sys/build.rs
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

