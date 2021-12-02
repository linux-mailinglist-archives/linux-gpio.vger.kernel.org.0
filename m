Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F75A46623C
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Dec 2021 12:22:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357298AbhLBL0T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Dec 2021 06:26:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346343AbhLBL0T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Dec 2021 06:26:19 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66FCAC06174A
        for <linux-gpio@vger.kernel.org>; Thu,  2 Dec 2021 03:22:57 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id 8so27590100pfo.4
        for <linux-gpio@vger.kernel.org>; Thu, 02 Dec 2021 03:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lZAwfohp4NeqX1ovsApVwslIPxiLYbl3IAEWh8cLg8I=;
        b=bRB9qc12sjKmLuq9TUHuZIBzGs5hJ4MqNdtb6Ht8wAsdJK0hMEWRJMOvBJYVDaNU81
         XKmolbaLxaOuMOc9lUBYSGNFJctd4WW/c2TcMO0ZlCFDfNSUs4QhXi9vwCTalxN+QhvL
         icPoN7kF7c93yFh+L+cWxl+/mC7my6klliN+1RkGeNAmz6XKNE6R4hRpyc2lg5D1/BkI
         05QwpG7vP0pI7OHP3DfzKURflhZA69X8L9EFLduXVX7lYQ/fpS8V+8x470eDyvo/B3mP
         1LbNypRaMwYnjlgChX6H5arcW3hE7sQFYbgRJSbu3YmZjqKDBqB21tYFi+N4f5/9L4Td
         HZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lZAwfohp4NeqX1ovsApVwslIPxiLYbl3IAEWh8cLg8I=;
        b=yiPC5ouvHrjgEppE9BFn3jjtTLoF7hftDcLIWzHlzWWFdQLlWaOy8r0loIfcImVgp5
         /dNw/vxx+4ldSLamDr5RyhVcuP/m2vJw3VXNA/K7M7j98veb21xjKd5v1i/GOb/MHOFf
         mm5MBdDSO+5pOAa1FxI7wq7QX43NTSj1c935IBjJ4KsnOVMJ23ceIw4kMlncMolvAryA
         sCg61eAXy2FEC6jY1kOcc5/AeyAkt6VW0YK7+Xa400DUSQfxuXWt+9Kbauk3F1QMUV2d
         Srt8cvYxI/nJYTsjWkQhc4jgOiFsI89Twt3D0qThsezLXytXVQdHfbxFCoRQ6lmxpzvE
         ICIQ==
X-Gm-Message-State: AOAM530NdY/KPpjByKgHtpiCuNh+ZlOr5XvlL582v1MkoqyCj8ho5k0d
        dWcn7WWa4jEaGylOE/qhhWNRADQZrJ/6Fg==
X-Google-Smtp-Source: ABdhPJxks90rrQGBbnRlQk3RmT2RpmFZcII4RzJzSzIPQ8Q2o2jzMbn77Lvq9df0roP3j7BuNB0ncA==
X-Received: by 2002:a05:6a00:1744:b0:4a4:f4e6:1cc0 with SMTP id j4-20020a056a00174400b004a4f4e61cc0mr11691746pfc.15.1638444176899;
        Thu, 02 Dec 2021 03:22:56 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id p33sm2326312pgm.85.2021.12.02.03.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 03:22:55 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Subject: [PATCH V2 0/4] libgpiod: Add Rust bindings
Date:   Thu,  2 Dec 2021 16:52:45 +0530
Message-Id: <cover.1638443930.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

This patch adds rust bindings for libgpiod v2.0, this is already partially
tested with the virtio rust backend I am developing, which uses these to talk to
the host kernel.

This is based of the next/post-libgpiod-2.0 branch.

I will be adding testing infrastructure later on, once other bindings are
converted to use gpiosim.

V1->V2:
- Added examples (I tested everything except gpiomon.rs, didn't have right
  hardware/mock device to test).
- Build rust bindings as part of Make, update documentation.

Thanks.

--
Viresh

Viresh Kumar (4):
  libgpiod: Generate rust FFI bindings
  libgpiod: Add rust wrappers
  rust: Add examples
  rust: Integrate building of rust bindings with make

 .gitignore                           |   5 +
 README                               |   8 +-
 TODO                                 |   8 -
 bindings/Makefile.am                 |   6 +
 bindings/rust/Cargo.toml             |  14 +
 bindings/rust/Makefile.am            |  29 ++
 bindings/rust/build.rs               |  60 ++++
 bindings/rust/examples/gpiodetect.rs |  38 +++
 bindings/rust/examples/gpiofind.rs   |  43 +++
 bindings/rust/examples/gpioget.rs    |  45 +++
 bindings/rust/examples/gpioinfo.rs   |  90 ++++++
 bindings/rust/examples/gpiomon.rs    |  73 +++++
 bindings/rust/examples/gpioset.rs    |  55 ++++
 bindings/rust/src/bindings.rs        |  16 +
 bindings/rust/src/chip.rs            | 197 ++++++++++++
 bindings/rust/src/edge_event.rs      |  78 +++++
 bindings/rust/src/event_buffer.rs    |  59 ++++
 bindings/rust/src/info_event.rs      |  70 +++++
 bindings/rust/src/lib.rs             | 268 +++++++++++++++++
 bindings/rust/src/line_config.rs     | 431 +++++++++++++++++++++++++++
 bindings/rust/src/line_info.rs       | 186 ++++++++++++
 bindings/rust/src/line_request.rs    | 217 ++++++++++++++
 bindings/rust/src/request_config.rs  | 118 ++++++++
 bindings/rust/wrapper.h              |   2 +
 configure.ac                         |  16 +
 25 files changed, 2121 insertions(+), 11 deletions(-)
 create mode 100644 bindings/rust/Cargo.toml
 create mode 100644 bindings/rust/Makefile.am
 create mode 100644 bindings/rust/build.rs
 create mode 100644 bindings/rust/examples/gpiodetect.rs
 create mode 100644 bindings/rust/examples/gpiofind.rs
 create mode 100644 bindings/rust/examples/gpioget.rs
 create mode 100644 bindings/rust/examples/gpioinfo.rs
 create mode 100644 bindings/rust/examples/gpiomon.rs
 create mode 100644 bindings/rust/examples/gpioset.rs
 create mode 100644 bindings/rust/src/bindings.rs
 create mode 100644 bindings/rust/src/chip.rs
 create mode 100644 bindings/rust/src/edge_event.rs
 create mode 100644 bindings/rust/src/event_buffer.rs
 create mode 100644 bindings/rust/src/info_event.rs
 create mode 100644 bindings/rust/src/lib.rs
 create mode 100644 bindings/rust/src/line_config.rs
 create mode 100644 bindings/rust/src/line_info.rs
 create mode 100644 bindings/rust/src/line_request.rs
 create mode 100644 bindings/rust/src/request_config.rs
 create mode 100644 bindings/rust/wrapper.h

-- 
2.31.1.272.g89b43f80a514

