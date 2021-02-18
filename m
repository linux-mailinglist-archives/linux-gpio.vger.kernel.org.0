Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9926831E3D1
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Feb 2021 02:22:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhBRBWf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Feb 2021 20:22:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbhBRBWb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Feb 2021 20:22:31 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8905C0613D6
        for <linux-gpio@vger.kernel.org>; Wed, 17 Feb 2021 17:21:51 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id kr16so371902pjb.2
        for <linux-gpio@vger.kernel.org>; Wed, 17 Feb 2021 17:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6nHFcuW0zCPZ5++pdOfiKryO/LWPYqqtH/YHPQMnr48=;
        b=Xj8aFyFdqnycX+2x/yS0Reb20BbX1vf/Tn9pSx+unKF+2bXE9L/zfvrYq2IuwN07hs
         S+nUVP84N29l9WWcd5cIhqLkgGPyWmt1flfB3kAqPXXnf5dLnrX7RrEHwCp1Y30h+z60
         5qo4q6ocziDcdVHNuZzoamM1ZJozsVlYUKpxFg/AqmVPbXsXeYveyjGxv09ye7I+xwET
         13FjPC1FiAzQJMABAm2HzUT1phLVbVQ9NRmdCARgBBWBDlYZMnCjaotlY4hY7Y5Apco+
         EgmmMcgWpnETOKEuAkzgK8HFpZw9WH7ROC1/KkCFhOEXPN5jJOCRFlwAhAcc/7XlGYP3
         7/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6nHFcuW0zCPZ5++pdOfiKryO/LWPYqqtH/YHPQMnr48=;
        b=M+IEM29nMc2GRnLpMO4GdnpAENoKl9FPEp3FqFBLP4aaZuM6hlxYFyQZ7ejVr1EtHO
         daPZChQZsMK88EXQ1x9p0ocP+4lT+O5vBN8ae1KheqrviZVlbnznOcCyFrSFnI1VIDbG
         d/zD0MQ58dRYY51rxEhDUE+1+sAt9wT5/DqCYyz6Zquxi+KpW5Ta/rcmsOSb3pyka9mE
         TQ31rwLdlRd43oGVJ4nqniM69CdQUdR4FuQf1bDlE0olyY+cc7X0bVQdqZTbklfqorS4
         gbCfNr7wJXyWGYVHQ7f1fsYDSS1V4kTFqkP50+c5SanU76aGuIKQoJ2HIhqXkPCDXWOW
         EttQ==
X-Gm-Message-State: AOAM532TvriKCdzSbl7Adotfgz5c/YWjednHyGcufTwrawS6iI2Fehst
        sxnOAisJrctk7Fa8c4qPeEE=
X-Google-Smtp-Source: ABdhPJyjKWewAo+iOlKPROspugeWqrUkz/w3b4Jw4PvoOLJc3AASkjQvTYcMYQjaUfICI4AGrgw2Gg==
X-Received: by 2002:a17:90a:ac14:: with SMTP id o20mr1524693pjq.171.1613611311087;
        Wed, 17 Feb 2021 17:21:51 -0800 (PST)
Received: from sol (106-69-179-46.dyn.iinet.net.au. [106.69.179.46])
        by smtp.gmail.com with ESMTPSA id h186sm326438pgc.38.2021.02.17.17.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 17:21:50 -0800 (PST)
Date:   Thu, 18 Feb 2021 09:21:46 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [libgpiod][PATCH 0/3] licensing: try to get licensing right
Message-ID: <20210218012146.GA12952@sol>
References: <20210217130225.6378-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210217130225.6378-1-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 17, 2021 at 02:02:22PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This series tries to improve the licensing situation of libgpiod before we
> proceed with v2.0.
> 
> The first patch is rather uncotroversial: it makes the project compliant
> with the REUSE v3.0 specification.
> 
> Next two patches propose to change the licenses for certain files:
> non-library source files are relicensed under GPL-2.0-or-later while C++
> library code's license is upgraded to LGPL-3.0-or-later.
> 
> The only person other than myself who contributed significant code to the
> relicensed files is Kent Gibson (Cc'ed) so these patches will need his
> ack.
> 

That works for me.

Acked-by: Kent Gibson <warthog618@gmail.com>

for the series.

Cheers,
Kent.

> Bartosz Golaszewski (3):
>   licensing: make the project REUSE-compliant
>   licensing: relicense non-library code under GPL-2.0-or-later
>   licensing: relicense C++ library code under LGPL-3.0-or-later
> 
>  .gitignore                                 |   3 +
>  COPYING                                    | 511 +--------------------
>  Doxyfile.in                                |   9 +-
>  LICENSES/CC-BY-SA-4.0.txt                  | 427 +++++++++++++++++
>  LICENSES/GPL-2.0-only.txt                  | 339 ++++++++++++++
>  LICENSES/GPL-2.0-or-later.txt              |   1 +
>  LICENSES/LGPL-2.1-or-later.txt             | 502 ++++++++++++++++++++
>  LICENSES/LGPL-3.0-or-later.txt             | 165 +++++++
>  LICENSES/Linux-syscall-note.txt            |  25 +
>  Makefile.am                                |  19 +-
>  NEWS                                       |   3 +
>  README                                     |   3 +
>  TODO                                       |   3 +
>  autogen.sh                                 |  11 +-
>  bindings/Makefile.am                       |   9 +-
>  bindings/cxx/Makefile.am                   |   9 +-
>  bindings/cxx/chip.cpp                      |   8 +-
>  bindings/cxx/examples/.gitignore           |   3 +
>  bindings/cxx/examples/Makefile.am          |   9 +-
>  bindings/cxx/examples/gpiodetectcxx.cpp    |   8 +-
>  bindings/cxx/examples/gpiofindcxx.cpp      |   8 +-
>  bindings/cxx/examples/gpiogetcxx.cpp       |   8 +-
>  bindings/cxx/examples/gpioinfocxx.cpp      |   8 +-
>  bindings/cxx/examples/gpiomoncxx.cpp       |   8 +-
>  bindings/cxx/examples/gpiosetcxx.cpp       |   8 +-
>  bindings/cxx/gpiod.hpp                     |   8 +-
>  bindings/cxx/iter.cpp                      |   8 +-
>  bindings/cxx/libgpiodcxx.pc.in             |   3 +
>  bindings/cxx/line.cpp                      |  10 +-
>  bindings/cxx/line_bulk.cpp                 |   8 +-
>  bindings/cxx/tests/.gitignore              |   3 +
>  bindings/cxx/tests/Makefile.am             |   9 +-
>  bindings/cxx/tests/gpio-mockup.cpp         |   8 +-
>  bindings/cxx/tests/gpio-mockup.hpp         |   8 +-
>  bindings/cxx/tests/gpiod-cxx-test-main.cpp |   8 +-
>  bindings/cxx/tests/gpiod-cxx-test.cpp      |   8 +-
>  bindings/cxx/tests/tests-chip.cpp          |   8 +-
>  bindings/cxx/tests/tests-event.cpp         |   8 +-
>  bindings/cxx/tests/tests-iter.cpp          |   8 +-
>  bindings/cxx/tests/tests-line.cpp          |   8 +-
>  bindings/python/Makefile.am                |   9 +-
>  bindings/python/examples/Makefile.am       |   9 +-
>  bindings/python/examples/gpiodetect.py     |   9 +-
>  bindings/python/examples/gpiofind.py       |   9 +-
>  bindings/python/examples/gpioget.py        |   9 +-
>  bindings/python/examples/gpioinfo.py       |   9 +-
>  bindings/python/examples/gpiomon.py        |   9 +-
>  bindings/python/examples/gpioset.py        |   9 +-
>  bindings/python/gpiodmodule.c              |   6 +-
>  bindings/python/tests/Makefile.am          |   9 +-
>  bindings/python/tests/gpiod_py_test.py     |   9 +-
>  bindings/python/tests/gpiomockupmodule.c   |   6 +-
>  configure.ac                               |   9 +-
>  include/Makefile.am                        |   9 +-
>  include/gpiod.h                            |   6 +-
>  lib/Makefile.am                            |   9 +-
>  lib/core.c                                 |   6 +-
>  lib/helpers.c                              |   6 +-
>  lib/libgpiod.pc.in                         |   4 +
>  lib/misc.c                                 |   6 +-
>  lib/uapi/gpio.h                            |  22 +-
>  man/.gitignore                             |   3 +
>  man/Makefile.am                            |   9 +-
>  man/template                               |   3 +
>  tests/.gitignore                           |   3 +
>  tests/Makefile.am                          |   9 +-
>  tests/gpiod-test.c                         |   8 +-
>  tests/gpiod-test.h                         |   8 +-
>  tests/mockup/Makefile.am                   |   9 +-
>  tests/mockup/gpio-mockup.c                 |   8 +-
>  tests/mockup/gpio-mockup.h                 |   6 +-
>  tests/tests-bulk.c                         |   8 +-
>  tests/tests-chip.c                         |   8 +-
>  tests/tests-event.c                        |   8 +-
>  tests/tests-line.c                         |   8 +-
>  tests/tests-misc.c                         |   8 +-
>  tools/.gitignore                           |   3 +
>  tools/Makefile.am                          |   9 +-
>  tools/gpio-tools-test                      |   9 +-
>  tools/gpio-tools-test.bats                 |   9 +-
>  tools/gpiodetect.c                         |   8 +-
>  tools/gpiofind.c                           |   8 +-
>  tools/gpioget.c                            |   8 +-
>  tools/gpioinfo.c                           |   8 +-
>  tools/gpiomon.c                            |   8 +-
>  tools/gpioset.c                            |   8 +-
>  tools/tools-common.c                       |   8 +-
>  tools/tools-common.h                       |   8 +-
>  88 files changed, 1663 insertions(+), 936 deletions(-)
>  create mode 100644 LICENSES/CC-BY-SA-4.0.txt
>  create mode 100644 LICENSES/GPL-2.0-only.txt
>  create mode 120000 LICENSES/GPL-2.0-or-later.txt
>  create mode 100644 LICENSES/LGPL-2.1-or-later.txt
>  create mode 100644 LICENSES/LGPL-3.0-or-later.txt
>  create mode 100644 LICENSES/Linux-syscall-note.txt
> 
> -- 
> 2.29.1
> 
