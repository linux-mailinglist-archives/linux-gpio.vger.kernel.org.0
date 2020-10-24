Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F168B297C92
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Oct 2020 15:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1761728AbgJXNTa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Oct 2020 09:19:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761727AbgJXNT3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Oct 2020 09:19:29 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C80C0613CE
        for <linux-gpio@vger.kernel.org>; Sat, 24 Oct 2020 06:19:29 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id n5so4062982ile.7
        for <linux-gpio@vger.kernel.org>; Sat, 24 Oct 2020 06:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=voEajyoIBI3gRJM3qrkHG07FB6+YKe9Uq0uID/qqbQo=;
        b=eKg8fG2rhmjBmD8SHZ6BiY37Vm1lUUD2eCj3q9CMyq+ZJjAGIF6jGvfCOoq4MXMTTJ
         ZP60wAnT8ImwDhUsilQH2EEigmelRzxJcF721Ct6a31CXaBZnc0eVIlsxy3nwsTn6rUA
         oy77/b0HxNPY+NkNHhMGCDwTY1l47+O+PoizR/B1TH+xTqZnwYwrRaN6bB0bpCLwXPVi
         QkHVMJDGk2u1+iBOC7M6qJ8oaHmKendEM/5COKpAViOqc/37llj4aOohBCAp2bhMegKX
         paL5WtNQIy5+dw90EolHcFP4kc2sD7lFU/uyUSrB5YGYXQwZwSuyq9P2JAPQn4A9RnDB
         EBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=voEajyoIBI3gRJM3qrkHG07FB6+YKe9Uq0uID/qqbQo=;
        b=aDgaPXO0wsUzLWhBxSL2PmN1YIlXMIbSU+wYXJXQE7BEaTYOLtdaprLDokCiCQxJg6
         r7LjcJwjg0KxLzLzpGl0jFBGUrlqOuDn8mJ9nBrZzjUyNhpsN0/kw1nROQ5l2hRErTpM
         Z8nIQ08kYqB1mlDF8bBbo/eSq5QXiqwjiwQKKVPbcxI77dopRHdXtXeqLI28XquVhDGB
         af+s9GnZcBHiwY9fUgxRKJ7saj5C4vsDGx6SG+Nq6YTfaUi5YTODUIeoEnQDM4F2LsFW
         iKjAawOsbA63XnbQnYtZ11b0kktkbiNt1N629Gxw//UMoAtQZENbeh3tf6cmOGY40Pa/
         dwnQ==
X-Gm-Message-State: AOAM532KnWTEhErsh6BRKzZhbrkxZoN5fBxw7tudcRhyOEXDJc/g7Bfz
        lVP+WW4kJW1UO3m9/RGq3x7kbcXTFg3mCiDWcBTEhWPdjhHYRg==
X-Google-Smtp-Source: ABdhPJxxVc0mpl7YswF7tarrcpg0qvvY5376ogxXgUmjKSr09ffK3DAIfJO9VzH3eYvbT47gVRVCZ+26t4z1hJ1hKX0=
X-Received: by 2002:a92:1952:: with SMTP id e18mr4983255ilm.189.1603545568595;
 Sat, 24 Oct 2020 06:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAFhCfDY8te+OoYRyVrkwqvXH08-8tWNKuzvQU0bYtpgGKa6bjg@mail.gmail.com>
In-Reply-To: <CAFhCfDY8te+OoYRyVrkwqvXH08-8tWNKuzvQU0bYtpgGKa6bjg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 24 Oct 2020 15:19:17 +0200
Message-ID: <CAMRc=MenVv0p2A7+E5z=5E8t50uh3vhhCWpg22oAfO0bEK1QJA@mail.gmail.com>
Subject: Re: [libgpiod] C++ Bindings ABI Compatibility
To:     Jack Winch <sunt.un.morcov@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 23, 2020 at 10:04 PM Jack Winch <sunt.un.morcov@gmail.com> wrote:
>
> Good evening, Bartosz!
>
> Starting another email thread on this subject for future
> searchability, although some previous discussion was held under the
> '[libgpiod] cxx bindings: time_point vs duration' thread.
>
> In that thread, you last said:
>
> > I started reading on my own and I think I now have a slightly better
> > idea about C++ and its ABI. I also see what a mess the original
> > libgpiod bindings are in terms of ABI compatibility but fear not!
> > Right now (v2.0) is the time to make it better! :)
> >
> > At a personal level I'm not too concerned about the ABI compatibility
> > of C++ bindings - I much more care about the API. This is because
> > libgpiod is aimed mostly at bespoke embedded distros (yocto,
> > buildroot, openwrt etc.) I understand however that it's an important
> > issue for distros.
> >
> > I didn't know any better at the time of writing libgpiodcxx so I just
> > put all private members in the main header, exposing them to the users
> > of the library. I'm not sure why I didn't realize that C++ classes are
> > basically C structs (and exposing them amounts to exposing struct in a
> > C header) but I just didn't know any better.
> >
> > I assume that you'll either propose to use the Pimpl pattern or a
> > header-only library. I noticed that Pimpl is what Qt5 uses while
> > header-only is more of a boost thing. If so - the timing is great as
> > I'm open to either solution for libgpiod v2.0.
>
>
> If you did some general reading on the topic, you'll realise just how
> fortunate we are to be talking about Linux here and not Microsoft
> Windows.  It's an absolute minefield.  In fact, Microsoft now
> instructs developers to not provide C++ ABIs and to use a stable
> platform ABI such as C, COM or WinRT.  Many of Microsoft's libraries
> are written in C++, but a C ABI is provided to avoid ABI related
> issues.  And then there is the fact that a process can have multiple
> 'components' loaded using different versions of the Microsoft C
> Runtime (CRT), each possessing different heaps, etc.  It causes a lot
> of pain for a lot of individuals and parties.
>
> You may or may not be surprised how many professional software
> developers / engineers have no clue regarding ABI compatibility.  Most
> of them learn the hard way (which is exactly how it was brought to my
> attention and my what a hard lesson it was).  But none of us are born
> knowing everything.
>

I've had some experience in enterprise C++ a couple years ago (high
availability systems for a big corporation) and I've worked with some
brilliant C++ developers and I believe it. It's due to the fact that
such systems are usually packaged together and rebuilt from scratch.
Add to it a strong "not-invented-here" syndrome and you can basically
disregard any ABI issues.

> Generally speaking, if you have a shared library largely implemented
> in C++ and ABI compatibility is of a concern to you, your options are
> as follows:
>
> 1.  Provide a C ABI to the library, wrapping the C++ internals.
> Resource management should be handled within the library and handles
> or opaque pointers should be used to pass references to library
> managed resources to the using application.  Exceptions and non plain
> old data (POD) type objects should not cross the shared library -
> application boundary.
>
> 2.  Provide a C++ ABI, but implement the PImpl pattern such that it is
> possible to maintain ABI compatibility for the major version releases
> of the library (implementation details may be changed to implement bug
> fixes, etc, which is not possible without using the PImpl pattern).
> Even with this approach, there are limitations as to what should be
> passed over the shared library - application boundary.
>

Could you elaborate on the last sentence? Since my gut is telling me
PImpl would be the right choice, I'd like to know what these
limitations are.

> 3.  Opt to provide a static library instead of a shared library.  The
> shared library should be built with the same compiler and compiler
> version as that to be used for the application, etc, in order to avoid
> issues.  If linking fails here, this is still preferable to
> experiencing loading and linking issues with shared libraries, which
> may only become apparent once the application and library is deployed
> and executed at runtime.
>
> 4.  Provide a header-only library, which is a popular option for many
> C++ libraries these days.  This option is not without its
> disadvantages, but the worry of library interface ABI compatibility
> disappears.  This approach, much like the static library approach,
> allows the full feature set of C++ to be utilised within the library
> interface (e.g., the use of exceptions, etc).
>
> You're right in that Qt makes use of the PImpl pattern.  The framework
> uses return codes for error handling, as exceptions are still
> problematic with this approach, and mostly Qt interface types or POD C
> types are exchanged over the shared library - application boundary.
> Some standard library types are passed across the boundary and this is
> usually where problems arise.
>
> For libgpiod, I would personally recommend going down the header-only
> library approach.  The typical structure of most boost libraries, in
> my opinion, would serve as a good model for the implementation of the
> libgpiod C++ binding as a header-only library.  What would your
> thoughts on this be?
>
> Best Regards,
> Jack

Thanks for taking the time to write this down, very helpful!

As I mentioned above - I'm leaning towards PImpl. The reasons I see
for that are: we don't expose any templates to the user and we don't
need any polymorphism. We also seem to have a rather well defined
scope for the library - I can't imagine huge changes happening after
the v2.0 release.

Header-only approach means every user includes everything and we still
need to recompile every user to update the library even with minor
changes. How do distros handle this anyway? Let's say boost gets a
bugfix - do all reverse dependencies get a bugfix release?

I've been looking at what C++ shared libraries I have installed on my
regular Debian 10 system and then also browsed their code a bit. It
turns out that many of them also put the entire implementation in the
header (libjsoncpp, libmpeg2encpp and several others) and they're
still at relatively low ABI major versions of the shared object - so
I'm wondering if that's really such an issue? Or do so few people
realize this is a problem?

Best regards,
Bartosz Golaszewski
