Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C11B35FA948
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Oct 2022 02:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbiJKA3l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Oct 2022 20:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiJKA3j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Oct 2022 20:29:39 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF521786E7
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2022 17:29:31 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id h10so11762541plb.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2022 17:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G4s62PH5BmZ9z5ZUQlgjPgrt8V6L0e1OsdYDQqJeDQk=;
        b=pjHx3wMxMblhVbf1PeFaevIADbjE0ItlWc3mCB9l/Di6jg1f4J5q5W4gaWmsFBqcFj
         VXiYyMWqcMzY1+ZkdPbxGaz/AGxTnPPw2pmxaLsYKwP2bLDqpvIx+CG3p67v050MhGJS
         CQx3syTQYQsJj9McQeeN5gfbnD4OBQiRRR2yTCsSIqhPlUCXYEoVVUJuPmFz8eD4nThb
         NYIVdgTtmZIoeCz3vETA4b0PtmObK2S3s/99BoiK86KTK0WzCLz8ATZqKzWjDK0ffmcA
         UPFzF2Fpyxl0dKkT/kK2gV/aKcr8UpwMT45A8ZT18t1t7hLV1/z0VzuAacSVq+WBzQf/
         Z42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G4s62PH5BmZ9z5ZUQlgjPgrt8V6L0e1OsdYDQqJeDQk=;
        b=pu9gjnFLnjC3iRJNuZ+Q1KCRsUFgOz0n8Okqp3gxh0c5+rJsECqJj9AvyovAb1331r
         wUa1yK39eMhnxin9s0IWhhCyeZxK1ZR2Yfu2sJ7xqE3wz3k7f+zMXEmY+q+5XeaBrscb
         yDp/NC8i3lFNrMwUAASM5igjtj9LzFaeudQOw/kzYtcyUJmRO1vGf8iyyK6fJ8AvzIo9
         zhQNjlsj3FLYe2fvyCULtW16MTEff3Q0OJ9PJFlJMCRhOm105r7umW8kHW4JrM1B4ug2
         1RJAxWmeoOGSLfbsXUql+eT+nKZWuIgpFDbYnG1cIQKMMiN0kg3BqNZO2M9xK0IEoLeq
         OEzg==
X-Gm-Message-State: ACrzQf0rL3ECRzIT8GDm06+gWtKyNa99JfxYnTUxoy0Xog0Me/XQEBle
        7kwByBiYanUIIcw46zuETzr8Zyxn3jY=
X-Google-Smtp-Source: AMsMyM40c3cb4+ZvRQmYVcLEmgMBvUzVwN4C65awKb/JHN/Yro8PKUWoXq8Aj1tjjwy5wDeRriThyQ==
X-Received: by 2002:a17:90b:3e82:b0:20d:2fa1:d071 with SMTP id rj2-20020a17090b3e8200b0020d2fa1d071mr11683905pjb.58.1665448171160;
        Mon, 10 Oct 2022 17:29:31 -0700 (PDT)
Received: from sol.home.arpa (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id y69-20020a62ce48000000b005377c74c409sm7541351pfg.4.2022.10.10.17.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 17:29:30 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH v3 0/5] tools: improvements for v2
Date:   Tue, 11 Oct 2022 08:29:04 +0800
Message-Id: <20221011002909.26987-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.38.0
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

Patch 4 adds a gpiowatch tool that monitors changes to the state line
information, similar to the gpio-watch tool in the kernel, and
patch 5 extends the test suite to cover it.

Cheers,
Kent.

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
  tools: add gpiowatch
  tools: gpiowatch tests

 configure.ac               |    8 +-
 man/Makefile.am            |    2 +-
 tools/.gitignore           |    2 +-
 tools/Makefile.am          |    6 +-
 tools/gpio-tools-test      |    3 -
 tools/gpio-tools-test.bats | 2970 ++++++++++++++++++++++++++++--------
 tools/gpiodetect.c         |  122 +-
 tools/gpiofind.c           |   93 --
 tools/gpioget.c            |  231 +--
 tools/gpioinfo.c           |  373 +++--
 tools/gpiomon.c            |  566 ++++---
 tools/gpioset.c            |  955 +++++++++---
 tools/gpiowatch.c          |  433 ++++++
 tools/tools-common.c       |  732 ++++++++-
 tools/tools-common.h       |   99 +-
 15 files changed, 4993 insertions(+), 1602 deletions(-)
 delete mode 100644 tools/gpiofind.c
 create mode 100644 tools/gpiowatch.c

-- 
2.38.0

