Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE274CFD0B
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Mar 2022 12:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237268AbiCGLfU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Mar 2022 06:35:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237616AbiCGLfD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Mar 2022 06:35:03 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 089C51EEC5
        for <linux-gpio@vger.kernel.org>; Mon,  7 Mar 2022 03:34:04 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id t11so22757296wrm.5
        for <linux-gpio@vger.kernel.org>; Mon, 07 Mar 2022 03:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GTMVy+J1s1AK24bwtVamFEk3ScxMaD1OlLHMt4WgD18=;
        b=obYAnGfjc5cLq9VgfbnJyNMe08C31A+bMBinAnl7Lvjdp5msky0NhbJ2dM/dAdw6Sc
         /mfCrtBfhapOifLc6mjHQh4GHZnlVMjS+StVm0Fa/ccijRmL/MsqLV7wwwQhpojkzvBo
         G80HYxeBVRd6vkiLkDwbnXRxII9aRmW3zEXTe43YNqXKGwZLW3QI4S1ufOWehSkWbXkT
         b1Lrd01wP5AtmGb1SexhRDGdiNymKc99diwqg+q5jhd6Bmwj4y+Kk8vkz3GJ/J64V5bR
         yf4mDn+JM9JmXXhTCfUEt6zEv1KWtF8TuNe+Kx0ciuIrlaTcXypEH8LmVGeup4LLBZHm
         SFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GTMVy+J1s1AK24bwtVamFEk3ScxMaD1OlLHMt4WgD18=;
        b=Q4UjtfGksrOtjJFX3KPHY7L0luLfx8GCCxKfTeYLcsTbAmcP3Gteu6I3IprgLnZwX8
         MiUPqrcaD+pdHrtkrbPWgKxY3Yx8SDAJ/uHSAwpRmnavOpvHKqY26oBMr3cEN76PjOak
         xyl9+Bs5Hgy2e5QBVmx7g61QOedwr8XkpzlWUFK8eK/nQ8ZaEWx5TKw1nAles1o0KNYA
         kl4cGMNK9bMkQdVl2qkeMbhg6APWFZANdf7qHSnj0+QbcLXuJR/PyhwPk9F7RWyYpbFQ
         g1yr/4KO4iz2pH7LELB4sfFIFkkuindkvztSvjNZLzIehPZMydOv+pWLk/ZxMsTIYin+
         Jpxw==
X-Gm-Message-State: AOAM532nAQE2iIOqFXdV8410IJY4bViOhlh5YwxBjGdBtcMe0QmtaEKw
        gvKKadEVWqRzwFN7c7TZVp+CiA==
X-Google-Smtp-Source: ABdhPJxHEhuCdP+rEB2594O5izofjnZNOxzbj9sMLkD5LSTm4XvOWiXhbqLW0Qvt6i0kBW1qR2Xf/w==
X-Received: by 2002:a5d:6d86:0:b0:1f1:f938:6626 with SMTP id l6-20020a5d6d86000000b001f1f9386626mr2700343wrs.701.1646652843347;
        Mon, 07 Mar 2022 03:34:03 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id g11-20020a5d554b000000b001f0326a23ddsm11363510wrw.70.2022.03.07.03.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 03:34:03 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH v4 0/2] libgpiod v2: rewrite tests for the C library
Date:   Mon,  7 Mar 2022 12:33:59 +0100
Message-Id: <20220307113401.224584-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

v1 -> v2:
- drop applied patches
- improve documentation
- skip offsets that are overridden in line_config but not actually requested

v2 -> v3:
- add a patch adding an enum for line values
- rework the mechanism for retrieving overrides
- add new "constructors" for line_config
- incorporate part of Kent's points in the documentation
- a bunch of improvements to tests as per Kent's reviews

v3 -> v4:
- drop the new constructors added in v3
- improve the docs for override interfaces
- use NUM_OVERRIDES_MAX when referring to the max number of overrides

Bartosz Golaszewski (2):
  line-config: expose the override logic to users
  tests: rewrite core C tests using libgpiosim

 configure.ac                 |    8 +-
 include/gpiod.h              |  573 ++++++++++++------
 lib/line-config.c            |  808 ++++++++++++++++---------
 tests/Makefile.am            |   22 +-
 tests/gpiod-test-helpers.c   |   49 ++
 tests/gpiod-test-helpers.h   |  139 +++++
 tests/gpiod-test-sim.c       |  308 ++++++++++
 tests/gpiod-test-sim.h       |   42 ++
 tests/gpiod-test.c           |  233 +-------
 tests/gpiod-test.h           |   83 +--
 tests/gpiosim/gpiosim.c      |    1 +
 tests/mockup/Makefile.am     |   11 -
 tests/mockup/gpio-mockup.c   |  496 ----------------
 tests/mockup/gpio-mockup.h   |   36 --
 tests/tests-chip.c           |  282 ++++-----
 tests/tests-edge-event.c     |  490 +++++++++++++++
 tests/tests-event.c          |  908 ----------------------------
 tests/tests-info-event.c     |  301 ++++++++++
 tests/tests-line-config.c    |  457 ++++++++++++++
 tests/tests-line-info.c      |  318 ++++++++++
 tests/tests-line-request.c   |  526 ++++++++++++++++
 tests/tests-line.c           | 1091 ----------------------------------
 tests/tests-misc.c           |   80 ++-
 tests/tests-request-config.c |   90 +++
 tools/gpioget.c              |    6 +-
 tools/gpiomon.c              |    6 +-
 tools/gpioset.c              |    9 +-
 27 files changed, 3878 insertions(+), 3495 deletions(-)
 create mode 100644 tests/gpiod-test-helpers.c
 create mode 100644 tests/gpiod-test-helpers.h
 create mode 100644 tests/gpiod-test-sim.c
 create mode 100644 tests/gpiod-test-sim.h
 delete mode 100644 tests/mockup/Makefile.am
 delete mode 100644 tests/mockup/gpio-mockup.c
 delete mode 100644 tests/mockup/gpio-mockup.h
 create mode 100644 tests/tests-edge-event.c
 delete mode 100644 tests/tests-event.c
 create mode 100644 tests/tests-info-event.c
 create mode 100644 tests/tests-line-config.c
 create mode 100644 tests/tests-line-info.c
 create mode 100644 tests/tests-line-request.c
 delete mode 100644 tests/tests-line.c
 create mode 100644 tests/tests-request-config.c

-- 
2.30.1

