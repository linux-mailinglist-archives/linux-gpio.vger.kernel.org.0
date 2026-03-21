Return-Path: <linux-gpio+bounces-33958-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMEZKpdIvmmpLgMAu9opvQ
	(envelope-from <linux-gpio+bounces-33958-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 08:28:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EE92E3F43
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 08:28:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B11143029A70
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 07:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9C3317166;
	Sat, 21 Mar 2026 07:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ITtbvrks"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2922D94A0;
	Sat, 21 Mar 2026 07:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774078100; cv=none; b=mE19OtAZoHwqnn8Nu2qFVDydRES+LmR4IfF7J+/+Bh/EnY4ahZAQrnSq3RRCgAYQ/CjYs/kzWDDkIctYD9+iR9x8Fnv+O73lxQDrhKQtxTEUx8PZnxc20/hDAGElDCfv4zTAfKhTf+/6E5WVTx/V/wsNrW5CX4BF/Tdg54wHt5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774078100; c=relaxed/simple;
	bh=iL6jsdB9DefClkNRzSzQMhXNkQ5rb9i39P9GMpIatB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OEVAj44KIzsWUYX5NY+zaGCRz85NMgN9sXZRMrsfpS9Hd57iBUCxl6avHY3MW1Z1aaXYLW0bOJHUmdfNGYr6tFsUSUsT0UiIRYrBFb63CTQhsiFcb7iPDrHH5Tq1mvuprgptaor/2MNVkKkO8Jqr/HmOy3YelFuWTKp9/9s2NwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ITtbvrks; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774078098; x=1805614098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=iL6jsdB9DefClkNRzSzQMhXNkQ5rb9i39P9GMpIatB8=;
  b=ITtbvrkskePwo5R3cI8zojkk5NCcQzYKSR75C/ucQJkCdeIa/9o8PaTM
   0fthoSE+D5NCBNwOvWz5x7HBNhy8AdDXt4Z6eFEfW0V+b3b+LMxKxaYQe
   fyC8/08MeMo2IbbYkXj5Xd96I0LSkyCyILih5p8HspN64x9AN36XjI6E5
   C0f0rh0VE57fakIC/9DaZzJ3RxW0wyqv52AZyVRsNGnuKdrfinUV65qM/
   Oyy/t8SzzKbYJ+6OJLMiPrIx2IEGc7F3fLmONuD4skneZ476of8rLHNOv
   9uhDh8NU7OMssOPViKCXg4Wic5pviLA830s/qq/3O/k+uJscqvWqZcFPO
   w==;
X-CSE-ConnectionGUID: ovhn0bvLTViWGRj2OGEEEg==
X-CSE-MsgGUID: S0MAXETXSS2vfdGUnoHnaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="74339216"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="74339216"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 00:28:17 -0700
X-CSE-ConnectionGUID: 6qRu0o/PQFGwJ3QquFq6Ig==
X-CSE-MsgGUID: y9gxzSHFRl6tf40H/5ceZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="219243283"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 21 Mar 2026 00:28:16 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3qko-000000005of-17gf;
	Sat, 21 Mar 2026 07:28:14 +0000
Date: Sat, 21 Mar 2026 08:27:58 +0100
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 1/1] pinctrl: core: Drop unused include
Message-ID: <202603210823.dmrUGhlf-lkp@intel.com>
References: <20260320220550.3237142-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260320220550.3237142-1-andriy.shevchenko@linux.intel.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33958-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D4EE92E3F43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next linus/master v7.0-rc4 next-20260320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/pinctrl-core-Drop-unused-include/20260321-095653
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20260320220550.3237142-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/1] pinctrl: core: Drop unused include
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260321/202603210823.dmrUGhlf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603210823.dmrUGhlf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603210823.dmrUGhlf-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/core.c: In function 'pinctrl_pins_show':
>> drivers/pinctrl/core.c:1742:53: error: implicit declaration of function 'gpio_to_desc'; did you mean 'gpio_to_pin'? [-Wimplicit-function-declaration]
    1742 |                         gdev = gpiod_to_gpio_device(gpio_to_desc(gpio_num));
         |                                                     ^~~~~~~~~~~~
         |                                                     gpio_to_pin
>> drivers/pinctrl/core.c:1742:53: error: passing argument 1 of 'gpiod_to_gpio_device' makes pointer from integer without a cast [-Wint-conversion]
    1742 |                         gdev = gpiod_to_gpio_device(gpio_to_desc(gpio_num));
         |                                                     ^~~~~~~~~~~~~~~~~~~~~~
         |                                                     |
         |                                                     int
   In file included from drivers/pinctrl/core.c:27:
   include/linux/gpio/driver.h:817:60: note: expected 'struct gpio_desc *' but argument is of type 'int'
     817 | struct gpio_device *gpiod_to_gpio_device(struct gpio_desc *desc);
         |                                          ~~~~~~~~~~~~~~~~~~^~~~


vim +1742 drivers/pinctrl/core.c

2744e8afb3b763 Linus Walleij       2011-05-02  1700  
2744e8afb3b763 Linus Walleij       2011-05-02  1701  	seq_printf(s, "registered pins: %d\n", pctldev->desc->npins);
2744e8afb3b763 Linus Walleij       2011-05-02  1702  
42fed7ba44e4e8 Patrice Chotard     2013-04-11  1703  	mutex_lock(&pctldev->mutex);
57b676f9c1b7cd Stephen Warren      2012-03-02  1704  
706e8520e8450a Chanho Park         2012-01-03  1705  	/* The pin number can be retrived from the pin controller descriptor */
706e8520e8450a Chanho Park         2012-01-03  1706  	for (i = 0; i < pctldev->desc->npins; i++) {
2744e8afb3b763 Linus Walleij       2011-05-02  1707  		struct pin_desc *desc;
2744e8afb3b763 Linus Walleij       2011-05-02  1708  
706e8520e8450a Chanho Park         2012-01-03  1709  		pin = pctldev->desc->pins[i].number;
2744e8afb3b763 Linus Walleij       2011-05-02  1710  		desc = pin_desc_get(pctldev, pin);
2744e8afb3b763 Linus Walleij       2011-05-02  1711  		/* Pin space may be sparse */
cea234e996922d Markus Elfring      2017-05-02  1712  		if (!desc)
2744e8afb3b763 Linus Walleij       2011-05-02  1713  			continue;
2744e8afb3b763 Linus Walleij       2011-05-02  1714  
cf9d994dcf00c0 Masahiro Yamada     2016-05-24  1715  		seq_printf(s, "pin %d (%s) ", pin, desc->name);
2744e8afb3b763 Linus Walleij       2011-05-02  1716  
f1b206cf7c5756 Drew Fustini        2020-07-22  1717  #ifdef CONFIG_GPIOLIB
9dfbcf2fc566c0 Léo DUBOIN          2024-04-25  1718  		gdev = NULL;
482715ff0601c8 Andy Shevchenko     2021-04-15  1719  		gpio_num = -1;
f1b206cf7c5756 Drew Fustini        2020-07-22  1720  		list_for_each_entry(range, &pctldev->gpio_ranges, node) {
db5032981ab37e Léo DUBOIN          2024-04-25  1721  			if (range->pins != NULL) {
db5032981ab37e Léo DUBOIN          2024-04-25  1722  				for (int i = 0; i < range->npins; ++i) {
db5032981ab37e Léo DUBOIN          2024-04-25  1723  					if (range->pins[i] == pin) {
db5032981ab37e Léo DUBOIN          2024-04-25  1724  						gpio_num = range->base + i;
f1b206cf7c5756 Drew Fustini        2020-07-22  1725  						break;
f1b206cf7c5756 Drew Fustini        2020-07-22  1726  					}
f1b206cf7c5756 Drew Fustini        2020-07-22  1727  				}
db5032981ab37e Léo DUBOIN          2024-04-25  1728  			} else if ((pin >= range->pin_base) &&
db5032981ab37e Léo DUBOIN          2024-04-25  1729  				   (pin < (range->pin_base + range->npins))) {
db5032981ab37e Léo DUBOIN          2024-04-25  1730  				gpio_num =
db5032981ab37e Léo DUBOIN          2024-04-25  1731  					range->base + (pin - range->pin_base);
db5032981ab37e Léo DUBOIN          2024-04-25  1732  			}
db5032981ab37e Léo DUBOIN          2024-04-25  1733  			if (gpio_num != -1)
db5032981ab37e Léo DUBOIN          2024-04-25  1734  				break;
db5032981ab37e Léo DUBOIN          2024-04-25  1735  		}
482715ff0601c8 Andy Shevchenko     2021-04-15  1736  		if (gpio_num >= 0)
e3863fa123c8fd Linus Walleij       2023-01-20  1737  			/*
e3863fa123c8fd Linus Walleij       2023-01-20  1738  			 * FIXME: gpio_num comes from the global GPIO numberspace.
e3863fa123c8fd Linus Walleij       2023-01-20  1739  			 * we need to get rid of the range->base eventually and
e3863fa123c8fd Linus Walleij       2023-01-20  1740  			 * get the descriptor directly from the gpio_chip.
e3863fa123c8fd Linus Walleij       2023-01-20  1741  			 */
524fc108b89586 Bartosz Golaszewski 2023-11-15 @1742  			gdev = gpiod_to_gpio_device(gpio_to_desc(gpio_num));
524fc108b89586 Bartosz Golaszewski 2023-11-15  1743  		if (gdev)
524fc108b89586 Bartosz Golaszewski 2023-11-15  1744  			seq_printf(s, "%u:%s ",
524fc108b89586 Bartosz Golaszewski 2023-11-15  1745  				   gpio_num - gpio_device_get_base(gdev),
524fc108b89586 Bartosz Golaszewski 2023-11-15  1746  				   gpio_device_get_label(gdev));
f1b206cf7c5756 Drew Fustini        2020-07-22  1747  		else
f1b206cf7c5756 Drew Fustini        2020-07-22  1748  			seq_puts(s, "0:? ");
f1b206cf7c5756 Drew Fustini        2020-07-22  1749  #endif
f1b206cf7c5756 Drew Fustini        2020-07-22  1750  
2744e8afb3b763 Linus Walleij       2011-05-02  1751  		/* Driver-specific info per pin */
2744e8afb3b763 Linus Walleij       2011-05-02  1752  		if (ops->pin_dbg_show)
2744e8afb3b763 Linus Walleij       2011-05-02  1753  			ops->pin_dbg_show(pctldev, s, pin);
2744e8afb3b763 Linus Walleij       2011-05-02  1754  
2744e8afb3b763 Linus Walleij       2011-05-02  1755  		seq_puts(s, "\n");
2744e8afb3b763 Linus Walleij       2011-05-02  1756  	}
2744e8afb3b763 Linus Walleij       2011-05-02  1757  
42fed7ba44e4e8 Patrice Chotard     2013-04-11  1758  	mutex_unlock(&pctldev->mutex);
57b676f9c1b7cd Stephen Warren      2012-03-02  1759  
2744e8afb3b763 Linus Walleij       2011-05-02  1760  	return 0;
2744e8afb3b763 Linus Walleij       2011-05-02  1761  }
b5520891a3491c Andy Shevchenko     2018-02-17  1762  DEFINE_SHOW_ATTRIBUTE(pinctrl_pins);
2744e8afb3b763 Linus Walleij       2011-05-02  1763  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

