Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C06D4C15EE
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Feb 2022 15:57:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235876AbiBWO6E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Feb 2022 09:58:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241882AbiBWO55 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Feb 2022 09:57:57 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0F7B41FA9;
        Wed, 23 Feb 2022 06:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645628248; x=1677164248;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CFHA/vMFbWWulzScwbi5FnBPxsCBHHxXdFah91zbA9Q=;
  b=ORbVcwkWHguuZcnss3mearoDRN59caN6NL9Ad8ISzHMdUbYTAw1wJAcS
   S/F6qkGH+hCVB5Kzp7zuHHOlKrLkYjwL8Gndp07JG24gh7ZwG7h11WdoO
   8mpsIJzuwydNPLvTa3KX3apmhQ4LUqooKWwMjUSYswBNMHS5hg93okxQs
   zEzhrCsmscmYH61L3K9fParA8Xr2yEpjZcOXGkOv77BlUVVeBK5jvyEcD
   pMZhfGxHvlopGdVUmZW37DdJzTFNhAtWdb7Nd2CeLPeZuoM4By4qPJaAl
   /3v+Mw1/mO459aYfRHRQP87qsGTZ7KFhLDJ9cip6B2R+EtOM72RnhFxZM
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="338417223"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="338417223"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 06:57:28 -0800
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="532713796"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 06:57:26 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1nMt4F-007SvG-Mq;
        Wed, 23 Feb 2022 16:56:35 +0200
Date:   Wed, 23 Feb 2022 16:56:35 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/5] platform/x86: x86-android-tablets: Fix EBUSY error
 when requesting IOAPIC IRQs
Message-ID: <YhZLI40Vukgv+PPO@smile.fi.intel.com>
References: <20220223133153.730337-1-hdegoede@redhat.com>
 <20220223133153.730337-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223133153.730337-3-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 23, 2022 at 02:31:50PM +0100, Hans de Goede wrote:
> Sometimes IRQs used by GPIOs in direct-IRQ mode are already registered
> because they are used as ACPI "Interrupt () {}" resource for one of the
> many bogus I2C devices present in the broken DSDTs of Android x86 tablets.
> 
> This is an issue if the existing (bogus) ACPI resource uses different
> trigger settings then what is being requested, leading to an -EBUSY
> error return of acpi_register_gsi().
> 
> Fix this by calling acpi_unregister_gsi() first, so that
> the acpi_register_gsi() is allowed to change the trigger settings.
> 
> In cases where the GSI has not been registered yet
> the acpi_unregister_gsi() is a no-op.

...

>  	case X86_ACPI_IRQ_TYPE_APIC:
> +		/*
> +		 * The DSDT may already reference the GSI in a device skipped by
> +		 * acpi_quirk_skip_i2c_client_enumeration(). Unregister the GSI
> +		 * to avoid EBUSY errors in this case.
> +		 */
> +		acpi_unregister_gsi(data->index);

Perhaps a warning (or at least debug) message?

-- 
With Best Regards,
Andy Shevchenko


