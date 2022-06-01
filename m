Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C920153A2B2
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 12:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352051AbiFAKf3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 06:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352141AbiFAKfP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 06:35:15 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 465D57CB25
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 03:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654079715; x=1685615715;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DfoXfRxY7ZYQMC+BZqD+Knh7+D35qpKCB37ORxgtEmA=;
  b=Rs9FyYdSnloJTnI6Pn+ONuJ60JARJikYvdpMhptqEM/R4fCfRa5kMChf
   dWD1Jt4ashhBrfo9fJvJtBQzej+aWAC5YHsw3K2GC86orbCXEP6SYwKS4
   7OQSjXv6dJM/Do3lv48GyrGQjXzzzfD7oChkRnQNMtdFXAcbvc2r/Ac90
   P950J0eLe5aRt+J/0xUCmHY3DkUcATH8qRI0UcJV/6to0ND3s4yTWMQty
   8axvfRnHCxKa11bsMRxKJgHn18G0L2lvKLEJ31FKbPy0dyaljoZMQu39l
   k0lXozOlKrcsiB+HzpJ/IxCWguHJOoq1HT/Jxcmc2ES+lqDqYmZnIPbpt
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="275266978"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="275266978"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 03:35:14 -0700
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="530004976"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 03:35:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nwLh0-000QYc-Gc;
        Wed, 01 Jun 2022 13:35:10 +0300
Date:   Wed, 1 Jun 2022 13:35:10 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     Shyam-sundar.S-k@amd.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com
Subject: Re: [PATCH v4 1/6] pinctrl: Add pingroup and define PINCTRL_PINGROUP
Message-ID: <YpdA3inpzl6jsSVf@smile.fi.intel.com>
References: <20220601100214.828595-1-Basavaraj.Natikar@amd.com>
 <20220601100214.828595-2-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601100214.828595-2-Basavaraj.Natikar@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 01, 2022 at 03:32:09PM +0530, Basavaraj Natikar wrote:
> Add 'struct pingroup' to represent pingroup and 'PINCTRL_PINGROUP'
> macro for inline use. Both are used to manage and represent
> larger number of pingroups.

...

> +/* Convenience macro to define a single named or anonymous pingroup */
> +#define PINCTRL_PINGROUP(_name, _pins, _npins)	\
> +((struct pingroup){				\
> +	.name = _name,				\
> +	.pins = _pins,				\
> +	.npins = _npins,			\
> +})

Still the same Q: Why do you need GCC expression (besides the checkpatch,
likely false positive, warning)?

Note, we have many compound literals in the kernel: first comes to my mind
is property.h.

-- 
With Best Regards,
Andy Shevchenko


