Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C912A168E9C
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Feb 2020 12:54:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgBVLyj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 22 Feb 2020 06:54:39 -0500
Received: from mga18.intel.com ([134.134.136.126]:1187 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726839AbgBVLyi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 22 Feb 2020 06:54:38 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Feb 2020 03:54:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,471,1574150400"; 
   d="gz'50?scan'50,208,50";a="229440791"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 22 Feb 2020 03:54:32 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j5TMe-000Ihu-2D; Sat, 22 Feb 2020 19:54:32 +0800
Date:   Sat, 22 Feb 2020 19:54:09 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     kbuild-all@lists.01.org, Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 3/4] nvmem: increase the reference count of a gpio
 passed over config
Message-ID: <202002221921.euxJGwes%lkp@intel.com>
References: <20200220100141.5905-4-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline
In-Reply-To: <20200220100141.5905-4-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bartosz,

I love your patch! Yet something to improve:

[auto build test ERROR on next-20200221]
[also build test ERROR on v5.6-rc2]
[cannot apply to gpio/for-next linus/master v5.6-rc2 v5.6-rc1 v5.5]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Bartosz-Golaszewski/nvmem-gpio-fix-resource-management/20200222-054341
base:    bee46b309a13ca158c99c325d0408fb2f0db207f
config: sparc-defconfig (attached as .config)
compiler: sparc-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.5.0 make.cross ARCH=sparc 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/nvmem/core.c: In function 'nvmem_register':
>> drivers/nvmem/core.c:352:20: error: implicit declaration of function 'gpiod_ref'; did you mean 'gpiod_get'? [-Werror=implicit-function-declaration]
      nvmem->wp_gpio = gpiod_ref(config->wp_gpio);
                       ^~~~~~~~~
                       gpiod_get
   drivers/nvmem/core.c:352:18: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
      nvmem->wp_gpio = gpiod_ref(config->wp_gpio);
                     ^
   cc1: some warnings being treated as errors

vim +352 drivers/nvmem/core.c

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
   346		if (rval < 0) {
   347			kfree(nvmem);
   348			return ERR_PTR(rval);
   349		}
   350	
   351		if (config->wp_gpio)
 > 352			nvmem->wp_gpio = gpiod_ref(config->wp_gpio);
   353		else
   354			nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
   355							    GPIOD_OUT_HIGH);
   356		if (IS_ERR(nvmem->wp_gpio)) {
   357			ida_simple_remove(&nvmem_ida, nvmem->id);
   358			kfree(nvmem);
   359			return ERR_CAST(nvmem->wp_gpio);
   360		}
   361	
   362		kref_init(&nvmem->refcnt);
   363		INIT_LIST_HEAD(&nvmem->cells);
   364	
   365		nvmem->id = rval;
   366		nvmem->owner = config->owner;
   367		if (!nvmem->owner && config->dev->driver)
   368			nvmem->owner = config->dev->driver->owner;
   369		nvmem->stride = config->stride ?: 1;
   370		nvmem->word_size = config->word_size ?: 1;
   371		nvmem->size = config->size;
   372		nvmem->dev.type = &nvmem_provider_type;
   373		nvmem->dev.bus = &nvmem_bus_type;
   374		nvmem->dev.parent = config->dev;
   375		nvmem->priv = config->priv;
   376		nvmem->type = config->type;
   377		nvmem->reg_read = config->reg_read;
   378		nvmem->reg_write = config->reg_write;
   379		if (!config->no_of_node)
   380			nvmem->dev.of_node = config->dev->of_node;
   381	
   382		if (config->id == -1 && config->name) {
   383			dev_set_name(&nvmem->dev, "%s", config->name);
   384		} else {
   385			dev_set_name(&nvmem->dev, "%s%d",
   386				     config->name ? : "nvmem",
   387				     config->name ? config->id : nvmem->id);
   388		}
   389	
   390		nvmem->read_only = device_property_present(config->dev, "read-only") ||
   391				   config->read_only || !nvmem->reg_write;
   392	
   393		nvmem->dev.groups = nvmem_sysfs_get_groups(nvmem, config);
   394	
   395		device_initialize(&nvmem->dev);
   396	
   397		dev_dbg(&nvmem->dev, "Registering nvmem device %s\n", config->name);
   398	
   399		rval = device_add(&nvmem->dev);
   400		if (rval)
   401			goto err_put_device;
   402	
   403		if (config->compat) {
   404			rval = nvmem_sysfs_setup_compat(nvmem, config);
   405			if (rval)
   406				goto err_device_del;
   407		}
   408	
   409		if (config->cells) {
   410			rval = nvmem_add_cells(nvmem, config->cells, config->ncells);
   411			if (rval)
   412				goto err_teardown_compat;
   413		}
   414	
   415		rval = nvmem_add_cells_from_table(nvmem);
   416		if (rval)
   417			goto err_remove_cells;
   418	
   419		rval = nvmem_add_cells_from_of(nvmem);
   420		if (rval)
   421			goto err_remove_cells;
   422	
   423		blocking_notifier_call_chain(&nvmem_notifier, NVMEM_ADD, nvmem);
   424	
   425		return nvmem;
   426	
   427	err_remove_cells:
   428		nvmem_device_remove_all_cells(nvmem);
   429	err_teardown_compat:
   430		if (config->compat)
   431			nvmem_sysfs_remove_compat(nvmem, config);
   432	err_device_del:
   433		device_del(&nvmem->dev);
   434	err_put_device:
   435		put_device(&nvmem->dev);
   436	
   437		return ERR_PTR(rval);
   438	}
   439	EXPORT_SYMBOL_GPL(nvmem_register);
   440	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--n8g4imXOkfNTN/H1
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
5o8iDLtBVASAqSbOrCie5CuyH+w/0YFk8vrNAAA=

--n8g4imXOkfNTN/H1--
