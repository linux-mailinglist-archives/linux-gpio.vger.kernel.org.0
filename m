Return-Path: <linux-gpio+bounces-24343-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FEAB24335
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 09:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9930D56514F
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 07:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4516C2E285E;
	Wed, 13 Aug 2025 07:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyfbHPyw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF132E1C56;
	Wed, 13 Aug 2025 07:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755071449; cv=none; b=iWSXTkcRc+uOZxpvlTXeQBMCCW9JYBNQnyT2BXyj8CvF2usCXEvn+GjQwvoWiJNh4YK9XForIn0/msGmv3kC3hOR+vlstqN8XhzGUZqQ/PjPs14XV7JXk/jk5b4V5VVpgKe/BiEgTolZQ+e5h5dEG7Ylp9+xuVl6YUaxKKJN/6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755071449; c=relaxed/simple;
	bh=GCkcSwQXaPB+Reeu4y3cV78hJ9D/iB5yjlZx4Qatnh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N5MXmep7trLLN3AjY/N0vSTO5xTPMICpE8fDWcWfvMsTC9OMfLiGXcqnrFmysusnh7Q+Nb/GYg+jfvyhCaOXw8ppGJjLLT297UpetP1fS8Gg2a1DhQBYWwkL8vVdMu47Y/6xXeRQzUiQlcJjRy5xnVbNezBQ7ocN5AbQe2lRYcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyfbHPyw; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755071448; x=1786607448;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GCkcSwQXaPB+Reeu4y3cV78hJ9D/iB5yjlZx4Qatnh8=;
  b=cyfbHPyw6dei7t7zFb4YPjhUHu+fJZU/uGB5dfzCpSxaBLu/aqPH0dG6
   4JnAANLSy5V6xBqPAiBGtdqv2M+qg7Neyi1oBo8PM/CpOrBO21lhDHSFE
   NmLnumhRHBrnGzPnUuTyocjJ85N3kNlO95K2A8XkrnDSw5ZlzzNfigX+Z
   e4LJtXVpcW9XGRn3DVxHijx3WclsFCxuvHryrcfFVsbvU3tf1fBoq/fOO
   cP3WApRAL4o3NtEnrYPx1s3r69ZJpzaWqozrzLW3BSIIBe3TNSA9au10M
   7yrP9fNU1IosDo1Im1ez0x/qR/vpAsgqoxEZ6GRUFpIknCNJlWtKFzi/m
   Q==;
X-CSE-ConnectionGUID: let9IegKTXSRoNAaLC1rTw==
X-CSE-MsgGUID: lpB42WgwQjiwvfaVUdiCpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57260476"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="57260476"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 00:50:48 -0700
X-CSE-ConnectionGUID: UFpW3ZHJRgG7Yrcfgk7aGw==
X-CSE-MsgGUID: hr6+tZAJTK62MvVvrPVRZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="165625222"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 13 Aug 2025 00:50:44 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um6Fc-0009gS-1J;
	Wed, 13 Aug 2025 07:50:29 +0000
Date: Wed, 13 Aug 2025 15:49:35 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] soc: fsl: qe: Add an interrupt controller for QUICC
 Engine Ports
Message-ID: <202508131517.P1Nfz0RF-lkp@intel.com>
References: <1dcc9528e97d228ea7889caa00cc254ef0375ed4.1754996033.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1dcc9528e97d228ea7889caa00cc254ef0375ed4.1754996033.git.christophe.leroy@csgroup.eu>

Hi Christophe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.17-rc1 next-20250813]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/soc-fsl-qe-Add-an-interrupt-controller-for-QUICC-Engine-Ports/20250812-195423
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/1dcc9528e97d228ea7889caa00cc254ef0375ed4.1754996033.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH 1/4] soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
config: powerpc64-randconfig-002-20250813 (https://download.01.org/0day-ci/archive/20250813/202508131517.P1Nfz0RF-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508131517.P1Nfz0RF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508131517.P1Nfz0RF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/fsl/qe/qe_ports_ic.c: In function 'qepic_probe':
>> drivers/soc/fsl/qe/qe_ports_ic.c:102:7: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     nb = (int)of_device_get_match_data(dev);
          ^


vim +102 drivers/soc/fsl/qe/qe_ports_ic.c

    94	
    95	static int qepic_probe(struct platform_device *pdev)
    96	{
    97		struct device *dev = &pdev->dev;
    98		struct qepic_data *data;
    99		int irq;
   100		int nb;
   101	
 > 102		nb = (int)of_device_get_match_data(dev);
   103		if (nb < 1 || nb > 32)
   104			return -EINVAL;
   105	
   106		data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
   107		if (!data)
   108			return -ENOMEM;
   109	
   110		data->reg = devm_platform_ioremap_resource(pdev, 0);
   111		if (IS_ERR(data->reg))
   112			return PTR_ERR(data->reg);
   113	
   114		irq = platform_get_irq(pdev, 0);
   115		if (irq < 0)
   116			return irq;
   117	
   118		data->host = irq_domain_add_linear(dev->of_node, nb, &qepic_host_ops, data);
   119		if (!data->host)
   120			return -ENODEV;
   121	
   122		irq_set_handler_data(irq, data);
   123		irq_set_chained_handler(irq, qepic_cascade);
   124	
   125		return 0;
   126	}
   127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

