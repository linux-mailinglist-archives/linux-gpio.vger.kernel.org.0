Return-Path: <linux-gpio+bounces-8952-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E779959F0C
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 15:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A33A11F22BD2
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 13:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782B61AF4E6;
	Wed, 21 Aug 2024 13:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NK9LP76a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8297B1AD5CE;
	Wed, 21 Aug 2024 13:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724248195; cv=none; b=ptPWooHwhAi2cx20NCrk3C2KNKkLX6lcMNSffN4T76RqyEmqWdbAMwqMVM5GuIckzfp9+UdF/s0r3SPgxPRk2Yzks//QODp/5btoI0fLr1Ol+SAGKqILRYMhQxX9qTAnTCHMVh4jbTG8EvGCi0eBWWyyEBdYnPFaA8EayTmXVvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724248195; c=relaxed/simple;
	bh=u4kuJipWD1vmaiNeXqgsS1lktVrwGmZ+cANuZ0l5L24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YmPoaYPucd7PiU5uLgqtcIq2/arY78corhgXwfDhE9P+4rk/rdDfGb4X8K940Gl8VqVx1t2SuiScmlGJd70vVFy0n9mbJc1My7aBF4Bopv74aG27vdrnjXCFRLxTWy8cVDqjJETOF4TwSF3Axm9VvDnZKmoSeMQnGJPphcBj5RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NK9LP76a; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724248194; x=1755784194;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u4kuJipWD1vmaiNeXqgsS1lktVrwGmZ+cANuZ0l5L24=;
  b=NK9LP76aoJeILk1Wsr88t/UBlph4vk8/SCNNFLzrjQuI/r3VUFZxeIXb
   lvCe3XIe+iX6l3LWP4cb53tjDTNkV37qubJYKO+iEqcVk/ZZBIbsqrydl
   1MbWPZSe9A9wOfuEg6nEbu+8fhm8u+0Pl5PnUHSeC10MwWTds49bNq3X0
   HVwuLeR8/0uKFqgFtHrVZwQ9DzA3kNSbeZQGk+sPc3F3YUjE1rLuuNqlw
   n/nS9/4hwlZNYc3fS6CKKnct81B1IXiqJmrjl30VzTytMFfDtsj4ow2BK
   m1TeZD9R1n5xM9oo7QOIeNUBivuAXIbhMXtj7EnBhNzAxmf9AHmJY1nvv
   Q==;
X-CSE-ConnectionGUID: ehxEVG83SJSQk3SstFdWrA==
X-CSE-MsgGUID: yBeT5vwARhy33QL9ZPIIeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="26476090"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="26476090"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 06:49:41 -0700
X-CSE-ConnectionGUID: ElUHF5rxQaav52IEjQTp0Q==
X-CSE-MsgGUID: 4rqoe0VZTu+IxQcD9Bzf8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="61406714"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Aug 2024 06:49:34 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgliN-000BQI-1L;
	Wed, 21 Aug 2024 13:49:31 +0000
Date: Wed, 21 Aug 2024 21:49:12 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <helgaas@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH 08/11] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <202408212114.i6MFeKR1-lkp@intel.com>
References: <5954e4dccc0e158cf434d2c281ad57120538409b.1724159867.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5954e4dccc0e158cf434d2c281ad57120538409b.1724159867.git.andrea.porta@suse.com>

Hi Andrea,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on robh/for-next char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.11-rc4 next-20240821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrea-della-Porta/dt-bindings-clock-Add-RaspberryPi-RP1-clock-bindings/20240821-023901
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/5954e4dccc0e158cf434d2c281ad57120538409b.1724159867.git.andrea.porta%40suse.com
patch subject: [PATCH 08/11] misc: rp1: RaspberryPi RP1 misc driver
config: x86_64-randconfig-r133-20240821 (https://download.01.org/0day-ci/archive/20240821/202408212114.i6MFeKR1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408212114.i6MFeKR1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408212114.i6MFeKR1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/misc/rp1/rp1-pci.c: In function 'rp1_mask_irq':
>> drivers/misc/rp1/rp1-pci.c:98:9: error: implicit declaration of function 'pci_msi_mask_irq'; did you mean 'pci_msix_free_irq'? [-Werror=implicit-function-declaration]
      98 |         pci_msi_mask_irq(pcie_irqd);
         |         ^~~~~~~~~~~~~~~~
         |         pci_msix_free_irq
   drivers/misc/rp1/rp1-pci.c: In function 'rp1_unmask_irq':
>> drivers/misc/rp1/rp1-pci.c:106:9: error: implicit declaration of function 'pci_msi_unmask_irq' [-Werror=implicit-function-declaration]
     106 |         pci_msi_unmask_irq(pcie_irqd);
         |         ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +98 drivers/misc/rp1/rp1-pci.c

    92	
    93	static void rp1_mask_irq(struct irq_data *irqd)
    94	{
    95		struct rp1_dev *rp1 = irqd->domain->host_data;
    96		struct irq_data *pcie_irqd = rp1->pcie_irqds[irqd->hwirq];
    97	
  > 98		pci_msi_mask_irq(pcie_irqd);
    99	}
   100	
   101	static void rp1_unmask_irq(struct irq_data *irqd)
   102	{
   103		struct rp1_dev *rp1 = irqd->domain->host_data;
   104		struct irq_data *pcie_irqd = rp1->pcie_irqds[irqd->hwirq];
   105	
 > 106		pci_msi_unmask_irq(pcie_irqd);
   107	}
   108	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

