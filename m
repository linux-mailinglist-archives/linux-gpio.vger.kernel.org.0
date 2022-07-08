Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 827DA56B949
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 14:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237474AbiGHMHs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 08:07:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiGHMHs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 08:07:48 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B8B9CE0D
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jul 2022 05:07:35 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 145so22172514pga.12
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jul 2022 05:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TbZhzP7kuWS9bzskXmMRzoVjWEZkp4iu+uu/M1YYJzU=;
        b=Mb05n2WqydSl/pwRWV/yegtlpyu43Ht9iLVMMSxPDhFZHWKzKQbEch4qNMNyM4JCPq
         f33uR8mTDVa+f6t2dTjEk3np9dGxi7bpBcVcQpB4XPAgfzHzOvgRi4f1PduN8T8pGqwy
         7N9nfO/TBVjMkVNU7EvTW8SXS1v8gud1Hwzbt3RjiQX3HkfJ6BLfATbfncO8RYriTkSP
         /rQkW5GMK6w+kstyakMGCwsfNq5hy3bWCwEsoLXHZ/J0GZID9XHlTeNOaXxABcs2SZdZ
         w9X/33RMKYkdOkDDbfspdLAJyIng2j3Pi+i74CgTQqf5POVM7gIRPaLmFQ+JYlP/gK2a
         Fiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TbZhzP7kuWS9bzskXmMRzoVjWEZkp4iu+uu/M1YYJzU=;
        b=13cAUwccfeQnc/k0yJT5c/TLL/AJkk6Q6EU2ErNcXirV0hRwqNQqjQlZWGrBZ/x3Bw
         zKe/SI9yu6wUW1pljUemiuOF0vUTQy0E6OZo0iobQmIt1gLy9CJxGU8KK3aH3FT5VdLx
         YQQIUootflj+apsR2w1jxkE6fxWkUasFp4DHi3Nywp6YGjHGTY+oII0swsxFxyKeukp3
         KHUlPW7qBMwGQ7HIB+RBBSnHJYxkksh/iiBBgPPj5Ga8FmYP2T2YStVpkJveKeGwG7xY
         J/IVwXNUZTkexpWMMbD+XZNLX1PDJnqa/L7J22AZVX75redceVSjFmlcbrwcKc5NGi0z
         SLTw==
X-Gm-Message-State: AJIora8BCoKUc0tN6go9fAXXB/VozOgaaxLZX+swC1JYmvhwk7g2R9CG
        qCZH0JW4Vi9FctzzyDH0kuARN4kD2b8=
X-Google-Smtp-Source: AGRyM1vMlNmf7mIXgp5ySuNGtP/hPY86QYLokAH8YwxmAJem0z8MlMTFcciQ6SzVrrzwrrCPkRmdlg==
X-Received: by 2002:a63:9547:0:b0:408:be53:b599 with SMTP id t7-20020a639547000000b00408be53b599mr3026448pgn.463.1657282054633;
        Fri, 08 Jul 2022 05:07:34 -0700 (PDT)
Received: from sol.home.arpa (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b0016bfafffa0esm6490312plq.227.2022.07.08.05.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 05:07:34 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH v2 0/6] tools: improvements for v2
Date:   Fri,  8 Jul 2022 20:06:20 +0800
Message-Id: <20220708120626.89844-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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

Patch 3 updates and extends the tool tests to cover the reworked tools,
including demonstrating gpioset being driven interactively via a script.

Patch 4 adds a gpiowatch tool that monitors changes to the state line
information, similar to the gpio-watch tool in the kernel, and
patch 5 extends the test suite to cover it.

Patch 6 removes the gpiofind tool, as the other tools now perform
the name to offset search themselves.

Cheers,
Kent.

Changes V1 -> v2:
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
  tools: add gpiowatch
  tools: gpiowatch tests
  tools: remove gpiofind

 configure.ac               |    8 +-
 man/Makefile.am            |    2 +-
 tools/.gitignore           |    1 +
 tools/Makefile.am          |    6 +-
 tools/gpio-tools-test      |    3 -
 tools/gpio-tools-test.bats | 2639 +++++++++++++++++++++++++++---------
 tools/gpiodetect.c         |  122 +-
 tools/gpiofind.c           |   93 --
 tools/gpioget.c            |  214 +--
 tools/gpioinfo.c           |  363 +++--
 tools/gpiomon.c            |  524 ++++---
 tools/gpioset.c            |  944 +++++++++----
 tools/gpiowatch.c          |  231 ++++
 tools/tools-common.c       |  679 +++++++++-
 tools/tools-common.h       |   63 +-
 15 files changed, 4355 insertions(+), 1537 deletions(-)
 delete mode 100644 tools/gpiofind.c
 create mode 100644 tools/gpiowatch.c

-- 
2.37.0

