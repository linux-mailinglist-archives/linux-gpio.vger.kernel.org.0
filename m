Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7A17165571
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 04:04:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbgBTDE0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 22:04:26 -0500
Received: from mga18.intel.com ([134.134.136.126]:53379 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727476AbgBTDE0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 Feb 2020 22:04:26 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Feb 2020 19:04:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,462,1574150400"; 
   d="gz'50?scan'50,208,50";a="229999180"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 19 Feb 2020 19:04:20 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j4c8S-00063Q-9U; Thu, 20 Feb 2020 11:04:20 +0800
Date:   Thu, 20 Feb 2020 11:03:57 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     kbuild-all@lists.01.org, Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 4/7] nvmem: increase the reference count of a gpio
 passed over config
Message-ID: <202002201042.dEPPA014%lkp@intel.com>
References: <20200218094234.23896-5-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline
In-Reply-To: <20200218094234.23896-5-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bartosz,

I love your patch! Perhaps something to improve:

[auto build test WARNING on gpio/for-next]
[also build test WARNING on linus/master v5.6-rc2]
[cannot apply to next-20200219]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Bartosz-Golaszewski/nvmem-gpio-fix-resource-management/20200220-045651
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git for-next
config: nios2-3c120_defconfig (attached as .config)
compiler: nios2-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.5.0 make.cross ARCH=nios2 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/nvmem/core.c: In function 'nvmem_register':
   drivers/nvmem/core.c:349:20: error: implicit declaration of function 'gpiod_ref'; did you mean 'gpiod_get'? [-Werror=implicit-function-declaration]
      nvmem->wp_gpio = gpiod_ref(config->wp_gpio);
                       ^~~~~~~~~
                       gpiod_get
>> drivers/nvmem/core.c:349:18: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
      nvmem->wp_gpio = gpiod_ref(config->wp_gpio);
                     ^
   cc1: some warnings being treated as errors

vim +349 drivers/nvmem/core.c

   322	
   323	/**
   324	 * nvmem_register() - Register a nvmem device for given nvmem_config.
   325	 * Also creates an binary entry in /sys/bus/nvmem/devices/dev-name/nvmem
   326	 *
   327	 * @config: nvmem device configuration with which nvmem device is created.
   328	 *
   329	 * Return: Will be an ERR_PTR() on error or a valid pointer to nvmem_device
   330	 * on success.
   331	 */
   332	
   333	struct nvmem_device *nvmem_register(const struct nvmem_config *config)
   334	{
   335		struct nvmem_device *nvmem;
   336		int rval;
   337	
   338		if (!config->dev)
   339			return ERR_PTR(-EINVAL);
   340	
   341		nvmem = kzalloc(sizeof(*nvmem), GFP_KERNEL);
   342		if (!nvmem)
   343			return ERR_PTR(-ENOMEM);
   344	
   345		rval  = ida_simple_get(&nvmem_ida, 0, 0, GFP_KERNEL);
   346		if (rval < 0)
   347			goto err_free_nvmem;
   348		if (config->wp_gpio)
 > 349			nvmem->wp_gpio = gpiod_ref(config->wp_gpio);
   350		else
   351			nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
   352							    GPIOD_OUT_HIGH);
   353		if (IS_ERR(nvmem->wp_gpio))
   354			goto err_ida_remove;
   355	
   356	
   357		kref_init(&nvmem->refcnt);
   358		INIT_LIST_HEAD(&nvmem->cells);
   359	
   360		nvmem->id = rval;
   361		nvmem->owner = config->owner;
   362		if (!nvmem->owner && config->dev->driver)
   363			nvmem->owner = config->dev->driver->owner;
   364		nvmem->stride = config->stride ?: 1;
   365		nvmem->word_size = config->word_size ?: 1;
   366		nvmem->size = config->size;
   367		nvmem->dev.type = &nvmem_provider_type;
   368		nvmem->dev.bus = &nvmem_bus_type;
   369		nvmem->dev.parent = config->dev;
   370		nvmem->priv = config->priv;
   371		nvmem->type = config->type;
   372		nvmem->reg_read = config->reg_read;
   373		nvmem->reg_write = config->reg_write;
   374		if (!config->no_of_node)
   375			nvmem->dev.of_node = config->dev->of_node;
   376	
   377		if (config->id == -1 && config->name) {
   378			dev_set_name(&nvmem->dev, "%s", config->name);
   379		} else {
   380			dev_set_name(&nvmem->dev, "%s%d",
   381				     config->name ? : "nvmem",
   382				     config->name ? config->id : nvmem->id);
   383		}
   384	
   385		nvmem->read_only = device_property_present(config->dev, "read-only") ||
   386				   config->read_only || !nvmem->reg_write;
   387	
   388		nvmem->dev.groups = nvmem_sysfs_get_groups(nvmem, config);
   389	
   390		device_initialize(&nvmem->dev);
   391	
   392		dev_dbg(&nvmem->dev, "Registering nvmem device %s\n", config->name);
   393	
   394		rval = device_add(&nvmem->dev);
   395		if (rval)
   396			goto err_put_device;
   397	
   398		if (config->compat) {
   399			rval = nvmem_sysfs_setup_compat(nvmem, config);
   400			if (rval)
   401				goto err_device_del;
   402		}
   403	
   404		if (config->cells) {
   405			rval = nvmem_add_cells(nvmem, config->cells, config->ncells);
   406			if (rval)
   407				goto err_teardown_compat;
   408		}
   409	
   410		rval = nvmem_add_cells_from_table(nvmem);
   411		if (rval)
   412			goto err_remove_cells;
   413	
   414		rval = nvmem_add_cells_from_of(nvmem);
   415		if (rval)
   416			goto err_remove_cells;
   417	
   418		blocking_notifier_call_chain(&nvmem_notifier, NVMEM_ADD, nvmem);
   419	
   420		return nvmem;
   421	
   422	err_remove_cells:
   423		nvmem_device_remove_all_cells(nvmem);
   424	err_teardown_compat:
   425		if (config->compat)
   426			nvmem_sysfs_remove_compat(nvmem, config);
   427	err_device_del:
   428		device_del(&nvmem->dev);
   429	err_put_device:
   430		put_device(&nvmem->dev);
   431	err_ida_remove:
   432		ida_simple_remove(&nvmem_ida, nvmem->id);
   433	err_free_nvmem:
   434		kfree(nvmem);
   435	
   436		return ERR_PTR(rval);
   437	}
   438	EXPORT_SYMBOL_GPL(nvmem_register);
   439	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--azLHFNyN32YCQGCU
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
/gcYrD/9lZMAAA==

--azLHFNyN32YCQGCU--
