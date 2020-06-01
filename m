Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2621EAC82
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2020 20:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730247AbgFASha (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Jun 2020 14:37:30 -0400
Received: from mga17.intel.com ([192.55.52.151]:62295 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728584AbgFASh3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 1 Jun 2020 14:37:29 -0400
IronPort-SDR: xgjKQrhBLtFMh2dc1kr0gkdtsSab+h/eJA3efLcRFIuOkDhXn0r9IWfSDLMNp04eunjKLBDi78
 U8m9MUtzWr9w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2020 11:34:27 -0700
IronPort-SDR: 357mRLmvo9vNL2eNUVl2JsMOgYr47ynBFDW1Ji8ivkTrqWsDaYfvfYUrejsj+LWDaU5VrQAST2
 AksCeoc8Jcfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,461,1583222400"; 
   d="scan'208";a="470412783"
Received: from lkp-server01.sh.intel.com (HELO 78d03bb9d680) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Jun 2020 11:34:25 -0700
Received: from kbuild by 78d03bb9d680 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jfpGT-00008g-27; Mon, 01 Jun 2020 18:34:25 +0000
Date:   Tue, 2 Jun 2020 02:33:41 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Kent Gibson <warthog618@gmail.com>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org
Cc:     kbuild-all@lists.01.org, Kent Gibson <warthog618@gmail.com>
Subject: Re: [PATCH] gpiolib: split character device into gpiolib-cdev
Message-ID: <202006020221.C4AD44rR%lkp@intel.com>
References: <20200527154005.6827-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527154005.6827-1-warthog618@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Kent,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on v5.7-rc5]
[cannot apply to gpio/for-next linus/master linux/master v5.7-rc7 v5.7-rc6 next-20200529]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Kent-Gibson/gpiolib-split-character-device-into-gpiolib-cdev/20200528-000035
base:    2ef96a5bb12be62ef75b5828c0aab838ebb29cb8
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/gpio/gpiolib-cdev.c:1035:6: warning: Variable 'ret' is reassigned a value before the old one has been used. [redundantAssignment]
    ret = atomic_notifier_chain_register(&gdev->notifier,
        ^
   drivers/gpio/gpiolib-cdev.c:1016:0: note: Variable 'ret' is reassigned a value before the old one has been used.
    int ret = -ENOMEM;
   ^
   drivers/gpio/gpiolib-cdev.c:1035:6: note: Variable 'ret' is reassigned a value before the old one has been used.
    ret = atomic_notifier_chain_register(&gdev->notifier,
        ^

vim +/ret +1035 drivers/gpio/gpiolib-cdev.c

  1004	
  1005	/**
  1006	 * gpio_chrdev_open() - open the chardev for ioctl operations
  1007	 * @inode: inode for this chardev
  1008	 * @filp: file struct for storing private data
  1009	 * Returns 0 on success
  1010	 */
  1011	static int gpio_chrdev_open(struct inode *inode, struct file *filp)
  1012	{
  1013		struct gpio_device *gdev = container_of(inode->i_cdev,
  1014						      struct gpio_device, chrdev);
  1015		struct gpio_chardev_data *priv;
  1016		int ret = -ENOMEM;
  1017	
  1018		/* Fail on open if the backing gpiochip is gone */
  1019		if (!gdev->chip)
  1020			return -ENODEV;
  1021	
  1022		priv = kzalloc(sizeof(*priv), GFP_KERNEL);
  1023		if (!priv)
  1024			return -ENOMEM;
  1025	
  1026		priv->watched_lines = bitmap_zalloc(gdev->chip->ngpio, GFP_KERNEL);
  1027		if (!priv->watched_lines)
  1028			goto out_free_priv;
  1029	
  1030		init_waitqueue_head(&priv->wait);
  1031		INIT_KFIFO(priv->events);
  1032		priv->gdev = gdev;
  1033	
  1034		priv->lineinfo_changed_nb.notifier_call = lineinfo_changed_notify;
> 1035		ret = atomic_notifier_chain_register(&gdev->notifier,
  1036						     &priv->lineinfo_changed_nb);
  1037		if (ret)
  1038			goto out_free_bitmap;
  1039	
  1040		get_device(&gdev->dev);
  1041		filp->private_data = priv;
  1042	
  1043		ret = nonseekable_open(inode, filp);
  1044		if (ret)
  1045			goto out_unregister_notifier;
  1046	
  1047		return ret;
  1048	
  1049	out_unregister_notifier:
  1050		atomic_notifier_chain_unregister(&gdev->notifier,
  1051						 &priv->lineinfo_changed_nb);
  1052	out_free_bitmap:
  1053		bitmap_free(priv->watched_lines);
  1054	out_free_priv:
  1055		kfree(priv);
  1056		return ret;
  1057	}
  1058	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
