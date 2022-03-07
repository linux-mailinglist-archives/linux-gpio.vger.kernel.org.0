Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1E364CF489
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Mar 2022 10:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbiCGJSR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Mar 2022 04:18:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236526AbiCGJSF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Mar 2022 04:18:05 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B05652C1
        for <linux-gpio@vger.kernel.org>; Mon,  7 Mar 2022 01:17:01 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id qx21so30362559ejb.13
        for <linux-gpio@vger.kernel.org>; Mon, 07 Mar 2022 01:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+LXL2TC6X1DpDoK/44EedbUlr2s/tHhZvhpP/SBncXE=;
        b=mSMO9nkg8I0GQb2/CIl/R3Vx/bAKxmNII/u6qFO7mzqGhfwKWCA2s8sN0YY2F4mH1C
         Yz6eyQkMtCQd8/JJXkSuvoL/tvAgY8sMQI4CHqnPuvL3poBJhfS579G/r4RnHbQ76QNZ
         lPhhGLiRJqo1HVaHFmxOzUYPkJo9dbSO37a6yyloaig56jQHfhvqCqj44FsoRIYbmoER
         +5kstxNgv6RDyfcyPccUO2d83zmpR53U2maah1w1SURsV/y2LoshYjostCs+UvQe2TyE
         5GF6kDNw/eCfKrH+7G8NiXVerDDD1yt1iA0GuCvu3rBV4GQgtRckH5yCwN623Fk3oA8H
         +0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+LXL2TC6X1DpDoK/44EedbUlr2s/tHhZvhpP/SBncXE=;
        b=0R6YF6xfvMVB8/lenpYhy+mqMWorarm3LDh+D+ZmuoET/zpCnj1S18q679/sxMZtjR
         RKRtxUFR3hOJRAW32VYnQdgfBX4gtn5eyCLU8gxNx6a2bax4ww3JJ5oynhaxLUd94Aeo
         3kyG+WRd5Jaxj8zJvDzFyI3Ky0/qE1cqC30KvH6cmyY+3MrZ/Nf7UeRzIoTcb5NllJkB
         RyKparRsQSN3T92e49KSKWJAPNoNYcAnGPlhikUY19xgCMy1WP/M0V+G9cyqsbob/kvN
         y4bzeuErlYhMaHjTSeXpg+YuAppnWLydOD8KxsyQQglI7UgP7jODlrL2LQOZ+QYFCSgM
         hNEg==
X-Gm-Message-State: AOAM532fAJAFZNGVNi8ElWUL/OvXWP0bz8a7OF3PA59zarki1Sl36RlL
        1pZVP67aZ5vBFhZQ+Ha2Z2h2SwPlewGyjwbJrmXMfqxzbq4=
X-Google-Smtp-Source: ABdhPJzoyL7WBOsV/tEmCNgKP5xHqpRZ75jPk+ntbd+YVTSAShqClRBZ/T4vK1gAMoFrJTa5RFxKzEILPWMcvYTC4Cg=
X-Received: by 2002:a17:906:888e:b0:6da:ed04:5e40 with SMTP id
 ak14-20020a170906888e00b006daed045e40mr8625741ejc.286.1646644620232; Mon, 07
 Mar 2022 01:17:00 -0800 (PST)
MIME-Version: 1.0
References: <20220305094037.46361-1-warthog618@gmail.com>
In-Reply-To: <20220305094037.46361-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 7 Mar 2022 10:16:49 +0100
Message-ID: <CAMRc=MebW6P0qDi0DNckwVe2+LX3Bi84-HPZPGnAA-tvDiJ9Xg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] doc: add configuration to generate doxygen
 documentation on readthedocs.
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Mar 5, 2022 at 10:40 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Having the libgpiod documentation available online would be helpful, so
> add the configuration required to generate the existing doxygen C/C++
> documentation on readthedocs.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
>
> ---
>
> This is intended to be a minimal change that can be applied to both
> master and v1.6.x and have zero impact on existing builds.
> It has been tested on RTD using the current v1.6.3 release[1].
> The approach used here is to replace any Sphinx documentation generated
> by RTD with the doxygen documentation.
> A subsequent patch for v2 can switch to using Breathe/Sphinx to include
> the documentation for the Python bindings as well.  And relocate the
> Sphinx configuration into the doc directory.
>
> Cheers,
> Kent.
> [1] https://libgpiod.readthedocs.io/en/latest/
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
> +#
> +# Read the Docs configuration file
> +# See https://docs.readthedocs.io/en/stable/config-file/v2.html for details
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
> +# This file only contains a selection of the most common options. For a full
> +# list see the documentation:
> +# https://www.sphinx-doc.org/en/master/usage/configuration.html
> +
> +import subprocess
> +
> +subprocess.run('cd .. ; ./autogen.sh ; make doc', shell=True)
> +
> +# -- Path setup --------------------------------------------------------------
> +
> +# If extensions (or modules to document with autodoc) are in another directory,
> +# add these directories to sys.path here. If the directory is relative to the
> +# documentation root, use os.path.abspath to make it absolute, like shown here.
> +#
> +# import os
> +# import sys
> +# sys.path.insert(0, os.path.abspath('.'))
> +
> +
> +# -- Project information -----------------------------------------------------
> +
> +project = 'libgpiod'
> +copyright = '2022, Bartosz Golaszewski'
> +author = 'Bartosz Golaszewski'
> +
> +# The full version, including alpha/beta/rc tags
> +release = subprocess.run(
> +            ['git', 'describe', '--dirty'],
> +            capture_output=True).stdout.decode().strip()
> +
> +# -- General configuration ---------------------------------------------------
> +
> +# Add any Sphinx extension module names here, as strings. They can be
> +# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
> +# ones.
> +extensions = [
> +]
> +
> +# Add any paths that contain templates here, relative to this directory.
> +templates_path = []
> +
> +# List of patterns, relative to source directory, that match files and
> +# directories to ignore when looking for source files.
> +# This pattern also affects html_static_path and html_extra_path.
> +exclude_patterns = []
> +
> +
> +# -- Options for HTML output -------------------------------------------------
> +
> +# The theme to use for HTML and HTML Help pages.  See the documentation for
> +# a list of builtin themes.
> +#
> +html_theme = 'alabaster'
> +
> +# Add any paths that contain custom static files (such as style sheets) here,
> +# relative to this directory. They are copied after the builtin static files,
> +# so a file named "default.css" will overwrite the builtin "default.css".
> +html_static_path = []
> +
> +html_extra_path = ['../doc/html']
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

All looks good to me except that Copyright should be yours here, not mine. :)

Bart

> +
> +   libgpiod documentation master file.
> +
> +Welcome to libgpiod's documentation!
> +====================================
> +
> +.. toctree::
> +   :maxdepth: 2
> +   :caption: Contents:
> +
> +
> +
> +Indices and tables
> +==================
> +
> +* :ref:`genindex`
> +* :ref:`modindex`
> +* :ref:`search`
> --
> 2.35.1
>
