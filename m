Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BAB34C16C3
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Feb 2022 16:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242051AbiBWP2g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Feb 2022 10:28:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232535AbiBWP2f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Feb 2022 10:28:35 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37BEC59A40;
        Wed, 23 Feb 2022 07:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645630088; x=1677166088;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2QbzcIeqMqhqbO6w1VDymDI+v6RFrBbD0C1YwiXfeJk=;
  b=UrYwc74141Ur1/oeviesx+CpnF8vI0pEZqHuQ8i5Crx8R/Yx+oSzkGXZ
   ECRLJUq+HRW0WMSwxlfdKFgwHgROFTDNOkolYAOJjSFGCDmyAg/NaqkD1
   sf0DCXKWapNfdNTSetp999mZkvVsrIzjdPvRA6ZNtaE78Oab2fceqLFKb
   /kBXeR6mP/l8c/43roY2g+lI1n9g9iEiynlluFekfxifhyeI1XTQ/iGHQ
   bzpUF0sKxwhAuyTc9GCPGQKMEC++PsGIBxuTpudU9624IiOtqF4SN50++
   aSByM/g+FI+NB2iR8D1GcNsTujITsPWP7yX5AZsXYANc4OEfjhoJqwQeo
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="249570877"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="249570877"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 07:28:07 -0800
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="532724589"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 07:28:03 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nMtXs-007TUN-Er;
        Wed, 23 Feb 2022 17:27:12 +0200
Date:   Wed, 23 Feb 2022 17:27:12 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/5] pinctrl: baytrail: Add pinconf group + function for
 the pmu_clk
Message-ID: <YhZSUJ6sAePSe117@smile.fi.intel.com>
References: <20220223133153.730337-1-hdegoede@redhat.com>
 <20220223133153.730337-2-hdegoede@redhat.com>
 <YhZKpw+DpC1OImBB@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhZKpw+DpC1OImBB@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 23, 2022 at 04:54:31PM +0200, Andy Shevchenko wrote:
> On Wed, Feb 23, 2022 at 02:31:49PM +0100, Hans de Goede wrote:

...

> >  static const char * const byt_sus_usb_groups[] = {
> >  	"usb_oc_grp", "usb_ulpi_grp",
> >  };
> >  static const char * const byt_sus_spi_groups[] = { "pcu_spi_grp" };
> > +static const char * const byt_sus_pmu_clk_groups[] = {
> > +	"pmu_clk1_grp", "pmu_clk2_grp" };
> 
> }; on new line.

And add a comma in that case.
See how USB is written above.

-- 
With Best Regards,
Andy Shevchenko


