Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5FD59B34D
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Aug 2022 13:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbiHUL2u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Aug 2022 07:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbiHUL2s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Aug 2022 07:28:48 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FAD912AC0;
        Sun, 21 Aug 2022 04:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661081326; x=1692617326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u8NGtjuuiEpZJ6bFCLHHCXdVK31RObZeJr8v00tDkAg=;
  b=X5mjjY75HuCP5z2k7B6RQkp/zJfH55Zey5At/PcmKRSYEvDg+uYQxhan
   IdVavHFm4sy3YcEzVexxYPqFMArxooYKfz8OWVvqvxvxkeod7TzBYRwdP
   HLO7H/V4FaGEobQOrCmrKRteUF30CbQa9nlFvu0G3qzJ9LBXP2lyzajDg
   EdAlXpVurOeV6FHyT1wJHDOBYWBUdI8mB8IMg0E1LI9v3NmVdS/gMgPww
   DOa/REJv/LLQgQXNCklIdvC3Bgv+DZI3igzSHMAzorNdDIgO8biReKbZy
   GRPKoZpfExWHLop+7ukMXXPoiNhyYwSMIOXsjroPgMfxsffMt5ZWH3fFq
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10445"; a="273002755"
X-IronPort-AV: E=Sophos;i="5.93,252,1654585200"; 
   d="scan'208";a="273002755"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2022 04:28:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,252,1654585200"; 
   d="scan'208";a="936703556"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Aug 2022 04:28:44 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oPj8G-00040P-0B;
        Sun, 21 Aug 2022 11:28:44 +0000
Date:   Sun, 21 Aug 2022 19:28:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     kbuild-all@lists.01.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org
Subject: [brgl:gpio/for-current 1/2] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml
Message-ID: <202208211933.F50Nni98-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
head:   3f4e432fb9c6357b4b9bce1def67d61a215029eb
commit: 636c3982d296a560aabcc5e462c3a6408389ffd2 [1/2] MAINTAINERS: rectify entry for XILINX GPIO DRIVER
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit/?id=636c3982d296a560aabcc5e462c3a6408389ffd2
        git remote add brgl https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
        git fetch --no-tags brgl gpio/for-current
        git checkout 636c3982d296a560aabcc5e462c3a6408389ffd2
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
