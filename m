Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50B904E191D
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Mar 2022 01:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238636AbiCTAUR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 19 Mar 2022 20:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243187AbiCTAUQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 19 Mar 2022 20:20:16 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A065F13CE5;
        Sat, 19 Mar 2022 17:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647735533; x=1679271533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y3N4exy6MfKBJE9UeXNOTUM3ieC3sG19mzFvjlL6lRs=;
  b=k06Ca5xGwhFFs1n6oOtcawDetwxMv0C1z9g9sIrh/Ma4VfBQJiKXHrxE
   FPs1bM/zZiKOvGG4knqPba9L9T08fTho6VqOq+cBLT5eIfVSq2K6uZZmi
   aqtd82ByofNfXBSR6am3kNNdf4S5EXinnwIzZ+KXrPC1SyvBs7jXgvt5s
   PU0YJRZzTWUbIA43q/eXvk0eLzzBoBNg8dprE6PQipkhhHmibg/BWrhW2
   nySgMW9g8i7jHDLosM28ZYIFx98q5Pw3Xduiiir9rN4zgwuVlSlniwKR5
   pLlu7LP5iAL+aVD0EpRS/b3oRmonmxuUdn5qxGEkPducVzG+oZhQGjKrt
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10291"; a="256157528"
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; 
   d="scan'208";a="256157528"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2022 17:18:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; 
   d="scan'208";a="648129507"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 19 Mar 2022 17:18:50 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nVjHV-000GOi-Ln; Sun, 20 Mar 2022 00:18:49 +0000
Date:   Sun, 20 Mar 2022 08:18:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Wolfram Sang <wsa-dev@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-gpio@vger.kernel.org,
        Wolfram Sang <wsa-dev@sang-engineering.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: Re: [PATCH 2/2] pinctrl: renesas: r8a77990: add drive-strength
Message-ID: <202203200832.RD8XJhU1-lkp@intel.com>
References: <20220319215706.59519-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220319215706.59519-3-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Wolfram,

I love your patch! Perhaps something to improve:

[auto build test WARNING on geert-renesas-drivers/renesas-pinctrl]
[also build test WARNING on linusw-pinctrl/devel v5.17-rc8 next-20220318]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Wolfram-Sang/pinctrl-renesas-r8a77990-add-drive-strength/20220320-055908
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
config: hexagon-randconfig-r041-20220320 (https://download.01.org/0day-ci/archive/20220320/202203200832.RD8XJhU1-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 217f267efe3082438e698e2f08566b9df8c530fa)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/844a743267be6ab69209101129c05dcb9dfd7c19
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Wolfram-Sang/pinctrl-renesas-r8a77990-add-drive-strength/20220320-055908
        git checkout 844a743267be6ab69209101129c05dcb9dfd7c19
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/pinctrl/renesas/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/renesas/pfc-r8a77990.c:5033:38: warning: unused variable 'pinmux_drive_regs' [-Wunused-const-variable]
   static const struct pinmux_drive_reg pinmux_drive_regs[] = {
                                        ^
   1 warning generated.


vim +/pinmux_drive_regs +5033 drivers/pinctrl/renesas/pfc-r8a77990.c

  5032	
> 5033	static const struct pinmux_drive_reg pinmux_drive_regs[] = {
  5034		{ PINMUX_DRIVE_REG("DRVCTRL8", 0xe6060320) {
  5035			{ RCAR_GP_PIN(3,  0), 18, 2 },	/* SD0_CLK */
  5036			{ RCAR_GP_PIN(3,  1), 15, 2 },	/* SD0_CMD */
  5037			{ RCAR_GP_PIN(3,  2), 12, 2 },	/* SD0_DAT0 */
  5038			{ RCAR_GP_PIN(3,  3),  9, 2 },	/* SD0_DAT1 */
  5039			{ RCAR_GP_PIN(3,  4),  6, 2 },	/* SD0_DAT2 */
  5040			{ RCAR_GP_PIN(3,  5),  3, 2 },	/* SD0_DAT3 */
  5041			{ RCAR_GP_PIN(3,  6),  0, 2 },	/* SD1_CLK */
  5042		} },
  5043		{ PINMUX_DRIVE_REG("DRVCTRL9", 0xe6060324) {
  5044			{ RCAR_GP_PIN(3,  7), 29, 2 },	/* SD1_CMD */
  5045			{ RCAR_GP_PIN(3,  8), 26, 2 },	/* SD1_DAT0 */
  5046			{ RCAR_GP_PIN(3,  9), 23, 2 },	/* SD1_DAT1 */
  5047			{ RCAR_GP_PIN(3, 10), 20, 2 },	/* SD1_DAT2 */
  5048			{ RCAR_GP_PIN(3, 11), 17, 2 },	/* SD1_DAT3 */
  5049			{ RCAR_GP_PIN(4,  0), 14, 2 },	/* SD3_CLK */
  5050			{ RCAR_GP_PIN(4,  1), 11, 2 },	/* SD3_CMD */
  5051			{ RCAR_GP_PIN(4,  2),  8, 2 },	/* SD3_DAT0 */
  5052			{ RCAR_GP_PIN(4,  3),  5, 2 },	/* SD3_DAT1 */
  5053			{ RCAR_GP_PIN(4,  4),  2, 2 },	/* SD3_DAT2 */
  5054		} },
  5055		{ PINMUX_DRIVE_REG("DRVCTRL10", 0xe6060328) {
  5056			{ RCAR_GP_PIN(4,  5), 29, 2 },	/* SD3_DAT3 */
  5057			{ RCAR_GP_PIN(4,  6), 26, 2 },	/* SD3_DAT4 */
  5058			{ RCAR_GP_PIN(4,  7), 23, 2 },	/* SD3_DAT5 */
  5059			{ RCAR_GP_PIN(4,  8), 20, 2 },	/* SD3_DAT6 */
  5060			{ RCAR_GP_PIN(4,  9), 17, 2 },	/* SD3_DAT7 */
  5061			{ RCAR_GP_PIN(4, 10), 14, 2 },	/* SD3_DS */
  5062		} },
  5063		{ },
  5064	};
  5065	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
