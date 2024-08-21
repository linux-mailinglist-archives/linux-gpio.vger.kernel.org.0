Return-Path: <linux-gpio+bounces-8936-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF9B959B41
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 14:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D3FA282F20
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 12:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699C61531CA;
	Wed, 21 Aug 2024 12:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EjMZn57m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544C51D1312;
	Wed, 21 Aug 2024 12:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724241999; cv=none; b=W3b04C5FCG7dEY6I5R7ZSF+uIkOlILw/oSp0DfI1946oxUiPJSaSWQByftux0KYLhS45tmlYhthE0xEKiDqTUh+fDMGKCDruRSCq6d6rAcC0klIreN7RCMPTUss2zbP2+CY6UUfGuKt5v1BnR52mCnCk8jEaJxFOtBRTigiygyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724241999; c=relaxed/simple;
	bh=Kj8uuOcm4JlYZ678mI6tf+JnYFcP0xeBPYn2L2P0sNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BkeOHUxeAJFKQaQz7OKQ9mWHSxviZFPN50UqQdVwqBUzKsX+7Q/4F0+yE4Wd40fEmvxv2hSmy3sj4hcpQF3597pLFTOk44m/Wvi+xOSpO/P3mgS8PKfNJhqZfff++ETaU0Az08EoXvBRalmzMoH/QQDA09zkDbqzCYJxgnDBqEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EjMZn57m; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724241997; x=1755777997;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Kj8uuOcm4JlYZ678mI6tf+JnYFcP0xeBPYn2L2P0sNk=;
  b=EjMZn57mqDXy0ANe3z82TFgsNtNb79VTYk+M61Qtg84eD2eO8nfXhyHu
   Ir8JTKJBGbxFw2eSEYxkp4JG0aed/FbOPM6xe9m1SMcyxXXpwMcuxpPAW
   YpF1/qSBhTevCi0IkOyCYOFSDg+f4sj1WhfNDO5cgyiNLiAkLtYpdjtrL
   S08ArQ4zPeeUtO0d476zSsJ+VUlMA27HPdV2JCQord8te8p3vI2uMSwYF
   JyWvBeQwzzTyuA3/tZAbm2d22jw0FPPPE4buwUb8HD+rgh0BklNbj+sBy
   D4Wk8rlnL8QPrKog8mUzjLNOhowtK6mvVyohy5WzR/tdUYsCxbD/L72vb
   g==;
X-CSE-ConnectionGUID: dYPZxy1YQLeJNqL5k0trSA==
X-CSE-MsgGUID: M76MaHF4Sr2DiU/97wDbPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22759914"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22759914"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 05:06:36 -0700
X-CSE-ConnectionGUID: 4EbM2F/MQ76zX1yOg/4iXg==
X-CSE-MsgGUID: xKFjc2FlQsOqtXBuL8aw5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="61825276"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Aug 2024 05:06:30 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgk6d-000BKM-08;
	Wed, 21 Aug 2024 12:06:27 +0000
Date: Wed, 21 Aug 2024 20:06:23 +0800
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
Subject: Re: [PATCH 07/11] pinctrl: rp1: Implement RaspberryPi RP1 gpio
 support
Message-ID: <202408211907.cUrf3RpN-lkp@intel.com>
References: <eb39a5f3cefff2a1240a18a255dac090af16f223.1724159867.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb39a5f3cefff2a1240a18a255dac090af16f223.1724159867.git.andrea.porta@suse.com>

Hi Andrea,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on robh/for-next char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.11-rc4 next-20240821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrea-della-Porta/dt-bindings-clock-Add-RaspberryPi-RP1-clock-bindings/20240821-023901
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/eb39a5f3cefff2a1240a18a255dac090af16f223.1724159867.git.andrea.porta%40suse.com
patch subject: [PATCH 07/11] pinctrl: rp1: Implement RaspberryPi RP1 gpio support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240821/202408211907.cUrf3RpN-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408211907.cUrf3RpN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408211907.cUrf3RpN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/pinctrl-rp1.c: In function 'rp1_get_fsel':
>> drivers/pinctrl/pinctrl-rp1.c:237:22: error: implicit declaration of function 'FIELD_GET'; did you mean 'FIELD_SET'? [-Werror=implicit-function-declaration]
     237 |         u32 oeover = FIELD_GET(RP1_GPIO_CTRL_OEOVER_MASK, ctrl);
         |                      ^~~~~~~~~
         |                      FIELD_SET
   drivers/pinctrl/pinctrl-rp1.c: In function 'rp1_set_fsel':
>> drivers/pinctrl/pinctrl-rp1.c:146:25: error: implicit declaration of function 'FIELD_PREP'; did you mean 'FIELD_SET'? [-Werror=implicit-function-declaration]
     146 |                 _reg |= FIELD_PREP((_mask), (_val));    \
         |                         ^~~~~~~~~~
   drivers/pinctrl/pinctrl-rp1.c:257:17: note: in expansion of macro 'FIELD_SET'
     257 |                 FIELD_SET(ctrl, RP1_GPIO_CTRL_OEOVER_MASK, RP1_OEOVER_DISABLE);
         |                 ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +237 drivers/pinctrl/pinctrl-rp1.c

   136	
   137	#define RP1_PAD_DRIVE_2MA		0x00000000
   138	#define RP1_PAD_DRIVE_4MA		BIT(4)
   139	#define RP1_PAD_DRIVE_8MA		BIT(5)
   140	#define RP1_PAD_DRIVE_12MA		(RP1_PAD_DRIVE_4MA | \
   141						RP1_PAD_DRIVE_8MA)
   142	
   143	#define FIELD_SET(_reg, _mask, _val)			\
   144		({						\
   145			_reg &= ~(_mask);				\
 > 146			_reg |= FIELD_PREP((_mask), (_val));	\
   147		})
   148	
   149	#define FUNC(f) \
   150		[func_##f] = #f
   151	
   152	struct rp1_iobank_desc {
   153		int min_gpio;
   154		int num_gpios;
   155		int gpio_offset;
   156		int inte_offset;
   157		int ints_offset;
   158		int rio_offset;
   159		int pads_offset;
   160	};
   161	
   162	struct rp1_pin_info {
   163		u8 num;
   164		u8 bank;
   165		u8 offset;
   166		u8 fsel;
   167		u8 irq_type;
   168	
   169		void __iomem *gpio;
   170		void __iomem *rio;
   171		void __iomem *inte;
   172		void __iomem *ints;
   173		void __iomem *pad;
   174	};
   175	
   176	struct rp1_pinctrl {
   177		struct device *dev;
   178		void __iomem *gpio_base;
   179		void __iomem *rio_base;
   180		void __iomem *pads_base;
   181		int irq[RP1_NUM_BANKS];
   182		struct rp1_pin_info pins[RP1_NUM_GPIOS];
   183	
   184		struct pinctrl_dev *pctl_dev;
   185		struct gpio_chip gpio_chip;
   186		struct pinctrl_gpio_range gpio_range;
   187	
   188		raw_spinlock_t irq_lock[RP1_NUM_BANKS];
   189	};
   190	
   191	const struct rp1_iobank_desc rp1_iobanks[RP1_NUM_BANKS] = {
   192		/*         gpio   inte    ints     rio    pads */
   193		{  0, 28, 0x0000, 0x011c, 0x0124, 0x0000, 0x0004 },
   194		{ 28,  6, 0x4000, 0x411c, 0x4124, 0x4000, 0x4004 },
   195		{ 34, 20, 0x8000, 0x811c, 0x8124, 0x8000, 0x8004 },
   196	};
   197	
   198	static int rp1_pinconf_set(struct rp1_pin_info *pin,
   199				   unsigned int offset, unsigned long *configs,
   200				   unsigned int num_configs);
   201	
   202	static struct rp1_pin_info *rp1_get_pin(struct gpio_chip *chip,
   203						unsigned int offset)
   204	{
   205		struct rp1_pinctrl *pc = gpiochip_get_data(chip);
   206	
   207		if (pc && offset < RP1_NUM_GPIOS)
   208			return &pc->pins[offset];
   209		return NULL;
   210	}
   211	
   212	static void rp1_pad_update(struct rp1_pin_info *pin, u32 clr, u32 set)
   213	{
   214		u32 padctrl = readl(pin->pad);
   215	
   216		padctrl &= ~clr;
   217		padctrl |= set;
   218	
   219		writel(padctrl, pin->pad);
   220	}
   221	
   222	static void rp1_input_enable(struct rp1_pin_info *pin, int value)
   223	{
   224		rp1_pad_update(pin, RP1_PAD_IN_ENABLE_MASK,
   225			       value ? RP1_PAD_IN_ENABLE_MASK : 0);
   226	}
   227	
   228	static void rp1_output_enable(struct rp1_pin_info *pin, int value)
   229	{
   230		rp1_pad_update(pin, RP1_PAD_OUT_DISABLE_MASK,
   231			       value ? 0 : RP1_PAD_OUT_DISABLE_MASK);
   232	}
   233	
   234	static u32 rp1_get_fsel(struct rp1_pin_info *pin)
   235	{
   236		u32 ctrl = readl(pin->gpio + RP1_GPIO_CTRL);
 > 237		u32 oeover = FIELD_GET(RP1_GPIO_CTRL_OEOVER_MASK, ctrl);
   238		u32 fsel = FIELD_GET(RP1_GPIO_CTRL_FUNCSEL_MASK, ctrl);
   239	
   240		if (oeover != RP1_OEOVER_PERI || fsel >= RP1_FSEL_COUNT)
   241			fsel = RP1_FSEL_NONE;
   242	
   243		return fsel;
   244	}
   245	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

