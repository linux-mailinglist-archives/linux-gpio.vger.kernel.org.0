Return-Path: <linux-gpio+bounces-34783-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIeoAaf51GmgzQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34783-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:33:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 944D23AE716
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7DE78301B07F
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB023B3C0C;
	Tue,  7 Apr 2026 12:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ThT6lag/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F144F3B388B
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775565214; cv=none; b=e2Fs1yCKT9V9aQIj4ijCQA8buQ71OTVWosdRt1YQfndR2qwVHvukWsKDW1nhV4/h0vKd3iIXQlIkAsLNMvRVIDo1MI+D19n5eK/eTCZyfX4seOOvBEc4xKUOvLT7Dkid1uUpvYX3kWOnDjkWFtn0YfOWpEpFGAs+B1nbDleseFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775565214; c=relaxed/simple;
	bh=D9nm0kOxVQvh8LsRZzCadiHhPKkkiazImHMozTP/cG8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K8+iHoX5CmNkHXNyaSCQmDyzbApdPCESFucHFEZ1p2XUJZckaqbdFCwmT4D9Wkh1hnxRstzGlH1OQtNmJfAxiqqnt+wq3/TWO+5jgbFJHpsLb0LIGz3KGCFu7tb2FngzKdtrrK/yD/Ba8YON2rLLWkTv8hzg2zMjkG6fqtYAIe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ThT6lag/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775565213; x=1807101213;
  h=date:from:to:cc:subject:message-id;
  bh=D9nm0kOxVQvh8LsRZzCadiHhPKkkiazImHMozTP/cG8=;
  b=ThT6lag/0D6dN6qvBGM3Y9VkT8uOOsnwMRWaG29cWLLQdhU20QOg85u3
   ZN+5OmuBn24s0NyxeghVQq2cx6Qvjee1TPKe6JX/hqPqBcRVUnxt4mGnt
   UleLvLd4N6emCEx2XPSpzzeMS39Tkqokez636m0wAJRJ7vM96US4AV7cb
   Nvs0P3k5zgQfYYfryJIEtrdjD42K2LQR6WzbRlXv+1Qo4uXODG4Lr0WvO
   UTsXSQ4dOe66NDApZZ8fR+t6mYsKRXQkeQWWgsh96p05eku3JIydunVsU
   dtR5GGuozjrc2IgvIkANCCVVBVjzhzJ1ogN9hve3Z4dJIa6al5E/zxuJX
   w==;
X-CSE-ConnectionGUID: 9+3duSxuT++oKvXUiBepzA==
X-CSE-MsgGUID: OtdvBwqQRFG5tANN5+XCTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76242840"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76242840"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 05:33:33 -0700
X-CSE-ConnectionGUID: b1j/vQA3RkGzXYakUNOBxA==
X-CSE-MsgGUID: vQ3psq3gTP6K2Q/PyAi8jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="233126882"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Apr 2026 05:33:31 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wA5cW-000000000Zx-0m7j;
	Tue, 07 Apr 2026 12:33:28 +0000
Date: Tue, 07 Apr 2026 20:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>
Subject: [linusw-pinctrl:ib-mux-pinctrl 5/5]
 drivers/pinctrl/pinctrl-generic.c:20:5: error: conflicting types for
 'pinctrl_generic_to_map'; have 'int(struct pinctrl_dev *, struct device_node
 *, struct device_node *, struct pinctrl_map **, unsigned int *, unsigned int
 *, const char **, unsigned int, ...
Message-ID: <202604072013.aI84l57L-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [1.54 / 15.00];
	LONG_SUBJ(2.21)[294];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34783-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,intel.com:dkim,intel.com:email,intel.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,01.org:url]
X-Rspamd-Queue-Id: 944D23AE716
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Frank,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-mux-pinctrl
head:   6ce042f025bd4c46f5d2fd37a048a516433b0b3d
commit: 6ce042f025bd4c46f5d2fd37a048a516433b0b3d [5/5] pinctrl: add generic board-level pinctrl driver using mux framework
config: um-randconfig-r073-20260407 (https://download.01.org/0day-ci/archive/20260407/202604072013.aI84l57L-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604072013.aI84l57L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604072013.aI84l57L-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-generic.c:20:5: error: conflicting types for 'pinctrl_generic_to_map'; have 'int(struct pinctrl_dev *, struct device_node *, struct device_node *, struct pinctrl_map **, unsigned int *, unsigned int *, const char **, unsigned int,  const char **, unsigned int *, unsigned int)'
      20 | int pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/pinctrl/pinctrl-generic.c:16:
   drivers/pinctrl/pinconf.h:187:1: note: previous definition of 'pinctrl_generic_to_map' with type 'int(struct pinctrl_dev *, struct device_node *, struct device_node *, struct pinctrl_map **, unsigned int *, unsigned int *, const char **, unsigned int,  const char **, unsigned int *, void *)'
     187 | pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-generic.c:129:5: error: redefinition of 'pinctrl_generic_pins_function_dt_node_to_map'
     129 | int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinconf.h:178:1: note: previous definition of 'pinctrl_generic_pins_function_dt_node_to_map' with type 'int(struct pinctrl_dev *, struct device_node *, struct pinctrl_map **, unsigned int *)'
     178 | pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +20 drivers/pinctrl/pinctrl-generic.c

43722575e5cdcc6 Conor Dooley 2026-01-20  19  
a26361256c774cc Frank Li     2026-03-27 @20  int pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
a26361256c774cc Frank Li     2026-03-27  21  			   struct device_node *np, struct pinctrl_map **maps,
a26361256c774cc Frank Li     2026-03-27  22  			   unsigned int *num_maps, unsigned int *num_reserved_maps,
a26361256c774cc Frank Li     2026-03-27  23  			   const char **group_names, unsigned int ngroups,
a26361256c774cc Frank Li     2026-03-27  24  			   const char **functions, unsigned int *pins,
a26361256c774cc Frank Li     2026-03-27  25  			   unsigned int npins)
43722575e5cdcc6 Conor Dooley 2026-01-20  26  {
43722575e5cdcc6 Conor Dooley 2026-01-20  27  	struct device *dev = pctldev->dev;
a26361256c774cc Frank Li     2026-03-27  28  	unsigned int num_configs;
43722575e5cdcc6 Conor Dooley 2026-01-20  29  	const char *group_name;
43722575e5cdcc6 Conor Dooley 2026-01-20  30  	unsigned long *configs;
a26361256c774cc Frank Li     2026-03-27  31  	int ret, reserve = 1;
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
43722575e5cdcc6 Conor Dooley 2026-01-20  74  

:::::: The code at line 20 was first introduced by commit
:::::: a26361256c774cc1f36979ab440cb9d83a9f8e48 pinctrl: extract pinctrl_generic_to_map() from pinctrl_generic_pins_function_dt_node_to_map()

:::::: TO: Frank Li <Frank.Li@nxp.com>
:::::: CC: Linus Walleij <linusw@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

