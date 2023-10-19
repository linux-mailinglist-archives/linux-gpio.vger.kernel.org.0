Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 361927CF57D
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Oct 2023 12:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbjJSKmK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Oct 2023 06:42:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjJSKmJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Oct 2023 06:42:09 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A695D11F
        for <linux-gpio@vger.kernel.org>; Thu, 19 Oct 2023 03:42:07 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1ea98ad294cso1325719fac.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Oct 2023 03:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697712127; x=1698316927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pvc7tHb0fhnLIxjP/7Y9e3Ad3D7dMHqhKMIO/gHgd9s=;
        b=QBtks7PItQfP848h4Z8OV9snTqL4cjUwnaV95DySaI6cca4YnjJrPC0VJTGbCoEWgG
         ILg0U1PRPU2tw9YxoG4i4tG9rkuCQ9EBWrJS4ow4WkYE5KN8FkqkYj9gQBDyQx1M3nH9
         3qoovfWsd96Ty10nTcR0+BQbqcAlQq2WFqkpQjMPPaO8ZbLNMPg1SDHeJ5X0T0fAFNDY
         FJ5EvyigEXAoKZuKRUckp+X60PTmPCgXrK8p2hEpV0Km9QubLH/LbH4eGm8VT4NeSHJ+
         pPYbuwHSTTdy7n71t1JQOYlW0tt4MdQUQ5RBXaHpLyqftcD5i9VIxfLuQlpPShH9cfiQ
         at6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697712127; x=1698316927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pvc7tHb0fhnLIxjP/7Y9e3Ad3D7dMHqhKMIO/gHgd9s=;
        b=pzo4perCnjsuI0Y9xzVedwFjXRt+7v0G+xl7QZD8SuxAHotCxYQyeeZnNb5zLFVzwj
         8x4JIPwyvDR7FshkAvJMpg/9ntLorjrtrtYxsuyBp0q9a1oo9RxQUIHPct//tnuS6kfl
         +4rMWgIV1BYooS75xQvjLkwzyQeQICKcRHbQsb4sJXkcib/nj1AluNrn2MZSl10GgB9V
         1OjUUXi0tZTIb9lkZXDdxNzy6EYA69clcACn+u55GuN4JXkRZZyOP1OoU4UsWU1/aFeU
         KMUEqOK1GzkUn+RytASgZZeaGpwComwfjS5ycXTr5pLwCWNdVvJF1VWbXbvrGWxqKihX
         U8Mw==
X-Gm-Message-State: AOJu0YyETQ6Jp5XzHYZ3jxpLYMjUvgKkGEiJqQkn+5dbGNiPf2cp8pbL
        QYTJSydyOl2nQnWdptO7+xSByjNkC/XfB5R3+F5rzg==
X-Google-Smtp-Source: AGHT+IG6tPK/d54RiUugW0kll++/7FVcrvs3RTeNji4y1Sqpp+m84gxpxS+7JWDtuJr8+SjYVcxXOJxqb17nfYu7OJE=
X-Received: by 2002:a05:6871:5389:b0:1d5:a955:8bb3 with SMTP id
 hy9-20020a056871538900b001d5a9558bb3mr2173716oac.43.1697712126914; Thu, 19
 Oct 2023 03:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20231018205728.284068-1-phil@gadgetoid.com> <20231018205728.284068-2-phil@gadgetoid.com>
 <CAMRc=MfsVNY7cPWpFRxV8pF5hoXHQWjXCmBzGsg58sFO+UEeog@mail.gmail.com>
In-Reply-To: <CAMRc=MfsVNY7cPWpFRxV8pF5hoXHQWjXCmBzGsg58sFO+UEeog@mail.gmail.com>
From:   Phil Howard <phil@gadgetoid.com>
Date:   Thu, 19 Oct 2023 11:41:55 +0100
Message-ID: <CA+kSVo9fDLkfp2zL=9XUppLVK=TpOnBZVmyrL80CKHprLfHnHg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v5 1/1] bindings: python: optionally include
 module in sdist
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 19 Oct 2023 at 10:41, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Wed, Oct 18, 2023 at 10:57=E2=80=AFPM Phil Howard <phil@gadgetoid.com>=
 wrote:
> >
> > Optionally vendor libgpiod source into sdist so that the Python module =
can
> > be built from source, even with a missing or mismatched system libgpiod=
.
> >
> > Add two new environment variables "LINK_SYSTEM_LIBGPIOD" and
> > "GPIOD_VERSION" to control what kind of package setup.py will build.
> >
> > In order to build an sdist or wheel package with a vendored libgpiod a
> > version must be specified via the "GPIOD_VERSION" environment variable.
> >
> > This will instruct setup.py to fetch the tarball matching the requested
> > version from git.kernel.org, unpack it, and copy the lib and include
> > directories into the package root so they can be included in sdist or u=
sed
> > to build a binary wheel.
> >
> > eg: GPIOD_VERSION=3D2.0.2 python3 setup.py sdist
> >
> > Will build a source distribution with gpiod version 2.0.2 source includ=
ed.
> >
> > It will also save the gpiod version into "gpiod-version.txt" so that it=
 can
> > be passed to the build when the sdist is built by pip.
> >
> > Requiring an explicit version ensures that the Python bindings - which
> > can be changed and versions independent of libgpiod -  are built agains=
t a
> > stable libgpiod release.
> >
> > In order to force a package with vendored gpiod source to link the syst=
em
> > libgpiod, the "LINK_SYSTEM_LIBGPIOD" environment variable can be used:
> >
> > eg: LINK_SYSTEM_LIBGPIOD=3D1 pip install libgpiod
> >
> > Signed-off-by: Phil Howard <phil@gadgetoid.com>
> > ---
> >  bindings/python/MANIFEST.in |   5 ++
> >  bindings/python/setup.py    | 131 +++++++++++++++++++++++++++++++++---
> >  2 files changed, 125 insertions(+), 11 deletions(-)
> >
> > diff --git a/bindings/python/MANIFEST.in b/bindings/python/MANIFEST.in
> > index c7124d4..0aa9079 100644
> > --- a/bindings/python/MANIFEST.in
> > +++ b/bindings/python/MANIFEST.in
> > @@ -2,6 +2,7 @@
> >  # SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewsk=
i@linaro.org>
> >
> >  include setup.py
> > +include gpiod-version.txt
> >
> >  recursive-include gpiod *.py
> >  recursive-include tests *.py
> > @@ -11,3 +12,7 @@ recursive-include gpiod/ext *.h
> >
> >  recursive-include tests/gpiosim *.c
> >  recursive-include tests/procname *.c
> > +
> > +recursive-include lib *.c
> > +recursive-include lib *.h
> > +recursive-include include *.h
> > diff --git a/bindings/python/setup.py b/bindings/python/setup.py
> > index df10e18..f0d5c1f 100644
> > --- a/bindings/python/setup.py
> > +++ b/bindings/python/setup.py
> > @@ -1,24 +1,136 @@
> >  # SPDX-License-Identifier: GPL-2.0-or-later
> >  # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> >
> > -from os import environ, path
> > -from setuptools import setup, Extension, find_packages
> > +import tarfile
> > +from os import getenv, path, unlink
> > +from shutil import copytree, rmtree
> > +from urllib.request import urlretrieve
>
> Doesn't it make our setup.py depend on additional packages on top of
> the standard library?

"tarfile" and "urllib" are both part of the CPython standard library [1]

They'd be in pip otherwise, since it would necessarily need to fetch and
unpack tarballs like the sdist. (pip has a habit of vendoring things)

If there are cases where these are missing (Yocto weirdness?) then I can
move the imports to just-in-time so they're a soft dependency only for
when a package is built.

[1] - https://docs.python.org/3/library/index.html

>
> > +
> > +from setuptools import Extension, find_packages, setup
> >  from setuptools.command.build_ext import build_ext as orig_build_ext
> > -from shutil import rmtree
> > +from setuptools.command.sdist import sdist as orig_sdist
> > +
> > +LINK_SYSTEM_LIBGPIOD =3D getenv("LINK_SYSTEM_LIBGPIOD") =3D=3D "1"
> > +GPIOD_VERSION =3D getenv("GPIOD_VERSION")
>
> I'd call it LIBGPIOD_VERSION to be more explicit.
>
> > +GPIOD_WITH_TESTS =3D getenv("GPIOD_WITH_TESTS") =3D=3D "1"
> > +SRC_BASE_URL =3D "https://git.kernel.org/pub/scm/libs/libgpiod/libgpio=
d.git/snapshot/"
>
> I would prefer to use the http mirror at
> https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/ rather
> than git snapshots. We have better control over what's in there

Yessir!

> and we can even verify the checksums after download if needed.

We can pull the checksum from sha256sums.asc and verify with hashlib
but we can't verify the gpg signature without a dependency I think.

>
> > +SRC_FILENAME =3D "libgpiod-{version}.tar.gz"
>
> Maybe put it in /tmp?

Sure "tempfile" is also in the stl, so might as well use it!

>
> Bart
>
> > +
> > +# __version__
> > +with open("gpiod/version.py", "r") as fd:
> > +    exec(fd.read())
> > +
> > +
> > +def fetch_tarball(func):
> > +    # If no GPIOD_VERSION is specified in env, just run the task
> > +    if GPIOD_VERSION is None:
> > +        return func
> > +
> > +    # If GPIOD_VERSION is specified, fetch the requested version tarba=
ll
> > +    # and create gpiod-version.txt so the sdist package knows what ver=
sion
> > +    # it's building.
> > +    def wrapper(self):
> > +        TARBALL =3D SRC_FILENAME.format(version=3DGPIOD_VERSION)
> > +
> > +        print(f"fetching: {SRC_BASE_URL + TARBALL}")
> > +
> > +        filename, headers =3D urlretrieve(SRC_BASE_URL + TARBALL, TARB=
ALL)
> > +
> > +        if not tarfile.is_tarfile(filename):
> > +            print(f"error: refusing to build sdist (invalid tarball {T=
ARBALL})")
> > +            return
> > +
> > +        # Unpack the downloaded tarball
> > +        print(f"unpacking: {filename}")
> > +        file =3D tarfile.open(filename)
> > +        file.extractall(".")
> > +        file.close()
> > +        unlink(filename)
> > +
> > +        # Copy the include and lib directories we need to build libgpi=
od
> > +        copytree(f"libgpiod-{GPIOD_VERSION}/include/", "./include")
> > +        copytree(f"libgpiod-{GPIOD_VERSION}/lib/", "./lib")
> > +        rmtree(f"libgpiod-{GPIOD_VERSION}")
> > +
> > +        # Save the gpiod version for sdist
> > +        open("gpiod-version.txt", "w").write(GPIOD_VERSION)
> > +
> > +        func(self)
> > +
> > +        rmtree("./lib", ignore_errors=3DTrue)
> > +        rmtree("./include", ignore_errors=3DTrue)
> > +        unlink("gpiod-version.txt")
> > +
> > +    return wrapper
> >
> >
> >  class build_ext(orig_build_ext):
> >      """
> > -    setuptools install all C extentions even if they're excluded in se=
tup().
> > -    As a workaround - remove the tests directory right after all exten=
sions
> > -    were built (and possibly copied to the source directory if inplace=
 is set).
> > +    Wrap build_ext to amend the module sources and settings to build
> > +    the bindings and gpiod into a combined module when a version is
> > +    specified and LINK_SYSTEM_LIBGPIOD=3D1 is not present in env.
> > +
> > +    run is wrapped with @fetch_tarball in order to fetch the sources
> > +    needed to build binary wheels when GPIOD_VERSION is specified, eg:
> > +
> > +    GPIOD_VERSION=3D"2.0.2" python3 -m build .
> >      """
> >
> > +    @fetch_tarball
> >      def run(self):
> > +        # Try to get the gpiod version from the .txt file included in =
sdist
> > +        try:
> > +            gpiod_version =3D open("gpiod-version.txt", "r").read()
> > +        except OSError:
> > +            gpiod_version =3D GPIOD_VERSION
> > +
> > +        if gpiod_version and not LINK_SYSTEM_LIBGPIOD:
> > +            # When building the extension from an sdist with a vendore=
d
> > +            # amend gpiod._ext sources and settings accordingly.
> > +            gpiod_ext =3D self.ext_map["gpiod._ext"]
> > +            gpiod_ext.sources +=3D [
> > +                "lib/chip.c",
> > +                "lib/chip-info.c",
> > +                "lib/edge-event.c",
> > +                "lib/info-event.c",
> > +                "lib/internal.c",
> > +                "lib/line-config.c",
> > +                "lib/line-info.c",
> > +                "lib/line-request.c",
> > +                "lib/line-settings.c",
> > +                "lib/misc.c",
> > +                "lib/request-config.c",
> > +            ]
> > +            gpiod_ext.libraries =3D []
> > +            gpiod_ext.include_dirs =3D ["include", "lib", "gpiod/ext"]
> > +            gpiod_ext.extra_compile_args.append(
> > +                f'-DGPIOD_VERSION_STR=3D"{gpiod_version}"',
> > +            )
> > +
> >          super().run()
> > +
> > +        # We don't ever want the module tests directory in our package
> > +        # since this might include gpiosim._ext or procname._ext from =
a
> > +        # previous dirty build tree.
> >          rmtree(path.join(self.build_lib, "tests"), ignore_errors=3DTru=
e)
> >
> >
> > +class sdist(orig_sdist):
> > +    """
> > +    Wrap sdist in order to fetch the libgpiod source files for vendori=
ng
> > +    into a source distribution.
> > +
> > +    run is wrapped with @fetch_tarball in order to fetch the sources
> > +    needed to build binary wheels when GPIOD_VERSION is specified, eg:
> > +
> > +    GPIOD_VERSION=3D"2.0.2" python3 -m build . --sdist
> > +    """
> > +
> > +    @fetch_tarball
> > +    def run(self):
> > +        super().run()
> > +
> > +
> >  gpiod_ext =3D Extension(
> >      "gpiod._ext",
> >      sources=3D[
> > @@ -50,19 +162,16 @@ procname_ext =3D Extension(
> >  )
> >
> >  extensions =3D [gpiod_ext]
> > -if environ.get("GPIOD_WITH_TESTS") =3D=3D "1":
> > +if GPIOD_WITH_TESTS:
> >      extensions.append(gpiosim_ext)
> >      extensions.append(procname_ext)
> >
> > -with open("gpiod/version.py", "r") as fd:
> > -    exec(fd.read())
> > -
> >  setup(
> >      name=3D"libgpiod",
> >      packages=3Dfind_packages(exclude=3D["tests", "tests.*"]),
> >      python_requires=3D">=3D3.9.0",
> >      ext_modules=3Dextensions,
> > -    cmdclass=3D{"build_ext": build_ext},
> > +    cmdclass=3D{"build_ext": build_ext, "sdist": sdist},
> >      version=3D__version__,
> >      author=3D"Bartosz Golaszewski",
> >      author_email=3D"brgl@bgdev.pl",
> > --
> > 2.34.1
> >
