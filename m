Return-Path: <linux-gpio+bounces-36672-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPkUB34mA2p21AEAu9opvQ
	(envelope-from <linux-gpio+bounces-36672-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 15:09:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBFC520CCC
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 15:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 29C4A306838F
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 13:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C159739AD42;
	Tue, 12 May 2026 12:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i8FLnThA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7895939AD21
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 12:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778590707; cv=none; b=jgiygp5lTaXuoml9OLRUpb3lS1GY8S8Ue0IPFM5nnJYgP8Pr2DQ8RNmMo4Tl3tj+eUsfuXBmNG1Zg7wyh856t26gns8pXR7IY5KLgap+LArr6bcYGjx62aWHngheNSSOXYAgm5pIy12uo/dXdhtDgvLELciyGCuooCgehyyj80Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778590707; c=relaxed/simple;
	bh=AexXx+WDSYlSJCaqIYRiCG8+rzCVIn66VYP5po4Sa4c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZF2eucdkK7AlLAWNk9t7F77m/JIj54X4sZSn8wu3c4WXGYaYaflEjK5hX5M0fqee+mksZocNPH38XGzZTjIvEDCzH6IGq7Dgbbociz0bAuE2ETDug9Jns5Hy5AowfoYyWQd5EV8T6kVOzljFW7M11HN/3rmvZUmPjLn7uXWGmOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i8FLnThA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778590704; x=1810126704;
  h=date:from:to:cc:subject:message-id;
  bh=AexXx+WDSYlSJCaqIYRiCG8+rzCVIn66VYP5po4Sa4c=;
  b=i8FLnThAf3YOOO2spYCmH1Wmti70ciDIMKAR3LxdHvyN31OZNiPZ/skf
   MdUlV+HrwGTEOkV0SP0roDh8JQK2NKlUSsKuGQcrRyEzd6fgthQptvGwB
   YSzjmG1j0H4RCoHgJnxX06W7LK0ygBEgjQLSDCHQ2KqDpVOKygCwdYXYa
   Mkg4/pIWeJizBP/QkLpHOJwjhRWBUzTH3jPltj8mEEm6BpDvHYN/oLVLL
   A/wm7Plm33Vk5UhTTZZx5LxgTUVjSat5uS9Rn0YyQsOaodhSqUocKHwc8
   IWQ6UL+7xY8GoVq5Nc7HT+1L5AaKUYm8QOgeJ93Oo9M1zpJGI+uahK5hB
   A==;
X-CSE-ConnectionGUID: rjUMDqOcQsaUMZQPG77Wvw==
X-CSE-MsgGUID: YqiJrqptS2CwUFuWlLtT9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="78526829"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="78526829"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:58:21 -0700
X-CSE-ConnectionGUID: 228OFFozQJWighgi64qaDw==
X-CSE-MsgGUID: wUq+xCLxT3W5kmMa2dkPdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="235097890"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 May 2026 05:58:19 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMmgi-000000002AV-49P1;
	Tue, 12 May 2026 12:58:16 +0000
Date: Tue, 12 May 2026 20:57:40 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>
Subject: [linusw-pinctrl:ib-mux-pinctrl 5/6]
 drivers/pinctrl/pinctrl-generic.c:20:5: error: conflicting types for
 'pinctrl_generic_to_map'
Message-ID: <202605122043.UepkxK9V-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 0FBFC520CCC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36672-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email,intel.com:mid,intel.com:dkim,01.org:url,nxp.com:email]
X-Rspamd-Action: no action

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-mux-pinctrl
head:   d8074fd57a0231457e580c1f6cd33f089f09fd12
commit: 34acc5a8adfb76f2de63c8b8317397fb72b0aec8 [5/6] pinctrl: add generic board-level pinctrl driver using mux framework
config: m68k-randconfig-r073-20260512 (https://download.01.org/0day-ci/archive/20260512/202605122043.UepkxK9V-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9065-ge9cc34fd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605122043.UepkxK9V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605122043.UepkxK9V-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-generic.c:20:5: error: conflicting types for 'pinctrl_generic_to_map'
    int pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
        ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/pinctrl/pinctrl-generic.c:16:
   drivers/pinctrl/pinconf.h:193:1: note: previous definition of 'pinctrl_generic_to_map' was here
    pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
    ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/pinctrl-generic.c:130:5: error: redefinition of 'pinctrl_generic_pins_function_dt_node_to_map'
    int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/pinctrl/pinctrl-generic.c:16:
   drivers/pinctrl/pinconf.h:184:1: note: previous definition of 'pinctrl_generic_pins_function_dt_node_to_map' was here
    pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/pinctrl_generic_to_map +20 drivers/pinctrl/pinctrl-generic.c

43722575e5cdcc Conor Dooley 2026-01-20   19  
aaaf31be042603 Frank Li     2026-05-04  @20  int pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
aaaf31be042603 Frank Li     2026-05-04   21  			   struct device_node *np, struct pinctrl_map **maps,
aaaf31be042603 Frank Li     2026-05-04   22  			   unsigned int *num_maps, unsigned int *num_reserved_maps,
aaaf31be042603 Frank Li     2026-05-04   23  			   const char **group_names, unsigned int ngroups,
aaaf31be042603 Frank Li     2026-05-04   24  			   const char **functions, unsigned int *pins,
aaaf31be042603 Frank Li     2026-05-04   25  			   unsigned int npins)
43722575e5cdcc Conor Dooley 2026-01-20   26  {
43722575e5cdcc Conor Dooley 2026-01-20   27  	struct device *dev = pctldev->dev;
aaaf31be042603 Frank Li     2026-05-04   28  	unsigned int num_configs;
43722575e5cdcc Conor Dooley 2026-01-20   29  	const char *group_name;
43722575e5cdcc Conor Dooley 2026-01-20   30  	unsigned long *configs;
aaaf31be042603 Frank Li     2026-05-04   31  	int ret, reserve = 1;
43722575e5cdcc Conor Dooley 2026-01-20   32  
43722575e5cdcc Conor Dooley 2026-01-20   33  	group_name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", parent, np);
43722575e5cdcc Conor Dooley 2026-01-20   34  	if (!group_name)
43722575e5cdcc Conor Dooley 2026-01-20   35  		return -ENOMEM;
43722575e5cdcc Conor Dooley 2026-01-20   36  
43722575e5cdcc Conor Dooley 2026-01-20   37  	group_names[ngroups] = group_name;
43722575e5cdcc Conor Dooley 2026-01-20   38  
43722575e5cdcc Conor Dooley 2026-01-20   39  	ret = pinctrl_utils_reserve_map(pctldev, maps, num_reserved_maps, num_maps, reserve);
43722575e5cdcc Conor Dooley 2026-01-20   40  	if (ret)
43722575e5cdcc Conor Dooley 2026-01-20   41  		return ret;
43722575e5cdcc Conor Dooley 2026-01-20   42  
43722575e5cdcc Conor Dooley 2026-01-20   43  	ret = pinctrl_utils_add_map_mux(pctldev, maps, num_reserved_maps, num_maps, group_name,
43722575e5cdcc Conor Dooley 2026-01-20   44  					parent->name);
43722575e5cdcc Conor Dooley 2026-01-20   45  	if (ret < 0)
43722575e5cdcc Conor Dooley 2026-01-20   46  		return ret;
43722575e5cdcc Conor Dooley 2026-01-20   47  
43722575e5cdcc Conor Dooley 2026-01-20   48  	ret = pinctrl_generic_add_group(pctldev, group_name, pins, npins, functions);
43722575e5cdcc Conor Dooley 2026-01-20   49  	if (ret < 0)
43722575e5cdcc Conor Dooley 2026-01-20   50  		return dev_err_probe(dev, ret, "failed to add group %s: %d\n",
43722575e5cdcc Conor Dooley 2026-01-20   51  				     group_name, ret);
43722575e5cdcc Conor Dooley 2026-01-20   52  
43722575e5cdcc Conor Dooley 2026-01-20   53  	ret = pinconf_generic_parse_dt_config(np, pctldev, &configs, &num_configs);
43722575e5cdcc Conor Dooley 2026-01-20   54  	if (ret)
43722575e5cdcc Conor Dooley 2026-01-20   55  		return dev_err_probe(dev, ret, "failed to parse pin config of group %s\n",
43722575e5cdcc Conor Dooley 2026-01-20   56  			group_name);
43722575e5cdcc Conor Dooley 2026-01-20   57  
43722575e5cdcc Conor Dooley 2026-01-20   58  	if (num_configs == 0)
43722575e5cdcc Conor Dooley 2026-01-20   59  		return 0;
43722575e5cdcc Conor Dooley 2026-01-20   60  
43722575e5cdcc Conor Dooley 2026-01-20   61  	ret = pinctrl_utils_reserve_map(pctldev, maps, num_reserved_maps, num_maps, reserve);
43722575e5cdcc Conor Dooley 2026-01-20   62  	if (ret)
43722575e5cdcc Conor Dooley 2026-01-20   63  		return ret;
43722575e5cdcc Conor Dooley 2026-01-20   64  
43722575e5cdcc Conor Dooley 2026-01-20   65  	ret = pinctrl_utils_add_map_configs(pctldev, maps, num_reserved_maps, num_maps, group_name,
43722575e5cdcc Conor Dooley 2026-01-20   66  					    configs,
43722575e5cdcc Conor Dooley 2026-01-20   67  			num_configs, PIN_MAP_TYPE_CONFIGS_GROUP);
43722575e5cdcc Conor Dooley 2026-01-20   68  	kfree(configs);
43722575e5cdcc Conor Dooley 2026-01-20   69  	if (ret)
43722575e5cdcc Conor Dooley 2026-01-20   70  		return ret;
43722575e5cdcc Conor Dooley 2026-01-20   71  
43722575e5cdcc Conor Dooley 2026-01-20   72  	return 0;
43722575e5cdcc Conor Dooley 2026-01-20   73  };
aaaf31be042603 Frank Li     2026-05-04   74  EXPORT_SYMBOL_GPL(pinctrl_generic_to_map);
aaaf31be042603 Frank Li     2026-05-04   75  
aaaf31be042603 Frank Li     2026-05-04   76  static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *pctldev,
aaaf31be042603 Frank Li     2026-05-04   77  							   struct device_node *parent,
aaaf31be042603 Frank Li     2026-05-04   78  							   struct device_node *np,
aaaf31be042603 Frank Li     2026-05-04   79  							   struct pinctrl_map **maps,
aaaf31be042603 Frank Li     2026-05-04   80  							   unsigned int *num_maps,
aaaf31be042603 Frank Li     2026-05-04   81  							   unsigned int *num_reserved_maps,
aaaf31be042603 Frank Li     2026-05-04   82  							   const char **group_names,
aaaf31be042603 Frank Li     2026-05-04   83  							   unsigned int ngroups)
aaaf31be042603 Frank Li     2026-05-04   84  {
aaaf31be042603 Frank Li     2026-05-04   85  	struct device *dev = pctldev->dev;
aaaf31be042603 Frank Li     2026-05-04   86  	unsigned int pin, *pins;
aaaf31be042603 Frank Li     2026-05-04   87  	const char **functions;
aaaf31be042603 Frank Li     2026-05-04   88  	int npins, ret;
aaaf31be042603 Frank Li     2026-05-04   89  
aaaf31be042603 Frank Li     2026-05-04   90  	npins = of_property_count_u32_elems(np, "pins");
aaaf31be042603 Frank Li     2026-05-04   91  
aaaf31be042603 Frank Li     2026-05-04   92  	if (npins < 1) {
aaaf31be042603 Frank Li     2026-05-04   93  		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
aaaf31be042603 Frank Li     2026-05-04   94  			parent, np, npins);
aaaf31be042603 Frank Li     2026-05-04   95  		return npins;
aaaf31be042603 Frank Li     2026-05-04   96  	}
aaaf31be042603 Frank Li     2026-05-04   97  
aaaf31be042603 Frank Li     2026-05-04   98  	pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
aaaf31be042603 Frank Li     2026-05-04   99  	if (!pins)
aaaf31be042603 Frank Li     2026-05-04  100  		return -ENOMEM;
aaaf31be042603 Frank Li     2026-05-04  101  
aaaf31be042603 Frank Li     2026-05-04  102  	functions = devm_kcalloc(dev, npins, sizeof(*functions), GFP_KERNEL);
aaaf31be042603 Frank Li     2026-05-04  103  	if (!functions)
aaaf31be042603 Frank Li     2026-05-04  104  		return -ENOMEM;
aaaf31be042603 Frank Li     2026-05-04  105  
aaaf31be042603 Frank Li     2026-05-04  106  	for (int i = 0; i < npins; i++) {
aaaf31be042603 Frank Li     2026-05-04  107  		ret = of_property_read_u32_index(np, "pins", i, &pin);
aaaf31be042603 Frank Li     2026-05-04  108  		if (ret)
aaaf31be042603 Frank Li     2026-05-04  109  			return ret;
aaaf31be042603 Frank Li     2026-05-04  110  
aaaf31be042603 Frank Li     2026-05-04  111  		pins[i] = pin;
aaaf31be042603 Frank Li     2026-05-04  112  
aaaf31be042603 Frank Li     2026-05-04  113  		ret = of_property_read_string(np, "function", &functions[i]);
aaaf31be042603 Frank Li     2026-05-04  114  		if (ret)
aaaf31be042603 Frank Li     2026-05-04  115  			return ret;
aaaf31be042603 Frank Li     2026-05-04  116  	}
aaaf31be042603 Frank Li     2026-05-04  117  
aaaf31be042603 Frank Li     2026-05-04  118  	return pinctrl_generic_to_map(pctldev, parent, np, maps, num_maps,
aaaf31be042603 Frank Li     2026-05-04  119  				      num_reserved_maps, group_names, ngroups,
aaaf31be042603 Frank Li     2026-05-04  120  				      functions, pins, npins);
aaaf31be042603 Frank Li     2026-05-04  121  }
43722575e5cdcc Conor Dooley 2026-01-20  122  
43722575e5cdcc Conor Dooley 2026-01-20  123  /*
43722575e5cdcc Conor Dooley 2026-01-20  124   * For platforms that do not define groups or functions in the driver, but
43722575e5cdcc Conor Dooley 2026-01-20  125   * instead use the devicetree to describe them. This function will, unlike
43722575e5cdcc Conor Dooley 2026-01-20  126   * pinconf_generic_dt_node_to_map() etc which rely on driver defined groups
43722575e5cdcc Conor Dooley 2026-01-20  127   * and functions, create them in addition to parsing pinconf properties and
43722575e5cdcc Conor Dooley 2026-01-20  128   * adding mappings.
43722575e5cdcc Conor Dooley 2026-01-20  129   */
43722575e5cdcc Conor Dooley 2026-01-20 @130  int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,

:::::: The code at line 20 was first introduced by commit
:::::: aaaf31be04260316036f50a05b7d015c0d36b55a pinctrl: extract pinctrl_generic_to_map() from pinctrl_generic_pins_function_dt_node_to_map()

:::::: TO: Frank Li <Frank.Li@nxp.com>
:::::: CC: Linus Walleij <linusw@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

