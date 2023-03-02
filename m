Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9E9D6A857F
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Mar 2023 16:40:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbjCBPkf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Mar 2023 10:40:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbjCBPkf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Mar 2023 10:40:35 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7823038EA2
        for <linux-gpio@vger.kernel.org>; Thu,  2 Mar 2023 07:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677771634; x=1709307634;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FRjDhZemAOHtim4zElbZwpEkLDOotLjl8D10rvm2QtE=;
  b=NPneuaZsknDHADOFBXr4TDs3d2kyheKvACbcrigZfUn6Hj4ClNGGDOsy
   Mpc/9UXITS/sq4XckqDzXAMFnuESDtsmsVG3mcR/ZIgz4hQVjFpb2TXwG
   AgFwXFXmxsA2LpWtDCjYgGv9oM4+iJ9znHI/vFpPzmb79w9yZHu1dWRe9
   SV6yCp8qY6FgoTTnKpT3eFL/fOCSn1bBUV3mibe2mzaoklgDjw+iDbVzq
   Dz6LBdcALj9p/ZzPSGsAeZkepwKhqkl6zx62tXDzZ4M2QlpdrZwVW8+/1
   TIIS2Y7v3TWFmtHwWpnLxIayu+f3jbvnINqUGAd5clfwpJe3oGM1fTieT
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="399561843"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="399561843"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 07:40:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="849123578"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="849123578"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 02 Mar 2023 07:40:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pXl2j-00EPTr-11;
        Thu, 02 Mar 2023 17:40:29 +0200
Date:   Thu, 2 Mar 2023 17:40:29 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Robert Schwebel <r.schwebel@pengutronix.de>,
        Sascha Hauer <sha@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        bartosz.golaszewski@linaro.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Marco Felsch <m.felsch@pengutronix.de>,
        christophe.leroy@csgroup.eu, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de, shawnguo@kernel.org
Subject: Re: GPIO static allocation warning with v6.2-rcX
Message-ID: <ZADDbYYWdSiXozgm@smile.fi.intel.com>
References: <20230120104647.nwki4silrtd7bt3w@pengutronix.de>
 <CAMRc=Mdo0tvJUJ2G+9BGfyVYBwUQKRZU36JEUZdxVVnXETZHLg@mail.gmail.com>
 <20230125093548.GB23347@pengutronix.de>
 <CACRpkdbcrTv+=7Ev750O=UO=V=afp5NnTT4znb0rzWLkom+_cg@mail.gmail.com>
 <20230126104927.GE23347@pengutronix.de>
 <20230129183339.GY24167@pengutronix.de>
 <ZAAHlyjr+pNHTMoo@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAAHlyjr+pNHTMoo@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 02, 2023 at 10:19:03AM +0800, Kent Gibson wrote:
> I didn't respond to this earlier, as I considered it best to let the
> thread die and not inflame the issue.
> 
> Adding Andy as he raised the issue again in another thread.

Thank you, Kent, it is helpful.

-- 
With Best Regards,
Andy Shevchenko


