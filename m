Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA6F85BCDAF
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Sep 2022 15:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbiISNxU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Sep 2022 09:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbiISNxR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Sep 2022 09:53:17 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55731DFF2
        for <linux-gpio@vger.kernel.org>; Mon, 19 Sep 2022 06:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663595596; x=1695131596;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9mnewEZpZptCq4MGPR28tLs4sWdFIy767pEeXlprqRE=;
  b=DBAM9sCxksJmpMy7wAreVvb2QwO0rTfdIl8DVpTOMddZlXUsDyOoufb5
   0mOe+UKf6jrAgMhWFyu9W/uqeGvDSZcgoV//BV3U6AImKshmCCVvROG5K
   t7IggAltdjzAVOGDCTOb3LsyKXPZJLiY6WiKf8+yX3jdkX7pw2tLAUXuB
   Bhm/BkBtU8A5oQdhfvUBQlTkai1QKML1xYpUde8Faz3QU+RVO7eMwjA4u
   Yd+8j0sZuCGPgCJ6bnK8+KPK282gkALNRdnudQD9I26Ui6We1lAtK8oWr
   GxhtLYl74Kwe/wPP89MK4lyvGL46iNzOAOBEhhZZSVhgSaz4rd+rzgENj
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="300222437"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; 
   d="scan'208";a="300222437"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 06:53:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; 
   d="scan'208";a="707574492"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Sep 2022 06:53:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oaHCy-004Zsi-0j;
        Mon, 19 Sep 2022 16:53:12 +0300
Date:   Mon, 19 Sep 2022 16:53:11 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     jbx6244@gmail.com, heiko@sntech.de, linus.walleij@linaro.org,
        brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] pinctrl: rockchip: find gpiochip by name from gpio module
Message-ID: <YyRPy8MnklttTup8@smile.fi.intel.com>
References: <20220916084343.458566-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916084343.458566-1-jay.xu@rock-chips.com>
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>) id 1oZ8aB-003AUC-1p;
 Fri, 16 Sep 2022 13:28:27 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 16, 2022 at 04:43:43PM +0800, Jianqun Xu wrote:
> Currently the pinctrl device acts as parent for the gpio devices for
> rockchip platform, the pinctrl driver probes first and then populate the
> gpio platform lastly.
> 
> This patch makes the pinctrl to populate gpio platform firstly and then
> do probe after gpio probed successfully. And get gpiochips througth a
> find function by the gpio label.

> +static int gpiochip_match_name(struct gpio_chip *gc, void *data)
> +{
> +	const char *name = data;
> +
> +	return !strcmp(gc->label, name);
> +}

> +		gc = gpiochip_find((void *)ctrl->pin_banks[i].name, gpiochip_match_name);
> +		if (!gc) {
> +			dev_err(dev, "fail to find gpiochip\n");
> +			return ret;
> +		}

NIH find_chip_by_name()


-- 
With Best Regards,
Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko


