Return-Path: <linux-gpio+bounces-16090-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 947D1A37517
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 16:33:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA9C13AA447
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 15:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D201802B;
	Sun, 16 Feb 2025 15:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HMCejJGs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDDE208A0;
	Sun, 16 Feb 2025 15:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739720006; cv=none; b=sDf4I0vC+fVvwgJZavGgSFvdHme9SGSUT8KtCXX+t3t1cowQSwcuOgUZGXHgWO5+JH+2El3nmlKdS5AfMuGzBnzzXGiQUxsV/J3RqSzHbj+BhIyw6NlguGSVahGPU3/8+A+bb5T+HMbUdQEqgZEDm3Jd04OP/6+4YvU/wG3AtI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739720006; c=relaxed/simple;
	bh=zpGAUL2A6gkU3zldFOJ6dcxKJ8KW2u6T2qeA9Zh6zyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhxkV7UmYW8cDrzIbTVXXQNd/iwQoNE75C4OFABXgE7RaUzmSDrTgHQnknNBhLc2B01mv2t4q5i1glLivacd4Q1khpPqFE6/bg8o0LQzPfPxmVBcOmexO/m7Nwtj6x4ksrQGAvtjGAdMxaCAe3P10v2KDdoHkQsm3uXryjNMyCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HMCejJGs; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739720005; x=1771256005;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zpGAUL2A6gkU3zldFOJ6dcxKJ8KW2u6T2qeA9Zh6zyA=;
  b=HMCejJGsg5N41Op9N63kYz2f/Zz71wB8egfHxkIl/pBIw6CkXno+4DRW
   696diqYsbetUU8536fKK2XhkFCGBRH94mif6dCwgYCZnzx8u1gWwoDRKG
   KBPxChys0+1XT8yV8dQEu3uAq98znh8VhMnWrToXqClTfDgiYKgYZh/eS
   /4LGWzMHduw8GhCiuKFtbttxkz3r1oc9S8UQGxxL+q9cBl0LknhxWstAh
   +/pLIaq4qnF2z2F4VOOau/ai8Mh1RbVZ1BWlXZByBgzNZp02cAOVkOwTj
   tSzJdpU3gw7S88faYg5my+WySm4RYqz5774KKQkXey5xAP1F0UneAAVjU
   w==;
X-CSE-ConnectionGUID: Wqsyu2KvThq5rrvyD1tHhA==
X-CSE-MsgGUID: x6Jy28y5TWeqdEOB1TyT8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51836689"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51836689"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 07:33:24 -0800
X-CSE-ConnectionGUID: livIVoLVSXmbyGoEui878g==
X-CSE-MsgGUID: CKzRqbeLQpS/MAeYtiuhfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113768074"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Feb 2025 07:33:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjgdz-001C1b-1z;
	Sun, 16 Feb 2025 15:33:19 +0000
Date: Sun, 16 Feb 2025 23:32:47 +0800
From: kernel test robot <lkp@intel.com>
To: Koichiro Den <koichiro.den@canonical.com>, linux-gpio@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, brgl@bgdev.pl, geert+renesas@glider.be,
	linus.walleij@linaro.org, maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/13] gpio: virtuser: convert to use gpio-pseudo
 utilities
Message-ID: <202502162345.FT5z7kr9-lkp@intel.com>
References: <20250216125816.14430-6-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250216125816.14430-6-koichiro.den@canonical.com>

Hi Koichiro,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v6.14-rc2 next-20250214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Koichiro-Den/gpio-aggregator-reorder-functions-to-prepare-for-configfs-introduction/20250216-210413
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20250216125816.14430-6-koichiro.den%40canonical.com
patch subject: [PATCH v3 05/13] gpio: virtuser: convert to use gpio-pseudo utilities
config: csky-randconfig-002-20250216 (https://download.01.org/0day-ci/archive/20250216/202502162345.FT5z7kr9-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502162345.FT5z7kr9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502162345.FT5z7kr9-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-pseudo.c: In function 'pseudo_gpio_register':
>> drivers/gpio/gpio-pseudo.c:62:17: error: implicit declaration of function 'kfree'; did you mean 'kvfree'? [-Wimplicit-function-declaration]
      62 |                 kfree(common->name);
         |                 ^~~~~
         |                 kvfree


vim +62 drivers/gpio/gpio-pseudo.c

ef524a2229b717 Koichiro Den 2025-02-16  43  
ef524a2229b717 Koichiro Den 2025-02-16  44  int pseudo_gpio_register(struct pseudo_gpio_common *common,
ef524a2229b717 Koichiro Den 2025-02-16  45  			 struct platform_device_info *pdevinfo)
ef524a2229b717 Koichiro Den 2025-02-16  46  {
ef524a2229b717 Koichiro Den 2025-02-16  47  	struct platform_device *pdev;
ef524a2229b717 Koichiro Den 2025-02-16  48  	char *name;
ef524a2229b717 Koichiro Den 2025-02-16  49  
ef524a2229b717 Koichiro Den 2025-02-16  50  	name = kasprintf(GFP_KERNEL, "%s.%u", pdevinfo->name, pdevinfo->id);
ef524a2229b717 Koichiro Den 2025-02-16  51  	if (!name)
ef524a2229b717 Koichiro Den 2025-02-16  52  		return -ENOMEM;
ef524a2229b717 Koichiro Den 2025-02-16  53  
ef524a2229b717 Koichiro Den 2025-02-16  54  	common->driver_bound = false;
ef524a2229b717 Koichiro Den 2025-02-16  55  	common->name = name;
ef524a2229b717 Koichiro Den 2025-02-16  56  	reinit_completion(&common->probe_completion);
ef524a2229b717 Koichiro Den 2025-02-16  57  	bus_register_notifier(&platform_bus_type, &common->bus_notifier);
ef524a2229b717 Koichiro Den 2025-02-16  58  
ef524a2229b717 Koichiro Den 2025-02-16  59  	pdev = platform_device_register_full(pdevinfo);
ef524a2229b717 Koichiro Den 2025-02-16  60  	if (IS_ERR(pdev)) {
ef524a2229b717 Koichiro Den 2025-02-16  61  		bus_unregister_notifier(&platform_bus_type, &common->bus_notifier);
ef524a2229b717 Koichiro Den 2025-02-16 @62  		kfree(common->name);
ef524a2229b717 Koichiro Den 2025-02-16  63  		return PTR_ERR(pdev);
ef524a2229b717 Koichiro Den 2025-02-16  64  	}
ef524a2229b717 Koichiro Den 2025-02-16  65  
ef524a2229b717 Koichiro Den 2025-02-16  66  	wait_for_completion(&common->probe_completion);
ef524a2229b717 Koichiro Den 2025-02-16  67  	bus_unregister_notifier(&platform_bus_type, &common->bus_notifier);
ef524a2229b717 Koichiro Den 2025-02-16  68  
ef524a2229b717 Koichiro Den 2025-02-16  69  	if (!common->driver_bound) {
ef524a2229b717 Koichiro Den 2025-02-16  70  		platform_device_unregister(pdev);
ef524a2229b717 Koichiro Den 2025-02-16  71  		kfree(common->name);
ef524a2229b717 Koichiro Den 2025-02-16  72  		return -ENXIO;
ef524a2229b717 Koichiro Den 2025-02-16  73  	}
ef524a2229b717 Koichiro Den 2025-02-16  74  
ef524a2229b717 Koichiro Den 2025-02-16  75  	common->pdev = pdev;
ef524a2229b717 Koichiro Den 2025-02-16  76  	return 0;
ef524a2229b717 Koichiro Den 2025-02-16  77  }
ef524a2229b717 Koichiro Den 2025-02-16  78  EXPORT_SYMBOL_GPL(pseudo_gpio_register);
ef524a2229b717 Koichiro Den 2025-02-16  79  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

