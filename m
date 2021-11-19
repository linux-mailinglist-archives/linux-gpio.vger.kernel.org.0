Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D06345770A
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Nov 2021 20:30:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235553AbhKSTdu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Nov 2021 14:33:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234418AbhKSTdL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Nov 2021 14:33:11 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7011C061574
        for <linux-gpio@vger.kernel.org>; Fri, 19 Nov 2021 11:30:08 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id x6so35154421edr.5
        for <linux-gpio@vger.kernel.org>; Fri, 19 Nov 2021 11:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Vy4+YiniU1JYrMpb1y9ouwNV3ynS7UX+EISD2pLjQ4=;
        b=2JCjGzapHEmGRESPZeFpL7ZVsP9lDR/NYoixMI0aoInx9AMuJLMk5pLvebxRzjFARC
         MJGSxqa/xtyRH3+qE7ePmsy0uqwRWo7yP1B7t9jI+PlCc+GNZ6lRYfRvcxDYA+O+XS+N
         eOdQZYujjhlbDONlf0DMXZ3KpyVoZ7DmP9b76dKd/svMGFKn6Nck1QcBmu7tAPx5AwCa
         4uztrOBtFGs/eMES5D+jrWp3c7l4aJQHl7Bh/IoFEAi9b2W2lhn/9qKaT9eh2LMK1mov
         gH63+Xj837egsguL/+lib+oW12IM7ecS5G/6fXA+14osT6TvXOlNsReZezqBzdKCp6sP
         LVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Vy4+YiniU1JYrMpb1y9ouwNV3ynS7UX+EISD2pLjQ4=;
        b=g3l4Cqy6R+MBhDFPqpSEUgPtZ9ALxGL09qghXIxcN9BrI9Jz+Up6B2BY4Jhd39VU1c
         dtj3vEaepTx7UnXiyoL6UkqtIPaMXd+bEYUG4PMUu+eG6VU8A6fIAzIQTVlz/WwF44gU
         K2e1h61Uo54waCsFffgeaj4zVdoCLBvB4YTPp67h3/LgXcLaB55To1Gqjd4fuJRtutc6
         R4jEW2Ht2drDy3NgjcIZI5xc1O8KwatzJCfNgy646m4mzx+5vzD6o02lYlaXS+BBqR1Q
         P/PcTTpiOWIxfO7Rw67feTmzCsd6FMTVHbY556obwH2nh5Df2EupDZddTHoZkcgmY3ys
         jZzw==
X-Gm-Message-State: AOAM532WvVZumXpYLOmGy48ucUBHVoowdit5hUmjdjYvvkK7HNGw91MR
        P8p5DC1g6kdCbACe6iXg+1mgXMQOlwirsryGYIvJbtgaTll9UA==
X-Google-Smtp-Source: ABdhPJzQalwSSnxuiJ7Nv0+wPObf8ZGMnBfGDG5mvOEw3dz/zRb8/+77Z3DUkG0iIQM+s30szbVNw3B8Oe8ZIGZzq4I=
X-Received: by 2002:a17:907:75f0:: with SMTP id jz16mr11238853ejc.77.1637350207460;
 Fri, 19 Nov 2021 11:30:07 -0800 (PST)
MIME-Version: 1.0
References: <CAEdwc-Qm8hqvJhVLWeqLDYGL2mtH7S=TH=pwhzb5T-nMGD_ugw@mail.gmail.com>
In-Reply-To: <CAEdwc-Qm8hqvJhVLWeqLDYGL2mtH7S=TH=pwhzb5T-nMGD_ugw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 19 Nov 2021 20:29:56 +0100
Message-ID: <CAMRc=McOuJkAFg02+HWDtTxOYm+5io994G8AafnxY32eJJi4+g@mail.gmail.com>
Subject: Re: Confused as to what is going on with libgpiod v2
To:     Thomas Williams <thomas.hugo.williams@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 11, 2021 at 4:55 PM Thomas Williams
<thomas.hugo.williams@gmail.com> wrote:
>
> Sorry, horribly newbie questions and if I should be asking it
> somewhere else then please tell me.
>

Hi Thomas! No, that's perfectly fine.

> 1. Have there been any releases of libgpiod v2 ? I can't see any tags
> in the git repo later than v1.6.
>

Nope, libgpiod v2 is under development and will probably still be so
for a while.

> 2. What branch is libgpiod v2 development occurring on ? I'm guessing
> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/log/?h=next/libgpiod-2.0
> but the last thing there is a huge change-set marked WIP that doesn't
> seem to fit with the previous practice of smaller change-sets (NOT A
> CRITICISM).
>

Yeah so libgpiod v2 will have an entirely rewritten (backward
incompatible) API. In order to keep the git history bisectable, we'll
replace most of the library in one go. As to that particular branch -
I wanted it to store one big patch but after some discussion, it will
now be incremental and all new patches will get squashed right before
merging into master.

> 3. What is this branch:
> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/log/?h=next/post-libgpiod-2.0
> ?

Some patches queued for later when we merge libgpiod-2.0 into master.

>
> 4. Should I even be trying to use libgpiod v2 yet ?
>

Probably not, unless you have a good reason to (writing bindings or
whatever). It's not yet stable and is about to change again soon.

> Best wishes,
>
> Tom Williams

Bart
