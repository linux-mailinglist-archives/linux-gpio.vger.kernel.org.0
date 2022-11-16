Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 546EA62B982
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 11:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233917AbiKPKmb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 05:42:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238744AbiKPKmC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 05:42:02 -0500
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B294046D
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 02:29:59 -0800 (PST)
Received: by mail-vs1-xe2c.google.com with SMTP id a6so13231334vsc.5
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 02:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=elnd9tKNLxdbREQBxKLkPWwr3SE4ar0lKByWOJ131vc=;
        b=EomzGgnD+mOABm/9nlWFnbwXLI4de8BozT/J+O0jISM9JnYbr3F3M7avOlDZU3Mdx3
         EnweTsK0juKH35vwhygEHns/7tRrewxCeg3h6IPgAIVUKGlEx6+5qgfAZwFxjM2U/JO4
         faofS0GEu5n5nyZchjsEktMLxuAeBIsS1UJ+9Fm8oChaIiDn+5b8yBTSmbiNrYnxa0CO
         Kln/+4RmkIuaPN3RZo50skrHp+nUCbzn9vf0Zs0+o4GYj1g5JZvADXC7FqeRkSQeBa1u
         UhOK0RhJWVgJsu8UKuRy9wY2k9s8lrHhZjCh6eyZu+mS7LCC5HuzwUcqLuJuxsNv6Kje
         O2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=elnd9tKNLxdbREQBxKLkPWwr3SE4ar0lKByWOJ131vc=;
        b=rFrA988FnC1XDZfkxXnndH4A0irTERrb4O25buKo+aJz8U42/RedVCLcbCohr/1ZbE
         uYgDg3AvwUup8i5XeYiOj2+WGJdzmlkUq1bSKJGLd2yEdqPe+eaBVwoKYI/H7Jv2TELJ
         5edlvTh7dKYPYZKfxepJuFpNROwmK/+q0mGmViVwsRMje6/DUzDX0dvF4xyAM5gC4CXF
         wlsRK/s6iXlJHm4hiqqnI/6BJw4Xys/DYZHceTLHYQfSXMHf33UPX+mTEX3ARhzrC0Vn
         lW9Es7gPTJXbSxdzMI/L8RC8qIauSku2sMuv2U88Lb8ra3qP/fslLtmFjMGdWSRKWoBk
         0bfQ==
X-Gm-Message-State: ANoB5pkMgIzXPbZjlPQJJqXy/ZEoVHl7987F1sRzccAKu4a74AUllnEE
        C0vYWkFVpvXyiwESq2VOevKNOuAMez6WawAy9eSGRw==
X-Google-Smtp-Source: AA0mqf4WL5JMnYg4e9GHpIL6iF+iVeX2bFSM5LGh1UCA9lbGwlITFg5PLJmHfmMS0QhoKEsuXDb1bwnF7I/+JDN/bD8=
X-Received: by 2002:a67:6b03:0:b0:398:6504:9ece with SMTP id
 g3-20020a676b03000000b0039865049ecemr11313590vsc.16.1668594598554; Wed, 16
 Nov 2022 02:29:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1667815011.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1667815011.git.viresh.kumar@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 16 Nov 2022 11:29:47 +0100
Message-ID: <CAMRc=McWo-kUrMitbm-_YgeEYXx+ARneezAF-Tg7OMwgGydXkQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH V9 0/8] libgpiod: Add Rust bindings
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 7, 2022 at 10:57 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Hello,
>
> Here is another version of the rust bindings, based of the master branch.
>
> Pushed here:
>
> https://github.com/vireshk/libgpiod v9
>
> V8->V9:
> - Merged the last patch (supporting Events) with the other patches.
> - Events implementation is simplified and made efficient. nth() is also
>   implemented for the iterator.
> - Unnecessary comment removed from Cargo.toml files.
> - Updated categories in libgpiod's Cargo.toml.
> - Updated gpio_events example to show cloned events live past another
>   read_edge_events().
> - Implement AsRawFd for Chip.
> - Other minor changes.
>
> V7->V8:
> - Several updates to cargo.toml files, like license, version, etc.
> - Removed Sync support for chip and gpiosim.
> - Implemented, in a separate patch, iterator support for Events.
> - Fixed missing SAFETY comments.
> - Fixed build for 32 bit systems.
> - Use errno::Errno.
> - Removed Clone derive for many structures, that store raw pointers.
> - line setting helpers return the object back, so another helper can be called
>   directly on them. Also made all helpers public and used the same in tests and
>   example for single configurations.
> - Enums for gpiosim constants.
> - New examples to demonstrate parallelism and event handling.
> - Separated out HTE tests and marked as #[ignore] now.
> - Updated commit subjects.
> - Other minor changes.
>
> V6->V7:
> - Don't let buffer read new events if the earlier events are still referenced.
> - BufferIntenal is gone now, to make the above work.
> - Update example and tests too for the same.
>
> V5->V6:
> - Updates according to the new line-settings interface.
> - New file, line_settings.rs.
> - Renamed 'enum Setting' as 'SettingVal' to avoid conflicting names, as we also
>   have 'struct Settings' now.
> - Support for HTE clock type.
> - Implement 'Eq' for public structure/enums (reported by build).
> - Remove 'SettingKindMap' and 'SettingMap' as they aren't required anymore.
> - Updated tests based on new interface.
>
> V4->V5:
> - Arrange as workspace with crates for libgpiod-sys, libgpiod, gpiosim.
> - Use static libgpiod and libgpiosim libraries instead of rebuilding again.
> - Arrange in modules instead of flattened approach.
> - New enums like Setting and SettingKind and new types based on them SettingMap
>   and SettingKindMap.
> - New property independent helpers for line_config, like set_prop_default().
> - Improved tests/examples, new example for gpiowatch.
> - Add pre-built bindings for gpiosim too.
> - Many other changes.
>
> V3->V4:
> - Rebased on top of new changes, and made changes accordingly.
> - Added rust integration tests with gpiosim.
> - Found a kernel bug with tests, sent a patch for that to LKML.
>
> V2->V3:
> - Remove naming redundancy, users just need to do this now
>   use libgpiod:{Chip, Direction, LineConfig} now (Bartosz);
> - Fix lifetime issues between event-buffer and edge-event modules, the event
>   buffer is released after the last edge-event reference is dropped (Bartosz).
> - Allow edge-event to be copied, and freed later (Bartosz).
> - Add two separate rust crates, sys and wrapper (Gerard).
> - Null-terminate the strings passed to libgpiod (Wedson).
> - Drop unnecessary checks to validate string returned from chip:name/label/path.
> - Fix SAFETY comments (Wedson).
> - Drop unnecessary clone() instances (Bartosz).
>
> V1->V2:
> - Added examples (I tested everything except gpiomon.rs, didn't have right
>   hardware/mock device to test).
> - Build rust bindings as part of Make, update documentation.
>
> Thanks.
>
> --
> Viresh
>
> Viresh Kumar (8):
>   bindings: rust: Add libgpiod-sys rust crate
>   bindings: rust: Add pre generated bindings for libgpiod-sys
>   bindings: rust: Add gpiosim crate
>   bindings: rust: Add pre generated bindings for gpiosim
>   bindings: rust: Add libgpiod crate
>   bindings: rust: Add examples to libgpiod crate
>   bindings: rust: Add tests for libgpiod crate
>   bindings: rust: Integrate building of bindings with make
>
>  .gitignore                                    |    5 +
>  README                                        |    8 +-
>  TODO                                          |    8 -
>  bindings/Makefile.am                          |    6 +
>  bindings/rust/Cargo.toml                      |    7 +
>  bindings/rust/Makefile.am                     |   18 +
>  bindings/rust/gpiosim/Cargo.toml              |   22 +
>  bindings/rust/gpiosim/README.md               |   11 +
>  bindings/rust/gpiosim/build.rs                |   43 +
>  bindings/rust/gpiosim/src/bindings.rs         |  180 +++
>  bindings/rust/gpiosim/src/lib.rs              |   79 ++
>  bindings/rust/gpiosim/src/sim.rs              |  331 +++++
>  bindings/rust/libgpiod-sys/Cargo.toml         |   20 +
>  bindings/rust/libgpiod-sys/README.md          |   11 +
>  bindings/rust/libgpiod-sys/build.rs           |   41 +
>  bindings/rust/libgpiod-sys/src/bindings.rs    | 1173 +++++++++++++++++
>  bindings/rust/libgpiod-sys/src/lib.rs         |   13 +
>  bindings/rust/libgpiod/Cargo.toml             |   21 +
>  .../rust/libgpiod/examples/gpio_events.rs     |   89 ++
>  .../examples/gpio_threaded_info_events.rs     |  133 ++
>  bindings/rust/libgpiod/examples/gpiodetect.rs |   31 +
>  bindings/rust/libgpiod/examples/gpiofind.rs   |   37 +
>  bindings/rust/libgpiod/examples/gpioget.rs    |   46 +
>  bindings/rust/libgpiod/examples/gpioinfo.rs   |   98 ++
>  bindings/rust/libgpiod/examples/gpiomon.rs    |   75 ++
>  bindings/rust/libgpiod/examples/gpioset.rs    |   64 +
>  bindings/rust/libgpiod/examples/gpiowatch.rs  |   54 +
>  bindings/rust/libgpiod/src/chip.rs            |  310 +++++
>  bindings/rust/libgpiod/src/edge_event.rs      |   93 ++
>  bindings/rust/libgpiod/src/event_buffer.rs    |  167 +++
>  bindings/rust/libgpiod/src/info_event.rs      |   69 +
>  bindings/rust/libgpiod/src/lib.rs             |  479 +++++++
>  bindings/rust/libgpiod/src/line_config.rs     |  135 ++
>  bindings/rust/libgpiod/src/line_info.rs       |  162 +++
>  bindings/rust/libgpiod/src/line_request.rs    |  227 ++++
>  bindings/rust/libgpiod/src/line_settings.rs   |  297 +++++
>  bindings/rust/libgpiod/src/request_config.rs  |   95 ++
>  bindings/rust/libgpiod/tests/chip.rs          |   98 ++
>  bindings/rust/libgpiod/tests/common/config.rs |  143 ++
>  bindings/rust/libgpiod/tests/common/mod.rs    |   10 +
>  bindings/rust/libgpiod/tests/edge_event.rs    |  298 +++++
>  bindings/rust/libgpiod/tests/info_event.rs    |  167 +++
>  bindings/rust/libgpiod/tests/line_config.rs   |   96 ++
>  bindings/rust/libgpiod/tests/line_info.rs     |  276 ++++
>  bindings/rust/libgpiod/tests/line_request.rs  |  510 +++++++
>  bindings/rust/libgpiod/tests/line_settings.rs |  204 +++
>  .../rust/libgpiod/tests/request_config.rs     |   39 +
>  configure.ac                                  |   16 +
>  48 files changed, 6504 insertions(+), 11 deletions(-)
>  create mode 100644 bindings/rust/Cargo.toml
>  create mode 100644 bindings/rust/Makefile.am
>  create mode 100644 bindings/rust/gpiosim/Cargo.toml
>  create mode 100644 bindings/rust/gpiosim/README.md
>  create mode 100644 bindings/rust/gpiosim/build.rs
>  create mode 100644 bindings/rust/gpiosim/src/bindings.rs
>  create mode 100644 bindings/rust/gpiosim/src/lib.rs
>  create mode 100644 bindings/rust/gpiosim/src/sim.rs
>  create mode 100644 bindings/rust/libgpiod-sys/Cargo.toml
>  create mode 100644 bindings/rust/libgpiod-sys/README.md
>  create mode 100644 bindings/rust/libgpiod-sys/build.rs
>  create mode 100644 bindings/rust/libgpiod-sys/src/bindings.rs
>  create mode 100644 bindings/rust/libgpiod-sys/src/lib.rs
>  create mode 100644 bindings/rust/libgpiod/Cargo.toml
>  create mode 100644 bindings/rust/libgpiod/examples/gpio_events.rs
>  create mode 100644 bindings/rust/libgpiod/examples/gpio_threaded_info_events.rs
>  create mode 100644 bindings/rust/libgpiod/examples/gpiodetect.rs
>  create mode 100644 bindings/rust/libgpiod/examples/gpiofind.rs
>  create mode 100644 bindings/rust/libgpiod/examples/gpioget.rs
>  create mode 100644 bindings/rust/libgpiod/examples/gpioinfo.rs
>  create mode 100644 bindings/rust/libgpiod/examples/gpiomon.rs
>  create mode 100644 bindings/rust/libgpiod/examples/gpioset.rs
>  create mode 100644 bindings/rust/libgpiod/examples/gpiowatch.rs
>  create mode 100644 bindings/rust/libgpiod/src/chip.rs
>  create mode 100644 bindings/rust/libgpiod/src/edge_event.rs
>  create mode 100644 bindings/rust/libgpiod/src/event_buffer.rs
>  create mode 100644 bindings/rust/libgpiod/src/info_event.rs
>  create mode 100644 bindings/rust/libgpiod/src/lib.rs
>  create mode 100644 bindings/rust/libgpiod/src/line_config.rs
>  create mode 100644 bindings/rust/libgpiod/src/line_info.rs
>  create mode 100644 bindings/rust/libgpiod/src/line_request.rs
>  create mode 100644 bindings/rust/libgpiod/src/line_settings.rs
>  create mode 100644 bindings/rust/libgpiod/src/request_config.rs
>  create mode 100644 bindings/rust/libgpiod/tests/chip.rs
>  create mode 100644 bindings/rust/libgpiod/tests/common/config.rs
>  create mode 100644 bindings/rust/libgpiod/tests/common/mod.rs
>  create mode 100644 bindings/rust/libgpiod/tests/edge_event.rs
>  create mode 100644 bindings/rust/libgpiod/tests/info_event.rs
>  create mode 100644 bindings/rust/libgpiod/tests/line_config.rs
>  create mode 100644 bindings/rust/libgpiod/tests/line_info.rs
>  create mode 100644 bindings/rust/libgpiod/tests/line_request.rs
>  create mode 100644 bindings/rust/libgpiod/tests/line_settings.rs
>  create mode 100644 bindings/rust/libgpiod/tests/request_config.rs
>
> --
> 2.31.1.272.g89b43f80a514
>

Hi Viresh,

There are some licensing issues I noticed now: can you make sure
`reuse lint` doesn't return errors for rust bindings?

One other thing is the license of the rust bindings themselves - I'm
not a lawyer but it seems to me that if you link against LGPL code
statically, your code must be licensed under an LGPL-compatible
license. It seems that BSD-3-Clause and Apache-2.0 are compatible but
it would be great to have someone knowledgeable comment on that. Is
there anyone at linaro we could contact?

Bart
