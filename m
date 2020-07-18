Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81DA5224E43
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Jul 2020 01:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgGRXd3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 18 Jul 2020 19:33:29 -0400
Received: from mga02.intel.com ([134.134.136.20]:2383 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726209AbgGRXd2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 18 Jul 2020 19:33:28 -0400
IronPort-SDR: kriDoQrOg0Q9JWhkKqE5IvyEbRDEMeUqHdn5TJ5GsrvrfyvfW/JRRQzJ+1oLU42Q8EcbEtqJHV
 3EFzDsrnC+Vw==
X-IronPort-AV: E=McAfee;i="6000,8403,9686"; a="137879767"
X-IronPort-AV: E=Sophos;i="5.75,368,1589266800"; 
   d="gz'50?scan'50,208,50";a="137879767"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2020 16:33:14 -0700
IronPort-SDR: JG1LZE4aRctdvBt+nQMaxWnNrEBiKovtZ5D8F6PcYJI5/43AUgJCTqaaL2CGGDndjBGr/blnDI
 vSZiJdx+KTmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,368,1589266800"; 
   d="gz'50?scan'50,208,50";a="300925079"
Received: from lkp-server02.sh.intel.com (HELO 50058c6ee6fc) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 18 Jul 2020 16:33:10 -0700
Received: from kbuild by 50058c6ee6fc with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jwwKM-0000yh-A5; Sat, 18 Jul 2020 23:33:10 +0000
Date:   Sun, 19 Jul 2020 07:32:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jianqun Xu <jay.xu@rock-chips.com>, heiko@sntech.de,
        linus.walleij@linaro.org
Cc:     kbuild-all@lists.01.org, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        kever.yang@rock-chips.com, david.wu@rock-chips.com,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: Re: [PATCH 03/13] pinctrl: rockchip: make driver be tristate module
Message-ID: <202007190734.wCFMYYXn%lkp@intel.com>
References: <20200717032411.17654-4-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200717032411.17654-4-jay.xu@rock-chips.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Jianqun,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on pinctrl/devel v5.8-rc5 next-20200717]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jianqun-Xu/pinctrl-rockchip-prepare-work-for-split-driver/20200717-112906
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
config: alpha-randconfig-r014-20200719 (attached as .config)
compiler: alpha-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=alpha 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/pinctrl/pinctrl-rockchip.c: In function 'rockchip_pinctrl_parse_groups':
>> drivers/pinctrl/pinctrl-rockchip.c:2879:9: error: implicit declaration of function 'pinconf_generic_parse_dt_config'; did you mean 'pinconf_generic_dump_config'? [-Werror=implicit-function-declaration]
    2879 |   ret = pinconf_generic_parse_dt_config(np_config, NULL,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         pinconf_generic_dump_config
   drivers/pinctrl/pinctrl-rockchip.c: In function 'rockchip_gpiolib_register':
>> drivers/pinctrl/pinctrl-rockchip.c:3471:5: error: 'struct gpio_chip' has no member named 'of_node'
    3471 |   gc->of_node = bank->of_node;
         |     ^~
   drivers/pinctrl/pinctrl-rockchip.c: In function 'rockchip_pinctrl_get_soc_data':
   drivers/pinctrl/pinctrl-rockchip.c:3575:8: warning: duplicate 'const' declaration specifier [-Wduplicate-decl-specifier]
    3575 |  const const struct rockchip_pin_ctrl *ctrl;
         |        ^~~~~
   drivers/pinctrl/pinctrl-rockchip.c: In function 'rockchip_pinctrl_probe':
   drivers/pinctrl/pinctrl-rockchip.c:3753:8: warning: duplicate 'const' declaration specifier [-Wduplicate-decl-specifier]
    3753 |  const const struct rockchip_pin_ctrl *ctrl;
         |        ^~~~~
   At top level:
   drivers/pinctrl/pinctrl-rockchip.c:2802:34: warning: 'rockchip_bank_match' defined but not used [-Wunused-const-variable=]
    2802 | static const struct of_device_id rockchip_bank_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +2879 drivers/pinctrl/pinctrl-rockchip.c

d3e5116119bd02 Heiko Stübner   2013-06-10  2821  
d3e5116119bd02 Heiko Stübner   2013-06-10  2822  static int rockchip_pinctrl_parse_groups(struct device_node *np,
d3e5116119bd02 Heiko Stübner   2013-06-10  2823  					      struct rockchip_pin_group *grp,
d3e5116119bd02 Heiko Stübner   2013-06-10  2824  					      struct rockchip_pinctrl *info,
d3e5116119bd02 Heiko Stübner   2013-06-10  2825  					      u32 index)
d3e5116119bd02 Heiko Stübner   2013-06-10  2826  {
d3e5116119bd02 Heiko Stübner   2013-06-10  2827  	struct rockchip_pin_bank *bank;
d3e5116119bd02 Heiko Stübner   2013-06-10  2828  	int size;
d3e5116119bd02 Heiko Stübner   2013-06-10  2829  	const __be32 *list;
d3e5116119bd02 Heiko Stübner   2013-06-10  2830  	int num;
d3e5116119bd02 Heiko Stübner   2013-06-10  2831  	int i, j;
d3e5116119bd02 Heiko Stübner   2013-06-10  2832  	int ret;
d3e5116119bd02 Heiko Stübner   2013-06-10  2833  
94f4e54cecaf3e Rob Herring     2018-08-27  2834  	dev_dbg(info->dev, "group(%d): %pOFn\n", index, np);
d3e5116119bd02 Heiko Stübner   2013-06-10  2835  
d3e5116119bd02 Heiko Stübner   2013-06-10  2836  	/* Initialise group */
d3e5116119bd02 Heiko Stübner   2013-06-10  2837  	grp->name = np->name;
d3e5116119bd02 Heiko Stübner   2013-06-10  2838  
d3e5116119bd02 Heiko Stübner   2013-06-10  2839  	/*
d3e5116119bd02 Heiko Stübner   2013-06-10  2840  	 * the binding format is rockchip,pins = <bank pin mux CONFIG>,
d3e5116119bd02 Heiko Stübner   2013-06-10  2841  	 * do sanity check and calculate pins number
d3e5116119bd02 Heiko Stübner   2013-06-10  2842  	 */
d3e5116119bd02 Heiko Stübner   2013-06-10  2843  	list = of_get_property(np, "rockchip,pins", &size);
d3e5116119bd02 Heiko Stübner   2013-06-10  2844  	/* we do not check return since it's safe node passed down */
d3e5116119bd02 Heiko Stübner   2013-06-10  2845  	size /= sizeof(*list);
d3e5116119bd02 Heiko Stübner   2013-06-10  2846  	if (!size || size % 4) {
d3e5116119bd02 Heiko Stübner   2013-06-10  2847  		dev_err(info->dev, "wrong pins number or pins and configs should be by 4\n");
d3e5116119bd02 Heiko Stübner   2013-06-10  2848  		return -EINVAL;
d3e5116119bd02 Heiko Stübner   2013-06-10  2849  	}
d3e5116119bd02 Heiko Stübner   2013-06-10  2850  
d3e5116119bd02 Heiko Stübner   2013-06-10  2851  	grp->npins = size / 4;
d3e5116119bd02 Heiko Stübner   2013-06-10  2852  
a86854d0c599b3 Kees Cook       2018-06-12  2853  	grp->pins = devm_kcalloc(info->dev, grp->npins, sizeof(unsigned int),
d3e5116119bd02 Heiko Stübner   2013-06-10  2854  						GFP_KERNEL);
a86854d0c599b3 Kees Cook       2018-06-12  2855  	grp->data = devm_kcalloc(info->dev,
a86854d0c599b3 Kees Cook       2018-06-12  2856  					grp->npins,
d3e5116119bd02 Heiko Stübner   2013-06-10  2857  					sizeof(struct rockchip_pin_config),
d3e5116119bd02 Heiko Stübner   2013-06-10  2858  					GFP_KERNEL);
d3e5116119bd02 Heiko Stübner   2013-06-10  2859  	if (!grp->pins || !grp->data)
d3e5116119bd02 Heiko Stübner   2013-06-10  2860  		return -ENOMEM;
d3e5116119bd02 Heiko Stübner   2013-06-10  2861  
d3e5116119bd02 Heiko Stübner   2013-06-10  2862  	for (i = 0, j = 0; i < size; i += 4, j++) {
d3e5116119bd02 Heiko Stübner   2013-06-10  2863  		const __be32 *phandle;
d3e5116119bd02 Heiko Stübner   2013-06-10  2864  		struct device_node *np_config;
d3e5116119bd02 Heiko Stübner   2013-06-10  2865  
d3e5116119bd02 Heiko Stübner   2013-06-10  2866  		num = be32_to_cpu(*list++);
d3e5116119bd02 Heiko Stübner   2013-06-10  2867  		bank = bank_num_to_bank(info, num);
d3e5116119bd02 Heiko Stübner   2013-06-10  2868  		if (IS_ERR(bank))
d3e5116119bd02 Heiko Stübner   2013-06-10  2869  			return PTR_ERR(bank);
d3e5116119bd02 Heiko Stübner   2013-06-10  2870  
d3e5116119bd02 Heiko Stübner   2013-06-10  2871  		grp->pins[j] = bank->pin_base + be32_to_cpu(*list++);
d3e5116119bd02 Heiko Stübner   2013-06-10  2872  		grp->data[j].func = be32_to_cpu(*list++);
d3e5116119bd02 Heiko Stübner   2013-06-10  2873  
d3e5116119bd02 Heiko Stübner   2013-06-10  2874  		phandle = list++;
d3e5116119bd02 Heiko Stübner   2013-06-10  2875  		if (!phandle)
d3e5116119bd02 Heiko Stübner   2013-06-10  2876  			return -EINVAL;
d3e5116119bd02 Heiko Stübner   2013-06-10  2877  
d3e5116119bd02 Heiko Stübner   2013-06-10  2878  		np_config = of_find_node_by_phandle(be32_to_cpup(phandle));
dd4d01f7bad886 Soren Brinkmann 2015-01-09 @2879  		ret = pinconf_generic_parse_dt_config(np_config, NULL,
d3e5116119bd02 Heiko Stübner   2013-06-10  2880  				&grp->data[j].configs, &grp->data[j].nconfigs);
d3e5116119bd02 Heiko Stübner   2013-06-10  2881  		if (ret)
d3e5116119bd02 Heiko Stübner   2013-06-10  2882  			return ret;
d3e5116119bd02 Heiko Stübner   2013-06-10  2883  	}
d3e5116119bd02 Heiko Stübner   2013-06-10  2884  
d3e5116119bd02 Heiko Stübner   2013-06-10  2885  	return 0;
d3e5116119bd02 Heiko Stübner   2013-06-10  2886  }
d3e5116119bd02 Heiko Stübner   2013-06-10  2887  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--5mCyUwZo2JvN/JJP
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--5mCyUwZo2JvN/JJP--
