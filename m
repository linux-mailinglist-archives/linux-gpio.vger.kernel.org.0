Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0C4325EB1D
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Sep 2020 23:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728688AbgIEVvp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Sat, 5 Sep 2020 17:51:45 -0400
Received: from gloria.sntech.de ([185.11.138.130]:33676 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728103AbgIEVvo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 5 Sep 2020 17:51:44 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kEg5x-0005Z1-8P; Sat, 05 Sep 2020 23:51:37 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Jianqun Xu <jay.xu@rock-chips.com>, linus.walleij@linaro.org,
        kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: Re: [PATCH 1/6] pinctrl: rockchip: make driver be tristate module
Date:   Sat, 05 Sep 2020 23:51:36 +0200
Message-ID: <2350331.06pZ62Lms5@diego>
In-Reply-To: <202009011812.LO6Db3sN%lkp@intel.com>
References: <20200831084753.7115-2-jay.xu@rock-chips.com> <202009011812.LO6Db3sN%lkp@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Am Dienstag, 1. September 2020, 12:13:16 CEST schrieb kernel test robot:
> Hi Jianqun,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on rockchip/for-next]
> [also build test ERROR on pinctrl/devel v5.9-rc3 next-20200828]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Jianqun-Xu/rockchip-pinctrl-fixes-for-GKI/20200831-165040
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
> config: x86_64-randconfig-m031-20200901 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> reproduce (this is a W=1 build):
>         # save the attached .config to linux build tree
>         make W=1 ARCH=x86_64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/pinctrl/pinctrl-rockchip.c: In function 'rockchip_pinctrl_parse_groups':
> >> drivers/pinctrl/pinctrl-rockchip.c:2881:9: error: implicit declaration of function 'pinconf_generic_parse_dt_config'; did you mean 'pinconf_generic_dump_config'? [-Werror=implicit-function-declaration]
>     2881 |   ret = pinconf_generic_parse_dt_config(np_config, NULL,
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          |         pinconf_generic_dump_config
>    drivers/pinctrl/pinctrl-rockchip.c: In function 'rockchip_gpiolib_register':
> >> drivers/pinctrl/pinctrl-rockchip.c:3473:5: error: 'struct gpio_chip' has no member named 'of_node'
>     3473 |   gc->of_node = bank->of_node;
>          |     ^~
>    At top level:
>    drivers/pinctrl/pinctrl-rockchip.c:2804:34: warning: 'rockchip_bank_match' defined but not used [-Wunused-const-variable=]
>     2804 | static const struct of_device_id rockchip_bank_match[] = {
>          |                                  ^~~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors

these errors are unrelated to this patch, and I addressed them in
[PATCH] pinctrl: rockchip: depend on OF [0]

Heiko

[0] http://lore.kernel.org/r/20200905214955.907950-1-heiko@sntech.de


> 
> # https://github.com/0day-ci/linux/commit/38fa905767d010bbbc1035b48494d4a83bb72410
> git remote add linux-review https://github.com/0day-ci/linux
> git fetch --no-tags linux-review Jianqun-Xu/rockchip-pinctrl-fixes-for-GKI/20200831-165040
> git checkout 38fa905767d010bbbc1035b48494d4a83bb72410
> vim +2881 drivers/pinctrl/pinctrl-rockchip.c
> 
> d3e5116119bd02 Heiko Stübner   2013-06-10  2823  
> d3e5116119bd02 Heiko Stübner   2013-06-10  2824  static int rockchip_pinctrl_parse_groups(struct device_node *np,
> d3e5116119bd02 Heiko Stübner   2013-06-10  2825  					      struct rockchip_pin_group *grp,
> d3e5116119bd02 Heiko Stübner   2013-06-10  2826  					      struct rockchip_pinctrl *info,
> d3e5116119bd02 Heiko Stübner   2013-06-10  2827  					      u32 index)
> d3e5116119bd02 Heiko Stübner   2013-06-10  2828  {
> d3e5116119bd02 Heiko Stübner   2013-06-10  2829  	struct rockchip_pin_bank *bank;
> d3e5116119bd02 Heiko Stübner   2013-06-10  2830  	int size;
> d3e5116119bd02 Heiko Stübner   2013-06-10  2831  	const __be32 *list;
> d3e5116119bd02 Heiko Stübner   2013-06-10  2832  	int num;
> d3e5116119bd02 Heiko Stübner   2013-06-10  2833  	int i, j;
> d3e5116119bd02 Heiko Stübner   2013-06-10  2834  	int ret;
> d3e5116119bd02 Heiko Stübner   2013-06-10  2835  
> 94f4e54cecaf3e Rob Herring     2018-08-27  2836  	dev_dbg(info->dev, "group(%d): %pOFn\n", index, np);
> d3e5116119bd02 Heiko Stübner   2013-06-10  2837  
> d3e5116119bd02 Heiko Stübner   2013-06-10  2838  	/* Initialise group */
> d3e5116119bd02 Heiko Stübner   2013-06-10  2839  	grp->name = np->name;
> d3e5116119bd02 Heiko Stübner   2013-06-10  2840  
> d3e5116119bd02 Heiko Stübner   2013-06-10  2841  	/*
> d3e5116119bd02 Heiko Stübner   2013-06-10  2842  	 * the binding format is rockchip,pins = <bank pin mux CONFIG>,
> d3e5116119bd02 Heiko Stübner   2013-06-10  2843  	 * do sanity check and calculate pins number
> d3e5116119bd02 Heiko Stübner   2013-06-10  2844  	 */
> d3e5116119bd02 Heiko Stübner   2013-06-10  2845  	list = of_get_property(np, "rockchip,pins", &size);
> d3e5116119bd02 Heiko Stübner   2013-06-10  2846  	/* we do not check return since it's safe node passed down */
> d3e5116119bd02 Heiko Stübner   2013-06-10  2847  	size /= sizeof(*list);
> d3e5116119bd02 Heiko Stübner   2013-06-10  2848  	if (!size || size % 4) {
> d3e5116119bd02 Heiko Stübner   2013-06-10  2849  		dev_err(info->dev, "wrong pins number or pins and configs should be by 4\n");
> d3e5116119bd02 Heiko Stübner   2013-06-10  2850  		return -EINVAL;
> d3e5116119bd02 Heiko Stübner   2013-06-10  2851  	}
> d3e5116119bd02 Heiko Stübner   2013-06-10  2852  
> d3e5116119bd02 Heiko Stübner   2013-06-10  2853  	grp->npins = size / 4;
> d3e5116119bd02 Heiko Stübner   2013-06-10  2854  
> a86854d0c599b3 Kees Cook       2018-06-12  2855  	grp->pins = devm_kcalloc(info->dev, grp->npins, sizeof(unsigned int),
> d3e5116119bd02 Heiko Stübner   2013-06-10  2856  						GFP_KERNEL);
> a86854d0c599b3 Kees Cook       2018-06-12  2857  	grp->data = devm_kcalloc(info->dev,
> a86854d0c599b3 Kees Cook       2018-06-12  2858  					grp->npins,
> d3e5116119bd02 Heiko Stübner   2013-06-10  2859  					sizeof(struct rockchip_pin_config),
> d3e5116119bd02 Heiko Stübner   2013-06-10  2860  					GFP_KERNEL);
> d3e5116119bd02 Heiko Stübner   2013-06-10  2861  	if (!grp->pins || !grp->data)
> d3e5116119bd02 Heiko Stübner   2013-06-10  2862  		return -ENOMEM;
> d3e5116119bd02 Heiko Stübner   2013-06-10  2863  
> d3e5116119bd02 Heiko Stübner   2013-06-10  2864  	for (i = 0, j = 0; i < size; i += 4, j++) {
> d3e5116119bd02 Heiko Stübner   2013-06-10  2865  		const __be32 *phandle;
> d3e5116119bd02 Heiko Stübner   2013-06-10  2866  		struct device_node *np_config;
> d3e5116119bd02 Heiko Stübner   2013-06-10  2867  
> d3e5116119bd02 Heiko Stübner   2013-06-10  2868  		num = be32_to_cpu(*list++);
> d3e5116119bd02 Heiko Stübner   2013-06-10  2869  		bank = bank_num_to_bank(info, num);
> d3e5116119bd02 Heiko Stübner   2013-06-10  2870  		if (IS_ERR(bank))
> d3e5116119bd02 Heiko Stübner   2013-06-10  2871  			return PTR_ERR(bank);
> d3e5116119bd02 Heiko Stübner   2013-06-10  2872  
> d3e5116119bd02 Heiko Stübner   2013-06-10  2873  		grp->pins[j] = bank->pin_base + be32_to_cpu(*list++);
> d3e5116119bd02 Heiko Stübner   2013-06-10  2874  		grp->data[j].func = be32_to_cpu(*list++);
> d3e5116119bd02 Heiko Stübner   2013-06-10  2875  
> d3e5116119bd02 Heiko Stübner   2013-06-10  2876  		phandle = list++;
> d3e5116119bd02 Heiko Stübner   2013-06-10  2877  		if (!phandle)
> d3e5116119bd02 Heiko Stübner   2013-06-10  2878  			return -EINVAL;
> d3e5116119bd02 Heiko Stübner   2013-06-10  2879  
> d3e5116119bd02 Heiko Stübner   2013-06-10  2880  		np_config = of_find_node_by_phandle(be32_to_cpup(phandle));
> dd4d01f7bad886 Soren Brinkmann 2015-01-09 @2881  		ret = pinconf_generic_parse_dt_config(np_config, NULL,
> d3e5116119bd02 Heiko Stübner   2013-06-10  2882  				&grp->data[j].configs, &grp->data[j].nconfigs);
> d3e5116119bd02 Heiko Stübner   2013-06-10  2883  		if (ret)
> d3e5116119bd02 Heiko Stübner   2013-06-10  2884  			return ret;
> d3e5116119bd02 Heiko Stübner   2013-06-10  2885  	}
> d3e5116119bd02 Heiko Stübner   2013-06-10  2886  
> d3e5116119bd02 Heiko Stübner   2013-06-10  2887  	return 0;
> d3e5116119bd02 Heiko Stübner   2013-06-10  2888  }
> d3e5116119bd02 Heiko Stübner   2013-06-10  2889  
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 




