Return-Path: <linux-gpio+bounces-31322-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oG0CBJk8fGkXLgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31322-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jan 2026 06:07:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9300CB730F
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jan 2026 06:07:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AA2F6300644C
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jan 2026 05:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C70A329392;
	Fri, 30 Jan 2026 05:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZ8vRs3t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2330331355C
	for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2026 05:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769749654; cv=none; b=iGZt8aD/wS0EE2u5Cbzq5IgVsfP546qY7VlyYZPXvSm/6gSoVwSiWSpf6GZGpG+1IYANcXvPeJhJ0dA6OSPuEduXU+PKg4Lb+bqffPPSJwmTU5j3ZHMTYAzmdJJln9klWIkJ1iNNZE22pahJwF+C4mQUjOshWRyvHcLwWgape2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769749654; c=relaxed/simple;
	bh=QBbkh3nRpSoVSB7XKqavd86nZFoZrk2X3PDKZYamDps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TGPX5GPA1ikNT/qdUsStPMjSEZvqy6Tt5Uu/xU63yplfdAGBq4zHY87EhSF+RAS/a1NYB6rcMy76gn6F4bCxPfRH9KSp15bA6ldl08bYdDx9iV35pjP0bgzBYsi9RC2ljVCMR/VLIZHRSH6VGRVYZAs0FUsgC/NAO1AEOtZRsJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HZ8vRs3t; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769749652; x=1801285652;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QBbkh3nRpSoVSB7XKqavd86nZFoZrk2X3PDKZYamDps=;
  b=HZ8vRs3tj3RXpu3UrpLgqpKrSfImmU1KmHr5pC7BYl0R8YEkOtE4ijqj
   Oc0BeAr/C5tLZ8KpH1/+1RDY4oU7LTWUXXdd2mifVLkzX4cMnb9xtzExH
   JE0x69nO8oQYuOdSnydg6VpdV7IVX28caTyVeUTsvub9dJ4VqfnBMxNaY
   N/1+81aNRFTGrI6BJSCj30nHG3J254ZBwcjpT1XdS8QCWgnYk9mZoZaVV
   ezkhzovBWZmRWT5EUXOhutxfboKwy0qsm6qxlegF8NMmZ9XslWSk9BmHU
   uaY/Aj/BgoG7reIruqys1fGh7Vp1KOB8nQVSszG+iIC3ebHBSi2BsD6Mc
   Q==;
X-CSE-ConnectionGUID: udtdShX7QFiT9xOo6R9vuw==
X-CSE-MsgGUID: SUTarr1tQ2O7N5sqqm4NLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70898896"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="70898896"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 21:07:32 -0800
X-CSE-ConnectionGUID: D8UqJkqVSzia7pZdgpY16Q==
X-CSE-MsgGUID: OaKE98X2TV6TiqoQ411Bgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="208869549"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Jan 2026 21:07:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlgjA-00000000cCK-0yv9;
	Fri, 30 Jan 2026 05:07:28 +0000
Date: Fri, 30 Jan 2026 13:07:19 +0800
From: kernel test robot <lkp@intel.com>
To: Rory Little <rory@candelatech.com>, Enrico Weigelt <info@metux.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: amd-fch: Return 0-1 range for get operation
Message-ID: <202601301318.t7FyBGAS-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31322-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,git-scm.com:url]
X-Rspamd-Queue-Id: 9300CB730F
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
config: sparc-randconfig-002-20260130 (https://download.01.org/0day-ci/archive/20260130/202601301318.t7FyBGAS-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601301318.t7FyBGAS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601301318.t7FyBGAS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-amd-fch.c: In function 'amd_fch_gpio_get':
>> drivers/gpio/gpio-amd-fch.c:128:8: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     ret = FIELD_GET(AMD_FCH_GPIO_FLAG_READ, readl_relaxed(ptr));
           ^~~~~~~~~
   cc1: some warnings being treated as errors


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

