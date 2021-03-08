Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2E633119B
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 16:06:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbhCHPFA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 10:05:00 -0500
Received: from mga07.intel.com ([134.134.136.100]:15430 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230511AbhCHPEv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Mar 2021 10:04:51 -0500
IronPort-SDR: rZXrXVlEH8dOYTpNPu2rpQ1mXm9l2LUgSpqJq0Oy68NQxddSdKgYDGSugP07WmRUQEpLI3IoF8
 mk6qoq20BDAw==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="252070636"
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="252070636"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 07:04:50 -0800
IronPort-SDR: J8GNzHfLKcDEkk426TkXPTJpLuMsSrSi0ZePPgzJPGYWw6fHHNIpqpY8ioVeonKngALCCJk50S
 Wxqg+2kLC99Q==
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="519965026"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 07:04:47 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lJHR6-00AqJ3-6h; Mon, 08 Mar 2021 17:04:44 +0200
Date:   Mon, 8 Mar 2021 17:04:44 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 09/12] gpio: sim: new testing module
Message-ID: <YEY9DFk6NEcnEWGE@smile.fi.intel.com>
References: <20210304102452.21726-1-brgl@bgdev.pl>
 <20210304102452.21726-10-brgl@bgdev.pl>
 <YEDdbfbM9abHJpIO@smile.fi.intel.com>
 <CAMRc=MdRxXzoZuyLs-24dXfOft=OQqDneTHa4-ZKqFE1kMBWcg@mail.gmail.com>
 <YEIE1nG8lZ4V2MXq@smile.fi.intel.com>
 <CAMRc=MekGnK17rYf3Bx_UHumVVrpmJphOnMfO352NB9SaOJCGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MekGnK17rYf3Bx_UHumVVrpmJphOnMfO352NB9SaOJCGw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 08, 2021 at 03:23:31PM +0100, Bartosz Golaszewski wrote:
> On Fri, Mar 5, 2021 at 11:15 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Mar 04, 2021 at 09:15:29PM +0100, Bartosz Golaszewski wrote:
> > > On Thu, Mar 4, 2021 at 2:15 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Thu, Mar 04, 2021 at 11:24:49AM +0100, Bartosz Golaszewski wrote:
> > > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

> > > > > +
> > > > > +     /*
> > > > > +      * FIXME If anyone knows a better way to parse that - please let me
> > > > > +      * know.
> > > > > +      */
> > > >
> > > > If comma can be replaced with ' ' (space) then why not to use next_arg() from
> > > > cmdline.c? I.o.w. do you have strong opinion why should we use comma here?
> > > >
> > >
> > > My opinion is not very strong but I wanted to make the list of names
> > > resemble what we pass to the gpio-line-names property in device tree.
> > > Doesn't next_arg() react differently to string of the form: "foo=bar"?
> >
> > It's ambiguous here.
> >
> > So, the strings '"foo=bar"' and 'foo=bar' (w/o single quotes!) are indeed
> > parsed differently, i.e.
> >         '"foo=bar"' -> 'foo=bar',
> > while
> >         "foo=bar" -> 'foo' + 'bar'.
> >
> 
> IMO '"foo", "bar", "", "foobar"' looks better than '"foo" "bar" ""
> "foobar"' and I'm also not sure next_arg will understand an empty
> quote?

I guess it understands it. But I agree that comma-separated it would look
better.

> If you're not objecting strongly, then I would prefer my version.

I have strong opinion not to open code "yet another parser".

So, grepping on 'strsep(.*, ",")' shows a lot of code that wants something like
this. Interesting are the net/9p cases. This in particular pointed out to
lib/parser.c which in turn shows promising match_strlcpy() / match_strdup(). I
haven't looked deeply though.

That said, I agree that next_arg() is not the best here.

-- 
With Best Regards,
Andy Shevchenko


