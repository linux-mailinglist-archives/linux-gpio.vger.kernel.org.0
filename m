Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD2E24C110C
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Feb 2022 12:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231288AbiBWLMU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Feb 2022 06:12:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiBWLMS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Feb 2022 06:12:18 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91AB7606CF
        for <linux-gpio@vger.kernel.org>; Wed, 23 Feb 2022 03:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645614711; x=1677150711;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3WGjtJevaTuUe8J5sqEs5lY8dDuHr5dZclChh8jZB1A=;
  b=MTmt41GuYWtB33XkHyuy1wdfFR1hEYF9mz3FH8hatMwiK/PBHNtm5B8a
   20vWh7GeG6nWRceD4C3dnpfM0yfkeEo8fBfXGXK/CRhhL7HwqJVB3L29m
   JtsiZO1PXogh6v+1byIFV4Ocqnm30PCQuYIRSRHP+jWSkIPze/YKDfkBq
   sCLLexyaAf8wR63eZ35jq799bIzhbb1iMU6zR7hqpXXdRGsJr+J3UQpJj
   rExdCFI4v7gljaPwFmjAG4FV8kL6sOIAunARVCJU+iFH/FC3asmFCWFGi
   aCyGf+CnYeG3qN0znlame7QOEgQz7eBfasBDnrEhzwZYVtXn3X6Curuup
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="276558767"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="276558767"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 03:11:51 -0800
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="532638096"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 03:11:49 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nMpXu-007O62-V5;
        Wed, 23 Feb 2022 13:10:58 +0200
Date:   Wed, 23 Feb 2022 13:10:58 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v2 1/2] line-config: expose the override
 logic to users
Message-ID: <YhYWQtjQ9ete6O32@smile.fi.intel.com>
References: <20220221154055.654819-1-brgl@bgdev.pl>
 <20220221154055.654819-2-brgl@bgdev.pl>
 <20220222114044.GA37327@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220222114044.GA37327@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 22, 2022 at 07:40:44PM +0800, Kent Gibson wrote:
> On Mon, Feb 21, 2022 at 04:40:54PM +0100, Bartosz Golaszewski wrote:
> > We've already added getters for line-config but without exposing some
> > parts of the internal logic of the object, the user can't really get
> > the full picture and inspect the contents. This patch reworks the
> > accessors further by providing access to the underlying override
> > mechanism.
> > 
> > For every setting, we expose a getter and setter for the default value
> > as well as a set of four functions for setting, getting, clearing and
> > checking per-offset overrides.
> > 
> > An override can initially have the same value as the defaults but will
> > retain the overridden value should the defaults change.
> > 
> > We also complete the API by providing functions that allow to identify
> > offsets for which at least one setting is overriden.
> > 
> > This way the caller can fully inspect the line_config and high-level
> > language bindings can provide stringification methods.
> > 
> > While at it: we fix a couple bugs in the implementation of struct
> > line_config.
> > 
> 
> TLDR: I've got a lot of nitpicks on the doco, but it might be simpler
> for you to apply this patch as is and for me to submit a patch with doco
> tweaks than for you to try to sort out my comments!
> 
> The actual code looks good, so
> 
> Reviewed-by: Kent Gibson <warthog618@gmail.com>
> 
> with or without the suggested doco changes.

Thank you, Kent, for persistent review, I'm sorry, folks, I have no time to
look into this, but I believe that you together will give good enough result
and we can amend it later.

-- 
With Best Regards,
Andy Shevchenko


