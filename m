Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9C358A50C
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Aug 2022 05:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231882AbiHEDfQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Aug 2022 23:35:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbiHEDfO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Aug 2022 23:35:14 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2573180
        for <linux-gpio@vger.kernel.org>; Thu,  4 Aug 2022 20:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659670511; x=1691206511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4SNsMHC4eklXGXQI7uFULZL0eoaVtLScE31wN2YTbpc=;
  b=G+vQ3HNy47hVjtyL9HoWEjrnxKkXIm2n64IGbBHuJRKxZSkH1bo/tYSH
   h0QaneSWIGOCWANJ3kCRrO1zDARra7ZJiMeEpBEyZvUwOCvvk21pCOSBY
   vctUB/ZOkGmfVZo/ZrNx2lhNFHWC95XydijU1bWIpYvgcAYycnksJTlJd
   f5Uq9nReCmJAuvP1eyPnIN8jechwwe77QrCdYC3UpPVRXokrWF69qOoV5
   enOk8jOXzI09eAcQUkyoVJRVlgSJbNTPpv0GZVRr0a3N4BMx13N9wZeMN
   yflqZPt4hEy93oOaKKhJPfE92zupC1oorFmCZeQtqzYmaK0a4HBysv7k1
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10429"; a="273159099"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="273159099"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2022 20:35:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="636352660"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 Aug 2022 20:35:08 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oJo7A-000J6F-0S;
        Fri, 05 Aug 2022 03:35:08 +0000
Date:   Fri, 5 Aug 2022 11:34:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/4] pinctrl: armada-37xx: Checks for errors in
 gpio_request_enable callback
Message-ID: <202208051108.mGXAaXhr-lkp@intel.com>
References: <20220804104915.23719-3-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220804104915.23719-3-pali@kernel.org>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi "Pali,

I love your patch! Yet something to improve:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linus/master v5.19 next-20220804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pali-Roh-r/pinctrl-armada-37xx-Add-missing-GPIO-only-pins/20220804-185128
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
config: arm64-randconfig-r024-20220804 (https://download.01.org/0day-ci/archive/20220805/202208051108.mGXAaXhr-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 26dd42705c2af0b8f6e5d6cdb32c9bd5ed9524eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/eafc74555d185a2f106a91f29e9884ef4c2e0458
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Pali-Roh-r/pinctrl-armada-37xx-Add-missing-GPIO-only-pins/20220804-185128
        git checkout eafc74555d185a2f106a91f29e9884ef4c2e0458
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:507:3: error: use of undeclared identifier 'ret'
                   ret = armada_37xx_pmx_set_by_name(pctldev, "gpio", group);
                   ^
   drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:508:7: error: use of undeclared identifier 'ret'
                   if (ret)
                       ^
   drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:509:11: error: use of undeclared identifier 'ret'
                           return ret;
                                  ^
   drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:834:6: warning: variable 'i' set but not used [-Wunused-but-set-variable]
           int i = 0;
               ^
   1 warning and 3 errors generated.


vim +/ret +507 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c

   495	
   496	static int armada_37xx_gpio_request_enable(struct pinctrl_dev *pctldev,
   497						   struct pinctrl_gpio_range *range,
   498						   unsigned int offset)
   499	{
   500		struct armada_37xx_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
   501		struct armada_37xx_pin_group *group;
   502		int grp = 0;
   503	
   504		dev_dbg(info->dev, "requesting gpio %d\n", offset);
   505	
   506		while ((group = armada_37xx_find_next_grp_by_pin(info, offset, &grp))) {
 > 507			ret = armada_37xx_pmx_set_by_name(pctldev, "gpio", group);
   508			if (ret)
   509				return ret;
   510		}
   511	
   512		return 0;
   513	}
   514	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
