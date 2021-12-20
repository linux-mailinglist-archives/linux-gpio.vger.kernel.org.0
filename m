Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E489047A871
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Dec 2021 12:17:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbhLTLRJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Dec 2021 06:17:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231171AbhLTLRI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Dec 2021 06:17:08 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70193C061574
        for <linux-gpio@vger.kernel.org>; Mon, 20 Dec 2021 03:17:08 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id b1-20020a17090a990100b001b14bd47532so9338201pjp.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Dec 2021 03:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=duPgSwbQrC4FIhuaBe/sSeCFQl9CUHGKP2gk06xlknA=;
        b=HRpTqCDujPfbDM2gq2f4iKkRPiRqifHbPuh9OFss9ubr+GQW6cBaw5kPWhrF+U7RJg
         fG4N5POtG884FtwkT3WP9vrULWdhR0fV3o5+ZZsGirKBzpNcBDKv9X3uiMU2Tg4KuEPY
         +8JPcCeOBZ3UlkekVWQLjpfBVL/b3Bc8nik6gO7eaCavYzhe6vN3A88/FKUTuz165ZOc
         uShh8W1AOOI9S7oyt+cnzMBMnQfta5//iG1sMf/yi8iZ5UIde+ZHcmnFsI1EnHUsGM9W
         Vs7PeKWa2eCGSj7QRu4nU1pq3w+gLT82CqIfFdjZ+z/KsbRNfk1qHoXG/s98S99jqyKN
         b0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=duPgSwbQrC4FIhuaBe/sSeCFQl9CUHGKP2gk06xlknA=;
        b=xOWU9/Y0j5yEUuaalEgoAKRj6XQqxkTJTcC6i4lhypJAmdcpQ9uOP3uod0v2l5H4kn
         yUjM8ybGdGV50dz3UsYrEPT9bvfWQu2QjvlLs0wFltinK0gB3ZAji3ePZosZ8/Y6neq0
         mm8xNayl+e8Q7KIT9/F3BSrEWcKUY++OF0F8zG+H+VzoJB8oTxYuNx/JqMon2mPgT0So
         Vgo9Wjw20G5+kJoXIipiXZ3ZJGEcp6rQ8QAN3j17UUoSunVl/k/hLvJ4ollGChAkEQFH
         ZLR3/n6Yabbxc9unW9jwWI2Km7jTRwFcajyAhZynPw0jXFRRtv69EN0UhHum2EOO0yt4
         nuEA==
X-Gm-Message-State: AOAM530hcrEVFZtR9F4C0FYHYGwsDAlYnT5+GMt8DG/W2n+J6poCUHFJ
        lidc1Oir15MuF5KBpmAl5yyhSg==
X-Google-Smtp-Source: ABdhPJygof90z3cD38hMiSr0ZR+nZyiC7Mwn5L8aPBc4NhbeQ9hzWUIoiNFQuTXLlWOjy+gWbNmq4A==
X-Received: by 2002:a17:90b:4d0a:: with SMTP id mw10mr27755868pjb.89.1639999027915;
        Mon, 20 Dec 2021 03:17:07 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id n6sm16410341pgk.43.2021.12.20.03.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 03:17:07 -0800 (PST)
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
Subject: [PATCH V3 0/4] libgpiod: Add Rust bindings
Date:   Mon, 20 Dec 2021 16:41:34 +0530
Message-Id: <cover.1639997241.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Here is another version of rust bindings for libgpiod v2.0, based of the
next/libgpiod-2.0.

I will be adding testing infrastructure later on, once other bindings are
converted to use gpiosim.

All the examples, including gpiomon, are tested now and work just fine.

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

Viresh Kumar (4):
  libgpiod: Add libgpiod-sys rust crate
  libgpiod: Add rust wrapper crate
  libgpiod: Add rust examples
  libgpiod: Integrate building of rust bindings with make

 .gitignore                            |   5 +
 README                                |   8 +-
 TODO                                  |   8 -
 bindings/Makefile.am                  |   6 +
 bindings/rust/Cargo.toml              |  11 +
 bindings/rust/Makefile.am             |  27 ++
 bindings/rust/examples/gpiodetect.rs  |  37 +++
 bindings/rust/examples/gpiofind.rs    |  42 +++
 bindings/rust/examples/gpioget.rs     |  42 +++
 bindings/rust/examples/gpioinfo.rs    |  89 ++++++
 bindings/rust/examples/gpiomon.rs     |  68 +++++
 bindings/rust/examples/gpioset.rs     |  52 ++++
 bindings/rust/libgpiod-sys/Cargo.toml |  12 +
 bindings/rust/libgpiod-sys/build.rs   |  60 ++++
 bindings/rust/libgpiod-sys/src/lib.rs |  16 ++
 bindings/rust/libgpiod-sys/wrapper.h  |   2 +
 bindings/rust/src/chip.rs             | 183 ++++++++++++
 bindings/rust/src/edge_event.rs       | 103 +++++++
 bindings/rust/src/event_buffer.rs     |  87 ++++++
 bindings/rust/src/info_event.rs       |  68 +++++
 bindings/rust/src/lib.rs              | 280 ++++++++++++++++++
 bindings/rust/src/line_config.rs      | 391 ++++++++++++++++++++++++++
 bindings/rust/src/line_info.rs        | 182 ++++++++++++
 bindings/rust/src/line_request.rs     | 214 ++++++++++++++
 bindings/rust/src/request_config.rs   | 119 ++++++++
 configure.ac                          |  16 ++
 26 files changed, 2117 insertions(+), 11 deletions(-)
 create mode 100644 bindings/rust/Cargo.toml
 create mode 100644 bindings/rust/Makefile.am
 create mode 100644 bindings/rust/examples/gpiodetect.rs
 create mode 100644 bindings/rust/examples/gpiofind.rs
 create mode 100644 bindings/rust/examples/gpioget.rs
 create mode 100644 bindings/rust/examples/gpioinfo.rs
 create mode 100644 bindings/rust/examples/gpiomon.rs
 create mode 100644 bindings/rust/examples/gpioset.rs
 create mode 100644 bindings/rust/libgpiod-sys/Cargo.toml
 create mode 100644 bindings/rust/libgpiod-sys/build.rs
 create mode 100644 bindings/rust/libgpiod-sys/src/lib.rs
 create mode 100644 bindings/rust/libgpiod-sys/wrapper.h
 create mode 100644 bindings/rust/src/chip.rs
 create mode 100644 bindings/rust/src/edge_event.rs
 create mode 100644 bindings/rust/src/event_buffer.rs
 create mode 100644 bindings/rust/src/info_event.rs
 create mode 100644 bindings/rust/src/lib.rs
 create mode 100644 bindings/rust/src/line_config.rs
 create mode 100644 bindings/rust/src/line_info.rs
 create mode 100644 bindings/rust/src/line_request.rs
 create mode 100644 bindings/rust/src/request_config.rs

-- 
2.31.1.272.g89b43f80a514

