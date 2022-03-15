Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7C34D9A53
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 12:25:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347909AbiCOL0e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 07:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233729AbiCOL0a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 07:26:30 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D7094ECFC
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 04:25:18 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id p15so40512161ejc.7
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 04:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n7YU1db2cby4JdmQdwlZ6vTIhRW5Mp4+Q33At94hjUQ=;
        b=DylZ5FHFdJ3HG9a4WFy1rR/35RGi8mvxRvJ+iyDLRyGyy0i572GZG/gCOKg1lnLr+1
         i/U8HX6tM0uyCRN93OesohuvURb72rzmOZy+/RN5wn4fVjG6rsucpkhhnZzTA2O/mwdI
         D89v0cMB87px3Ktq3xKAsMcjJGvnH31f/kZ18HyMHqManJPRVHjhMdDrF1ImBryFaEYc
         RVLFdJi+rUZStbIVggh/pkEcb4m9YQmM56Vwoe5F4JRqRHdmasrLpG7KdTAjez3T3LFr
         /ffAv16fytIXmZmMpuHPQAViznyiH4URCD7/cOHOc2Oeg8VsehOSH8lzdY5puJsbBuU/
         D88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n7YU1db2cby4JdmQdwlZ6vTIhRW5Mp4+Q33At94hjUQ=;
        b=Ma4hx70hlUMZltulZtc4BosJhGX89X7apnSHFdu6gYdMjuMrEbMLI/ewRAI9xKbaz4
         3YydcTIDIxvcVnyBh//C/akMUabJIzPLoZPFhCDJqlMweWzxrSDmPjebiUpE11J0qMPs
         OOW1SjAOSAHkTD3moRnn0SmlK/33xqhVYfLfO8EgLT4dXuCSMc8Alo+C0tMMH3VaGCZ7
         osd3WBk4+htFk538kJ+a5kR1DSdCMFZyuz9zixWt8hM6y2eg5D50PbNHJCxGbWXjTyfi
         OXrEqbzwuQZno3hTqnVcFr25y/4FL1lIqiOzyKb9fOXblwUl4wQmH9uTsQdPYIBP9l3/
         +xuQ==
X-Gm-Message-State: AOAM530o3QFSl+1dLGeN09dV5LvkAGfoPKSE6nEJD9PzGaVq9v6XwknF
        lRmomU9tbWxW4rYTEFoWAgJGxyMetHhJ1fdhqtn0CNBEU9ph3g==
X-Google-Smtp-Source: ABdhPJzlTcN371+PiM1dttP2pC9MgUXul3pCvMbrLCSTKRLVg4zR5udwpfqiaNSbYac9a8MRANMt/G+Jpf+DtAJLTqI=
X-Received: by 2002:a17:907:7f0d:b0:6d6:f910:5136 with SMTP id
 qf13-20020a1709077f0d00b006d6f9105136mr23455928ejc.736.1647343517052; Tue, 15
 Mar 2022 04:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220311073926.78636-1-warthog618@gmail.com>
In-Reply-To: <20220311073926.78636-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 15 Mar 2022 12:25:06 +0100
Message-ID: <CAMRc=MeQAP=pJBejaGbDAxjXhkvUJp-yZhSfv-MDbKZ6pR9OHw@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH 0/6] documentation and other minor tweaks
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 11, 2022 at 8:39 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> The bulk of this series is the documentation tweak pass I promised when
> reviewing other v2 changes.  The rest is a collection of minor things
> I tripped over in the process.
>
> The first is expanding the usage of size_t within the library to cover
> the occasions loop variables should also be size_t.  A noteable exception
> is for offsets, but those are defined as u32 in the uAPI and unsigned int
> in the libgpiod API, so adding another intermediate type seemed like a
> bad idea.
>
> The second and fifth are function renaming for consistency.
>
> The third and fourth are just renaming variables for clarity.
>
> The sixth is the actual documentation tweaks.
>
> The changes and reasoning behind them is as follows:
>
> Fix a few typos.
>
> Add "::" to symbols doxygen links where missing.
>
> Use "\p" to refer to parameters.
>
> Fix space before tabs (triggers a checkpatch warning even if the line
> isn't changed).
> Indentation uses tabs then spaces throughout.
>
> Change "@param offset Offset of the line" to "@param offset The offset of
> the line" to avoid checkpatch repeated word warnings :-/.
>
> Use "Get" to describe getters, rather than "Read".
>
> Use "function" not "routine".
>
> Drop "GPIO" from descriptions where it doesn't add anything.
>
> Drop use of current/currently as it is clear it couldn't be otherwise,
> and adding "current" just makes this reader wonder how to access
> non-current.
>
> Some rewording to improve clarity.
>
> Add some @notes to cover misconceptions or questions I frequently see.
>
> The API is all about chips and lines.
> Recognise that "offset" is an identifier for a line, just as "name"
> could be. So don't use "offset" as a synonymous placeholder for line - use
> line.
>
> Use "num_lines" instead of "num_offsets" or "num_values".
> offsets and values are just attributes of lines, so num_offsets =
> num_values = num_lines, and num_lines is always appropriate, independent
> of which set of attributes are being described.
>
> Use of the definite and indefinite article:
>
> In general, where something is not unique it is described using the
> indefinite article, "a", but if it is unique, including where some
> selection has already been performed, then use the definite article,
> "the".
>
> Only use "this" to emphasise a specific item selected from a set,
> such as when referring to "this function".
> Generally "the" is better, and avoids any possible confusion with C++
> this.
>
> Generally use the indefinite article for @brief descriptions.
> e.g. "The function does something to a thing."
> rather than "The function does something to the thing.", as it is up to
> the caller to make the selection as to which definite thing to call the
> function on.
>
> For containers, an attribute of the contained element is definite, but the
> element itself is indefinite:
> "Clear the edge detection override for a line."
>
> For snapshots, like line_info, the "line" becomes definite as the act of
> taking the snapshot selects the line.
> So "Get the name of the line."
>
> The @param and @return use the definite article as they either identify
> the article, or refer to a specific article, not the generic operation
> of the function like @brief.
>
>
> Do NOT ask me to split those out into separate patches ;-).
>
>
> I realise this aimed at a moving target, so I'm rushing this out a little.
> The commit that this is based off is indicated below - the current
> next/libgpiod-2.0 head at time of writing.
>
> Cheers,
> Kent.
>
> Kent Gibson (6):
>   treewide: use size_t for loop variable where limit is size_t
>   API: rename gpiod_request_config_get_num_offsets to
>     gpiod_request_config_get_num_lines to match line_request pattern
>   line-config: rename off to idx
>   line-config: rename num_values to num_lines
>   line-request: rename wait and read functions
>   doc: API documentation tweaks

I applied patches 1, 3, 5 and most of 6. I think we should not apply 2
and 4 as explained in their respective threads.

Do you want to send a follow up to the doco changes to the rejected
parts of patch 6 but without changing the num_values name?

Bart

>
>  include/gpiod.h              | 712 +++++++++++++++++++----------------
>  lib/edge-event.c             |   2 +-
>  lib/line-config.c            |  36 +-
>  lib/line-info.c              |   2 +-
>  lib/line-request.c           |  10 +-
>  lib/request-config.c         |  26 +-
>  tests/tests-edge-event.c     |  38 +-
>  tests/tests-line-request.c   |   2 +-
>  tests/tests-request-config.c |   8 +-
>  tools/gpioget.c              |   4 +-
>  tools/gpioinfo.c             |   4 +-
>  tools/gpiomon.c              |   4 +-
>  tools/gpioset.c              |   6 +-
>  13 files changed, 449 insertions(+), 405 deletions(-)
>
>
> base-commit: 6e15b78d6e9c956c295c755aed793ffd963b1c53
> --
> 2.35.1
>
