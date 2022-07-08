Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A988F56B89E
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 13:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237345AbiGHLfM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 07:35:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237549AbiGHLfJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 07:35:09 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 357E6205C4
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jul 2022 04:35:06 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d5so16091140plo.12
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jul 2022 04:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aaRptiH0+7Ewt3AkoJLPfJNV9B0IDDacPkuPOJQLaiA=;
        b=cWfY70nc3/QlTfpETMD3huIoz4a0oDrCNtkBQemL/DSOfAqIFC9DWmX2S8F+iyAXgg
         W3pz4IQr1PdMEJRGPq8oEaHUBmT9FoPL4coUHbo8R53mBQFN86mm5afOC0mGRdg3qF98
         1w4j4ncHfUwUx+EkvO/QUFB4nrljklbWKoRovnliZ3pETJtay+sZ7B1GmmKyvuoAqYvx
         Q6pbryiEZ1rQJaYC4UY0tcB1wIZD9aT6WyFmVlq4+bSUznJx6UtCoslBiOexhkhkPoI6
         2sMUtIiJ0FaKtffr/tm9tkQRICxjWgstV+nOw4Fx1uboVfoWj18lqoo/MridoO+vCc1S
         vwRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aaRptiH0+7Ewt3AkoJLPfJNV9B0IDDacPkuPOJQLaiA=;
        b=RC88sBkFbZ9hq4GjIZtHfuWcTGtJyHLEEGBxvgW6eKCmjYercMuJQ/b8OrC8VEjIBM
         c9KBWz0eOrCko2rqIgdNPGpQtUt7gw5LtWfz24ZYDPI95kIbg9dr3jaZlR1RCFy3Lcoz
         yoetDk2J9qM9/pEnTqZ4M8BAYB3azlnOrHhlHAtkFgKsQ8PYxaVsfYW9JLAbnM4RrcJW
         KKlDenYt2xCMUi6IoCRNEXxurNIQ3gcemVhUkgCA0/c9NT+dXRDBUdcL1Db06GNmwsDZ
         aUFO1SBjxd8JX3iFPkIdK7wuE3ZfqyqIcnRomXCQ6fC4W/PB2FyPEZ8j73MNxEJNcktT
         jDlQ==
X-Gm-Message-State: AJIora8bbwlddGd2x61ezuhsy188OoxIhRRau+RYzw0Bo2lSkn+ora6G
        jgefq//AJKQz+1htQmh8c6gitg==
X-Google-Smtp-Source: AGRyM1uNDcpb5EaYhOki7nhuvEd/A2sJW9Oe7hGkMfrXENYjRqZ2J9pKeLFZDkEbtYJf+qujEI7Ejg==
X-Received: by 2002:a17:902:be16:b0:16c:151d:3e21 with SMTP id r22-20020a170902be1600b0016c151d3e21mr3247440pls.49.1657280105639;
        Fri, 08 Jul 2022 04:35:05 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id b5-20020a636705000000b00412a9c2217asm4105898pgc.64.2022.07.08.04.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 04:35:05 -0700 (PDT)
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
Subject: [PATCH V4 0/8] libgpiod: Add Rust bindings
Date:   Fri,  8 Jul 2022 17:04:53 +0530
Message-Id: <cover.1657279685.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
  libgpiod: Add pre generated rust bindings
  libgpiod-sys: Add support to generate gpiosim bindings
  libgpiod: Add rust wrapper crate
  libgpiod: Add rust examples
  libgpiod: Derive debug traits for few definitions
  libgpiod: Add rust tests
  libgpiod: Integrate building of rust bindings with make

 .gitignore                                   |    5 +
 README                                       |    8 +-
 TODO                                         |    8 -
 bindings/Makefile.am                         |    6 +
 bindings/rust/Cargo.toml                     |   15 +
 bindings/rust/Makefile.am                    |   18 +
 bindings/rust/examples/gpiodetect.rs         |   37 +
 bindings/rust/examples/gpiofind.rs           |   42 +
 bindings/rust/examples/gpioget.rs            |   42 +
 bindings/rust/examples/gpioinfo.rs           |   89 +
 bindings/rust/examples/gpiomon.rs            |   68 +
 bindings/rust/examples/gpioset.rs            |   52 +
 bindings/rust/libgpiod-sys/Cargo.toml        |   16 +
 bindings/rust/libgpiod-sys/README.md         |   10 +
 bindings/rust/libgpiod-sys/build.rs          |   84 +
 bindings/rust/libgpiod-sys/gpiosim_wrapper.h |    1 +
 bindings/rust/libgpiod-sys/src/bindings.rs   | 1920 ++++++++++++++++++
 bindings/rust/libgpiod-sys/src/lib.rs        |   20 +
 bindings/rust/libgpiod-sys/wrapper.h         |    2 +
 bindings/rust/src/chip.rs                    |  184 ++
 bindings/rust/src/chip_info.rs               |   70 +
 bindings/rust/src/edge_event.rs              |  105 +
 bindings/rust/src/event_buffer.rs            |   88 +
 bindings/rust/src/info_event.rs              |   68 +
 bindings/rust/src/lib.rs                     |  323 +++
 bindings/rust/src/line_config.rs             |  493 +++++
 bindings/rust/src/line_info.rs               |  190 ++
 bindings/rust/src/line_request.rs            |  249 +++
 bindings/rust/src/request_config.rs          |  122 ++
 bindings/rust/tests/chip.rs                  |   96 +
 bindings/rust/tests/common/config.rs         |  117 ++
 bindings/rust/tests/common/mod.rs            |   16 +
 bindings/rust/tests/common/sim.rs            |  306 +++
 bindings/rust/tests/edge_event.rs            |  389 ++++
 bindings/rust/tests/info_event.rs            |  126 ++
 bindings/rust/tests/line_config.rs           |  187 ++
 bindings/rust/tests/line_info.rs             |   90 +
 bindings/rust/tests/line_request.rs          |  234 +++
 bindings/rust/tests/request_config.rs        |   42 +
 configure.ac                                 |   16 +
 40 files changed, 5943 insertions(+), 11 deletions(-)
 create mode 100644 bindings/rust/Cargo.toml
 create mode 100644 bindings/rust/Makefile.am
 create mode 100644 bindings/rust/examples/gpiodetect.rs
 create mode 100644 bindings/rust/examples/gpiofind.rs
 create mode 100644 bindings/rust/examples/gpioget.rs
 create mode 100644 bindings/rust/examples/gpioinfo.rs
 create mode 100644 bindings/rust/examples/gpiomon.rs
 create mode 100644 bindings/rust/examples/gpioset.rs
 create mode 100644 bindings/rust/libgpiod-sys/Cargo.toml
 create mode 100644 bindings/rust/libgpiod-sys/README.md
 create mode 100644 bindings/rust/libgpiod-sys/build.rs
 create mode 100644 bindings/rust/libgpiod-sys/gpiosim_wrapper.h
 create mode 100644 bindings/rust/libgpiod-sys/src/bindings.rs
 create mode 100644 bindings/rust/libgpiod-sys/src/lib.rs
 create mode 100644 bindings/rust/libgpiod-sys/wrapper.h
 create mode 100644 bindings/rust/src/chip.rs
 create mode 100644 bindings/rust/src/chip_info.rs
 create mode 100644 bindings/rust/src/edge_event.rs
 create mode 100644 bindings/rust/src/event_buffer.rs
 create mode 100644 bindings/rust/src/info_event.rs
 create mode 100644 bindings/rust/src/lib.rs
 create mode 100644 bindings/rust/src/line_config.rs
 create mode 100644 bindings/rust/src/line_info.rs
 create mode 100644 bindings/rust/src/line_request.rs
 create mode 100644 bindings/rust/src/request_config.rs
 create mode 100644 bindings/rust/tests/chip.rs
 create mode 100644 bindings/rust/tests/common/config.rs
 create mode 100644 bindings/rust/tests/common/mod.rs
 create mode 100644 bindings/rust/tests/common/sim.rs
 create mode 100644 bindings/rust/tests/edge_event.rs
 create mode 100644 bindings/rust/tests/info_event.rs
 create mode 100644 bindings/rust/tests/line_config.rs
 create mode 100644 bindings/rust/tests/line_info.rs
 create mode 100644 bindings/rust/tests/line_request.rs
 create mode 100644 bindings/rust/tests/request_config.rs

-- 
2.31.1.272.g89b43f80a514

