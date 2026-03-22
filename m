Return-Path: <linux-gpio+bounces-33982-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FNfGqyVv2kU6gMAu9opvQ
	(envelope-from <linux-gpio+bounces-33982-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Mar 2026 08:09:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECA72E876F
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Mar 2026 08:09:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C82E30120F9
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Mar 2026 07:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09D134B190;
	Sun, 22 Mar 2026 07:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WC97eaiT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E5A1A6812;
	Sun, 22 Mar 2026 07:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774163366; cv=none; b=jftlRzsQ6eLChlJCIgtnMeWlviVeusi/q/TuiwO84x9kGHDx2/6TEpRkH/SlJPgr9oR/X9Ov7K7HM8rVQcfT4pP/yj/lIbAEk44AaR3bSCLzlL9D9r7wiAxhNoyaK5Gyl+cPJ+3lvRXzu87SJhvVpq2vJCZpXa32TKhZO+Cq2m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774163366; c=relaxed/simple;
	bh=cvo2xLFk+OeqhoJ1yirX9bfQVvLqT7AwT3VPJIrd24s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VkpSx15g+wIFKNMv7LwDaX41ea64MAp/ndqm/ohZCTe/ASphdt6MV8j7QLieyPb6XZ/jlkzvEQh3xgl72lofBtjNYayd6UYzS+ITc6uQyPf891T1apjzM9HZ90NSX15Bvzs+F4pqLTa7C5/fq7odpXiF3y1JrVUzYwBZstiNIXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WC97eaiT; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774163364; x=1805699364;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cvo2xLFk+OeqhoJ1yirX9bfQVvLqT7AwT3VPJIrd24s=;
  b=WC97eaiTS9rAPJnLwMiUMxMgGmEjyIDJ1X2+Uz4JQvPHFoJyAQ+oe8vE
   u36BNPgaGxLZgh4J8vyvsgZeYRw6fg/kUWGlnDkWftsfMUnCpikRWEdv4
   XZSau81ExHkesCGNTnJ9w0Xq3bc62OlGcbhG8ZTo//XW+xoQAMErEgljM
   Na50T38WnOPZPaKpo8sAJImlBXrbQLhaZPgXZd1P6ylcgg3yMBvMQHy5O
   6SktiC9aclSv2GLRZdi6LYFpfH36k9bigF+VoPoQ4QCpornxoO5nv+pix
   VzOjQtnUtbKG+WDcfuMPXp2wle+7gAaAxDB8LJ/EXkETStJOrqbPlLQSn
   g==;
X-CSE-ConnectionGUID: M2+V3rjZThutSRj0etJS6w==
X-CSE-MsgGUID: eJzeh12eQK2rHEPfDLhwew==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="62753122"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="62753122"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 00:09:23 -0700
X-CSE-ConnectionGUID: uGpAxqcVRJu5Y6kLDaYgMg==
X-CSE-MsgGUID: c+yYCE5zTrag1jC6KknOxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="247625971"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Mar 2026 00:09:20 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4CvN-000000001o9-3M3H;
	Sun, 22 Mar 2026 07:08:50 +0000
Date: Sun, 22 Mar 2026 15:07:15 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>, Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	arm-scmi@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v5 1/7] pinctrl: introduce pinctrl_gpio_get_config()
Message-ID: <202603221553.6g9sSgFm-lkp@intel.com>
References: <f7a41ed017fba4a0986ffe72e06933cc1bba2406.1774087290.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7a41ed017fba4a0986ffe72e06933cc1bba2406.1774087290.git.dan.carpenter@linaro.org>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33982-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid,01.org:url,git-scm.com:url]
X-Rspamd-Queue-Id: 8ECA72E876F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dan,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next brgl/gpio/for-next linus/master v7.0-rc4 next-20260320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Carpenter/pinctrl-introduce-pinctrl_gpio_get_config/20260321-225727
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/f7a41ed017fba4a0986ffe72e06933cc1bba2406.1774087290.git.dan.carpenter%40linaro.org
patch subject: [PATCH v5 1/7] pinctrl: introduce pinctrl_gpio_get_config()
config: loongarch-loongson32_defconfig (https://download.01.org/0day-ci/archive/20260322/202603221553.6g9sSgFm-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603221553.6g9sSgFm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603221553.6g9sSgFm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/core.c:961:8: error: call to undeclared function 'pin_config_get_for_pin'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     961 |         ret = pin_config_get_for_pin(pctldev, pin, config);
         |               ^
   1 error generated.


vim +/pin_config_get_for_pin +961 drivers/pinctrl/core.c

   941	
   942	/**
   943	 * pinctrl_gpio_get_config() - Get the config for a given GPIO pin
   944	 * @gc: GPIO chip structure from the GPIO subsystem
   945	 * @offset: hardware offset of the GPIO relative to the controller
   946	 * @config: the configuration to query.  On success it holds the result
   947	 * Return: 0 on success, negative errno otherwise
   948	 */
   949	int pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset, unsigned long *config)
   950	{
   951		struct pinctrl_gpio_range *range;
   952		struct pinctrl_dev *pctldev;
   953		int ret, pin;
   954	
   955		ret = pinctrl_get_device_gpio_range(gc, offset, &pctldev, &range);
   956		if (ret)
   957			return ret;
   958	
   959		mutex_lock(&pctldev->mutex);
   960		pin = gpio_to_pin(range, gc, offset);
 > 961		ret = pin_config_get_for_pin(pctldev, pin, config);
   962		mutex_unlock(&pctldev->mutex);
   963	
   964		if (ret)
   965			return ret;
   966	
   967		*config = pinconf_to_config_argument(*config);
   968		return 0;
   969	}
   970	EXPORT_SYMBOL_GPL(pinctrl_gpio_get_config);
   971	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

