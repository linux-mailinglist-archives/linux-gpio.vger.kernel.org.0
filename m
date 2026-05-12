Return-Path: <linux-gpio+bounces-36698-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNqCGSCKA2pN7AEAu9opvQ
	(envelope-from <linux-gpio+bounces-36698-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 22:14:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BD5528FE9
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 22:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B4463051BEE
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 20:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B363ACEFF;
	Tue, 12 May 2026 20:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UcTxjZPi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8D33AD511
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 20:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778616847; cv=none; b=ruZEMYa9nHNA+Cyxqm/7V4VQ6hRuMxJi4rlhXUz9NtX4ui07QvZ4mnLo7EJnptj6rJy3oTBLEelxuKILhqN5psQ/x08yUDD20u7KuTBqg2+jPdzV3GiIeHieNCVT8bpV4mNdRwGuKT7X22K5JQ6JK8ogJJqxE1h9xBjyFsMhAU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778616847; c=relaxed/simple;
	bh=88xQleIJXK6IokQkniWArbJM5+3tw1S5di3yHlTUDpQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DNGAMYyosvmGEaSshIDNzFPbuPrhNdbIfULC6pjYjNjyvBmugWvnL8eqDmgccplqMjcDIO66rTWY4pVJduxpr+sXwbStmA3b91MjOcs+YWmdfdKMJTM0b3F/c2GNhx53A8rNRjwDgfqI3AXT3j51zIi1XTwH3umlreoTa/ySQzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UcTxjZPi; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778616845; x=1810152845;
  h=date:from:to:cc:subject:message-id;
  bh=88xQleIJXK6IokQkniWArbJM5+3tw1S5di3yHlTUDpQ=;
  b=UcTxjZPim4ayUNGEcRzd+mwtppaKxap9C4Gi2SnvPXTp4oe0x9vQsW3c
   3INMcxmweEkSkPTUnUja71V+tpgIlsAEADTJOWGsjaRtkJpIPz5uSyWN3
   SCssDBWfmTL6CfqEZTcK1m0CrE1wX9TiE/NqKm3brxCwFhhIEIM2I6Ti7
   BLcFrpd+aQg5baOEDREaRVNyCRql6lbdv8nrG9GkmBrm+FcoO/T4YgpwL
   U4IqWhJnkO98ArzwEinFSR6G04dSZ5WgI1f1fHLwtL2zSQqPyXZWouHGD
   SJnKxV1mK/Lpu8Yf5apFMM9UyxnMcfWMwIe29bOa12FOmrhZsRt4kunFU
   Q==;
X-CSE-ConnectionGUID: FDzvwafzRQCAz5aYqao5bQ==
X-CSE-MsgGUID: W/axfI6bRRSzp0FOY+xPsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="78680851"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="78680851"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 13:14:05 -0700
X-CSE-ConnectionGUID: JZEosLEBT4ukM8jMXztaXw==
X-CSE-MsgGUID: WCkqrYAtTHi76FyNpTgtyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="238116535"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 May 2026 13:14:03 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMtUO-000000002kF-0S8i;
	Tue, 12 May 2026 20:14:00 +0000
Date: Wed, 13 May 2026 04:13:30 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>
Subject: [linusw-pinctrl:ib-mux-pinctrl 5/6]
 drivers/pinctrl/pinctrl-generic.c:20:5: error: conflicting types for
 'pinctrl_generic_to_map'; have 'int(struct pinctrl_dev *, struct device_node
 *, struct device_node *, struct pinctrl_map **, unsigned int *, unsigned int
 *, const char **, unsigned int, ...
Message-ID: <202605130440.GUAAk0kl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 07BD5528FE9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	LONG_SUBJ(2.21)[294];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36698-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,intel.com:mid,intel.com:dkim,01.org:url,nxp.com:email]
X-Rspamd-Action: no action

Hi Frank,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-mux-pinctrl
head:   d8074fd57a0231457e580c1f6cd33f089f09fd12
commit: 34acc5a8adfb76f2de63c8b8317397fb72b0aec8 [5/6] pinctrl: add generic board-level pinctrl driver using mux framework
config: sh-randconfig-r131-20260513 (https://download.01.org/0day-ci/archive/20260513/202605130440.GUAAk0kl-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130440.GUAAk0kl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605130440.GUAAk0kl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-generic.c:20:5: error: conflicting types for 'pinctrl_generic_to_map'; have 'int(struct pinctrl_dev *, struct device_node *, struct device_node *, struct pinctrl_map **, unsigned int *, unsigned int *, const char **, unsigned int,  const char **, unsigned int *, unsigned int)'
      20 | int pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/pinctrl/pinctrl-generic.c:16:
   drivers/pinctrl/pinconf.h:193:1: note: previous definition of 'pinctrl_generic_to_map' with type 'int(struct pinctrl_dev *, struct device_node *, struct device_node *, struct pinctrl_map **, unsigned int *, unsigned int *, const char **, unsigned int,  const char **, unsigned int *, void *)'
     193 | pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-generic.c:130:5: error: redefinition of 'pinctrl_generic_pins_function_dt_node_to_map'
     130 | int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinconf.h:184:1: note: previous definition of 'pinctrl_generic_pins_function_dt_node_to_map' with type 'int(struct pinctrl_dev *, struct device_node *, struct pinctrl_map **, unsigned int *)'
     184 | pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/pinctrl-generic-mux.c:59:65: sparse: sparse: Using plain integer as NULL pointer

vim +20 drivers/pinctrl/pinctrl-generic.c

43722575e5cdcc6 Conor Dooley 2026-01-20  19  
aaaf31be0426031 Frank Li     2026-05-04 @20  int pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
aaaf31be0426031 Frank Li     2026-05-04  21  			   struct device_node *np, struct pinctrl_map **maps,
aaaf31be0426031 Frank Li     2026-05-04  22  			   unsigned int *num_maps, unsigned int *num_reserved_maps,
aaaf31be0426031 Frank Li     2026-05-04  23  			   const char **group_names, unsigned int ngroups,
aaaf31be0426031 Frank Li     2026-05-04  24  			   const char **functions, unsigned int *pins,
aaaf31be0426031 Frank Li     2026-05-04  25  			   unsigned int npins)
43722575e5cdcc6 Conor Dooley 2026-01-20  26  {
43722575e5cdcc6 Conor Dooley 2026-01-20  27  	struct device *dev = pctldev->dev;
aaaf31be0426031 Frank Li     2026-05-04  28  	unsigned int num_configs;
43722575e5cdcc6 Conor Dooley 2026-01-20  29  	const char *group_name;
43722575e5cdcc6 Conor Dooley 2026-01-20  30  	unsigned long *configs;
aaaf31be0426031 Frank Li     2026-05-04  31  	int ret, reserve = 1;
43722575e5cdcc6 Conor Dooley 2026-01-20  32  
43722575e5cdcc6 Conor Dooley 2026-01-20  33  	group_name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", parent, np);
43722575e5cdcc6 Conor Dooley 2026-01-20  34  	if (!group_name)
43722575e5cdcc6 Conor Dooley 2026-01-20  35  		return -ENOMEM;
43722575e5cdcc6 Conor Dooley 2026-01-20  36  
43722575e5cdcc6 Conor Dooley 2026-01-20  37  	group_names[ngroups] = group_name;
43722575e5cdcc6 Conor Dooley 2026-01-20  38  
43722575e5cdcc6 Conor Dooley 2026-01-20  39  	ret = pinctrl_utils_reserve_map(pctldev, maps, num_reserved_maps, num_maps, reserve);
43722575e5cdcc6 Conor Dooley 2026-01-20  40  	if (ret)
43722575e5cdcc6 Conor Dooley 2026-01-20  41  		return ret;
43722575e5cdcc6 Conor Dooley 2026-01-20  42  
43722575e5cdcc6 Conor Dooley 2026-01-20  43  	ret = pinctrl_utils_add_map_mux(pctldev, maps, num_reserved_maps, num_maps, group_name,
43722575e5cdcc6 Conor Dooley 2026-01-20  44  					parent->name);
43722575e5cdcc6 Conor Dooley 2026-01-20  45  	if (ret < 0)
43722575e5cdcc6 Conor Dooley 2026-01-20  46  		return ret;
43722575e5cdcc6 Conor Dooley 2026-01-20  47  
43722575e5cdcc6 Conor Dooley 2026-01-20  48  	ret = pinctrl_generic_add_group(pctldev, group_name, pins, npins, functions);
43722575e5cdcc6 Conor Dooley 2026-01-20  49  	if (ret < 0)
43722575e5cdcc6 Conor Dooley 2026-01-20  50  		return dev_err_probe(dev, ret, "failed to add group %s: %d\n",
43722575e5cdcc6 Conor Dooley 2026-01-20  51  				     group_name, ret);
43722575e5cdcc6 Conor Dooley 2026-01-20  52  
43722575e5cdcc6 Conor Dooley 2026-01-20  53  	ret = pinconf_generic_parse_dt_config(np, pctldev, &configs, &num_configs);
43722575e5cdcc6 Conor Dooley 2026-01-20  54  	if (ret)
43722575e5cdcc6 Conor Dooley 2026-01-20  55  		return dev_err_probe(dev, ret, "failed to parse pin config of group %s\n",
43722575e5cdcc6 Conor Dooley 2026-01-20  56  			group_name);
43722575e5cdcc6 Conor Dooley 2026-01-20  57  
43722575e5cdcc6 Conor Dooley 2026-01-20  58  	if (num_configs == 0)
43722575e5cdcc6 Conor Dooley 2026-01-20  59  		return 0;
43722575e5cdcc6 Conor Dooley 2026-01-20  60  
43722575e5cdcc6 Conor Dooley 2026-01-20  61  	ret = pinctrl_utils_reserve_map(pctldev, maps, num_reserved_maps, num_maps, reserve);
43722575e5cdcc6 Conor Dooley 2026-01-20  62  	if (ret)
43722575e5cdcc6 Conor Dooley 2026-01-20  63  		return ret;
43722575e5cdcc6 Conor Dooley 2026-01-20  64  
43722575e5cdcc6 Conor Dooley 2026-01-20  65  	ret = pinctrl_utils_add_map_configs(pctldev, maps, num_reserved_maps, num_maps, group_name,
43722575e5cdcc6 Conor Dooley 2026-01-20  66  					    configs,
43722575e5cdcc6 Conor Dooley 2026-01-20  67  			num_configs, PIN_MAP_TYPE_CONFIGS_GROUP);
43722575e5cdcc6 Conor Dooley 2026-01-20  68  	kfree(configs);
43722575e5cdcc6 Conor Dooley 2026-01-20  69  	if (ret)
43722575e5cdcc6 Conor Dooley 2026-01-20  70  		return ret;
43722575e5cdcc6 Conor Dooley 2026-01-20  71  
43722575e5cdcc6 Conor Dooley 2026-01-20  72  	return 0;
43722575e5cdcc6 Conor Dooley 2026-01-20  73  };
aaaf31be0426031 Frank Li     2026-05-04  74  EXPORT_SYMBOL_GPL(pinctrl_generic_to_map);
aaaf31be0426031 Frank Li     2026-05-04  75  

:::::: The code at line 20 was first introduced by commit
:::::: aaaf31be04260316036f50a05b7d015c0d36b55a pinctrl: extract pinctrl_generic_to_map() from pinctrl_generic_pins_function_dt_node_to_map()

:::::: TO: Frank Li <Frank.Li@nxp.com>
:::::: CC: Linus Walleij <linusw@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

