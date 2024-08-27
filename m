Return-Path: <linux-gpio+bounces-9192-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E3B95FEFD
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 04:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC56D1F22912
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 02:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8F413FEE;
	Tue, 27 Aug 2024 02:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TVoo1KF7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FA5DDC1;
	Tue, 27 Aug 2024 02:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724725428; cv=none; b=KElZtnodPfl2qWZdpmEbmzf2p/0FK9l5auIYz5k8Vw7uzcAAqK18e5UNe3u0uPt8Pi31+m6ZJ57fus8n5dA7hOsBJu8XNYcNNSqI/otrnzpUNrJsJw4FLK1FrYcmmRAK+U9UmOD3s45TXBr2nWlo2fgb2Ph/5ps0HQZHpQmLffQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724725428; c=relaxed/simple;
	bh=9FCIJxsMYSpU1aUPh+K5f4k3cmYgB1Evzoh4BA6p5gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8kYbHytwW4ERlhXS/01zU25WgX1/5aTzhf08UosDM0KNkvJEb0ClKoJmz/n1Si0UO/5RrP1v9Mdg7ahS7fnWK2ga/MQaR8REWwtlMWXB2XQhsFJe0+ev922yWLvqwvLrdl0fdo0jIc/IS6Bw6zilmWLxolJORnadf1BX+8SVHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TVoo1KF7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724725427; x=1756261427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9FCIJxsMYSpU1aUPh+K5f4k3cmYgB1Evzoh4BA6p5gc=;
  b=TVoo1KF7s4W52WAy5tk9N8mSu10TYXtJf1SzMgp88JeRZQtUD87znL1g
   3wpSfa2FuoJEcIXT/jPoivcJ7fzWuwpyLYrydUmGmz68R22lujXvkKk5K
   1hLcwBPrtyrPwrzNTjIc00JeF9u8Q9tmeUspcia+3CWRq8hNtw/NGTTzP
   PbejYZv6b5Fw2vBa3k5iDKbwO6SEXfmqACV02quBDHfAUNEYnUl7OwjxD
   O83+HHBD7QJEQliZ+Yf/HhUNF3Hb0e30yHtkkNHN3zsmLoDawI9JrMUw+
   FG6D4MDQskDmvVzx4xaHkL11cd9PTFsMzsxJxr2sT8cUPx6pQyKeY9Suz
   Q==;
X-CSE-ConnectionGUID: L5sZLJF4Q3yvsCtlg6kY3g==
X-CSE-MsgGUID: qK8MsAL8SHSmE4jKy6gdeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="33842808"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="33842808"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 19:23:46 -0700
X-CSE-ConnectionGUID: gkxRGydFQXynZmJ8vej9rQ==
X-CSE-MsgGUID: /7k15b78SHuSJdem06g7ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="62386322"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Aug 2024 19:23:42 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1silrw-000HnZ-0f;
	Tue, 27 Aug 2024 02:23:40 +0000
Date: Tue, 27 Aug 2024 10:23:06 +0800
From: kernel test robot <lkp@intel.com>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: Re: [PATCH 2/3] drivers: gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs
 support
Message-ID: <202408271011.hpcNokNu-lkp@intel.com>
References: <20240826084214.2368673-3-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826084214.2368673-3-andrei.stefanescu@oss.nxp.com>

Hi Andrei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on robh/for-next linus/master v6.11-rc5 next-20240826]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrei-Stefanescu/dt-bindings-gpio-add-schema-for-NXP-S32G2-S32G3-SoCs/20240826-164853
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20240826084214.2368673-3-andrei.stefanescu%40oss.nxp.com
patch subject: [PATCH 2/3] drivers: gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240827/202408271011.hpcNokNu-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 08e5a1de8227512d4774a534b91cb2353cef6284)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408271011.hpcNokNu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408271011.hpcNokNu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpio/gpio-siul2-s32g2.c:11:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/gpio/gpio-siul2-s32g2.c:11:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/gpio/gpio-siul2-s32g2.c:11:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/gpio/gpio-siul2-s32g2.c:342:5: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     341 |                                 "Failed to initialize opad2%lu regmap config\n",
         |                                                            ~~~
         |                                                            %zu
     342 |                                 i);
         |                                 ^
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/gpio/gpio-siul2-s32g2.c:351:5: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     350 |                                 "Failed to initialize ipad2%lu regmap config\n",
         |                                                            ~~~
         |                                                            %zu
     351 |                                 i);
         |                                 ^
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/gpio/gpio-siul2-s32g2.c:499:5: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     498 |                                 "unable to get pinspec %lu from device tree\n",
         |                                                        ~~~
         |                                                        %zu
     499 |                                 i);
         |                                 ^
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   9 warnings generated.


vim +342 drivers/gpio/gpio-siul2-s32g2.c

   329	
   330	static int siul2_gpio_pads_init(struct platform_device *pdev,
   331					struct siul2_gpio_dev *gpio_dev)
   332	{
   333		struct device *dev = &pdev->dev;
   334		size_t i;
   335	
   336		for (i = 0; i < ARRAY_SIZE(gpio_dev->siul2); i++) {
   337			gpio_dev->siul2[i].opadmap = init_padregmap(pdev, gpio_dev, i,
   338								    false);
   339			if (IS_ERR(gpio_dev->siul2[i].opadmap)) {
   340				dev_err(dev,
   341					"Failed to initialize opad2%lu regmap config\n",
 > 342					i);
   343				return PTR_ERR(gpio_dev->siul2[i].opadmap);
   344			}
   345	
   346			gpio_dev->siul2[i].ipadmap = init_padregmap(pdev, gpio_dev, i,
   347								    true);
   348			if (IS_ERR(gpio_dev->siul2[i].ipadmap)) {
   349				dev_err(dev,
   350					"Failed to initialize ipad2%lu regmap config\n",
   351					i);
   352				return PTR_ERR(gpio_dev->siul2[i].ipadmap);
   353			}
   354		}
   355	
   356		return 0;
   357	}
   358	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

