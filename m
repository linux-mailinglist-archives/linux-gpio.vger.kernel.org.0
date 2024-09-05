Return-Path: <linux-gpio+bounces-9871-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B25296E484
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 22:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D228B20CA9
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 20:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC9C11A724A;
	Thu,  5 Sep 2024 20:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aepYPkNu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7DF19FA81;
	Thu,  5 Sep 2024 20:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725569804; cv=none; b=goj1IE+8/43LWWn8J3PZNO3asX1CFH9q+KW2UIVVAOlGy1RKL6rD7l8/5DgqUaCQlMaDpNdU6upN4UOKSlG6mwotiy5s382y02fOajMAgHtmmtTvTwZuj72j0cs64NJ/M7xLYs7w4cGgh1ZuUWd48WFvYZre9c3yBwjlceDvToM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725569804; c=relaxed/simple;
	bh=taQ4WCsCZh+bR4MBj6fpYJh1fvc9s4vNiUTT49UaCe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOfGSlMmJKmRux/90coPnx5caBjo/07j5y5ylbyHmsixZ+Wz7HXUHmRaceq8HiHRbWBT9RPU4ozO2lvhCFBzJwySCXLntXaImRoykUeZ7YQxBwcPsscDrCdOtuhsAunzTz/Gf107ao9Qoq0UKnC4/mX1R7ZSZ+xlgRBETZ8LnTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aepYPkNu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725569803; x=1757105803;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=taQ4WCsCZh+bR4MBj6fpYJh1fvc9s4vNiUTT49UaCe8=;
  b=aepYPkNui1no0Q/PZoHojoeIEOVi1XI7YcrhCr9puhxeyjmflJdOzmwK
   K9tBBZs/eDn/v9FvwHDI6bZOqSQmzkiVRQGHa6XcqO+/Knwhez6nYyQo6
   F3bN64gRiS3f5+sfaT51uRsf/WtaULKpkipHE4Rxbj+LiztlcIvkmHuh1
   lNaw3q7VAXxigS8umNYlTjTmn/PfvT+6beQWCyVroDlmrAL0cahUfRuVl
   dQQWrV/YvWLGEkcmsUUo4N4RCpBzD+ExFeYLVuYcj7TPdZu26/ljrsy90
   LYhPdS+/s/hkP+sR1zpScVWZppnFdrF68XadSPDZUYnGxlEElNBc6Lf+W
   g==;
X-CSE-ConnectionGUID: jMo0lMJBRE+N2nsg1ZBhTg==
X-CSE-MsgGUID: sJGdaoPfSHeEJBxASTxfQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="34914483"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="34914483"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 13:56:42 -0700
X-CSE-ConnectionGUID: AJFwPS1jR1iy0Xuu5ZI6Hg==
X-CSE-MsgGUID: ahRjGd+jRauQKKmxG1KOng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="65749821"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Sep 2024 13:56:38 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smJWu-000AKD-0X;
	Thu, 05 Sep 2024 20:56:36 +0000
Date: Fri, 6 Sep 2024 04:53:39 +0800
From: kernel test robot <lkp@intel.com>
To: Ma Ke <make24@iscas.ac.cn>, linus.walleij@linaro.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	bartosz.golaszewski@linaro.org, s.shtylyov@omp.ru,
	patrice.chotard@foss.st.com, antonio.borneo@foss.st.com,
	peng.fan@nxp.com, valentin.caron@foss.st.com,
	akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: stm32: check devm_kasprintf() returned value
Message-ID: <202409060455.cCSXg0Gt-lkp@intel.com>
References: <20240905020244.355474-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905020244.355474-1-make24@iscas.ac.cn>

Hi Ma,

kernel test robot noticed the following build errors:

[auto build test ERROR on atorgue-stm32/stm32-next]
[also build test ERROR on linusw-pinctrl/devel linusw-pinctrl/for-next akpm-mm/mm-everything linus/master v6.11-rc6 next-20240905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ma-Ke/pinctrl-stm32-check-devm_kasprintf-returned-value/20240905-100531
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20240905020244.355474-1-make24%40iscas.ac.cn
patch subject: [PATCH] pinctrl: stm32: check devm_kasprintf() returned value
config: arc-randconfig-001-20240906 (https://download.01.org/0day-ci/archive/20240906/202409060455.cCSXg0Gt-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409060455.cCSXg0Gt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409060455.cCSXg0Gt-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/stm32/pinctrl-stm32.c: In function 'stm32_gpiolib_register_bank':
>> drivers/pinctrl/stm32/pinctrl-stm32.c:1379:30: error: 'name' undeclared (first use in this function); did you mean 'names'?
    1379 |                         if (!name[i]) {
         |                              ^~~~
         |                              names
   drivers/pinctrl/stm32/pinctrl-stm32.c:1379:30: note: each undeclared identifier is reported only once for each function it appears in


vim +1379 drivers/pinctrl/stm32/pinctrl-stm32.c

  1287	
  1288	static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode_handle *fwnode)
  1289	{
  1290		struct stm32_gpio_bank *bank = &pctl->banks[pctl->nbanks];
  1291		int bank_ioport_nr;
  1292		struct pinctrl_gpio_range *range = &bank->range;
  1293		struct fwnode_reference_args args;
  1294		struct device *dev = pctl->dev;
  1295		struct resource res;
  1296		int npins = STM32_GPIO_PINS_PER_BANK;
  1297		int bank_nr, err, i = 0;
  1298		struct stm32_desc_pin *stm32_pin;
  1299		char **names;
  1300	
  1301		if (!IS_ERR(bank->rstc))
  1302			reset_control_deassert(bank->rstc);
  1303	
  1304		if (of_address_to_resource(to_of_node(fwnode), 0, &res))
  1305			return -ENODEV;
  1306	
  1307		bank->base = devm_ioremap_resource(dev, &res);
  1308		if (IS_ERR(bank->base))
  1309			return PTR_ERR(bank->base);
  1310	
  1311		err = clk_prepare_enable(bank->clk);
  1312		if (err) {
  1313			dev_err(dev, "failed to prepare_enable clk (%d)\n", err);
  1314			return err;
  1315		}
  1316	
  1317		bank->gpio_chip = stm32_gpio_template;
  1318	
  1319		fwnode_property_read_string(fwnode, "st,bank-name", &bank->gpio_chip.label);
  1320	
  1321		if (!fwnode_property_get_reference_args(fwnode, "gpio-ranges", NULL, 3, i, &args)) {
  1322			bank_nr = args.args[1] / STM32_GPIO_PINS_PER_BANK;
  1323			bank->gpio_chip.base = args.args[1];
  1324	
  1325			/* get the last defined gpio line (offset + nb of pins) */
  1326			npins = args.args[0] + args.args[2];
  1327			while (!fwnode_property_get_reference_args(fwnode, "gpio-ranges", NULL, 3, ++i, &args))
  1328				npins = max(npins, (int)(args.args[0] + args.args[2]));
  1329		} else {
  1330			bank_nr = pctl->nbanks;
  1331			bank->gpio_chip.base = bank_nr * STM32_GPIO_PINS_PER_BANK;
  1332			range->name = bank->gpio_chip.label;
  1333			range->id = bank_nr;
  1334			range->pin_base = range->id * STM32_GPIO_PINS_PER_BANK;
  1335			range->base = range->id * STM32_GPIO_PINS_PER_BANK;
  1336			range->npins = npins;
  1337			range->gc = &bank->gpio_chip;
  1338			pinctrl_add_gpio_range(pctl->pctl_dev,
  1339					       &pctl->banks[bank_nr].range);
  1340		}
  1341	
  1342		if (fwnode_property_read_u32(fwnode, "st,bank-ioport", &bank_ioport_nr))
  1343			bank_ioport_nr = bank_nr;
  1344	
  1345		bank->gpio_chip.base = -1;
  1346	
  1347		bank->gpio_chip.ngpio = npins;
  1348		bank->gpio_chip.fwnode = fwnode;
  1349		bank->gpio_chip.parent = dev;
  1350		bank->bank_nr = bank_nr;
  1351		bank->bank_ioport_nr = bank_ioport_nr;
  1352		bank->secure_control = pctl->match_data->secure_control;
  1353		spin_lock_init(&bank->lock);
  1354	
  1355		if (pctl->domain) {
  1356			/* create irq hierarchical domain */
  1357			bank->fwnode = fwnode;
  1358	
  1359			bank->domain = irq_domain_create_hierarchy(pctl->domain, 0, STM32_GPIO_IRQ_LINE,
  1360								   bank->fwnode, &stm32_gpio_domain_ops,
  1361								   bank);
  1362	
  1363			if (!bank->domain) {
  1364				err = -ENODEV;
  1365				goto err_clk;
  1366			}
  1367		}
  1368	
  1369		names = devm_kcalloc(dev, npins, sizeof(char *), GFP_KERNEL);
  1370		if (!names) {
  1371			err = -ENOMEM;
  1372			goto err_clk;
  1373		}
  1374	
  1375		for (i = 0; i < npins; i++) {
  1376			stm32_pin = stm32_pctrl_get_desc_pin_from_gpio(pctl, bank, i);
  1377			if (stm32_pin && stm32_pin->pin.name) {
  1378				names[i] = devm_kasprintf(dev, GFP_KERNEL, "%s", stm32_pin->pin.name);
> 1379				if (!name[i]) {
  1380					err = -ENOMEM;
  1381					goto err_clk;
  1382				}
  1383			}
  1384			else
  1385				names[i] = NULL;
  1386		}
  1387	
  1388		bank->gpio_chip.names = (const char * const *)names;
  1389	
  1390		err = gpiochip_add_data(&bank->gpio_chip, bank);
  1391		if (err) {
  1392			dev_err(dev, "Failed to add gpiochip(%d)!\n", bank_nr);
  1393			goto err_clk;
  1394		}
  1395	
  1396		dev_info(dev, "%s bank added\n", bank->gpio_chip.label);
  1397		return 0;
  1398	
  1399	err_clk:
  1400		clk_disable_unprepare(bank->clk);
  1401		return err;
  1402	}
  1403	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

