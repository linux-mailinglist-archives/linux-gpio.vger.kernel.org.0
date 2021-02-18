Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7372331ED7D
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Feb 2021 18:47:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbhBRRl5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Feb 2021 12:41:57 -0500
Received: from mga07.intel.com ([134.134.136.100]:2130 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233616AbhBROPd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 18 Feb 2021 09:15:33 -0500
IronPort-SDR: pwiwHWxugM2a+bzzydPk1fmiSSr63fc1ThxU92Y8oss9KlLChdlECzl4K4mO/91bUMak8mrTk/
 s39UV7z6YFxg==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="247590890"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; 
   d="scan'208";a="247590890"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2021 06:14:16 -0800
IronPort-SDR: ElQZXhgmFtC60IIVlW+/UT5UP1hzG5Xt8dnWRP3n5MYhm+tebIYls/GzvQokwvZldIkSO2xR73
 LRQaLIzyIUtg==
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; 
   d="scan'208";a="439822549"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2021 06:14:15 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1lCk4K-005xt5-EF; Thu, 18 Feb 2021 16:14:12 +0200
Date:   Thu, 18 Feb 2021 16:14:12 +0200
From:   "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>
To:     "Bedel, Alban" <alban.bedel@aerq.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: pca953x: add support for open drain pins on
 PCAL6524
Message-ID: <YC52NFly5b3mxujS@smile.fi.intel.com>
References: <20210211175140.85391-1-alban.bedel@aerq.com>
 <CAHp75VfUY5-VtCWjaU6Q=hJY9hyUz8B36C0528RXUxkbnL9yEA@mail.gmail.com>
 <4d67d5627921b0f7ca6579b81f97691c53ef0c34.camel@aerq.com>
 <CAHp75Vczzhs=8k9G1FQYvqOV+Xg3GHp2=TykJX+E5ypT8puFqw@mail.gmail.com>
 <a1f4f5cc14a5037a8b122c811d2f24a8d3068c41.camel@aerq.com>
 <CAHp75VekEoU3y0iZ9RyfB4887n1hbLMcKfrgzYWfa6_cbKp_iQ@mail.gmail.com>
 <6018d92d2fc91841e76324adaf9f285e39b6fc00.camel@aerq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6018d92d2fc91841e76324adaf9f285e39b6fc00.camel@aerq.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 17, 2021 at 06:57:20PM +0000, Bedel, Alban wrote:
> On Wed, 2021-02-17 at 16:19 +0200, Andy Shevchenko wrote:
> > On Wed, Feb 17, 2021 at 3:11 PM Bedel, Alban <alban.bedel@aerq.com>
> > wrote:
> > > On Tue, 2021-02-16 at 19:50 +0200, Andy Shevchenko wrote:
> > > > On Tue, Feb 16, 2021 at 6:37 PM Bedel, Alban <
> > > > alban.bedel@aerq.com>
> > > > wrote:
> > > > > On Mon, 2021-02-15 at 14:53 +0200, Andy Shevchenko wrote:
> > > > > > On Thu, Feb 11, 2021 at 7:52 PM Alban Bedel <
> > > > > > alban.bedel@aerq.com
> > > > > > wrote:
> > 
> > ...
> > 
> > > > > > > +#define PCAL65xx_REGS          BIT(10)
> > > > > > 
> > > > > > Can we have it as a _TYPE, please?
> > > > > 
> > > > > Let's please take a closer look at these macros and what they
> > > > > mean.
> > > > > Currently we have 3 possible set of functions that are
> > > > > indicated by
> > > > > setting bits in driver_data using the PCA_xxx macros:
> > > > > 
> > > > > - Basic register only: 0
> > > > > - With interrupt support: PCA_INT
> > > > > - With latching interrupt regs: PCA_INT | PCA_PCAL =
> > > > > PCA_LATCH_INT
> > > > > 
> > > > > This patch then add a forth case:
> > > > > 
> > > > > - With pin config regs: PCA_INT | PCA_PCAL |
> > > > > $MACRO_WE_ARE_DICUSSING
> > > > > 
> > > > > Then there is the PCA953X_TYPE and PCA957X_TYPE macros which
> > > > > indicate
> > > > > the need for a different regmap config and register layout.
> > > > 
> > > > Exactly, and you have a different register layout (coincidentally
> > > > overlaps with the original PCA953x).
> > > 
> > > We have 2 layout for the base registers, the "mixed up registers"
> > > of
> > > the PCA957x and the "standard" of the PCA953x. Then we have the
> > > PCALxxxx chips which extend the base PCA953x registers with further
> > > registers for better interrupt handling. These are not treated as a
> > > new
> > > type in the current code, but as an extra feature on top of the
> > > PCA953x.
> > 
> > Yes, because they are about interrupts AFAICS.
> 
> This distinction seems arbitrary, each more advanced version of the
> chip just has more features along with a new register block.
> 
> > >  The PCAL65xx we are talking about add a further register
> > > block, so following the existing concept its not a new layout.
> > 
> > Yes, with one important detail, i.e. it extends the "mixed up"
> > registers, it's not a separate "feature" in this sense. The separate
> > "feature" can be, for example, PWM registers. I admit that this most
> > of the angle of preference how to draw a line between the features.
> > 
> > I prefer to see it as a type because of two things (in the current
> > code):
> >  - OF_9*() macros take only two arguments, second of which is
> > Interrupt related
> >  - PCA_INT group of bits is about Interrupt only
> 
> No, the register set indicated by PCA_PCAL also allow setting pull
> up/down which is supported by this driver. Furthermore the extra
> registers of the PCAL65XX also allow configuring edge triggered mode
> for interrupts. I really don't see why there should be 2 class of
> features, that only make the code more complex.
> 
> > Your proposal will disrupt the code (more invasive).
> 
> I tried to implement what you like to see:
> 
>  1 file changed, 105 insertions(+), 20 deletions(-)
> 
> vs my proposal:
> 
>  1 file changed, 65 insertions(+), 3 deletions(-)

Do you have any repo to look for both solutions?

-- 
With Best Regards,
Andy Shevchenko


