Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A47F72D5C82
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 14:57:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389748AbgLJN5U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 08:57:20 -0500
Received: from mga01.intel.com ([192.55.52.88]:27818 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389743AbgLJN5N (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Dec 2020 08:57:13 -0500
IronPort-SDR: M+UFAv7i0x7GlA6/y9LAOaJnJSlhXk90ZjSCRc1uzkhfsaQxu3Tc5poVfBx4j+gPbKpMMJOKM7
 d1If0KvO65Jw==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="192575912"
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; 
   d="scan'208";a="192575912"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 05:55:27 -0800
IronPort-SDR: LBNjwQ1W4Atqa25LpN75rIzKFo78XubIeIatj6jYtdmTMU2++qlaEmWMVpaHzVYHvMAqPheKZs
 tv8kC/+3H46Q==
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; 
   d="scan'208";a="408536628"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 05:55:25 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1knMQl-00DQrl-8g; Thu, 10 Dec 2020 15:56:27 +0200
Date:   Thu, 10 Dec 2020 15:56:27 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [libgpiod][PATCH 00/14] treewide: start shaving off cruft for
 v2.0
Message-ID: <20201210135627.GH4077@smile.fi.intel.com>
References: <20201210132315.5785-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210132315.5785-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 10, 2020 at 02:23:01PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The following series removes a lot of interfaces that were deemed overkill
> in libgpiod and the removal of which was suggested to me before proceeding
> with the new API.
> 
> This leaves a couple holes in the library but we'll follow them up with
> more improvements all over the tree. We'll create a new object called
> gpiod_request for dealing with line requests of arbitrary size. We'll
> probably remove the the bulk objects from bindings and eventually we'll
> switch to using the v2 kernel uAPI.
> 
> Andy - a note for you: I know you're always very thorough in your reviews
> but in this case let's consider this series preparing a construction zone
> for the new API. Please don't nitpick too much. :)

I don't know what you are talking about. The series looks nice, esp. taking
into account statistics! FWIW,

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

One side note, though. Are you already plan to support autotools-2.70?

> Bartosz Golaszewski (14):
>   bindings: cxx: check for error from gpiod_line_bulk_new()
>   build: drop the message about tests having been built successfully
>   core: export gpiod_is_gpiochip_device()
>   bulk: drop the limit on the max number of lines
>   core: drop line iterators
>   treewide: kill opening chips by label
>   API: move gpiod_line_get_chip() to line attributes section
>   core: kill gpiod_line_close_chip()
>   core: kill gpiod_line_get()
>   treewide: kill global line lookup
>   treewide: kill find_lines()
>   core: rework gpiod_chip_find_line()
>   build: add a configure switch for building examples
>   core: kill chip iterators
> 
>  bindings/cxx/Makefile.am                |   8 +-
>  bindings/cxx/chip.cpp                   |  47 +--
>  bindings/cxx/examples/Makefile.am       |   4 +-
>  bindings/cxx/examples/gpiodetectcxx.cpp |  13 +-
>  bindings/cxx/examples/gpiofindcxx.cpp   |  18 +-
>  bindings/cxx/examples/gpioinfocxx.cpp   |  43 ++-
>  bindings/cxx/gpiod.hpp                  | 147 +-------
>  bindings/cxx/iter.cpp                   |  95 +----
>  bindings/cxx/line.cpp                   |  15 -
>  bindings/cxx/line_bulk.cpp              |  24 +-
>  bindings/cxx/tests/tests-chip.cpp       |  62 ++--
>  bindings/cxx/tests/tests-iter.cpp       |  37 --
>  bindings/cxx/tests/tests-line.cpp       |  19 -
>  bindings/python/Makefile.am             |  10 +-
>  bindings/python/examples/gpiodetect.py  |  12 +-
>  bindings/python/examples/gpiofind.py    |  15 +-
>  bindings/python/examples/gpioinfo.py    |  33 +-
>  bindings/python/gpiodmodule.c           | 473 +++++++-----------------
>  bindings/python/tests/gpiod_py_test.py  | 100 +----
>  configure.ac                            |  12 +
>  include/gpiod.h                         | 258 ++-----------
>  lib/Makefile.am                         |   2 +-
>  lib/core.c                              |  12 +-
>  lib/helpers.c                           | 176 +++------
>  lib/iter.c                              | 171 ---------
>  tests/Makefile.am                       |  13 -
>  tests/gpiod-test.h                      |   4 -
>  tests/tests-bulk.c                      |   9 -
>  tests/tests-chip.c                      |  97 +----
>  tests/tests-iter.c                      | 123 ------
>  tests/tests-line.c                      |  52 ---
>  tools/gpiodetect.c                      |  29 +-
>  tools/gpiofind.c                        |  34 +-
>  tools/gpioinfo.c                        |  41 +-
>  tools/gpiomon.c                         |   5 +-
>  tools/tools-common.c                    |  15 +
>  tools/tools-common.h                    |   3 +
>  37 files changed, 557 insertions(+), 1674 deletions(-)
>  delete mode 100644 lib/iter.c
>  delete mode 100644 tests/tests-iter.c
> 
> -- 
> 2.29.1
> 

-- 
With Best Regards,
Andy Shevchenko


