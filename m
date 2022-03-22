Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C51BD4E3F37
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Mar 2022 14:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234291AbiCVNPS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Mar 2022 09:15:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232654AbiCVNPR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2022 09:15:17 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 272757646
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 06:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647954830; x=1679490830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VPWC4oABIQ4t3RxfHSkbr/M1Zm78XLd816Yer36MHEw=;
  b=MVwjRkahS69B46nEFxBIVB/+Bb0OTsMKqtnH6YsQB51fNRyXgyioC4Yh
   hVbqod+2mSVcOoL2FKWxu50YviJkNj+iqMSTivFZAokDX++Z5EjxjD2fy
   B0nkaMsuPzYeRT0cFDyWjNDTujVdRkgnXp/0er0Z6QEo+vHL7Z4VGvZv6
   QVEQLAAqpm/93U3mzvRy6cPlEu9EXdAGRQD7Ff68yi/FyHkZRIooCrCG2
   seJE702dUITtcLPWYTiJlfjcHH67vXrCuk5qW+Bi91Gy+GvCOfcibvjn7
   wxd/M8FImVW+nZGpoc6RV2w31OSndN52RyWPo4fATZf7UotqK2YRMTi1w
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="257530348"
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; 
   d="scan'208";a="257530348"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2022 06:13:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; 
   d="scan'208";a="648981102"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 22 Mar 2022 06:13:48 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nWeKZ-000Ipq-Lw; Tue, 22 Mar 2022 13:13:47 +0000
Date:   Tue, 22 Mar 2022 21:13:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     kbuild-all@lists.01.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Chen-Yu Tsai <wenst@chromium.org>
Subject: [linusw-pinctrl:for-next 76/78]
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c:171:2-3: Unneeded semicolon
Message-ID: <202203222145.UcCrXHfm-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
head:   4d3a82e4ec28e7956db55487eeb480407a002c37
commit: 156f721704b5c9e8fae02270f606f09d710ff27e [76/78] pinctrl: mediatek: common-v1: Commonize spec_ies_smt_set callback
config: openrisc-randconfig-c023-20220320 (https://download.01.org/0day-ci/archive/20220322/202203222145.UcCrXHfm-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cocci warnings: (new ones prefixed by >>)
>> drivers/pinctrl/mediatek/pinctrl-mtk-common.c:171:2-3: Unneeded semicolon

Please review and possibly fold the followup patch.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
