Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C29D3234A5
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Feb 2021 01:47:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233043AbhBXAbh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Feb 2021 19:31:37 -0500
Received: from mga11.intel.com ([192.55.52.93]:20842 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233778AbhBWXuF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Feb 2021 18:50:05 -0500
IronPort-SDR: 36S20iRkE5waUG8Vb92D9UuSsGjV5/5U+N9XlhBfZe2IUUihSu1cgGg7mmKBEAyWg9FKjQXz3x
 jnTnkHwzNDmw==
X-IronPort-AV: E=McAfee;i="6000,8403,9904"; a="181553678"
X-IronPort-AV: E=Sophos;i="5.81,201,1610438400"; 
   d="gz'50?scan'50,208,50";a="181553678"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2021 15:48:24 -0800
IronPort-SDR: v73SzbXoIiHhlUKftKwiSaD33UrkKdgPptXCgjRFE1jcLcLtmzZaAKT4Xa1hrYo66NG0p0SgPQ
 OKLhqHXNs3Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,201,1610438400"; 
   d="gz'50?scan'50,208,50";a="364701616"
Received: from lkp-server01.sh.intel.com (HELO 16660e54978b) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Feb 2021 15:48:21 -0800
Received: from kbuild by 16660e54978b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lEhPh-0001d1-43; Tue, 23 Feb 2021 23:48:21 +0000
Date:   Wed, 24 Feb 2021 07:47:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauri Sandberg <sandberg@mailfence.com>, linux-gpio@vger.kernel.org
Cc:     kbuild-all@lists.01.org, Mauri Sandberg <sandberg@mailfence.com>
Subject: Re: [PATCH] gpio: driver for the NXP 74HC153 chip
Message-ID: <202102240757.SWtP3M0P-lkp@intel.com>
References: <20210223195326.1355245-2-sandberg@mailfence.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline
In-Reply-To: <20210223195326.1355245-2-sandberg@mailfence.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mauri,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on gpio/for-next]
[also build test ERROR on v5.11 next-20210223]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Mauri-Sandberg/gpio-driver-for-the-NXP-74HC153-chip/20210224-040026
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git for-next
config: s390-allmodconfig (attached as .config)
compiler: s390-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/04cf14b1b4dad0702e35202513962925fdf8113f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Mauri-Sandberg/gpio-driver-for-the-NXP-74HC153-chip/20210224-040026
        git checkout 04cf14b1b4dad0702e35202513962925fdf8113f
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=s390 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-nxp-74hc153.c: In function 'nxp_74hc153_get_value':
   drivers/gpio/gpio-nxp-74hc153.c:75:36: warning: variable 'pdata' set but not used [-Wunused-but-set-variable]
      75 |  struct nxp_74hc153_platform_data *pdata;
         |                                    ^~~~~
   drivers/gpio/gpio-nxp-74hc153.c: In function 'nxp_74hc153_probe':
>> drivers/gpio/gpio-nxp-74hc153.c:216:4: error: 'struct gpio_chip' has no member named 'of_node'
     216 |  gc->of_node = np;
         |    ^~


vim +216 drivers/gpio/gpio-nxp-74hc153.c

   103	
   104	static int nxp_74hc153_probe(struct platform_device *pdev)
   105	{
   106		struct device_node *np = pdev->dev.of_node;
   107		struct nxp_74hc153_chip *nxp;
   108		struct gpio_chip *gc;
   109		int err;
   110		unsigned gpio_s0;
   111		unsigned gpio_s1;
   112		unsigned gpio_1y;
   113	        unsigned gpio_2y;
   114	
   115		nxp = kzalloc(sizeof(struct nxp_74hc153_chip), GFP_KERNEL);
   116		if (nxp == NULL) {
   117			dev_err(&pdev->dev, "no memory for private data\n");
   118			return -ENOMEM;
   119		}
   120	
   121		gpio_s0 = of_get_named_gpio(np, "gpio-s0", 0);
   122		gpio_s1 = of_get_named_gpio(np, "gpio-s1", 0);
   123		gpio_1y = of_get_named_gpio(np, "gpio-1y", 0);
   124		gpio_2y = of_get_named_gpio(np, "gpio-2y", 0);
   125	
   126		if (!gpio_is_valid(gpio_s0) || !gpio_is_valid(gpio_s1) ||
   127	  	    !gpio_is_valid(gpio_1y) || !gpio_is_valid(gpio_2y)) {
   128	
   129			dev_err(&pdev->dev, "control GPIO(s) are missing\n");
   130			err = -EINVAL;
   131			goto err_free_nxp;
   132		} else {
   133			nxp->config.gpio_pin_s0 = gpio_s0;
   134			nxp->config.gpio_pin_s1 = gpio_s1;
   135			nxp->config.gpio_pin_1y = gpio_1y;
   136			nxp->config.gpio_pin_2y = gpio_2y;
   137		}
   138	
   139		// apply pin configuration
   140		err = gpio_request(nxp->config.gpio_pin_s0, dev_name(&pdev->dev));
   141		if (err) {
   142			dev_err(&pdev->dev, "unable to claim gpio %u, err=%d\n",
   143				nxp->config.gpio_pin_s0, err);
   144			goto err_free_nxp;
   145		}
   146	
   147		err = gpio_request(nxp->config.gpio_pin_s1, dev_name(&pdev->dev));
   148		if (err) {
   149			dev_err(&pdev->dev, "unable to claim gpio %u, err=%d\n",
   150				nxp->config.gpio_pin_s1, err);
   151			goto err_free_s0;
   152		}
   153	
   154		err = gpio_request(nxp->config.gpio_pin_1y, dev_name(&pdev->dev));
   155		if (err) {
   156			dev_err(&pdev->dev, "unable to claim gpio %u, err=%d\n",
   157				nxp->config.gpio_pin_1y, err);
   158			goto err_free_s1;
   159		}
   160	
   161		err = gpio_request(nxp->config.gpio_pin_2y, dev_name(&pdev->dev));
   162		if (err) {
   163			dev_err(&pdev->dev, "unable to claim gpio %u, err=%d\n",
   164				nxp->config.gpio_pin_2y, err);
   165			goto err_free_1y;
   166		}
   167	
   168		err = gpio_direction_output(nxp->config.gpio_pin_s0, 0);
   169		if (err) {
   170			dev_err(&pdev->dev,
   171				"unable to set direction of gpio %u, err=%d\n",
   172				nxp->config.gpio_pin_s0, err);
   173			goto err_free_2y;
   174		}
   175	
   176		err = gpio_direction_output(nxp->config.gpio_pin_s1, 0);
   177		if (err) {
   178			dev_err(&pdev->dev,
   179				"unable to set direction of gpio %u, err=%d\n",
   180				nxp->config.gpio_pin_s1, err);
   181			goto err_free_2y;
   182		}
   183	
   184		err = gpio_direction_input(nxp->config.gpio_pin_1y);
   185		if (err) {
   186			dev_err(&pdev->dev,
   187				"unable to set direction of gpio %u, err=%d\n",
   188				nxp->config.gpio_pin_1y, err);
   189			goto err_free_2y;
   190		}
   191	
   192		err = gpio_direction_input(nxp->config.gpio_pin_2y);
   193		if (err) {
   194			dev_err(&pdev->dev,
   195				"unable to set direction of gpio %u, err=%d\n",
   196				nxp->config.gpio_pin_2y, err);
   197			goto err_free_2y;
   198		}
   199	
   200		nxp->parent = &pdev->dev;
   201		mutex_init(&nxp->lock);
   202	
   203		gc = &nxp->gpio_chip;
   204	
   205		gc->direction_input  = nxp_74hc153_direction_input;
   206		gc->direction_output = nxp_74hc153_direction_output;
   207		gc->get = nxp_74hc153_get_value;
   208		gc->set = nxp_74hc153_set_value;
   209		gc->can_sleep = 1;
   210	
   211		gc->base = -1;
   212		gc->ngpio = NXP_74HC153_NUM_GPIOS;
   213		gc->label = dev_name(nxp->parent);
   214		gc->parent = nxp->parent;
   215		gc->owner = THIS_MODULE;
 > 216		gc->of_node = np;
   217	
   218		err = gpiochip_add(&nxp->gpio_chip);
   219		if (err) {
   220			dev_err(&pdev->dev, "unable to add gpio chip, err=%d\n", err);
   221			goto err_free_2y;
   222		}
   223	
   224		platform_set_drvdata(pdev, nxp);
   225		return 0;
   226	
   227	err_free_2y:
   228		gpio_free(nxp->config.gpio_pin_2y);
   229	err_free_1y:
   230		gpio_free(nxp->config.gpio_pin_1y);
   231	err_free_s1:
   232		gpio_free(nxp->config.gpio_pin_s1);
   233	err_free_s0:
   234		gpio_free(nxp->config.gpio_pin_s0);
   235	err_free_nxp:
   236		kfree(nxp);
   237		return err;
   238	}
   239	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--rwEMma7ioTxnRzrJ
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
AA==

--rwEMma7ioTxnRzrJ--
