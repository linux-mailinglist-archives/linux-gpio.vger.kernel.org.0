Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9926231BA98
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Feb 2021 14:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbhBONwr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Feb 2021 08:52:47 -0500
Received: from mga05.intel.com ([192.55.52.43]:24318 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230397AbhBONwb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Feb 2021 08:52:31 -0500
IronPort-SDR: mfYQqv1rZZVlXbGq+NCdbtri0F+TaUk6F3tcSQu9wuopercGAWMxzQUsWCNKjdcAHvuFsItbyy
 hWU04fjxo0/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9895"; a="267529663"
X-IronPort-AV: E=Sophos;i="5.81,180,1610438400"; 
   d="scan'208";a="267529663"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 05:46:46 -0800
IronPort-SDR: Be9hylppaz6jGAi1b1/0mqq/uUEIKGlAViZjWNE0yIc4Ty2gPdv58q4mg1ZprIa+hOZvd6vRia
 RocRl9QGhBIw==
X-IronPort-AV: E=Sophos;i="5.81,180,1610438400"; 
   d="scan'208";a="492741188"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 05:46:44 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lBeD4-005Cgk-0A; Mon, 15 Feb 2021 15:46:42 +0200
Date:   Mon, 15 Feb 2021 15:46:41 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Syed Nayyar Waris <syednwaris@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/3] gpio: xilinx: Utilize generic bitmap_get_value
 and _set_value
Message-ID: <YCp7QYTe4nVxS3AK@smile.fi.intel.com>
References: <1b1f706b60e4c571c4f17d53ac640e8bd8384856.1613134924.git.syednwaris@gmail.com>
 <202102141226.pmNlFRSx-lkp@intel.com>
 <CACG_h5q5emgfbf4L-Czfh1GRiTUrx7a+LXCfsxUmQ8YSs1aoKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACG_h5q5emgfbf4L-Czfh1GRiTUrx7a+LXCfsxUmQ8YSs1aoKw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 15, 2021 at 06:56:10PM +0530, Syed Nayyar Waris wrote:
> On Sun, Feb 14, 2021 at 10:11 AM kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Syed,
> >
> > I love your patch! Yet something to improve:
> >
> > [auto build test ERROR on e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62]
> >
> > url:    https://github.com/0day-ci/linux/commits/Syed-Nayyar-Waris/Introduce-the-for_each_set_clump-macro/20210212-213005
> > base:   e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62
> > config: i386-randconfig-d002-20200329 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> > reproduce (this is a W=1 build):
> >         # https://github.com/0day-ci/linux/commit/d83196ca7a23f614773c049b69ce3896679cec61
> >         git remote add linux-review https://github.com/0day-ci/linux
> >         git fetch --no-tags linux-review Syed-Nayyar-Waris/Introduce-the-for_each_set_clump-macro/20210212-213005
> >         git checkout d83196ca7a23f614773c049b69ce3896679cec61
> >         # save the attached .config to linux build tree
> >         make W=1 ARCH=i386
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> >
> > >> ERROR: modpost: "bitmap_get_value" [drivers/gpio/gpio-xilinx.ko] undefined!
> > >> ERROR: modpost: "bitmap_set_value" [drivers/gpio/gpio-xilinx.ko] undefined!
> >
> 
> Dear All,
> 
> I was able to reproduce the above 2 build errors with the config file
> provided and the build command mentioned in the above mail. But I need
> help to fix the build errors.
> 
> Scenario:
> Function 'bitmap_get_value()' is declared in 'gpiolib.h'. It is
> defined in 'gpiolib.c'. Function 'bitmap_get_value()'  is then being
> used in gpio-xilinx.c and the build error is thrown. Similar situation
> holds for the other function 'bitmap_set_value'.
> 
> How do I resolve the above build error?. Kindly illuminate. The full
> patchset can be found at:
> https://lore.kernel.org/patchwork/cover/1380056/

Missed EXPORT_SYMBOL_GPL() or so?


-- 
With Best Regards,
Andy Shevchenko


