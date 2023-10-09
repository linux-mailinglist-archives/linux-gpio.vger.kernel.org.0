Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A625E7BDA18
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Oct 2023 13:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346236AbjJILjH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Oct 2023 07:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346226AbjJILjG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2023 07:39:06 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D45C4AB
        for <linux-gpio@vger.kernel.org>; Mon,  9 Oct 2023 04:39:00 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9b2f73e3af3so757299766b.3
        for <linux-gpio@vger.kernel.org>; Mon, 09 Oct 2023 04:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696851539; x=1697456339; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hs1u5V5QgUhdArQ/Pjvxyq7lxECsGifN62L3Mnnkjps=;
        b=zqerOvmTGSScVR/kZERH33/27DfD5JhB+SxHkYqcEQoLdPJheM3b169/2YGzaF032j
         ybdVUoIggtI+HY3M5vl/09ZTfZSzJkZaELsFz9Utte8jbjHeg3LykdfffxYRIEGTjPDc
         RXOwb2JR7N1HNsgTpChBB46dBRVs+owtN+gICUW4JkkEzN2H4hYPKVDFhN1peE/vBBfy
         DhSEz6HFsDVzyyfjQ8LSGiAdC6iHkMPCKW/8owlnPjw6AO3SYDKDHWdMwW2R/28FORHA
         2cqcuzimSRsh/5ZXwXXFbbnUDdVtjs/5AYTKXXx4KsuXB8QtGrLj+Hz3uieR4AMVsE9t
         bOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696851539; x=1697456339;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hs1u5V5QgUhdArQ/Pjvxyq7lxECsGifN62L3Mnnkjps=;
        b=JxKuJfQmEN3TnZhRkIA3mEt/+tpPOcHnBjKXBQspW3c7LGFyVoovj1s6ZhZdWWGzqw
         n20gISyk2VuaPlm+FDx5Pp9x0ZdP/yDZH4aH9967kIRt4HnQ/+6LvOMUJS5DeeeehRuT
         0TrQY3BIECGiytdFTSGCyv0B3M4UKDW3tGuQZOzlCZgIOCalUSXZilsfX+KlXrCVB+hQ
         BsFqK8gHk7TeMsClTUpKIl0ra1DRuhaWOKJUTymu8NranKUQ+2ytBi1QDrGQ3DCtXqTQ
         aCnL9AI6j6iJRvJKsFcvocXx3VrFpdd9YVCZWkDC9jhnMfNm3jt6A4fw6PP7iIPH4FGN
         PsGg==
X-Gm-Message-State: AOJu0YyU4v+VbKqhbjYkvaoGf4a5aiBruGmnGZxvrrvyBCpaVb8SVRsG
        ANTyiZE1yFFXey5e30LBV58AeA==
X-Google-Smtp-Source: AGHT+IGfHLZfxqQjy4Ou26b2IIFf532y4FZywcf34Y30S1Rwi6jI+ob/roLqszS46C91r+Zrcb8pRw==
X-Received: by 2002:a17:906:3284:b0:9b8:e670:657b with SMTP id 4-20020a170906328400b009b8e670657bmr13514529ejw.64.1696851539218;
        Mon, 09 Oct 2023 04:38:59 -0700 (PDT)
Received: from localhost (i5387894C.versanet.de. [83.135.137.76])
        by smtp.gmail.com with ESMTPSA id b13-20020a170906d10d00b009ae3e6c342asm6678337ejz.111.2023.10.09.04.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 04:38:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 09 Oct 2023 13:38:58 +0200
Message-Id: <CW3VO38FC7ML.380UJEH9HNQU8@ablu-work>
Subject: Re: [libgpiod][PATCH 0/2] bindings: rust: feature gate unreleased
 features
Cc:     "Linux-GPIO" <linux-gpio@vger.kernel.org>,
        "Viresh Kumar" <viresh.kumar@linaro.org>,
        "Manos Pitsidianakis" <manos.pitsidianakis@linaro.org>,
        "Kent Gibson" <warthog618@gmail.com>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>
From:   "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.15.2
References: <20231006-b4-bindings-old-version-fix-v1-0-a65f431afb97@linaro.org> <CAMRc=MdD5SOmPM6JgagPbkbNJHn+kHqtzu_iGjQPm-K2kFCEfA@mail.gmail.com>
In-Reply-To: <CAMRc=MdD5SOmPM6JgagPbkbNJHn+kHqtzu_iGjQPm-K2kFCEfA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon Oct 9, 2023 at 10:58 AM CEST, Bartosz Golaszewski wrote:
> On Fri, Oct 6, 2023 at 9:24=E2=80=AFAM Erik Schilling <erik.schilling@lin=
aro.org> wrote:
> >
> > When releasing the 0.2.0 version of the libgpiod crate, I did not
> > realize that there were C lib features that were not released yet.
> > Helpfully, vhost-device's CI went up in flames and revealed this [1].
> >
> > This suggests a way to handle that and sketches how further updates can
> > be handled.
> >
> > I acknowledge that this may be very strange to C developers...
> > Traditionally, one would just use whatever your distro provided and the
> > distro would make sure that dependencies update in lock-step.
> >
> > However, in Rust the default way to consume libraries is to pull them
> > from crates.io. This is a balancing act for -sys crates which link to
> > distro-provided libraries on the system. Since crates.io does not wait
> > for distros to update their libraries, crates will need to support a
> > wider range of system libraries.
> >
> > This sets up / sketches the infrastructure for that.
> >
> > Only the first commit is intended to be merged. The second one just
> > sketches how a release will look like once it happens.
> >
> > [1] https://buildkite.com/rust-vmm/vhost-device-ci/builds/1746#018b0110=
-b9d3-468a-973c-c3bbc27cd479
> >
> > To: Bartosz Golaszewski <brgl@bgdev.pl>
> > To: Linux-GPIO <linux-gpio@vger.kernel.org>
> > Cc: Viresh Kumar <viresh.kumar@linaro.org>
> > Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> > Cc: Kent Gibson <warthog618@gmail.com>
> >
> > Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> > ---
> > Erik Schilling (2):
> >       bindings: rust: feature gate unreleased features
> >       DONOTMERGE: bindings: rust: simulate v2.1 release
> >
> >  bindings/rust/libgpiod-sys/Cargo.toml        |  9 +++++++--
> >  bindings/rust/libgpiod/Cargo.toml            |  4 ++++
> >  bindings/rust/libgpiod/Makefile.am           |  2 +-
> >  bindings/rust/libgpiod/README.md             | 14 ++++++++++++++
> >  bindings/rust/libgpiod/src/line_request.rs   |  2 ++
> >  bindings/rust/libgpiod/tests/line_request.rs |  1 +
> >  6 files changed, 29 insertions(+), 3 deletions(-)
> > ---
> > base-commit: e7b02c2259d97c77107c77b68e3bc1664e6703c1
> > change-id: 20231006-b4-bindings-old-version-fix-789973703b77
> >
> > Best regards,
> > --
> > Erik Schilling <erik.schilling@linaro.org>
> >
>
> I'm currently discussing a similar problem with a developer who
> offered to help make Python bindings released on PyPi more
> user-friendly. His suggestion for python bindings is what many PyPi
> packages that provide bindings to C libraries do: just compile the
> library statically and make it part of the C extension module bundled
> together with python code.
>
> Given that rust programs are statically linked, maybe this is a
> solution we could use?

It may be one option that we could provide, but I still see need for
linking against system libs.

Rust is already a bit special - at least compared to traditional C
projects - in that it pulls all the code of all dependencies and builds
the entire bunch into a static lib. This is still upsetting some people
who prefer each dependency to be its own self-contained dynamic library
that can be updated without updating the rest of it. Rust can make
that work by being a mono-culture in term of build tools. Everything on
crates.io builds through cargo in the same way, so tooling can assist
with auditing and updating crates.

While distros - to various degrees - are starting to accept that this
may be a viable approach, I imagine that they would still feel uneasy
about some Rust code statically linking a C lib. They spend a lot of
effort making sure that the C lib is built according to their packaging
guidelines and do not want to repeat that effort for each Rust binary
that ends up including libgpiod.

Hence, I think that we would still need to provide a way to build and
link against the system libs.

However, that does not necessarily means
that we need to feature gate pending features like suggested here.
We _could_ just tie the Rust bindings to the libgpiod version 1:1 and
make bindings only support one version of the C lib.

That would come with some implications for the release  though. We would
effectively need to manage bugfixes to the bindings through libgpiod's
stable branches. For the version numbers to be non-confusing, we would
probably also need to always do the releases together. So there may
be needs to do a new patch release for libgpiod even if only a fix was
needed in the bindings.

Then, we may end up in a situation where SemVer changes may be
conflicting between bindings and the core lib. With the Rust bindings
being new, my recent fix of a soundness issue required changes to types
that required a bump of the major version. The C version was entirely
unaffected. Should we have bumped its major for this too?

I outlined these kind of issues in my initial thread around publishing
to crates.io [1]. We could of course just document somewhere which
version of the Rust crate pulls in which version of the C lib.

But is it worth it? We would still need to maintain the nested build
next to building against system libs. libgpiod is of course fairly
boring to build. But we would still need to tell users to install the
few build dependencies, C tools may update and the latest crates.io
release may fail building.

I totally see that static builds may be helpful in some cases. But I
would assume that the maintenance overhead of nesting the build is less
controllable compared to what I suggest in this patch. The C lib already
follows the good practices around versioning and API compatibility. So
I would assume that maintaining the conditional compiles will be fairly
simple.

Once another major bump happens in the C lib, we can just follow the
bump by removing all existing conditionals and bumping the required
floor version for the Rust bindings.

All in all, I only see minor advantages for users while seeing a lot of
maintenance burden.

[1] https://lore.kernel.org/all/CT0CRWOTJIEO.20BGIDMLFM0E8@fedora/

- Erik

