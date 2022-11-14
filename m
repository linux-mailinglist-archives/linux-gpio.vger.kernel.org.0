Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39B90628278
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 15:27:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236203AbiKNO05 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 09:26:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236339AbiKNO04 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 09:26:56 -0500
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E74221276
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 06:26:50 -0800 (PST)
Received: by mail-vs1-xe31.google.com with SMTP id t14so11534004vsr.9
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 06:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dqkjFxcYAlyXM9FeX/g+MEah7MPsJ+ysruAPWYLZRb0=;
        b=pbWQ7eLtmREjiP1jPHYdfMMFxoXH0pETQouz4/iF9KQ0psOYGxuHyU/oQWo+D+uAlQ
         e7gPCxi+yhhb10x5KUv3VeYgZ4ZD5MGVHR8XxwTUyZdFe7k3xj/RRJyoT/Fi6qzQjavd
         0H/LK/QNkuafEGpayzLWzrCPKqiLxfgMZRqajaDencSLNmLTd5dXwyOZS2f+pPGhKy78
         NzhPzOspKPhJrC3XhPLNDtQaHp1NzElbbpTS2oLgIsHnXukaiDd0km4xv+Yx9yW5OHI3
         s2iwUFFfE87qr4H0wZ1XAmTKG19EFOzG+NpWL9oGhr8IQNhQs8QUiMuI6jkOE4XpRspl
         irNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqkjFxcYAlyXM9FeX/g+MEah7MPsJ+ysruAPWYLZRb0=;
        b=ttjMLdk+MO7NymrDIJM+U/NlOh+lYRcgwh78sEcKG/+ZF2GuQEnerJQ+G3q4iri9xF
         Dp/0hGvpbHT6Jql+/Aw+lws4izC54DA1taxJ7Z/rjBmqFUi8z2+bfQGKiXJYNg+w8JOI
         vq/eczzuznY9zntGsHbNi9dbBdrwzzd7FWXrYJZGLrEXweVbh+vRoUa9s5yqGbY2Sn9u
         AheR/dfZBrfoOBJtRtQviwsjyQ70Q0MpIlXyhuuTo9xcOq7Fh/l+he0AvkchURw5KAi7
         7RhPDfMp1DzVMfFpAnt2lWDtHg1nyV5/5Tg/EOsc4wNYUh+icwb8LKKkXRwHsj2QqhdV
         afJQ==
X-Gm-Message-State: ANoB5pnPr4K+GSBJnfkIKw9SLy5ma9gJV6s6iz/GaF67zbrjmC466JJO
        XI3mg2sKRHlVNWP7mC41s2TnPsGb380DN9NNhFqj0a7xmMQ=
X-Google-Smtp-Source: AA0mqf6zRm8rL0Fr8Bkatm1INq0BD3i9WIeknm1+UsRiQ7tr4rgvR4slelqILeQf8neO3PjGmV8KoFijspqS6zTjBYo=
X-Received: by 2002:a67:6b03:0:b0:398:6504:9ece with SMTP id
 g3-20020a676b03000000b0039865049ecemr6043346vsc.16.1668436009413; Mon, 14 Nov
 2022 06:26:49 -0800 (PST)
MIME-Version: 1.0
References: <20221114040102.66031-1-warthog618@gmail.com>
In-Reply-To: <20221114040102.66031-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 14 Nov 2022 15:26:38 +0100
Message-ID: <CAMRc=MdUNHsL3_uFR1j2ao4GCMvH_1W0ZMxe4QBG0HFu4xNcew@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v4 0/5] tools: improvements for v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 14, 2022 at 5:01 AM Kent Gibson <warthog618@gmail.com> wrote:
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
> Cheers,
> Kent.
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

Eh... yeah, whatever.

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
> Kent Gibson (5):
>   tools: remove old code to simplify review
>   tools: line name focussed rework
>   tools: tests for line name focussed rework
>   tools: add gpionotify
>   tools: gpionotify tests
>
>  configure.ac               |   24 +-
>  man/Makefile.am            |    2 +-
>  tools/.gitignore           |    2 +-
>  tools/Makefile.am          |   12 +-
>  tools/gpio-tools-test      |    3 -
>  tools/gpio-tools-test.bats | 3079 ++++++++++++++++++++++++++++--------
>  tools/gpiodetect.c         |  122 +-
>  tools/gpiofind.c           |   93 --
>  tools/gpioget.c            |  252 +--
>  tools/gpioinfo.c           |  388 ++---
>  tools/gpiomon.c            |  584 ++++---
>  tools/gpionotify.c         |  445 ++++++
>  tools/gpioset.c            | 1057 ++++++++++---
>  tools/tools-common.c       |  712 ++++++++-
>  tools/tools-common.h       |   98 +-
>  15 files changed, 5265 insertions(+), 1608 deletions(-)
>  delete mode 100644 tools/gpiofind.c
>  create mode 100644 tools/gpionotify.c
>
> --
> 2.38.1
>

I played with the tools a bit and really like the way they look now. I
think they're ready to hop into master, I'll do some more testing and
they should be in this week. Just one last request from my side: would
you mind updating the TOOLS section of the README? I'm aware it's not
yet updated for v2 and I plan to do it soon but we could already start
with the tools examples. You can send an incremental patch on top of
this series.

Bart
