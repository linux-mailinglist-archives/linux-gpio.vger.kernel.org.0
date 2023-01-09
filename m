Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA4826627F8
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jan 2023 15:02:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231886AbjAIOCR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Jan 2023 09:02:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237262AbjAIOBx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2023 09:01:53 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8C9932185;
        Mon,  9 Jan 2023 06:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673272842; x=1704808842;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w3qlJT6yaQvD6kDhLJN4LKB/Xk/1zA2l6bMocNDXiQU=;
  b=GHfkWq7sqMaO4Grp7RN6p8S1E0Y5FFpQGCVPN65fhCvOQScXgIar8s/u
   9+xDfZRhDt/CiDEmS3Ok0SztNK/u6nisthalxubyGO9PTTZ7E/wxvzv7K
   XcENXPmd1JHrTKLXH03o9jAC/HP4opFIeE3Fl0eSrqzCWLQiuyku8Ve8k
   k2eFHOo1U/ojw4TFh2aP7BQ7xmbXJ/musF9zCDWaWt5CSGZp5dk67tP0K
   dADLaR1EYQKAKfXK0gD3FRVXHDIhNHNA0AcYc76k5rLL0I1hG98cudxCO
   ZyN8puERWU+TJAeY7pxn89w40wXYrU9anKoyUO7ZDCtf+miuc3rjNd82+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="306394716"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="306394716"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 06:00:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="985405109"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="985405109"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 09 Jan 2023 06:00:37 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pEshX-006VXG-29;
        Mon, 09 Jan 2023 16:00:35 +0200
Date:   Mon, 9 Jan 2023 16:00:35 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Drew Fustini <dfustini@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 0/9] Add RZ/G2L POEG support
Message-ID: <Y7weA85RvQgCXzJK@smile.fi.intel.com>
References: <20221215213206.56666-1-biju.das.jz@bp.renesas.com>
 <CACRpkdZCEvpLAWvH7pCLH7KwbDMzz0EN+4HbxVGfFPi_C1b8+g@mail.gmail.com>
 <CAMuHMdU1J46KSzqqCQc-1ZrgvfWh8J2aa6NzRTK_A_ZJs+zRVQ@mail.gmail.com>
 <CACRpkdaL2J7F2sVjVcTtFTfK1exZ3Rmjhc_dYxuo2DfhYq_8gw@mail.gmail.com>
 <CAMuHMdUeazkEXWh+R9iy3TLc16b=OX9rOzAoB1=X=K4wOo9pRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUeazkEXWh+R9iy3TLc16b=OX9rOzAoB1=X=K4wOo9pRA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 09, 2023 at 02:41:24PM +0100, Geert Uytterhoeven wrote:
> On Mon, Jan 9, 2023 at 2:16 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Tue, Jan 3, 2023 at 10:01 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > If this should go into sysfs we should probably create something
> > > > generic, such as a list of stuff to be exported as sysfs switches.
> > > >
> > > > It generally also looks really dangerous, which is another reason
> > > > for keeping it in debugfs. It's the big hammer to hurt yourself with,
> > > > more or less.
> > >
> > > Yes, generic would be nice.  Anyone familiar with other hardware
> > > that could make use of this?
> >
> > Drew was using this for Beagle Bone IIRC, Drew?
> 
> Yes, that's what I remember, too.  And I tested it on Koelsch.
> 
> But again, that's for debugging purposes.  For non-debugging
> operation, we need something different.

I really would like to know the use case when you need to mux pins at run time.
And the guarantee it won't break users' devices into smoke or killing somebody
playing with robots.

-- 
With Best Regards,
Andy Shevchenko


