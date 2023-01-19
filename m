Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0C26743EC
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jan 2023 22:07:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbjASVH0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Jan 2023 16:07:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbjASVGm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Jan 2023 16:06:42 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D185FA5001;
        Thu, 19 Jan 2023 12:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674161968; x=1705697968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kZaK9ePnhrxjr9jwmLD9ywiNh5pUCIeVUYQO5DCc8VI=;
  b=bDH3Hf8hLVlR58bSvHxezvj5oH+EMLuYotBVUf09BjSq83bwLgbmRkx1
   NLPJ6Z4qz23XgJH3DAYWHL0oTGCebjFqcfa8Su6CQ2rdRUPWbsAT7zG9g
   XwkEYETqToU2aAH1mbBvzOXmNorKEPgeKZB9YsHNszRjyCfTDUc00tvpG
   osi87pDpkDQ6SJg9XfcPr90d3BWq11Z/AKoGpZSIMUf8gkl7ncVvQZI+P
   AUhaAuSQhOGXKLN0sviXOMex9brpXBa1DQe6vF8lBR/XgLMaecwai+uEZ
   0ehMD03sWlmTQf+MKSWqn2TlRQcDn0YExNxLQ2wXdgFoUnuNV43vYqB/J
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="352677281"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="352677281"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 12:59:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="653530014"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="653530014"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 Jan 2023 12:59:23 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pIc0I-0001qa-10;
        Thu, 19 Jan 2023 20:59:22 +0000
Date:   Fri, 20 Jan 2023 04:58:51 +0800
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
Message-ID: <202301200413.64Gyz6yI-lkp@intel.com>
References: <20230119130053.111344-7-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119130053.111344-7-hdegoede@redhat.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
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
config: x86_64-rhel-8.3-syz (https://download.01.org/0day-ci/archive/20230120/202301200413.64Gyz6yI-lkp@intel.com/config)
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

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "v4l2_async_debugfs_exit" [drivers/media/v4l2-core/videodev.ko] undefined!
>> ERROR: modpost: "v4l2_async_debugfs_init" [drivers/media/v4l2-core/videodev.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
