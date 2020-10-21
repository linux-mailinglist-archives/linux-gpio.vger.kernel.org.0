Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC57294FAD
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Oct 2020 17:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2501917AbgJUPOh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Oct 2020 11:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2501892AbgJUPOg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Oct 2020 11:14:36 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1582AC0613CE
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2020 08:14:35 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id j8so2904264ilk.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2020 08:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rnHqLJWbLT0KWePjL4h1yJ3m/KR9l6S1R6Kyzqcb85w=;
        b=ADGW0ji2vJ3YUQiqDJnsPcbeeeM/we0SrYD4gBHOncx4aArwEPR4Mt3PW4wzHCH9hM
         uMgAzzemBrUJNpBRIeDJpB9x5knP5EFV+/0CXdcxKhtcbXAK9ek0p7Aa/CP6FYQgq0Pu
         IF5NtuJ/zYBUCnkMMa1Nb0stMlmJY1pSp9EI3fVQ75wSeGfbE2pK6oXPHkRA7LWXnwmd
         HWC9tG5AAUZW8PwubA8EzzfNpY24yaDANZaSiKr9S6VngGmYwS0oNe3Z8KBF7d8+T+cA
         zAo8GCFIWSVGKM1ikFLjfYlXsNZfktqqKLBp3GCnrQwSZNsV5sFo0BdCx2xXEtJ90FwO
         vsng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rnHqLJWbLT0KWePjL4h1yJ3m/KR9l6S1R6Kyzqcb85w=;
        b=VxL6wlhFS3eT8hsRobItPmTkGnqHILtDKN+RVDTy4nT/FsMHtowujvXtDHnc9HWh4L
         w0H28xQYIJXjWubhWPOdcZHDo8f5xBrr/3grGoFqsO6phOdIEgECtVnPige9O5zfUydG
         mzAu3VP4hpSzHQQ283b7LQuFz2N7Y03D7lrdMBlAxw3IRhlihNRGSU5Cd2mrOjl+r4Hn
         sv2RytVAr+4g38F8+2rdXlEe18s7BJtFww0LKyrMGZ8nuhZUbRxSYbr1gs2u9EvILV6d
         GxvoU0S7zeGLYAUmlYGscsz+0ZdbCo6TOr+xyf17NkbtlUY5r5dG9xKp9du1Vlz1Xvkj
         sEcQ==
X-Gm-Message-State: AOAM5335R4MxH5jdRIu0pnGVpD1sgVodEOO+E1DqjToSD/cRgMza8t2J
        9upxeTxl90GXrCvQ6wNWCQhx71GDte8GASN6eTR00w==
X-Google-Smtp-Source: ABdhPJxCJp/xGL4PXgAfQKnKU+gmNk27qvIIvy3k1BSrOiyjn6SSfzwns3A0UyAWrWConnrKBUnt9iKGnooL377SSjs=
X-Received: by 2002:a92:1952:: with SMTP id e18mr2824164ilm.189.1603293274347;
 Wed, 21 Oct 2020 08:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201015083805.GA10354@laureti-dev> <CAMRc=Md=ZeKLS-SKKgmq+V9VCt+7xdjNiwz89Ms-vOeTcwZBOw@mail.gmail.com>
 <20201015093526.GA10891@laureti-dev> <CAMRc=McpnnK9NydujR=YRuy0ZBLhQqz3SSZ5eeisjqhMPUbMhA@mail.gmail.com>
 <20201015105718.GA11027@laureti-dev> <CAMRc=MdWi94uzYb6OprmVoGnfmSHUCevqAPPgXOPHQNVrj0jfQ@mail.gmail.com>
 <20201015121312.GA7166@laureti-dev> <CAMRc=McApWaCy8kUWurjZByN9vKqw8kZBwNVBtVXXf6-b3PsLg@mail.gmail.com>
 <CAFhCfDa7Yy2a9-ddk0nZmNidar_-H_ONTU93Cb+YatcEGy3NbQ@mail.gmail.com>
In-Reply-To: <CAFhCfDa7Yy2a9-ddk0nZmNidar_-H_ONTU93Cb+YatcEGy3NbQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 21 Oct 2020 17:14:23 +0200
Message-ID: <CAMRc=MdEQqOryuEW06XhKvfzcYYMFxGOsT0sRg460ZAkD9G8FA@mail.gmail.com>
Subject: Re: [libgpiod] cxx bindings: time_point vs duration
To:     Jack Winch <sunt.un.morcov@gmail.com>
Cc:     Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 21, 2020 at 3:57 PM Jack Winch <sunt.un.morcov@gmail.com> wrote:
>
> Hello Folks,
>
> Me again.  I'm a bit late on this discussion, but wanted to raise a
> couple of points on what's been discussed here.
>
> > As far as I can see, the chip class uses the pimpl pattern, so a chip
> > practically is a reference counted pointer to the actual gpiod_chip.
>
> This has absolutely nothing to do with the PImpl pattern.  The
> Pointer-to-Implementation pattern is about separating class interface
> from implementation, in order to partially alleviate the absolute
> nightmare of managing ABI compatibility for shared libraries which
> expose a C++ interface.
>
> One of the questions I was going to raise on a separate thread,
> Bartosz and Kent, was if you care about ABI compatibility for major
> versions of the libgpiod API?  This is because, currently, almost all
> changes to the C++ binding will result in an ABI breakage.
>

Yes, I am aware of this. We broke ABI in the core library once already
- this is why libgpiod API version v1.6.0 has ABI version 2.2.1. I
personally care a lot more about API compatibility than ABI - I'm
mostly using libgpiod on bespoke embedded distros, built from scratch.
I know this is important for desktop distros though so I try to avoid
it whenever possible. This time however we'll be breaking both API and
ABI, so that's not an issue - it really is a major release.

> Exposing public C++ interfaces from shared libraries is never really a
> good idea, even if ABI compatibility is properly managed and
> considered at the forefront of each development cycle.  Granted, this
> is more troublesome on that other major mainstream OS, but you still
> face plenty of issues with this on GNU / Linux too.
>
> If so desired, I can start another thread on this topic.
>

Yes, please. I'd love to learn what the alternative for C++ is then.

> > I don't thing nanosecond resolution is
> > guarantueed, but maybe this is good enough and you can just use
> > steady_clock? That would certainly be most welcome by consuming client
> > code.
>
> You are correct - nanosecond resolution is not guaranteed.  It is
> completely up to the standard library implementation.  Which is why I,
> personally, would steer away from making the proposed change to struct
> line_event .  The timestamp resolution is currently well defined in
> the existing implementation and changing this may not be desirable for
> users.  If you really want a std::time_point, then you can construct
> one from a std::duration object.  See
> https://en.cppreference.com/w/cpp/chrono/time_point/time_point.
>
> Jack

Maybe a time_point returning helper in this case?

Bartosz
