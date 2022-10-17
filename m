Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED87560156C
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 19:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbiJQRcD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 13:32:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbiJQRbw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 13:31:52 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3CAC2037C
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 10:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666027900; x=1697563900;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fVLesEFrGXpUNhbt8j4xIAYsHW9EviRnKYXAfLQyiV4=;
  b=SdPQQJJkdc+MtJ+3/GXaqs65X9NIxW4d/BH03UfNFRaIiVXey8UnaBF1
   FU0rG54VIhwt7x46yQ52uDoUOeAPiCNWOyjN4/qwMjsxfgZB8tiQYrWeY
   ibTm42kZkzFzyH9AG27svCzs901xyv2RMjMedqKDd8W4YjaqX4NkxDE43
   zaFOJYuj7r5IF9XKXygDb9/OpoUjV2EnmqvZfMmH/MreO6U7zvLVdEmMz
   RF+YABInQylHP8TeKSzKhO+TCPHVV7bofCnpAUgv9yuIwBMlPwIMDsQgg
   /24XpJO2LHdJHS3SbWs8e7cDBA6of30+lKfI1xRJefvz3pLNCU6p2cwJQ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="392172113"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; 
   d="scan'208";a="392172113"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2022 10:31:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="873551962"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; 
   d="scan'208";a="873551962"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 17 Oct 2022 10:31:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1okTxA-008wTA-0p;
        Mon, 17 Oct 2022 20:31:04 +0300
Date:   Mon, 17 Oct 2022 20:31:04 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Levente =?iso-8859-1?B?Uul26XN6?= <levente.revesz@eilabs.com>,
        Martyn Welch <martyn.welch@collabora.com>,
        Nate Drude <nate.d@variscite.com>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Peter Robinson <pbrobinson@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 0/2] gpio: pca953x: Add interrupt mask support for
 pca953x chips
Message-ID: <Y02RWJVvybzvNbaA@smile.fi.intel.com>
References: <20221010132007.924810-1-levente.revesz@eilabs.com>
 <CACRpkdbVCw=b-Hot83UpqmzaBSYGT0VY0g3QcgHNaPke4=grgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbVCw=b-Hot83UpqmzaBSYGT0VY0g3QcgHNaPke4=grgA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 17, 2022 at 12:02:16PM +0200, Linus Walleij wrote:
> On Mon, Oct 10, 2022 at 3:23 PM Levente Révész
> <levente.revesz@eilabs.com> wrote:
> 
> > Some chips in the pca953x family have an interrupt mask register in
> > addition to the standard 4 registers:
> >
> >     0: INPUT
> >     1: OUTPUT
> >     2: POLARITY
> >     3: CONFIGURATION
> >     4: INTERRUPT MASK
> >
> > Chips with this register:
> >
> >     - pca9505
> >     - pca9506
> >     - pca9698
> >
> > The interrupt mask register defaults to all interrupts disabled, so
> > interrupts are unusable unless the driver sets this register.
> >
> > Interrupt masking is already implemented for pcal chips. That
> > implementation could be extended to support this register as well.
> >
> > This patch series adds support for the interrupt mask register in
> > mentioned pca chips.
> 
> Added some PCA953x users to the To-line, lots of people use
> this driver so please review!

Thank you for Cc'ing me!

At first glance I think this needs two prerequisite patches:

1) convert _TYPE from bits to plain numbers, so we will have room
   for up to 16 types;

2) Introducing PCAL953X_TYPE.

After this is done, the current series will be neater.

-- 
With Best Regards,
Andy Shevchenko


