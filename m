Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51341632DE5
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Nov 2022 21:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbiKUU0S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Nov 2022 15:26:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230370AbiKUU0Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Nov 2022 15:26:16 -0500
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7BC759FD2
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 12:26:09 -0800 (PST)
Received: by mail-vk1-xa2c.google.com with SMTP id u9so4376244vkk.4
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 12:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RgIsAO3AhGvAw0m2pZ8P2dnePX1vlxN3iR4rXNmyy7I=;
        b=obr5NttptFPpUTJ55+zaPfk9TIEJXf96R6GVaT42RDyW1xhS6Qxx2TbFreayF7UxhG
         WbuPAJp4hD091N880KYXqyW1/qxBXxBya8j6ESlVsSf326z6VvfZ4k0Vfteuvr59Sqvv
         7mfL8pBEtiIj//xUgWWp3DuRsSmQmIOWDk9hoCcI6m5+kg2o/NHKWfGuS0uqbWzAAst1
         wfT+tuDtB6cc2aDfHA6aUsKJ9BzCnzvu74mXZ6abWBOXc9VJWeH0lBIuJXUOfOfbAJ//
         s2Sevs1Fk0CXxvd/PW33q/5XwuImmfnp0VQC0TRXR9H5e6VwHW0gujM2V6pmt/HUN57B
         dzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RgIsAO3AhGvAw0m2pZ8P2dnePX1vlxN3iR4rXNmyy7I=;
        b=1ugV32aZjmkRUb7890Rp7M7qexW9k16giXAvlXGKLx8YhwgTyF+TqaFEJFmroKcaOy
         +2ApqVMjJTOoSX2fHPapCvwgtNiOZR7KjkiWhuEcxzhMZZqPtsq+26CVxTcRwY35E0t+
         R/h38lKLpUXo0Hw+y3wTVRjcoOveSDyAE6ZbS5FmCwhoDLQBsCGCd/tTQYZ933JTQZFI
         Kv6b//Zlr1S3w1KJBzAZR4Y3jCioNfAnl5ULFaxSXT68eXn0pm8u8Sa95wWyXEePwGIq
         KzigC7+MxbPVXNxUEQuadwOjUfKT0RQrXzCeA7MTjIqkrrMWFLednDY8ZlVFu3EJYacm
         oFxQ==
X-Gm-Message-State: ANoB5pmL4XkX79m/JNURJAYgBHNz8cXpDuL1Eis8CdJakTSx7Kev4I9E
        mkFKxS4+DcaE5ECSHNynXaEYEi6TPJLf2birFsxwmrPP9sU=
X-Google-Smtp-Source: AA0mqf7PLBFvrYNizIUcnUo9VjF08rIK5wrfucENMV9E9PyfDmX1sK0pbO+tDwjJ3lMYfVT12iQUsQDaO3KhcvsWrGM=
X-Received: by 2002:a1f:1854:0:b0:3bc:6e40:8088 with SMTP id
 81-20020a1f1854000000b003bc6e408088mr5345026vky.3.1669062368737; Mon, 21 Nov
 2022 12:26:08 -0800 (PST)
MIME-Version: 1.0
References: <20221121102253.38306-1-warthog618@gmail.com>
In-Reply-To: <20221121102253.38306-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 21 Nov 2022 21:25:58 +0100
Message-ID: <CAMRc=MeEDdNz+o8xdBaTpVTUhQfj4F23xR0=AQW4vByfGquj=A@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v5 0/6] tools: improvements for v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 21, 2022 at 11:23 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> This patch series is an optimistic reimagining of the tools intended to
> simplify usage for well configured systems, i.e. for systems where lines
> can be uniquely identified by name.  In such systems the chip and offset
> location of the line is no longer of relevance to the user, so the tools
> should be able to operate without mentioning them.
> e.g.
>   gpioget GPIO17
>
>   gpioset GPIO17=active
>
>   gpiomon --localtime GPIO17 GPIO18
>
> It is accepted that the kernel does not guarantee line name uniqueness
> within the system, or even within a chip, and not all systems are well
> configured, so the tools retain the option to identify lines by chip
> and offset.  The hope and expectation is that over time systems will
> become more well configured, not less, and identification of GPIO lines
> by name will become the norm.
>
> The core of the series is patch 1 which is a reworking of the tools to
> support identifying lines by name, and to operate across multiple GPIO
> chips if named lines are located on different chips.
> The gpioset tool is extended to support toggling lines and interactive
> control of line values, so some common use cases can be trivially
> implemented from the command line.
> e.g.
>   gpioset --toggle 500ms LED=on
>
> will blink the LED line at 1Hz, indefinitely.
> More complex outputs can be generated by adding more entries to the
> toggle sequence:
>   gpioset --toggle 1s,2s,1s,300ms LED=on
>
> Even more complex outputs can be generated by driving gpioset in
> interactive mode from another script.
>
> Those are the major changes.  A more complete list of the changes can be
> found in the patch description.
>
> The core tool changes are contained in patch 2.  To simplify review,
> patch 1 removes old code replaced by that in patch 2 and 3.
> Patch 1 also removes gpiofind, as that tools functionality is absorbed
> by the other commands, particularly gpioinfo.
>
> Patch 3 updates and extends the tool tests to cover the reworked tools,
> including demonstrating gpioset being driven interactively via a script.
>
> Patch 4 adds a gpionotify tool that monitors changes to the state line
> information, similar to the gpio-watch tool in the kernel, and
> patch 5 extends the test suite to cover it.
>
> Patch 6 updates the README with examples for the updated tools.
>
> Cheers,
> Kent.
>
> Changes v4 -> v5:
>   - fix gpiomon --unquoted, which was only partially implemented in v4.
>   - add tests for --unquoted for those tools overlooked in v4 (gpioinfo,
>     gpiomon, gpionotify).
>   - restore check for timeout in gpio-tools-test.
>   - allow gpioset --daemonize --interactive, in which case stdio files
>     are inherited from the parent rather than being redirected to /dev/null.
>     Not sure how useful this mode is, but don't see any harm in allowing it.
>   - move test for gpioget --consumer from patch 3 to patch 5, as it requires
>     gpionotify.
>   - add support for quoted line names in commands to gpioset --interactive.
>   - fix bugs in gpioset --interactive tab completion.  Tab completion for
>     quoted line names is still a WIP and tab completion currently has no
>     automated tests, as mentioned in the TODO.
>   - Update tool examples in README (patch 6).
>
> Changes v3 -> v4:
>   - rebase on master following merge with next/libgpiod-2.0
>   - C style comments - again.
>   - rename gpiowatch to gpionotify
>   - make gpioset interactive mode optional, enabled with
>     --enable-gpioset-interactive.
>   - gpioset does not exit by default
>   - add a banner option to gpioset as it can be long lived
>   - make some functions and variables static
>   - move parse_periods_or_die from tools-common to gpioset
>   - quote line and consumer names
>   - add option to not quote line and consumer names
>   - always use bool, not int, for command line flags
>   - add --consumer option to commands that request lines (get/set/mon)
>   - move parse_periods_or_die() from tools-common to gpioset
>
> Changes v2 -> v3:
>   - squash removal of gpiofind into patch 1 (was patch 6).
>   - rebase to C API line_config changes.
>   - rework line name to chip/offset resolution to improve clarity and
>     better handle corner cases.
>   - drop bias=as-is as a command line option as that is the default
>     behaviour.
>   - revise gpioinfo output format to combine the used flag and consumer
>     name, and to remove the brackets around the list of attributes.
>   - gpiowatch: rework so it is more like gpiomon than the Linux gpio-watch
>     tool.  More details in patch 4.
>   - quote text from the command line when used in error messages.
>   - improve test suite coverage of corner cases.
>   - gpiomon: rename --edge option to --edges, and drop "-edges" from the
>     possible values, e.g. --edges=rising.
>   - add hte support to gpiomon.
>   - gpiomon: decouple selection of event clock from timestamp output
>     formatting.
>
> Changes v1 -> v2:
>   - code formatting, particularly trying to keep to the 80 character
>     limit and C style comments.
>   - move global config fields into the struct config for each tool.
>   - switch gpioset from readline to libedit.
>   - add tests for symlink chip path behaviour.
>   - long lived tools flush stdout before blocking.
>   - fix copyrights
>   - replace gpiosim attr lookup functions with cached values.
>   - remove gpiofind
>
> Kent Gibson (6):
>   tools: remove old code to simplify review
>   tools: line name focussed rework
>   tools: tests for line name focussed rework
>   tools: add gpionotify
>   tools: gpionotify tests
>   README: update Tools section for v2 tools
>
>  README                     |  176 +-
>  TODO                       |   12 +
>  configure.ac               |   24 +-
>  man/Makefile.am            |    2 +-
>  tools/.gitignore           |    2 +-
>  tools/Makefile.am          |   11 +-
>  tools/gpio-tools-test      |    2 -
>  tools/gpio-tools-test.bats | 3101 ++++++++++++++++++++++++++++--------
>  tools/gpiodetect.c         |  122 +-
>  tools/gpiofind.c           |   93 --
>  tools/gpioget.c            |  252 +--
>  tools/gpioinfo.c           |  388 ++---
>  tools/gpiomon.c            |  586 ++++---
>  tools/gpionotify.c         |  445 ++++++
>  tools/gpioset.c            | 1117 ++++++++++---
>  tools/tools-common.c       |  712 ++++++++-
>  tools/tools-common.h       |   98 +-
>  17 files changed, 5495 insertions(+), 1648 deletions(-)
>  delete mode 100644 tools/gpiofind.c
>  create mode 100644 tools/gpionotify.c
>
> --
> 2.38.1
>

Thank you Kent for your great work. I applied this, after squashing
the first three patches into one (while keeping the commit message
from 2/6) and applying some additional changes from my side (mostly
tweaking coding-style more to my liking, nothing functional).

I also applied Viresh' rust bindings and at this point I think we have
all the features in for v2.0. I think that the DBus API will have to
wait for v2.1.

I still have a couple things lined up for v2.0 so I'll send those soon
and then let's work towards stabilizing the API, tagging some RCs and
let's get that thing released finally. :)

Bart
