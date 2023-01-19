Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6474674311
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jan 2023 20:48:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbjASTsX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Jan 2023 14:48:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbjASTsP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Jan 2023 14:48:15 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBBDD7C840;
        Thu, 19 Jan 2023 11:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674157694; x=1705693694;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dS5R5RFwuXsctlyU0HLNUqHNVCCKgAon71otDngEy3g=;
  b=gKxNFdzOVwJr1vVAnf3/SarsY1X/y4gNEnLvWV6qASn/TzruVA4D0elu
   IpojRCkdaK6fzJfRUTMHR61ZwOswk1oqbgQ0FkCxSfX/QIoqDp3FBAteQ
   nfwqcfza77mpeZ4q8wZGsfuG8tZHWbHSjZiG2ngwf7VRdRYWvBz2sQzkS
   zP9mzUVSpVCFwwR1ZcYlGWWs/Dvtl+PlZ0G2BizvtNxjf+9VNDPxkx4yN
   ee04Od/ymbzM3hTQGCyln5G0dm7hK0jkAhgj1wuHTW4AhEcK3bqfFGwdO
   i1MDhoV0lXEMp16lskSfBu3TQbN+IqWA91N93ueJ6Wtj8C6X1aMjDBCG+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="324087799"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="324087799"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 11:48:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="989110128"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="989110128"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Jan 2023 11:48:10 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pIatN-0001ni-14;
        Thu, 19 Jan 2023 19:48:09 +0000
Date:   Fri, 20 Jan 2023 03:47:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>
Subject: Re: [PATCH v4 06/11] media: v4l2-core: Built async and fwnode code
 into videodev.ko
Message-ID: <202301200320.AbLvd1xh-lkp@intel.com>
References: <20230119130053.111344-7-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119130053.111344-7-hdegoede@redhat.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Hans,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.2-rc4]
[cannot apply to media-tree/master pavel-leds/for-next next-20230119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/leds-led-class-Add-missing-put_device-to-led_put/20230119-210441
patch link:    https://lore.kernel.org/r/20230119130053.111344-7-hdegoede%40redhat.com
patch subject: [PATCH v4 06/11] media: v4l2-core: Built async and fwnode code into videodev.ko
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230120/202301200320.AbLvd1xh-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/adfeffb48aad34dd2148e22caaf13d67cd92c285
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hans-de-Goede/leds-led-class-Add-missing-put_device-to-led_put/20230119-210441
        git checkout adfeffb48aad34dd2148e22caaf13d67cd92c285
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `videodev_init':
>> v4l2-dev.c:(.init.text+0x4c7c5): undefined reference to `v4l2_async_debugfs_init'
   ld: vmlinux.o: in function `videodev_exit':
>> v4l2-dev.c:(.exit.text+0x1f95): undefined reference to `v4l2_async_debugfs_exit'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
