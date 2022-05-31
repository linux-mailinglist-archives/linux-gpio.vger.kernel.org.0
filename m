Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C159538D94
	for <lists+linux-gpio@lfdr.de>; Tue, 31 May 2022 11:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245130AbiEaJTj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 May 2022 05:19:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245131AbiEaJTh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2022 05:19:37 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B53A62A3B
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2022 02:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653988776; x=1685524776;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HPJiPjDzB44Qz1aJyOa3nUuZyrqVSh1AqI/MrMnvqjM=;
  b=WGDGPlzrIrf2WQRANN8REi2BLxqEfZ3SuIfh+hQ1P1hb/CrLr9hJQUJe
   THKyNF0L3ni/sXq9dV8vS1ZFQQvonih/B7WWnVlrWHJfdsPcRbWLaCXkL
   eLtYm/G4tScsKwiY8UXYkk8vU4hHVDwFN+Eqzfk5LBdDI5vhjkm02cmWC
   1gEAZUOW27Ie4KYcbBPgmIKnYCCJAjLyCx6sni56Pkuhc12y9T1bu5rDC
   FOl+hAo/gTSWCHqXQMIjTVlykN+9fCkG5E0eLwqNx04IOYF9jeqa3umze
   ZWidA9VUlQh9gKjvD/PkJcyj/CBXsBHyvOtwjjyk6erZV72SYKIZi5Tey
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="300547163"
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="300547163"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 02:19:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="551699697"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 02:19:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nvy2F-000Pet-31;
        Tue, 31 May 2022 12:19:31 +0300
Date:   Tue, 31 May 2022 12:19:30 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     Shyam-sundar.S-k@amd.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com
Subject: Re: [PATCH v3 1/6] pinctrl: Add pingroup and define PINCTRL_GRP
Message-ID: <YpXdooVIYNQGoQMt@smile.fi.intel.com>
References: <20220531084322.1310250-1-Basavaraj.Natikar@amd.com>
 <20220531084322.1310250-2-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531084322.1310250-2-Basavaraj.Natikar@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 31, 2022 at 02:13:17PM +0530, Basavaraj Natikar wrote:
> Add 'struct pingroup' to represent pingroup and 'PINCTRL_GRP' macro for
> inline use. Both are used to manage and represent larger number
> of pingroups.


Thanks! My comments below.

...

> +/**
> + * struct pingroups - provides information on pingroup

Try `make W=1` against each of your patches from the series. Here is the kernel
doc issue.

> + * @name: a name for pingroup
> + * @pins: an array of pins in the pingroup
> + * @npins: number of pins in the pingroup
> + */
> +struct pingroup {
> +	const char *name;
> +	const unsigned int *pins;

> +	unsigned int npins;

size_t probably would be better.

> +};
> +
> +/* Convenience macro to define a single named or anonymous pingroup */
> +#define PINCTRL_GRP(_name, _pins, _npins)	\

I think PINCTRL_PINGROUP would be more precise.

> +((struct pingroup) {				\

No need to have space before { and compound literal means that it's not a GCC
expression, i.e. drop outer parentheses ().

> +	.name = _name,				\
> +	.pins = _pins,				\
> +	.npins = _npins,			\
> +})

-- 
With Best Regards,
Andy Shevchenko


