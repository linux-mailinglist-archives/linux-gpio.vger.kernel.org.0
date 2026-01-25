Return-Path: <linux-gpio+bounces-31039-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eC9WFvGPdWkcGQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31039-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Jan 2026 04:37:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F147F9E5
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Jan 2026 04:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 760C83031319
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Jan 2026 03:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF97522256F;
	Sun, 25 Jan 2026 03:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gfhp9fkd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023A0220698;
	Sun, 25 Jan 2026 03:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769312149; cv=none; b=br4cjkICjQsoJQXvCHuWKXyEbeKzSCdHwUttZhvhjAGfW326u7X9d8NoYWdoVFpc98N+mEQuzCBEIBvHVlQbSuxhyKGBDgHkLHi3PTEgZuGorEtdbmeFkTn4akpufgNUUtZTG9nmua3/az3y6eNoyht6pWQzDNkoUtbGJWZybJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769312149; c=relaxed/simple;
	bh=JQsEoEhcC6Fa65vcPyk1EB2QxzTkYGIcCTd96/um7l8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GyFTLADDgg7jeTbvuY3tsNv5M9+GIqI43RarLFexs6fLHYS558g3y0ti+6bcCy/9fYgFJwpYEfYiQmBrBChQdRV0gAQera5FvNWfoEPi3Eq2KNnSH/9OYyaVnHIysf0nf0g94X/MtTRItGDKIIdgcwZMfITsyHGmJ+t9A4gl9mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gfhp9fkd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769312148; x=1800848148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JQsEoEhcC6Fa65vcPyk1EB2QxzTkYGIcCTd96/um7l8=;
  b=gfhp9fkdgCXgXZ/V9peFomz+I1gIqMn+X2QeNcVqUdD3athoO3F/4HQy
   7afOND45XyzXqsZvamY3O3gmekqK2K5g1m7yEGi6Ubzlf/Iugvsz/OpyF
   T9IOadA+JHvev6goVMrX+qUzCgrbyfdH2kY6S4bWX8+sqUS0IWv6BWfYt
   AoWBPIT7DnhzRYil2mNrUjxrCtgCJgF5Yi4HbP18shu90SjFNB04wce7D
   uE/+6gn2DrfTCbvhiysNrjmd0OJSgYABzX/7flR7t2gNDlWRykKd/xX0Y
   cUyYKVNeUf26ompm7S1XV6M4y4eiZOfLaUUWdOcFNkzzz0YdfDshm8IqJ
   w==;
X-CSE-ConnectionGUID: /s+GfUDaQfuaguzjyKzcEQ==
X-CSE-MsgGUID: 1oznLpuQRLG/tRYiqq7qxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="81887362"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="81887362"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 19:35:46 -0800
X-CSE-ConnectionGUID: p9J6Em+ARi27w2zGUpiipw==
X-CSE-MsgGUID: BcSlIp6QRVyQADtTe9wmkA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Jan 2026 19:35:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjqud-00000000Vis-0UMk;
	Sun, 25 Jan 2026 03:35:43 +0000
Date: Sun, 25 Jan 2026 11:35:30 +0800
From: kernel test robot <lkp@intel.com>
To: Yuhao Huang <nekowong743@gmail.com>, linux-gpio@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org, brgl@bgdev.pl,
	linux-kernel@vger.kernel.org, Yuhao Huang <nekowong743@gmail.com>
Subject: Re: [PATCH] gpio: virtuser: fix UAF in configfs release path
Message-ID: <202601251126.ywFiWrat-lkp@intel.com>
References: <20260124162111.3945666-1-nekowong743@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124162111.3945666-1-nekowong743@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,linaro.org,bgdev.pl,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31039-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,01.org:url,git-scm.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D5F147F9E5
X-Rspamd-Action: no action

Hi Yuhao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.19-rc6 next-20260123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuhao-Huang/gpio-virtuser-fix-UAF-in-configfs-release-path/20260125-002359
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20260124162111.3945666-1-nekowong743%40gmail.com
patch subject: [PATCH] gpio: virtuser: fix UAF in configfs release path
config: m68k-randconfig-r073-20260125 (https://download.01.org/0day-ci/archive/20260125/202601251126.ywFiWrat-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601251126.ywFiWrat-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-virtuser.c:1685 gpio_virtuser_device_config_group_release() warn: inconsistent indenting

vim +1685 drivers/gpio/gpio-virtuser.c

  1680	
  1681	static void gpio_virtuser_device_config_group_release(struct config_item *item)
  1682	{
  1683		struct gpio_virtuser_device *dev = to_gpio_virtuser_device(item);
  1684	
> 1685	    scoped_guard(mutex, &dev->lock) {
  1686	        if (gpio_virtuser_device_is_live(dev))
  1687	            gpio_virtuser_device_deactivate(dev);
  1688	    }
  1689	
  1690		mutex_destroy(&dev->lock);
  1691		ida_free(&gpio_virtuser_ida, dev->id);
  1692		kfree(dev);
  1693	}
  1694	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

