Return-Path: <linux-gpio+bounces-25830-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97534B4FD6E
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 15:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD16D543F20
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 13:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F265356913;
	Tue,  9 Sep 2025 13:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RoL5rhKm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B82233CE90;
	Tue,  9 Sep 2025 13:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757424788; cv=none; b=dnlUoazzbvY1XemaJkWX6KlNXoKMwwwIVvIKXFcKjh0C/Cyq5LdnQLpajPgVSsDLV3roc89QtI6ZU45DvY5zzMalaBx6RFEW7mJl0iVGIlOCEl4BElge9VX+6MT83gETv59kJzJrN2w6cpTI7A/hMPKe+lny/GfgPOF2frEQaRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757424788; c=relaxed/simple;
	bh=vQn5Ns/rZdju1+k5oJSvNbHwCpp74OomD9d/3hLJn54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=upR9YgZFfqCYKQr60oEIX/jkSsTlX0+Ydl7iqe4oCrnICBzF/3fDb7ewZnXhHEa1n2AcOXgORyZewbuBgH0AnTIdNAYHYFQjTXkU2C/qNilnWolKvYnS5a7xkqd0Z7jGc1VL6kkXpZG0iiXOMen7PC40gbDKRsb6xB+dq820Dkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RoL5rhKm; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757424787; x=1788960787;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vQn5Ns/rZdju1+k5oJSvNbHwCpp74OomD9d/3hLJn54=;
  b=RoL5rhKmZUWbPH8wLqjB9WX9lNNcqkvkBKSKhpnWJJBAlulMyLB347RW
   DzgaNYnjf+BxU50l2KTT865sf2PWPXsR8jBgrTTIcGTo2mizhW9GjhW8N
   ZoVVZTE2QIcj5Lj561wptMyDGlFSv6GQDGRWZtj2GFOoOCI/h9EwNvLdW
   WYg5AGcIk/xzSp7IGCcyHmpvyd4FrBngyjlKqZf5XjRS12Z/H6+h5z0ci
   NRhVYGSObcW1aVPvHx06GF9f5ENEtSC4ESgMMPqV6snGWWiUGQgjwsiNP
   bhluZlpFKtwdQXSOhO9FfQFscg9mTcoF416xKqsp/902Rtu4U69GJyqtb
   w==;
X-CSE-ConnectionGUID: luVT5OjRSPK2V8NpJgeEag==
X-CSE-MsgGUID: wRiKOL+1Sqm4ke3UHetp6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59565892"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="59565892"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:33:06 -0700
X-CSE-ConnectionGUID: nLT5NzcdSVCkdCXh5+noIg==
X-CSE-MsgGUID: 62NvzgldQLiaeQuNNGmJ9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="173471985"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Sep 2025 06:33:04 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvySz-0004uF-2v;
	Tue, 09 Sep 2025 13:33:01 +0000
Date: Tue, 9 Sep 2025 21:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org, brgl@bgdev.pl,
	linux-gpio@vger.kernel.org, Mary Strodl <mstrodl@csh.rit.edu>
Subject: Re: [PATCH] gpio: mpsse: support bryx radio interface kit
Message-ID: <202509092305.ncd9mzaZ-lkp@intel.com>
References: <20250908173804.3816149-1-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908173804.3816149-1-mstrodl@csh.rit.edu>

Hi Mary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.17-rc5 next-20250909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mary-Strodl/gpio-mpsse-support-bryx-radio-interface-kit/20250909-014744
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20250908173804.3816149-1-mstrodl%40csh.rit.edu
patch subject: [PATCH] gpio: mpsse: support bryx radio interface kit
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250909/202509092305.ncd9mzaZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509092305.ncd9mzaZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509092305.ncd9mzaZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/usb.h:19,
                    from drivers/gpio/gpio-mpsse.c:13:
   drivers/gpio/gpio-mpsse.c: In function 'mpsse_ensure_supported':
>> drivers/gpio/gpio-mpsse.c:211:25: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'int' [-Wformat=]
     211 |                         "mpsse: GPIO %ld doesn't support %s\n",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/gpio/gpio-mpsse.c:210:17: note: in expansion of macro 'dev_err'
     210 |                 dev_err(&priv->udev->dev,
         |                 ^~~~~~~
   drivers/gpio/gpio-mpsse.c:211:40: note: format string is defined here
     211 |                         "mpsse: GPIO %ld doesn't support %s\n",
         |                                      ~~^
         |                                        |
         |                                        long int
         |                                      %d


vim +211 drivers/gpio/gpio-mpsse.c

   193	
   194	static int mpsse_ensure_supported(struct gpio_chip *chip,
   195					  unsigned long *mask, int direction)
   196	{
   197		unsigned long supported, unsupported;
   198		char *type = "input";
   199		struct mpsse_priv *priv = gpiochip_get_data(chip);
   200	
   201		supported = priv->dir_in;
   202		if (direction == GPIO_LINE_DIRECTION_OUT) {
   203			supported = priv->dir_out;
   204			type = "output";
   205		}
   206	
   207		/* An invalid bit was in the provided mask */
   208		unsupported = *mask & supported;
   209		if (unsupported) {
   210			dev_err(&priv->udev->dev,
 > 211				"mpsse: GPIO %ld doesn't support %s\n",
   212				find_first_bit(&unsupported, sizeof(unsupported) * 8),
   213				type);
   214			return -EOPNOTSUPP;
   215		}
   216	
   217		return 0;
   218	}
   219	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

