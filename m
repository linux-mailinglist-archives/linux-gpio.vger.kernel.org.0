Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1F4355F370
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 04:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbiF2Cmw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 22:42:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbiF2Cmw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 22:42:52 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43AE51FCC2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 19:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656470571; x=1688006571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yBJwPxOV/Z5pXj6LNzXeAszVLgZscqWYN5ocKbH08eU=;
  b=hfqE6Nnm33yWJvYpYUMcurlfNIhghvJdY07bvJh6929avzOWaoybru2C
   ETlDQHl4hmOpv/KMFsPawzDk/Hvh/NvOruP1LL2XTfn4nSDZ4oqE2cirm
   aj5mYKyUy+UlktD4BubfjVXAEjd5GKSAayh4PgffDw1Av3tPFSpAecjSQ
   6ZhVBcVRYeJtJwl8+CkgGdJm9FaQ4LYNOAh7WJrIkzHJraBg1Ov/KxHXe
   2BoQbwOC1cYNCtwcAWL6V0IyFqZ2uAk0QfCgAgbAIGZ9W1GDsIwCbYIZ0
   JomeY/ELSPaTLLgO9kV9ozmZw0/1LfmJqhCU/cNTwkllKMY6oookI6kIO
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="279448300"
X-IronPort-AV: E=Sophos;i="5.92,230,1650956400"; 
   d="scan'208";a="279448300"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 19:42:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,230,1650956400"; 
   d="scan'208";a="595047814"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 28 Jun 2022 19:42:45 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o6NfA-000AqI-L8;
        Wed, 29 Jun 2022 02:42:44 +0000
Date:   Wed, 29 Jun 2022 10:41:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [linusw-pinctrl:devel 10/32]
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:391:48: error: use of undeclared
 identifier 'np'
Message-ID: <202206291029.ESdnQ2Ja-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   c3f464542b7099692827f0094c00aa9a26a2acbc
commit: 36fe26843d6dde34b65c3273c63bb12fd036239d [10/32] pinctrl: qcom: sc7280: Add clock optional check for ADSP bypass targets
config: arm64-buildonly-randconfig-r003-20220627 (https://download.01.org/0day-ci/archive/20220629/202206291029.ESdnQ2Ja-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project df18167ac56d05f2ab55f9d874aee7ab6d5bc9a2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/commit/?id=36fe26843d6dde34b65c3273c63bb12fd036239d
        git remote add linusw-pinctrl https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
        git fetch --no-tags linusw-pinctrl devel
        git checkout 36fe26843d6dde34b65c3273c63bb12fd036239d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

Note: the linusw-pinctrl/devel HEAD c3f464542b7099692827f0094c00aa9a26a2acbc builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:391:48: error: use of undeclared identifier 'np'
           data->is_clk_optional = of_property_read_bool(np, "qcom,adsp-bypass-mode");
                                                         ^
   1 error generated.


vim +/np +391 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c

   370	
   371	int lpi_pinctrl_probe(struct platform_device *pdev)
   372	{
   373		const struct lpi_pinctrl_variant_data *data;
   374		struct device *dev = &pdev->dev;
   375		struct lpi_pinctrl *pctrl;
   376		int ret;
   377	
   378		pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
   379		if (!pctrl)
   380			return -ENOMEM;
   381	
   382		platform_set_drvdata(pdev, pctrl);
   383	
   384		data = of_device_get_match_data(dev);
   385		if (!data)
   386			return -EINVAL;
   387	
   388		pctrl->data = data;
   389		pctrl->dev = &pdev->dev;
   390	
 > 391		data->is_clk_optional = of_property_read_bool(np, "qcom,adsp-bypass-mode");
   392	
   393		pctrl->clks[0].id = "core";
   394		pctrl->clks[1].id = "audio";
   395	
   396		pctrl->tlmm_base = devm_platform_ioremap_resource(pdev, 0);
   397		if (IS_ERR(pctrl->tlmm_base))
   398			return dev_err_probe(dev, PTR_ERR(pctrl->tlmm_base),
   399					     "TLMM resource not provided\n");
   400	
   401		pctrl->slew_base = devm_platform_ioremap_resource(pdev, 1);
   402		if (IS_ERR(pctrl->slew_base))
   403			return dev_err_probe(dev, PTR_ERR(pctrl->slew_base),
   404					     "Slew resource not provided\n");
   405	
   406		if (data->is_clk_optional)
   407			ret = devm_clk_bulk_get_optional(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
   408		else
   409			ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
   410	
   411		if (ret)
   412			return ret;
   413	
   414		ret = clk_bulk_prepare_enable(MAX_LPI_NUM_CLKS, pctrl->clks);
   415		if (ret)
   416			return dev_err_probe(dev, ret, "Can't enable clocks\n");
   417	
   418		pctrl->desc.pctlops = &lpi_gpio_pinctrl_ops;
   419		pctrl->desc.pmxops = &lpi_gpio_pinmux_ops;
   420		pctrl->desc.confops = &lpi_gpio_pinconf_ops;
   421		pctrl->desc.owner = THIS_MODULE;
   422		pctrl->desc.name = dev_name(dev);
   423		pctrl->desc.pins = data->pins;
   424		pctrl->desc.npins = data->npins;
   425		pctrl->chip = lpi_gpio_template;
   426		pctrl->chip.parent = dev;
   427		pctrl->chip.base = -1;
   428		pctrl->chip.ngpio = data->npins;
   429		pctrl->chip.label = dev_name(dev);
   430		pctrl->chip.of_gpio_n_cells = 2;
   431		pctrl->chip.can_sleep = false;
   432	
   433		mutex_init(&pctrl->slew_access_lock);
   434	
   435		pctrl->ctrl = devm_pinctrl_register(dev, &pctrl->desc, pctrl);
   436		if (IS_ERR(pctrl->ctrl)) {
   437			ret = PTR_ERR(pctrl->ctrl);
   438			dev_err(dev, "failed to add pin controller\n");
   439			goto err_pinctrl;
   440		}
   441	
   442		ret = lpi_build_pin_desc_groups(pctrl);
   443		if (ret)
   444			goto err_pinctrl;
   445	
   446		ret = devm_gpiochip_add_data(dev, &pctrl->chip, pctrl);
   447		if (ret) {
   448			dev_err(pctrl->dev, "can't add gpio chip\n");
   449			goto err_pinctrl;
   450		}
   451	
   452		return 0;
   453	
   454	err_pinctrl:
   455		mutex_destroy(&pctrl->slew_access_lock);
   456		clk_bulk_disable_unprepare(MAX_LPI_NUM_CLKS, pctrl->clks);
   457	
   458		return ret;
   459	}
   460	EXPORT_SYMBOL_GPL(lpi_pinctrl_probe);
   461	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
