Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B57B720048C
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2020 11:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731541AbgFSJFC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Jun 2020 05:05:02 -0400
Received: from mga17.intel.com ([192.55.52.151]:53543 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731538AbgFSJFC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Jun 2020 05:05:02 -0400
IronPort-SDR: qWFhVEpIFMwAmVoHNHT2Kz2TlDx806AY1pjC+SSgkm5lXuZgDj6z9xlEK9VflUA+EaMA/yfqPg
 HstDcgPOc9Hw==
X-IronPort-AV: E=McAfee;i="6000,8403,9656"; a="123160675"
X-IronPort-AV: E=Sophos;i="5.75,254,1589266800"; 
   d="scan'208";a="123160675"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2020 02:05:01 -0700
IronPort-SDR: kF7t/FU4z5wGAUzCozSJdjd4BBAbdDGgBBHDlB9u9WN/LIQDdScZQmzCyhb/NdB4JlLBMi1ZDx
 6ziPktrLxEQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,254,1589266800"; 
   d="scan'208";a="310110943"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002.fm.intel.com with ESMTP; 19 Jun 2020 02:04:58 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jmCxI-00ERf1-JA; Fri, 19 Jun 2020 12:05:00 +0300
Date:   Fri, 19 Jun 2020 12:05:00 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Syed Nayyar Waris <syednwaris@gmail.com>
Cc:     kernel test robot <lkp@intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        kbuild-all@lists.01.org,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 4/4] gpio: xilinx: Utilize for_each_set_clump macro
Message-ID: <20200619090500.GC2428291@smile.fi.intel.com>
References: <46c05c5deeada60a13ee0de83c68583d578f42fd.1592224129.git.syednwaris@gmail.com>
 <202006160420.iatdr9ab%lkp@intel.com>
 <CACG_h5qUZsR7Zd9a+BQJqyuJZBrv-en+gC-sgcV+xV+A5ZOBhA@mail.gmail.com>
 <CAHp75Ve_=LwV6fO3ESgbCOVDVr=C5wrnAJX9od9evFvHU5-Krw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Ve_=LwV6fO3ESgbCOVDVr=C5wrnAJX9od9evFvHU5-Krw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 19, 2020 at 11:38:59AM +0300, Andy Shevchenko wrote:
> On Fri, Jun 19, 2020 at 10:02 AM Syed Nayyar Waris <syednwaris@gmail.com> wrote:
> 
> ...
> 
> > > config: sparc64-randconfig-s032-20200615 (attached as .config)
> > > compiler: sparc64-linux-gcc (GCC) 9.3.0
> > > reproduce:
> > >         # apt-get install sparse
> > >         # sparse version: v0.6.2-rc1-3-g55607964-dirty
> > >         # save the attached .config to linux build tree
> > >         make W=1 C=1 ARCH=sparc64 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'
> 
> ...
> 
> > > sparse warnings: (new ones prefixed by >>)
> > >
> > > >> include/linux/bitmap.h:639:45: sparse: sparse: shift too big (64) for type unsigned long
> > > >> include/linux/bitmap.h:639:45: sparse: sparse: shift too big (64) for type unsigned long
> > >    include/linux/bitmap.h:594:63: sparse: sparse: shift too big (64) for type unsigned long
> > > >> include/linux/bitmap.h:639:45: sparse: sparse: shift too big (64) for type unsigned long
> > > >> include/linux/bitmap.h:638:17: sparse: sparse: invalid access past the end of 'old' (8 8)
> 
> > It seems to me that to reproduce this warning, I have to use the
> > sparc64 compiler. I have installed 'sparc64-linux-gnu-gcc' on my
> > computer.
> 
> Sparse is not a compiler.

On x86_64:

  CHECK   drivers/gpio/gpio-xilinx.c
  include/linux/bitmap.h:639:45: warning: shift too big (64) for type unsigned long
  include/linux/bitmap.h:639:45: warning: shift too big (64) for type unsigned long
  include/linux/bitmap.h:594:63: warning: shift too big (64) for type unsigned long
  include/linux/bitmap.h:639:45: warning: shift too big (64) for type unsigned long
  include/linux/bitmap.h:638:17: warning: invalid access past the end of 'old' (8 8)

> > I have to specify that this compiler needs to be used for build
> > process. How/ Where do I specify this?
> >
> > I have downloaded the config.gz (has config file) and placed it at the
> > root of the linux kernel project tree. But the Makefile STILL has
> > 'gcc' as the compiler. When I build, it is the 'gcc' compiler being
> > used and not 'sparc64-linux-gnu-gcc'. I know I can manually change the
> > Makefile to use sparc64 compiler, but I think there must be some more
> > elegant way to do this, perhaps using make menuconfig?
> 
> If you wish to run a compilation, download a compiler from [1], and,
> after adding its bin/ folder to PATH, run
> make CROSS_COMPILE=sparc64-linux- ARCH=sparc64 ... # first generate .config
> 
> > Kindly illuminate as to how shall I reproduce the compiler warning.
> 
> > > 803024b6c8a375 Syed Nayyar Waris      2020-06-15 @638           map[index + 1] &= ~BITMAP_LAST_WORD_MASK(start + nbits);
> > > 803024b6c8a375 Syed Nayyar Waris      2020-06-15 @639           map[index + 1] |= (value >> space);
> 
> Hmm... I think I sent a reply [2] where I explained how space can be
> 64. Do you agree with analysis?
> 
> [1]: https://mirrors.edge.kernel.org/pub/tools/crosstool/
> [2]: https://lore.kernel.org/lkml/20200616081428.GP2428291@smile.fi.intel.com/

-- 
With Best Regards,
Andy Shevchenko


