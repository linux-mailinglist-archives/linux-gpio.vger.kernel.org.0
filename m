Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59969539689
	for <lists+linux-gpio@lfdr.de>; Tue, 31 May 2022 20:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbiEaSsI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 May 2022 14:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237805AbiEaSsG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2022 14:48:06 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48AB217589
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2022 11:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654022885; x=1685558885;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NTccyh+04npEC4jX/MfId+lJ0YnNBwHohJm+9+Tkyeo=;
  b=KXyWc7eE9eQ5Zy497dT9Exmu/6Ua/gKmTGkowkzOompN4Dplrb8YlJgr
   MvSbngP+xKrObeNGK0l+Rmnub6mb5jHYH9qnGpptqXBAVjmHtlvNuHPdG
   5y7G6LXGnoLTIqhuZvv2F6MfapcMlQXEbA8dgVR9ho9KewHzEixgJta+a
   cftpoLuvIIdRP0k43nTZnzufyBVwJ5aRbTVWKDmqWmO8hErtaH4hE0aGl
   7b1cDsbt9yhpvD1hhvReBHrTDipHXgvdH1y/ujzCvuuE5DSr/TYv+rGQN
   HrT1vkulU4z1M1ybyDJn0DtZc0Yk4Mtxk22kngIUtYMZGKRN74OMCBdWA
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="274157641"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="274157641"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 11:48:05 -0700
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="755188303"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 11:48:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nw6uN-000Q1B-RD;
        Tue, 31 May 2022 21:47:59 +0300
Date:   Tue, 31 May 2022 21:47:59 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Basavaraj Natikar <bnatikar@amd.com>
Cc:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam-sundar.S-k@amd.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com
Subject: Re: [PATCH v3 1/6] pinctrl: Add pingroup and define PINCTRL_GRP
Message-ID: <YpZi39Mj2/Z4RgNv@smile.fi.intel.com>
References: <20220531084322.1310250-1-Basavaraj.Natikar@amd.com>
 <20220531084322.1310250-2-Basavaraj.Natikar@amd.com>
 <YpXdooVIYNQGoQMt@smile.fi.intel.com>
 <9f7d1107-a4a8-86f7-e3a1-a92ff206b90d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f7d1107-a4a8-86f7-e3a1-a92ff206b90d@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 31, 2022 at 07:35:44PM +0530, Basavaraj Natikar wrote:
> On 5/31/2022 2:49 PM, Andy Shevchenko wrote:
> > On Tue, May 31, 2022 at 02:13:17PM +0530, Basavaraj Natikar wrote:

...

> >> +/**
> >> + * struct pingroups - provides information on pingroup
> > Try `make W=1` against each of your patches from the series. Here is the kernel
> > doc issue.
> 
> shall address your comments in my next revision, I tried 'make W=1' could not hit the 
> kernel doc issue. Can you please elaborate a bit.

Hmm...

$ scripts/kernel-doc -none -v include/linux/pinctrl/pinctrl.h
...
include/linux/pinctrl/pinctrl.h:39: warning: expecting prototype for struct pingroups. Prototype was for struct pingroup instead

> >> + * @name: a name for pingroup
> >> + * @pins: an array of pins in the pingroup
> >> + * @npins: number of pins in the pingroup
> >> + */
> >> +struct pingroup {
> >> +	const char *name;
> >> +	const unsigned int *pins;
> >> +	unsigned int npins;
> > size_t probably would be better.
> >
> >> +};

...

> >> +/* Convenience macro to define a single named or anonymous pingroup */
> >> +#define PINCTRL_GRP(_name, _pins, _npins)	\
> > I think PINCTRL_PINGROUP would be more precise.
> >
> >> +((struct pingroup) {				\
> > No need to have space before { and compound literal means that it's not a GCC
> > expression, i.e. drop outer parentheses ().
> >
> >> +	.name = _name,				\
> >> +	.pins = _pins,				\
> >> +	.npins = _npins,			\
> >> +})
> 
> 
> yes, or else I will hit the checkpatch error as below

Does it compile? Does it work? If so, fix checkpatch.

> ERROR: Macros with complex values should be enclosed in parentheses
> 
> #36: FILE: include/linux/pinctrl/pinctrl.h:42:
> 
> +#define PINCTRL_GRP(_name, _pins, _npins)      \
> +(struct pingroup){                             \
> +       .name = _name,                          \
> +       .pins = _pins,                          \
> +       .npins = _npins,                        \
> +}

-- 
With Best Regards,
Andy Shevchenko


