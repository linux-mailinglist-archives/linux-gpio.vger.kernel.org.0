Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6347472CB9
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Dec 2021 14:01:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237063AbhLMNBZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Dec 2021 08:01:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233102AbhLMNBY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Dec 2021 08:01:24 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BB10C061574
        for <linux-gpio@vger.kernel.org>; Mon, 13 Dec 2021 05:01:24 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id x10so34421706edd.5
        for <linux-gpio@vger.kernel.org>; Mon, 13 Dec 2021 05:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QrQ1DzOMGrjggzx9mPbx3dF9phhQNDA0afO66vnbZC4=;
        b=VAzMlj6VGLfAlq0zMeOhbHcTO6PClEwjCTaIgrhWrc4QJ2xEqdhBoJ+KxY2w5HazMp
         B+DFQXlq63BhCNK16/KtuJGdy/yXDQm9nAU24ad+jM5gcajRW+5UxuPL5lpepfFsFvCD
         haDR5BGcY5haCBJfBJoVr3tnDn9/ax7bEiwiInpy4lxQfdB4he5iN0dsfCUYh8Em0jxb
         m5ljo7G9OURn6rKVbbh5V7J7OmFkkc4s0V+1tXMyhePzGRoB8/dgyTSbaQUvpG9QKVQj
         4o0LjGHe7nZrNhzRLTH80LcmO9RuaP885/TDWiJ4l9fMuu8o9wnihLrQ8gMLLkh5gG5O
         clzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QrQ1DzOMGrjggzx9mPbx3dF9phhQNDA0afO66vnbZC4=;
        b=m2MgWMc9JFGiI2iDQurvEiOkWj0OhmQyPJ/n5IgC8vT2pucMUHLAqEkGTLiTWtZdjM
         nhRqQXflF4/EcoZHZYbTQPBCWnJTPSXT4QkN/jBR5oFJkobjyzYeimXSEEtdIUvnzP7t
         s9ngfXCc02mjqOZYjrn4Ffu69trwavgAwfNV8Qc7uQ3ohiNbZqlkMWSCMUanyKNzfSDY
         4/ZQ0CZCr7A8kWSaTk8DV8EYZbFveRiu88ZyrOj6azwbaJERzjYbPZY5LqfNiUmNYrAV
         zZZhUM6kVew9BQlorvVx4P+ncl2PHIpiJZeyr9cyWjG0l1bqN8tueJYz8MIpZe/iSwol
         g+5Q==
X-Gm-Message-State: AOAM531dVwRp8LZ87R8+yDNgh2GNucBmwk0qxr3880TgLVdkD7o1Xbn8
        Almav1K553c1N4gMYX4iR0JjriWT5iCrGm8k+SUGbTtlEcQ=
X-Google-Smtp-Source: ABdhPJyLSV8jCtxAuien5xpDzhaMmWmDnMgaqrerXBREYw9IJyjuQ1t30sfwFpSGzWD0HFPR9Wj2bDoeE/sQJ47sJp8=
X-Received: by 2002:a17:907:2d8c:: with SMTP id gt12mr43145864ejc.61.1639400475412;
 Mon, 13 Dec 2021 05:01:15 -0800 (PST)
MIME-Version: 1.0
References: <20211207093412.27833-1-brgl@bgdev.pl> <CACRpkdbAs+ZpU_uQziXmz2inPG7VHD=746MmjmR8iY3szfy9+w@mail.gmail.com>
 <CAMRc=MfWv5bpudpfc2L8Y2HdS+nkXGToSgn6Oovxo4NXxHzHmQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfWv5bpudpfc2L8Y2HdS+nkXGToSgn6Oovxo4NXxHzHmQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 13 Dec 2021 14:01:04 +0100
Message-ID: <CAMRc=Me=BKcf6FjMpmQ9Mu-2h5DvkhyJ3LDtjSSq9P9Hkb0X4w@mail.gmail.com>
Subject: Re: [PATCH v13 0/7] gpio-sim: configfs-based GPIO simulator
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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

On Fri, Dec 10, 2021 at 8:08 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Thu, Dec 9, 2021 at 1:54 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Tue, Dec 7, 2021 at 10:34 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > > Hopefully this will be the last iteration of this series. Just some
> > > minor changes requested by Andy in this one.
> > >
> > > Tested both with configfs as well as device-tree.
> >
> > This patch set:
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Thanks for your perseverance!!
> >
> > Yours,
> > Linus Walleij
>
> Thanks, if there are no objections, I'll queue this series on Monday
> to give it some time in next.
>
> Bart

Queued for v5.17.

Bart
