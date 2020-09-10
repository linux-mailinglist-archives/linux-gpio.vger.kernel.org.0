Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BADB22647CC
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Sep 2020 16:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731073AbgIJOMi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Sep 2020 10:12:38 -0400
Received: from mga06.intel.com ([134.134.136.31]:39485 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726725AbgIJOKV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Sep 2020 10:10:21 -0400
IronPort-SDR: Min1bTY0xZGuny46PvCA/BEQOjNFljgjnvzRz3XPg1WB4jEDBdUBu8vdaWkLDGGHOriUdzAcI0
 S2mwOdEFfvGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="220094622"
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; 
   d="scan'208";a="220094622"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2020 07:09:53 -0700
IronPort-SDR: klNNvDgZxDCuviZmobswONAVyPCmP8GaAcA/Kr423br6kkD+2RYE1Q3RDiV2PzL75tSKryK/fw
 5DwIQfn1Mn6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; 
   d="scan'208";a="334185991"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 10 Sep 2020 07:09:52 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kGNGn-00Fhaa-Q4; Thu, 10 Sep 2020 17:09:49 +0300
Date:   Thu, 10 Sep 2020 17:09:49 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v5 00/20] gpio: cdev: add uAPI v2
Message-ID: <20200910140949.GV1891694@smile.fi.intel.com>
References: <20200827140020.159627-1-warthog618@gmail.com>
 <CACRpkdZZMbfpKy4gcfAzNq53LkYLcL9wm3Qtzyj_K8vkUW9RfQ@mail.gmail.com>
 <CAMpxmJXRY2wqqN3SzfJN+QTWAHYSYz4vEjLKWU82Y=PAmcm=5w@mail.gmail.com>
 <20200827224742.GA3714@sol>
 <CACRpkdZroNFFsHoBHUFTUUQij7nOcPQiXP-567+fH-Xerv=L4w@mail.gmail.com>
 <20200829013532.GA5905@sol>
 <CAMpxmJWjPzueMeKopo7qFke05CEePVD4YGbUiN7b_STKoYt0ZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJWjPzueMeKopo7qFke05CEePVD4YGbUiN7b_STKoYt0ZQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 01, 2020 at 11:28:13AM +0200, Bartosz Golaszewski wrote:
> On Sat, Aug 29, 2020 at 3:35 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, Aug 28, 2020 at 04:37:19PM +0200, Linus Walleij wrote:
> > > On Fri, Aug 28, 2020 at 12:47 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > > The particular use case I am considering is one I had been asked about -
> > > > changing a requested line from input with edge detection to output, and
> > > > vice versa. Losing interrupts isn't really an issue for this use case -
> > > > it is expected.  Yet the current implementation requires a re-request.
> > >
> > > This is possible to do for in-kernel users, but I don't know if that makes
> > > sense for userspace. It is for one-offs and prototyping after all, there
> > > is no need (IMO) to make it overly convenient for users to implement
> > > all kind of weirdness in userspace unless there is a very real use case.
> > >
> >
> > Fair point - in fact it is the same one that made me reconsider why I
> > was so concerned about potentially losing an edge event in a few rare
> > corner cases.
> >
> > Another point for this change are that it actually simplifies the kernel
> > code, as it takes as much code to detect and filter these cases as it
> > does to include them in the normal flow.
> >
> > I had a play with it yesterday and the change removes two whole
> > functions, gpio_v2_line_config_change_validate() and
> > gpio_v2_line_config_has_edge_detection() at the expense of making
> > debounce_update() a little more complicated. I'm happy to put together a
> > v6 that incorporates those changes if there aren't any strenuous
> > objections - we can always revert to v5.  Or I could mail the couple of
> > patches I've made and if they seem reasonable then I could merge them
> > into this set?
> >
> > Cheers,
> > Kent.
> 
> I personally like v6 more. The code is more elegant and we've also
> tried limiting GPIO chardev features before and now we're doing v2 so
> let's not make the same mistake twice. :)
> 
> I'll try to review v6 in detail later today.

Let me briefly review to this. Can you remind which patch has a top level
description of what features are provided in comparison to uAPI v1?
(Btw, do we have some kind of comparison table?)


-- 
With Best Regards,
Andy Shevchenko


