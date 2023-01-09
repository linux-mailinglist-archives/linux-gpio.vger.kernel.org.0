Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5FAE662806
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jan 2023 15:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236657AbjAIOE1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Jan 2023 09:04:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236793AbjAIOEF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2023 09:04:05 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58E13E6C;
        Mon,  9 Jan 2023 06:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673273044; x=1704809044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XNuvwSa3BUDS7y9d79Se3YQi92r/7/wZSXF1e9U1cDk=;
  b=gtr+wckTzO2EhM5ensJMf+b7cUj9/pMCyH0t0N+CagcrXMYfgwu2PsvO
   21ulx4xGGIa/NsPtX0Fk1XML6Ln6QFla6GylH5k8cBBXaJGehqbwDhjfO
   KXezusfqX3eNbdxFMLmP7gHJ5Un02VrMCXa6IgsPbgBWhne1xxxQprs0k
   LmgdZ9jp45rFOUTfk6byP+WUl96e4ikMwqHq/kKcEhHlRwFSXuAfO86O3
   u0z2tx++rgvrzW/N13aLZuceQQkfS8Lxt2OHxVo3pXm0fP3YXLn5AkCUv
   S+XMPVZuJ3etubXb6vlHmK3zKyvcXWOiH3x+6UcW/xlvHHm4b/KgOrUy8
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="350091482"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="350091482"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 06:03:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="606616651"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="606616651"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 09 Jan 2023 06:03:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pEskF-006VbX-1f;
        Mon, 09 Jan 2023 16:03:23 +0200
Date:   Mon, 9 Jan 2023 16:03:23 +0200
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
Message-ID: <Y7weq/AG3/YZ4F7B@smile.fi.intel.com>
References: <20221215213206.56666-1-biju.das.jz@bp.renesas.com>
 <CACRpkdZCEvpLAWvH7pCLH7KwbDMzz0EN+4HbxVGfFPi_C1b8+g@mail.gmail.com>
 <CAMuHMdU1J46KSzqqCQc-1ZrgvfWh8J2aa6NzRTK_A_ZJs+zRVQ@mail.gmail.com>
 <CACRpkdaL2J7F2sVjVcTtFTfK1exZ3Rmjhc_dYxuo2DfhYq_8gw@mail.gmail.com>
 <CAMuHMdUeazkEXWh+R9iy3TLc16b=OX9rOzAoB1=X=K4wOo9pRA@mail.gmail.com>
 <Y7weA85RvQgCXzJK@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7weA85RvQgCXzJK@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 09, 2023 at 04:00:35PM +0200, Andy Shevchenko wrote:
> On Mon, Jan 09, 2023 at 02:41:24PM +0100, Geert Uytterhoeven wrote:
> > On Mon, Jan 9, 2023 at 2:16 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > On Tue, Jan 3, 2023 at 10:01 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > If this should go into sysfs we should probably create something
> > > > > generic, such as a list of stuff to be exported as sysfs switches.
> > > > >
> > > > > It generally also looks really dangerous, which is another reason
> > > > > for keeping it in debugfs. It's the big hammer to hurt yourself with,
> > > > > more or less.
> > > >
> > > > Yes, generic would be nice.  Anyone familiar with other hardware
> > > > that could make use of this?
> > >
> > > Drew was using this for Beagle Bone IIRC, Drew?
> > 
> > Yes, that's what I remember, too.  And I tested it on Koelsch.
> > 
> > But again, that's for debugging purposes.  For non-debugging
> > operation, we need something different.
> 
> I really would like to know the use case when you need to mux pins at run time.
> And the guarantee it won't break users' devices into smoke or killing somebody
> playing with robots.

Btw, I might agree on having something like this in production, but enabling
it should print a BIG warning that the functionality is DANGEROUS. Something
like trace_printk() has.

-- 
With Best Regards,
Andy Shevchenko


