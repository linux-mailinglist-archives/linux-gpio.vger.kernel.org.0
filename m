Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E07297BDC93
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Oct 2023 14:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376517AbjJIMnY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Oct 2023 08:43:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376528AbjJIMnX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2023 08:43:23 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F6991
        for <linux-gpio@vger.kernel.org>; Mon,  9 Oct 2023 05:43:20 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-4576946ce96so569027137.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Oct 2023 05:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696855399; x=1697460199; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8NW9tIVAodOb/BKa5ydPNuczm30emXONW+hUfkAY/c=;
        b=mncIQGbiN2F0pm/NcU2/dnM2cCO8c2ErDNbg02NZIXsEyO7AVlzR8LWaDz0/UeXuGz
         1q1o8JjuBw7nyrS8QhnR2YNIKPd01pDWtSsCNIqrajRMhH25sTVQFK+dadjCYlicN6gr
         mpr4VgUuCoBOw86qOm+tuphrjAhz7zSVgYDoX4j/HBIvK/9E8gFO1oBRND6tlIv0bJr7
         3IOTQeD9BxuSg+HRcNYn6XJ0sxFG5B2FR1PNxf4sAk90D43bLOpF8C7Y8kGb5eF19l5g
         M74Tv51FbbJRkNA1UOz5b3+cP6d8zdaCOXnYM0gBAMUqv2ufflOy2qhfib8o0MVcXSdO
         F7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696855399; x=1697460199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8NW9tIVAodOb/BKa5ydPNuczm30emXONW+hUfkAY/c=;
        b=i8XYB1TbGyoH1mVfW4SYbJmJJe3d3sMENrN4V/THPYEPSibgwFpq5/ktwnja0+Hw9r
         xBlNQFlNlmuWu4MsTILku1GsDwv8e6RbnbU6tKIV4T/F/3oCCCRtYEajMnQNuu2sgElo
         6Sybb3ENiab9YX+onwLe4SKC9XDGVYv/3mtJXxPnTvoU91rg+Z+28Yqx6iIIzEStPGBY
         9JPKqgUIPpuv2Q3JRPgMnvmBmL1Lq35tX/+AJ/1zwg6ycP6FB9lj5dLVtgRpeICxLOZ3
         QtMjFWe37aRHDrQ9gAT5Rs0vHVVs21eaIGM2N89f5SAEZwxgceBnsKXGhW1Hf3JDjeG7
         Ljcw==
X-Gm-Message-State: AOJu0Yw18TSbsQcTFgWv8O0OGP+kmIV+IbFSaCx92AeK39/XWOPAlW0a
        FLC16BLbhsfKgA25fjlmQ/FdybAYBdgnXdC6mgMuaA==
X-Google-Smtp-Source: AGHT+IHEkPxfOBGi7mjbk8ljtakR7zuOoWtzfr9Cp9ZO8vssUqjFjt+gr83XZaL6BmrB+uYv64alifx/75BXMEP+Jlo=
X-Received: by 2002:a05:6102:356f:b0:452:6d5b:f4b9 with SMTP id
 bh15-20020a056102356f00b004526d5bf4b9mr13404564vsb.12.1696855399268; Mon, 09
 Oct 2023 05:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231006-b4-bindings-old-version-fix-v1-0-a65f431afb97@linaro.org>
 <CAMRc=MdD5SOmPM6JgagPbkbNJHn+kHqtzu_iGjQPm-K2kFCEfA@mail.gmail.com> <CW3VO38FC7ML.380UJEH9HNQU8@ablu-work>
In-Reply-To: <CW3VO38FC7ML.380UJEH9HNQU8@ablu-work>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 9 Oct 2023 14:43:08 +0200
Message-ID: <CAMRc=MfDXtDPmqKneL_XfXrJj-g7oBG=9UMZTqR3oZC0pRiQmw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/2] bindings: rust: feature gate unreleased features
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 9, 2023 at 1:38=E2=80=AFPM Erik Schilling <erik.schilling@linar=
o.org> wrote:
>
> On Mon Oct 9, 2023 at 10:58 AM CEST, Bartosz Golaszewski wrote:
> > On Fri, Oct 6, 2023 at 9:24=E2=80=AFAM Erik Schilling <erik.schilling@l=
inaro.org> wrote:
> > >
> > > When releasing the 0.2.0 version of the libgpiod crate, I did not
> > > realize that there were C lib features that were not released yet.
> > > Helpfully, vhost-device's CI went up in flames and revealed this [1].
> > >
> > > This suggests a way to handle that and sketches how further updates c=
an
> > > be handled.
> > >
> > > I acknowledge that this may be very strange to C developers...
> > > Traditionally, one would just use whatever your distro provided and t=
he
> > > distro would make sure that dependencies update in lock-step.
> > >
> > > However, in Rust the default way to consume libraries is to pull them
> > > from crates.io. This is a balancing act for -sys crates which link to
> > > distro-provided libraries on the system. Since crates.io does not wai=
t
> > > for distros to update their libraries, crates will need to support a
> > > wider range of system libraries.
> > >
> > > This sets up / sketches the infrastructure for that.
> > >
> > > Only the first commit is intended to be merged. The second one just
> > > sketches how a release will look like once it happens.
> > >
> > > [1] https://buildkite.com/rust-vmm/vhost-device-ci/builds/1746#018b01=
10-b9d3-468a-973c-c3bbc27cd479
> > >
> > > To: Bartosz Golaszewski <brgl@bgdev.pl>
> > > To: Linux-GPIO <linux-gpio@vger.kernel.org>
> > > Cc: Viresh Kumar <viresh.kumar@linaro.org>
> > > Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> > > Cc: Kent Gibson <warthog618@gmail.com>
> > >
> > > Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> > > ---
> > > Erik Schilling (2):
> > >       bindings: rust: feature gate unreleased features
> > >       DONOTMERGE: bindings: rust: simulate v2.1 release
> > >
> > >  bindings/rust/libgpiod-sys/Cargo.toml        |  9 +++++++--
> > >  bindings/rust/libgpiod/Cargo.toml            |  4 ++++
> > >  bindings/rust/libgpiod/Makefile.am           |  2 +-
> > >  bindings/rust/libgpiod/README.md             | 14 ++++++++++++++
> > >  bindings/rust/libgpiod/src/line_request.rs   |  2 ++
> > >  bindings/rust/libgpiod/tests/line_request.rs |  1 +
> > >  6 files changed, 29 insertions(+), 3 deletions(-)
> > > ---
> > > base-commit: e7b02c2259d97c77107c77b68e3bc1664e6703c1
> > > change-id: 20231006-b4-bindings-old-version-fix-789973703b77
> > >
> > > Best regards,
> > > --
> > > Erik Schilling <erik.schilling@linaro.org>
> > >
> >
> > I'm currently discussing a similar problem with a developer who
> > offered to help make Python bindings released on PyPi more
> > user-friendly. His suggestion for python bindings is what many PyPi
> > packages that provide bindings to C libraries do: just compile the
> > library statically and make it part of the C extension module bundled
> > together with python code.
> >
> > Given that rust programs are statically linked, maybe this is a
> > solution we could use?
>
> It may be one option that we could provide, but I still see need for
> linking against system libs.
>

Sure, this is what the python bindings will get. A switch to link
against the system libgpiod if desired.

> Rust is already a bit special - at least compared to traditional C
> projects - in that it pulls all the code of all dependencies and builds
> the entire bunch into a static lib. This is still upsetting some people
> who prefer each dependency to be its own self-contained dynamic library
> that can be updated without updating the rest of it. Rust can make
> that work by being a mono-culture in term of build tools. Everything on
> crates.io builds through cargo in the same way, so tooling can assist
> with auditing and updating crates.
>
> While distros - to various degrees - are starting to accept that this
> may be a viable approach, I imagine that they would still feel uneasy
> about some Rust code statically linking a C lib. They spend a lot of
> effort making sure that the C lib is built according to their packaging
> guidelines and do not want to repeat that effort for each Rust binary
> that ends up including libgpiod.
>
> Hence, I think that we would still need to provide a way to build and
> link against the system libs.
>
> However, that does not necessarily means
> that we need to feature gate pending features like suggested here.
> We _could_ just tie the Rust bindings to the libgpiod version 1:1 and
> make bindings only support one version of the C lib.
>
> That would come with some implications for the release  though. We would
> effectively need to manage bugfixes to the bindings through libgpiod's
> stable branches. For the version numbers to be non-confusing, we would
> probably also need to always do the releases together. So there may
> be needs to do a new patch release for libgpiod even if only a fix was
> needed in the bindings.
>
> Then, we may end up in a situation where SemVer changes may be
> conflicting between bindings and the core lib. With the Rust bindings
> being new, my recent fix of a soundness issue required changes to types
> that required a bump of the major version. The C version was entirely
> unaffected. Should we have bumped its major for this too?
>

Absolutely not! I expect rust bindings to still be quite volatile in
terms of API stability but libgpiod v2 is pretty mature. Distros
already seem to be slow adopting the new release so I definitely don't
want to confuse them even more by bumping libgpiod major version
because of a change in rust bindings.

We decided to fully decouple rust from libgpiod and let's keep it that way.

> I outlined these kind of issues in my initial thread around publishing
> to crates.io [1]. We could of course just document somewhere which
> version of the Rust crate pulls in which version of the C lib.
>
> But is it worth it? We would still need to maintain the nested build
> next to building against system libs. libgpiod is of course fairly
> boring to build. But we would still need to tell users to install the
> few build dependencies, C tools may update and the latest crates.io
> release may fail building.

The core libgpiod library requires a sane toolchain and standard
library with GNU extensions period. That will not change and I'm quite
convinced that if an environment has cargo and rustcc and it will have
a C compiler as well.

Bart

>
> I totally see that static builds may be helpful in some cases. But I
> would assume that the maintenance overhead of nesting the build is less
> controllable compared to what I suggest in this patch. The C lib already
> follows the good practices around versioning and API compatibility. So
> I would assume that maintaining the conditional compiles will be fairly
> simple.
>
> Once another major bump happens in the C lib, we can just follow the
> bump by removing all existing conditionals and bumping the required
> floor version for the Rust bindings.
>
> All in all, I only see minor advantages for users while seeing a lot of
> maintenance burden.
>
> [1] https://lore.kernel.org/all/CT0CRWOTJIEO.20BGIDMLFM0E8@fedora/
>
> - Erik
>
