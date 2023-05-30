Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2D371697C
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 18:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbjE3Q32 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 12:29:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233274AbjE3Q3Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 12:29:16 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A876FE46
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 09:28:41 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-96f5d651170so1141606566b.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 09:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685464056; x=1688056056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Fou1Cp+f2HPO1Iqn1BvkMm5/WMsf2AaWky1HN1XO5c=;
        b=UkeauWKXZssFzD0Qb3FW/BY7L49+5RRS4geD3y+wHLBrLajdMSZR1wN1bGkHLwyUKX
         idvshdkYTJlqXJaXGqH15XFzhSV+EX4B9R9ICDbL3YJGxOi0PVFvjAi1AZ26N78uWynB
         yKglFg5M5vWDrI/iF8MyGjD0WOjVz6yzrXJuzA0jltS7csD9Gm5xSZXjwTIr1IXlE4UE
         jd+hOOsyBvAIKPgrGjVY8j7/4sTVzYXbBieWREKCQj2+XsdLmOvxCHUeHt+oLBgV5CDW
         hqbSXDUj6dLpyZf5EyX+jBtcUWhK8L34U6ZTWdNCNBDWXdms81yaYpwcllljiG6C7zz3
         2VzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685464056; x=1688056056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Fou1Cp+f2HPO1Iqn1BvkMm5/WMsf2AaWky1HN1XO5c=;
        b=fZ2kh/PGLoFpt2IrUdKUpcsXcgGyVb8pyWtlajfh6UxzrLSBUCODWQTQSnG5olx109
         PP2VK/qpq0AfyzH6+q9XoC+5o58f68RrAcbW316BzHGlcvgzcb9CnTaK9SFDM5WeoII5
         yUS6reTvadYBn45hRzdw9nW8OzW1bECs4Rza5QpiHkdLkVJ8YENcd4WBE5xB7GKMhTYs
         rdDS8+x/9vScMnc6e8ERuho8sfd9BaiMZ+WzDTiWzaB3DoqI0n5ByNSIZ5EnxIctuXuX
         DUv9ypFI5yDNliMn1M0sLojgwfWXxxXlI1ubKQZgdqFhEwmijDAwcQMeXTjN0bEOiiCB
         GRQA==
X-Gm-Message-State: AC+VfDwDtzvIcJUXiQJXROwBAoobDboMsGlzzVE7h1EwQ4nohPwi1rgl
        bil1MeyffG36BT4STieyP2vOvxs+ZTk4r1eN76Ff3fJVPkxHR1HgGtxXQQ==
X-Google-Smtp-Source: ACHHUZ4u9qfG4SDj7L8h/4Fv/myc/vo00ZeQq4tcVHI3EvNSBzuHRBTOP1/M5590RIxjUtt459Ali6PscBQbloJd+nc=
X-Received: by 2002:a17:907:2682:b0:96f:7060:9654 with SMTP id
 bn2-20020a170907268200b0096f70609654mr9691347ejc.18.1685464056474; Tue, 30
 May 2023 09:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230522-crates-io-v2-0-d8de75e7f584@linaro.org>
 <20230522-crates-io-v2-2-d8de75e7f584@linaro.org> <CAMRc=McTnKDxxT-qii7VtDQMbd2aCdk8oM=9iK4aXC=udiymuQ@mail.gmail.com>
In-Reply-To: <CAMRc=McTnKDxxT-qii7VtDQMbd2aCdk8oM=9iK4aXC=udiymuQ@mail.gmail.com>
From:   Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date:   Tue, 30 May 2023 19:27:20 +0300
Message-ID: <CAAjaMXbE58V-LCKvhOJkJkyVzgDEws3D5Wnea5ikeccMZNRCSQ@mail.gmail.com>
Subject: Re: [PATCH libgpiod v2 2/2] bindings: rust: build against pkg-config info
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Erik Schilling <erik.schilling@linaro.org>,
        Linux-GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Bart,

this error means pkg-config could not find libgpiod. Erik changed the
linking logic, so now instead of linking a local copy of the library
it lets pkg-config find it. But you haven't installed it locally.

Running with these flags from a makefile in the commit:

command =3D SYSTEM_DEPS_LIBGPIOD_NO_PKG_CO
NFIG=3D1 \
+
SYSTEM_DEPS_LIBGPIOD_SEARCH_NATIVE=3D"${PWD}/../../../lib/.libs/" \
+               SYSTEM_DEPS_LIBGPIOD_LIB=3Dgpiod \
+               SYSTEM_DEPS_LIBGPIOD_INCLUDE=3D"${PWD}/../../../include/"  =
\
+               cargo build --release --lib

Should work.

On Tue, 30 May 2023 at 19:04, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Fri, May 26, 2023 at 5:28=E2=80=AFPM Erik Schilling
> <erik.schilling@linaro.org> wrote:
> >
> > This change replaces building against "bundled" headers by always
> > building agains system headers (while following standard conventions to
> > allow users to specify the version to build against).
> >
> > Reasoning:
> >
> > Previously, the code generated the bindings based on the headers, but
> > then links against `-lgpiod` without further specifying where that is
> > coming from.
> >
> > This results in some challenges and problems:
> >
> > 1. Packaging a Rust crate with `cargo package` requires the folder
> >    containing the Cargo.toml to be self-contained. Essentially, a tar
> >    ball with all the sources of that folder is created. Building agains=
t
> >    that tar ball fails, since the headers files passed to bindgen are
> >    a relative path pointing outside of that folder.
> >
> > 2. While, for example, the cxx bindings are built AND linked against
> >    the build results, the packaging situation for C++ libraries is a
> >    bit different compared to Rust libs. The C++ libs will likely get
> >    built as part of the larger libgpiod build and published together
> >    with the C variant.
> >
> >    In Rust, the vast majority of people will want to build the glue-cod=
e
> >    during the compilation of the applications that consume this lib.
> >
> >    This may lead to inconsistencies between the bundled headers and the
> >    libraries shipped by the user's distro. While ABI should hopefully
> >    be forward-compatible within the same MAJOR number of the .so,
> >    using too new headers will likely quickly lead to mismatches with
> >    symbols defined in the lib.
> >
> > 3. Trying to build the core lib as part of the Rust build quickly runs
> >    into similar packaging issues as the existing solution. The source
> >    code of the C lib would need to become part of some package
> >    (often people opt to pull it in as a submodule under their -sys crat=
e
> >    or even create a separate -src package [1]). This clearly does not
> >    work well with the current setup...
> >
> > Since building against system libs is probably? what 90%+ of the people
> > want, this change hopefully addresses the problems above. The
> > system-deps dependency honors pkg-config conventions, but also allows
> > users flexible ways to override the defaults [2]. Overall, this keeps
> > things simple while still allowing maximum flexibility.
> >
> > Since the pkg-config interface is just telling us which include paths t=
o
> > use, we switch back to a wrapper.h file that includes the real gpiod.h.
> >
> > Once Rust bindings require a lower version floor, the version metadata
> > can also be updated to help telling users that their system library is
> > too old.
> >
> > In order to support people hacking on the Rust bindings, building with
> > make will automatically set the right set of environment variables.
> > In case people want to customize it when building without `make`, a
> > reference to the system_deps documentation is given in the README.md.
> >
> > [1] https://github.com/alexcrichton/openssl-src-rs
> > [2] https://docs.rs/system-deps/latest/system_deps/#overriding-build-fl=
ags
> >
> > Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> > ---
> >  README                                |  4 +++-
> >  bindings/rust/libgpiod-sys/Cargo.toml |  4 ++++
> >  bindings/rust/libgpiod-sys/README.md  |  8 +++++++
> >  bindings/rust/libgpiod-sys/build.rs   | 40 +++++++++++++++++++++++----=
--------
> >  bindings/rust/libgpiod-sys/wrapper.h  |  1 +
> >  bindings/rust/libgpiod/Makefile.am    |  8 ++++++-
> >  6 files changed, 49 insertions(+), 16 deletions(-)
> >
> > diff --git a/README b/README
> > index 85b6300..5764eee 100644
> > --- a/README
> > +++ b/README
> > @@ -218,7 +218,9 @@ the PYTHON_CPPFLAGS and PYTHON_LIBS variables in or=
der to point the build
> >  system to the correct locations. During native builds, the configure s=
cript
> >  can auto-detect the location of the development files.
> >
> > -Rust bindings require cargo support.
> > +Rust bindings require cargo support. When building the Rust bindings a=
long the
> > +C library using make, they will be automatically configured to build a=
gainst the
> > +build results of the C library.
> >
> >  TESTING
> >  -------
> > diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libg=
piod-sys/Cargo.toml
> > index 2b20fa6..8b17039 100644
> > --- a/bindings/rust/libgpiod-sys/Cargo.toml
> > +++ b/bindings/rust/libgpiod-sys/Cargo.toml
> > @@ -18,3 +18,7 @@ edition =3D "2021"
> >
> >  [build-dependencies]
> >  bindgen =3D "0.63"
> > +system-deps =3D "2.0"
> > +
> > +[package.metadata.system-deps]
> > +libgpiod =3D "2"
> > diff --git a/bindings/rust/libgpiod-sys/README.md b/bindings/rust/libgp=
iod-sys/README.md
> > index 1cb3b0a..90198d8 100644
> > --- a/bindings/rust/libgpiod-sys/README.md
> > +++ b/bindings/rust/libgpiod-sys/README.md
> > @@ -8,6 +8,14 @@ SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kuma=
r@linaro.org>
> >  Automatically generated Rust FFI bindings via
> >         [bindgen](https://github.com/rust-lang/rust-bindgen).
> >
> > +## Build requirements
> > +
> > +A compatible variant of the C library needs to detectable using pkg-co=
nfig.
> > +Alternatively, one can inform the build system about the location of t=
he
> > +libs and headers by setting environment variables. The mechanism for t=
hat is
> > +documented in the
> > +[system_deps crate documentation](https://docs.rs/system-deps/6.1.0/sy=
stem_deps/#overriding-build-flags).
> > +
> >  ## License
> >
> >  This project is licensed under either of
> > diff --git a/bindings/rust/libgpiod-sys/build.rs b/bindings/rust/libgpi=
od-sys/build.rs
> > index 0ac2730..9e6a93c 100644
> > --- a/bindings/rust/libgpiod-sys/build.rs
> > +++ b/bindings/rust/libgpiod-sys/build.rs
> > @@ -1,25 +1,44 @@
> >  // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
> > -// SPDX-FileCopyrightText: 2022 Linaro Ltd.
> > +// SPDX-FileCopyrightText: 2022-2023 Linaro Ltd.
> >  // SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> > +// SPDX-FileCopyrightText: 2023 Erik Schilling <erik.schilling@linaro.=
org>
> >
> >  use std::env;
> >  use std::path::PathBuf;
> >
> > -fn generate_bindings() {
> > +fn main() {
> > +    // Probe dependency info based on the metadata from Cargo.toml
> > +    // (and potentially other sources like environment, pkg-config, ..=
.)
> > +    // https://docs.rs/system-deps/latest/system_deps/#overriding-buil=
d-flags
> > +    let libs =3D system_deps::Config::new().probe().unwrap();
> > +
> >      // Tell cargo to invalidate the built crate whenever following fil=
es change
> > -    println!("cargo:rerun-if-changed=3D../../../include/gpiod.h");
> > +    println!("cargo:rerun-if-changed=3Dwrapper.h");
> >
> >      // The bindgen::Builder is the main entry point
> >      // to bindgen, and lets you build up options for
> >      // the resulting bindings.
> > -    let bindings =3D bindgen::Builder::default()
> > +    let mut builder =3D bindgen::Builder::default()
> >          // The input header we would like to generate
> >          // bindings for.
> > -        .header("../../../include/gpiod.h")
> > +        .header("wrapper.h")
> >          // Tell cargo to invalidate the built crate whenever any of th=
e
> >          // included header files changed.
> > -        .parse_callbacks(Box::new(bindgen::CargoCallbacks))
> > -        // Finish the builder and generate the bindings.
> > +        .parse_callbacks(Box::new(bindgen::CargoCallbacks));
> > +
> > +    // Inform bindgen about the include paths identified by system_dep=
s.
> > +    for (_name, lib) in libs {
> > +        for include_path in lib.include_paths {
> > +            builder =3D builder.clang_arg("-I").clang_arg(
> > +                include_path
> > +                    .to_str()
> > +                    .expect("Failed to convert include_path to &str!")=
,
> > +            );
> > +        }
> > +    }
> > +
> > +    // Finish the builder and generate the bindings.
> > +    let bindings =3D builder
> >          .generate()
> >          // Unwrap the Result and panic on failure.
> >          .expect("Unable to generate bindings");
> > @@ -30,10 +49,3 @@ fn generate_bindings() {
> >          .write_to_file(out_path.join("bindings.rs"))
> >          .expect("Couldn't write bindings!");
> >  }
> > -
> > -fn main() {
> > -    generate_bindings();
> > -
> > -    println!("cargo:rustc-link-search=3D./../../lib/.libs/");
> > -    println!("cargo:rustc-link-lib=3Dgpiod");
> > -}
> > diff --git a/bindings/rust/libgpiod-sys/wrapper.h b/bindings/rust/libgp=
iod-sys/wrapper.h
> > new file mode 100644
> > index 0000000..8a8bd41
> > --- /dev/null
> > +++ b/bindings/rust/libgpiod-sys/wrapper.h
> > @@ -0,0 +1 @@
> > +#include <gpiod.h>
> > diff --git a/bindings/rust/libgpiod/Makefile.am b/bindings/rust/libgpio=
d/Makefile.am
> > index e9a10c1..92edbfc 100644
> > --- a/bindings/rust/libgpiod/Makefile.am
> > +++ b/bindings/rust/libgpiod/Makefile.am
> > @@ -2,7 +2,13 @@
> >  # SPDX-FileCopyrightText: 2022 Linaro Ltd.
> >  # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewsk=
i@linaro.org>
> >
> > -command =3D cargo build --release --lib
> > +# We do not want to build against the system libs when building with m=
ake. So we
> > +# specify the paths to the build directory of the C lib.
> > +command =3D SYSTEM_DEPS_LIBGPIOD_NO_PKG_CONFIG=3D1 \
> > +               SYSTEM_DEPS_LIBGPIOD_SEARCH_NATIVE=3D"${PWD}/../../../l=
ib/.libs/" \
> > +               SYSTEM_DEPS_LIBGPIOD_LIB=3Dgpiod \
> > +               SYSTEM_DEPS_LIBGPIOD_INCLUDE=3D"${PWD}/../../../include=
/"  \
> > +               cargo build --release --lib
> >
> >  if WITH_TESTS
> >  command +=3D --tests
> >
> > --
> > 2.40.0
> >
>
> When I build the rust bindings in-tree and run them like:
>
> sudo LD_LIBRARY_PATH=3D<snip>/libgpiod/lib/.libs/
> CARGO_TARGET_DIR=3D/tmp/libgpiod-rust /root/.cargo/bin/cargo test
>
> I get
>
> error: failed to run custom build command for `libgpiod-sys v0.1.0
> (<snip>/libgpiod/bindings/rust/libgpiod-sys)`
>
> Caused by:
>   process didn't exit successfully:
> `/tmp/libgpiod-rust/debug/build/libgpiod-sys-1d9e7999a2f148d2/build-scrip=
t-build`
> (exit status: 101)
>   --- stdout
>   cargo:rerun-if-env-changed=3DLIBGPIOD_NO_PKG_CONFIG
>   cargo:rerun-if-env-changed=3DPKG_CONFIG_x86_64-unknown-linux-gnu
>   cargo:rerun-if-env-changed=3DPKG_CONFIG_x86_64_unknown_linux_gnu
>   cargo:rerun-if-env-changed=3DHOST_PKG_CONFIG
>   cargo:rerun-if-env-changed=3DPKG_CONFIG
>   cargo:rerun-if-env-changed=3DLIBGPIOD_STATIC
>   cargo:rerun-if-env-changed=3DLIBGPIOD_DYNAMIC
>   cargo:rerun-if-env-changed=3DPKG_CONFIG_ALL_STATIC
>   cargo:rerun-if-env-changed=3DPKG_CONFIG_ALL_DYNAMIC
>   cargo:rerun-if-env-changed=3DPKG_CONFIG_PATH_x86_64-unknown-linux-gnu
>   cargo:rerun-if-env-changed=3DPKG_CONFIG_PATH_x86_64_unknown_linux_gnu
>   cargo:rerun-if-env-changed=3DHOST_PKG_CONFIG_PATH
>   cargo:rerun-if-env-changed=3DPKG_CONFIG_PATH
>   cargo:rerun-if-env-changed=3DPKG_CONFIG_LIBDIR_x86_64-unknown-linux-gnu
>   cargo:rerun-if-env-changed=3DPKG_CONFIG_LIBDIR_x86_64_unknown_linux_gnu
>   cargo:rerun-if-env-changed=3DHOST_PKG_CONFIG_LIBDIR
>   cargo:rerun-if-env-changed=3DPKG_CONFIG_LIBDIR
>   cargo:rerun-if-env-changed=3DPKG_CONFIG_SYSROOT_DIR_x86_64-unknown-linu=
x-gnu
>   cargo:rerun-if-env-changed=3DPKG_CONFIG_SYSROOT_DIR_x86_64_unknown_linu=
x_gnu
>   cargo:rerun-if-env-changed=3DHOST_PKG_CONFIG_SYSROOT_DIR
>   cargo:rerun-if-env-changed=3DPKG_CONFIG_SYSROOT_DIR
>
>   --- stderr
>   thread 'main' panicked at 'called `Result::unwrap()` on an `Err`
> value: PkgConfig(`"pkg-config" "--libs" "--cflags" "libgpiod"
> "libgpiod >=3D 2"` did not exit successfully: exit status: 1
>   error: could not find system library 'libgpiod' required by the
> 'libgpiod-sys' crate
>
>   --- stderr
>   Package libgpiod was not found in the pkg-config search path.
>   Perhaps you should add the directory containing `libgpiod.pc'
>   to the PKG_CONFIG_PATH environment variable
>   Package 'libgpiod', required by 'virtual:world', not found
>   Package 'libgpiod', required by 'virtual:world', not found
>   )', libgpiod-sys/build.rs:13:51
>   note: run with `RUST_BACKTRACE=3D1` environment variable to display a b=
acktrace
>
> What am I doing wrong?
>
> Bart
