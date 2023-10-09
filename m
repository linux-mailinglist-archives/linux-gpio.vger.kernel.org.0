Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 693FF7BE24B
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Oct 2023 16:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376944AbjJIOQU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Oct 2023 10:16:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376966AbjJIOQT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2023 10:16:19 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2C6CB9
        for <linux-gpio@vger.kernel.org>; Mon,  9 Oct 2023 07:16:14 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3296b49c546so2674694f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 09 Oct 2023 07:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696860973; x=1697465773; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpOu45B94czPb75MC/l/T0/nZp2GCVe8pf4pV+vUCSo=;
        b=olPGdzv1GisOvWt3qz321+R7nkfu+3KR+la/QD6ej3Sr7nzrk4cCPiYluTJ2s3DuuN
         YxzsXeCYR6ReMua7OP98Qx8jn0OEw4YMi2hKPmeMJApgGDlYYNFxEVNHeaDbkCR0hu7a
         XiCNuNF+aL5wS2ygB0lro9HoWaCrl4W9yLB/KAahIN8VT3oxyHGOdxUzXmNyH1M+YXWR
         YdDQdQLrY+EQUf7QHEc0s7X/qUzKh17sH/V6hM6MQMRPy3fE/06MoC76qU7k1HW5IDAy
         htev6Hd05QM7jL5zMWDeMIcstJ3h/yhuKvB6GOIEQ7EXt2EW8DoB9pgA7Guavti31vdi
         1oSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696860973; x=1697465773;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mpOu45B94czPb75MC/l/T0/nZp2GCVe8pf4pV+vUCSo=;
        b=Jk4nKu7/23jIELHzOxH6Glvu6bWQ4KSmVZaXw9OG7Qr5VgHVCG6yuJLKcd3GILLUG1
         xEJC3cpvZ2jcu3VNNWYK7vKYWVsXzZRwBL//+y6gfQxNHoYYZTuimHZHH/V8IzrtUDHT
         KqUKDKTgJ7mRutyAYeCbsT30cKE27WAskISSQXFs99Qw3QRBGcFcOXhd+6Ey3xYLN1R5
         WHEuWieQxEOYCmk7WXdGQe6wOvxyVBaCixeect+j5cRGNrZSLSQQgfC9QuBjz3l4O6Br
         JpeLuyh9CMiNltDVDdbkaZBKtvFn34aFJCiBOW+Q0ecuQJWAG5zFm/6Did6i84WWwX8t
         rzWA==
X-Gm-Message-State: AOJu0YzABI8g9w7vT1vF+lLWWHQrf+odqC4H89oo68ZQU3u+KOGbZUjN
        Ivqhe0PZb5uT77977qsMXuHCXA==
X-Google-Smtp-Source: AGHT+IF7rGAZTGkWK1AgMgMbw9HvJbRm/8fdC1OQs2bgqEeebBI/jkKzxFxKI2oSseAy9fR2DBxgvg==
X-Received: by 2002:adf:e705:0:b0:319:8dcf:5c00 with SMTP id c5-20020adfe705000000b003198dcf5c00mr13222852wrm.69.1696860972680;
        Mon, 09 Oct 2023 07:16:12 -0700 (PDT)
Received: from localhost (i5387894C.versanet.de. [83.135.137.76])
        by smtp.gmail.com with ESMTPSA id e11-20020adfe7cb000000b003176c6e87b1sm9807157wrn.81.2023.10.09.07.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 07:16:12 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 09 Oct 2023 16:16:11 +0200
Message-Id: <CW3Z0GR143R8.363IQKC787V0W@ablu-work>
Subject: Re: [libgpiod][PATCH 0/2] bindings: rust: feature gate unreleased
 features
Cc:     "Linux-GPIO" <linux-gpio@vger.kernel.org>,
        "Viresh Kumar" <viresh.kumar@linaro.org>,
        "Manos Pitsidianakis" <manos.pitsidianakis@linaro.org>,
        "Kent Gibson" <warthog618@gmail.com>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>
From:   "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.15.2
References: <20231006-b4-bindings-old-version-fix-v1-0-a65f431afb97@linaro.org> <CAMRc=MdD5SOmPM6JgagPbkbNJHn+kHqtzu_iGjQPm-K2kFCEfA@mail.gmail.com> <CW3VO38FC7ML.380UJEH9HNQU8@ablu-work> <CAMRc=MfDXtDPmqKneL_XfXrJj-g7oBG=9UMZTqR3oZC0pRiQmw@mail.gmail.com>
In-Reply-To: <CAMRc=MfDXtDPmqKneL_XfXrJj-g7oBG=9UMZTqR3oZC0pRiQmw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon Oct 9, 2023 at 2:43 PM CEST, Bartosz Golaszewski wrote:
> On Mon, Oct 9, 2023 at 1:38=E2=80=AFPM Erik Schilling <erik.schilling@lin=
aro.org> wrote:
> >
> > On Mon Oct 9, 2023 at 10:58 AM CEST, Bartosz Golaszewski wrote:
> > > On Fri, Oct 6, 2023 at 9:24=E2=80=AFAM Erik Schilling <erik.schilling=
@linaro.org> wrote:
> > > >
> > > > When releasing the 0.2.0 version of the libgpiod crate, I did not
> > > > realize that there were C lib features that were not released yet.
> > > > Helpfully, vhost-device's CI went up in flames and revealed this [1=
].
> > > >
> > > > This suggests a way to handle that and sketches how further updates=
 can
> > > > be handled.
> > > >
> > > > I acknowledge that this may be very strange to C developers...
> > > > Traditionally, one would just use whatever your distro provided and=
 the
> > > > distro would make sure that dependencies update in lock-step.
> > > >
> > > > However, in Rust the default way to consume libraries is to pull th=
em
> > > > from crates.io. This is a balancing act for -sys crates which link =
to
> > > > distro-provided libraries on the system. Since crates.io does not w=
ait
> > > > for distros to update their libraries, crates will need to support =
a
> > > > wider range of system libraries.
> > > >
> > > > This sets up / sketches the infrastructure for that.
> > > >
> > > > Only the first commit is intended to be merged. The second one just
> > > > sketches how a release will look like once it happens.
> > > >
> > > > [1] https://buildkite.com/rust-vmm/vhost-device-ci/builds/1746#018b=
0110-b9d3-468a-973c-c3bbc27cd479
> > > >
> > > > To: Bartosz Golaszewski <brgl@bgdev.pl>
> > > > To: Linux-GPIO <linux-gpio@vger.kernel.org>
> > > > Cc: Viresh Kumar <viresh.kumar@linaro.org>
> > > > Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> > > > Cc: Kent Gibson <warthog618@gmail.com>
> > > >
> > > > Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> > > > ---
> > > > Erik Schilling (2):
> > > >       bindings: rust: feature gate unreleased features
> > > >       DONOTMERGE: bindings: rust: simulate v2.1 release
> > > >
> > > >  bindings/rust/libgpiod-sys/Cargo.toml        |  9 +++++++--
> > > >  bindings/rust/libgpiod/Cargo.toml            |  4 ++++
> > > >  bindings/rust/libgpiod/Makefile.am           |  2 +-
> > > >  bindings/rust/libgpiod/README.md             | 14 ++++++++++++++
> > > >  bindings/rust/libgpiod/src/line_request.rs   |  2 ++
> > > >  bindings/rust/libgpiod/tests/line_request.rs |  1 +
> > > >  6 files changed, 29 insertions(+), 3 deletions(-)
> > > > ---
> > > > base-commit: e7b02c2259d97c77107c77b68e3bc1664e6703c1
> > > > change-id: 20231006-b4-bindings-old-version-fix-789973703b77
> > > >
> > > > Best regards,
> > > > --
> > > > Erik Schilling <erik.schilling@linaro.org>
> > > >
> > >
> > > I'm currently discussing a similar problem with a developer who
> > > offered to help make Python bindings released on PyPi more
> > > user-friendly. His suggestion for python bindings is what many PyPi
> > > packages that provide bindings to C libraries do: just compile the
> > > library statically and make it part of the C extension module bundled
> > > together with python code.
> > >
> > > Given that rust programs are statically linked, maybe this is a
> > > solution we could use?
> >
> > It may be one option that we could provide, but I still see need for
> > linking against system libs.
> >
>
> Sure, this is what the python bindings will get. A switch to link
> against the system libgpiod if desired.

How does this switch work with python? Will it be some environment
variable or does pip have something similar to the Rust --feature flags?
>
> > Rust is already a bit special - at least compared to traditional C
> > projects - in that it pulls all the code of all dependencies and builds
> > the entire bunch into a static lib. This is still upsetting some people
> > who prefer each dependency to be its own self-contained dynamic library
> > that can be updated without updating the rest of it. Rust can make
> > that work by being a mono-culture in term of build tools. Everything on
> > crates.io builds through cargo in the same way, so tooling can assist
> > with auditing and updating crates.
> >
> > While distros - to various degrees - are starting to accept that this
> > may be a viable approach, I imagine that they would still feel uneasy
> > about some Rust code statically linking a C lib. They spend a lot of
> > effort making sure that the C lib is built according to their packaging
> > guidelines and do not want to repeat that effort for each Rust binary
> > that ends up including libgpiod.
> >
> > Hence, I think that we would still need to provide a way to build and
> > link against the system libs.
> >
> > However, that does not necessarily means
> > that we need to feature gate pending features like suggested here.
> > We _could_ just tie the Rust bindings to the libgpiod version 1:1 and
> > make bindings only support one version of the C lib.
> >
> > That would come with some implications for the release  though. We woul=
d
> > effectively need to manage bugfixes to the bindings through libgpiod's
> > stable branches. For the version numbers to be non-confusing, we would
> > probably also need to always do the releases together. So there may
> > be needs to do a new patch release for libgpiod even if only a fix was
> > needed in the bindings.
> >
> > Then, we may end up in a situation where SemVer changes may be
> > conflicting between bindings and the core lib. With the Rust bindings
> > being new, my recent fix of a soundness issue required changes to types
> > that required a bump of the major version. The C version was entirely
> > unaffected. Should we have bumped its major for this too?
> >
>
> Absolutely not! I expect rust bindings to still be quite volatile in
> terms of API stability but libgpiod v2 is pretty mature. Distros
> already seem to be slow adopting the new release so I definitely don't
> want to confuse them even more by bumping libgpiod major version
> because of a change in rust bindings.
>
> We decided to fully decouple rust from libgpiod and let's keep it that wa=
y.

Sure. I brought it up as rethorical question to demonstrate the kind of
problems. I fully agree that separate version numbers are the way to go.

>
> > I outlined these kind of issues in my initial thread around publishing
> > to crates.io [1]. We could of course just document somewhere which
> > version of the Rust crate pulls in which version of the C lib.
> >
> > But is it worth it? We would still need to maintain the nested build
> > next to building against system libs. libgpiod is of course fairly
> > boring to build. But we would still need to tell users to install the
> > few build dependencies, C tools may update and the latest crates.io
> > release may fail building.
>
> The core libgpiod library requires a sane toolchain and standard
> library with GNU extensions period. That will not change and I'm quite
> convinced that if an environment has cargo and rustcc and it will have
> a C compiler as well.

Yeah. I think making sure people got the dependencies installed will be
an easy part. That said... yesterday I had to extend my aarch64 SDK
with autoconf-archive for doing a build :).

Anyway, I am mostly concerned about being "odd" and entering less well
tested paths. We are already a "special" Rust crate since we link to a
C lib outside of the Rust ecosystem. But at least we can rely on
somebody already having done the work of providing the library. Now, I
wonder in which ways an autoconf, configure and compilation automation
from a build tool that is optimized to build Rust code can fail.

I am not aware of any popular Rust crate that does this kind of static
linking to C libs by default. So I am not really counting on all the
tooling around this being very well tested across all environments and
targets.

But maybe I am just overly pessimistic :->.

Do you dislike the conditional compilations here? Alternatively, we
could also just backport the fixes that I did to the stable branch and
do a bindings release from there. Then the offending access will be gone
and we could just bump the required C lib version for the Rust bindings
on new releases from the master branch.

That would not lock us into any future and would give us more time to
consider whats best.

- Erik

>
> Bart
>
> >
> > I totally see that static builds may be helpful in some cases. But I
> > would assume that the maintenance overhead of nesting the build is less
> > controllable compared to what I suggest in this patch. The C lib alread=
y
> > follows the good practices around versioning and API compatibility. So
> > I would assume that maintaining the conditional compiles will be fairly
> > simple.
> >
> > Once another major bump happens in the C lib, we can just follow the
> > bump by removing all existing conditionals and bumping the required
> > floor version for the Rust bindings.
> >
> > All in all, I only see minor advantages for users while seeing a lot of
> > maintenance burden.
> >
> > [1] https://lore.kernel.org/all/CT0CRWOTJIEO.20BGIDMLFM0E8@fedora/
> >
> > - Erik
> >

