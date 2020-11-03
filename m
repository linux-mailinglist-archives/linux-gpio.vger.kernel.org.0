Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 333A02A53A3
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Nov 2020 22:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387693AbgKCVC7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Nov 2020 16:02:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733010AbgKCVC6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Nov 2020 16:02:58 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 473E6C0613D1
        for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2020 13:02:58 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id t13so9476749ilp.2
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2020 13:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VabTwMxsZjyezZtWHKA7YCuACKMmfXVakzt5O1/VUJQ=;
        b=YSe9bysvXhvfIagP9PYjYAPP0w1XUwMpbssXY+oL5sSUuP8b/L1B1YWCgN3NcGlm0N
         TVbzJVjyVFujfMW4AFRSvhSWnoOxlkn3rgdR480VKhBmEEXyYOoNEI0tV7etNpMnuBVB
         swI4PS8hV+pplf3BidF9a5znDTxyPCuOMkiBPkpuC8uYxbIqriLo+T0oJZE+uQt/ZW0C
         XQm280WDk2KJ+WnhZsiHYeiK7e1l9W2qUPJeDHHLHucXYExACSpF+SmcFgM3qofBtCnP
         0bvI7CydQUK8GHyai8mBLVAg05pbJUB3443GEQlwDWQCtgfH24Fp0AWnZFy74S2JlQ0w
         xDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VabTwMxsZjyezZtWHKA7YCuACKMmfXVakzt5O1/VUJQ=;
        b=e6CQ7W8zBpvHHGHQwwnTxuHMimJ9zKEHNqw8nOfpt4V7zEHOVS+TnzmpM72d20kKLe
         Vj0vtp7jJj8XH92WOwkxDODCV/qxUYLFp0vcM6KQ+95oSDll/DUT+4+KRJDxOP79bubw
         aw+ETLS2+QnAJAx3KqjsQKBI12JUr37bJE25PvmjUz2GrjYfKFLoPh8WpdUyTl5nWws5
         JaDAWJ6sKiAfxYV6HDOnIbW3NeUzpj69W5E++DajiXFrGpnl6QnW9518ERIVx6s+mdg4
         EzvWCqsl8eeADeItGp/F6genpYlfLFTRNjxlvEHFOpvbs5SPQV3ZGa3YU8FQqGafhVA1
         RThA==
X-Gm-Message-State: AOAM530gJtA3Ml5FJcgHd0np6uESTutrHl2eGXENjvq/khENEIJid8UX
        RizxwpBTqgveXMklS09Oscw8gbD94E1u+CHw3lh4ou5CV+0byA==
X-Google-Smtp-Source: ABdhPJywIeIXjMSjgEWiF6rTIveJHHlKXd5gSD5lubZ1Cjtm0+iRP5uoKZdJkX42B7zAzXFbNJQjk/bjhInBXw/HGmU=
X-Received: by 2002:a92:c8c4:: with SMTP id c4mr9735394ilq.161.1604437377288;
 Tue, 03 Nov 2020 13:02:57 -0800 (PST)
MIME-Version: 1.0
References: <CAFhCfDY8te+OoYRyVrkwqvXH08-8tWNKuzvQU0bYtpgGKa6bjg@mail.gmail.com>
 <CAMRc=MenVv0p2A7+E5z=5E8t50uh3vhhCWpg22oAfO0bEK1QJA@mail.gmail.com> <c0f159a1-32d7-d5b5-7f08-c0cb482e4501@gmail.com>
In-Reply-To: <c0f159a1-32d7-d5b5-7f08-c0cb482e4501@gmail.com>
From:   Jack Winch <sunt.un.morcov@gmail.com>
Date:   Tue, 3 Nov 2020 21:06:40 +0000
Message-ID: <CAFhCfDa1034qZvTX6=xU-SxGi0KtQEP6_EVAvxHDLxpRjV6VBw@mail.gmail.com>
Subject: Re: [libgpiod] C++ Bindings ABI Compatibility
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

[Re-sent to list with proper formatting]

Sorry for the delayed response.

> I've had some experience in enterprise C++ a couple years ago (high
> availability systems for a big corporation) and I've worked with some
> brilliant C++ developers and I believe it. It's due to the fact that
> such systems are usually packaged together and rebuilt from scratch.
> Add to it a strong "not-invented-here" syndrome and you can basically
> disregard any ABI issues.

That's exactly it.

> > 2.  Provide a C++ ABI, but implement the PImpl pattern such that it is
> > possible to maintain ABI compatibility for the major version releases
> > of the library (implementation details may be changed to implement bug
> > fixes, etc, which is not possible without using the PImpl pattern).
> > Even with this approach, there are limitations as to what should be
> > passed over the shared library - application boundary.
> >
> Could you elaborate on the last sentence? Since my gut is telling me
> PImpl would be the right choice, I'd like to know what these
> limitations are.

Sure.  The expansion of that comment is thus:  In order to reduce and
eradicate ABI compatibility problems in this scenario, do not pass
anything over the boundary unless you can be certain that the ABI of
those items are stable and compatible.  This should be taken to mean
objects where ABI stability is guaranteed by the provider or you have
control of the ABI stability yourself.  On some platforms and with
some standard library implementations, the exposure of standard
library types in the public interface is out of the question, as ABI
compatibility is not retained between major releases.

You also have to consider the binary compatibility of how certain
language features are implemented by the dependency and reverse
dependency.  For example, the manner in which exceptions are handled
may differ between the dependency and reverse dependency.  This issue
in particular is why Qt makes exclusive use of return codes (and not
exceptions) for error handling.  Of course, the implementation of such
features is determined by the compiler collection being used to build
each binary module (as well as any settings applied during the build).

Fortunately, both libc++ and libstdc++ are relatively stable and
somewhat compatible from an ABI point of view.  Both gcc and clang
attempt to implement ABI stability and compatibility, with both
implementing portions of the Itanium C++ ABI.  There are still issues
though, but with time these issues are being resolved.  The detailed
status of compatibility between other compiler collections for GNU /
Linux is beyond me at current, though it would be safe to assume that
ABI compatibility is not completely guaranteed.

> Thanks for taking the time to write this down, very helpful!

You're very welcome.  Obviously this is a very high-level and general
overview, with more to be said on each approach.

> As I mentioned above - I'm leaning towards PImpl. The reasons I see
> for that are: we don't expose any templates to the user and we don't
> need any polymorphism. We also seem to have a rather well defined
> scope for the library - I can't imagine huge changes happening after
> the v2.0 release.

I agree that the scope of the library is well-defined and relatively
limited.  As you also point out, templates and polymorphism are not
utilised in the current form of the library and its public interface.
Of course, it is possible that future features might come along within
the gpio subsystem / libgpiod, where making use of these language
features within the C++ binding might be desired.  That being said,
it's not like we're developing a library of highly generic components.
If required, we can make use of Qt as a reference for implementing
polymorphic inheritance hierarchies and limited [dynamic] strong data
type variation with the PImpl pattern.  So PImpl is a very viable
option for the C++ binding, should you want to retain it being a
shared library.

> Header-only approach means every user includes everything and we still
> need to recompile every user to update the library even with minor
> changes. How do distros handle this anyway? Let's say boost gets a
> bugfix - do all reverse dependencies get a bugfix release?

That's how it usually works.  And that fact means that the reverse
dependency can be confident as to whether a library bug fix is
available at runtime, because it is compiled into the reverse
dependency.  This differs from the shared library approach, as whether
or not the bug fix is available will depend on which version of the
shared library is available and which gets loaded and linked at
runtime.

With a lot of C++ developers, there is a cultural element around
steering away from these types of issues if possible (and not for bad
reason either).  So that is, in my opinion, one of the contributing
reasons as to why this approach is seen as acceptable / preferred by a
lot of this community.  If you make a bug fix to the library, you have
to build the library and deploy it to the target anyway.  Personally,
I'd rather build the reverse dependency with the bug fix 'baked in'
and deploy that.

Don't forget that if you make an ABI breaking change to the public
interface of the shared library, you have to do a re-build and
re-deployment of the library and reverse dependencies anyway.

> I've been looking at what C++ shared libraries I have installed on my
> regular Debian 10 system and then also browsed their code a bit. It
> turns out that many of them also put the entire implementation in the
> header (libjsoncpp, libmpeg2encpp and several others) and they're
> still at relatively low ABI major versions of the shared object - so
> I'm wondering if that's really such an issue? Or do so few people
> realize this is a problem?

ABI compatibility for C++ libraries is certainly less of an issue on
GNU / Linux (as compared to other platforms), but it is still an
issue.  I've not had experience with either of the packages you've
mentioned, so it's possible they have not made ABI breaking changes or
they just don't care (maybe through ignorance).

I guess, like everything, it all comes down to what you're trying to
achieve and what you really care about.  I've met individuals who
didn't give a hoot about this particular issue, as the carnage it
caused "wasn't their problem" and they still got paid at the end of
the month.

If you need me to expand on anything above, then let me know.
Personally, I'm still for a header-only approach (eradicate the ABI
concern entirely), but if you still want the C++ binding to be
available as a shared library, the PImpl pattern would also be well
suited in this case.  In either case, implementing the required
changes should not be taxing.

On a somewhat related note, I did a build of the libgpiod master
branch yesterday.  Could you just confirm what the version should be
for the resultant libgpiodcxx.so?  The built library has a version of
1.1.1.

Jack


On Tue, Nov 3, 2020 at 8:57 PM Jack Winch <sunt.un.morcov@gmail.com> wrote:
>
> Sorry for the delayed response.
>
>     I've had some experience in enterprise C++ a couple years ago (high
>     availability systems for a big corporation) and I've worked with some
>     brilliant C++ developers and I believe it. It's due to the fact that
>     such systems are usually packaged together and rebuilt from scratch.
>     Add to it a strong "not-invented-here" syndrome and you can basically
>     disregard any ABI issues.
>
>
> That's exactly it.
>
>     > 2.  Provide a C++ ABI, but  implement the PImpl pattern such that it is
>     > possible to  maintain ABI compatibility for the major version releases
>     > of the library  (implementation details may be changed to implement bug
>     > fixes, etc, which  is not possible without using the PImpl pattern).
>     > Even with this  approach, there are limitations as to what should be
>     > passed over the  shared library - application boundary.
>     >
>     Could you elaborate on the last sentence? Since my gut is telling me
>     PImpl would be the right choice, I'd like to know what these
>     limitations are.
>
>
> Sure.  The expansion of that comment is thus:
>
> In order to reduce ABI compatibility problems in this scenario, do not
> pass anything over the boundary unless you can be certain that the ABI
> of those items are stable and compatible.  This should be taken to mean
> objects where ABI stability is guaranteed by the provider or you have
> control of the ABI stability yourself.  On some platforms and with some
> C++ standard library implementations, the exposure of standard library
> types in the public interface is out of the question, as ABI
> compatibility is not retained between major releases of the standard
> library implementation.  These are the 'pain points' for the Qt
> libraries on certain platforms and with certain compiler collections.
>
> You also have to consider the binary compatibility of how certain
> language features are implemented by the dependency and reverse
> dependency.  For example, the manner in which exceptions are handled may
> differ between the dependency and reverse dependency.  This issue in
> particular is why Qt makes exclusive use of return codes (and not
> exceptions) for error handling.  Of course, the implementation of such
> features is determined by the compiler collection being used to build
> each binary module (as well as any settings applied during the build).
>
> Fortunately, both libc++ and libstdc++ are relatively stable and
> somewhat compatible from an ABI point of view.  Both gcc and clang
> attempt to implement ABI stability and compatibility, with both
> implementing portions of the Itanium C++ ABI.  There are still some
> issues though, but with time these issues are being resolved in later
> releases of the compiler collections.
>
> The detailed status of compatibility between other compiler collections
> for GNU / Linux is beyond me at current, though it would be safe to
> assume that ABI compatibility is not completely guaranteed.
>
>     Thanks for taking the time to write this down, very helpful!
>
>
> You're very welcome. Obviously this is a very high-level and general
> overview.
>
>     As I mentioned above - I'm leaning towards PImpl. The reasons I see
>     for that are: we don't expose any templates to the user and we don't
>     need any polymorphism. We also seem to have a rather well defined
>     scope for the library - I can't imagine huge changes happening after
>     the v2.0 release.
>
>
> I agree that the scope of the library is well-defined and relatively
> limited.  As you also point out, templates and polymorphism are not
> utilised in the current form of the library and its public interface.
> Of course, it is possible that future features might come along within
> the gpio subsystem / libgpiod, where making use of these language
> features within the C++ binding might be desired. That being said, it's
> not like we're developing a library of highly generic components.  If
> required, we can make use of Qt as a reference for implementing
> polymorphic inheritance hierarchies and limited [dynamic] strong data
> type variation with the PImpl pattern. So PImpl is a very viable option
> for the C++ binding, should you want to retain it being a shared library.
>
>     Header-only approach means every user includes everything and we still
>     need to recompile every user to update the library even with minor
>     changes. How do distros handle this anyway? Let's say boost gets a
>     bugfix - do all reverse dependencies get a bugfix release?
>
>
> That's how it usually works.  And that fact means that the reverse
> dependency can be confident as to whether a library bug fix is available
> at runtime, because it is compiled into the reverse dependency.  This
> differs from the shared library approach, as whether or not the bug fix
> is available will depend on which version of the shared library is
> available and which gets loaded and linked at runtime.
>
> With a lot of C++ developers, there is a cultural element around
> steering away from these types of issues if possible (and not for bad
> reason either).  So that is, in my opinion, one of the contributing
> reasons as to why this approach is seen as acceptable / preferred by a
> lot of this community.  If you make a bug fix to the library, you have
> to build the library and deploy it to the target anyway. Personally, I'd
> rather build the reverse dependency with the bug fix 'baked in' and
> deploy that.
>
> Don't forget that if you make an ABI breaking change to the public
> interface of a shared library, you have to do a re-build and
> re-deployment of the library and reverse dependencies anyway.  At least
> if you go down the header-only library route, you remove the pain of
> having to worry about ABI compatibility and stability entirely (while
> being able to make full use of the features offered by the language).
>
>     I've been looking at what C++ shared libraries I have installed on my
>     regular Debian 10 system and then also browsed their code a bit. It
>     turns out that many of them also put the entire implementation in the
>     header (libjsoncpp, libmpeg2encpp and several others) and they're
>     still at relatively low ABI major versions of the shared object - so
>     I'm wondering if that's really such an issue? Or do so few people
>     realize this is a problem?
>
>
> ABI compatibility for C++ libraries is certainly less of an issue on GNU
> / Linux (as compared to other platforms), but it is still an issue.
> I've not had experience with either of the packages you've mentioned, so
> it's possible they have not made ABI breaking changes or they just don't
> care (maybe through ignorance).
>
> I guess, like everything, it all comes down to what you're trying to
> achieve and what you really care about.  I've met individuals who didn't
> give a hoot about this particular issue, as the carnage it caused
> downstream "wasn't their problem" and they "still get paid at the end of
> the month".
>
> If you need me to expand on anything above, then let me know.
> Personally, I'm still for a header-only approach, but if you still want
> the C++ binding to be available as a shared library, the PImpl pattern
> would also be well suited in this case.  In either case, implementing
> the required changes should not be too taxing.
>
> On a somewhat related note, I did a build of the libgpiod master branch
> yesterday.  Could you just confirm what the version should be for the
> resultant libgpiodcxx.so?  The built library has a version of 1.1.1.
>
> Jack
