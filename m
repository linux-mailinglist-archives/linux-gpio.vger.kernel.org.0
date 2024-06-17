Return-Path: <linux-gpio+bounces-7511-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B2090B6FC
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 18:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7DF7B3F741
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 15:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8B176036;
	Mon, 17 Jun 2024 15:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UycHgLwK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379BC6A33B
	for <linux-gpio@vger.kernel.org>; Mon, 17 Jun 2024 15:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718638400; cv=none; b=gkhf/Aho/Egq3G3ZEDLe0uexS4TIxqVJqG9irqGxu/ngYRBjdGaPJiqDokLLGt+ICmrl6qZacaPMFSLExzBlqwmOozUyGaJb2rlpzizCwede0sxF8SVa+RfMBnfStNOun5vcXg8sw94e7V5s8kp3aLnMytghyG63PoWOK68XbDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718638400; c=relaxed/simple;
	bh=zRLVH4u75lo1LsfTZsvtvLBPfA04Bhho287DqXSPVw0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j8ORDAOeGokDLLrBhWBE7YZ2bGCSrQmv12I1R1TBkqLmxL0JtYFtLRULFCvZDxwS2gruubsoKMqSHdys5eTDjgKGZ6PS+WaCSe66kpbNJ3kDg4C6/c0h9wblKHH4WjauxcxlZlP+TU5ugvrL2s10ud1VWsYKd2bRWXg58l8JBjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UycHgLwK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718638398; x=1750174398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zRLVH4u75lo1LsfTZsvtvLBPfA04Bhho287DqXSPVw0=;
  b=UycHgLwK7zn9us2f7gqrIb399lHcL80lWfqxYEfDrHTGhd2vmt6NmJAX
   i3xqkmbB/uES9fXyJwcY5/mWQODFP8k7dQv+AeE2YhVYuAPEwKotAfZuh
   UAOQ9SWi9Bo1LDM7ttoD2ia34bVxCL8N7CyrlBpno3jzx2SEssM6P4Paa
   Q7hjtZSl3eBHMhLuNnAQxfC+UGlfFsl1IE/JvXtmVLH706vqrE/HakvHG
   da7mA6ocZ1S6pnZICujZRUK0qbYxBughfX+fXuqn3aMBXPMOlLYTtU6tO
   ryH61/lxTrQXZjyzZoqfZ9BtxHyD5GU24RXzfxr9pNVvYxxuwGGFCn2of
   g==;
X-CSE-ConnectionGUID: sTmXWVMdRWGqyfjUcYFVlg==
X-CSE-MsgGUID: gkfgRmybRAe9t63YnA8xtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="18386811"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="18386811"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 08:33:18 -0700
X-CSE-ConnectionGUID: /R4Lr+fqTQeBFtRvrhY88w==
X-CSE-MsgGUID: T3KlqN1RRUid0+x2tgYCfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="46345152"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jun 2024 08:33:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJEM5-0004d6-2C;
	Mon, 17 Jun 2024 15:33:13 +0000
Date: Mon, 17 Jun 2024 23:32:08 +0800
From: kernel test robot <lkp@intel.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Dong Aisheng <aisheng.dong@nxp.com>
Subject: [linusw-pinctrl:devel 33/34]
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c:151:29: error:
 'pinctrl_generic_get_group_count' undeclared here (not in a function)
Message-ID: <202406172317.Sds860AS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   fb5e8e47a0e5e960e699e1d65b85618a5572543a
commit: 1e37f761d0163cf99567fb81d9c59860ef255d9d [33/34] pinctrl: imx: support SCMI pinctrl protocol for i.MX95
config: sh-randconfig-r133-20240617 (https://download.01.org/0day-ci/archive/20240617/202406172317.Sds860AS-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240617/202406172317.Sds860AS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406172317.Sds860AS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/freescale/pinctrl-imx-scmi.c:151:29: error: 'pinctrl_generic_get_group_count' undeclared here (not in a function)
     151 |         .get_groups_count = pinctrl_generic_get_group_count,
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/freescale/pinctrl-imx-scmi.c:152:27: error: 'pinctrl_generic_get_group_name' undeclared here (not in a function)
     152 |         .get_group_name = pinctrl_generic_get_group_name,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/freescale/pinctrl-imx-scmi.c:153:27: error: 'pinctrl_generic_get_group_pins' undeclared here (not in a function); did you mean 'pinctrl_get_group_pins'?
     153 |         .get_group_pins = pinctrl_generic_get_group_pins,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                           pinctrl_get_group_pins
>> drivers/pinctrl/freescale/pinctrl-imx-scmi.c:170:32: error: 'pinmux_generic_get_function_count' undeclared here (not in a function); did you mean 'pinmux_generic_free_functions'?
     170 |         .get_functions_count = pinmux_generic_get_function_count,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                pinmux_generic_free_functions
>> drivers/pinctrl/freescale/pinctrl-imx-scmi.c:171:30: error: 'pinmux_generic_get_function_name' undeclared here (not in a function); did you mean 'pinmux_generic_free_functions'?
     171 |         .get_function_name = pinmux_generic_get_function_name,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                              pinmux_generic_free_functions
>> drivers/pinctrl/freescale/pinctrl-imx-scmi.c:172:32: error: 'pinmux_generic_get_function_groups' undeclared here (not in a function); did you mean 'pinmux_generic_free_functions'?
     172 |         .get_function_groups = pinmux_generic_get_function_groups,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                pinmux_generic_free_functions


vim +/pinctrl_generic_get_group_count +151 drivers/pinctrl/freescale/pinctrl-imx-scmi.c

   149	
   150	static const struct pinctrl_ops pinctrl_scmi_imx_pinctrl_ops = {
 > 151		.get_groups_count = pinctrl_generic_get_group_count,
 > 152		.get_group_name = pinctrl_generic_get_group_name,
 > 153		.get_group_pins = pinctrl_generic_get_group_pins,
   154		.dt_node_to_map = pinctrl_scmi_imx_dt_node_to_map,
   155		.dt_free_map = pinctrl_scmi_imx_dt_free_map,
   156	};
   157	
   158	static int pinctrl_scmi_imx_func_set_mux(struct pinctrl_dev *pctldev,
   159						 unsigned int selector, unsigned int group)
   160	{
   161		/*
   162		 * For i.MX SCMI PINCTRL , postpone the mux setting
   163		 * until config is set as they can be set together
   164		 * in one IPC call
   165		 */
   166		return 0;
   167	}
   168	
   169	static const struct pinmux_ops pinctrl_scmi_imx_pinmux_ops = {
 > 170		.get_functions_count = pinmux_generic_get_function_count,
 > 171		.get_function_name = pinmux_generic_get_function_name,
 > 172		.get_function_groups = pinmux_generic_get_function_groups,
   173		.set_mux = pinctrl_scmi_imx_func_set_mux,
   174	};
   175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

