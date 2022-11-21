Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6743A631E27
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Nov 2022 11:23:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231350AbiKUKXS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Nov 2022 05:23:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbiKUKXP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Nov 2022 05:23:15 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8E1B20BDA
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 02:23:09 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id 136so10774782pga.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 02:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SMB6ThgwZW+0F3Glisf2/HdbefeggAqPkC8ofTRrVHg=;
        b=JnxZULYoIw851cDppyiS4JU9gh5IH4wTgm+XDS4DtVwrSvBJhsEUAdChm959ILaGPk
         A0AQoDh4n7pQxKJ7BciCxeJAvdw7nWGGCt4uzXONxi/DXEXQCZDXGLZvme/fJJ41C0yM
         tCbtXcS6Tq1+aMeUotNI+v3IeYZOyeiyos8DvJ+RIo90BLaTrs72naEQdy3HyMCjzVI7
         nhKxDCe5NTjnXxSfQYrGlyYo7WQEq5jmFmy93QMMNCLB7qEosR0H2GG+9yDJZTAVyQva
         69Ofh7QnXJy9YiWddqDkNFFvDauWbuAWqAuWKye5h8i20g1RCEoxsIJp0zeooUNzz/Bu
         whqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SMB6ThgwZW+0F3Glisf2/HdbefeggAqPkC8ofTRrVHg=;
        b=pioApTOwKRCMeh3NRdw8zBVywdKXIUIDY+mnM9dt48A1r5Edfk/wAQ4DNZAsDGzf09
         WpCkc8zdq35YHxqRh2BBC5gUYSBUnton/RedSrtLh47JcjUJYt9NS69zrfJAkzpqOTNl
         IqK0boB08SRc+CgoQQl47Rs9jkCEHmMRG95im6UiAaNQFIMuwlMdJpSV1VZTZPAY9fx9
         WdjFTE9GRk9feBDj9stGTGYrhnYOIWIsQNaJxXw9D8O4tlf/Y5/MYFrPd0BO+SfNIMTc
         kXseI1Grs/9F9mtvxixocIEqgjgiS+5Z5tZns81kq8exINUOWHWKPNwFc30rmitLMIjv
         sT6Q==
X-Gm-Message-State: ANoB5pkqtaPs4xMIcMzLz9syNvXsb2UDT7n1cFpfqMi5DnDQIREssGPd
        iAPLWjAlJpOqLjl2W5WfeUG3giiPcv4=
X-Google-Smtp-Source: AA0mqf6Jsn2pK/g4eKBRX1agzASzhflat5wuj8eaK4jn5q74uEA9A1bav7AAmTH2BhLl7URDA87CpA==
X-Received: by 2002:a63:e104:0:b0:43c:756:eb71 with SMTP id z4-20020a63e104000000b0043c0756eb71mr2137817pgh.480.1669026189111;
        Mon, 21 Nov 2022 02:23:09 -0800 (PST)
Received: from sol.home.arpa (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id s184-20020a625ec1000000b0056ba7ce4d5asm8347419pfb.52.2022.11.21.02.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 02:23:08 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH v5 0/6] tools: improvements for v2
Date:   Mon, 21 Nov 2022 18:22:47 +0800
Message-Id: <20221121102253.38306-1-warthog618@gmail.com>
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

Patch 6 updates the README with examples for the updated tools.

Cheers,
Kent.

Changes v4 -> v5:
  - fix gpiomon --unquoted, which was only partially implemented in v4.
  - add tests for --unquoted for those tools overlooked in v4 (gpioinfo,
    gpiomon, gpionotify).
  - restore check for timeout in gpio-tools-test.
  - allow gpioset --daemonize --interactive, in which case stdio files
    are inherited from the parent rather than being redirected to /dev/null.
    Not sure how useful this mode is, but don't see any harm in allowing it.
  - move test for gpioget --consumer from patch 3 to patch 5, as it requires
    gpionotify.
  - add support for quoted line names in commands to gpioset --interactive.
  - fix bugs in gpioset --interactive tab completion.  Tab completion for
    quoted line names is still a WIP and tab completion currently has no
    automated tests, as mentioned in the TODO.
  - Update tool examples in README (patch 6).

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

Kent Gibson (6):
  tools: remove old code to simplify review
  tools: line name focussed rework
  tools: tests for line name focussed rework
  tools: add gpionotify
  tools: gpionotify tests
  README: update Tools section for v2 tools

 README                     |  176 +-
 TODO                       |   12 +
 configure.ac               |   24 +-
 man/Makefile.am            |    2 +-
 tools/.gitignore           |    2 +-
 tools/Makefile.am          |   11 +-
 tools/gpio-tools-test      |    2 -
 tools/gpio-tools-test.bats | 3101 ++++++++++++++++++++++++++++--------
 tools/gpiodetect.c         |  122 +-
 tools/gpiofind.c           |   93 --
 tools/gpioget.c            |  252 +--
 tools/gpioinfo.c           |  388 ++---
 tools/gpiomon.c            |  586 ++++---
 tools/gpionotify.c         |  445 ++++++
 tools/gpioset.c            | 1117 ++++++++++---
 tools/tools-common.c       |  712 ++++++++-
 tools/tools-common.h       |   98 +-
 17 files changed, 5495 insertions(+), 1648 deletions(-)
 delete mode 100644 tools/gpiofind.c
 create mode 100644 tools/gpionotify.c

-- 
2.38.1

