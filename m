Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7112A7D0BEF
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Oct 2023 11:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376746AbjJTJeo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Oct 2023 05:34:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376773AbjJTJeb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Oct 2023 05:34:31 -0400
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DE8A10DF
        for <linux-gpio@vger.kernel.org>; Fri, 20 Oct 2023 02:34:26 -0700 (PDT)
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-49abb53648aso213411e0c.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Oct 2023 02:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697794465; x=1698399265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUZ5wwKtnXULiZk6Rr3PHOUzXbZeOY6GUPHzFVEPGlE=;
        b=L74tYcwcpfmJxno/B1eQQlpacH26Z5XLME1CaKFJAVdOATPZuI7DaUq6sr5ifxMo8r
         v8q4uNN4UjyNYA4aGM3Je03A8etwEkWCILnndhGzF4IA182lQzV5Awjb/+COF/z+jCrJ
         vwCEyAFxzxIavMber1Hj2iRyZ8fdIif1rhHxaE9OjQ4vJ4AgyCaFbsof7dh7iVgYQBf6
         kYfNU0dYHFJ+0hqWFvme/8ICOvio9mpLKQv2rimK62p21pu9so0POYZpK1/nmsSlSViS
         UMyL6Y1PWfrXpQ/wqmee4m8INJpg/JqDfB0QQlP3X1O5aomYId/gtllJshK/SlePyadp
         JMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697794465; x=1698399265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUZ5wwKtnXULiZk6Rr3PHOUzXbZeOY6GUPHzFVEPGlE=;
        b=WKQeruLOl6EIHwY/NWMXh2YOPBWhuS+oFUU2Fihg5WcefS2UIvqdBTjqVJToDyPzT9
         aVl9FGWKIzneVyLM6yTGylfUBWU4CwuWRd7h52NKzvyrcHQFXs3Sxhl1d+fFkcueIhJN
         vJxDdXA46D/4HRpR7W3UsA8Qe8Z6g8AjVtoX39dIPD6bdvPJeYS3z5kxCsEElGE8qkrk
         CdUwL0b36XA5zV3CsA7TpQU4x1WBdIU85gbBH+nmNEtNop1Z1w3w81Xk13+QpGorfK2/
         SNlYqACotr8e3aRBri5xE5dCJ3/0xvU9irKQn4eYmZc0DyodPXH4D2KKOJvXDdwpl8D+
         fV+g==
X-Gm-Message-State: AOJu0Yxsbz5X14NGA2UnsjcU1pKcj8o2msDiLh+H/sfdTIx2Ap7dWIlN
        OFWFEvn2RK7OM0UGMQERad5sLguiXAjZjPFnY2lCaw==
X-Google-Smtp-Source: AGHT+IEqIqi+jTEewnoZnSrbb+3oItDLxhqVzqdwNSthxZOAxy3JRthuYW4VmRT98SUN2HBF1srALKrH/ubj686bmU0=
X-Received: by 2002:a1f:2906:0:b0:496:1f95:209a with SMTP id
 p6-20020a1f2906000000b004961f95209amr964992vkp.15.1697794465466; Fri, 20 Oct
 2023 02:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231018205728.284068-1-phil@gadgetoid.com> <20231018205728.284068-2-phil@gadgetoid.com>
 <CAMRc=MfsVNY7cPWpFRxV8pF5hoXHQWjXCmBzGsg58sFO+UEeog@mail.gmail.com>
 <CA+kSVo9fDLkfp2zL=9XUppLVK=TpOnBZVmyrL80CKHprLfHnHg@mail.gmail.com>
 <CAMRc=MdJYyi706hVtcVWY0ozcq9BNn7Eup3XbNTM2Q3fn=+n1A@mail.gmail.com> <CAGk-eV6NcebJyaYmAo=nqo+Rc-2c2Se2t9z6kT-D12X=ky4a9g@mail.gmail.com>
In-Reply-To: <CAGk-eV6NcebJyaYmAo=nqo+Rc-2c2Se2t9z6kT-D12X=ky4a9g@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 20 Oct 2023 11:34:14 +0200
Message-ID: <CAMRc=McAbOO5ksG3m7C_0yWTaZdLmv34O3LBw=uyN=b2Xdf=xA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v5 1/1] bindings: python: optionally include
 module in sdist
To:     Phil Howard <phil@pimoroni.com>
Cc:     Phil Howard <phil@gadgetoid.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org
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

On Thu, Oct 19, 2023 at 9:56=E2=80=AFPM Phil Howard <phil@pimoroni.com> wro=
te:
>
> On Thu, 19 Oct 2023 at 13:46, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Thu, Oct 19, 2023 at 12:42=E2=80=AFPM Phil Howard <phil@gadgetoid.co=
m> wrote:
> > >
> > > On Thu, 19 Oct 2023 at 10:41, Bartosz Golaszewski <brgl@bgdev.pl> wro=
te:
> > > >
> > > > On Wed, Oct 18, 2023 at 10:57=E2=80=AFPM Phil Howard <phil@gadgetoi=
d.com> wrote:
> > > > >
> > > > > Optionally vendor libgpiod source into sdist so that the Python m=
odule can
> > > > > be built from source, even with a missing or mismatched system li=
bgpiod.
> > > > >
> > > > > Add two new environment variables "LINK_SYSTEM_LIBGPIOD" and
> > > > > "GPIOD_VERSION" to control what kind of package setup.py will bui=
ld.
> > > > >
> > > > > In order to build an sdist or wheel package with a vendored libgp=
iod a
> > > > > version must be specified via the "GPIOD_VERSION" environment var=
iable.
> > > > >
> > > > > This will instruct setup.py to fetch the tarball matching the req=
uested
> > > > > version from git.kernel.org, unpack it, and copy the lib and incl=
ude
> > > > > directories into the package root so they can be included in sdis=
t or used
> > > > > to build a binary wheel.
> > > > >
> > > > > eg: GPIOD_VERSION=3D2.0.2 python3 setup.py sdist
> > > > >
> > > > > Will build a source distribution with gpiod version 2.0.2 source =
included.
> > > > >
> > > > > It will also save the gpiod version into "gpiod-version.txt" so t=
hat it can
> > > > > be passed to the build when the sdist is built by pip.
> > > > >
> > > > > Requiring an explicit version ensures that the Python bindings - =
which
> > > > > can be changed and versions independent of libgpiod -  are built =
against a
> > > > > stable libgpiod release.
> > > > >
> > > > > In order to force a package with vendored gpiod source to link th=
e system
> > > > > libgpiod, the "LINK_SYSTEM_LIBGPIOD" environment variable can be =
used:
> > > > >
> > > > > eg: LINK_SYSTEM_LIBGPIOD=3D1 pip install libgpiod
> > > > >
> > > > > Signed-off-by: Phil Howard <phil@gadgetoid.com>
> > > > > ---
> > > > >  bindings/python/MANIFEST.in |   5 ++
> > > > >  bindings/python/setup.py    | 131 ++++++++++++++++++++++++++++++=
+++---
> > > > >  2 files changed, 125 insertions(+), 11 deletions(-)
> > > > >
> > > > > diff --git a/bindings/python/MANIFEST.in b/bindings/python/MANIFE=
ST.in
> > > > > index c7124d4..0aa9079 100644
> > > > > --- a/bindings/python/MANIFEST.in
> > > > > +++ b/bindings/python/MANIFEST.in
> > > > > @@ -2,6 +2,7 @@
> > > > >  # SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.gola=
szewski@linaro.org>
> > > > >
> > > > >  include setup.py
> > > > > +include gpiod-version.txt
> > > > >
> > > > >  recursive-include gpiod *.py
> > > > >  recursive-include tests *.py
> > > > > @@ -11,3 +12,7 @@ recursive-include gpiod/ext *.h
> > > > >
> > > > >  recursive-include tests/gpiosim *.c
> > > > >  recursive-include tests/procname *.c
> > > > > +
> > > > > +recursive-include lib *.c
> > > > > +recursive-include lib *.h
> > > > > +recursive-include include *.h
> > > > > diff --git a/bindings/python/setup.py b/bindings/python/setup.py
> > > > > index df10e18..f0d5c1f 100644
> > > > > --- a/bindings/python/setup.py
> > > > > +++ b/bindings/python/setup.py
> > > > > @@ -1,24 +1,136 @@
> > > > >  # SPDX-License-Identifier: GPL-2.0-or-later
> > > > >  # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.p=
l>
> > > > >
> > > > > -from os import environ, path
> > > > > -from setuptools import setup, Extension, find_packages
> > > > > +import tarfile
> > > > > +from os import getenv, path, unlink
> > > > > +from shutil import copytree, rmtree
> > > > > +from urllib.request import urlretrieve
> > > >
> > > > Doesn't it make our setup.py depend on additional packages on top o=
f
> > > > the standard library?
> > >
> > > "tarfile" and "urllib" are both part of the CPython standard library =
[1]
> > >
> >
> > Yocto has a separate recipe for urllib3 but also has an urllib module
> > in python3-core. Is this expected? What is the relationship between
> > the two?
>
> There is no relationship between urllib3 and urllib, or urllib2,
> Python developers
> apparently just love to trample on package names and sow confusion.
>
> urllib is the Python 3 stl rewrite and refactor of the old
> urllib/urllib2 libraries.
>
> urllib3 is a third party, non-stl library to accomplish similar goals and=
 expand
> beyond the limited scope of the stl urllib.
>
> >
> > > They'd be in pip otherwise, since it would necessarily need to fetch =
and
> > > unpack tarballs like the sdist. (pip has a habit of vendoring things)
> >
> > Yocto doesn't use pip, it fetches the sources over http. All
> > dependencies must be satisfied by existing yocto recipes.
> >
> > >
> > > If there are cases where these are missing (Yocto weirdness?) then I =
can
> > > move the imports to just-in-time so they're a soft dependency only fo=
r
> > > when a package is built.
> > >
> >
> > Yocto has a different weirdness - it splits the standard library into
> > ~65 separate packages so that you can keep the image small if you
> > don't need the entire thing.
>
> Oof. In that case, soft dependencies it is then!
>

That's alright, we'll handle that in the recipe. I was worried we'd be
pulling something third-party but that doesn't seem to be the case.

Bart

> I really should try doing stuff with Yocto sometime.
>
> >
> > > [1] - https://docs.python.org/3/library/index.html
> > >
> > > >
> > > > > +
> > > > > +from setuptools import Extension, find_packages, setup
> > > > >  from setuptools.command.build_ext import build_ext as orig_build=
_ext
> > > > > -from shutil import rmtree
> > > > > +from setuptools.command.sdist import sdist as orig_sdist
> > > > > +
> > > > > +LINK_SYSTEM_LIBGPIOD =3D getenv("LINK_SYSTEM_LIBGPIOD") =3D=3D "=
1"
> > > > > +GPIOD_VERSION =3D getenv("GPIOD_VERSION")
> > > >
> > > > I'd call it LIBGPIOD_VERSION to be more explicit.
> > > >
> > > > > +GPIOD_WITH_TESTS =3D getenv("GPIOD_WITH_TESTS") =3D=3D "1"
> > > > > +SRC_BASE_URL =3D "https://git.kernel.org/pub/scm/libs/libgpiod/l=
ibgpiod.git/snapshot/"
> > > >
> > > > I would prefer to use the http mirror at
> > > > https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/ rather
> > > > than git snapshots. We have better control over what's in there
> > >
> > > Yessir!
> > >
> > > > and we can even verify the checksums after download if needed.
> > >
> > > We can pull the checksum from sha256sums.asc and verify with hashlib
> > > but we can't verify the gpg signature without a dependency I think.
> > >
> > > >
> > > > > +SRC_FILENAME =3D "libgpiod-{version}.tar.gz"
> > > >
> > > > Maybe put it in /tmp?
> > >
> > > Sure "tempfile" is also in the stl, so might as well use it!
> > >
> >
> > Sounds good!
> >
> > Bart
> >
> > > >
> > > > Bart
> > > >
> > > > > +
> > > > > +# __version__
> > > > > +with open("gpiod/version.py", "r") as fd:
> > > > > +    exec(fd.read())
> > > > > +
> > > > > +
> > > > > +def fetch_tarball(func):
> > > > > +    # If no GPIOD_VERSION is specified in env, just run the task
> > > > > +    if GPIOD_VERSION is None:
> > > > > +        return func
> > > > > +
> > > > > +    # If GPIOD_VERSION is specified, fetch the requested version=
 tarball
> > > > > +    # and create gpiod-version.txt so the sdist package knows wh=
at version
> > > > > +    # it's building.
> > > > > +    def wrapper(self):
> > > > > +        TARBALL =3D SRC_FILENAME.format(version=3DGPIOD_VERSION)
> > > > > +
> > > > > +        print(f"fetching: {SRC_BASE_URL + TARBALL}")
> > > > > +
> > > > > +        filename, headers =3D urlretrieve(SRC_BASE_URL + TARBALL=
, TARBALL)
> > > > > +
> > > > > +        if not tarfile.is_tarfile(filename):
> > > > > +            print(f"error: refusing to build sdist (invalid tarb=
all {TARBALL})")
> > > > > +            return
> > > > > +
> > > > > +        # Unpack the downloaded tarball
> > > > > +        print(f"unpacking: {filename}")
> > > > > +        file =3D tarfile.open(filename)
> > > > > +        file.extractall(".")
> > > > > +        file.close()
> > > > > +        unlink(filename)
> > > > > +
> > > > > +        # Copy the include and lib directories we need to build =
libgpiod
> > > > > +        copytree(f"libgpiod-{GPIOD_VERSION}/include/", "./includ=
e")
> > > > > +        copytree(f"libgpiod-{GPIOD_VERSION}/lib/", "./lib")
> > > > > +        rmtree(f"libgpiod-{GPIOD_VERSION}")
> > > > > +
> > > > > +        # Save the gpiod version for sdist
> > > > > +        open("gpiod-version.txt", "w").write(GPIOD_VERSION)
> > > > > +
> > > > > +        func(self)
> > > > > +
> > > > > +        rmtree("./lib", ignore_errors=3DTrue)
> > > > > +        rmtree("./include", ignore_errors=3DTrue)
> > > > > +        unlink("gpiod-version.txt")
> > > > > +
> > > > > +    return wrapper
> > > > >
> > > > >
> > > > >  class build_ext(orig_build_ext):
> > > > >      """
> > > > > -    setuptools install all C extentions even if they're excluded=
 in setup().
> > > > > -    As a workaround - remove the tests directory right after all=
 extensions
> > > > > -    were built (and possibly copied to the source directory if i=
nplace is set).
> > > > > +    Wrap build_ext to amend the module sources and settings to b=
uild
> > > > > +    the bindings and gpiod into a combined module when a version=
 is
> > > > > +    specified and LINK_SYSTEM_LIBGPIOD=3D1 is not present in env=
.
> > > > > +
> > > > > +    run is wrapped with @fetch_tarball in order to fetch the sou=
rces
> > > > > +    needed to build binary wheels when GPIOD_VERSION is specifie=
d, eg:
> > > > > +
> > > > > +    GPIOD_VERSION=3D"2.0.2" python3 -m build .
> > > > >      """
> > > > >
> > > > > +    @fetch_tarball
> > > > >      def run(self):
> > > > > +        # Try to get the gpiod version from the .txt file includ=
ed in sdist
> > > > > +        try:
> > > > > +            gpiod_version =3D open("gpiod-version.txt", "r").rea=
d()
> > > > > +        except OSError:
> > > > > +            gpiod_version =3D GPIOD_VERSION
> > > > > +
> > > > > +        if gpiod_version and not LINK_SYSTEM_LIBGPIOD:
> > > > > +            # When building the extension from an sdist with a v=
endored
> > > > > +            # amend gpiod._ext sources and settings accordingly.
> > > > > +            gpiod_ext =3D self.ext_map["gpiod._ext"]
> > > > > +            gpiod_ext.sources +=3D [
> > > > > +                "lib/chip.c",
> > > > > +                "lib/chip-info.c",
> > > > > +                "lib/edge-event.c",
> > > > > +                "lib/info-event.c",
> > > > > +                "lib/internal.c",
> > > > > +                "lib/line-config.c",
> > > > > +                "lib/line-info.c",
> > > > > +                "lib/line-request.c",
> > > > > +                "lib/line-settings.c",
> > > > > +                "lib/misc.c",
> > > > > +                "lib/request-config.c",
> > > > > +            ]
> > > > > +            gpiod_ext.libraries =3D []
> > > > > +            gpiod_ext.include_dirs =3D ["include", "lib", "gpiod=
/ext"]
> > > > > +            gpiod_ext.extra_compile_args.append(
> > > > > +                f'-DGPIOD_VERSION_STR=3D"{gpiod_version}"',
> > > > > +            )
> > > > > +
> > > > >          super().run()
> > > > > +
> > > > > +        # We don't ever want the module tests directory in our p=
ackage
> > > > > +        # since this might include gpiosim._ext or procname._ext=
 from a
> > > > > +        # previous dirty build tree.
> > > > >          rmtree(path.join(self.build_lib, "tests"), ignore_errors=
=3DTrue)
> > > > >
> > > > >
> > > > > +class sdist(orig_sdist):
> > > > > +    """
> > > > > +    Wrap sdist in order to fetch the libgpiod source files for v=
endoring
> > > > > +    into a source distribution.
> > > > > +
> > > > > +    run is wrapped with @fetch_tarball in order to fetch the sou=
rces
> > > > > +    needed to build binary wheels when GPIOD_VERSION is specifie=
d, eg:
> > > > > +
> > > > > +    GPIOD_VERSION=3D"2.0.2" python3 -m build . --sdist
> > > > > +    """
> > > > > +
> > > > > +    @fetch_tarball
> > > > > +    def run(self):
> > > > > +        super().run()
> > > > > +
> > > > > +
> > > > >  gpiod_ext =3D Extension(
> > > > >      "gpiod._ext",
> > > > >      sources=3D[
> > > > > @@ -50,19 +162,16 @@ procname_ext =3D Extension(
> > > > >  )
> > > > >
> > > > >  extensions =3D [gpiod_ext]
> > > > > -if environ.get("GPIOD_WITH_TESTS") =3D=3D "1":
> > > > > +if GPIOD_WITH_TESTS:
> > > > >      extensions.append(gpiosim_ext)
> > > > >      extensions.append(procname_ext)
> > > > >
> > > > > -with open("gpiod/version.py", "r") as fd:
> > > > > -    exec(fd.read())
> > > > > -
> > > > >  setup(
> > > > >      name=3D"libgpiod",
> > > > >      packages=3Dfind_packages(exclude=3D["tests", "tests.*"]),
> > > > >      python_requires=3D">=3D3.9.0",
> > > > >      ext_modules=3Dextensions,
> > > > > -    cmdclass=3D{"build_ext": build_ext},
> > > > > +    cmdclass=3D{"build_ext": build_ext, "sdist": sdist},
> > > > >      version=3D__version__,
> > > > >      author=3D"Bartosz Golaszewski",
> > > > >      author_email=3D"brgl@bgdev.pl",
> > > > > --
> > > > > 2.34.1
> > > > >
