Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6B9D8D2F9
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 14:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727650AbfHNMXu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 08:23:50 -0400
Received: from mga18.intel.com ([134.134.136.126]:18761 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726265AbfHNMXu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Aug 2019 08:23:50 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Aug 2019 05:23:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,385,1559545200"; 
   d="gz'50?scan'50,208,50";a="167406056"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 14 Aug 2019 05:23:47 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hxsJe-000Gck-G1; Wed, 14 Aug 2019 20:23:46 +0800
Date:   Wed, 14 Aug 2019 20:23:09 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     kbuild-all@01.org, linux-gpio@vger.kernel.org,
        Thierry Reding <treding@nvidia.com>,
        Brian Masney <masneyb@onstation.org>
Subject: [gpio:devel 21/25] drivers/gpio/gpiolib.c:2112:28: error: 'struct
 gpio_irq_chip' has no member named 'child_offset_to_irq'
Message-ID: <201908142007.V8WIQ09z%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3cnucfsu6sngv3mu"
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--3cnucfsu6sngv3mu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/linusw/linux-gpio.git devel
head:   470219c619e9f76e41497b9a90f2ec61dbedf3f2
commit: 9d5f07204350d557ec1e2d9bd2f779b45b490931 [21/25] gpio: Add support for hierarchical IRQ domains
config: nios2-10m50_defconfig (attached as .config)
compiler: nios2-linux-gcc (GCC) 7.4.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 9d5f07204350d557ec1e2d9bd2f779b45b490931
        # save the attached .config to linux build tree
        GCC_VERSION=7.4.0 make.cross ARCH=nios2 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpio/gpiolib.c: In function 'gpiochip_to_irq':
>> drivers/gpio/gpiolib.c:2112:28: error: 'struct gpio_irq_chip' has no member named 'child_offset_to_irq'
      spec.param[0] = chip->irq.child_offset_to_irq(chip, offset);
                               ^
   In file included from include/asm-generic/gpio.h:13:0,
                    from include/linux/gpio.h:62,
                    from drivers/gpio/gpiolib.c:13:
   At top level:
   include/linux/gpio/driver.h:553:13: warning: 'gpiochip_populate_parent_fwspec_fourcell' defined but not used [-Wunused-function]
    static void gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *chip,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/gpio/driver.h:546:13: warning: 'gpiochip_populate_parent_fwspec_twocell' defined but not used [-Wunused-function]
    static void gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *chip,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +2112 drivers/gpio/gpiolib.c

  2099	
  2100	static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
  2101	{
  2102		struct irq_domain *domain = chip->irq.domain;
  2103	
  2104		if (!gpiochip_irqchip_irq_valid(chip, offset))
  2105			return -ENXIO;
  2106	
  2107		if (irq_domain_is_hierarchy(domain)) {
  2108			struct irq_fwspec spec;
  2109	
  2110			spec.fwnode = domain->fwnode;
  2111			spec.param_count = 2;
> 2112			spec.param[0] = chip->irq.child_offset_to_irq(chip, offset);
  2113			spec.param[1] = IRQ_TYPE_NONE;
  2114	
  2115			return irq_create_fwspec_mapping(&spec);
  2116		}
  2117	
  2118		return irq_create_mapping(domain, offset);
  2119	}
  2120	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--3cnucfsu6sngv3mu
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
JnmQkZS7tqw9BcH/AENdX/gqlwAA

--3cnucfsu6sngv3mu--
