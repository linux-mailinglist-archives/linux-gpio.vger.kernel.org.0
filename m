Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E74CA622E44
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 15:47:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbiKIOrP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 09:47:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbiKIOrO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 09:47:14 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F7131AF06
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 06:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668005233; x=1699541233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cQV21dw08IX3jhsoT3sV2zJmVozb4uk7W7vYaEPvavI=;
  b=Y2vN8Hdi/gaW6dX//nBZrNe1Y5VscWg58XUKRIPe02d32pN5XFxMIsCr
   930dKAmlD1dIqi7lIv9ftw8edVFU5dN3upEdjQuSYMhPuqlQPmrzDDhcx
   0e8HqXz6CTSC9Si59Gg5Ozo8vBXQ18Jr+xWmJ9ahS4to+9//ukH2ejQa3
   taXFpc+vnJm5n25wO4uMhabspYJXEdtub+tJWjCZWy6fwWCy+AFdh9rPX
   Mi4iuuRfSi6c1io9KWUg71KDyWx91tBEu+ouCUDNhK8rzDwnjXbyftDIX
   gH1v1qkPn1CagayuQQCyyq5jV+HqSkk5ZzeHZ+odRwvc/XCJk+ucZSDAj
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="312792240"
X-IronPort-AV: E=Sophos;i="5.96,150,1665471600"; 
   d="scan'208";a="312792240"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2022 06:47:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="742420858"
X-IronPort-AV: E=Sophos;i="5.96,150,1665471600"; 
   d="scan'208";a="742420858"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 09 Nov 2022 06:47:10 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1osmM8-009mqQ-3A;
        Wed, 09 Nov 2022 16:47:08 +0200
Date:   Wed, 9 Nov 2022 16:47:08 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Zeng Heng <zengheng4@huawei.com>
Cc:     warthog618@gmail.com, linus.walleij@linaro.org, brgl@bgdev.pl,
        linux@roeck-us.net, linux-gpio@vger.kernel.org,
        liwei391@huawei.com, yuancan@huawei.com
Subject: Re: [PATCH v2] gpiolib: fix memory leak in gpiochip_setup_dev
Message-ID: <Y2u9bLIohQ8eFTY1@smile.fi.intel.com>
References: <Y2ttmcV+PFDUZR3l@sol>
 <20221109093120.3128541-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221109093120.3128541-1-zengheng4@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 09, 2022 at 05:31:20PM +0800, Zeng Heng wrote:
> gcdev_register & gcdev_unregister call device_add & device_del to
> request/release source. But in device_add, the dev->p allocated by
> device_private_init is not released by device_del.

First of all, we refer to the functions like func().

> So when calling gcdev_unregister to release gdev, it needs put_device
> to release dev in the following.
> 
> Otherwise, kmemleak would report memory leak such as below:
> 
> unreferenced object 0xffff88810b406400 (size 512):
>   comm "python3", pid 1682, jiffies 4295346908 (age 24.090s)
>   hex dump (first 32 bytes):
>     00 00 00 00 ad 4e ad de ff ff ff ff 00 00 00 00  .....N..........
>     ff ff ff ff ff ff ff ff a0 5e 23 90 ff ff ff ff  .........^#.....
>   backtrace:

Second, read Submitting Patches on how to provide your backtraces in the
message body.

>     [<00000000a58ee5fe>] kmalloc_trace+0x22/0x110
>     [<0000000045fe2058>] device_add+0xb34/0x1130
>     [<00000000d778b45f>] cdev_device_add+0x83/0xe0
>     [<0000000089f948ed>] gpiolib_cdev_register+0x73/0xa0
>     [<00000000a3a8a316>] gpiochip_setup_dev+0x1c/0x70
>     [<00000000787227b4>] gpiochip_add_data_with_key+0x10f6/0x1bf0
>     [<000000009ac5742c>] devm_gpiochip_add_data_with_key+0x2e/0x80
>     [<00000000bf2b23d9>] xra1403_probe+0x192/0x1b0 [gpio_xra1403]
>     [<000000005b5ef2d4>] spi_probe+0xe1/0x140
>     [<000000002b26f6f1>] really_probe+0x17c/0x3f0
>     [<00000000dd2dad9c>] __driver_probe_device+0xe3/0x170
>     [<000000005ca60d2a>] device_driver_attach+0x34/0x80
>     [<00000000e9db90db>] bind_store+0x10b/0x1a0
>     [<00000000e2650f8a>] drv_attr_store+0x49/0x70
>     [<0000000080a80b2b>] sysfs_kf_write+0x8c/0xb0
>     [<00000000a28b45b9>] kernfs_fop_write_iter+0x216/0x2e0
> 
> unreferenced object 0xffff888100de9800 (size 512):
>   comm "python3", pid 264, jiffies 4294737615 (age 33.514s)
>   hex dump (first 32 bytes):
>     00 00 00 00 ad 4e ad de ff ff ff ff 00 00 00 00  .....N..........
>     ff ff ff ff ff ff ff ff a0 5e 63 a1 ff ff ff ff  .........^c.....
>   backtrace:
>     [<00000000bcc571d0>] kmalloc_trace+0x22/0x110
>     [<00000000eeb06124>] device_add+0xb34/0x1130
>     [<000000007e5cd2fd>] cdev_device_add+0x83/0xe0
>     [<000000008f6bcd3a>] gpiolib_cdev_register+0x73/0xa0
>     [<0000000012c93b24>] gpiochip_setup_dev+0x1c/0x70
>     [<00000000a24b646a>] gpiochip_add_data_with_key+0x10f6/0x1bf0
>     [<000000000c225212>] tpic2810_probe+0x16e/0x196 [gpio_tpic2810]
>     [<00000000b52d04ff>] i2c_device_probe+0x651/0x680
>     [<0000000058d3ff6b>] really_probe+0x17c/0x3f0
>     [<00000000586f43d3>] __driver_probe_device+0xe3/0x170
>     [<000000003f428602>] device_driver_attach+0x34/0x80
>     [<0000000040e91a1b>] bind_store+0x10b/0x1a0
>     [<00000000c1d990b9>] drv_attr_store+0x49/0x70
>     [<00000000a23bfc22>] sysfs_kf_write+0x8c/0xb0
>     [<00000000064e6572>] kernfs_fop_write_iter+0x216/0x2e0
>     [<00000000026ce093>] vfs_write+0x658/0x810
> 
> Because at the point of gpiochip_setup_dev here, where dev.release
> does not set yet, calling put_device would cause the warning of
> no release function and double-free in the following fault handler
> route (when kfree dev_name). So directly calling kfree to release
> dev->p here in case of memory leak.

...

> @@ -539,6 +539,7 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
>  
>  err_remove_device:
>  	gcdev_unregister(gdev);
> +	kfree(gdev->dev.p);
>  	return ret;

Third, I do not believe it's a correct fix.
Have you read comments around device_del() / etc.?

NAK.

-- 
With Best Regards,
Andy Shevchenko


