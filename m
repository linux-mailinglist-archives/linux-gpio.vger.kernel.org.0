Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 992F1246CAA
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Aug 2020 18:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730813AbgHQQYx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Aug 2020 12:24:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730551AbgHQQY3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Aug 2020 12:24:29 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E7D8C061389
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2020 09:24:28 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id f12so7445323ils.6
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2020 09:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rBHpEt+8Z6feW3arBqijrLM4KwbWANwtNo/Ji7aNvIk=;
        b=gzcNacFTqi0oAKADrkKAZHQClb1diKmm8Pc82e2JPUHQGR63NK/4CVpZZHUaoTWdyT
         B8g1yXx5RmgqNPM4SMZ4E9BS3jy/GqcPWRfBzGY1cO2hu9jRS5OYG6pSWTW5S8mckYaz
         l2l5hy7dKGrkWRgbULNUEzQ1Om2Zu+IAjjvtM7eR0BQdx4cppnS9wCsCCjfQL6qoURA8
         ZXG5RsUj2fLZKoyUf68T47lmKvb6/4P5E6OROINV9jNznGx7EflXzMMeV14LroaPcaD3
         wgeFlSYKaH8lcbuMci5d5qWMz79+atapSWDX4JInPXqggcq/pDF/t74S2LbdhndyoAJt
         OvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rBHpEt+8Z6feW3arBqijrLM4KwbWANwtNo/Ji7aNvIk=;
        b=A3Z/cKUZ5RMFj1kHQb5BQXWUeR9TSPXjMfIjSj67eW1Uyky8wqGCdSnXxzkh9+AGOW
         SLIBbU00ASB4Unc2gGYhLBDP+iwpBYHfSVGX+ch6UqVoojOcF6qLqFe4MGCZFoOHr6kk
         mwSgCMXXCnm8Uyy9swxmkO0dRMX6z1phWny8U6lT0kbRASfNJrQ8RLeQGAHj9Dhq1XYp
         ydxDzdIB7S9YSfv3XKk9EI9HAAdIqKojIi2bFARMmRqW5uz21yDUa3BW+nZsefhlOVs8
         0IxiGnJQ7XcohIv/pxKzYOctrkYrZGQ/B+yDQKpC61YT4NoQMhwcyJhgDkz7U11DImLP
         18QQ==
X-Gm-Message-State: AOAM532AE7qLNVQsD7azO/Mu79RA30d2WqeVHJKrjcIjSBPOsXJAOlZI
        3AyGm87qaHcJ9tPqKzc42UKNSAWwcfMXSzWFSAwfqkw3wd4=
X-Google-Smtp-Source: ABdhPJxcoASLJmlXYUUR/XMKpkXrJegiqA7GGPsLvJIv7t64C8JOgUtLKBmjEFjMAjamnKGCsbnnhcvyHhTof0wRxP0=
X-Received: by 2002:a92:c7d4:: with SMTP id g20mr2748213ilk.40.1597681467364;
 Mon, 17 Aug 2020 09:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200608090652.805516-1-gary.bisson@boundarydevices.com>
 <20200608090652.805516-4-gary.bisson@boundarydevices.com> <CAMRc=MdaMKEW2n32eYD7q1R6V4GWGakk2xmUWmejncLD-x+pYQ@mail.gmail.com>
 <20200817083835.GB91176@p1g2>
In-Reply-To: <20200817083835.GB91176@p1g2>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 17 Aug 2020 18:24:16 +0200
Message-ID: <CAMRc=Mf=vE5_10Z4iOu=pn3vUuLiuD=V8o9kU3H7j4WT9L2N=w@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 3/3] Android.bp: initial addition
To:     Gary Bisson <gary.bisson@boundarydevices.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 17, 2020 at 10:38 AM Gary Bisson
<gary.bisson@boundarydevices.com> wrote:
>
> Hi,
>
> On Mon, Aug 10, 2020 at 09:51:07PM +0200, Bartosz Golaszewski wrote:
> > On Mon, Jun 8, 2020 at 11:07 AM Gary Bisson
> > <gary.bisson@boundarydevices.com> wrote:
> > >
> > > - Defines both shared and static versions of libgpiod
> > > - Defines all the libs/tools as vendor (installed in /vendor)
> > >
> > > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> > > ---
> > > Hi,
> > >
> > > One thing that isn't ideal here is to set GPIOD_VERSION_STR manually,
> > > that will require to keep track of it for all versions.
> > >
> > > Not sure if there's a better way to provide that value to Android.bp.
> > >
> >
> > I don't know Android very well but if its build system can launch
> > autotools, then maybe you could autotoolify this file by providing
> > Android.bp.in and letting autotools expand this macro?
>
> No unfortunately that is not how the AOSP build system works (or at
> least I'm not aware of it).
> AFAIK all the open-source projects used in AOSP (see external/ folder)
> have a separate Android.bp alongside the autotools files.
>
> Here are a few examples of Android.bp files added by Google to
> well-known projects:
> - curl [1]
> - iputils [2]
> - strace [3]
>
> In the case above it is up to Google to maintain that file as only
> hosted on their servers (not merged upstream).
> But some other projects are ok merging it which makes it easier (at
> least for me) like can-utils [4].
>

I'm perfectly fine with merging this file but I don't like having
another place to look at when bumping the version number. I bunched up
all API and ABI versions together in configure.ac in order to not
forget anything when making new releases.

I'm sure Android's build system is not as limited as not to allow to
run some external scripts that would at least fetch the current
version from configure.ac, is it?

> > > Regards,
> > > Gary
> > > ---
> > >  Android.bp | 95 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 95 insertions(+)
> > >  create mode 100644 Android.bp
> > >
> > > diff --git a/Android.bp b/Android.bp
> > > new file mode 100644
> > > index 0000000..6c437df
> > > --- /dev/null
> > > +++ b/Android.bp
> > > @@ -0,0 +1,95 @@
> > > +cc_library_shared {
> > > +    name: "libgpiod",
> > > +    vendor: true,
> > > +    srcs: [
> > > +        "lib/core.c",
> > > +        "lib/ctxless.c",
> > > +        "lib/helpers.c",
> > > +        "lib/iter.c",
> > > +        "lib/misc.c",
> > > +    ],
> > > +    cflags: ["-Werror", "-Wno-macro-redefined", "-DGPIOD_VERSION_STR=\"1.6-devel\""],
> > > +    export_include_dirs: ["include"],
> > > +    local_include_dirs: ["include"],
> > > +}
> > > +
> > > +cc_library_static {
> > > +    name: "libgpiod_static",
> > > +    vendor: true,
> > > +    srcs: [
> > > +        "lib/core.c",
> > > +        "lib/ctxless.c",
> > > +        "lib/helpers.c",
> > > +        "lib/iter.c",
> > > +        "lib/misc.c",
> > > +    ],
> > > +    cflags: ["-Werror", "-Wno-macro-redefined", "-DGPIOD_VERSION_STR=\"1.6-devel\""],
> > > +    export_include_dirs: ["include"],
> > > +    local_include_dirs: ["include"],
> > > +}
> > > +
> > > +cc_binary {
> > > +    name: "gpiodetect",
> > > +    vendor: true,
> > > +    srcs: [
> > > +        "tools/tools-common.c",
> > > +        "tools/gpiodetect.c",
> > > +    ],
> > > +    shared_libs: ["libgpiod"],
> > > +    cflags: ["-Werror"],
> > > +}
> > > +
> > > +cc_binary {
> > > +    name: "gpiofind",
> > > +    vendor: true,
> > > +    srcs: [
> > > +        "tools/tools-common.c",
> > > +        "tools/gpiofind.c",
> > > +    ],
> > > +    shared_libs: ["libgpiod"],
> > > +    cflags: ["-Werror"],
> > > +}
> > > +
> > > +cc_binary {
> > > +    name: "gpioget",
> > > +    vendor: true,
> > > +    srcs: [
> > > +        "tools/tools-common.c",
> > > +        "tools/gpioget.c",
> > > +    ],
> > > +    shared_libs: ["libgpiod"],
> > > +    cflags: ["-Werror"],
> > > +}
> > > +
> > > +cc_binary {
> > > +    name: "gpioinfo",
> > > +    vendor: true,
> > > +    srcs: [
> > > +        "tools/tools-common.c",
> > > +        "tools/gpioinfo.c",
> > > +    ],
> > > +    shared_libs: ["libgpiod"],
> > > +    cflags: ["-Werror"],
> > > +}
> > > +
> > > +cc_binary {
> > > +    name: "gpiomon",
> > > +    vendor: true,
> > > +    srcs: [
> > > +        "tools/tools-common.c",
> > > +        "tools/gpiomon.c",
> > > +    ],
> > > +    shared_libs: ["libgpiod"],
> > > +    cflags: ["-Werror"],
> > > +}
> > > +
> > > +cc_binary {
> > > +    name: "gpioset",
> > > +    vendor: true,
> > > +    srcs: [
> > > +        "tools/tools-common.c",
> > > +        "tools/gpioset.c",
> > > +    ],
> > > +    shared_libs: ["libgpiod"],
> > > +    cflags: ["-Werror"],
> > > +}
> > > --
> > > 2.26.2
> > >
> >
> > Can I somehow test this build file on linux? We'll surely be expanding
> > libgpiod in the future so I need to be able to update this file.
>
> I'm not sure what's the easiest way to get you a build env.
> In my case I use the full AOSP tree [5][6] which might not be ideal for
> you as it involves pulling 40G+ of data.
> For me the commands were:
> $ source build/envsetup.sh
> $ lunch aosp_arm-eng
> $ mmm external/libgpiod
>
> Maybe someone else has a way to setup a Soong build without pulling
> everything.
>
> Let me know if you have any questions.
>
> Regards,
> Gary
>
> [1] https://android.googlesource.com/platform/external/curl/+/refs/heads/master/Android.bp
> [2] https://android.googlesource.com/platform/external/iputils/+/refs/heads/master/Android.bp
> [3] https://android.googlesource.com/platform/external/strace/+/refs/heads/master/Android.bp
> [4] https://github.com/linux-can/can-utils/blob/master/Android.mk
> [5] https://source.android.com/setup/build/downloading
> [6] https://source.android.com/setup/build/building

Thanks for the links. I have access to a build server so at least for
now I can fetch the whole tree alright.

Bartosz
