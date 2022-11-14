Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D53F862751D
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 05:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235484AbiKNEB0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Nov 2022 23:01:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235468AbiKNEBZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Nov 2022 23:01:25 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C5AEDEA3
        for <linux-gpio@vger.kernel.org>; Sun, 13 Nov 2022 20:01:20 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id 62so891726pgb.13
        for <linux-gpio@vger.kernel.org>; Sun, 13 Nov 2022 20:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wtnWgnDap6e5nrrEHKoEi4mfUZ3vgmp/3c4z7rNJa4c=;
        b=pR195AWaxPIcF6vjNny0vonqrnY1ZgzGyfR9d5D4uSWVdUfedVQx/ARD4tDgQp7OEa
         GCMxuchCShTWdxqNH2IL9lauuIoY2ZqdaLHBUvNkYR/TR0UbZZt7bIBDdpUuuF6YnyIy
         z81JDo8K3zI87YUtsFfTbOGyEE9v5oYETrtoXmYZMt8TDdqLmcU00Mwf+xP/fFTCQS69
         mHYK9Ns0Jjmwj/xASg0v55/lfW9bGrf68Bq/7EuyGr/oWNJPc6oHQnSuVMIp0QtU1C/C
         gamuWmOyeLufHffnZWmRW8X8o4zI7+RU79CvBUThNASYzHwv50VGfR4BRthZp+FcBCw8
         rIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wtnWgnDap6e5nrrEHKoEi4mfUZ3vgmp/3c4z7rNJa4c=;
        b=kDRhe4ukbhivAVyxhSo4Z83jGiT8n9jaxUU6tFv9zHcBkMyqxSkg69FH0EOod7oskZ
         dwCTeeCjuXmlIJHrTdV5ygyZxlSNFQy3SA2TIYi1H8vjy2HGoBikSQQjbAi+2m+B+H8u
         GKmhE1jCzy4A1LTsdgD9ORigniXS56tnp3YjCcBf1Wbhg08XD0QmuRPpI0oVTWuHYl1Z
         Ice6hff9Wgipj7R4gxu6bLk8cehQCXQd0R9VKhhswziI47x0S0jPtHK+tVXSdBzpUB/F
         FPqIfLqdH3bSdhDxe5S4Smt25bDVCQkKdVlNHkQlfGZHlh2dubtDVBJHGNSAe+ypjFo/
         jQyA==
X-Gm-Message-State: ANoB5plHZADVgljO8j2F4/uB8CDPxFR21S/w7Y7vSKyLLPrhid5PVkNz
        X8CU5VvSBldjitetv7Aw4ojVEOYNR+M=
X-Google-Smtp-Source: AA0mqf66/DATmkNAwsgPuGDfvxtI7DxgnpcQnKa2VsCC8bvN4dXGVPZeEt4vz0g9j6qanAqT6W+lIw==
X-Received: by 2002:a63:cf48:0:b0:473:f7cd:6603 with SMTP id b8-20020a63cf48000000b00473f7cd6603mr10541987pgj.336.1668398479788;
        Sun, 13 Nov 2022 20:01:19 -0800 (PST)
Received: from sol.home.arpa (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id f11-20020a170902684b00b001801aec1f6bsm6018636pln.141.2022.11.13.20.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 20:01:19 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH v4 0/5] tools: improvements for v2
Date:   Mon, 14 Nov 2022 12:00:57 +0800
Message-Id: <20221114040102.66031-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series is an optimistic reimagining of the tools intended to
simplify usage for well configured systems, i.e. for systems where lines
can be uniquely identified by name.  In such systems the chip and offset
location of the line is no longer of relevance to the user, so the tools
should be able to operate without mentioning them.
e.g.
  gpioget GPIO17

  gpioset GPIO17=active

  gpiomon --localtime GPIO17 GPIO18 

It is accepted that the kernel does not guarantee line name uniqueness
within the system, or even within a chip, and not all systems are well
configured, so the tools retain the option to identify lines by chip
and offset.  The hope and expectation is that over time systems will
become more well configured, not less, and identification of GPIO lines
by name will become the norm.

The core of the series is patch 1 which is a reworking of the tools to
support identifying lines by name, and to operate across multiple GPIO
chips if named lines are located on different chips.
The gpioset tool is extended to support toggling lines and interactive
control of line values, so some common use cases can be trivially
implemented from the command line.
e.g.
  gpioset --toggle 500ms LED=on

will blink the LED line at 1Hz, indefinitely.
More complex outputs can be generated by adding more entries to the
toggle sequence:
  gpioset --toggle 1s,2s,1s,300ms LED=on

Even more complex outputs can be generated by driving gpioset in
interactive mode from another script.

Those are the major changes.  A more complete list of the changes can be
found in the patch description.

The core tool changes are contained in patch 2.  To simplify review,
patch 1 removes old code replaced by that in patch 2 and 3.
Patch 1 also removes gpiofind, as that tools functionality is absorbed
by the other commands, particularly gpioinfo.

Patch 3 updates and extends the tool tests to cover the reworked tools,
including demonstrating gpioset being driven interactively via a script.

Patch 4 adds a gpionotify tool that monitors changes to the state line
information, similar to the gpio-watch tool in the kernel, and
patch 5 extends the test suite to cover it.

Cheers,
Kent.

Changes v3 -> v4:
  - rebase on master following merge with next/libgpiod-2.0
  - C style comments - again.
  - rename gpiowatch to gpionotify
  - make gpioset interactive mode optional, enabled with
    --enable-gpioset-interactive.
  - gpioset does not exit by default
  - add a banner option to gpioset as it can be long lived
  - make some functions and variables static
  - move parse_periods_or_die from tools-common to gpioset
  - quote line and consumer names
  - add option to not quote line and consumer names
  - always use bool, not int, for command line flags
  - add --consumer option to commands that request lines (get/set/mon)
  - move parse_periods_or_die() from tools-common to gpioset

Changes v2 -> v3:
  - squash removal of gpiofind into patch 1 (was patch 6).
  - rebase to C API line_config changes.
  - rework line name to chip/offset resolution to improve clarity and
    better handle corner cases.
  - drop bias=as-is as a command line option as that is the default
    behaviour.
  - revise gpioinfo output format to combine the used flag and consumer
    name, and to remove the brackets around the list of attributes.
  - gpiowatch: rework so it is more like gpiomon than the Linux gpio-watch
    tool.  More details in patch 4.
  - quote text from the command line when used in error messages.
  - improve test suite coverage of corner cases.
  - gpiomon: rename --edge option to --edges, and drop "-edges" from the
    possible values, e.g. --edges=rising.
  - add hte support to gpiomon.
  - gpiomon: decouple selection of event clock from timestamp output
    formatting.

Changes v1 -> v2:
  - code formatting, particularly trying to keep to the 80 character
    limit and C style comments.
  - move global config fields into the struct config for each tool.
  - switch gpioset from readline to libedit.
  - add tests for symlink chip path behaviour.
  - long lived tools flush stdout before blocking.
  - fix copyrights
  - replace gpiosim attr lookup functions with cached values.
  - remove gpiofind

Kent Gibson (5):
  tools: remove old code to simplify review
  tools: line name focussed rework
  tools: tests for line name focussed rework
  tools: add gpionotify
  tools: gpionotify tests

 configure.ac               |   24 +-
 man/Makefile.am            |    2 +-
 tools/.gitignore           |    2 +-
 tools/Makefile.am          |   12 +-
 tools/gpio-tools-test      |    3 -
 tools/gpio-tools-test.bats | 3079 ++++++++++++++++++++++++++++--------
 tools/gpiodetect.c         |  122 +-
 tools/gpiofind.c           |   93 --
 tools/gpioget.c            |  252 +--
 tools/gpioinfo.c           |  388 ++---
 tools/gpiomon.c            |  584 ++++---
 tools/gpionotify.c         |  445 ++++++
 tools/gpioset.c            | 1057 ++++++++++---
 tools/tools-common.c       |  712 ++++++++-
 tools/tools-common.h       |   98 +-
 15 files changed, 5265 insertions(+), 1608 deletions(-)
 delete mode 100644 tools/gpiofind.c
 create mode 100644 tools/gpionotify.c

-- 
2.38.1

