Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACEF72A923
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jun 2023 07:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbjFJFVU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Jun 2023 01:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjFJFVT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Jun 2023 01:21:19 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58A5F198C
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 22:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686374478; x=1717910478;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mL0BpjPiuiQPiZskBFJzDyE5VNwgjKlZuy1uPb2CzFU=;
  b=OJA3HrecuQk6RX/EqYGzolUBSNOOq8b+laukA2/+92lptyEacyKMfXx8
   Pfhg8e/zaRom/GZgc+WM94cF91g/Mw29oZZcKMYgPREC9VcUH6zrXtMiV
   QhMZk1gsEgP8qtB4qJSPPGW18Kt2x01q+n9F8kPSQUTF5zcfKWmQKINvc
   pV+TMHukpkDMnyEABh4t3lLJj93RdL6dEdsP2OaZ9rL62gvAZH1TK1j+i
   OF3y36tbazQw53o3c4ejIE0lPSZTCTD3mjnbeIA64kC49yX1blMbqXxXr
   ATW4I4g5nkHJ3NKoIpv3ZNIRnH6XgLsYxrBs6XUAAgAMBzi+e/L0RX4xV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="338094276"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="338094276"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 22:21:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="854960642"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="854960642"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2023 22:21:16 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q7r2J-0009lw-2R;
        Sat, 10 Jun 2023 05:21:15 +0000
Date:   Sat, 10 Jun 2023 13:20:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        brgl@bgdev.pl
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        Kent Gibson <warthog618@gmail.com>
Subject: Re: [libgpiod][PATCH] doc: add configuration to generate doxygen
 documentation on readthedocs.
Message-ID: <202306101327.8CQ451FM-lkp@intel.com>
References: <20230610020148.8973-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230610020148.8973-1-warthog618@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Kent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.4-rc5 next-20230609]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kent-Gibson/doc-add-configuration-to-generate-doxygen-documentation-on-readthedocs/20230610-100330
base:   linus/master
patch link:    https://lore.kernel.org/r/20230610020148.8973-1-warthog618%40gmail.com
patch subject: [libgpiod][PATCH] doc: add configuration to generate doxygen documentation on readthedocs.
config: powerpc-randconfig-r035-20230610 (https://download.01.org/0day-ci/archive/20230610/202306101327.8CQ451FM-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        git checkout linus/master
        b4 shazam https://lore.kernel.org/r/20230610020148.8973-1-warthog618@gmail.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306101327.8CQ451FM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .readthedocs.yaml: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
