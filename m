Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6209737A0C2
	for <lists+linux-gpio@lfdr.de>; Tue, 11 May 2021 09:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbhEKHYM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 May 2021 03:24:12 -0400
Received: from mga14.intel.com ([192.55.52.115]:1964 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229917AbhEKHYM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 May 2021 03:24:12 -0400
IronPort-SDR: RS5zs9K4Z+TSwsIjzo4aqzZ6tZQXLYbTElFwEI34io4tuuhY63SaxxAycPkpESArfTNZt6mS7g
 627iYgqyy15Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="199054576"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="199054576"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 00:23:05 -0700
IronPort-SDR: yq4KAV5YYtORNFKctyjJedbKsYkUglbPYIcvkQdl1p8CupKbX/JT8h80lKOg5qCp3JW71jIYzz
 lyz6gaiu+58Q==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="609388919"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 00:23:02 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lgMjL-00BNLu-DV; Tue, 11 May 2021 10:22:59 +0300
Date:   Tue, 11 May 2021 10:22:59 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     kernel test robot <lkp@intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, kbuild-all@lists.01.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] gpiolib: Introduce for_each_gpio_desc() macro
Message-ID: <YJow03/jdelIoywx@smile.fi.intel.com>
References: <20210510195242.12443-1-andriy.shevchenko@linux.intel.com>
 <202105110723.VQRv6lJT-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202105110723.VQRv6lJT-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 11, 2021 at 07:36:58AM +0800, kernel test robot wrote:
> Hi Andy,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on gpio/for-next]
> [also build test WARNING on v5.13-rc1 next-20210510]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Andy-Shevchenko/gpiolib-Introduce-for_each_gpio_desc-macro/20210511-035305
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git for-next
> config: arm-randconfig-s031-20210510 (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.3-341-g8af24329-dirty
>         # https://github.com/0day-ci/linux/commit/ceaf41face19ca3a36b81b3b866c1708a90cb4e2
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Andy-Shevchenko/gpiolib-Introduce-for_each_gpio_desc-macro/20210511-035305
>         git checkout ceaf41face19ca3a36b81b3b866c1708a90cb4e2
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=1 ARCH=arm 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

Right, I missed OF part compilation, thanks for reminder, I'll fix my kernel
configuration and the patch in v2.


-- 
With Best Regards,
Andy Shevchenko


