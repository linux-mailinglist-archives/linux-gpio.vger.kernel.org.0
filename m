Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56A527CF944
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Oct 2023 14:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345442AbjJSMpx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Oct 2023 08:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345380AbjJSMpw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Oct 2023 08:45:52 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C34C791
        for <linux-gpio@vger.kernel.org>; Thu, 19 Oct 2023 05:45:49 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-457c25de456so2732293137.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Oct 2023 05:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697719549; x=1698324349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEEItNpbLUp9hT+2waoj/8pO421w+gr9whQVhz5ryoc=;
        b=q1KcfFGM6txz+rVrBWW8ccUw4SDEVVmA3KwqzZuofiCZ6nY8GX0LFrXipdj6GGL17q
         YdMYbBoxTxsdRthT9AyzSww1bK8eaaVK+Du243zErpBe5EI/hES3OLAtIPPFkbbEbYkM
         IBmpcSLdvSbwGbndovwRyRtpCKqsed2w3UwUwqr/dHSSUXZYhUlljhoGY4reVQFzvzWg
         yZuY+b6Rn46h8syrlmkfF1bicgYLm5odZM/ACrbeOEI7yflbld9IdGKFrH3ehaf2vwvt
         uuPRZQ8ZiUsKxQh+PK5/2s0nNR48qOxufyFoiAVuQ4MtsW/83Q7CtvBabEaMZ2w7ioVE
         dHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697719549; x=1698324349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zEEItNpbLUp9hT+2waoj/8pO421w+gr9whQVhz5ryoc=;
        b=Atm9yWI3seCdj2wiGS1EekEcig1OzCdPsxc/9NyjXaSLmzeJ1azL5GV0/gyDtcx0Bt
         pONJxFVtOLbelq/e9BYWlHaC/+XxZINcx1KnDcKb+q85LtBVleDmv/vsv/+T4nCrsSAW
         KdPGgeV4p1ZbWOPYr/C4nZSaXChxwgKCmD59LSbgUXMVj6J+Wfk3tk1/Rq+bEVpm/nve
         hRiARqMxQ3dFSYnAhY6bxYDSPDQlrMO/kAC24wC0pJIM9mOsl5rNItfxkoYaAQgR1/Qb
         iF63JT9x6FbyCk2uBSnwCxzOJ2+uukw5HUscrQXLVcVPwZ/U6B0qPETW0+Oy1W1daiU0
         2e6g==
X-Gm-Message-State: AOJu0YwmG8hVJCtFhU6fj/jGnd9GVU83mDcWgWSALy3mEtBKpJLR7fAT
        LiClcMZV0DNQTNGEkiNFjcVViyZx+g+vp1AWLhDVld3Fxx5nfk5HubA=
X-Google-Smtp-Source: AGHT+IGHhopZBndFcOy8J2/5ZDo0Ok30i0nd8PyDIhxtiwjkc+GK9YVyBpK+gLSe6r52rpjxETWYgdvM7Sk8yc6kQag=
X-Received: by 2002:a67:cc01:0:b0:457:efe6:bebd with SMTP id
 q1-20020a67cc01000000b00457efe6bebdmr1365976vsl.6.1697719548792; Thu, 19 Oct
 2023 05:45:48 -0700 (PDT)
MIME-Version: 1.0
References: <20231018205728.284068-1-phil@gadgetoid.com> <20231018205728.284068-2-phil@gadgetoid.com>
 <CAMRc=MfsVNY7cPWpFRxV8pF5hoXHQWjXCmBzGsg58sFO+UEeog@mail.gmail.com> <CA+kSVo9fDLkfp2zL=9XUppLVK=TpOnBZVmyrL80CKHprLfHnHg@mail.gmail.com>
In-Reply-To: <CA+kSVo9fDLkfp2zL=9XUppLVK=TpOnBZVmyrL80CKHprLfHnHg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 19 Oct 2023 14:45:37 +0200
Message-ID: <CAMRc=MdJYyi706hVtcVWY0ozcq9BNn7Eup3XbNTM2Q3fn=+n1A@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v5 1/1] bindings: python: optionally include
 module in sdist
To:     Phil Howard <phil@gadgetoid.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 19, 2023 at 12:42=E2=80=AFPM Phil Howard <phil@gadgetoid.com> w=
rote:
>
> On Thu, 19 Oct 2023 at 10:41, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Wed, Oct 18, 2023 at 10:57=E2=80=AFPM Phil Howard <phil@gadgetoid.co=
m> wrote:
> > >
> > > Optionally vendor libgpiod source into sdist so that the Python modul=
e can
> > > be built from source, even with a missing or mismatched system libgpi=
od.
> > >
> > > Add two new environment variables "LINK_SYSTEM_LIBGPIOD" and
> > > "GPIOD_VERSION" to control what kind of package setup.py will build.
> > >
> > > In order to build an sdist or wheel package with a vendored libgpiod =
a
> > > version must be specified via the "GPIOD_VERSION" environment variabl=
e.
> > >
> > > This will instruct setup.py to fetch the tarball matching the request=
ed
> > > version from git.kernel.org, unpack it, and copy the lib and include
> > > directories into the package root so they can be included in sdist or=
 used
> > > to build a binary wheel.
> > >
> > > eg: GPIOD_VERSION=3D2.0.2 python3 setup.py sdist
> > >
> > > Will build a source distribution with gpiod version 2.0.2 source incl=
uded.
> > >
> > > It will also save the gpiod version into "gpiod-version.txt" so that =
it can
> > > be passed to the build when the sdist is built by pip.
> > >
> > > Requiring an explicit version ensures that the Python bindings - whic=
h
> > > can be changed and versions independent of libgpiod -  are built agai=
nst a
> > > stable libgpiod release.
> > >
> > > In order to force a package with vendored gpiod source to link the sy=
stem
> > > libgpiod, the "LINK_SYSTEM_LIBGPIOD" environment variable can be used=
:
> > >
> > > eg: LINK_SYSTEM_LIBGPIOD=3D1 pip install libgpiod
> > >
> > > Signed-off-by: Phil Howard <phil@gadgetoid.com>
> > > ---
> > >  bindings/python/MANIFEST.in |   5 ++
> > >  bindings/python/setup.py    | 131 +++++++++++++++++++++++++++++++++-=
--
> > >  2 files changed, 125 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/bindings/python/MANIFEST.in b/bindings/python/MANIFEST.i=
n
> > > index c7124d4..0aa9079 100644
> > > --- a/bindings/python/MANIFEST.in
> > > +++ b/bindings/python/MANIFEST.in
> > > @@ -2,6 +2,7 @@
> > >  # SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszew=
ski@linaro.org>
> > >
> > >  include setup.py
> > > +include gpiod-version.txt
> > >
> > >  recursive-include gpiod *.py
> > >  recursive-include tests *.py
> > > @@ -11,3 +12,7 @@ recursive-include gpiod/ext *.h
> > >
> > >  recursive-include tests/gpiosim *.c
> > >  recursive-include tests/procname *.c
> > > +
> > > +recursive-include lib *.c
> > > +recursive-include lib *.h
> > > +recursive-include include *.h
> > > diff --git a/bindings/python/setup.py b/bindings/python/setup.py
> > > index df10e18..f0d5c1f 100644
> > > --- a/bindings/python/setup.py
> > > +++ b/bindings/python/setup.py
> > > @@ -1,24 +1,136 @@
> > >  # SPDX-License-Identifier: GPL-2.0-or-later
> > >  # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> > >
> > > -from os import environ, path
> > > -from setuptools import setup, Extension, find_packages
> > > +import tarfile
> > > +from os import getenv, path, unlink
> > > +from shutil import copytree, rmtree
> > > +from urllib.request import urlretrieve
> >
> > Doesn't it make our setup.py depend on additional packages on top of
> > the standard library?
>
> "tarfile" and "urllib" are both part of the CPython standard library [1]
>

Yocto has a separate recipe for urllib3 but also has an urllib module
in python3-core. Is this expected? What is the relationship between
the two?

> They'd be in pip otherwise, since it would necessarily need to fetch and
> unpack tarballs like the sdist. (pip has a habit of vendoring things)

Yocto doesn't use pip, it fetches the sources over http. All
dependencies must be satisfied by existing yocto recipes.

>
> If there are cases where these are missing (Yocto weirdness?) then I can
> move the imports to just-in-time so they're a soft dependency only for
> when a package is built.
>

Yocto has a different weirdness - it splits the standard library into
~65 separate packages so that you can keep the image small if you
don't need the entire thing.

> [1] - https://docs.python.org/3/library/index.html
>
> >
> > > +
> > > +from setuptools import Extension, find_packages, setup
> > >  from setuptools.command.build_ext import build_ext as orig_build_ext
> > > -from shutil import rmtree
> > > +from setuptools.command.sdist import sdist as orig_sdist
> > > +
> > > +LINK_SYSTEM_LIBGPIOD =3D getenv("LINK_SYSTEM_LIBGPIOD") =3D=3D "1"
> > > +GPIOD_VERSION =3D getenv("GPIOD_VERSION")
> >
> > I'd call it LIBGPIOD_VERSION to be more explicit.
> >
> > > +GPIOD_WITH_TESTS =3D getenv("GPIOD_WITH_TESTS") =3D=3D "1"
> > > +SRC_BASE_URL =3D "https://git.kernel.org/pub/scm/libs/libgpiod/libgp=
iod.git/snapshot/"
> >
> > I would prefer to use the http mirror at
> > https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/ rather
> > than git snapshots. We have better control over what's in there
>
> Yessir!
>
> > and we can even verify the checksums after download if needed.
>
> We can pull the checksum from sha256sums.asc and verify with hashlib
> but we can't verify the gpg signature without a dependency I think.
>
> >
> > > +SRC_FILENAME =3D "libgpiod-{version}.tar.gz"
> >
> > Maybe put it in /tmp?
>
> Sure "tempfile" is also in the stl, so might as well use it!
>

Sounds good!

Bart

> >
> > Bart
> >
> > > +
> > > +# __version__
> > > +with open("gpiod/version.py", "r") as fd:
> > > +    exec(fd.read())
> > > +
> > > +
> > > +def fetch_tarball(func):
> > > +    # If no GPIOD_VERSION is specified in env, just run the task
> > > +    if GPIOD_VERSION is None:
> > > +        return func
> > > +
> > > +    # If GPIOD_VERSION is specified, fetch the requested version tar=
ball
> > > +    # and create gpiod-version.txt so the sdist package knows what v=
ersion
> > > +    # it's building.
> > > +    def wrapper(self):
> > > +        TARBALL =3D SRC_FILENAME.format(version=3DGPIOD_VERSION)
> > > +
> > > +        print(f"fetching: {SRC_BASE_URL + TARBALL}")
> > > +
> > > +        filename, headers =3D urlretrieve(SRC_BASE_URL + TARBALL, TA=
RBALL)
> > > +
> > > +        if not tarfile.is_tarfile(filename):
> > > +            print(f"error: refusing to build sdist (invalid tarball =
{TARBALL})")
> > > +            return
> > > +
> > > +        # Unpack the downloaded tarball
> > > +        print(f"unpacking: {filename}")
> > > +        file =3D tarfile.open(filename)
> > > +        file.extractall(".")
> > > +        file.close()
> > > +        unlink(filename)
> > > +
> > > +        # Copy the include and lib directories we need to build libg=
piod
> > > +        copytree(f"libgpiod-{GPIOD_VERSION}/include/", "./include")
> > > +        copytree(f"libgpiod-{GPIOD_VERSION}/lib/", "./lib")
> > > +        rmtree(f"libgpiod-{GPIOD_VERSION}")
> > > +
> > > +        # Save the gpiod version for sdist
> > > +        open("gpiod-version.txt", "w").write(GPIOD_VERSION)
> > > +
> > > +        func(self)
> > > +
> > > +        rmtree("./lib", ignore_errors=3DTrue)
> > > +        rmtree("./include", ignore_errors=3DTrue)
> > > +        unlink("gpiod-version.txt")
> > > +
> > > +    return wrapper
> > >
> > >
> > >  class build_ext(orig_build_ext):
> > >      """
> > > -    setuptools install all C extentions even if they're excluded in =
setup().
> > > -    As a workaround - remove the tests directory right after all ext=
ensions
> > > -    were built (and possibly copied to the source directory if inpla=
ce is set).
> > > +    Wrap build_ext to amend the module sources and settings to build
> > > +    the bindings and gpiod into a combined module when a version is
> > > +    specified and LINK_SYSTEM_LIBGPIOD=3D1 is not present in env.
> > > +
> > > +    run is wrapped with @fetch_tarball in order to fetch the sources
> > > +    needed to build binary wheels when GPIOD_VERSION is specified, e=
g:
> > > +
> > > +    GPIOD_VERSION=3D"2.0.2" python3 -m build .
> > >      """
> > >
> > > +    @fetch_tarball
> > >      def run(self):
> > > +        # Try to get the gpiod version from the .txt file included i=
n sdist
> > > +        try:
> > > +            gpiod_version =3D open("gpiod-version.txt", "r").read()
> > > +        except OSError:
> > > +            gpiod_version =3D GPIOD_VERSION
> > > +
> > > +        if gpiod_version and not LINK_SYSTEM_LIBGPIOD:
> > > +            # When building the extension from an sdist with a vendo=
red
> > > +            # amend gpiod._ext sources and settings accordingly.
> > > +            gpiod_ext =3D self.ext_map["gpiod._ext"]
> > > +            gpiod_ext.sources +=3D [
> > > +                "lib/chip.c",
> > > +                "lib/chip-info.c",
> > > +                "lib/edge-event.c",
> > > +                "lib/info-event.c",
> > > +                "lib/internal.c",
> > > +                "lib/line-config.c",
> > > +                "lib/line-info.c",
> > > +                "lib/line-request.c",
> > > +                "lib/line-settings.c",
> > > +                "lib/misc.c",
> > > +                "lib/request-config.c",
> > > +            ]
> > > +            gpiod_ext.libraries =3D []
> > > +            gpiod_ext.include_dirs =3D ["include", "lib", "gpiod/ext=
"]
> > > +            gpiod_ext.extra_compile_args.append(
> > > +                f'-DGPIOD_VERSION_STR=3D"{gpiod_version}"',
> > > +            )
> > > +
> > >          super().run()
> > > +
> > > +        # We don't ever want the module tests directory in our packa=
ge
> > > +        # since this might include gpiosim._ext or procname._ext fro=
m a
> > > +        # previous dirty build tree.
> > >          rmtree(path.join(self.build_lib, "tests"), ignore_errors=3DT=
rue)
> > >
> > >
> > > +class sdist(orig_sdist):
> > > +    """
> > > +    Wrap sdist in order to fetch the libgpiod source files for vendo=
ring
> > > +    into a source distribution.
> > > +
> > > +    run is wrapped with @fetch_tarball in order to fetch the sources
> > > +    needed to build binary wheels when GPIOD_VERSION is specified, e=
g:
> > > +
> > > +    GPIOD_VERSION=3D"2.0.2" python3 -m build . --sdist
> > > +    """
> > > +
> > > +    @fetch_tarball
> > > +    def run(self):
> > > +        super().run()
> > > +
> > > +
> > >  gpiod_ext =3D Extension(
> > >      "gpiod._ext",
> > >      sources=3D[
> > > @@ -50,19 +162,16 @@ procname_ext =3D Extension(
> > >  )
> > >
> > >  extensions =3D [gpiod_ext]
> > > -if environ.get("GPIOD_WITH_TESTS") =3D=3D "1":
> > > +if GPIOD_WITH_TESTS:
> > >      extensions.append(gpiosim_ext)
> > >      extensions.append(procname_ext)
> > >
> > > -with open("gpiod/version.py", "r") as fd:
> > > -    exec(fd.read())
> > > -
> > >  setup(
> > >      name=3D"libgpiod",
> > >      packages=3Dfind_packages(exclude=3D["tests", "tests.*"]),
> > >      python_requires=3D">=3D3.9.0",
> > >      ext_modules=3Dextensions,
> > > -    cmdclass=3D{"build_ext": build_ext},
> > > +    cmdclass=3D{"build_ext": build_ext, "sdist": sdist},
> > >      version=3D__version__,
> > >      author=3D"Bartosz Golaszewski",
> > >      author_email=3D"brgl@bgdev.pl",
> > > --
> > > 2.34.1
> > >
