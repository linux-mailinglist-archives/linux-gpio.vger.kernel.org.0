Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED72A6ADDE0
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Mar 2023 12:46:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbjCGLqi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Mar 2023 06:46:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231421AbjCGLqL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Mar 2023 06:46:11 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2029D7BA0E;
        Tue,  7 Mar 2023 03:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678189451; x=1709725451;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=faD3iuKZoskh8/0OLMp6uNTNXrZF+VMHyPHdnQQGqdc=;
  b=mBbYYsq+eF0d7ZqeGHE8tzZbkIyX8x7C3+tpnFxmWSotGBFK8vycWKSj
   v5KN/T2Vg0wEv54Ee8Vyg7cHOAYDVJ8hsVsVV9f0SPgKX7tw6/iQtRs/x
   2RI/NWQiMFTDVgK06zvKOwTEhcxin6jPqvKhVWtKMelAlto/tgS2RM3x5
   ZLDwijmj6VA7K/l77GwaTQQYKCuuJEHoQ0jfo3fVfsjTdf2X4XwEx4/K+
   wYNP0DMECneADNLUmrsNeEPkHYoA20SuDVSOBAHUFDNOZqIenpbO5JcnO
   PRreK+lnrMakv7C0BwUhY3am5RCY/E+8mzEWSxuQxhoreQxjN9Rpal5i3
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="338153402"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="338153402"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 03:42:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="653948859"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="653948859"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 07 Mar 2023 03:42:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pZViO-00Gto6-16;
        Tue, 07 Mar 2023 13:42:44 +0200
Date:   Tue, 7 Mar 2023 13:42:43 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.3-1
Message-ID: <ZAcjM5Ceivzyghcf@smile.fi.intel.com>
References: <ZAYCRPsKR8Je6LOW@black.fi.intel.com>
 <CACRpkdY3pCu6gZ-kA8uHAcCBpx_0AKwVLp+UyYO0dnWdt+fZKw@mail.gmail.com>
 <ZAZqy+LFkZuj+T4P@surfacebook>
 <e4cdd1f9-fc79-4f91-a4df-ab5f5a94faa3@app.fastmail.com>
 <CAHp75Vds2cLoTciFdQmEZsXsS0ND_HJmn1MNm6hsApFazkFAHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vds2cLoTciFdQmEZsXsS0ND_HJmn1MNm6hsApFazkFAHg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 07, 2023 at 11:51:44AM +0200, Andy Shevchenko wrote:
> On Tue, Mar 7, 2023 at 10:09 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Mon, Mar 6, 2023, at 23:35, andy.shevchenko@gmail.com wrote:
> > > Mon, Mar 06, 2023 at 10:50:40PM +0100, Linus Walleij kirjoitti:
> > >> On Mon, Mar 6, 2023 at 4:14 PM Andy Shevchenko
> > >> <andriy.shevchenko@linux.intel.com> wrote:
> > >>
> > >> > Hi Linux GPIO maintainers et al.,
> > >> >
> > >> > Combined series to clean up headers in the GPIO library and drivers.
> > >> > Along with it, drop a few unused legacy APIs.
> > >> >
> > >> > This tag is immutable, enjoy!
> > >>
> > >> Thanks for coordinating and getting this sorted and tested Andy, perfect
> > >> job as always!
> > >
> > > You're welcome!
> > >
> > >> > intel-gpio for v6.3-1
> > >>
> > >> But I think you mean it for v6.4?
> > >
> > > Well, techically speaking it didn't make v6.3-rc1 due to cross-dependencies.
> > > Starting from it it may be applied to v6.3 or to v6.4.
> > >
> > > Up to you and Bart, but I prefer not to rebrand the tag, if it's an option.
> >
> > I think it was clear that this would not make it into 6.3 after
> > the decision to rebase on top of 6.3-rc1. However, the tag name
> > and description both look like they make sense for 6.4 the way
> > you wrote them.
> 
> Okay, I will rre-tag this.

Now it's tagged as intel-gpio-v6.4-1. Should I send a new PR?

-- 
With Best Regards,
Andy Shevchenko


