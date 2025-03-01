Return-Path: <linux-gpio+bounces-16871-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA356A4AE1C
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Mar 2025 23:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42FD31890975
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Mar 2025 22:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D3D1E834B;
	Sat,  1 Mar 2025 22:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hma9DBHL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5042B2DA;
	Sat,  1 Mar 2025 22:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740866958; cv=none; b=he6OH4YecrNQoXAtdmOVXhG3rb4HAtDprN5Xj9qx2nPc191dnxev14DAPW3R2bS4uxio1GaBvSV20r7gRn4ma64aEfC50VYCz+GIY6F2jJfpfCYtUxial+KsKZPzBXmG3inF2DYIn1OlnI8NY5NL4yzaG4zV4sc+7SuUohAirIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740866958; c=relaxed/simple;
	bh=uHtN/VWPtcnOkEo25Y7vtTV3AjhF+AbqcDWtH/62Pyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQvaQBywhlXGIgNhGb6TvwuliWOqbQYUxyBCqFOclm3drLnb86Yo3+1apXjGe2aOVTbZbBnGeZz6ep/J7V5CJgT2HL2FPbu3sMrVgue0hoO5sBYX5oxTU6y2dZs3nZbhXjsU9IlLsO4b1O9tg7POl6fdt7svnmZiLzZPJoruoxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hma9DBHL; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740866956; x=1772402956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uHtN/VWPtcnOkEo25Y7vtTV3AjhF+AbqcDWtH/62Pyc=;
  b=Hma9DBHL2gHR01zanHENH9r4wuo6ke49pYw15ToBOhPtuYX8IxwMprc4
   oto9zn2kyhHXqt7he4s52qzjYvHPcFYk6sIl1JdvHucJZOwRtQUPe6KPO
   YpXpLZkKSnj0olaIN6Bpqcsq4NH27JPR7+ysOiVdpPVQ5ABPBORnrXF+v
   lVR/gl8ROGd06r7JyO1qmiBIM13YT4XjYwVJXLhIyBe37Dz98Qqxuyt80
   dADrEHHUcvx06bDAOUcLyqjCHTmh8+1GwqtLFVgnqI4rIWRZs9TZ+euT3
   hlBLFBrUGvqKO+U2M0eY8bQ+eCcIGlQJky1UhbtPBNjFHx0Ze4Gl+gRdv
   Q==;
X-CSE-ConnectionGUID: pCpEc7r2Q9+/i2SvemWH4g==
X-CSE-MsgGUID: uZzoarOHTLqyI4MwiDrXJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="59185852"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="59185852"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 14:09:16 -0800
X-CSE-ConnectionGUID: joFekOF/Tw+4gQQOZiONUA==
X-CSE-MsgGUID: /My03QWvQ/eg9mZBHYEqZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="154820830"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 01 Mar 2025 14:09:14 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toV1E-000GlW-10;
	Sat, 01 Mar 2025 22:09:12 +0000
Date: Sun, 2 Mar 2025 06:08:54 +0800
From: kernel test robot <lkp@intel.com>
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, linus.walleij@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, benjamin.chan@amd.com,
	Pratap Nirujogi <pratap.nirujogi@amd.com>
Subject: Re: [PATCH] pinctrl: amd: isp411: Add amdisp GPIO pinctrl
Message-ID: <202503020508.tSquVmjP-lkp@intel.com>
References: <20250228165749.3476210-1-pratap.nirujogi@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228165749.3476210-1-pratap.nirujogi@amd.com>

Hi Pratap,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pratap-Nirujogi/pinctrl-amd-isp411-Add-amdisp-GPIO-pinctrl/20250301-011050
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20250228165749.3476210-1-pratap.nirujogi%40amd.com
patch subject: [PATCH] pinctrl: amd: isp411: Add amdisp GPIO pinctrl
config: arc-randconfig-002-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020508.tSquVmjP-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020508.tSquVmjP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020508.tSquVmjP-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/pinctrl/pinctrl-amdisp.c: In function 'amdisp_gpiochip_add':
>> drivers/pinctrl/pinctrl-amdisp.c:196:13: error: 'struct gpio_chip' has no member named 'of_node'; did you mean 'fwnode'?
     196 |         gc->of_node             = pdev->dev.of_node;
         |             ^~~~~~~
         |             fwnode
   In file included from drivers/pinctrl/pinctrl-amdisp.c:42:
   drivers/pinctrl/pinctrl-amd.h: At top level:
>> drivers/pinctrl/pinctrl-amd.h:1478:34: warning: 'pmx_functions' defined but not used [-Wunused-const-variable=]
    1478 | static const struct amd_function pmx_functions[] = {
         |                                  ^~~~~~~~~~~~~
>> drivers/pinctrl/pinctrl-amd.h:882:30: warning: 'kerncz_groups' defined but not used [-Wunused-const-variable=]
     882 | static const struct pingroup kerncz_groups[] = {
         |                              ^~~~~~~~~~~~~
>> drivers/pinctrl/pinctrl-amd.h:111:38: warning: 'kerncz_pins' defined but not used [-Wunused-const-variable=]
     111 | static const struct pinctrl_pin_desc kerncz_pins[] = {
         |                                      ^~~~~~~~~~~


vim +196 drivers/pinctrl/pinctrl-amdisp.c

   173	
   174	static int amdisp_gpiochip_add(struct platform_device *pdev,
   175				       struct amdisp_pinctrl *pctrl)
   176	{
   177		struct gpio_chip *gc = &pctrl->gc;
   178		struct pinctrl_gpio_range *grange = &pctrl->gpio_range;
   179		int ret;
   180	
   181		gc->label		= dev_name(pctrl->dev);
   182		gc->owner		= THIS_MODULE;
   183		gc->parent		= &pdev->dev;
   184		gc->names		= amdisp_range_pins_name;
   185		gc->request		= gpiochip_generic_request;
   186		gc->free		= gpiochip_generic_free;
   187		gc->get_direction	= amdisp_gpio_get_direction;
   188		gc->direction_input	= amdisp_gpio_direction_input;
   189		gc->direction_output	= amdisp_gpio_direction_output;
   190		gc->get			= amdisp_gpio_get;
   191		gc->set			= amdisp_gpio_set;
   192		gc->set_config		= amdisp_gpio_set_config;
   193		gc->base		= -1;
   194		gc->ngpio		= ARRAY_SIZE(amdisp_range_pins);
   195	#if defined(CONFIG_OF_GPIO)
 > 196		gc->of_node		= pdev->dev.of_node;
   197		gc->of_gpio_n_cells	= 2;
   198	#endif
   199	
   200		grange->id		= 0;
   201		grange->pin_base	= 0;
   202		grange->base		= 0;
   203		grange->pins		= amdisp_range_pins;
   204		grange->npins		= ARRAY_SIZE(amdisp_range_pins);
   205		grange->name		= gc->label;
   206		grange->gc		= gc;
   207	
   208		ret = devm_gpiochip_add_data(&pdev->dev, gc, pctrl);
   209		if (ret)
   210			return ret;
   211	
   212		pinctrl_add_gpio_range(pctrl->pctrl, grange);
   213	
   214		dev_info(&pdev->dev, "register amdisp gpio controller\n");
   215		return 0;
   216	}
   217	#endif
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

