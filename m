Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60F8F6765C2
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Jan 2023 11:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbjAUKja (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 21 Jan 2023 05:39:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbjAUKj3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 21 Jan 2023 05:39:29 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D2434C0EF
        for <linux-gpio@vger.kernel.org>; Sat, 21 Jan 2023 02:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674297568; x=1705833568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UG1+XnRS6RjeWE8GQFcLpqgnWRjPBdRyK3D53H+c8wo=;
  b=ALPBPq06puEjNat/sBVhJMXN7jnGo/aLUHNnKy7oz2Y32RAehys78GXF
   OMw7QK2YYBY8Knb0MOHHZpu5+tBF8kuwoitU7Cshm/EUID7hif/M0eehI
   uWWBuQhlLuazu4CYfyFbwppD+glVB2soe5bm+heeKMDE8CHDZeTr8Y94K
   wOguXpO9OpsdJ7H0utpGvBkz/zNyclLbWfKOZ9YJDqtl/wUuy+bCjmqgO
   V/jAU1U8NDQb3RfgsMWTotf+z6OpVYWrqyNOKFCAEgzxLvrbjsmpxiCEf
   bpCWH1Cm4sCCDd3bShRyhYP2p01JkyC0ZSDw8CzBVetWx+/2dQizd41s/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="323463824"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="323463824"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 02:39:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="724236668"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="724236668"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 21 Jan 2023 02:39:26 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pJBHQ-00CkTI-1i;
        Sat, 21 Jan 2023 12:39:24 +0200
Date:   Sat, 21 Jan 2023 12:39:24 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     kernel test robot <lkp@intel.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [brgl:gpio/for-next 43/49] drivers/gpio/gpio-zevio.c:174:33:
 error: incomplete definition of type 'struct platform_device'
Message-ID: <Y8vA3L90ymwcqNf3@smile.fi.intel.com>
References: <202301210447.JPSHmqrO-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301210447.JPSHmqrO-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 21, 2023 at 04:19:46AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
> head:   e464c96eae336dd2f81a1926c30523f061469f64
> commit: 899f6a9c43644d60dcae381f8cbb1fff3fbcbe64 [43/49] gpio: zevio: Use proper headers and drop OF_GPIO dependency
> config: arm-randconfig-c002-20230120 (https://download.01.org/0day-ci/archive/20230121/202301210447.JPSHmqrO-lkp@intel.com/config)
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit/?id=899f6a9c43644d60dcae381f8cbb1fff3fbcbe64
>         git remote add brgl https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
>         git fetch --no-tags brgl gpio/for-next
>         git checkout 899f6a9c43644d60dcae381f8cbb1fff3fbcbe64
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):

It's strange, I guess I have sent a v2 of the series where this one has to be addressed.
Let me check.

-- 
With Best Regards,
Andy Shevchenko


