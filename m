Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2B106A6CFE
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Mar 2023 14:25:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbjCANZl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Mar 2023 08:25:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCANZk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Mar 2023 08:25:40 -0500
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD3BB14201
        for <linux-gpio@vger.kernel.org>; Wed,  1 Mar 2023 05:25:38 -0800 (PST)
Received: by mail-ua1-x930.google.com with SMTP id n4so3657373ual.13
        for <linux-gpio@vger.kernel.org>; Wed, 01 Mar 2023 05:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1677677138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1kvIzyavwpl3z6Kv+jn4eXsQPT0DjAiUUF++mu6JFw=;
        b=VgFTx3h5aZVVaDCopClC//5GxpWPPYul4wugC94GUUKS4Yg3caJyuHn67UvKx5Tg+9
         ZDbKkXKWg+VaKVg9Scx8fmzISJdsfEq+bHAmvB3RBckDaAgbEuYxXN9rzshZbOU7GP6Y
         HF1i/NTfDCmMHsIbR/Gi4iFApEqlBDI4L6xZbg/AFdz8ObjpQzD+53nxdtQEFFwMKeiy
         VLADu/kKKCSrqV/+6e9upu+2NgptUxZbnf8QJuf1A2OC46OamjFjvi1vdIR7GHpFaMfi
         uMgkRnC3K/koQM2D0nUV5oFxiiQ4aWYL/5r7LKrtIwtWcFjfRkhhOxUcOFyvp/ynRURS
         b25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677677138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1kvIzyavwpl3z6Kv+jn4eXsQPT0DjAiUUF++mu6JFw=;
        b=teCRt1Otw6J0UOxCbtykNrFPK7GIFfP/MtQE09wrPjSi5AiCollSnyufjpyXb406LW
         8dDYl+kGKn2DtptiJgiibrEEoAf7p6SBQQcvS5G4oqrcwfdmNOH0rssO1g/04vG2WC96
         sEppE5cHHpY/kcn2lWjyCG5pYlwqkkDiUP/3SnSMLuWHaEk1EYLNlsI9EOpn+dW5wRnW
         wIXOCE+LKvUrJGuG5nen68lFiN0lXAzUnjSQvjH9DZilmmjQ1KwZfNoaBKh7zCxk8VA/
         tkdX2OULs8iVq0oaPL7M9toKUR+bCmibhtje1sfezYS6mqr1iGLszFxhpfnurl56D5Ns
         xJNw==
X-Gm-Message-State: AO0yUKWxqXmPtHmCCkXS9pUPSGbhEVsxcbWHy+Uv/68/M7VSY/vDOOot
        1PzFeRshmE3bXJfRwBFid0lkj2VOhbquiHfs9gRfdw==
X-Google-Smtp-Source: AK7set9qFJgLtALtQGqhJvoKcVw9BoQYORhcpBZnITOWuaMMr7Cu6M77lAxpkiEyjB+IjuVqKq6jQ6HUTw2eNgH/wTw=
X-Received: by 2002:ab0:5550:0:b0:68b:b624:7b86 with SMTP id
 u16-20020ab05550000000b0068bb6247b86mr4096173uaa.2.1677677137773; Wed, 01 Mar
 2023 05:25:37 -0800 (PST)
MIME-Version: 1.0
References: <CAMRc=Mc+cAPZnxFXPPp0RzhUqFRBYBkf1c9=wTozY15gTyi5aQ@mail.gmail.com>
 <Y/itg/cmrPCGa5qf@surfacebook>
In-Reply-To: <Y/itg/cmrPCGa5qf@surfacebook>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 1 Mar 2023 14:25:26 +0100
Message-ID: <CAMRc=McUW4veB4yQjm0KGaccHoR08-rEvij3rFNzY4fBsv_MoA@mail.gmail.com>
Subject: Re: [ANNOUNCE] libgpiod v2.0-rc3 released
To:     andy.shevchenko@gmail.com
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ferry Toth <fntoth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 24, 2023 at 1:28=E2=80=AFPM <andy.shevchenko@gmail.com> wrote:
>
> Thu, Feb 23, 2023 at 08:25:02PM +0100, Bartosz Golaszewski kirjoitti:
> > I decided to introduce a late change to the C++ bindings - mark all
> > public types as final since they already don't have virtual
> > destructors and inheriting from them makes little sense anyway. This
> > has little impact on the programming interface but I still think it's
> > worth another RC and I also have a gut feeling that makes me want to
> > sit down over the weekend and inspect the entire API once more before
> > carving it in stone for the foreseeable future.
> >
> > The tarball and git tree are in their usual places[1][2].
>
> Thank you for the update!
>
> A bit of an offtopic here (but related a bit as well), but since all part=
ies
> are in Cc list I dare to ask.
>
> I have got one bug report internally and, while thinking over it (it has =
nothing
> to do with the library, but with the flow on how we change line states du=
ring
> requests and releases), realised that we probably have no knob to tell GP=
IO driver
> to which state pin should be left after release.
>

As Linus said - this does sound like the "safe-state" mechanism that
tends to be discussed on this list every three years or so. :)

> This at least allows several things to achieve:
> 1) emulation of the sysfs behaviour (to some extent) without a necessity =
of
>    the context (yes, I know that this is still error prone, but why not);

But this doesn't emulate anything. The released line is up for grabs
by either another user-space or a kernel user. It may have reverted to
the previous state on release but what happens next is anyone's guess.
IMO: It's simply wrong to rely on a state of non-requested line.

> 2) allow the possibility to grab a GPIO line and set it to the particular
>    state and leave the process off (makes sense in some setups where it's
>    guaranted that no other process will touch the line);

It may be right for some use-cases but it's ultimately *logically*
wrong. Even sysfs DOES actually request lines that are exported, ie
there IS a defined user who is driving the line. In this case there's
nobody responsible. And in order to read back the state you'd have to
request it anyway.

> 3) something else I forgot or not even thinking of.
>
> That said, would be nice to have an additional flag (during request?)
> to tell kernel what it should do with the line after releasing the
> handle from user space.
>

I agree on the in-kernel mechanism for defining some safe-state to
which a line would revert whenever unused but I would argue that
allowing user-space to specify such a state would be just inviting
people to doing even worse stuff than with sysfs.

Bart

> Thoughts?
>
> P.S. Sorry if I missed any discussion related to this in the past.
> In such case, please share the links.
>
> > [1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
> > [2] git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
