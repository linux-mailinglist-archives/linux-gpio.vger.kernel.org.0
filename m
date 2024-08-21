Return-Path: <linux-gpio+bounces-8959-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F14FA95A469
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 20:09:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77A271F21562
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 18:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150F71B2EE2;
	Wed, 21 Aug 2024 18:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CJ2d4SFx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49BB1494D1;
	Wed, 21 Aug 2024 18:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724263736; cv=none; b=dWkKMDNzHjVaGHt7DCObmUFdO0cWnEBWKv+8gMx+VTnhFVae6ap6jCY6NwugJ/GayysGuQN2Qc0yOraDZY/230bwNEbOr5LMTLhN0nHEP8c2/Q3Vb3x7oQEWjjzpQP5kh282PYTaQ5+3RvjAod3ABiFna52lUj/duvFhZem9o28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724263736; c=relaxed/simple;
	bh=/Gi8iWabs4ywesTqUytFjU5VLWGq7rK1B8LWGnTuEeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q54ZCFrIDLiVc/ZIMmPh82yNEorq27Me6ZOvYcX+/reA9gfs1NaxnAe0M4JNxy0NFabuVZGDFnB7sBjSGSqOhcR9IbdfYiJfpVb10XyAWiotUGyAbU6EWLrDnAJvMyRdnlzh6ncyD1CV4CmgUR9wUj4li5VbT1WnckvMs5i94kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CJ2d4SFx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724263735; x=1755799735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/Gi8iWabs4ywesTqUytFjU5VLWGq7rK1B8LWGnTuEeE=;
  b=CJ2d4SFxUvZv6UiuX8c1MPogsEE6TDJMkyRwAqkI6LcCiN2b73mC/rC6
   5k+X7N6pWyb/Yhy5EkrfYmQ0gB610SkGKx0WzENQZYVARlcCWBtppz7oI
   z8/M4mCHE96rY24kZcYvVTWWpzN9AIvfgbCCZZKXqHL+oD6oFqv+VEN3s
   fcj26NaMnsid97VbXNT1JRmzETxwT1xRBgoAlK2Z4Z147iG+ViI656S7h
   VU85uMiKB6YSlb6e9TYbVAEH9Tj8KpDPli07QZ3TfNAU8rF+IQgmVFLFp
   jaIa0KjbedwT6NgLKmNjj3gb4J5cFRg+v4fpXUQ415WEmohV3uEpNTafb
   w==;
X-CSE-ConnectionGUID: oo44aWvvQtC7/2wqxn6Gwg==
X-CSE-MsgGUID: slyDIQfaTGiiyh2LZeK7OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="40155089"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="40155089"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 10:57:59 -0700
X-CSE-ConnectionGUID: 6mXNKCatQ/SxV8fNv/rOyQ==
X-CSE-MsgGUID: FJVZXk0iRJ2t2K1mrYqp9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="61027135"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Aug 2024 10:57:52 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgpaf-000Bl6-2a;
	Wed, 21 Aug 2024 17:57:49 +0000
Date: Thu, 22 Aug 2024 01:56:56 +0800
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
Message-ID: <202408220150.bmFMT5Bk-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.11-rc4 next-20240821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrea-della-Porta/dt-bindings-clock-Add-RaspberryPi-RP1-clock-bindings/20240821-023901
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/5954e4dccc0e158cf434d2c281ad57120538409b.1724159867.git.andrea.porta%40suse.com
patch subject: [PATCH 08/11] misc: rp1: RaspberryPi RP1 misc driver
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20240822/202408220150.bmFMT5Bk-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408220150.bmFMT5Bk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408220150.bmFMT5Bk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/pci.h:37,
                    from drivers/misc/rp1/rp1-pci.c:18:
   drivers/misc/rp1/rp1-pci.c: In function 'dump_bar':
>> drivers/misc/rp1/rp1-pci.c:75:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
      75 |                  "bar%d len 0x%llx, start 0x%llx, end 0x%llx, flags, 0x%lx\n",
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/misc/rp1/rp1-pci.c:74:9: note: in expansion of macro 'dev_info'
      74 |         dev_info(&pdev->dev,
         |         ^~~~~~~~
   drivers/misc/rp1/rp1-pci.c:75:34: note: format string is defined here
      75 |                  "bar%d len 0x%llx, start 0x%llx, end 0x%llx, flags, 0x%lx\n",
         |                               ~~~^
         |                                  |
         |                                  long long unsigned int
         |                               %x
   drivers/misc/rp1/rp1-pci.c:75:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
      75 |                  "bar%d len 0x%llx, start 0x%llx, end 0x%llx, flags, 0x%lx\n",
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/misc/rp1/rp1-pci.c:74:9: note: in expansion of macro 'dev_info'
      74 |         dev_info(&pdev->dev,
         |         ^~~~~~~~
   drivers/misc/rp1/rp1-pci.c:75:48: note: format string is defined here
      75 |                  "bar%d len 0x%llx, start 0x%llx, end 0x%llx, flags, 0x%lx\n",
         |                                             ~~~^
         |                                                |
         |                                                long long unsigned int
         |                                             %x
   drivers/misc/rp1/rp1-pci.c:75:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 6 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
      75 |                  "bar%d len 0x%llx, start 0x%llx, end 0x%llx, flags, 0x%lx\n",
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/misc/rp1/rp1-pci.c:74:9: note: in expansion of macro 'dev_info'
      74 |         dev_info(&pdev->dev,
         |         ^~~~~~~~
   drivers/misc/rp1/rp1-pci.c:75:60: note: format string is defined here
      75 |                  "bar%d len 0x%llx, start 0x%llx, end 0x%llx, flags, 0x%lx\n",
         |                                                         ~~~^
         |                                                            |
         |                                                            long long unsigned int
         |                                                         %x


vim +75 drivers/misc/rp1/rp1-pci.c

  > 18	#include <linux/pci.h>
    19	#include <linux/platform_device.h>
    20	#include <linux/reset.h>
    21	
    22	#include <dt-bindings/misc/rp1.h>
    23	
    24	#define RP1_B0_CHIP_ID		0x10001927
    25	#define RP1_C0_CHIP_ID		0x20001927
    26	
    27	#define RP1_PLATFORM_ASIC	BIT(1)
    28	#define RP1_PLATFORM_FPGA	BIT(0)
    29	
    30	#define RP1_DRIVER_NAME		"rp1"
    31	
    32	#define RP1_ACTUAL_IRQS		RP1_INT_END
    33	#define RP1_IRQS		RP1_ACTUAL_IRQS
    34	#define RP1_HW_IRQ_MASK		GENMASK(5, 0)
    35	
    36	#define RP1_SYSCLK_RATE		200000000
    37	#define RP1_SYSCLK_FPGA_RATE	60000000
    38	
    39	enum {
    40		SYSINFO_CHIP_ID_OFFSET	= 0,
    41		SYSINFO_PLATFORM_OFFSET	= 4,
    42	};
    43	
    44	#define REG_SET			0x800
    45	#define REG_CLR			0xc00
    46	
    47	/* MSIX CFG registers start at 0x8 */
    48	#define MSIX_CFG(x) (0x8 + (4 * (x)))
    49	
    50	#define MSIX_CFG_IACK_EN        BIT(3)
    51	#define MSIX_CFG_IACK           BIT(2)
    52	#define MSIX_CFG_TEST           BIT(1)
    53	#define MSIX_CFG_ENABLE         BIT(0)
    54	
    55	#define INTSTATL		0x108
    56	#define INTSTATH		0x10c
    57	
    58	extern char __dtbo_rp1_pci_begin[];
    59	extern char __dtbo_rp1_pci_end[];
    60	
    61	struct rp1_dev {
    62		struct pci_dev *pdev;
    63		struct device *dev;
    64		struct clk *sys_clk;
    65		struct irq_domain *domain;
    66		struct irq_data *pcie_irqds[64];
    67		void __iomem *bar1;
    68		int ovcs_id;
    69		bool level_triggered_irq[RP1_ACTUAL_IRQS];
    70	};
    71	
    72	static void dump_bar(struct pci_dev *pdev, unsigned int bar)
    73	{
    74		dev_info(&pdev->dev,
  > 75			 "bar%d len 0x%llx, start 0x%llx, end 0x%llx, flags, 0x%lx\n",
    76			 bar,
    77			 pci_resource_len(pdev, bar),
    78			 pci_resource_start(pdev, bar),
    79			 pci_resource_end(pdev, bar),
    80			 pci_resource_flags(pdev, bar));
    81	}
    82	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

