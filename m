Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5958E716D18
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 21:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbjE3TFC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 15:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231769AbjE3TFA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 15:05:00 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCDD311F
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 12:04:52 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-3f7a546efb1so26339701cf.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 12:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685473492; x=1688065492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEzoPOQGYvvdrf/WenbVEi1EIASbuaUXCTDNc2/yIls=;
        b=KiuAujopQ30lzCFtthfMpSUzU4PZA0yqxsx2hYmOBwBV7cXChX7snR+CX6DkK93dr3
         prypFpVlEq5YlJaptx4vPd+ZzuY2jwYH4ktO4Q/q/ce+mw1UlVjUQcJ4xjsFsq/J9NdF
         lEfExAKNReg25B8P9B4wsudafxPqEN8LJfmDeyL1guh5GRYuyf0V3Rqru368IfzHHZw2
         6m2emHRuMU6TbK4GobzLGCbfIX1AY1D3yLLiwXmRe81Ud/EKkQAf0p+bmcLtGjTn1DKw
         oLaf5WlABaQ4qZNdcNS2mDOmboQXHKcwa+DzDTKo8+XUK5suu7kucbz9kh5Y8Zr0YZYM
         Xygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685473492; x=1688065492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEzoPOQGYvvdrf/WenbVEi1EIASbuaUXCTDNc2/yIls=;
        b=bH9O1EWlPy5gWi9DF5CQWwY+XxcNWv4x04JvX/N4eb0h1NGNGzsS78ercSDdOW5Hxs
         DeYHgkRjIO3o0MM1dIma6T3HO9nJbOInjAyQ5VHXa2wddH6dQKOqd/aGjl3mASurELc5
         iYc8ovoQ3jvTot2cMV1LDWEg7JqhU5b6A3RvK6ETOUb/EfDugRZh/x/3XBd2LquDxDmA
         TmUy3y7zmxcGWzWBFAc8m+O8t/rSRvcOrfEUAn1160DEIqh+FvSpw92d3HZXQ293smmg
         /COCXmogKc5gRmi5YzWSpn+dZLD5Ib7UDi+vffPn3ah9vWF2IG7iRNhpiRpKQUC9SCWz
         HXEw==
X-Gm-Message-State: AC+VfDyaUAdaNztjRZR8h2YfbTkuUbId4XMgFMknvvsaq2CUiEHDx10p
        6dTxWC2/2liyGreoFr6Y02HGta5/N4my5Ewk/KTn3ek2GJsN42Rv
X-Google-Smtp-Source: ACHHUZ6cR/KJVMUUm9a78GzdmbqBM+6HnH4/3r3fT36NmVsV6h6hYK4FetxncbNi3tngjemqCDMXu1ENkN/D2DYZegM=
X-Received: by 2002:ac8:5a8d:0:b0:3f6:c064:135b with SMTP id
 c13-20020ac85a8d000000b003f6c064135bmr3229454qtc.54.1685473491752; Tue, 30
 May 2023 12:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230522-crates-io-v2-0-d8de75e7f584@linaro.org>
 <20230522-crates-io-v2-2-d8de75e7f584@linaro.org> <CAMRc=McTnKDxxT-qii7VtDQMbd2aCdk8oM=9iK4aXC=udiymuQ@mail.gmail.com>
 <CAAjaMXbE58V-LCKvhOJkJkyVzgDEws3D5Wnea5ikeccMZNRCSQ@mail.gmail.com>
In-Reply-To: <CAAjaMXbE58V-LCKvhOJkJkyVzgDEws3D5Wnea5ikeccMZNRCSQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 30 May 2023 21:04:40 +0200
Message-ID: <CAMRc=Md4Kko03g81emupFhpQL9A=mNTumJmkmMpeOvacMB-3-w@mail.gmail.com>
Subject: Re: [PATCH libgpiod v2 2/2] bindings: rust: build against pkg-config info
To:     Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc:     Erik Schilling <erik.schilling@linaro.org>,
        Linux-GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 30, 2023 at 6:27=E2=80=AFPM Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> Hello Bart,
>
> this error means pkg-config could not find libgpiod. Erik changed the
> linking logic, so now instead of linking a local copy of the library
> it lets pkg-config find it. But you haven't installed it locally.
>
> Running with these flags from a makefile in the commit:
>
> command =3D SYSTEM_DEPS_LIBGPIOD_NO_PKG_CO
> NFIG=3D1 \
> +
> SYSTEM_DEPS_LIBGPIOD_SEARCH_NATIVE=3D"${PWD}/../../../lib/.libs/" \
> +               SYSTEM_DEPS_LIBGPIOD_LIB=3Dgpiod \
> +               SYSTEM_DEPS_LIBGPIOD_INCLUDE=3D"${PWD}/../../../include/"=
  \
> +               cargo build --release --lib
>
> Should work.
>

Ah, got it. Ok, now applied.

Bart

> On Tue, 30 May 2023 at 19:04, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Fri, May 26, 2023 at 5:28=E2=80=AFPM Erik Schilling
> > <erik.schilling@linaro.org> wrote:
> > >
> > > This change replaces building against "bundled" headers by always
> > > building agains system headers (while following standard conventions =
to
> > > allow users to specify the version to build against).
> > >
> > > Reasoning:
> > >
> > > Previously, the code generated the bindings based on the headers, but
> > > then links against `-lgpiod` without further specifying where that is
> > > coming from.
> > >
> > > This results in some challenges and problems:
> > >
> > > 1. Packaging a Rust crate with `cargo package` requires the folder
> > >    containing the Cargo.toml to be self-contained. Essentially, a tar
> > >    ball with all the sources of that folder is created. Building agai=
nst
> > >    that tar ball fails, since the headers files passed to bindgen are
> > >    a relative path pointing outside of that folder.
> > >
> > > 2. While, for example, the cxx bindings are built AND linked against
> > >    the build results, the packaging situation for C++ libraries is a
> > >    bit different compared to Rust libs. The C++ libs will likely get
> > >    built as part of the larger libgpiod build and published together
> > >    with the C variant.
> > >
> > >    In Rust, the vast majority of people will want to build the glue-c=
ode
> > >    during the compilation of the applications that consume this lib.
> > >
> > >    This may lead to inconsistencies between the bundled headers and t=
he
> > >    libraries shipped by the user's distro. While ABI should hopefully
> > >    be forward-compatible within the same MAJOR number of the .so,
> > >    using too new headers will likely quickly lead to mismatches with
> > >    symbols defined in the lib.
> > >
> > > 3. Trying to build the core lib as part of the Rust build quickly run=
s
> > >    into similar packaging issues as the existing solution. The source
> > >    code of the C lib would need to become part of some package
> > >    (often people opt to pull it in as a submodule under their -sys cr=
ate
> > >    or even create a separate -src package [1]). This clearly does not
> > >    work well with the current setup...
> > >
> > > Since building against system libs is probably? what 90%+ of the peop=
le
> > > want, this change hopefully addresses the problems above. The
> > > system-deps dependency honors pkg-config conventions, but also allows
> > > users flexible ways to override the defaults [2]. Overall, this keeps
> > > things simple while still allowing maximum flexibility.
> > >
> > > Since the pkg-config interface is just telling us which include paths=
 to
> > > use, we switch back to a wrapper.h file that includes the real gpiod.=
h.
> > >
> > > Once Rust bindings require a lower version floor, the version metadat=
a
> > > can also be updated to help telling users that their system library i=
s
> > > too old.
> > >
> > > In order to support people hacking on the Rust bindings, building wit=
h
> > > make will automatically set the right set of environment variables.
> > > In case people want to customize it when building without `make`, a
> > > reference to the system_deps documentation is given in the README.md.
> > >
> > > [1] https://github.com/alexcrichton/openssl-src-rs
> > > [2] https://docs.rs/system-deps/latest/system_deps/#overriding-build-=
flags
> > >
> > > Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> > > ---
> > >  README                                |  4 +++-
> > >  bindings/rust/libgpiod-sys/Cargo.toml |  4 ++++
> > >  bindings/rust/libgpiod-sys/README.md  |  8 +++++++
> > >  bindings/rust/libgpiod-sys/build.rs   | 40 +++++++++++++++++++++++--=
----------
> > >  bindings/rust/libgpiod-sys/wrapper.h  |  1 +
> > >  bindings/rust/libgpiod/Makefile.am    |  8 ++++++-
> > >  6 files changed, 49 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/README b/README
> > > index 85b6300..5764eee 100644
> > > --- a/README
> > > +++ b/README
> > > @@ -218,7 +218,9 @@ the PYTHON_CPPFLAGS and PYTHON_LIBS variables in =
order to point the build
> > >  system to the correct locations. During native builds, the configure=
 script
> > >  can auto-detect the location of the development files.
> > >
> > > -Rust bindings require cargo support.
> > > +Rust bindings require cargo support. When building the Rust bindings=
 along the
> > > +C library using make, they will be automatically configured to build=
 against the
> > > +build results of the C library.
> > >
> > >  TESTING
> > >  -------
> > > diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/li=
bgpiod-sys/Cargo.toml
> > > index 2b20fa6..8b17039 100644
> > > --- a/bindings/rust/libgpiod-sys/Cargo.toml
> > > +++ b/bindings/rust/libgpiod-sys/Cargo.toml
> > > @@ -18,3 +18,7 @@ edition =3D "2021"
> > >
> > >  [build-dependencies]
> > >  bindgen =3D "0.63"
> > > +system-deps =3D "2.0"
> > > +
> > > +[package.metadata.system-deps]
> > > +libgpiod =3D "2"
> > > diff --git a/bindings/rust/libgpiod-sys/README.md b/bindings/rust/lib=
gpiod-sys/README.md
> > > index 1cb3b0a..90198d8 100644
> > > --- a/bindings/rust/libgpiod-sys/README.md
> > > +++ b/bindings/rust/libgpiod-sys/README.md
> > > @@ -8,6 +8,14 @@ SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.ku=
mar@linaro.org>
> > >  Automatically generated Rust FFI bindings via
> > >         [bindgen](https://github.com/rust-lang/rust-bindgen).
> > >
> > > +## Build requirements
> > > +
> > > +A compatible variant of the C library needs to detectable using pkg-=
config.
> > > +Alternatively, one can inform the build system about the location of=
 the
> > > +libs and headers by setting environment variables. The mechanism for=
 that is
> > > +documented in the
> > > +[system_deps crate documentation](https://docs.rs/system-deps/6.1.0/=
system_deps/#overriding-build-flags).
> > > +
> > >  ## License
> > >
> > >  This project is licensed under either of
> > > diff --git a/bindings/rust/libgpiod-sys/build.rs b/bindings/rust/libg=
piod-sys/build.rs
> > > index 0ac2730..9e6a93c 100644
> > > --- a/bindings/rust/libgpiod-sys/build.rs
> > > +++ b/bindings/rust/libgpiod-sys/build.rs
> > > @@ -1,25 +1,44 @@
> > >  // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
> > > -// SPDX-FileCopyrightText: 2022 Linaro Ltd.
> > > +// SPDX-FileCopyrightText: 2022-2023 Linaro Ltd.
> > >  // SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.or=
g>
> > > +// SPDX-FileCopyrightText: 2023 Erik Schilling <erik.schilling@linar=
o.org>
> > >
> > >  use std::env;
> > >  use std::path::PathBuf;
> > >
> > > -fn generate_bindings() {
> > > +fn main() {
> > > +    // Probe dependency info based on the metadata from Cargo.toml
> > > +    // (and potentially other sources like environment, pkg-config, =
...)
> > > +    // https://docs.rs/system-deps/latest/system_deps/#overriding-bu=
ild-flags
> > > +    let libs =3D system_deps::Config::new().probe().unwrap();
> > > +
> > >      // Tell cargo to invalidate the built crate whenever following f=
iles change
> > > -    println!("cargo:rerun-if-changed=3D../../../include/gpiod.h");
> > > +    println!("cargo:rerun-if-changed=3Dwrapper.h");
> > >
> > >      // The bindgen::Builder is the main entry point
> > >      // to bindgen, and lets you build up options for
> > >      // the resulting bindings.
> > > -    let bindings =3D bindgen::Builder::default()
> > > +    let mut builder =3D bindgen::Builder::default()
> > >          // The input header we would like to generate
> > >          // bindings for.
> > > -        .header("../../../include/gpiod.h")
> > > +        .header("wrapper.h")
> > >          // Tell cargo to invalidate the built crate whenever any of =
the
> > >          // included header files changed.
> > > -        .parse_callbacks(Box::new(bindgen::CargoCallbacks))
> > > -        // Finish the builder and generate the bindings.
> > > +        .parse_callbacks(Box::new(bindgen::CargoCallbacks));
> > > +
> > > +    // Inform bindgen about the include paths identified by system_d=
eps.
> > > +    for (_name, lib) in libs {
> > > +        for include_path in lib.include_paths {
> > > +            builder =3D builder.clang_arg("-I").clang_arg(
> > > +                include_path
> > > +                    .to_str()
> > > +                    .expect("Failed to convert include_path to &str!=
"),
> > > +            );
> > > +        }
> > > +    }
> > > +
> > > +    // Finish the builder and generate the bindings.
> > > +    let bindings =3D builder
> > >          .generate()
> > >          // Unwrap the Result and panic on failure.
> > >          .expect("Unable to generate bindings");
> > > @@ -30,10 +49,3 @@ fn generate_bindings() {
> > >          .write_to_file(out_path.join("bindings.rs"))
> > >          .expect("Couldn't write bindings!");
> > >  }
> > > -
> > > -fn main() {
> > > -    generate_bindings();
> > > -
> > > -    println!("cargo:rustc-link-search=3D./../../lib/.libs/");
> > > -    println!("cargo:rustc-link-lib=3Dgpiod");
> > > -}
> > > diff --git a/bindings/rust/libgpiod-sys/wrapper.h b/bindings/rust/lib=
gpiod-sys/wrapper.h
> > > new file mode 100644
> > > index 0000000..8a8bd41
> > > --- /dev/null
> > > +++ b/bindings/rust/libgpiod-sys/wrapper.h
> > > @@ -0,0 +1 @@
> > > +#include <gpiod.h>
> > > diff --git a/bindings/rust/libgpiod/Makefile.am b/bindings/rust/libgp=
iod/Makefile.am
> > > index e9a10c1..92edbfc 100644
> > > --- a/bindings/rust/libgpiod/Makefile.am
> > > +++ b/bindings/rust/libgpiod/Makefile.am
> > > @@ -2,7 +2,13 @@
> > >  # SPDX-FileCopyrightText: 2022 Linaro Ltd.
> > >  # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszew=
ski@linaro.org>
> > >
> > > -command =3D cargo build --release --lib
> > > +# We do not want to build against the system libs when building with=
 make. So we
> > > +# specify the paths to the build directory of the C lib.
> > > +command =3D SYSTEM_DEPS_LIBGPIOD_NO_PKG_CONFIG=3D1 \
> > > +               SYSTEM_DEPS_LIBGPIOD_SEARCH_NATIVE=3D"${PWD}/../../..=
/lib/.libs/" \
> > > +               SYSTEM_DEPS_LIBGPIOD_LIB=3Dgpiod \
> > > +               SYSTEM_DEPS_LIBGPIOD_INCLUDE=3D"${PWD}/../../../inclu=
de/"  \
> > > +               cargo build --release --lib
> > >
> > >  if WITH_TESTS
> > >  command +=3D --tests
> > >
> > > --
> > > 2.40.0
> > >
> >
> > When I build the rust bindings in-tree and run them like:
> >
> > sudo LD_LIBRARY_PATH=3D<snip>/libgpiod/lib/.libs/
> > CARGO_TARGET_DIR=3D/tmp/libgpiod-rust /root/.cargo/bin/cargo test
> >
> > I get
> >
> > error: failed to run custom build command for `libgpiod-sys v0.1.0
> > (<snip>/libgpiod/bindings/rust/libgpiod-sys)`
> >
> > Caused by:
> >   process didn't exit successfully:
> > `/tmp/libgpiod-rust/debug/build/libgpiod-sys-1d9e7999a2f148d2/build-scr=
ipt-build`
> > (exit status: 101)
> >   --- stdout
> >   cargo:rerun-if-env-changed=3DLIBGPIOD_NO_PKG_CONFIG
> >   cargo:rerun-if-env-changed=3DPKG_CONFIG_x86_64-unknown-linux-gnu
> >   cargo:rerun-if-env-changed=3DPKG_CONFIG_x86_64_unknown_linux_gnu
> >   cargo:rerun-if-env-changed=3DHOST_PKG_CONFIG
> >   cargo:rerun-if-env-changed=3DPKG_CONFIG
> >   cargo:rerun-if-env-changed=3DLIBGPIOD_STATIC
> >   cargo:rerun-if-env-changed=3DLIBGPIOD_DYNAMIC
> >   cargo:rerun-if-env-changed=3DPKG_CONFIG_ALL_STATIC
> >   cargo:rerun-if-env-changed=3DPKG_CONFIG_ALL_DYNAMIC
> >   cargo:rerun-if-env-changed=3DPKG_CONFIG_PATH_x86_64-unknown-linux-gnu
> >   cargo:rerun-if-env-changed=3DPKG_CONFIG_PATH_x86_64_unknown_linux_gnu
> >   cargo:rerun-if-env-changed=3DHOST_PKG_CONFIG_PATH
> >   cargo:rerun-if-env-changed=3DPKG_CONFIG_PATH
> >   cargo:rerun-if-env-changed=3DPKG_CONFIG_LIBDIR_x86_64-unknown-linux-g=
nu
> >   cargo:rerun-if-env-changed=3DPKG_CONFIG_LIBDIR_x86_64_unknown_linux_g=
nu
> >   cargo:rerun-if-env-changed=3DHOST_PKG_CONFIG_LIBDIR
> >   cargo:rerun-if-env-changed=3DPKG_CONFIG_LIBDIR
> >   cargo:rerun-if-env-changed=3DPKG_CONFIG_SYSROOT_DIR_x86_64-unknown-li=
nux-gnu
> >   cargo:rerun-if-env-changed=3DPKG_CONFIG_SYSROOT_DIR_x86_64_unknown_li=
nux_gnu
> >   cargo:rerun-if-env-changed=3DHOST_PKG_CONFIG_SYSROOT_DIR
> >   cargo:rerun-if-env-changed=3DPKG_CONFIG_SYSROOT_DIR
> >
> >   --- stderr
> >   thread 'main' panicked at 'called `Result::unwrap()` on an `Err`
> > value: PkgConfig(`"pkg-config" "--libs" "--cflags" "libgpiod"
> > "libgpiod >=3D 2"` did not exit successfully: exit status: 1
> >   error: could not find system library 'libgpiod' required by the
> > 'libgpiod-sys' crate
> >
> >   --- stderr
> >   Package libgpiod was not found in the pkg-config search path.
> >   Perhaps you should add the directory containing `libgpiod.pc'
> >   to the PKG_CONFIG_PATH environment variable
> >   Package 'libgpiod', required by 'virtual:world', not found
> >   Package 'libgpiod', required by 'virtual:world', not found
> >   )', libgpiod-sys/build.rs:13:51
> >   note: run with `RUST_BACKTRACE=3D1` environment variable to display a=
 backtrace
> >
> > What am I doing wrong?
> >
> > Bart
