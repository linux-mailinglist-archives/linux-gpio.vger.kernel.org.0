Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 825855AC804
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 00:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234931AbiIDWhv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Sep 2022 18:37:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231989AbiIDWhu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Sep 2022 18:37:50 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0700F27FEA
        for <linux-gpio@vger.kernel.org>; Sun,  4 Sep 2022 15:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662331070; x=1693867070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PsyzkRylhhm+gRayoJU5Go4C7P4FJRKMnpeg2cZGXq4=;
  b=idCYvWo/DPb9sIaxmgtupb1OCBVlf42RE00AecjpAa/MXt+dOUksrQZT
   n6QwJbfXAMIa1KB9/5VwqQdcn0xlqg8q36hWfGAqR20UcRFSRk2sazLEG
   yiEV3xYT0ZRKwpnuXZR7U/A+Exctcyi+whyLWTQ+4fqMaH25jjic0DlDA
   iNadIDZS/q9Nf7TQAkwGDocabqvsUTehWyoRCaeUVTT+iJucIgaW1KhYd
   CoX9AhLEGcxVmTPBGOwdsvYcLwF38F/hAK/RaYQRlGxc/PnjALaVvFDwM
   Y3f/bEJ4Fi93kfeTjf8UPHeZjofx8682/KuXG/Pm/WcTbyDIksb/WwXJ3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="279288917"
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="279288917"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2022 15:37:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="590701036"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 04 Sep 2022 15:37:48 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oUyFP-0003Rv-1x;
        Sun, 04 Sep 2022 22:37:47 +0000
Date:   Mon, 5 Sep 2022 06:37:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Shenwei Wang <shenwei.wang@nxp.com>
Cc:     kbuild-all@lists.01.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [brgl:gpio/for-next 8/12] drivers/gpio/gpio-imx-scu.c:106:32-33:
 WARNING: Use ARRAY_SIZE
Message-ID: <202209050648.jIBKO9lr-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   6ae8e1d0d5e5de922315830aea975c63e8c70b2f
commit: 0bd459ddf9e4f1af3ee3148eb319d1f8747f02ba [8/12] gpio: imx-scu: add imx-scu GPIO driver
config: openrisc-randconfig-c042-20220904 (https://download.01.org/0day-ci/archive/20220905/202209050648.jIBKO9lr-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

cocci warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-imx-scu.c:106:32-33: WARNING: Use ARRAY_SIZE

vim +106 drivers/gpio/gpio-imx-scu.c

    84	
    85	static int imx_scu_gpio_probe(struct platform_device *pdev)
    86	{
    87		struct device *dev = &pdev->dev;
    88		struct scu_gpio_priv *priv;
    89		struct gpio_chip *gc;
    90		int ret;
    91	
    92		priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
    93		if (!priv)
    94			return -ENOMEM;
    95	
    96		ret = imx_scu_get_handle(&priv->handle);
    97		if (ret)
    98			return ret;
    99	
   100		priv->dev = dev;
   101		mutex_init(&priv->lock);
   102	
   103		gc = &priv->chip;
   104		gc->base = -1;
   105		gc->parent = dev;
 > 106		gc->ngpio = sizeof(scu_rsrc_arr)/sizeof(unsigned int);
   107		gc->label = dev_name(dev);
   108		gc->get = imx_scu_gpio_get;
   109		gc->set = imx_scu_gpio_set;
   110		gc->get_direction = imx_scu_gpio_get_direction;
   111	
   112		platform_set_drvdata(pdev, priv);
   113	
   114		return devm_gpiochip_add_data(dev, gc, priv);
   115	}
   116	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
