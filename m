Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05B0C7D1123
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Oct 2023 16:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377511AbjJTOAU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Oct 2023 10:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377376AbjJTOAT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Oct 2023 10:00:19 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD772CA;
        Fri, 20 Oct 2023 07:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697810417; x=1729346417;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mpqyGKvHVXV0RlwNW1oDdHVE8qJd2jWt5MyNnvZCE9A=;
  b=EK1q3cEbUpn2OV5OCuHvaSKsXPh3GaAQ9smybGebLyz1g2MHeVqQDh7V
   HyYbmAaaiq5NtGOCA6jPTwo9JWMiPvIUZE9Z8JqXhep/fEcUiejcv7hkN
   OK2RAEzr1CrOsKxGr/83xKd6X7awfWp5AbjEE0Ez2k5Q9AQZRmhPUumFg
   /YYfn9D3vcNh4fLpRWkdtl5MQ/2OYO3o4rPT3s6dfg+iTJ2ARPhchU3UR
   TNorJAxTcM75q0V5E7KzqqfeQiW9iKeJOA3NiBvKmEGI+cLyfpSdph7f1
   IzCc0axNKzPHsm++GzmOU1g/CLRM+f6z9A9BSNJRKmQxn/opjbm5sstAE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="371573326"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="371573326"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 07:00:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="823260129"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="823260129"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 07:00:12 -0700
Date:   Fri, 20 Oct 2023 17:00:09 +0300
From:   Raag Jadav <raag.jadav@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     rafael@kernel.org, len.brown@intel.com, robert.moore@intel.com,
        mika.westerberg@linux.intel.com, mark.rutland@arm.com,
        will@kernel.org, linux@roeck-us.net, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        acpica-devel@lists.linuxfoundation.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        mallikarjunappa.sangannavar@intel.com, bala.senthil@intel.com
Subject: Re: [PATCH v1 4/8] ACPI: utils: use acpi_dev_uid_match() for
 matching _UID
Message-ID: <ZTKH6bNPiy1fZKEG@black.fi.intel.com>
References: <20231020084732.17130-1-raag.jadav@intel.com>
 <20231020084732.17130-5-raag.jadav@intel.com>
 <ZTJYK02w8HZg26eI@smile.fi.intel.com>
 <ZTJmnv6CsZUt0pIS@black.fi.intel.com>
 <ZTKDsBPraERaautV@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTKDsBPraERaautV@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 20, 2023 at 04:42:08PM +0300, Andy Shevchenko wrote:
> On Fri, Oct 20, 2023 at 02:38:06PM +0300, Raag Jadav wrote:
> > On Fri, Oct 20, 2023 at 01:36:27PM +0300, Andy Shevchenko wrote:
> > > On Fri, Oct 20, 2023 at 02:17:28PM +0530, Raag Jadav wrote:
> > > > Convert manual _UID references to use standard ACPI helpers.
> > > 
> > > Yes, while not so obvious this is the correct replacement.
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > I think this is the only case which would suffer from the more obvious
> > behaviour, i.e.
> 
> No, that's not true. The same with override CPU in the other patch, where the
> check is simply absent, but the result will be the same. So, all with negation
> will suffer from the "obvious" implementation.

Forgot to add, we don't need to change the original acpi_dev_hid_uid_match()
behaviour, i.e.

bool acpi_dev_hid_uid_match(struct acpi_device *adev,
                            const char *hid2, const char *uid2)
{
        const char *hid1 = acpi_device_hid(adev);

        if (strcmp(hid1, hid2))
                return false;

        if (!uid2)
                return true;

        return acpi_dev_uid_match(adev, uid2);
}

I'm fine with both, this just makes more sense to me.

Raag
