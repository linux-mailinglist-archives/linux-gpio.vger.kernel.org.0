Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C06EF268B8D
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 14:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgINM4n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 08:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726498AbgINMob (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 08:44:31 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0CFBC06174A
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 05:44:30 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id w1so17465907edr.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 05:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8nA6A+BjrmpzZxfjlH2oNUbSYc7zOty1uM0peUugN0k=;
        b=hemvP25IijktQjYYVRHes/7E1IXHyuUnqpmpq9MAVJRLK6G9EfpCvLvdXTTXo3ah8z
         BURQ+Fg/S2svnB4z6uD/8zR1LclGVLm6PWMxKy39McbWa3v4GFwQzVvw0ltOYj9X5dJW
         mKLrsXkheQziy0dG2hVHpcRa8vfNBMYMedvvwRDRb3FJk1lOGHgqeBivzhl/WyBMRnrp
         TbLv6rcKz8FXy06ze8Ya6eh0B9LWTvXKTloKzkkvuElLd0bpPbnzYXMHiYWZPlpj64Qd
         6+xr7YRb5uu3jk+ubid00S+rOSKotItICnUfFYnF68Th/6Cvk70O60D2QHY/4/AkeXWJ
         7Pxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8nA6A+BjrmpzZxfjlH2oNUbSYc7zOty1uM0peUugN0k=;
        b=mG1E13za8IJXMtYJlB8ZF3RVJabRwUh/xwmhyaJLWvoxRS5sEc26pRXR5JByrqczSy
         gU95yjNK4LHrQb4ROr12+QkGViZBtFbqmOBcm9yudyY8SWjQOYQXs2Rum3OsE9aDnTNI
         CMWPo7mkoVzq37DeSNoUCur2s9bMJ9Vcbo+VBZQrdOdVAClwcWVZcGO5r5nbivYE6A8q
         QnQz84WVKptXiUB+JqRN5ISCFq7+0Q8ym7J5T0/zt2+hT7yC9GoQ+Ddsteqb7chj4NU7
         IOzofXNfNXPG5IU2gFlK3VBA93LLn7FBO7pNUr7hd7OrL8EJAJD+/VMsTJUy6+qZNzmQ
         CXug==
X-Gm-Message-State: AOAM5302WKc+gnUuI33YDvmo2ld8k4KpRG6sVzpgxdPHhVVwqIR6FkEx
        7aRF/sZ3uf+boyk3kFRhhRY3OFKgvHTgO/qTH84d6g==
X-Google-Smtp-Source: ABdhPJzLoLDsz+ht769/msh7O0ftWnxdm6bHyYAEwFHt0kRkwExHWWw0Xd6C7AT7IToCjiAwvYd1qxWjH4LOr/63ldw=
X-Received: by 2002:a05:6402:b0f:: with SMTP id bm15mr16663399edb.388.1600087469422;
 Mon, 14 Sep 2020 05:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200910101935.47140-1-andriy.shevchenko@linux.intel.com>
 <20200911030539.GA574097@sol> <20200911083109.GF1891694@smile.fi.intel.com>
 <20200911091249.GA1874731@sol> <20200911095355.GG1891694@smile.fi.intel.com>
 <20200911101714.GA2132928@sol> <20200911142846.GM1891694@smile.fi.intel.com> <20200912022148.GA3880502@sol>
In-Reply-To: <20200912022148.GA3880502@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 14 Sep 2020 14:44:18 +0200
Message-ID: <CAMpxmJU9=aFrQP9t+rOn4xvCdB9kHHvWzMkPnMcjG8G7pDzj4g@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpiolib: Fix line event handling in syscall
 compatible mode
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 12, 2020 at 4:21 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Fri, Sep 11, 2020 at 05:28:46PM +0300, Andy Shevchenko wrote:
> > On Fri, Sep 11, 2020 at 06:17:14PM +0800, Kent Gibson wrote:
> > > On Fri, Sep 11, 2020 at 12:53:55PM +0300, Andy Shevchenko wrote:
> > > > On Fri, Sep 11, 2020 at 05:12:49PM +0800, Kent Gibson wrote:
> > > > > On Fri, Sep 11, 2020 at 11:31:09AM +0300, Andy Shevchenko wrote:
> > > > > > On Fri, Sep 11, 2020 at 11:05:39AM +0800, Kent Gibson wrote:
> > > > > > > On Thu, Sep 10, 2020 at 01:19:34PM +0300, Andy Shevchenko wrote:
> > > >
>
> [snip]
> > >
> > > typedef u64 __attribute__((aligned(4))) compat_u64;
> > >
> > > which is bitwise identical - only allowed to 32-bit align.
> >
> > Yes. That's what I meant under "not the same".
> >
> > As far as I understand the alignment makes sense if this type is a part of
> > the uAPI definition. But here we have it completely local. copy_to_user() takes
> > a pointer to a memory without any specific alignment implied.
> >
> > So, what you proposing is basically something like
> >
> > ret = copy_to_user(buf, &ge, compat ?  sizeof(compat) : sizeof(ge));
> >
> > Correct?
> >
>
> That isn't how I would write the copy_to_user(). The size would be
> calculated once, using the linevent_user_size() helper, with
> appropriate documentation as to why this is necessary, and then
> used throughout lineevent_read().
>
> The documentation would mainly be on the lineevent_user_size() function
> itself.
>
> > I don't like the difference between 2nd and 3rd argument. This what looks to me
> > hackish. Variant with explicit compat structure I like more.
> >
>
> Agreed - writing it that way does look pretty nasty.
>
> But my suggestion is actually this:
>
> ret = copy_to_user(buf, &ge, event_size);
>
> I suggested ge_size previously, but event_size might help highlight that
> it isn't always sizeof(ge).
>
> > But if you think it's okay, I will update your way.
> >
>
> I would defer to Bart or Linus, but I think just calculating the
> appropriate size is preferable for this case.
>
> Cheers,
> Kent.

Kent has been producing clean and elegant code so far so I trust him
on code quality issues TBH. Personally in this case however I'd go
with an explicit compat structure as Andy prefers.

I don't have a strong opinion on this so I really am fine either way.

Bartosz
