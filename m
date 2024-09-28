Return-Path: <linux-gpio+bounces-10532-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F07BF988DB8
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Sep 2024 05:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4273F28091B
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Sep 2024 03:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BBE514D2B1;
	Sat, 28 Sep 2024 03:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RGa8siSW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD753218B;
	Sat, 28 Sep 2024 03:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727493906; cv=none; b=gjxniQHBbhqSuPGP+acVN0TLKM3Xnj1P92fXMTShTZxv4xvi9bsylEoqknHGqEftXOmM23Z2Uies66I7inDCevjbHjpMJIHAf48+TBGgViINNFkXViixw4mjfI6RAUhWk13L5aKwc9o5fcqTcfgD29qDapvufkryiFH7U8K58nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727493906; c=relaxed/simple;
	bh=oSv/hrz5syVfs0mQq+pOXzwhXAzulQxdP2NB6+XqghA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YiDrOZmc9BHMLh+dM7g3YqqIL/ZVTs9MMqoCTUKc6OzJF0QRc/Kr/f1JMdrC0nVTLssimSB26hvn/MfURx7691O/oCrP660/PZVEXUvL2tVWYzyB/Yar/9xtrz+6QCaimZOj5ObZn5FGsJrJgY7m+0WDoFX2pyETi2pAKgbgOEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RGa8siSW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727493905; x=1759029905;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oSv/hrz5syVfs0mQq+pOXzwhXAzulQxdP2NB6+XqghA=;
  b=RGa8siSWahNDnHkDf1NK0foFRiuLzNEnAK6pqmVjEo+iL9ZaUQAfC9Wk
   UYREw9/KF//DKgHcvJ3NQotkqgaPyUqcuScvu392RPS+YR0k8vuFV3kd9
   H2UMrAdSZaV+w5Tim6cQB03Yl/arS31dy06WwvcGb2MONQBhTn7lDPEao
   u+d/vKL07dguG1b7xRA6FEKIq/2OOkPxQ1sH7xkHkzPZ3OLXCL23dGuKc
   3dZYXyIcoAbjfgqHxGPNMl4P+5sG92UR8VqftdiL94uHH65ab/UpqYfNB
   N6izs95m+DbViPPwehnGiZcSYRxcKsxRZIJXpjUKuucjvy0TT2bSYPDu5
   Q==;
X-CSE-ConnectionGUID: Z1nhGa9QScqQpKXH9vBXkw==
X-CSE-MsgGUID: EyKkwSthR7aVHdYfN996+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26519934"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26519934"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 20:25:04 -0700
X-CSE-ConnectionGUID: 9JmC+vnRTlKbrrThEK3U5g==
X-CSE-MsgGUID: rPHb/3AKSrC+aAovPzJwiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72785976"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Sep 2024 20:24:59 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suO4m-000Mt3-1O;
	Sat, 28 Sep 2024 03:24:56 +0000
Date: Sat, 28 Sep 2024 11:24:39 +0800
From: kernel test robot <lkp@intel.com>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: Re: [PATCH v4 3/4] gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs
 support
Message-ID: <202409281117.IOrJBXgL-lkp@intel.com>
References: <20240926143122.1385658-4-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926143122.1385658-4-andrei.stefanescu@oss.nxp.com>

Hi Andrei,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus robh/for-next linus/master v6.11 next-20240927]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrei-Stefanescu/drivers-provide-devm_platform_get_and_ioremap_resource_byname/20240926-223448
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20240926143122.1385658-4-andrei.stefanescu%40oss.nxp.com
patch subject: [PATCH v4 3/4] gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240928/202409281117.IOrJBXgL-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281117.IOrJBXgL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281117.IOrJBXgL-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
>> drivers/gpio/gpio-siul2-s32g2.c:296:32: warning: comparison of distinct pointer types ('typeof ((size)) *' (aka 'unsigned int *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
     296 |                 conf->num_reg_defaults_raw = do_div(size, conf->reg_stride);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:222:28: note: expanded from macro 'do_div'
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
>> drivers/gpio/gpio-siul2-s32g2.c:296:32: error: incompatible pointer types passing 'resource_size_t *' (aka 'unsigned int *') to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
     296 |                 conf->num_reg_defaults_raw = do_div(size, conf->reg_stride);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:238:22: note: expanded from macro 'do_div'
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
   include/asm-generic/div64.h:213:38: note: passing argument to parameter 'dividend' here
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                                      ^
>> drivers/gpio/gpio-siul2-s32g2.c:296:32: warning: shift count >= width of type [-Wshift-count-overflow]
     296 |                 conf->num_reg_defaults_raw = do_div(size, conf->reg_stride);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:234:25: note: expanded from macro 'do_div'
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^  ~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   8 warnings and 1 error generated.


vim +296 drivers/gpio/gpio-siul2-s32g2.c

   273	
   274	static struct regmap *common_regmap_init(struct platform_device *pdev,
   275						 struct regmap_config *conf,
   276						 const char *name)
   277	{
   278		struct device *dev = &pdev->dev;
   279		struct resource *res;
   280		resource_size_t size;
   281		void __iomem *base;
   282	
   283		base = devm_platform_get_and_ioremap_resource_byname(pdev, name, &res);
   284		if (IS_ERR(base)) {
   285			dev_err(&pdev->dev, "Failed to get MEM resource: %s\n", name);
   286			return ERR_PTR(-EINVAL);
   287		}
   288	
   289		size = resource_size(res);
   290		conf->val_bits = conf->reg_stride * 8;
   291		conf->max_register = size - conf->reg_stride;
   292		conf->name = name;
   293		conf->use_raw_spinlock = true;
   294	
   295		if (conf->cache_type != REGCACHE_NONE)
 > 296			conf->num_reg_defaults_raw = do_div(size, conf->reg_stride);
   297	
   298		return devm_regmap_init_mmio(dev, base, conf);
   299	}
   300	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

