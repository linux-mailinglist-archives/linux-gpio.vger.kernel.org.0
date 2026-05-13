Return-Path: <linux-gpio+bounces-36790-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJAnE0nSBGr0PQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36790-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 21:34:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBE853A048
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 21:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5896B303ACC8
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349183B7772;
	Wed, 13 May 2026 19:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZAWS08wG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F94B34A3A5;
	Wed, 13 May 2026 19:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778700865; cv=none; b=lYK9sbxX43fO/+Z1obkGeGWyZNuvOco7BMiloI9TBHxfheuRTo/cr+B6vyvOU1VcnklxLdyPSCmKLczJzdhaaQePg43DwsRovHD95JiOTTqc3lhxjCDhZEpNk/UCu2JGfh+Ozzb13ATbSItdfZYIM48a+JGUhMxY2W3eExNP5H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778700865; c=relaxed/simple;
	bh=DWoo+aWQq1YCynJlpufbLapg9lu1c+L6oooK5vEj6UI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGBB+uRqnizmlrE1HJgJkoGJE3VvNnW0gxaCO5d1RgS+eH4IpDox6VshPghk/IAhPuYwE+n7RMcjO2ZTngOMAHoaMWJ2t4J7/weCeZURSyNFE0Zu4YTKQkPsu5r9095lS/5l37/R9Ws6NZQVSKeXxu0GdpO0Ub9aqZTRfNXFb8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZAWS08wG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778700862; x=1810236862;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DWoo+aWQq1YCynJlpufbLapg9lu1c+L6oooK5vEj6UI=;
  b=ZAWS08wG8NsBHiV9wBgEgZnLaLiF4PRWfcM9TcvcvKiR4OMJfm2FiYHd
   nNKI8+ivbz0k/H3Bi8Ye54g6eY78zmoscv6kNjI5ZKsN/adf4IxypsNMJ
   JTvHnJoFNLrruD0fJEnv49WQRATyIRDKh2mfOO+MyNY+OKAl8dh3Q1KcZ
   aZbrburg6CPDwV9+AEO6PPuOhPE+v/t877HCe0qvfM14O6iYxiXzwfRi9
   SOx6BOHjysZaEiLTvNewyTMFa2jsLdMd7gv0rSrv/d9qRwwtt+PQsAmFK
   pBzqIU/Nrs83Es93HzKOasILeUTH/PGs3jnPsLc/3onF3ADGILBeN0/Jq
   g==;
X-CSE-ConnectionGUID: ps4vFxf1Q5qsmqjq6KbTGA==
X-CSE-MsgGUID: Q6OK76plS5iOrIqCDLR6Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="82205411"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="82205411"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 12:34:22 -0700
X-CSE-ConnectionGUID: kG6pWQ7MTFO6maONVv46hQ==
X-CSE-MsgGUID: HjgUY3S7ScCFqYKhrznmew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="238415587"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 May 2026 12:34:18 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNFLV-000000004xP-1LOC;
	Wed, 13 May 2026 19:34:17 +0000
Date: Thu, 14 May 2026 03:33:26 +0800
From: kernel test robot <lkp@intel.com>
To: Maxwell Doose <m32285159@gmail.com>, linusw@kernel.org, brgl@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: twl4030: Use guard(mutex)() over manual locking
Message-ID: <202605140349.KZOdtI2I-lkp@intel.com>
References: <20260502210354.160439-1-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260502210354.160439-1-m32285159@gmail.com>
X-Rspamd-Queue-Id: DDBE853A048
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36790-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:mid,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,git-scm.com:url,01.org:url]
X-Rspamd-Action: no action

Hi Maxwell,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxwell-Doose/gpio-twl4030-Use-guard-mutex-over-manual-locking/20260513-231548
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20260502210354.160439-1-m32285159%40gmail.com
patch subject: [PATCH] gpio: twl4030: Use guard(mutex)() over manual locking
config: arc-randconfig-002-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140349.KZOdtI2I-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140349.KZOdtI2I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140349.KZOdtI2I-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-twl4030.c: In function 'twl_get':
>> drivers/gpio/gpio-twl4030.c:310:6: warning: unused variable 'ret' [-Wunused-variable]
     int ret;
         ^~~


vim +/ret +310 drivers/gpio/gpio-twl4030.c

e9d359471dfed51 drivers/gpio/twl4030-gpio.c David Brownell 2008-10-20  306  
e9d359471dfed51 drivers/gpio/twl4030-gpio.c David Brownell 2008-10-20  307  static int twl_get(struct gpio_chip *chip, unsigned offset)
e9d359471dfed51 drivers/gpio/twl4030-gpio.c David Brownell 2008-10-20  308  {
231a8680b78260f drivers/gpio/gpio-twl4030.c Linus Walleij  2015-12-07  309  	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
c111feabe2e200b drivers/gpio/gpio-twl4030.c Peter Ujfalusi 2012-12-20 @310  	int ret;
e9d359471dfed51 drivers/gpio/twl4030-gpio.c David Brownell 2008-10-20  311  	int status = 0;
e9d359471dfed51 drivers/gpio/twl4030-gpio.c David Brownell 2008-10-20  312  
b833f746820a65c drivers/gpio/gpio-twl4030.c Maxwell Doose  2026-05-02  313  	guard(mutex)(&priv->mutex);
c111feabe2e200b drivers/gpio/gpio-twl4030.c Peter Ujfalusi 2012-12-20  314  	if (!(priv->usage_count & BIT(offset))) {
b833f746820a65c drivers/gpio/gpio-twl4030.c Maxwell Doose  2026-05-02  315  		return -EPERM;
c111feabe2e200b drivers/gpio/gpio-twl4030.c Peter Ujfalusi 2012-12-20  316  	}
72c7901ef00925c drivers/gpio/gpio-twl4030.c Peter Ujfalusi 2012-12-06  317  
c111feabe2e200b drivers/gpio/gpio-twl4030.c Peter Ujfalusi 2012-12-20  318  	if (priv->direction & BIT(offset))
c111feabe2e200b drivers/gpio/gpio-twl4030.c Peter Ujfalusi 2012-12-20  319  		status = priv->out_state & BIT(offset);
e9d359471dfed51 drivers/gpio/twl4030-gpio.c David Brownell 2008-10-20  320  	else
c111feabe2e200b drivers/gpio/gpio-twl4030.c Peter Ujfalusi 2012-12-20  321  		status = twl4030_get_gpio_datain(offset);
72c7901ef00925c drivers/gpio/gpio-twl4030.c Peter Ujfalusi 2012-12-06  322  
b833f746820a65c drivers/gpio/gpio-twl4030.c Maxwell Doose  2026-05-02  323  	return (status < 0) ? status : !!status;
e9d359471dfed51 drivers/gpio/twl4030-gpio.c David Brownell 2008-10-20  324  }
e9d359471dfed51 drivers/gpio/twl4030-gpio.c David Brownell 2008-10-20  325  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

