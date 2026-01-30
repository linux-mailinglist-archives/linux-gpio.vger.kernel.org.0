Return-Path: <linux-gpio+bounces-31324-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAz8MsNJfGktLwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31324-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jan 2026 07:03:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A89B78D8
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jan 2026 07:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF4CD300405F
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jan 2026 06:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F81F261388;
	Fri, 30 Jan 2026 06:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IR3QoIdZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1302281732
	for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2026 06:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769753016; cv=none; b=t1AvFCV2YWb/HL/fSeXKSQxzeDVsgAp936C3N+DW1VPvHCJGSRlaI71SHLAHr+qgByUiQujWcLDKcYpJNrg9Xgxf+agXXZ3ytWwl6MWfBiQW0JUjQ+QO62yzFtYrlYfbTg1daKZBHsdeTNbCy6ThVt4vahOKhRytSqvYW3/eZAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769753016; c=relaxed/simple;
	bh=LTthSLKE8RSuVk1YKEXFDmQwJJcU+qOV1aPdsDtSr/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8bzRZbzIFk8ate1Of2Q8SaFKxEe829mNu5Y8obDQ8eyRBuNbDLlQqcIhTOJP1Do1mHwlXyRxntUPfKtiu2Swd+CcCB9s8fimpU1kBl5BcI1J0q1UX0K93Wt/K5T0zfLB4vr+adFx4hozT4gUvXdgAnnSF7gfY7m70bb+ZKf7KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IR3QoIdZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769753015; x=1801289015;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LTthSLKE8RSuVk1YKEXFDmQwJJcU+qOV1aPdsDtSr/k=;
  b=IR3QoIdZS6QuOxu2CSfmI7lTW6XZMCSXmfSUnzD6JmrMfd+FUkw1I5Qk
   j3z/9CxQjhfHBC5H5YHJ6vqbrTVOveNiJuo22oAQ9yO39DIQrYGxN5Pul
   i8Ija5U3IX/XG6laWKXG8xJUOX5tEsFvv/t44+QdX8x3yi+OdVzB5BJ4/
   5iQGTg9FI3dU5yMrD78gVtvNWAFCqHratDh+uUy1puGla/txi46QDAvkj
   1yCVKQ0ziGHkN9x4IXt49K87ocnaBzXoaeLxTsRet02JzN1lESu/gaAMg
   JzJXWxoq7AlYycAm5FtH9ZN2AXp/GAnBxHDZ2IKkWK/AQQ0pqVrFhHoV3
   Q==;
X-CSE-ConnectionGUID: 02ugkzk8Tjm5PyJpWt8xMQ==
X-CSE-MsgGUID: zM2VZn/HSH2rqiwjz1VBNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="96466203"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="96466203"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 22:03:34 -0800
X-CSE-ConnectionGUID: jai394SjQ3yIiusppR3KIg==
X-CSE-MsgGUID: 3+AukfwqTAm/lsQIqoqF3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="212851590"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Jan 2026 22:03:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlhbO-00000000cFK-18wj;
	Fri, 30 Jan 2026 06:03:30 +0000
Date: Fri, 30 Jan 2026 14:03:21 +0800
From: kernel test robot <lkp@intel.com>
To: Rory Little <rory@candelatech.com>, Enrico Weigelt <info@metux.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: amd-fch: Return 0-1 range for get operation
Message-ID: <202601301319.Zm4jGCnY-lkp@intel.com>
References: <20260129222150.486419-1-rory@candelatech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129222150.486419-1-rory@candelatech.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31324-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,git-scm.com:url,01.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D3A89B78D8
X-Rspamd-Action: no action

Hi Rory,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v6.19-rc7 next-20260129]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rory-Little/gpio-amd-fch-Return-0-1-range-for-get-operation/20260130-063318
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20260129222150.486419-1-rory%40candelatech.com
patch subject: [PATCH] gpio: amd-fch: Return 0-1 range for get operation
config: s390-randconfig-002-20260130 (https://download.01.org/0day-ci/archive/20260130/202601301319.Zm4jGCnY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601301319.Zm4jGCnY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601301319.Zm4jGCnY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-amd-fch.c:128:8: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     128 |         ret = FIELD_GET(AMD_FCH_GPIO_FLAG_READ, readl_relaxed(ptr));
         |               ^
   1 error generated.


vim +/FIELD_GET +128 drivers/gpio/gpio-amd-fch.c

   118	
   119	static int amd_fch_gpio_get(struct gpio_chip *gc,
   120				    unsigned int offset)
   121	{
   122		unsigned long flags;
   123		int ret;
   124		struct amd_fch_gpio_priv *priv = gpiochip_get_data(gc);
   125		void __iomem *ptr = amd_fch_gpio_addr(priv, offset);
   126	
   127		spin_lock_irqsave(&priv->lock, flags);
 > 128		ret = FIELD_GET(AMD_FCH_GPIO_FLAG_READ, readl_relaxed(ptr));
   129		spin_unlock_irqrestore(&priv->lock, flags);
   130	
   131		return ret;
   132	}
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

