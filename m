Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CDE65ACE2D
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 10:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231656AbiIEIof (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 04:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237012AbiIEIoe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 04:44:34 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 297EE6569
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 01:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662367473; x=1693903473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BH3oiLjqkW0jU2XePtcePb2GTCSxy3WkbyaN5LS29Uw=;
  b=B1GKq2md3tzx53EcICQKK0KG4T+UUgl+VGR0IFaBqI3CE7TD+kZujtyE
   VXBB1qpQMCjRZHm1j47a1GOK1qJP19Ylt+bWiEc8V+WL5MsbMC8nK0LOo
   6w5lKGC+OG/77AKCMjk/ffWCKdESeFdKK57kFlLkC0yrp7Ffgb0PuVv9X
   XhPvg6nlc+KfzfU+0gcRSRbUsezAXmBtDvHl/KVN65tsbTp+7Ku39xY12
   8WN+rJyuIj7/irWf/NgbHhKI/4+tG46U/2GZF3n7sbGAw6W9PPeMV9+dR
   EEWMsBAjj7mxI8UNdbnKd7MWT3q5NL4ksPR2w30Z+tl/urTxZG/7mkvMr
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="322509100"
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="322509100"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 01:44:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="942024930"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 05 Sep 2022 01:44:28 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oV7iV-0003zF-2R;
        Mon, 05 Sep 2022 08:44:27 +0000
Date:   Mon, 5 Sep 2022 16:43:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Francesco Dolcini <francesco.dolcini@toradex.com>
Cc:     Paul Gazzillo <paul@pgazz.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        kbuild-all@lists.01.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Fabio Estevam <festevam@gmail.com>
Subject: [linusw-pinctrl:devel 26/32] kismet: WARNING: unmet direct
 dependencies detected for PINCTRL_IMX when selected by PINCTRL_IMX8MM
Message-ID: <202209051658.U9ttAH6z-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   1074e1d23a5c201b6558878a09f1d2b7c9506835
commit: 87c2a29a6bf1a078d82427d42a2480a61814f8e3 [26/32] pinctrl: imx8m: kconfig: Depends on SOC_IMX8M
config: x86_64-kismet-CONFIG_PINCTRL_IMX-CONFIG_PINCTRL_IMX8MM-0-0 (https://download.01.org/0day-ci/archive/20220905/202209051658.U9ttAH6z-lkp@intel.com/config)
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/commit/?id=87c2a29a6bf1a078d82427d42a2480a61814f8e3
        git remote add linusw-pinctrl https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
        git fetch --no-tags linusw-pinctrl devel
        git checkout 87c2a29a6bf1a078d82427d42a2480a61814f8e3
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_PINCTRL_IMX --selectors CONFIG_PINCTRL_IMX8MM -a=x86_64
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=x86_64 olddefconfig

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PINCTRL_IMX when selected by PINCTRL_IMX8MM
   
   WARNING: unmet direct dependencies detected for PINCTRL_IMX
     Depends on [n]: PINCTRL [=y] && OF [=n]
     Selected by [y]:
     - PINCTRL_IMX8MM [=y] && PINCTRL [=y] && SOC_IMX8M [=y]
   
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
     Depends on [n]: PM_GENERIC_DOMAINS [=y] && OF [=n]
     Selected by [y]:
     - QCOM_RPMPD [=y] && PM [=y] && QCOM_SMD_RPM [=y]

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
