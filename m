Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D267C4D7D9D
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Mar 2022 09:31:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237632AbiCNIc7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Mar 2022 04:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237354AbiCNIcy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Mar 2022 04:32:54 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A076639BBA
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 01:31:44 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id kt27so32222277ejb.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 01:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jUWPrdLSU7jL9wbY6iWht/OoTQQfJoZ+tgV+Q6eT418=;
        b=St2dtgoNN62bTOgROWdarRCNaeGtM+PvEpeWgftgDt7Sr3WS6RYqqAZ9BvClpJ9dL0
         b/FVVKjJJ20mF585OMlTst/OwtXQIR49FXj5qrIgSGWZJWX/w39rncWk0OzdszrzjFNB
         Opy7lMCPLuVpk/NdoqlRVZoAKOfs0qPxw/LHLbv5tPXGJiKbLVvpZGNzvJQ4+kRYhXAw
         me07o7R3b9TxVL7kTFduUX5tGb1p78EUwlTqeVjJqQrOF5VjG4y9ew70jKad//cGdJmd
         vayYPO5ypjrsEcRt+9fgpb3X6b2jI7XM2j+GOqukV99ltfH2lDVyWCRhynbHaCPxF0yl
         Fgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jUWPrdLSU7jL9wbY6iWht/OoTQQfJoZ+tgV+Q6eT418=;
        b=UPKJQfKQOzdBdItNlKhyfjRDoNKl/kGbQ+sAgZ7iuvHVOhpMsfq96KTfKQ45r5+BL9
         cfyg+i75nxVDx4RbZBoZPnowqKGo2T66pkpxVzyc3EkfULWxCgujDIt3Q4UVuCEI091h
         k7YvTFUTFxSQVtoxvC2NLk3e1EKf51AJD0aWllEakbfFnUPNAMzXZhooKZPH9zM8Cs7p
         QGNbcWiCXS9xrGwiwU7dXihOM7CCOtEMSTpry7iHa3F1n8F6+wtYj82AhQ/gYDWwTOkQ
         JhyDOxbMXhHVYeJsgcVSnEYvcSv+PqwmuNaRgLCewEzyqbVJ00Vp1K4fgbozSbhuMG1W
         MulQ==
X-Gm-Message-State: AOAM532NGUjUaFcH6iUGehHc/49Vc/og2aBZeSaz5Di/zEVKQSwWXZpv
        /uf/U/b8yr8r6l+hF/PVLPpNm5vXq162m61CbON45OYry2WxRw==
X-Google-Smtp-Source: ABdhPJzJA+2eHliSufeyfCvZ3bj1/NgjATXSRy/bX4C6IdSknyPV/m9RBWIbc74zlmO40Z4futVFFig9CNFScuwl2CI=
X-Received: by 2002:a17:906:888e:b0:6da:ed04:5e40 with SMTP id
 ak14-20020a170906888e00b006daed045e40mr18080130ejc.286.1647246698567; Mon, 14
 Mar 2022 01:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220311073926.78636-1-warthog618@gmail.com>
In-Reply-To: <20220311073926.78636-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 14 Mar 2022 09:31:27 +0100
Message-ID: <CAMRc=Mf1MYgNGt2jK_iEXaHv7UUip+_uNkF2Ewm8rr76CnvHXg@mail.gmail.com>
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

Hi Kent!

Thanks for taking the time. I'm mostly ok with those changes,
especially the documentation as I don't really know better (ESL). I
think I may change a couple minor things in the first patches but
nothing big. As far as patch attribution goes - do you want me to
apply it to next/libgpiod-2.0 now and squash it later with your name
mentioned in the commit message or do you want me to queue them for
later once the C++ and Python parts are in as well?

Bart

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
