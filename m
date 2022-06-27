Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5FA455CA6E
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 14:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236196AbiF0Np5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jun 2022 09:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233224AbiF0Np5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jun 2022 09:45:57 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE47F60EA
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 06:45:52 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id e63so9166922pgc.5
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 06:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lla/dV4P8q6Yu+FFRHw/erdzVl621or86MMCdAKoTnk=;
        b=J4aTBBA+VIN/89wqs8/fPh+nJsVUT6ctTThVDGj0hWVVXN/BipixaA7axoqFZ/NqfH
         v30An2OeykmgM99kWeLZRXd82GkB9GOz803BwrXKZAr9deEDE5MNQnTbgsQ8BQ6csjgI
         MJNoYGEd0nELWXeonmlkEjyA9vQd6FKCJ66an4d3nZNqxt5EKStXCBO7ss2bIH1NK7cP
         jVmZolew8YqDWhPNajtSNp/SRZFwJOwVMzlivlvrBZ9zBe42NUewRbMU2pn0nPqkkrOc
         11e3NAteXZxScnCQmw4/ZxS62Gc7kslaTxhSkeLNAepqKOBx9KIpdXspvhUILKfeN//5
         4SkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lla/dV4P8q6Yu+FFRHw/erdzVl621or86MMCdAKoTnk=;
        b=ka51GYBA9StAaOVVkZJTmIS5YBTC9GoVwVPj1vJU+MOYBXteE33slFkLw0ISMedo3l
         dtSvhyQV/FUug7VlRA/BaIjMpVu5bgjLN681IqdrY5//aZcw2lr/3lxIp/qZOcYPoQoE
         GV1+qVOV/lfu/kQ7gCNvyL45SQkOMl6xm/b5RQIZfC9Q9NPsvsXhPrrq8LK+3NcxwhlH
         fgjJ2sxO+JzltnYN/lEI4oX5l0C1qBwCqnA3xnyBvWDK0vFmriYMHdsctYfMrDOFRqSo
         p6GLxJM+CM4H+dqfW/lqtUdGK2iDwhNwo6AM5dMaT7HPqv6SVZtT3eflXuN9A8TEsrLA
         Xpaw==
X-Gm-Message-State: AJIora+b/EOlRuQUgIEu161871xBVrf1kEl70EMrg8lP3GuYbyvrKUTO
        CNE/kkY5KmP6ysXcklC0Mp+OEPPgUiI=
X-Google-Smtp-Source: AGRyM1ujKKe/PDLG5YlIyny8rhH61CY7rhQjO2mpeZgL9jOEFAWts/8tUjaJM5LOxgEAUZMSy2xQtQ==
X-Received: by 2002:a63:794e:0:b0:40d:99b:bb4 with SMTP id u75-20020a63794e000000b0040d099b0bb4mr13050477pgc.133.1656337551994;
        Mon, 27 Jun 2022 06:45:51 -0700 (PDT)
Received: from sol.home.arpa (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id b5-20020a170902bd4500b0016a565f3f34sm6783395plx.168.2022.06.27.06.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 06:45:51 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH 0/4] tools: line name focussed rework
Date:   Mon, 27 Jun 2022 21:44:43 +0800
Message-Id: <20220627134447.81927-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.36.1
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

Patch 2 updates and extends the tool tests to cover the reworked tools,
including demonstrating gpioset being driven interactively via a script.

The final two patches add a gpiowatch tool that monitors changes to 
the state line information, similar to the gpio-watch tool in the kernel,
and extend the test suite to cover it.

Cheers,
Kent.

Kent Gibson (4):
  tools: line name focussed rework
  tools: tests for line name focussed rework
  tools: add gpiowatch
  tools: gpiowatch tests

 configure.ac               |    9 +-
 man/Makefile.am            |    2 +-
 tools/.gitignore           |    1 +
 tools/Makefile.am          |    4 +-
 tools/gpio-tools-test      |    3 -
 tools/gpio-tools-test.bats | 2189 ++++++++++++++++++++++++++++--------
 tools/gpiodetect.c         |  108 +-
 tools/gpiofind.c           |  126 ++-
 tools/gpioget.c            |  200 ++--
 tools/gpioinfo.c           |  356 +++---
 tools/gpiomon.c            |  493 ++++----
 tools/gpioset.c            |  861 ++++++++++----
 tools/gpiowatch.c          |  214 ++++
 tools/tools-common.c       |  640 ++++++++++-
 tools/tools-common.h       |   59 +-
 15 files changed, 3927 insertions(+), 1338 deletions(-)
 create mode 100644 tools/gpiowatch.c

-- 
2.36.1

