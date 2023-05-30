Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D092571689E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 18:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232773AbjE3QFg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 12:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233487AbjE3QFY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 12:05:24 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC5BEEC
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 09:04:50 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-3f6c6020cfbso24524971cf.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 09:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685462689; x=1688054689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jhn18xnnroqddFwBaaUPn48ALOklY+ZdPEbMFaVNnsk=;
        b=bTD1DSwSBQ2wb6fAHxZpNKHJC1MzlaKLULNEF2es5Fp33CB7Mo0mTyIp4WD+4KB1ug
         ybafxnoS+iqwtoulVEIBesfc/tX/O6KBk/dd6NFZEPS7MwrC3Tqe6N6gLBx9+HlLCDNq
         VoTaet9RggnRKaucfrfZ8cRcS3EklvK8TPbtzBvY/MFd6EndzKdf7VUZ4cvMPN3rlGTt
         5sKEGkq/ri8zbbjXwkniEAnjTPrnPh3uegMDsjW/UGfCUBHSPXy6gqkQSIQg5zK1OIX/
         2BUvQYqARCGHEr03gjFfI02oe8bdAr4JOAQy7uL4BtRJyOBUFudBCSqZ8gQ9wpoh1WO0
         5mGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685462689; x=1688054689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jhn18xnnroqddFwBaaUPn48ALOklY+ZdPEbMFaVNnsk=;
        b=clj1AZENDwqD370nmhw6aTbGhKHHjBK+vTXyYTP9xQNFq3oiLRQVYSHnZz0BVECkuI
         2TVAj2YiHDPNFEIfZsA7iEkRN6fZ/vTO+qmr0912utwglNQg3iwNUE8xeF7cXTfA31iH
         yFYiSU9jQ7k3PZvCu5mQjY/6KD/fubKLN1ycvVG223zptrcBQTwbSc2D/vSDYXcgDfu0
         U7xmL9g0VIUxXb6kvacwq/AVAmT9F8hRCEVuhf/yooMRdJRF1J4JNcnH9TKNqtmY1LNe
         u3lmtk9Q8kDsyXfXoDJCltADD6RXD5Y6XDxun7NabDxrOKIc5zs4c6WKjLBi3XfpLKvu
         vBGw==
X-Gm-Message-State: AC+VfDwEH7Tn9u2o3gGP+wySvmbzt4LCpn1OwP4w+QLM8ZRUSBnuE/D8
        w+WSPcotiFltSMZmxSh0nQ1jdsdWHaNYAHUf9x+kfw==
X-Google-Smtp-Source: ACHHUZ7np1KHoTBtevhneUt1SQUH6lQRudmJiZ+IZaar/i4C9RwXPOkA9lEvtfiPQ9tx3cFGuxoMypLlXuCp83qA+/0=
X-Received: by 2002:ac8:5f85:0:b0:3f6:b2dd:b4dd with SMTP id
 j5-20020ac85f85000000b003f6b2ddb4ddmr2227882qta.59.1685462688742; Tue, 30 May
 2023 09:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230522-crates-io-v2-0-d8de75e7f584@linaro.org> <20230522-crates-io-v2-2-d8de75e7f584@linaro.org>
In-Reply-To: <20230522-crates-io-v2-2-d8de75e7f584@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 30 May 2023 18:04:37 +0200
Message-ID: <CAMRc=McTnKDxxT-qii7VtDQMbd2aCdk8oM=9iK4aXC=udiymuQ@mail.gmail.com>
Subject: Re: [PATCH libgpiod v2 2/2] bindings: rust: build against pkg-config info
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
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

On Fri, May 26, 2023 at 5:28=E2=80=AFPM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> This change replaces building against "bundled" headers by always
> building agains system headers (while following standard conventions to
> allow users to specify the version to build against).
>
> Reasoning:
>
> Previously, the code generated the bindings based on the headers, but
> then links against `-lgpiod` without further specifying where that is
> coming from.
>
> This results in some challenges and problems:
>
> 1. Packaging a Rust crate with `cargo package` requires the folder
>    containing the Cargo.toml to be self-contained. Essentially, a tar
>    ball with all the sources of that folder is created. Building against
>    that tar ball fails, since the headers files passed to bindgen are
>    a relative path pointing outside of that folder.
>
> 2. While, for example, the cxx bindings are built AND linked against
>    the build results, the packaging situation for C++ libraries is a
>    bit different compared to Rust libs. The C++ libs will likely get
>    built as part of the larger libgpiod build and published together
>    with the C variant.
>
>    In Rust, the vast majority of people will want to build the glue-code
>    during the compilation of the applications that consume this lib.
>
>    This may lead to inconsistencies between the bundled headers and the
>    libraries shipped by the user's distro. While ABI should hopefully
>    be forward-compatible within the same MAJOR number of the .so,
>    using too new headers will likely quickly lead to mismatches with
>    symbols defined in the lib.
>
> 3. Trying to build the core lib as part of the Rust build quickly runs
>    into similar packaging issues as the existing solution. The source
>    code of the C lib would need to become part of some package
>    (often people opt to pull it in as a submodule under their -sys crate
>    or even create a separate -src package [1]). This clearly does not
>    work well with the current setup...
>
> Since building against system libs is probably? what 90%+ of the people
> want, this change hopefully addresses the problems above. The
> system-deps dependency honors pkg-config conventions, but also allows
> users flexible ways to override the defaults [2]. Overall, this keeps
> things simple while still allowing maximum flexibility.
>
> Since the pkg-config interface is just telling us which include paths to
> use, we switch back to a wrapper.h file that includes the real gpiod.h.
>
> Once Rust bindings require a lower version floor, the version metadata
> can also be updated to help telling users that their system library is
> too old.
>
> In order to support people hacking on the Rust bindings, building with
> make will automatically set the right set of environment variables.
> In case people want to customize it when building without `make`, a
> reference to the system_deps documentation is given in the README.md.
>
> [1] https://github.com/alexcrichton/openssl-src-rs
> [2] https://docs.rs/system-deps/latest/system_deps/#overriding-build-flag=
s
>
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
>  README                                |  4 +++-
>  bindings/rust/libgpiod-sys/Cargo.toml |  4 ++++
>  bindings/rust/libgpiod-sys/README.md  |  8 +++++++
>  bindings/rust/libgpiod-sys/build.rs   | 40 +++++++++++++++++++++++------=
------
>  bindings/rust/libgpiod-sys/wrapper.h  |  1 +
>  bindings/rust/libgpiod/Makefile.am    |  8 ++++++-
>  6 files changed, 49 insertions(+), 16 deletions(-)
>
> diff --git a/README b/README
> index 85b6300..5764eee 100644
> --- a/README
> +++ b/README
> @@ -218,7 +218,9 @@ the PYTHON_CPPFLAGS and PYTHON_LIBS variables in orde=
r to point the build
>  system to the correct locations. During native builds, the configure scr=
ipt
>  can auto-detect the location of the development files.
>
> -Rust bindings require cargo support.
> +Rust bindings require cargo support. When building the Rust bindings alo=
ng the
> +C library using make, they will be automatically configured to build aga=
inst the
> +build results of the C library.
>
>  TESTING
>  -------
> diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpi=
od-sys/Cargo.toml
> index 2b20fa6..8b17039 100644
> --- a/bindings/rust/libgpiod-sys/Cargo.toml
> +++ b/bindings/rust/libgpiod-sys/Cargo.toml
> @@ -18,3 +18,7 @@ edition =3D "2021"
>
>  [build-dependencies]
>  bindgen =3D "0.63"
> +system-deps =3D "2.0"
> +
> +[package.metadata.system-deps]
> +libgpiod =3D "2"
> diff --git a/bindings/rust/libgpiod-sys/README.md b/bindings/rust/libgpio=
d-sys/README.md
> index 1cb3b0a..90198d8 100644
> --- a/bindings/rust/libgpiod-sys/README.md
> +++ b/bindings/rust/libgpiod-sys/README.md
> @@ -8,6 +8,14 @@ SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@=
linaro.org>
>  Automatically generated Rust FFI bindings via
>         [bindgen](https://github.com/rust-lang/rust-bindgen).
>
> +## Build requirements
> +
> +A compatible variant of the C library needs to detectable using pkg-conf=
ig.
> +Alternatively, one can inform the build system about the location of the
> +libs and headers by setting environment variables. The mechanism for tha=
t is
> +documented in the
> +[system_deps crate documentation](https://docs.rs/system-deps/6.1.0/syst=
em_deps/#overriding-build-flags).
> +
>  ## License
>
>  This project is licensed under either of
> diff --git a/bindings/rust/libgpiod-sys/build.rs b/bindings/rust/libgpiod=
-sys/build.rs
> index 0ac2730..9e6a93c 100644
> --- a/bindings/rust/libgpiod-sys/build.rs
> +++ b/bindings/rust/libgpiod-sys/build.rs
> @@ -1,25 +1,44 @@
>  // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
> -// SPDX-FileCopyrightText: 2022 Linaro Ltd.
> +// SPDX-FileCopyrightText: 2022-2023 Linaro Ltd.
>  // SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2023 Erik Schilling <erik.schilling@linaro.or=
g>
>
>  use std::env;
>  use std::path::PathBuf;
>
> -fn generate_bindings() {
> +fn main() {
> +    // Probe dependency info based on the metadata from Cargo.toml
> +    // (and potentially other sources like environment, pkg-config, ...)
> +    // https://docs.rs/system-deps/latest/system_deps/#overriding-build-=
flags
> +    let libs =3D system_deps::Config::new().probe().unwrap();
> +
>      // Tell cargo to invalidate the built crate whenever following files=
 change
> -    println!("cargo:rerun-if-changed=3D../../../include/gpiod.h");
> +    println!("cargo:rerun-if-changed=3Dwrapper.h");
>
>      // The bindgen::Builder is the main entry point
>      // to bindgen, and lets you build up options for
>      // the resulting bindings.
> -    let bindings =3D bindgen::Builder::default()
> +    let mut builder =3D bindgen::Builder::default()
>          // The input header we would like to generate
>          // bindings for.
> -        .header("../../../include/gpiod.h")
> +        .header("wrapper.h")
>          // Tell cargo to invalidate the built crate whenever any of the
>          // included header files changed.
> -        .parse_callbacks(Box::new(bindgen::CargoCallbacks))
> -        // Finish the builder and generate the bindings.
> +        .parse_callbacks(Box::new(bindgen::CargoCallbacks));
> +
> +    // Inform bindgen about the include paths identified by system_deps.
> +    for (_name, lib) in libs {
> +        for include_path in lib.include_paths {
> +            builder =3D builder.clang_arg("-I").clang_arg(
> +                include_path
> +                    .to_str()
> +                    .expect("Failed to convert include_path to &str!"),
> +            );
> +        }
> +    }
> +
> +    // Finish the builder and generate the bindings.
> +    let bindings =3D builder
>          .generate()
>          // Unwrap the Result and panic on failure.
>          .expect("Unable to generate bindings");
> @@ -30,10 +49,3 @@ fn generate_bindings() {
>          .write_to_file(out_path.join("bindings.rs"))
>          .expect("Couldn't write bindings!");
>  }
> -
> -fn main() {
> -    generate_bindings();
> -
> -    println!("cargo:rustc-link-search=3D./../../lib/.libs/");
> -    println!("cargo:rustc-link-lib=3Dgpiod");
> -}
> diff --git a/bindings/rust/libgpiod-sys/wrapper.h b/bindings/rust/libgpio=
d-sys/wrapper.h
> new file mode 100644
> index 0000000..8a8bd41
> --- /dev/null
> +++ b/bindings/rust/libgpiod-sys/wrapper.h
> @@ -0,0 +1 @@
> +#include <gpiod.h>
> diff --git a/bindings/rust/libgpiod/Makefile.am b/bindings/rust/libgpiod/=
Makefile.am
> index e9a10c1..92edbfc 100644
> --- a/bindings/rust/libgpiod/Makefile.am
> +++ b/bindings/rust/libgpiod/Makefile.am
> @@ -2,7 +2,13 @@
>  # SPDX-FileCopyrightText: 2022 Linaro Ltd.
>  # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@=
linaro.org>
>
> -command =3D cargo build --release --lib
> +# We do not want to build against the system libs when building with mak=
e. So we
> +# specify the paths to the build directory of the C lib.
> +command =3D SYSTEM_DEPS_LIBGPIOD_NO_PKG_CONFIG=3D1 \
> +               SYSTEM_DEPS_LIBGPIOD_SEARCH_NATIVE=3D"${PWD}/../../../lib=
/.libs/" \
> +               SYSTEM_DEPS_LIBGPIOD_LIB=3Dgpiod \
> +               SYSTEM_DEPS_LIBGPIOD_INCLUDE=3D"${PWD}/../../../include/"=
  \
> +               cargo build --release --lib
>
>  if WITH_TESTS
>  command +=3D --tests
>
> --
> 2.40.0
>

When I build the rust bindings in-tree and run them like:

sudo LD_LIBRARY_PATH=3D<snip>/libgpiod/lib/.libs/
CARGO_TARGET_DIR=3D/tmp/libgpiod-rust /root/.cargo/bin/cargo test

I get

error: failed to run custom build command for `libgpiod-sys v0.1.0
(<snip>/libgpiod/bindings/rust/libgpiod-sys)`

Caused by:
  process didn't exit successfully:
`/tmp/libgpiod-rust/debug/build/libgpiod-sys-1d9e7999a2f148d2/build-script-=
build`
(exit status: 101)
  --- stdout
  cargo:rerun-if-env-changed=3DLIBGPIOD_NO_PKG_CONFIG
  cargo:rerun-if-env-changed=3DPKG_CONFIG_x86_64-unknown-linux-gnu
  cargo:rerun-if-env-changed=3DPKG_CONFIG_x86_64_unknown_linux_gnu
  cargo:rerun-if-env-changed=3DHOST_PKG_CONFIG
  cargo:rerun-if-env-changed=3DPKG_CONFIG
  cargo:rerun-if-env-changed=3DLIBGPIOD_STATIC
  cargo:rerun-if-env-changed=3DLIBGPIOD_DYNAMIC
  cargo:rerun-if-env-changed=3DPKG_CONFIG_ALL_STATIC
  cargo:rerun-if-env-changed=3DPKG_CONFIG_ALL_DYNAMIC
  cargo:rerun-if-env-changed=3DPKG_CONFIG_PATH_x86_64-unknown-linux-gnu
  cargo:rerun-if-env-changed=3DPKG_CONFIG_PATH_x86_64_unknown_linux_gnu
  cargo:rerun-if-env-changed=3DHOST_PKG_CONFIG_PATH
  cargo:rerun-if-env-changed=3DPKG_CONFIG_PATH
  cargo:rerun-if-env-changed=3DPKG_CONFIG_LIBDIR_x86_64-unknown-linux-gnu
  cargo:rerun-if-env-changed=3DPKG_CONFIG_LIBDIR_x86_64_unknown_linux_gnu
  cargo:rerun-if-env-changed=3DHOST_PKG_CONFIG_LIBDIR
  cargo:rerun-if-env-changed=3DPKG_CONFIG_LIBDIR
  cargo:rerun-if-env-changed=3DPKG_CONFIG_SYSROOT_DIR_x86_64-unknown-linux-=
gnu
  cargo:rerun-if-env-changed=3DPKG_CONFIG_SYSROOT_DIR_x86_64_unknown_linux_=
gnu
  cargo:rerun-if-env-changed=3DHOST_PKG_CONFIG_SYSROOT_DIR
  cargo:rerun-if-env-changed=3DPKG_CONFIG_SYSROOT_DIR

  --- stderr
  thread 'main' panicked at 'called `Result::unwrap()` on an `Err`
value: PkgConfig(`"pkg-config" "--libs" "--cflags" "libgpiod"
"libgpiod >=3D 2"` did not exit successfully: exit status: 1
  error: could not find system library 'libgpiod' required by the
'libgpiod-sys' crate

  --- stderr
  Package libgpiod was not found in the pkg-config search path.
  Perhaps you should add the directory containing `libgpiod.pc'
  to the PKG_CONFIG_PATH environment variable
  Package 'libgpiod', required by 'virtual:world', not found
  Package 'libgpiod', required by 'virtual:world', not found
  )', libgpiod-sys/build.rs:13:51
  note: run with `RUST_BACKTRACE=3D1` environment variable to display a bac=
ktrace

What am I doing wrong?

Bart
