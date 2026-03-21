Return-Path: <linux-gpio+bounces-33960-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iyopOClrvmnGPAMAu9opvQ
	(envelope-from <linux-gpio+bounces-33960-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 10:55:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 533C52E485F
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 10:55:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45C553026C38
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 09:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F31D314D1D;
	Sat, 21 Mar 2026 09:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jy54cI45"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A132ED84C;
	Sat, 21 Mar 2026 09:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774086945; cv=none; b=YDe3ci9kBOyI/LfV3fqEvW/iNp6BwRJhdp+CbYpF13/HZF4IB1ENDm0x+gIhVHuJ3WpRuScBmivUi2eWm+osGB2WMcdlM7y7iIbf4RGRjsL5IQ3vHymyP95CeWbHE6/oNZeIf94Ingub8e92p3qgu1AFMqxpQGlQ6BB+/aZjKFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774086945; c=relaxed/simple;
	bh=r8Mv4Jki2tCiR1OwLFCacSrYust3CnzuqrfqqmX+R88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jV1SHvIh8/zU2rjwL4e47Hfe/dtKT7B4A8RAQzpe9YpDPr7/oiSIaZ/7IqciayRquAk8VPQfbmbFmDqomO94A/d6oRpBpzK7KvLTTee/XMYJ49glKBvBGZIj68KD+wmf6AkQrvw1Q0A/Q7B2RYnGllby7kV9piw084pTwZqEouQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jy54cI45; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774086944; x=1805622944;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=r8Mv4Jki2tCiR1OwLFCacSrYust3CnzuqrfqqmX+R88=;
  b=jy54cI45+IExYTF++qpqmuOU3al/ggo5jDSh/uN4HtKcKiQ8FWyPmCob
   gKQ6B+4CyrSBW7rY5kQG0+5F/IvrGLx/jYdY2Au54HmM9uR0RifdA2429
   DKRjMKX4g3t9T0u2Uxduxh6/016p++S/Au/1AcHLUwV2M0VdCcHQnAxsM
   OidHZL//pE7qh11kpqMQF7NHHpoSyL15lQJoUoqWfM7AlEBNRB8eEQzfV
   Gmt3s5HBQzIl4AS3Mhb5u1jH0lssC+91isgSV99ovFJO3J5eES8dBZUaG
   tiKfb4X3/Xq4IxU9DpnZyJ2UN6tZzYhxVCQenHKSxy2ThH5lN6cnycVoG
   w==;
X-CSE-ConnectionGUID: WKMxNzo6QP6r5LLm9VTJQg==
X-CSE-MsgGUID: JnNinhydQvOwBN6Izx0Zkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75046964"
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="75046964"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 02:55:44 -0700
X-CSE-ConnectionGUID: GR1c6B2+RAqf1bk4CHFukQ==
X-CSE-MsgGUID: 7KFT2dbNR4+rlNDKMN60xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="246560425"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 21 Mar 2026 02:55:42 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3t3T-000000000ZR-3pz6;
	Sat, 21 Mar 2026 09:55:39 +0000
Date: Sat, 21 Mar 2026 17:55:34 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 1/1] pinctrl: core: Drop unused include
Message-ID: <202603211735.MWgZlCwg-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33960-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,git-scm.com:url,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: 533C52E485F
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
config: i386-randconfig-011-20260321 (https://download.01.org/0day-ci/archive/20260321/202603211735.MWgZlCwg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603211735.MWgZlCwg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603211735.MWgZlCwg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/core.c: In function 'pinctrl_pins_show':
   drivers/pinctrl/core.c:1742:53: error: implicit declaration of function 'gpio_to_desc'; did you mean 'gpio_to_pin'? [-Wimplicit-function-declaration]
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


vim +/gpiod_to_gpio_device +1742 drivers/pinctrl/core.c

2744e8afb3b7634 Linus Walleij       2011-05-02  1700  
2744e8afb3b7634 Linus Walleij       2011-05-02  1701  	seq_printf(s, "registered pins: %d\n", pctldev->desc->npins);
2744e8afb3b7634 Linus Walleij       2011-05-02  1702  
42fed7ba44e4e8c Patrice Chotard     2013-04-11  1703  	mutex_lock(&pctldev->mutex);
57b676f9c1b7cd8 Stephen Warren      2012-03-02  1704  
706e8520e8450a6 Chanho Park         2012-01-03  1705  	/* The pin number can be retrived from the pin controller descriptor */
706e8520e8450a6 Chanho Park         2012-01-03  1706  	for (i = 0; i < pctldev->desc->npins; i++) {
2744e8afb3b7634 Linus Walleij       2011-05-02  1707  		struct pin_desc *desc;
2744e8afb3b7634 Linus Walleij       2011-05-02  1708  
706e8520e8450a6 Chanho Park         2012-01-03  1709  		pin = pctldev->desc->pins[i].number;
2744e8afb3b7634 Linus Walleij       2011-05-02  1710  		desc = pin_desc_get(pctldev, pin);
2744e8afb3b7634 Linus Walleij       2011-05-02  1711  		/* Pin space may be sparse */
cea234e996922d4 Markus Elfring      2017-05-02  1712  		if (!desc)
2744e8afb3b7634 Linus Walleij       2011-05-02  1713  			continue;
2744e8afb3b7634 Linus Walleij       2011-05-02  1714  
cf9d994dcf00c09 Masahiro Yamada     2016-05-24  1715  		seq_printf(s, "pin %d (%s) ", pin, desc->name);
2744e8afb3b7634 Linus Walleij       2011-05-02  1716  
f1b206cf7c57561 Drew Fustini        2020-07-22  1717  #ifdef CONFIG_GPIOLIB
9dfbcf2fc566c0b Léo DUBOIN          2024-04-25  1718  		gdev = NULL;
482715ff0601c83 Andy Shevchenko     2021-04-15  1719  		gpio_num = -1;
f1b206cf7c57561 Drew Fustini        2020-07-22  1720  		list_for_each_entry(range, &pctldev->gpio_ranges, node) {
db5032981ab37eb Léo DUBOIN          2024-04-25  1721  			if (range->pins != NULL) {
db5032981ab37eb Léo DUBOIN          2024-04-25  1722  				for (int i = 0; i < range->npins; ++i) {
db5032981ab37eb Léo DUBOIN          2024-04-25  1723  					if (range->pins[i] == pin) {
db5032981ab37eb Léo DUBOIN          2024-04-25  1724  						gpio_num = range->base + i;
f1b206cf7c57561 Drew Fustini        2020-07-22  1725  						break;
f1b206cf7c57561 Drew Fustini        2020-07-22  1726  					}
f1b206cf7c57561 Drew Fustini        2020-07-22  1727  				}
db5032981ab37eb Léo DUBOIN          2024-04-25  1728  			} else if ((pin >= range->pin_base) &&
db5032981ab37eb Léo DUBOIN          2024-04-25  1729  				   (pin < (range->pin_base + range->npins))) {
db5032981ab37eb Léo DUBOIN          2024-04-25  1730  				gpio_num =
db5032981ab37eb Léo DUBOIN          2024-04-25  1731  					range->base + (pin - range->pin_base);
db5032981ab37eb Léo DUBOIN          2024-04-25  1732  			}
db5032981ab37eb Léo DUBOIN          2024-04-25  1733  			if (gpio_num != -1)
db5032981ab37eb Léo DUBOIN          2024-04-25  1734  				break;
db5032981ab37eb Léo DUBOIN          2024-04-25  1735  		}
482715ff0601c83 Andy Shevchenko     2021-04-15  1736  		if (gpio_num >= 0)
e3863fa123c8fd9 Linus Walleij       2023-01-20  1737  			/*
e3863fa123c8fd9 Linus Walleij       2023-01-20  1738  			 * FIXME: gpio_num comes from the global GPIO numberspace.
e3863fa123c8fd9 Linus Walleij       2023-01-20  1739  			 * we need to get rid of the range->base eventually and
e3863fa123c8fd9 Linus Walleij       2023-01-20  1740  			 * get the descriptor directly from the gpio_chip.
e3863fa123c8fd9 Linus Walleij       2023-01-20  1741  			 */
524fc108b895868 Bartosz Golaszewski 2023-11-15 @1742  			gdev = gpiod_to_gpio_device(gpio_to_desc(gpio_num));
524fc108b895868 Bartosz Golaszewski 2023-11-15  1743  		if (gdev)
524fc108b895868 Bartosz Golaszewski 2023-11-15  1744  			seq_printf(s, "%u:%s ",
524fc108b895868 Bartosz Golaszewski 2023-11-15  1745  				   gpio_num - gpio_device_get_base(gdev),
524fc108b895868 Bartosz Golaszewski 2023-11-15  1746  				   gpio_device_get_label(gdev));
f1b206cf7c57561 Drew Fustini        2020-07-22  1747  		else
f1b206cf7c57561 Drew Fustini        2020-07-22  1748  			seq_puts(s, "0:? ");
f1b206cf7c57561 Drew Fustini        2020-07-22  1749  #endif
f1b206cf7c57561 Drew Fustini        2020-07-22  1750  
2744e8afb3b7634 Linus Walleij       2011-05-02  1751  		/* Driver-specific info per pin */
2744e8afb3b7634 Linus Walleij       2011-05-02  1752  		if (ops->pin_dbg_show)
2744e8afb3b7634 Linus Walleij       2011-05-02  1753  			ops->pin_dbg_show(pctldev, s, pin);
2744e8afb3b7634 Linus Walleij       2011-05-02  1754  
2744e8afb3b7634 Linus Walleij       2011-05-02  1755  		seq_puts(s, "\n");
2744e8afb3b7634 Linus Walleij       2011-05-02  1756  	}
2744e8afb3b7634 Linus Walleij       2011-05-02  1757  
42fed7ba44e4e8c Patrice Chotard     2013-04-11  1758  	mutex_unlock(&pctldev->mutex);
57b676f9c1b7cd8 Stephen Warren      2012-03-02  1759  
2744e8afb3b7634 Linus Walleij       2011-05-02  1760  	return 0;
2744e8afb3b7634 Linus Walleij       2011-05-02  1761  }
b5520891a3491cd Andy Shevchenko     2018-02-17  1762  DEFINE_SHOW_ATTRIBUTE(pinctrl_pins);
2744e8afb3b7634 Linus Walleij       2011-05-02  1763  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

