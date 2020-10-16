Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0699A29066E
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Oct 2020 15:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407310AbgJPNiw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Oct 2020 09:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407065AbgJPNiv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2020 09:38:51 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78B04C061755
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2020 06:38:50 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id m17so3890738ioo.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2020 06:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6GkPKtOL2ubmiqsz4gh7j8sY7thTmAjt1XQZppv8TX0=;
        b=oQO363GL9ERFOYjoY9Zm/+hL73LGYvvXe9StY2XO6HAlbszLPbMdTBZKvWw3EQ+jwB
         YkSYEehIb/FNp3MK8TimuqqmE9SB+xLFjXldclOdp4EcJQPlVjj24G4svoKm4rmKA7rp
         TYNDemepKKUMJYKEYYkTdTx93EF+PhdMUDINTM7rK80bPbqvojDq1WHTCkVzhQyI8yGy
         Z5qafU4DemZs3uReAHXnv/kDeNZ/I68oA1fZ3iOsfZUqFCU8x+5AO9jVQujyppExCKxd
         FMHGC+0vK3AJ3i6L+2mKdMA0fZSr5golFgz1BFeix1NsqgLQVOIh9IT7m2cBDeAZTKEJ
         7s9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6GkPKtOL2ubmiqsz4gh7j8sY7thTmAjt1XQZppv8TX0=;
        b=plExb91uf1tpT+AzNfRs6gOqHMG365e4CHFWW98L7Iq+bQmVBIM7RUmr8KwiqHjqtQ
         3PfE9g1c2IFMqbeSFODMb8IxXpV8f21ehjilvrxDrIaH7PxXrrpPZGTCQLpQpUfjLXAj
         0Z4AhqmOM6PWXp6gGyYdzWwaM5KygIP0ShO1dVBFrzI3LClMpezImqWirEULuk2xBQcg
         X8n9KR/EX4eBMFGnWMQnDjgyGNhzQzmOisyTLvBFCWGhwiQagNd7SSDrSlDhdIkqsndV
         5gH4U8divHZBj+UFUJmZyz/KygSZQo3mD8WcFBLTztnR0kxA0mySfP0fo4QSE9AH15BF
         2nwQ==
X-Gm-Message-State: AOAM530B5qNL/sovkq8feLh8eRyHM1HWLNnLtkzzMluOsSsXUIld+Arq
        Fx3iDEBLRWxyST8LZsMvN11pbfBD8bAvH2d5GHsn2vlns5iHWQ==
X-Google-Smtp-Source: ABdhPJxRkFRQAjkaOoXZhyLSkpwr85G6lyytYHo77592w5+oA9EWR01u/Kcw/44WQyy3wcY9fiBhsl9PRCM7I9rn1gY=
X-Received: by 2002:a05:6602:2b90:: with SMTP id r16mr2472057iov.31.1602855529778;
 Fri, 16 Oct 2020 06:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201016090949.24456-1-brgl@bgdev.pl> <20201016102937.GA22245@laureti-dev>
In-Reply-To: <20201016102937.GA22245@laureti-dev>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 16 Oct 2020 15:38:39 +0200
Message-ID: <CAMRc=Md1RxGiv+v27dZOSsGX4v1OEc=E-EJvd-4_8tMjgFicoA@mail.gmail.com>
Subject: Re: [libgpiod][RFC PATCH] bindings: cxx: demote the line's parent
 chip reference to a weak_ptr
To:     Helmut Grohne <helmut.grohne@intenta.de>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 16, 2020 at 12:29 PM Helmut Grohne <helmut.grohne@intenta.de> wrote:
>

[snip]

> > +chip::chip(const ::std::weak_ptr<::gpiod_chip>& chip_ptr)
> > +     : _m_chip(chip_ptr)
> > +{
> > +
> > +}
> > +
>
> I think what happens here is that you upgrade a weak_ptr to a
> shared_ptr. Wouldn't it be more natural to request a
>
>     ::std::shared_ptr<::gpiod_chip> &&
>
> here and thus make the ownership-taking more explicit? It would be done
> on the caller-side and thus be more transparent. Stuffing weak_ptrs
> should continue to work.
>

Sure, sounds good.

> > @@ -526,7 +528,22 @@ private:
> >       line_event make_line_event(const ::gpiod_line_event& event) const noexcept;
> >
> >       ::gpiod_line* _m_line;
> > -     chip _m_chip;
> > +     ::std::weak_ptr<::gpiod_chip> _m_owner;
> > +
> > +     class chip_locker
> > +     {
> > +     public:
> > +             chip_locker(const line& line);
> > +             ~chip_locker(void) = default;
> > +
> > +             chip_locker(const chip_locker& other) = delete;
> > +             chip_locker(chip_locker&& other) = delete;
> > +             chip_locker& operator=(const chip_locker&& other) = delete;
> > +             chip_locker& operator=(chip_locker&& other) = delete;
> > +
> > +     private:
> > +             ::std::shared_ptr<::gpiod_chip> _m_chip;
> > +     };
> >
> >       friend chip;
> >       friend line_bulk;
>
> I don't quite get what problem this chip_lcoker solves. It seems to
> prevent concurrent destruction of a ::gpiod_chip. How can this happen?
> One option would be concurrency due to threads. However the whole API
> does not look thread-safe so this would be wrong. The other could be
> callbacks. I couldn't find any callbacks in the C++ bindings. So now I
> am confused why one would need to lock the chip. Do you fear changes
> inside signal handlers?
>

When designing the core library written in C, I mostly followed the
concepts behind libabc[1] including this one:

    Zero global state -- Make your library threads-aware, but *not* thread-safe!

C++ bindings are not thread-safe but in general you don't need to
protect the entire lines+chip set from concurrent access. It's enough
to protect each separate line (or sets of lines requested together)
because the only moment where the line accesses chip's data is reading
its file descriptor number to update its line information by calling
the line info ioctl(). And since ioctl() is thread-safe for user-space
according to POSIX[2] the only danger is the chip being concurrently
destroyed. While in C we deal with pointers and implicitly expect
users to be aware of this, in C++ I figured it's better to ensure that
the chip object stays alive until the line operation completes or at
the very least throws an exception rather than crash the entire
program. This was the reason for the locker.

> > @@ -536,9 +553,11 @@ private:
> >  /**
> >   * @brief Find a GPIO line by name. Search all GPIO chips present on the system.
> >   * @param name Name of the line.
> > - * @return Returns a line object - empty if the line was not found.
> > + * @return Returns a <line, chip> pair where line is the line with given name
> > + *         and chip is the line's owner. Both objects are empty if the line was
> > + *         not found.
> >   */
> > -GPIOD_API line find_line(const ::std::string& name);
> > +GPIOD_API ::std::pair<line, chip> find_line(const ::std::string& name);
>
> This makes the API a little less convenient to use.
>
> > @@ -39,6 +39,7 @@ line::line(::gpiod_line* line, const chip& owner)
> >  unsigned int line::offset(void) const
> >  {
> >       this->throw_if_null();
> > +     line::chip_locker lock_chip(*this);
> >
> >       return ::gpiod_line_offset(this->_m_line);
> >  }
>
> This example nicely shows why I am confused about the chip_locker. Why
> can the chip not become null between the throw_if_null call and the
> chip_locker construction, but it can be externally mutated between the
> chip_locker construction and the gpiod_line_offset call? It would appear
> to me that the chip_locker is entirely unnecessary here.
>

line::throw_if_null() doesn't touch the chip yet - all it does is
verify that line::offset() is not called on an empty object - hence
the logic_error it throws. If the chip is destroyed between these two
calls - we simply get the bad_weak_ptr exception.

> I also think that this refactoring still does not accurately represent
> the kernel interfaces. When you dispose a chip, the owned line becomes
> invalidated. Why do I have to keep the chip to use the line? Is it
> really reasonable to have chips own lines?
>
> When I use the bare kernel interfaces, I can open a chip, request a line
> (which receives a separate fd) and then I can close the chip and
> continue working with the line fd. I could even open the chip in one
> process and transfer the open line fd to a different (possibly
> sandboxed) process or close the chip and sandbox the process prohibiting
> further VFS operations. As far as I can see, neither the old nor the
> proposed API handles any of this.
>

Indeed and there's a reason for this.

The goal of this library isn't to map the kernel interface 1-to-1 but
to provide a simpler API that can be used without the knowledge of the
underlying ioctl()s and file descriptors and which clearly represents
the hierarchy of chips and lines. In libgpiod - unlike the kernel - a
line is represented as its own object even before it's requested or
after it's been released. This logical object keeps some state of the
line and information about it all the time - not only when the file
descriptor for the requested line exists.

I don't really see any benefit of trying to entirely detach lines from chips.

The kernel behavior you described isn't even something done on purpose
- it's just the result of how the kernel handles file descriptors
after all.

> Helmut

Bartosz

[1] https://git.kernel.org/pub/scm/linux/kernel/git/kay/libabc.git
[2] https://pubs.opengroup.org/onlinepubs/9699919799/functions/V2_chap02.html#tag_15_09_01
