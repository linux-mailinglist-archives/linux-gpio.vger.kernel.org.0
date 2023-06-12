Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F40B72CB80
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 18:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236370AbjFLQ2F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 12:28:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236733AbjFLQ2E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 12:28:04 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D7EB1AC
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 09:27:56 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b1c910ee19so54257941fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 09:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686587274; x=1689179274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLd3yVAV6FYyYy1sdYUeBqfZq603+DfRIvrQIn63OWA=;
        b=d1wm7qpSJuqfTj/+mnTTh73cZkk0tasNBh1Gd74BijroTCyXxQyf2Sx13evWZ39TXF
         LmGTtaoijUCN+BIedRy3fhJCCmUh5bbVio0QPsm/ZjBY9NVkVZv7E3ItX+8sFmNdqdxA
         kZJIWouRcuy+Z1MpeREdwGlPU8mr/b9m51b1WfQzOBF43MTuYoajjec6Tl2FW46zWXYZ
         6xAWvu24mRjgV7S1usaqhTlvQ892K0BB9flXHd7gL0FI0RiI9LotBldkwgKMxnXLM4iF
         D4cJ56UVFCwaYXDzKAAV+fGP4e0wO90hmG4+Boyo3NcQFGwCafvEWVl9wMrg5kvn6zk4
         bB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686587274; x=1689179274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLd3yVAV6FYyYy1sdYUeBqfZq603+DfRIvrQIn63OWA=;
        b=TXxjisaSuQPW8tlrCNho6psO4gK1iYEEijT2bH7pAAzpNorpY+7A5V5wt7sATQ9bs2
         xZD91QelzWDzyFnNoYnJ2+N56bURzOOALCmLy4dn8h/2scTKDtyJVBRHdQMMDJxntmI4
         +srMWdwyB0eCiaLnSYAB07u4SC0XfAdIlv88RnVLWJIH37P657q941EgCM9mB8qTNEUx
         birMZDM2FxJWHh4mBJZD3lz6luNmlHw7YX1NdvhTHP6y7psNjvhL0RKO6XjI6w2J5lWN
         jUkh+ftAXcJVUdyOtZNEbqtTJD4KSbSgOX/blcoaf2T+3wHCfCCaLigYCX3IadJDau4L
         IvSw==
X-Gm-Message-State: AC+VfDwVv495eULq73znpVyagN0ctb5kdE3oaUl2PHLFtIHtp+ZjxJNw
        xOQ4Gxpgl5dRrbfCLUXvlm1fK62UwoYcOVIiwtmhQbtaFjS9VNAeua4=
X-Google-Smtp-Source: ACHHUZ62lP0mQNQ1RnHugePOryEwK8mneju+vK4fP4D/g4VeIDi/4YA3dpZKwVEWNz+m3j7GArihAxpoDhDv9P8i7Fg=
X-Received: by 2002:a2e:90d2:0:b0:2a8:c42f:6913 with SMTP id
 o18-20020a2e90d2000000b002a8c42f6913mr2796104ljg.36.1686587274037; Mon, 12
 Jun 2023 09:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230610020148.8973-1-warthog618@gmail.com>
In-Reply-To: <20230610020148.8973-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 12 Jun 2023 18:27:42 +0200
Message-ID: <CAMRc=Mct7uByAbiHxQJRQTXnGEkty28keX1wjhR+aHgpOa1EQA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] doc: add configuration to generate doxygen
 documentation on readthedocs.
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 10, 2023 at 4:01=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> Having the libgpiod documentation available online would be helpful, so
> add the configuration required to generate the existing docygen C/C++
> documentation on readthedocs.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>
> Speaking of readthedocs - it looks like the config to generate the
> documentation there hasn't made it's way into master, so here it is.
>
> It might be due for an update, as it is over a year old now, but this is
> what is currently deployed.
>
> Cheers,
> Kent.
>
>  .readthedocs.yaml | 29 ++++++++++++++++++++
>  sphinx/conf.py    | 70 +++++++++++++++++++++++++++++++++++++++++++++++
>  sphinx/index.rst  | 24 ++++++++++++++++
>  3 files changed, 123 insertions(+)
>  create mode 100644 .readthedocs.yaml
>  create mode 100644 sphinx/conf.py
>  create mode 100644 sphinx/index.rst
>
> diff --git a/.readthedocs.yaml b/.readthedocs.yaml
> new file mode 100644
> index 0000000..976496c
> --- /dev/null
> +++ b/.readthedocs.yaml
> @@ -0,0 +1,29 @@
> +# SPDX-License-Identifier: LGPL-2.1-or-later
> +
> +#
> +# This file is part of libgpiod.
> +#
> +# Copyright (C) 2022 Bartosz Golaszewski <bartekgola@gmail.com>

I would stick with regular SPDX-FileCopyrightText line that we use
everywhere else and - while I understand that I maintain the project -
this file is authored by you so it's only right to have your copyright
here.

> +#
> +# Read the Docs configuration file
> +# See https://docs.readthedocs.io/en/stable/config-file/v2.html for deta=
ils
> +
> +version: 2
> +
> +build:
> +  os: ubuntu-20.04
> +  tools:
> +    python: "3.9"
> +  # doxygen is available by default, but just in case.
> +  # others are definitely missing.
> +  apt_packages:
> +      - autoconf
> +      - autoconf-archive
> +      - libtool
> +      - m4
> +      - doxygen
> +      - graphviz
> +
> +sphinx:
> +   configuration: sphinx/conf.py
> +
> diff --git a/sphinx/conf.py b/sphinx/conf.py
> new file mode 100644
> index 0000000..7022ff9
> --- /dev/null
> +++ b/sphinx/conf.py
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: LGPL-2.1-or-later
> +
> +#
> +# This file is part of libgpiod.
> +#
> +# Copyright (C) 2022 Bartosz Golaszewski <bartekgola@gmail.com>
> +#
> +# Configuration file for the Sphinx documentation builder.
> +#
> +# This file only contains a selection of the most common options. For a =
full
> +# list see the documentation:
> +# https://www.sphinx-doc.org/en/master/usage/configuration.html
> +
> +import subprocess
> +
> +subprocess.run('cd .. ; ./autogen.sh ; make doc', shell=3DTrue)
> +
> +# -- Path setup --------------------------------------------------------=
------
> +
> +# If extensions (or modules to document with autodoc) are in another dir=
ectory,
> +# add these directories to sys.path here. If the directory is relative t=
o the
> +# documentation root, use os.path.abspath to make it absolute, like show=
n here.
> +#
> +# import os
> +# import sys
> +# sys.path.insert(0, os.path.abspath('.'))
> +
> +
> +# -- Project information -----------------------------------------------=
------
> +
> +project =3D 'libgpiod'
> +copyright =3D '2022, Bartosz Golaszewski'
> +author =3D 'Bartosz Golaszewski'
> +
> +# The full version, including alpha/beta/rc tags
> +release =3D subprocess.run(
> +            ['git', 'describe', '--dirty'],
> +            capture_output=3DTrue).stdout.decode().strip()
> +
> +# -- General configuration ---------------------------------------------=
------
> +
> +# Add any Sphinx extension module names here, as strings. They can be
> +# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
> +# ones.
> +extensions =3D [
> +]
> +
> +# Add any paths that contain templates here, relative to this directory.
> +templates_path =3D []
> +
> +# List of patterns, relative to source directory, that match files and
> +# directories to ignore when looking for source files.
> +# This pattern also affects html_static_path and html_extra_path.
> +exclude_patterns =3D []
> +
> +
> +# -- Options for HTML output -------------------------------------------=
------
> +
> +# The theme to use for HTML and HTML Help pages.  See the documentation =
for
> +# a list of builtin themes.
> +#
> +html_theme =3D 'alabaster'
> +
> +# Add any paths that contain custom static files (such as style sheets) =
here,
> +# relative to this directory. They are copied after the builtin static f=
iles,
> +# so a file named "default.css" will overwrite the builtin "default.css"=
.
> +html_static_path =3D []
> +
> +html_extra_path =3D ['../doc/html']
> +
> diff --git a/sphinx/index.rst b/sphinx/index.rst
> new file mode 100644
> index 0000000..e38fad7
> --- /dev/null
> +++ b/sphinx/index.rst
> @@ -0,0 +1,24 @@
> +.. SPDX-License-Identifier: LGPL-2.1-or-later
> +
> +..
> +   This file is part of libgpiod.
> +
> +   Copyright (C) 2022 Bartosz Golaszewski <bartekgola@gmail.com>
> +
> +   libgpiod documentation master file.
> +
> +Welcome to libgpiod's documentation!
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. toctree::
> +   :maxdepth: 2
> +   :caption: Contents:
> +
> +
> +
> +Indices and tables
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +* :ref:`genindex`
> +* :ref:`modindex`
> +* :ref:`search`
> --
> 2.40.1
>

This works well with sphinx-build, thank you for doing that. I'm
actually looking into using the breathe[1] and exhale[2] extensions
for sphinx for translating doxygen into nice sphinx docs. This is a
good fundament to build upon.

Bart

[1] https://breathe.readthedocs.io/en/latest/
[2] https://exhale.readthedocs.io/en/latest/
