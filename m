Return-Path: <linux-gpio+bounces-16878-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6937DA4AEA6
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Mar 2025 02:23:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29B2E1893D3B
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Mar 2025 01:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EEA017991;
	Sun,  2 Mar 2025 01:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpeHDizI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD09EB673;
	Sun,  2 Mar 2025 01:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740878618; cv=none; b=bY67kJUnNTif3cvhS2V7Jne+E0P+g2gN72iwzS+M2tZvTDWoSJ7abNrGdqAxiuEQB7zCPIkQfj9+EUysj42iuKolRRmRbnTkb8ivk0PAB0AR9yR4b0qFMVBoM5ZnfYAkNLB8bHBL+qPqcNtxI/CrZRkCRqcYzTzD2PvDDOAM63A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740878618; c=relaxed/simple;
	bh=YOcy/8klnGRYLn8ngegq1opCqISbl0ggVdu/BhnATqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdh8h+IhbsN/K9eGHgg6d9LlkGOXYHAb+OmfVJ7y4JAk52TnVYyZopDs86XpTYsoYYFCbk3Sqvt4jvk0cnXmbmMKVy4RN/rHmhxRYrjpqJW7nUy+4zGalWSS9cWptqkIlLzXv0WvwKEKxGoJ0ItHIIT8yFPRkhVjXiaug44ufTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpeHDizI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740878617; x=1772414617;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YOcy/8klnGRYLn8ngegq1opCqISbl0ggVdu/BhnATqw=;
  b=hpeHDizIGT4h+PZhmHXWU5VBdDxtMqyWiJ0cOeQpC1pihmAdBRDQWiAy
   SjA2nQEL08jZf3kjV9C5cKPiM2Jl9k55hqYp5sa7TSwmLm+j7J+KZg8T1
   Az2x+dCGl61Kh3AMHl2TcUxbCwjcv1VTDpv2hoYKJPWIgkKIm9AEzsoGe
   7LdkbgY71wFs7rsLrVNSqpktI1CiAK8HdHSFB+rFTDwhUuAviN3Yzm2iT
   pdlfLGMMgtiyvLjDeY7B7aw9Pana1Mgxq1Cs+YScp2mH70gGY/xGHKloI
   U1r4l9ZXmaPvjX33CINf486nizwd/GrR44hZB/13Y/UzcFFtXHqHY1jGd
   w==;
X-CSE-ConnectionGUID: uQhmiGpFTwis6NmhoL/55g==
X-CSE-MsgGUID: ASYL5WDVToWDJ35hBZuFqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="67147906"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="67147906"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 17:23:36 -0800
X-CSE-ConnectionGUID: 7P+6Ri1cTcOSUcoaGJW3TQ==
X-CSE-MsgGUID: ijp9/h/7S5S77VTE4DJcWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="117665765"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 01 Mar 2025 17:23:34 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toY3I-000Gva-13;
	Sun, 02 Mar 2025 01:23:32 +0000
Date: Sun, 2 Mar 2025 09:22:40 +0800
From: kernel test robot <lkp@intel.com>
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, linus.walleij@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, benjamin.chan@amd.com,
	Pratap Nirujogi <pratap.nirujogi@amd.com>
Subject: Re: [PATCH] pinctrl: amd: isp411: Add amdisp GPIO pinctrl
Message-ID: <202503020937.17QhMxc9-lkp@intel.com>
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
config: hexagon-randconfig-r072-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020937.17QhMxc9-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 14170b16028c087ca154878f5ed93d3089a965c6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020937.17QhMxc9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020937.17QhMxc9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-amdisp.c:196:6: error: no member named 'of_node' in 'struct gpio_chip'; did you mean 'fwnode'?
     196 |         gc->of_node             = pdev->dev.of_node;
         |             ^~~~~~~
         |             fwnode
   include/linux/gpio/driver.h:421:24: note: 'fwnode' declared here
     421 |         struct fwnode_handle    *fwnode;
         |                                  ^
   1 error generated.


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

