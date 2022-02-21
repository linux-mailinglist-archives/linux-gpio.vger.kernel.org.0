Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5BD4BDD49
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Feb 2022 18:45:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233899AbiBUPke (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Feb 2022 10:40:34 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344348AbiBUPkc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Feb 2022 10:40:32 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 623D2220E9
        for <linux-gpio@vger.kernel.org>; Mon, 21 Feb 2022 07:40:05 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id j17so1107729wrc.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Feb 2022 07:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UwlPYM85IMjWgj6bkGfPm2+nHJ1vu3EuY0EbX/m/8d8=;
        b=fASDbV07f5DE4/+FCoWbreu8VrZFO1t3IWi8GcZRabEynuoG+6Uzy8P5SbD9GuG1dy
         cFajLYcSla0jPoxYIAhqaXEGCMGEl2ZynpkIbUPEiEVclIZuBeNJ10Al6++oaobcThBa
         ly0bBFNjmabg3rkL9TBOo3CpROqPVgkCTGxtaXiFSocWfd3hoHYNSrgnCjyC0zUrzO7U
         Xeweu2nGajksz+YAilNqEYFdjOPrdkW4bCqYokj8gXyH5DPMitqlletfR6LrRaYXiNbV
         eVDRTJ//QMba6KM4TRpREXNU2J93OaSwEeDQZGdo2ozHsRGDMhc+mcAf64M3VE9ROvRz
         RkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UwlPYM85IMjWgj6bkGfPm2+nHJ1vu3EuY0EbX/m/8d8=;
        b=0Km9el2rlLgTcODfNwmjlWjralKktOXC3dRZBPqZ528SjLVp/nDMedPoxLRmx0VwcG
         sPAwH1euxo15uTwr0MRK5sCYHXV4M4iQZcAq6GW++RlLjSqO1/DDYJtXEq9KMs1CO1Z6
         zMM9S7mdrEpRSLG8yP/cEma9iW3mmnNcWf2jfoyZiJIh9gNYS7YiyYXstlOWYaaK7D0i
         /AhTDJ/JygBc/y12MpKMdZQR2irxtseP53ZGHb9dWxMXZrYx2yx2xoRBFXGuZ/pTAkjp
         2z5AEKhK4cxblajTtBhbo6mNTBpVUZvrSQheh0QlgOi/40KVBu4IfraEzGnachdBVZ8h
         So8Q==
X-Gm-Message-State: AOAM532uXJ+JFsa1jryzFZ2I37nvk2yys4k/V2nXb3GthA05mp704wb9
        Ghl96FcYAhejFykESXegXFInSA==
X-Google-Smtp-Source: ABdhPJwI8udB862H1Udc/6h0g/2/RHFCOoz4IaPjcZuoZ9B8ZKjJ2hGjf+Gc2vkrsqHogQ6DtjEB+w==
X-Received: by 2002:a5d:6c64:0:b0:1e3:f40:8e47 with SMTP id r4-20020a5d6c64000000b001e30f408e47mr16399786wrz.453.1645458003926;
        Mon, 21 Feb 2022 07:40:03 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c12d100b0037c918292d4sm7494153wmd.28.2022.02.21.07.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 07:40:03 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH 0/2] libgpiod v2: rewrite tests for the C library
Date:   Mon, 21 Feb 2022 16:40:00 +0100
Message-Id: <20220221154002.654638-1-brgl@bgdev.pl>
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

This series contains a rework of the line_config interface and a bit patch
that replaces the old test suite for libgpiod v1 based on gpio-mockup with
a one covering around 95% of the libgpiod v2 code based on the upcoming
gpio-sim module.

v1 -> v2:
- drop applied patches
- improve documentation
- skip offsets that are overridden in line_config but not actually requested

Bartosz Golaszewski (2):
  line-config: expose the override logic to users
  tests: rewrite core C tests using libgpiosim

 configure.ac                 |    8 +-
 include/gpiod.h              |  509 ++++++++++------
 lib/line-config.c            |  752 ++++++++++++++---------
 tests/Makefile.am            |   20 +-
 tests/gpiod-test-helpers.c   |   49 ++
 tests/gpiod-test-helpers.h   |  139 +++++
 tests/gpiod-test-sim.c       |  303 ++++++++++
 tests/gpiod-test-sim.h       |   42 ++
 tests/gpiod-test.c           |  233 +-------
 tests/gpiod-test.h           |   81 +--
 tests/gpiosim/gpiosim.c      |    1 +
 tests/mockup/Makefile.am     |   11 -
 tests/mockup/gpio-mockup.c   |  496 ----------------
 tests/mockup/gpio-mockup.h   |   36 --
 tests/tests-chip.c           |  282 ++++-----
 tests/tests-edge-event.c     |  420 +++++++++++++
 tests/tests-event.c          |  908 ----------------------------
 tests/tests-info-event.c     |  301 ++++++++++
 tests/tests-line-config.c    |  448 ++++++++++++++
 tests/tests-line-info.c      |  316 ++++++++++
 tests/tests-line-request.c   |  468 +++++++++++++++
 tests/tests-line.c           | 1091 ----------------------------------
 tests/tests-misc.c           |   86 ++-
 tests/tests-request-config.c |   90 +++
 tools/gpioget.c              |    6 +-
 tools/gpiomon.c              |    6 +-
 tools/gpioset.c              |    9 +-
 27 files changed, 3630 insertions(+), 3481 deletions(-)
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

