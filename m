Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1C9178277D
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Aug 2023 13:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbjHULA7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Aug 2023 07:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbjHULA6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Aug 2023 07:00:58 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79179DB
        for <linux-gpio@vger.kernel.org>; Mon, 21 Aug 2023 04:00:57 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="404561675"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="404561675"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 04:00:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="712745681"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="712745681"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 21 Aug 2023 04:00:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1qY2eT-00ApIh-0o;
        Mon, 21 Aug 2023 14:00:53 +0300
Date:   Mon, 21 Aug 2023 14:00:52 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     haibo.chen@nxp.com
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, shenwei.wang@nxp.com,
        linux-gpio@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH] gpio: mxc: set the port->irq high to 0 for imx2
Message-ID: <ZOND5GPLa6IMUoLs@smile.fi.intel.com>
References: <20230821031443.1443530-1-haibo.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821031443.1443530-1-haibo.chen@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 21, 2023 at 11:14:43AM +0800, haibo.chen@nxp.com wrote:
> From: Haibo Chen <haibo.chen@nxp.com>
> 
> MX2 has one interrupt for all gpio ports, so do not need the value
> port->irq_high, need to set to 0. Current setting is -1, which will
> meet issue in gpio_set_wake_irq().

Can you describe a bit more the nature of the issue?

-- 
With Best Regards,
Andy Shevchenko


