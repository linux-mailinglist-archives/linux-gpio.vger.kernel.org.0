Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEDA52C2CF5
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 17:31:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390054AbgKXQaK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 11:30:10 -0500
Received: from mga09.intel.com ([134.134.136.24]:43325 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389808AbgKXQaK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Nov 2020 11:30:10 -0500
IronPort-SDR: wYFhcM4InTwIy38A8EFdz9F+v0XzRp70eGEnZHYWXZjOD2hdm9ixAOhWYhOLC7mOYD1R3flwe3
 /6kUcWtIm5mA==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="172130427"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; 
   d="scan'208";a="172130427"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2020 08:30:09 -0800
IronPort-SDR: HK8pTT8Bw1bAULB0mxPreSk/zrGE4Z7z+29sUdK5EAmVvt9GMFnivettWPIL1CpTQ1hi9xc4QK
 3V4HBbBV63Ag==
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; 
   d="scan'208";a="546892105"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2020 08:30:06 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 24 Nov 2020 18:30:02 +0200
Date:   Tue, 24 Nov 2020 18:30:02 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Len Brown <lenb@kernel.org>
Subject: Re: Request for pre-review of pending MID removal patch series
Message-ID: <20201124163002.GN2532@lahna.fi.intel.com>
References: <CAHp75Ve8ncybbLB7hCb0Qxh=JjJr8e1tVrXXiJhwFt9=2b3AYg@mail.gmail.com>
 <CAHp75VfpxvGgTyHFA6p1fmqpAu9ok3=ztGp3USviAHY6m8y=7g@mail.gmail.com>
 <20201124144300.GM2532@lahna.fi.intel.com>
 <CAHp75Vd6HJpt0DgE3ugB-qXGT5FL2tzg=CCKn9a-PeAYY+n+ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vd6HJpt0DgE3ugB-qXGT5FL2tzg=CCKn9a-PeAYY+n+ow@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 24, 2020 at 05:02:13PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 24, 2020 at 4:43 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Mon, Nov 23, 2020 at 07:59:29PM +0200, Andy Shevchenko wrote:
> > > +Cc: Mika
> > >
> > > On Fri, Oct 23, 2020 at 8:07 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > >
> > > > Hi!
> > > >
> > > > There is a pending patch series [1] to remove a lot of legacy code
> > > > related to old Intel MID platforms. (Note, not all of them, since we
> > > > have an ACPI based Intel Edison edition which continue working nicely
> > > > after this)
> > > >
> > > > Most of the code is shuffling arch/x86 and the series is quite
> > > > dependent on the contents of that folder (for the sake of
> > > > bisectability). Since that the only way it would be integrated is
> > > > through the tip tree I would like to have your preliminary review on
> > > > other contents — #3 and #4 are PDx86 and GPIO subsystems. In this case
> > > > I won't resend this many times.
> > > >
> > > > I have a preliminary offline agreement with Len Brown on SFI removal
> > > > (#2 in the list).
> > > >
> > > > [1]: https://gitlab.com/andy-shev/next/-/commits/topic/mid-removal/
> >
> > Looks pretty good to me.
> 
> Thanks! Can I use your tag (which is better?) for some patches (which ones?)?

Aren't you going to submit this series for real review at some point? I
can then formally review some of the patches.

> > I wonder it is possible to remove gma500 also
> > or it is used in Edison?
> 
> It can be used on other platforms based on not-going-to-be-removed
> Merrifield and possibly Moorefield.
> Hence I would like to leave it for now.

OK.
