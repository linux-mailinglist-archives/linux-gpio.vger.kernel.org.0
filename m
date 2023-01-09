Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92605662436
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jan 2023 12:30:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbjAIL35 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Jan 2023 06:29:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236930AbjAIL3n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2023 06:29:43 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 722AC186D5
        for <linux-gpio@vger.kernel.org>; Mon,  9 Jan 2023 03:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673263782; x=1704799782;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IUou9iqdGkDAvCn8J53voHvEjPtlDmE0Tm1FltzLgjE=;
  b=mOEUGn8kKpZHyQbuPQJw9V/oCZKkedtRbVKvP2L40CaxAvFL6UBpO7au
   3OPk4StHo/NHfSwa15yA3buncVbrSa58Hz6oC0b42mgnEMMUow2QpLx0S
   KjDNx8+Rx6Y3IezrvJrmfxidJ+GflmPgUQLjYnY9FAiZrXKBt9RXAp+jL
   QWT4+qWp80B1RoIjwjeOIb3Y1VaFmqLGGU3PYj9yN3eWjfq4rVxDQGuOY
   eNzGQbG1zvadiUP4zTvktFsWs+iYyhfbX7hGLq0Y8UQ4YYvRXOE603Tst
   21PwCwUlx3a54Ue5IeU4UQ82I+j3KV6IqYEW7LAVAwcmIf0raTEkzYXWy
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="324098290"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="324098290"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 03:29:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="634179112"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="634179112"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 09 Jan 2023 03:29:39 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pEqLR-006MhT-2j;
        Mon, 09 Jan 2023 13:29:37 +0200
Date:   Mon, 9 Jan 2023 13:29:37 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] core: make the library NULL-aware
Message-ID: <Y7v6oWaNVgltjC8V@smile.fi.intel.com>
References: <20230106115129.393007-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106115129.393007-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 06, 2023 at 12:51:29PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

...

>  GPIOD_API void gpiod_line_config_free(struct gpiod_line_config *config)
>  {
> +	if (!config)
> +		return;
> +
>  	free_refs(config);
>  	free(config);
>  }

At least this is redundant. free() is NULL-aware itself.

-- 
With Best Regards,
Andy Shevchenko


