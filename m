Return-Path: <linux-gpio+bounces-36671-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFXNClcSA2r20AEAu9opvQ
	(envelope-from <linux-gpio+bounces-36671-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 13:43:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8863E51F856
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 13:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A61C30146A1
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 11:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4FC360EC1;
	Tue, 12 May 2026 11:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Twa8I/dV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769B6360EC7
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 11:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778586196; cv=none; b=lxYdY2bz5doB6GZuIol4/lK4oV8k7XTJUToh56VQI+CgV5/tv/PUFZaxv81fsd7Lp+wgxeVsDEisuNXt+LHV4Og14205FZQgIF0RZXO5BF7qbFiTPuOfnFjumxaE8WBYj0mO1ow1SIsXpNpaO9sNo5vVkY8bKefIigyWXNVC31A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778586196; c=relaxed/simple;
	bh=cHNi583fveIkoIuCZ1NChQdDMC+9iflf2Zi2UKvAxyU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OcN+taFmn7+A3069nty251iuXlTUECfcUJe8l93B7j+XBb6A6C12MjkWlvGeCR6TPC55hQACg7jzT4gfMFpyzJPMmTJOzCLUi/FB8tenwiSZhN1Z3QNGN3aXuvkaXpbaNfVrUApCYVcYjBedosCcjQvmX63coSp/5YVOip31j0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Twa8I/dV; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778586194; x=1810122194;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=cHNi583fveIkoIuCZ1NChQdDMC+9iflf2Zi2UKvAxyU=;
  b=Twa8I/dVyzng5P+1MJyPb/VOV9wt6g2SLHElECY4HnEY5vyQ7/SOlIzU
   9XdeD5Vtba62lIriGS5vT2mTEW5XBvJOleh/nmWTxzBAaf9360SxtPlqM
   eBGOgTb8LnK7l2tsOnsVX+tr8yLIVpokg44tTe0iqn/hu6/JSDPwMweT1
   6k3evxLYbt0Nrhysu/ecDYDlwz3bmrD+UH9FYSuhY+pIp8iS+wD0z52wx
   QnumYC7U8u2mBuKJj/wF1gwy5RYXeCEY6wUI/nIeO8DPVjWKdOjcrMlZz
   tXa4FKaE7Bl+1aBoiPNHOjAXcyVr2xxlvPivRTpGF3aYGZvaTXAARk2zE
   Q==;
X-CSE-ConnectionGUID: +Ua14i5tS8S7MYuTPnVqyg==
X-CSE-MsgGUID: 5Wsl2w4HS5G8oalPQ+nzEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79386522"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79386522"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 04:43:14 -0700
X-CSE-ConnectionGUID: cMslZIo4SViHYPyY5+x2Pw==
X-CSE-MsgGUID: Y8/BYk08SF+yxIVsmRTzQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="242712132"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 May 2026 04:43:13 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMlW3-0000000024B-0A6M;
	Tue, 12 May 2026 11:43:11 +0000
Date: Tue, 12 May 2026 19:42:28 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: sodaville: allow COMPILE_TEST builds
Message-ID: <202605121902.NsjonizV-lkp@intel.com>
References: <20260509003327.955942-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509003327.955942-1-rosenp@gmail.com>
X-Rspamd-Queue-Id: 8863E51F856
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
	TAGGED_FROM(0.00)[bounces-36671-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
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
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:mid,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Rosen,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/gpio-sodaville-allow-COMPILE_TEST-builds/20260512-125042
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20260509003327.955942-1-rosenp%40gmail.com
patch subject: [PATCH] gpio: sodaville: allow COMPILE_TEST builds
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260512/202605121902.NsjonizV-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605121902.NsjonizV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605121902.NsjonizV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-sodaville.c:253:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     253 | builtin_pci_driver(sdv_gpio_driver);
         | ^
         | int
>> drivers/gpio/gpio-sodaville.c:253:20: error: a parameter list without types is only allowed in a function definition
     253 | builtin_pci_driver(sdv_gpio_driver);
         |                    ^
   2 errors generated.


vim +/int +253 drivers/gpio/gpio-sodaville.c

b43ab901d671e3 Sebastian Andrzej Siewior 2011-06-27  244  
b43ab901d671e3 Sebastian Andrzej Siewior 2011-06-27  245  static struct pci_driver sdv_gpio_driver = {
6a5ead91d45d09 Paul Gortmaker            2016-05-09  246  	.driver = {
6a5ead91d45d09 Paul Gortmaker            2016-05-09  247  		.suppress_bind_attrs = true,
6a5ead91d45d09 Paul Gortmaker            2016-05-09  248  	},
b43ab901d671e3 Sebastian Andrzej Siewior 2011-06-27  249  	.name = DRV_NAME,
b43ab901d671e3 Sebastian Andrzej Siewior 2011-06-27  250  	.id_table = sdv_gpio_pci_ids,
b43ab901d671e3 Sebastian Andrzej Siewior 2011-06-27  251  	.probe = sdv_gpio_probe,
b43ab901d671e3 Sebastian Andrzej Siewior 2011-06-27  252  };
6a5ead91d45d09 Paul Gortmaker            2016-05-09 @253  builtin_pci_driver(sdv_gpio_driver);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

