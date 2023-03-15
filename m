Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C86D6BB165
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Mar 2023 13:27:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232360AbjCOM1F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Mar 2023 08:27:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232356AbjCOM0r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2023 08:26:47 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DACF574A5D;
        Wed, 15 Mar 2023 05:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678883153; x=1710419153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sqa5ETRPA8mWWtxvPChxrgVub4MEZRvt0xOoJBar2EI=;
  b=KRwbziyEAfpz2/ctQFmbnsQ4Hp3DgwGMTPzo9uZmIF3aiBg5nk0b4Byr
   7a53MCYO4KsPS2NTI9MBscdPGCc8kEtEOKcvipiRjtxZ4ComWn+Gqan8T
   2PYkCr+c7WMJAolO7+A0XuPUVC67wPnlL9p0g4Ss+iOnpBMUoXZC7RfV4
   6hEqOXtmltIy9xG/7wi9Hxjh5BMj8dobmD7NbwscpZun6x59r9UOV5lXS
   V1BEzyxLH4dw+hfQqvaudZCLnvL5fueuiurl/1JRkuxv1IDds/IVRALNm
   ogBBQZVifXvwWIJww3kl3SJLJrVT6d6BGfvQYDcWjSOhxLmvjNmSYQINu
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="335171849"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="335171849"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 05:23:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="768464686"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="768464686"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Mar 2023 05:23:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pcQAT-0007f8-0r;
        Wed, 15 Mar 2023 12:23:45 +0000
Date:   Wed, 15 Mar 2023 20:23:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sean Anderson <sean.anderson@seco.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-phy@lists.infradead.org
Cc:     oe-kbuild-all@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        Madalin Bucur <madalin.bucur@nxp.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        linuxppc-dev@lists.ozlabs.org,
        Sean Anderson <sean.anderson@seco.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?iso-8859-1?Q?Fern=E1ndez?= Rojas <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v11 03/13] dt-bindings: Convert gpio-mmio to yaml
Message-ID: <202303152008.kxRjSW73-lkp@intel.com>
References: <20230313161138.3598068-4-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313161138.3598068-4-sean.anderson@seco.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Sean,

I love your patch! Perhaps something to improve:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on brgl/gpio/for-next clk/clk-next linus/master v6.3-rc2 next-20230315]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/dt-bindings-phy-Add-2500BASE-X-and-10GBASE-R/20230314-001522
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20230313161138.3598068-4-sean.anderson%40seco.com
patch subject: [PATCH v11 03/13] dt-bindings: Convert gpio-mmio to yaml
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/2d1e86be168e32ea3d3f11325881f7cb1e5492f8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sean-Anderson/dt-bindings-phy-Add-2500BASE-X-and-10GBASE-R/20230314-001522
        git checkout 2d1e86be168e32ea3d3f11325881f7cb1e5492f8
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303152008.kxRjSW73-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml references a file that doesn't exist: Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
>> Warning: Documentation/devicetree/bindings/mfd/brcm,bcm63268-gpio-sysctl.yaml references a file that doesn't exist: Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
>> Warning: Documentation/devicetree/bindings/mfd/brcm,bcm6328-gpio-sysctl.yaml references a file that doesn't exist: Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
>> Warning: Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml references a file that doesn't exist: Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
>> Warning: Documentation/devicetree/bindings/mfd/brcm,bcm6362-gpio-sysctl.yaml references a file that doesn't exist: Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
>> Warning: Documentation/devicetree/bindings/mfd/brcm,bcm6368-gpio-sysctl.yaml references a file that doesn't exist: Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
