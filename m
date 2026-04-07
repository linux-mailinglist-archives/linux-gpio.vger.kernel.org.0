Return-Path: <linux-gpio+bounces-34817-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mC0yOlET1Wm30AcAu9opvQ
	(envelope-from <linux-gpio+bounces-34817-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 16:23:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E6C3AFF34
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 16:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DBF930EBD82
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 14:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F513BA25E;
	Tue,  7 Apr 2026 14:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8hk2N+3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFC23B8BA8
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 14:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775571379; cv=none; b=MHvbG2PPzYy0SWhJweuFIYCFw69VMB5Jl9N2vXAY7doPl2lVenlmge1oXkMsXTUVgNGAaIkaJcZnB9M2F6nVYxCqHT8z235sPt0Ajn8JOFpac+uRQ/+PxtY//5QqPbvPry2B5MWrIfNR9vcF5OKQZctZda0hZ6iBYl5jN2V+u/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775571379; c=relaxed/simple;
	bh=Y2zc93GYMf/qfvIwIifyEMNfZh7UxszmZx8Dw/tBf40=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cB+KLfBF990FbbyEXcSv2kLJoTsKubeGhQ+hat0wJ8j3VjZECtDnzdF2rga2OozxiGXuKnKKRKNYqQ0giHABfMO46WkgUyabt9eG9t2MIBazIsc2u8JfdoDjl+makfzfI4Xf8JMGKoBYVgZh7utVWXhjoglLtQA3xJv1rDlIHgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8hk2N+3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775571377; x=1807107377;
  h=date:from:to:cc:subject:message-id;
  bh=Y2zc93GYMf/qfvIwIifyEMNfZh7UxszmZx8Dw/tBf40=;
  b=U8hk2N+3DLuLXw2CMtMwq9HA+pi24J0iU2dF7U9PUiE5Qrg+kRCyw4bA
   g1wizNPapTA1rwq5ch/wIp0hKmnKTrentaux0juwN9YrGv/nfOKvLxDb2
   7Ae2bQA4/4HU9ol0tEJSFSWJFDfvXp0LEk7aiwW+oDneftqFCAE/BtLa0
   Q7pdf7yRTEhdaMciMlG7/bAoocO5wmM9a0YuMc/vPERhcx+qHVjklZPrv
   2lrQm9QzqIq5lP/b6k39deW2IUp1copssiSvrLhpBHsF9VrNJFSPvtudX
   j6BC+HOS5PUTThVTA2xbrZLdaVFYdkVq1xSRvr7v5jYY7xrVGdEgCIq6f
   A==;
X-CSE-ConnectionGUID: gw4TAjkPTSySGTc5/z2alA==
X-CSE-MsgGUID: 1bFM9tJ9TgiJND6Gi1biHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76433224"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76433224"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 07:16:17 -0700
X-CSE-ConnectionGUID: 8wshVjpqSYC/USm3WYMIRw==
X-CSE-MsgGUID: aO3UM4cIS7GXIrUB9/jO0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="228112387"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Apr 2026 07:16:15 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wA7Dv-000000000fh-3TbX;
	Tue, 07 Apr 2026 14:16:11 +0000
Date: Tue, 07 Apr 2026 22:15:31 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>
Subject: [linusw-pinctrl:ib-mux-pinctrl 5/5]
 drivers/pinctrl/pinctrl-generic.c:20:5: error: conflicting types for
 'pinctrl_generic_to_map'
Message-ID: <202604072217.T0yi6ztI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34817-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid,nxp.com:email,01.org:url]
X-Rspamd-Queue-Id: 17E6C3AFF34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-mux-pinctrl
head:   6ce042f025bd4c46f5d2fd37a048a516433b0b3d
commit: 6ce042f025bd4c46f5d2fd37a048a516433b0b3d [5/5] pinctrl: add generic board-level pinctrl driver using mux framework
config: x86_64-randconfig-r071-20260407 (https://download.01.org/0day-ci/archive/20260407/202604072217.T0yi6ztI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604072217.T0yi6ztI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604072217.T0yi6ztI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-generic.c:20:5: error: conflicting types for 'pinctrl_generic_to_map'
      20 | int pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
         |     ^
   drivers/pinctrl/pinconf.h:187:1: note: previous definition is here
     187 | pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
         | ^
>> drivers/pinctrl/pinctrl-generic.c:119:28: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'void *' [-Wint-conversion]
     119 |                                       functions, pins, npins);
         |                                                        ^~~~~
   drivers/pinctrl/pinconf.h:192:16: note: passing argument to parameter 'function_data' here
     192 |                        void *function_data)
         |                              ^
>> drivers/pinctrl/pinctrl-generic.c:129:5: error: redefinition of 'pinctrl_generic_pins_function_dt_node_to_map'
     129 | int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
         |     ^
   drivers/pinctrl/pinconf.h:178:1: note: previous definition is here
     178 | pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
         | ^
   3 errors generated.


vim +/pinctrl_generic_to_map +20 drivers/pinctrl/pinctrl-generic.c

43722575e5cdcc6 Conor Dooley 2026-01-20   19  
a26361256c774cc Frank Li     2026-03-27  @20  int pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
a26361256c774cc Frank Li     2026-03-27   21  			   struct device_node *np, struct pinctrl_map **maps,
a26361256c774cc Frank Li     2026-03-27   22  			   unsigned int *num_maps, unsigned int *num_reserved_maps,
a26361256c774cc Frank Li     2026-03-27   23  			   const char **group_names, unsigned int ngroups,
a26361256c774cc Frank Li     2026-03-27   24  			   const char **functions, unsigned int *pins,
a26361256c774cc Frank Li     2026-03-27   25  			   unsigned int npins)
43722575e5cdcc6 Conor Dooley 2026-01-20   26  {
43722575e5cdcc6 Conor Dooley 2026-01-20   27  	struct device *dev = pctldev->dev;
a26361256c774cc Frank Li     2026-03-27   28  	unsigned int num_configs;
43722575e5cdcc6 Conor Dooley 2026-01-20   29  	const char *group_name;
43722575e5cdcc6 Conor Dooley 2026-01-20   30  	unsigned long *configs;
a26361256c774cc Frank Li     2026-03-27   31  	int ret, reserve = 1;
43722575e5cdcc6 Conor Dooley 2026-01-20   32  
43722575e5cdcc6 Conor Dooley 2026-01-20   33  	group_name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", parent, np);
43722575e5cdcc6 Conor Dooley 2026-01-20   34  	if (!group_name)
43722575e5cdcc6 Conor Dooley 2026-01-20   35  		return -ENOMEM;
43722575e5cdcc6 Conor Dooley 2026-01-20   36  
43722575e5cdcc6 Conor Dooley 2026-01-20   37  	group_names[ngroups] = group_name;
43722575e5cdcc6 Conor Dooley 2026-01-20   38  
43722575e5cdcc6 Conor Dooley 2026-01-20   39  	ret = pinctrl_utils_reserve_map(pctldev, maps, num_reserved_maps, num_maps, reserve);
43722575e5cdcc6 Conor Dooley 2026-01-20   40  	if (ret)
43722575e5cdcc6 Conor Dooley 2026-01-20   41  		return ret;
43722575e5cdcc6 Conor Dooley 2026-01-20   42  
43722575e5cdcc6 Conor Dooley 2026-01-20   43  	ret = pinctrl_utils_add_map_mux(pctldev, maps, num_reserved_maps, num_maps, group_name,
43722575e5cdcc6 Conor Dooley 2026-01-20   44  					parent->name);
43722575e5cdcc6 Conor Dooley 2026-01-20   45  	if (ret < 0)
43722575e5cdcc6 Conor Dooley 2026-01-20   46  		return ret;
43722575e5cdcc6 Conor Dooley 2026-01-20   47  
43722575e5cdcc6 Conor Dooley 2026-01-20   48  	ret = pinctrl_generic_add_group(pctldev, group_name, pins, npins, functions);
43722575e5cdcc6 Conor Dooley 2026-01-20   49  	if (ret < 0)
43722575e5cdcc6 Conor Dooley 2026-01-20   50  		return dev_err_probe(dev, ret, "failed to add group %s: %d\n",
43722575e5cdcc6 Conor Dooley 2026-01-20   51  				     group_name, ret);
43722575e5cdcc6 Conor Dooley 2026-01-20   52  
43722575e5cdcc6 Conor Dooley 2026-01-20   53  	ret = pinconf_generic_parse_dt_config(np, pctldev, &configs, &num_configs);
43722575e5cdcc6 Conor Dooley 2026-01-20   54  	if (ret)
43722575e5cdcc6 Conor Dooley 2026-01-20   55  		return dev_err_probe(dev, ret, "failed to parse pin config of group %s\n",
43722575e5cdcc6 Conor Dooley 2026-01-20   56  			group_name);
43722575e5cdcc6 Conor Dooley 2026-01-20   57  
43722575e5cdcc6 Conor Dooley 2026-01-20   58  	if (num_configs == 0)
43722575e5cdcc6 Conor Dooley 2026-01-20   59  		return 0;
43722575e5cdcc6 Conor Dooley 2026-01-20   60  
43722575e5cdcc6 Conor Dooley 2026-01-20   61  	ret = pinctrl_utils_reserve_map(pctldev, maps, num_reserved_maps, num_maps, reserve);
43722575e5cdcc6 Conor Dooley 2026-01-20   62  	if (ret)
43722575e5cdcc6 Conor Dooley 2026-01-20   63  		return ret;
43722575e5cdcc6 Conor Dooley 2026-01-20   64  
43722575e5cdcc6 Conor Dooley 2026-01-20   65  	ret = pinctrl_utils_add_map_configs(pctldev, maps, num_reserved_maps, num_maps, group_name,
43722575e5cdcc6 Conor Dooley 2026-01-20   66  					    configs,
43722575e5cdcc6 Conor Dooley 2026-01-20   67  			num_configs, PIN_MAP_TYPE_CONFIGS_GROUP);
43722575e5cdcc6 Conor Dooley 2026-01-20   68  	kfree(configs);
43722575e5cdcc6 Conor Dooley 2026-01-20   69  	if (ret)
43722575e5cdcc6 Conor Dooley 2026-01-20   70  		return ret;
43722575e5cdcc6 Conor Dooley 2026-01-20   71  
43722575e5cdcc6 Conor Dooley 2026-01-20   72  	return 0;
43722575e5cdcc6 Conor Dooley 2026-01-20   73  };
43722575e5cdcc6 Conor Dooley 2026-01-20   74  
a26361256c774cc Frank Li     2026-03-27   75  static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *pctldev,
a26361256c774cc Frank Li     2026-03-27   76  							   struct device_node *parent,
a26361256c774cc Frank Li     2026-03-27   77  							   struct device_node *np,
a26361256c774cc Frank Li     2026-03-27   78  							   struct pinctrl_map **maps,
a26361256c774cc Frank Li     2026-03-27   79  							   unsigned int *num_maps,
a26361256c774cc Frank Li     2026-03-27   80  							   unsigned int *num_reserved_maps,
a26361256c774cc Frank Li     2026-03-27   81  							   const char **group_names,
a26361256c774cc Frank Li     2026-03-27   82  							   unsigned int ngroups)
a26361256c774cc Frank Li     2026-03-27   83  {
a26361256c774cc Frank Li     2026-03-27   84  	struct device *dev = pctldev->dev;
a26361256c774cc Frank Li     2026-03-27   85  	unsigned int pin, *pins;
a26361256c774cc Frank Li     2026-03-27   86  	const char **functions;
a26361256c774cc Frank Li     2026-03-27   87  	int npins, ret;
a26361256c774cc Frank Li     2026-03-27   88  
a26361256c774cc Frank Li     2026-03-27   89  	npins = of_property_count_u32_elems(np, "pins");
a26361256c774cc Frank Li     2026-03-27   90  
a26361256c774cc Frank Li     2026-03-27   91  	if (npins < 1) {
a26361256c774cc Frank Li     2026-03-27   92  		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
a26361256c774cc Frank Li     2026-03-27   93  			parent, np, npins);
a26361256c774cc Frank Li     2026-03-27   94  		return npins;
a26361256c774cc Frank Li     2026-03-27   95  	}
a26361256c774cc Frank Li     2026-03-27   96  
a26361256c774cc Frank Li     2026-03-27   97  	pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
a26361256c774cc Frank Li     2026-03-27   98  	if (!pins)
a26361256c774cc Frank Li     2026-03-27   99  		return -ENOMEM;
a26361256c774cc Frank Li     2026-03-27  100  
a26361256c774cc Frank Li     2026-03-27  101  	functions = devm_kcalloc(dev, npins, sizeof(*functions), GFP_KERNEL);
a26361256c774cc Frank Li     2026-03-27  102  	if (!functions)
a26361256c774cc Frank Li     2026-03-27  103  		return -ENOMEM;
a26361256c774cc Frank Li     2026-03-27  104  
a26361256c774cc Frank Li     2026-03-27  105  	for (int i = 0; i < npins; i++) {
a26361256c774cc Frank Li     2026-03-27  106  		ret = of_property_read_u32_index(np, "pins", i, &pin);
a26361256c774cc Frank Li     2026-03-27  107  		if (ret)
a26361256c774cc Frank Li     2026-03-27  108  			return ret;
a26361256c774cc Frank Li     2026-03-27  109  
a26361256c774cc Frank Li     2026-03-27  110  		pins[i] = pin;
a26361256c774cc Frank Li     2026-03-27  111  
a26361256c774cc Frank Li     2026-03-27  112  		ret = of_property_read_string(np, "function", &functions[i]);
a26361256c774cc Frank Li     2026-03-27  113  		if (ret)
a26361256c774cc Frank Li     2026-03-27  114  			return ret;
a26361256c774cc Frank Li     2026-03-27  115  	}
a26361256c774cc Frank Li     2026-03-27  116  
a26361256c774cc Frank Li     2026-03-27  117  	return pinctrl_generic_to_map(pctldev, parent, np, maps, num_maps,
a26361256c774cc Frank Li     2026-03-27  118  				      num_reserved_maps, group_names, ngroups,
a26361256c774cc Frank Li     2026-03-27 @119  				      functions, pins, npins);
a26361256c774cc Frank Li     2026-03-27  120  }
a26361256c774cc Frank Li     2026-03-27  121  
43722575e5cdcc6 Conor Dooley 2026-01-20  122  /*
43722575e5cdcc6 Conor Dooley 2026-01-20  123   * For platforms that do not define groups or functions in the driver, but
43722575e5cdcc6 Conor Dooley 2026-01-20  124   * instead use the devicetree to describe them. This function will, unlike
43722575e5cdcc6 Conor Dooley 2026-01-20  125   * pinconf_generic_dt_node_to_map() etc which rely on driver defined groups
43722575e5cdcc6 Conor Dooley 2026-01-20  126   * and functions, create them in addition to parsing pinconf properties and
43722575e5cdcc6 Conor Dooley 2026-01-20  127   * adding mappings.
43722575e5cdcc6 Conor Dooley 2026-01-20  128   */
43722575e5cdcc6 Conor Dooley 2026-01-20 @129  int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,

:::::: The code at line 20 was first introduced by commit
:::::: a26361256c774cc1f36979ab440cb9d83a9f8e48 pinctrl: extract pinctrl_generic_to_map() from pinctrl_generic_pins_function_dt_node_to_map()

:::::: TO: Frank Li <Frank.Li@nxp.com>
:::::: CC: Linus Walleij <linusw@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

