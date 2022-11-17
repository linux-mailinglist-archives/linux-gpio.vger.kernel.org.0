Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D84762DF67
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 16:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240619AbiKQPNy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 10:13:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240643AbiKQPNO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 10:13:14 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C379B7D50F
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 07:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668697780; x=1700233780;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rn3z6brsMs2zP98ovoPn0bIcEZj1gZEdOzUcmgFQWtY=;
  b=RCrcNEwTL61Fs6gK/RRG5F4oii73wGYWztB/aSjWwVoSqlba6tLuzwRo
   a4wXXTT5cu/ZHj7Rm7WKcSXuoYJfrUkYdqsAQzdTBCwsfeJ5k2ESy3lLP
   Ar+YjaRvNOt9NWn+Y/Qi2dDp1EcnQkpIbkAxfh3a54hrXOPBiTj7azwtT
   +8JxUyTsZlAyjltvJeU+qUCNbm+xy8/PCBHFiiaGet3Gs5DEhHHmmbYAV
   1SLRMgV2/UAtgTgtrmQtOIC1i9LSEWHBr0mH3XTFKZHHYmTiGUmbCXWCN
   Oh2gKvkrZu5XezKco+MWsOKURYp7T/a/IwRap0eLtZ0pCUrpeQyGzGXqp
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="339703133"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="339703133"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2022 07:08:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="617640692"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="617640692"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 17 Nov 2022 07:08:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 92F652F3; Thu, 17 Nov 2022 17:08:54 +0200 (EET)
Date:   Thu, 17 Nov 2022 17:08:54 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Niyas Sait <niyas.sait@linaro.org>
Cc:     linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH RFC v2 1/3] pinctrl: add support for ACPI PinGroup
 resource
Message-ID: <Y3ZOhi+UPVeQ5qZj@black.fi.intel.com>
References: <20221115175415.650690-1-niyas.sait@linaro.org>
 <20221115175415.650690-2-niyas.sait@linaro.org>
 <Y3SwV2ygYb3C0w4o@black.fi.intel.com>
 <d72903a9-ba74-fc0e-5d40-6bb50f4d8354@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d72903a9-ba74-fc0e-5d40-6bb50f4d8354@linaro.org>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 17, 2022 at 01:28:01PM +0000, Niyas Sait wrote:
> On 16/11/2022 09:41, Mika Westerberg wrote:
> 
> > > + * pinctrl_acpi_get_pin_groups() - Get ACPI PinGroup Descriptors for the device
> > > + * @adev: ACPI device node for retrieving PinGroup descriptors
> > > + * @group_desc_list: list head to add PinGroup descriptors
> > > + *
> > > + * This will parse ACPI PinGroup resources for the given ACPI device
> > > + * and will add descriptors to the provided @group_desc_list list
> > I would add here what happens to group_desc_list if the function returns
> > non-zero.
> > 
> > Also perhaps the API should use an array instead and when NULL is passed
> > it returns the size as we do with properties for example. The naged
> > list_head pointer looks kind of weird.
> 
> Array would be nice. However I might have to do an additional acpi walk to
> find the number of PinGroups to allocate array and another iteration to
> populate fields. May be two iterations are not as bad as I thought. Open to
> suggestions.

I don't think we need to "optimize" anything at this point and this is
certainly not a hot path. I suggest to emphasize on the API and think
what is easier for the caller (and also if there is simila API already
follow that it does).
