Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2131A2C62DC
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Nov 2020 11:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725980AbgK0KOd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Nov 2020 05:14:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbgK0KOc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Nov 2020 05:14:32 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 879D3C0613D1
        for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2020 02:14:32 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id y5so3239858iow.5
        for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2020 02:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GL393n2CVwdGwNnKdi2EugARiqFtqJcUokk05IPoyzc=;
        b=TEkBeQAG0sYWKeUnIYXfSQnPbksbkFx0Gs1fJOA2gcicotJB62tfd7SgfF9Xu5qjpf
         +Doy9k50crT7SoFbjKtf2xgDYq1pHkgZInbNzxuSyUL7gIqq4uOLiqV8PyZNZehXF3W+
         Jnb0+gJWkxHvjfOCcJxY4mvffy8Bjum19GR7SY6TeuoU/PqpmOQMycaJoW0z6nU9oEoI
         xXZsAWZqTnpfX+lq9LEVmmsPJ4TawrM7WJJ7FMySnrSiV2rPcg0xqVpJ29WNrE7fqwRQ
         AlwyEQ59hV8Xb7Sd1SQD9iqtKvX8yS3RKHRp9TsDpZg3eYb/WcAzs/ZeYG1RTY69ffX0
         EDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GL393n2CVwdGwNnKdi2EugARiqFtqJcUokk05IPoyzc=;
        b=OnVfq8omcfHdwWXoB0y8bM/MH/7VedXZRV22EuIUGAbHeSz1TeJvosP9XnXDKE3s3r
         g6Uxx4gnaOgTupJ9cAXtD9KnB6SBHYoRymejexeSflsAiBrgM3vwbl1cQsykSW3idTqy
         nxGJlCEMJWMP7VUpj5O3IiO75DZhmEjZB3YdrQUTAlyZvpkemcrjMFUt68I4M1oR4ppJ
         7RMnvriyyrgjRWW1HYkMquW7qmDcBySabI55cmqZVSlM4kzIfGrhhjkE0Wsx9fmYeRA3
         XhlJ4/NrcbavZjG5XLIpA1BDIiKVhfLy/UiMdlscC4E7CIFwiBl2rbizSQh007dOOVGW
         0Ddw==
X-Gm-Message-State: AOAM531UKdEsB0VBeLcsfOcNodi7SN8UOJIw6uyww6Q0lzJUcluhjSsA
        lW0fvUAPQsaenfv5HMMGD4o4K+z8L8a0Adqy5HdhdZ+WTN8=
X-Google-Smtp-Source: ABdhPJwAKT1gFS0bffuzI68+/qKou9iGLRkZ/7XRxsU+dSzwcY1G2Bwc9rEkAMdt5VkaVFH/0sQ0tJNpPNW35sH+YGg=
X-Received: by 2002:a5e:a803:: with SMTP id c3mr5671326ioa.130.1606472071022;
 Fri, 27 Nov 2020 02:14:31 -0800 (PST)
MIME-Version: 1.0
References: <CAFhCfDY8te+OoYRyVrkwqvXH08-8tWNKuzvQU0bYtpgGKa6bjg@mail.gmail.com>
 <CAMRc=MenVv0p2A7+E5z=5E8t50uh3vhhCWpg22oAfO0bEK1QJA@mail.gmail.com>
 <c0f159a1-32d7-d5b5-7f08-c0cb482e4501@gmail.com> <CAFhCfDa1034qZvTX6=xU-SxGi0KtQEP6_EVAvxHDLxpRjV6VBw@mail.gmail.com>
In-Reply-To: <CAFhCfDa1034qZvTX6=xU-SxGi0KtQEP6_EVAvxHDLxpRjV6VBw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 27 Nov 2020 11:14:19 +0100
Message-ID: <CAMRc=MfJmzFCz8Ag2xU99CHPaByxWoEmF3s2Va5cPk-iSUk2yQ@mail.gmail.com>
Subject: Re: [libgpiod] C++ Bindings ABI Compatibility
To:     Jack Winch <sunt.un.morcov@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jack!

Sorry for the late reply.

On Tue, Nov 3, 2020 at 10:02 PM Jack Winch <sunt.un.morcov@gmail.com> wrote:
>
> [Re-sent to list with proper formatting]
>
> Sorry for the delayed response.
>
> > I've had some experience in enterprise C++ a couple years ago (high
> > availability systems for a big corporation) and I've worked with some
> > brilliant C++ developers and I believe it. It's due to the fact that
> > such systems are usually packaged together and rebuilt from scratch.
> > Add to it a strong "not-invented-here" syndrome and you can basically
> > disregard any ABI issues.
>
> That's exactly it.
>
> > > 2.  Provide a C++ ABI, but implement the PImpl pattern such that it is
> > > possible to maintain ABI compatibility for the major version releases
> > > of the library (implementation details may be changed to implement bug
> > > fixes, etc, which is not possible without using the PImpl pattern).
> > > Even with this approach, there are limitations as to what should be
> > > passed over the shared library - application boundary.
> > >
> > Could you elaborate on the last sentence? Since my gut is telling me
> > PImpl would be the right choice, I'd like to know what these
> > limitations are.
>
> Sure.  The expansion of that comment is thus:  In order to reduce and
> eradicate ABI compatibility problems in this scenario, do not pass
> anything over the boundary unless you can be certain that the ABI of
> those items are stable and compatible.  This should be taken to mean
> objects where ABI stability is guaranteed by the provider or you have
> control of the ABI stability yourself.  On some platforms and with
> some standard library implementations, the exposure of standard
> library types in the public interface is out of the question, as ABI
> compatibility is not retained between major releases.
>

But ABI is by definition not retained across major releases, right? At
least this is what is implied when you reset the age component of the
libtool ABI version.

> You also have to consider the binary compatibility of how certain
> language features are implemented by the dependency and reverse
> dependency.  For example, the manner in which exceptions are handled
> may differ between the dependency and reverse dependency.  This issue
> in particular is why Qt makes exclusive use of return codes (and not
> exceptions) for error handling.  Of course, the implementation of such
> features is determined by the compiler collection being used to build
> each binary module (as well as any settings applied during the build).
>
> Fortunately, both libc++ and libstdc++ are relatively stable and
> somewhat compatible from an ABI point of view.  Both gcc and clang
> attempt to implement ABI stability and compatibility, with both
> implementing portions of the Itanium C++ ABI.  There are still issues
> though, but with time these issues are being resolved.  The detailed
> status of compatibility between other compiler collections for GNU /
> Linux is beyond me at current, though it would be safe to assume that
> ABI compatibility is not completely guaranteed.
>
> > Thanks for taking the time to write this down, very helpful!
>
> You're very welcome.  Obviously this is a very high-level and general
> overview, with more to be said on each approach.
>
> > As I mentioned above - I'm leaning towards PImpl. The reasons I see
> > for that are: we don't expose any templates to the user and we don't
> > need any polymorphism. We also seem to have a rather well defined
> > scope for the library - I can't imagine huge changes happening after
> > the v2.0 release.
>
> I agree that the scope of the library is well-defined and relatively
> limited.  As you also point out, templates and polymorphism are not
> utilised in the current form of the library and its public interface.
> Of course, it is possible that future features might come along within
> the gpio subsystem / libgpiod, where making use of these language
> features within the C++ binding might be desired.  That being said,
> it's not like we're developing a library of highly generic components.
> If required, we can make use of Qt as a reference for implementing
> polymorphic inheritance hierarchies and limited [dynamic] strong data
> type variation with the PImpl pattern.  So PImpl is a very viable
> option for the C++ binding, should you want to retain it being a
> shared library.
>

Yes. With your answer my thinking is this: the C++ ABI in linux
distros seems to be "stable enough" for us to rely on binary
compatibility not changing within major distro releases (for example:
Debian 10 can break the compatibility against Debian 9 but all
packages should be rebuilt anyway, on the other hand there's no risk
of it changing within Debian 9 itself). This makes me think that PImpl
is the way to go in the end as I'd prefer to have the implementation
inside a shared library rather than in headers.

For yocto or buildroot systems ABI isn't a concern at all.

> > Header-only approach means every user includes everything and we still
> > need to recompile every user to update the library even with minor
> > changes. How do distros handle this anyway? Let's say boost gets a
> > bugfix - do all reverse dependencies get a bugfix release?
>
> That's how it usually works.  And that fact means that the reverse
> dependency can be confident as to whether a library bug fix is
> available at runtime, because it is compiled into the reverse
> dependency.  This differs from the shared library approach, as whether
> or not the bug fix is available will depend on which version of the
> shared library is available and which gets loaded and linked at
> runtime.
>
> With a lot of C++ developers, there is a cultural element around
> steering away from these types of issues if possible (and not for bad
> reason either).  So that is, in my opinion, one of the contributing
> reasons as to why this approach is seen as acceptable / preferred by a
> lot of this community.  If you make a bug fix to the library, you have
> to build the library and deploy it to the target anyway.  Personally,
> I'd rather build the reverse dependency with the bug fix 'baked in'
> and deploy that.
>
> Don't forget that if you make an ABI breaking change to the public
> interface of the shared library, you have to do a re-build and
> re-deployment of the library and reverse dependencies anyway.
>

Indeed but I intend to not break the ABI across all v2.x releases.

> > I've been looking at what C++ shared libraries I have installed on my
> > regular Debian 10 system and then also browsed their code a bit. It
> > turns out that many of them also put the entire implementation in the
> > header (libjsoncpp, libmpeg2encpp and several others) and they're
> > still at relatively low ABI major versions of the shared object - so
> > I'm wondering if that's really such an issue? Or do so few people
> > realize this is a problem?
>
> ABI compatibility for C++ libraries is certainly less of an issue on
> GNU / Linux (as compared to other platforms), but it is still an
> issue.  I've not had experience with either of the packages you've
> mentioned, so it's possible they have not made ABI breaking changes or
> they just don't care (maybe through ignorance).
>
> I guess, like everything, it all comes down to what you're trying to
> achieve and what you really care about.  I've met individuals who
> didn't give a hoot about this particular issue, as the carnage it
> caused "wasn't their problem" and they still got paid at the end of
> the month.
>
> If you need me to expand on anything above, then let me know.
> Personally, I'm still for a header-only approach (eradicate the ABI
> concern entirely), but if you still want the C++ binding to be
> available as a shared library, the PImpl pattern would also be well
> suited in this case.  In either case, implementing the required
> changes should not be taxing.
>
> On a somewhat related note, I did a build of the libgpiod master
> branch yesterday.  Could you just confirm what the version should be
> for the resultant libgpiodcxx.so?  The built library has a version of
> 1.1.1.
>

Thanks again Jack!

On a completely different note: For the initial implementation of C++
bindings I chose the C++11 standard because it's well established and
supported by g++. Now it's almost 2021 and C++17 seems to be
wide-spread enough to use it.

For the new version I was thinking about switching to C++17
specifically because we'll be dropping the chip iterators in C and
instead providing the user with a function that allows to check if
given path points to a GPIO character device. This is because with the
current implementation: if the user can't access every GPIO chip, the
iterator will throw an error. It may be better to just iterate over
paths to chips and let the user handle the opening and error handling.

This is where the std::filesystem comes into play. It's only available
in C++17 but it would be quite useful for iterating over directory
entries in /dev. The question is: is there any risk related to
switching to the latest standard?

Bartosz
