Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E95D64A46F
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Dec 2022 16:52:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232154AbiLLPw0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Dec 2022 10:52:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232328AbiLLPwZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Dec 2022 10:52:25 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95F2B12A82
        for <linux-gpio@vger.kernel.org>; Mon, 12 Dec 2022 07:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670860344; x=1702396344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tmzEaWfgD0IHGFAO5jUZSjxx2QiRQJEPl9KUqGkx2Ig=;
  b=EIugqkNI5WuDJIEe3M2KbBYfF+p2uIExr4OF2GYSWjbfBCUxIaHWmmas
   dPuFT8bwNTF3zx1y9GTkp9yIpT7vLpt3F9Of0UffvFHj52/JcrnfTLkaG
   dpeIw5Lux0knII0eJ/QKspbQZeC3ZAgPSTzzSEROHeq+RH5/PrF3bx1Jp
   SAVyihAxBW1XWyAd7Tao2IwLPo51c9B+1zLKyKCVPbz69VQ7vFk3fW9WQ
   JuSBMyi9A/dl8hDNl4VZAiD7Bo26QNSCorqzyzOVNUy7XSn3zvuS5WAzo
   Hob3vuebgNZ16nD/RQNhIWIGd7fWsoa+jn3pHxK4IcySNzAY7aP3nk6Em
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="404140004"
X-IronPort-AV: E=Sophos;i="5.96,238,1665471600"; 
   d="scan'208";a="404140004"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2022 07:52:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="790539405"
X-IronPort-AV: E=Sophos;i="5.96,238,1665471600"; 
   d="scan'208";a="790539405"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 12 Dec 2022 07:52:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1p4l6L-008hvH-0E;
        Mon, 12 Dec 2022 17:52:21 +0200
Date:   Mon, 12 Dec 2022 17:52:20 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     haibo.chen@nxp.com
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, linux-imx@nxp.com,
        linux-gpio@vger.kernel.org, martyn.welch@collabora.com
Subject: Re: [PATCH 1/2] gpio: pca953x: avoid to use uninitialized value
 pinctrl
Message-ID: <Y5dONGNiC8jlJOlq@smile.fi.intel.com>
References: <20221209075040.2141042-1-haibo.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221209075040.2141042-1-haibo.chen@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 09, 2022 at 03:50:39PM +0800, haibo.chen@nxp.com wrote:
> From: Haibo Chen <haibo.chen@nxp.com>
> 
> There is a variable pinctrl declared without initializer. And then
> has the case (switch operation chose the default case) to directly
> use this uninitialized value, this is not a safe behavior. So here
> initialize the pinctrl as 0 to avoid this issue.
> This is reported by Coverity.

I have sent a v2 of this series with additional cleanups.

-- 
With Best Regards,
Andy Shevchenko


