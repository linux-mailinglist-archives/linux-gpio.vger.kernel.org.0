Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21E9956C5A5
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Jul 2022 03:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbiGIBPU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 21:15:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiGIBPT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 21:15:19 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8379A643D5;
        Fri,  8 Jul 2022 18:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657329318; x=1688865318;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SFN91SBKl8zV0FODfRS2tJ2kUZI5R8GwUBZHq04TEEA=;
  b=KoOQNJPQXXMut5+xFOZEZNB8chhQo3bMeTMnaISSqzxRebromUwEK34B
   cAuIVn2GtgF60PJHyV18dWLp4undvN4l11cbaKHwEo0VMTWPeVHB1cCaV
   84xsw0nTwz3eXCcMhWRvR3j57LzZylUv7r4QI9SnSo651R0RBFzvaBK9o
   fYs1SsgYTvLOlYtz0PnZCMKz79xMuI6A0ANtKSAzn/D/DhH2mFAYlmlh2
   977wz6HBMzmdRBgR8bEpqXkcMMGZ7HiAk6MOzu5UXldjxTXHI5/VGTKGo
   /qb2StE6ulXtUklOFDmAt/KHBZJSl9+DCSWJ9BFCc38fuRaZ+B+n96iAz
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="309985066"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="309985066"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 18:15:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="661954457"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 08 Jul 2022 18:15:15 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o9z3y-000O8E-QS;
        Sat, 09 Jul 2022 01:15:14 +0000
Date:   Sat, 9 Jul 2022 09:14:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-input@vger.kernel.org
Cc:     kbuild-all@lists.01.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 04/10] input: keyboard: adp5588-keys: add support for fw
 properties
Message-ID: <202207090942.hoWXaKCu-lkp@intel.com>
References: <20220708093448.42617-5-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708093448.42617-5-nuno.sa@analog.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi "Nuno,

I love your patch! Perhaps something to improve:

[auto build test WARNING on dtor-input/next]
[cannot apply to brgl/gpio/for-next hid/for-next linus/master v5.19-rc5 next-20220708]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nuno-S/adp5588-keys-refactor-and-fw-properties-support/20220708-173730
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220709/202207090942.hoWXaKCu-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/75ce2e5c9e3267912dc4bc6773869d135a753e35
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nuno-S/adp5588-keys-refactor-and-fw-properties-support/20220708-173730
        git checkout 75ce2e5c9e3267912dc4bc6773869d135a753e35
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/input/keyboard/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/gpio/driver.h:5,
                    from drivers/input/keyboard/adp5588-keys.c:13:
   drivers/input/keyboard/adp5588-keys.c: In function 'adp5588_fw_parse':
>> drivers/input/keyboard/adp5588-keys.c:667:39: warning: format '%d' expects argument of type 'int', but argument 4 has type 'long unsigned int' [-Wformat=]
     667 |                 dev_err(&client->dev, "number of unlock keys(%d) > (%d)\n",
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/input/keyboard/adp5588-keys.c:667:17: note: in expansion of macro 'dev_err'
     667 |                 dev_err(&client->dev, "number of unlock keys(%d) > (%d)\n",
         |                 ^~~~~~~
   drivers/input/keyboard/adp5588-keys.c:667:70: note: format string is defined here
     667 |                 dev_err(&client->dev, "number of unlock keys(%d) > (%d)\n",
         |                                                                     ~^
         |                                                                      |
         |                                                                      int
         |                                                                     %ld


vim +667 drivers/input/keyboard/adp5588-keys.c

   631	
   632	static int adp5588_fw_parse(struct adp5588_kpad *kpad)
   633	{
   634		struct i2c_client *client = kpad->client;
   635		int ret, i;
   636	
   637		ret = matrix_keypad_parse_properties(&client->dev, &kpad->rows,
   638						     &kpad->cols);
   639		if (ret)
   640			return ret;
   641	
   642		if (kpad->rows > ADP5588_ROWS_MAX || kpad->cols > ADP5588_COLS_MAX) {
   643			dev_err(&client->dev, "Invalid nr of rows(%u) or cols(%u)\n",
   644				kpad->rows, kpad->cols);
   645			return -EINVAL;
   646		}
   647	
   648		ret = matrix_keypad_build_keymap(NULL, NULL, kpad->rows, kpad->cols,
   649						 kpad->keycode, kpad->input);
   650		if (ret)
   651			return ret;
   652	
   653		kpad->row_shift = get_count_order(kpad->cols);
   654	
   655		if (device_property_read_bool(&client->dev, "autorepeat"))
   656			__set_bit(EV_REP, kpad->input->evbit);
   657	
   658		kpad->nkeys_unlock = device_property_count_u32(&client->dev,
   659							       "adi,unlock-keys");
   660		if (kpad->nkeys_unlock <= 0) {
   661			/* so that we don't end up enabling key lock */
   662			kpad->nkeys_unlock = 0;
   663			return 0;
   664		}
   665	
   666		if (kpad->nkeys_unlock > ARRAY_SIZE(kpad->unlock_keys)) {
 > 667			dev_err(&client->dev, "number of unlock keys(%d) > (%d)\n",
   668				kpad->nkeys_unlock, ARRAY_SIZE(kpad->unlock_keys));
   669			return -EINVAL;
   670		}
   671	
   672		ret = device_property_read_u32_array(&client->dev, "adi,unlock-keys",
   673						     kpad->unlock_keys,
   674						     kpad->nkeys_unlock);
   675		if (ret)
   676			return ret;
   677	
   678		for (i = 0; i < kpad->nkeys_unlock; i++) {
   679			/*
   680			 * Even though it should be possible (as stated in the datasheet)
   681			 * to use GPIs (which are part of the keys event) as unlock keys,
   682			 * it was not working at all and was leading to overflow events
   683			 * at some point. Hence, for now, let's just allow keys which are
   684			 * part of keypad matrix to be used and if a reliable way of
   685			 * using GPIs is found, this condition can be removed/lightened.
   686			 */
   687			if (kpad->unlock_keys[i] >= kpad->cols * kpad->rows) {
   688				dev_err(&client->dev, "Invalid unlock key(%d)\n",
   689					kpad->unlock_keys[i]);
   690				return -EINVAL;
   691			}
   692	
   693			/*
   694			 * fw properties keys start from 0 but on the device they
   695			 * start from 1.
   696			 */
   697			kpad->unlock_keys[i] += 1;
   698		}
   699	
   700		return 0;
   701	}
   702	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
