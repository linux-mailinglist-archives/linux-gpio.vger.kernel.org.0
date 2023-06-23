Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBF5C73AF7C
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jun 2023 06:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbjFWEjk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jun 2023 00:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbjFWEj3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jun 2023 00:39:29 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8901269E
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2023 21:39:16 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-39ecbb4c7d3so158923b6e.3
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2023 21:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687495156; x=1690087156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8wYfBxPc2SQytyR8et1LirnUPJJ3bFPx+EZ56uxkD4M=;
        b=fyRtf7PBY1zneF57nbbcXnktpGf6WIyEHjt/Mfc1VDIo7fHDcr+7DujHnW96CBQF0J
         kfwB++WrbkfnEtRcC0LhC0wq432aUuDUa8vFQv5uPNFsgclBySQdlRBTubXTtJmy8u6D
         Kqqzd7IHs8jCBG3wFU+91qOWxHizZMS2Vvl6CY4py0sYvGRIUNnfHRlNDcwPR2VUXq7l
         F9LWJG4VRT2KqzYrSLIWcJl1fpHderPkLE+WeoHYa20SGwy6avdLJmCqM992/BY4btCD
         gvUN4rhoDPrjOxZoLITr5qo9Mm9ec5XeQGfBMLVnp/9DV+Hvsq1EJPX7N0tKaJswnTla
         1rBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687495156; x=1690087156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8wYfBxPc2SQytyR8et1LirnUPJJ3bFPx+EZ56uxkD4M=;
        b=dCMLigj1cBUR13VIRlu/w74wwzQ5G2pX52osH+XSMV9J03uwnhXGswjztYbxVSHcmr
         vbGs5J938Xx2oR4l50ToVakHa8oBKoBZwMgocYKK9GPJNwKWWj14k1F+bgiG1BExl+Dx
         ckdcFR/5FohuJIRbwpdn+SV9nSVytrLxNYCq8eB0T15G+fSulmdJ2Ga9/iDV1PBnCtgQ
         3xzf9oaY/6Aq5evJA92Flcf7xCHfkt6/BQ/HW7X7zeHNrsHPnKQRAHuQVUbgmRhEn1pZ
         Pzf4lSkSo7TP6cfKXArZRlXWC2b9XCPlXYconEFOw5PgQFT78uDDRMZYxju8QqkY9duK
         E6Kg==
X-Gm-Message-State: AC+VfDzwsUOKw4KUweHDEfWkAs8hGn4wwTfLMQEo159kK5PmizLuQNbQ
        C9xunkuZim7/EQmPgjymkZm5f9b1kjU=
X-Google-Smtp-Source: ACHHUZ7ACj8UpPIsLXHTSu+QOl8KikBhGzliEPlRnfC1HyQX0tZV3GTWPrtcd64j1YkSynfOqhB31g==
X-Received: by 2002:a05:6808:20b:b0:39a:a146:8bfe with SMTP id l11-20020a056808020b00b0039aa1468bfemr19864148oie.12.1687495155482;
        Thu, 22 Jun 2023 21:39:15 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id q23-20020a17090ad39700b0025c2c398d33sm509463pju.39.2023.06.22.21.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 21:39:15 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 0/8] replace tool examples with use case examples
Date:   Fri, 23 Jun 2023 12:38:53 +0800
Message-ID: <20230623043901.16764-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series is the continuation of providing a set of use case based examples
for libgpiod. The focus of this series is replacement of the examples
replicating the the tools with examples that minimally cover the use case that
each tool addresses.

The mapping from tool to use case is:
  gpiodetect  ->  get_chip_info
  gpiofind    ->  find_line_by_name
  gpioget     ->  get_multiple_line_values
  gpioinfo    ->  get_line_info
  gpiomon     ->  watch_multiple_line_values
  gpionotify  ->  watch_line_info
  gpioset     ->  toggle_multiple_line_values

Also added a watch_line_rising example to demonstrate getting events from only
one edge rather than both, so another gpiomon sub-case.

The rust bindings had a couple of additional examples, gpio_events and
gpio_threaded_info_events.

gpio_threaded_info_events is an example of using one thread to generate info
change events that are observed by another thread.  This is borrowed from test
cases and has no other practical application, but the reconfiguring component
inspired the reconfigure_input_to_output example.  That provides an example of
reconfiguring a requested line, and is provided for all languages, not just
rust.

gpio_events is an example of how borrowed buffered events must be cloned before
the event buffer can be reused.  This was simplified and renamed
buffered_event_lifetimes.  As I write this I realise it may also be applicable
to other languages - as an example of using gpiod_edge_event_copy().
Maybe provide those in v2, or a subsequent series?

The series is split into 8 parts.  For each language there is a patch that
provides some consistency cleanups to make the existing examples more consistent
with each other, with the examples in other languages, and with the examples to
follow. There are also a few minor bug fixes that didn't seem sufficiently
serious to warrant a separate patch.

The second patch for each language replaces the old tool examples with the new
use case based examples.

Cheers,
Kent.

Kent Gibson (8):
  core: examples: consistency cleanups
  core: examples: add more use case examples
  bindings: cxx: examples: consistency cleanup
  bindings: cxx: examples: replace tools examples with use case examples
  bindings: python: examples: consistency cleanup
  bindings: python: examples: replace tools examples with use case
    examples
  bindings: rust: examples: consistency cleanup
  bindings: rust: examples: replace tools examples with use case
    examples

 bindings/cxx/examples/.gitignore              |  16 +-
 bindings/cxx/examples/Makefile.am             |  42 ++---
 .../cxx/examples/async_watch_line_value.cpp   |   8 +-
 bindings/cxx/examples/find_line_by_name.cpp   |  42 +++++
 bindings/cxx/examples/get_chip_info.cpp       |  27 ++++
 bindings/cxx/examples/get_line_info.cpp       |  39 +++++
 bindings/cxx/examples/get_line_value.cpp      |  28 ++--
 .../cxx/examples/get_multiple_line_values.cpp |  40 +++++
 bindings/cxx/examples/gpiodetectcxx.cpp       |  30 ----
 bindings/cxx/examples/gpiofindcxx.cpp         |  32 ----
 bindings/cxx/examples/gpiogetcxx.cpp          |  40 -----
 bindings/cxx/examples/gpioinfocxx.cpp         |  61 -------
 bindings/cxx/examples/gpiomoncxx.cpp          |  65 --------
 bindings/cxx/examples/gpionotifycxx.cpp       |  55 -------
 bindings/cxx/examples/gpiosetcxx.cpp          |  53 ------
 .../examples/reconfigure_input_to_output.cpp  |  56 +++++++
 bindings/cxx/examples/toggle_line_value.cpp   |  16 +-
 .../examples/toggle_multiple_line_values.cpp  |  63 ++++++++
 bindings/cxx/examples/watch_line_info.cpp     |  49 ++++++
 bindings/cxx/examples/watch_line_rising.cpp   |  64 ++++++++
 bindings/cxx/examples/watch_line_value.cpp    |  12 +-
 .../examples/watch_multiple_line_values.cpp   |  60 +++++++
 bindings/python/examples/Makefile.am          |  18 ++-
 .../python/examples/async_watch_line_value.py |  15 +-
 bindings/python/examples/find_line_by_name.py |  37 +++++
 bindings/python/examples/get_chip_info.py     |  20 +++
 bindings/python/examples/get_line_info.py     |  29 ++++
 bindings/python/examples/get_line_value.py    |  13 +-
 .../examples/get_multiple_line_values.py      |  29 ++++
 bindings/python/examples/gpiodetect.py        |  15 --
 bindings/python/examples/gpiofind.py          |  20 ---
 bindings/python/examples/gpioget.py           |  29 ----
 bindings/python/examples/gpioinfo.py          |  28 ----
 bindings/python/examples/gpiomon.py           |  26 ---
 bindings/python/examples/gpionotify.py        |  21 ---
 bindings/python/examples/gpioset.py           |  36 -----
 bindings/python/examples/helpers.py           |  15 --
 .../examples/reconfigure_input_to_output.py   |  39 +++++
 bindings/python/examples/toggle_line_value.py |  34 ++--
 .../examples/toggle_multiple_line_values.py   |  47 ++++++
 bindings/python/examples/watch_line_info.py   |  23 +++
 bindings/python/examples/watch_line_rising.py |  31 ++++
 bindings/python/examples/watch_line_value.py  |  19 ++-
 .../examples/watch_multiple_line_values.py    |  43 +++++
 bindings/rust/libgpiod/examples/Makefile.am   |  21 +--
 .../examples/buffered_event_lifetimes.rs      |  58 +++++++
 .../libgpiod/examples/find_line_by_name.rs    |  29 ++++
 .../rust/libgpiod/examples/get_chip_info.rs   |  22 +++
 .../rust/libgpiod/examples/get_line_info.rs   |  37 +++++
 .../rust/libgpiod/examples/get_line_value.rs  |   4 +-
 .../examples/get_multiple_line_values.rs      |  29 ++++
 .../rust/libgpiod/examples/gpio_events.rs     |  88 ----------
 .../examples/gpio_threaded_info_events.rs     | 132 ---------------
 bindings/rust/libgpiod/examples/gpiodetect.rs |  30 ----
 bindings/rust/libgpiod/examples/gpiofind.rs   |  36 -----
 bindings/rust/libgpiod/examples/gpioget.rs    |  45 ------
 bindings/rust/libgpiod/examples/gpioinfo.rs   |  97 -----------
 bindings/rust/libgpiod/examples/gpiomon.rs    |  74 ---------
 bindings/rust/libgpiod/examples/gpionotify.rs |  53 ------
 bindings/rust/libgpiod/examples/gpioset.rs    |  63 --------
 bindings/rust/libgpiod/examples/gpiowatch.rs  |  53 ------
 .../examples/reconfigure_input_to_output.rs   |  42 +++++
 .../libgpiod/examples/toggle_line_value.rs    |  17 +-
 .../examples/toggle_multiple_line_values.rs   |  55 +++++++
 .../rust/libgpiod/examples/watch_line_info.rs |  32 ++++
 .../libgpiod/examples/watch_line_rising.rs    |  44 +++++
 .../libgpiod/examples/watch_line_value.rs     |  10 +-
 .../examples/watch_multiple_line_values.rs    |  46 ++++++
 examples/.gitignore                           |   9 ++
 examples/Makefile.am                          |  35 +++-
 examples/async_watch_line_value.c             |   6 +-
 examples/find_line_by_name.c                  | 111 +++++++++++++
 examples/get_chip_info.c                      |  40 +++++
 examples/get_line_info.c                      |  56 +++++++
 examples/get_line_value.c                     |  11 +-
 examples/get_multiple_line_values.c           | 119 ++++++++++++++
 examples/reconfigure_input_to_output.c        | 152 ++++++++++++++++++
 examples/toggle_line_value.c                  |  17 +-
 examples/toggle_multiple_line_values.c        | 136 ++++++++++++++++
 examples/watch_line_info.c                    |  72 +++++++++
 examples/watch_line_rising.c                  | 129 +++++++++++++++
 examples/watch_line_value.c                   |   6 +-
 examples/watch_multiple_line_values.c         | 140 ++++++++++++++++
 83 files changed, 2289 insertions(+), 1352 deletions(-)
 create mode 100644 bindings/cxx/examples/find_line_by_name.cpp
 create mode 100644 bindings/cxx/examples/get_chip_info.cpp
 create mode 100644 bindings/cxx/examples/get_line_info.cpp
 create mode 100644 bindings/cxx/examples/get_multiple_line_values.cpp
 delete mode 100644 bindings/cxx/examples/gpiodetectcxx.cpp
 delete mode 100644 bindings/cxx/examples/gpiofindcxx.cpp
 delete mode 100644 bindings/cxx/examples/gpiogetcxx.cpp
 delete mode 100644 bindings/cxx/examples/gpioinfocxx.cpp
 delete mode 100644 bindings/cxx/examples/gpiomoncxx.cpp
 delete mode 100644 bindings/cxx/examples/gpionotifycxx.cpp
 delete mode 100644 bindings/cxx/examples/gpiosetcxx.cpp
 create mode 100644 bindings/cxx/examples/reconfigure_input_to_output.cpp
 create mode 100644 bindings/cxx/examples/toggle_multiple_line_values.cpp
 create mode 100644 bindings/cxx/examples/watch_line_info.cpp
 create mode 100644 bindings/cxx/examples/watch_line_rising.cpp
 create mode 100644 bindings/cxx/examples/watch_multiple_line_values.cpp
 create mode 100755 bindings/python/examples/find_line_by_name.py
 create mode 100755 bindings/python/examples/get_chip_info.py
 create mode 100755 bindings/python/examples/get_line_info.py
 create mode 100755 bindings/python/examples/get_multiple_line_values.py
 delete mode 100755 bindings/python/examples/gpiodetect.py
 delete mode 100755 bindings/python/examples/gpiofind.py
 delete mode 100755 bindings/python/examples/gpioget.py
 delete mode 100755 bindings/python/examples/gpioinfo.py
 delete mode 100755 bindings/python/examples/gpiomon.py
 delete mode 100755 bindings/python/examples/gpionotify.py
 delete mode 100755 bindings/python/examples/gpioset.py
 delete mode 100644 bindings/python/examples/helpers.py
 create mode 100755 bindings/python/examples/reconfigure_input_to_output.py
 create mode 100755 bindings/python/examples/toggle_multiple_line_values.py
 create mode 100755 bindings/python/examples/watch_line_info.py
 create mode 100755 bindings/python/examples/watch_line_rising.py
 create mode 100755 bindings/python/examples/watch_multiple_line_values.py
 create mode 100644 bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs
 create mode 100644 bindings/rust/libgpiod/examples/find_line_by_name.rs
 create mode 100644 bindings/rust/libgpiod/examples/get_chip_info.rs
 create mode 100644 bindings/rust/libgpiod/examples/get_line_info.rs
 create mode 100644 bindings/rust/libgpiod/examples/get_multiple_line_values.rs
 delete mode 100644 bindings/rust/libgpiod/examples/gpio_events.rs
 delete mode 100644 bindings/rust/libgpiod/examples/gpio_threaded_info_events.rs
 delete mode 100644 bindings/rust/libgpiod/examples/gpiodetect.rs
 delete mode 100644 bindings/rust/libgpiod/examples/gpiofind.rs
 delete mode 100644 bindings/rust/libgpiod/examples/gpioget.rs
 delete mode 100644 bindings/rust/libgpiod/examples/gpioinfo.rs
 delete mode 100644 bindings/rust/libgpiod/examples/gpiomon.rs
 delete mode 100644 bindings/rust/libgpiod/examples/gpionotify.rs
 delete mode 100644 bindings/rust/libgpiod/examples/gpioset.rs
 delete mode 100644 bindings/rust/libgpiod/examples/gpiowatch.rs
 create mode 100644 bindings/rust/libgpiod/examples/reconfigure_input_to_output.rs
 create mode 100644 bindings/rust/libgpiod/examples/toggle_multiple_line_values.rs
 create mode 100644 bindings/rust/libgpiod/examples/watch_line_info.rs
 create mode 100644 bindings/rust/libgpiod/examples/watch_line_rising.rs
 create mode 100644 bindings/rust/libgpiod/examples/watch_multiple_line_values.rs
 create mode 100644 examples/find_line_by_name.c
 create mode 100644 examples/get_chip_info.c
 create mode 100644 examples/get_line_info.c
 create mode 100644 examples/get_multiple_line_values.c
 create mode 100644 examples/reconfigure_input_to_output.c
 create mode 100644 examples/toggle_multiple_line_values.c
 create mode 100644 examples/watch_line_info.c
 create mode 100644 examples/watch_line_rising.c
 create mode 100644 examples/watch_multiple_line_values.c

-- 
2.41.0

