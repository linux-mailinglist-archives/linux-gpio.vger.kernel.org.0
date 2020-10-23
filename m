Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82AEB29780B
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Oct 2020 22:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755834AbgJWUFC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Oct 2020 16:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755280AbgJWUFA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Oct 2020 16:05:00 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B1C9C0613CE
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2020 13:05:00 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id e2so3304032wme.1
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2020 13:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=WLmuIlPPikDHFKZ/Bp1nFpUvH8MilVXAO0LtKkeE3BY=;
        b=IMmQfekU2ijPzcNdl4mXRpQCs32O4zTA2gCJB743eDbxd9GEOVYl6Ef+4kfSR8ijMa
         ofGubVMjmRLojq1un4WvEI3omeFPK9BmRNcqRfY6Go87IgoAgoMxRpYruk7J7vdMLXrN
         13VsU8hKEKq+SsuZtJYO7J9qLQ5spi6KDCCiGvc3oK3UCNx+eO9yl9DDtuM9gu19YkQ1
         2R4xGhrKiHttgMoUjKCTt5mtdfKDSOv6hwOEHX9orpxfYg+wUQNq7w8bPLZI0EjJPLRN
         jMrbZvMRvvUQlRjNGNbxPMvkEzWUEFxZ9/cg0erdy5myIPD4Xl5HP8dzv0Gupve8e1l+
         YDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=WLmuIlPPikDHFKZ/Bp1nFpUvH8MilVXAO0LtKkeE3BY=;
        b=Lv8tCu5fdsTlFXFKN5u2UUjtwuylGncMJktS9MucQoakxVuFgCXCvjRKpUefmCUzX6
         ouktgFXQsMg/OpxXc9zTdTR0Tc76L1c41SCdlI+Rex0VRucdSKeOS93bAspO5eTE9gFj
         mqUYGVFoDF0lutsxwVhiBh1b/zgQxwbBqs7EVWJ4x6KRuIjege28uGZLYuGnUscQlbJo
         2G3Y0c0vm9KgmtgQF8yl2QjQIxGsVxJiwx+y54RiJcPdNry0xuhHZrCB6JyncgZ4sr37
         OIEe0c06IeHk8BTviZjmwvoQHY1wyZeD2R/bUB2lmKwED4njsau40MvGBfMdiZWI/TFf
         RaLQ==
X-Gm-Message-State: AOAM531uaQdn8MClc0bEGfRH/e/PohGK+TNbrqAL13aCFw0rUV0hZwCi
        yvvD2JZO58l7GEbYg/SqdCi7E+psFhFgKsN6DSp84mOtyaIBKA==
X-Google-Smtp-Source: ABdhPJy92qdYYr1CkH5sqJ1U8D9oYdePme5hhfkbXcVMTFk4VUfqILopJUBNiQv+tdU9QTjvSRU0eQOhc1rvk7iNUBo=
X-Received: by 2002:a1c:5a86:: with SMTP id o128mr3716311wmb.129.1603483496809;
 Fri, 23 Oct 2020 13:04:56 -0700 (PDT)
MIME-Version: 1.0
From:   Jack Winch <sunt.un.morcov@gmail.com>
Date:   Fri, 23 Oct 2020 23:04:46 +0300
Message-ID: <CAFhCfDY8te+OoYRyVrkwqvXH08-8tWNKuzvQU0bYtpgGKa6bjg@mail.gmail.com>
Subject: [libgpiod] C++ Bindings ABI Compatibility
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bartosz Golaszewski <bartekgola@gmail.com>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Good evening, Bartosz!

Starting another email thread on this subject for future
searchability, although some previous discussion was held under the
'[libgpiod] cxx bindings: time_point vs duration' thread.

In that thread, you last said:

> I started reading on my own and I think I now have a slightly better
> idea about C++ and its ABI. I also see what a mess the original
> libgpiod bindings are in terms of ABI compatibility but fear not!
> Right now (v2.0) is the time to make it better! :)
>
> At a personal level I'm not too concerned about the ABI compatibility
> of C++ bindings - I much more care about the API. This is because
> libgpiod is aimed mostly at bespoke embedded distros (yocto,
> buildroot, openwrt etc.) I understand however that it's an important
> issue for distros.
>
> I didn't know any better at the time of writing libgpiodcxx so I just
> put all private members in the main header, exposing them to the users
> of the library. I'm not sure why I didn't realize that C++ classes are
> basically C structs (and exposing them amounts to exposing struct in a
> C header) but I just didn't know any better.
>
> I assume that you'll either propose to use the Pimpl pattern or a
> header-only library. I noticed that Pimpl is what Qt5 uses while
> header-only is more of a boost thing. If so - the timing is great as
> I'm open to either solution for libgpiod v2.0.


If you did some general reading on the topic, you'll realise just how
fortunate we are to be talking about Linux here and not Microsoft
Windows.  It's an absolute minefield.  In fact, Microsoft now
instructs developers to not provide C++ ABIs and to use a stable
platform ABI such as C, COM or WinRT.  Many of Microsoft's libraries
are written in C++, but a C ABI is provided to avoid ABI related
issues.  And then there is the fact that a process can have multiple
'components' loaded using different versions of the Microsoft C
Runtime (CRT), each possessing different heaps, etc.  It causes a lot
of pain for a lot of individuals and parties.

You may or may not be surprised how many professional software
developers / engineers have no clue regarding ABI compatibility.  Most
of them learn the hard way (which is exactly how it was brought to my
attention and my what a hard lesson it was).  But none of us are born
knowing everything.

Generally speaking, if you have a shared library largely implemented
in C++ and ABI compatibility is of a concern to you, your options are
as follows:

1.  Provide a C ABI to the library, wrapping the C++ internals.
Resource management should be handled within the library and handles
or opaque pointers should be used to pass references to library
managed resources to the using application.  Exceptions and non plain
old data (POD) type objects should not cross the shared library -
application boundary.

2.  Provide a C++ ABI, but implement the PImpl pattern such that it is
possible to maintain ABI compatibility for the major version releases
of the library (implementation details may be changed to implement bug
fixes, etc, which is not possible without using the PImpl pattern).
Even with this approach, there are limitations as to what should be
passed over the shared library - application boundary.

3.  Opt to provide a static library instead of a shared library.  The
shared library should be built with the same compiler and compiler
version as that to be used for the application, etc, in order to avoid
issues.  If linking fails here, this is still preferable to
experiencing loading and linking issues with shared libraries, which
may only become apparent once the application and library is deployed
and executed at runtime.

4.  Provide a header-only library, which is a popular option for many
C++ libraries these days.  This option is not without its
disadvantages, but the worry of library interface ABI compatibility
disappears.  This approach, much like the static library approach,
allows the full feature set of C++ to be utilised within the library
interface (e.g., the use of exceptions, etc).

You're right in that Qt makes use of the PImpl pattern.  The framework
uses return codes for error handling, as exceptions are still
problematic with this approach, and mostly Qt interface types or POD C
types are exchanged over the shared library - application boundary.
Some standard library types are passed across the boundary and this is
usually where problems arise.

For libgpiod, I would personally recommend going down the header-only
library approach.  The typical structure of most boost libraries, in
my opinion, would serve as a good model for the implementation of the
libgpiod C++ binding as a header-only library.  What would your
thoughts on this be?

Best Regards,
Jack
