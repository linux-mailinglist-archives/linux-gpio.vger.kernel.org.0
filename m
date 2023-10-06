Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA6857BB12E
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Oct 2023 07:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbjJFFVe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Oct 2023 01:21:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbjJFFVd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2023 01:21:33 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 535A8B6;
        Thu,  5 Oct 2023 22:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696569692; x=1728105692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kTezNlXjIvleKEn+KNJaXcoyrpYTmoUt9fJbdVMLQBs=;
  b=NDhO9VqagmNqot9eYZyu/k8qySdDK3DH6x9is3WD+sXGWNTKAa+nQorx
   Xjs7HaiHp0Fdzg0blIa0GypI0mw5hy/x/LnySioK+xAI71hJFLNqIOITP
   o/+Bh+rMByhekad5rl4Uyu+gkj4kfu81MoJL3HVpoyfTNHehj3wwKuUxS
   1bsJ/CIW5Lz1+FsWCRCpTxR5yUgStpPe67WP+PcC15QPyfskwDxhzjKDn
   c8W0Y9hTVruAvieeXdeWF4nE6ILbCClV1YracmzbKn33RO4AkAeGKwRVA
   KZT0z+UZ2v9lnnoP4nsvp1GpcC6YDXchA54KjnOC+lthCh6qxvn46SwNa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363958930"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="363958930"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 22:21:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="787263452"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="787263452"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 05 Oct 2023 22:21:25 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qodH7-000MI2-2b;
        Fri, 06 Oct 2023 05:21:22 +0000
Date:   Fri, 6 Oct 2023 13:20:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, cw00.choi@samsung.com
Cc:     oe-kbuild-all@lists.linux.dev, peter.griffin@linaro.org,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 15/21] clk: google: gs101: Add support for CMU_MISC clock
 unit
Message-ID: <202310061359.5WMm9C9Y-lkp@intel.com>
References: <20231005155618.700312-16-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005155618.700312-16-peter.griffin@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Peter,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on robh/for-next linus/master v6.6-rc4 next-20231005]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Griffin/dt-bindings-interrupt-controller-Add-gs101-interrupt-controller/20231005-235922
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20231005155618.700312-16-peter.griffin%40linaro.org
patch subject: [PATCH 15/21] clk: google: gs101: Add support for CMU_MISC clock unit
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20231006/202310061359.5WMm9C9Y-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310061359.5WMm9C9Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310061359.5WMm9C9Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/clk/samsung/clk-gs101.c:17:
>> drivers/clk/samsung/clk-gs101.c:2087:7: warning: 'mout_misc_gic_p' defined but not used [-Wunused-const-variable=]
    2087 | PNAME(mout_misc_gic_p)                  = { "oscclk", "dout_cmu_misc_sss" };
         |       ^~~~~~~~~~~~~~~
   drivers/clk/samsung/clk.h:226:44: note: in definition of macro 'PNAME'
     226 | #define PNAME(x) static const char * const x[] __initconst
         |                                            ^
   drivers/clk/samsung/clk-gs101.c:937:7: warning: 'mout_cmu_g2d_p' defined but not used [-Wunused-const-variable=]
     937 | PNAME(mout_cmu_g2d_p)           = { "dout_shared0_div3", "fout_shared3_pll",
         |       ^~~~~~~~~~~~~~
   drivers/clk/samsung/clk.h:226:44: note: in definition of macro 'PNAME'
     226 | #define PNAME(x) static const char * const x[] __initconst
         |                                            ^
   drivers/clk/samsung/clk-gs101.c:890:7: warning: 'mout_cmu_boost_p' defined but not used [-Wunused-const-variable=]
     890 | PNAME(mout_cmu_boost_p)         = { "dout_shared0_div4", "dout_shared1_div4",
         |       ^~~~~~~~~~~~~~~~
   drivers/clk/samsung/clk.h:226:44: note: in definition of macro 'PNAME'
     226 | #define PNAME(x) static const char * const x[] __initconst
         |                                            ^
   drivers/clk/samsung/clk-gs101.c:811:7: warning: 'mout_cmu_pdp_vra_p' defined but not used [-Wunused-const-variable=]
     811 | PNAME(mout_cmu_pdp_vra_p)       = { "fout_shared2_pll", "dout_shared0_div3",
         |       ^~~~~~~~~~~~~~~~~~
   drivers/clk/samsung/clk.h:226:44: note: in definition of macro 'PNAME'
     226 | #define PNAME(x) static const char * const x[] __initconst
         |                                            ^


vim +/mout_misc_gic_p +2087 drivers/clk/samsung/clk-gs101.c

  2083	
  2084	/* List of parent clocks for Muxes in CMU_MISC */
  2085	PNAME(mout_misc_bus_user_p)		= { "oscclk", "dout_cmu_misc_bus" };
  2086	PNAME(mout_misc_sss_user_p)		= { "oscclk", "dout_cmu_misc_sss" };
> 2087	PNAME(mout_misc_gic_p)			= { "oscclk", "dout_cmu_misc_sss" };
  2088	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
