Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 116D4473405
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Dec 2021 19:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238134AbhLMSal (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Dec 2021 13:30:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231886AbhLMSal (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Dec 2021 13:30:41 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93124C06173F
        for <linux-gpio@vger.kernel.org>; Mon, 13 Dec 2021 10:30:40 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id x15so56076816edv.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Dec 2021 10:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g3YkPQNm8HT8uPOkwlxqDDosj5jXAidcs7NGVfMzGdQ=;
        b=PLD5ugaoBxsfh13ItjXwt+RNxiwpsjiaasa4t/MUMpINo5uqktSh5tco4R6UweAQgK
         MqvGKm8ztEc/M3G6KVIYytn8Bm8hkmzeOB2gUQZaSuMwlTEneVyDnM/nMi8JbKVOY81/
         fPqWP04HenfQmN39e89XLHFapkLjIvDliA525SJI54yu4heczQ03Fqm7kOr6n2pB9RH6
         R+RmokoP1evfSqPD0UuNQUA91Dlu16XEsYjmrT6yz4vwCg+N22NpseGGJICSklRu5wfl
         5WNKXzYJEFBV6KR0sYPKce8YyOmalZV1OoydswBghAjVXZl65mgjUte03EmT7nopsyNU
         FbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g3YkPQNm8HT8uPOkwlxqDDosj5jXAidcs7NGVfMzGdQ=;
        b=TplCszvMEhvU1+rNRCiL7OTyIPnpeCk5h2k7rYwSSkiHk3ncRi6Pnpep4AHEcHcI2F
         ECqCKPS9NHf8EzNOXnVB6Fb6736I2mFB60y0RMtebHGfCoVZ7GjaWVKFSu67ZCgCynVT
         SUvVjKfxSa/KAQ+v4bxBQZGhSCWb6K5RnNZ29tRGR09hoPveY3jcFmOW2b1usswXn9WF
         1Mz6zeHzKOqH+oWhMkSqKu39FdrRjkwmRr1vzwbKA0EpHLHjW5yzpdDWlME/v1BEzHJg
         Xez4zWXjNhZRL1B2BSPN4PdFK5IAZj3/8eKgy9e5UShIcn9KgOsekMAw4kvpgkV9gKxC
         G3RA==
X-Gm-Message-State: AOAM532FamePb/y1d0IPqJDNFBpki9WujvSY+bWaT32+0BRC2LhDsq/o
        nLf4cPr4293FDDT4shRK+7vTVTxVclRNYs8rTbnMqg==
X-Google-Smtp-Source: ABdhPJyiubzERra+E8YaazWpZr091U7oC8cB59PSHrp6pM086prR5B207yEmyjou/vFhSLrfFhB+yjJkKc7RYvFcV9M=
X-Received: by 2002:a17:907:6289:: with SMTP id nd9mr51979ejc.101.1639420239120;
 Mon, 13 Dec 2021 10:30:39 -0800 (PST)
MIME-Version: 1.0
References: <20211213162625.18081-1-brgl@bgdev.pl> <Ybd3DT5e3fCP5JiS@smile.fi.intel.com>
In-Reply-To: <Ybd3DT5e3fCP5JiS@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 13 Dec 2021 19:30:28 +0100
Message-ID: <CAMRc=MdOeB_xFTodeAhNBK3E0OuDRceW9wFGK_iPB8=GjGoj_Q@mail.gmail.com>
Subject: Re: [PATCH -next] selftests: gpio: gpio-sim: remove bashisms
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shuah Khan <shuah@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 13, 2021 at 5:39 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Dec 13, 2021 at 05:26:25PM +0100, Bartosz Golaszewski wrote:
> > '==' is a bashisms and not understood by POSIX shell. Drop it from
> > gpio-sim selftests.
>
> > -             if [ "$BANK" == "live" ] || [ "$BANK" == "dev_name" ]; then
> > +             if [ "$BANK" = "live" ] || [ "$BANK" = "dev_name" ]; then
>
> While at it, no need to fork `test` twice, isn't it?
>
>                 if [ "$BANK" = "live" -o "$BANK" = "dev_name" ]; then
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

I'll send a follow-up for that, thanks for spotting it.

Bart
