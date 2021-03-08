Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67B63331243
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 16:33:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbhCHPdB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 10:33:01 -0500
Received: from mga05.intel.com ([192.55.52.43]:28110 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230409AbhCHPc4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Mar 2021 10:32:56 -0500
IronPort-SDR: csqNquLblrlaNYUhwdLyjE9B3x8cELNyG8MPsp8yB8gYqPJvGkOmcuoohdesSIS+qRg0XDmmHw
 q+6bx2+0aRiA==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="273076452"
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="273076452"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 07:32:55 -0800
IronPort-SDR: oC+ntWrJIAsk3CK3yOkmRRVNwsg9G++lUMJCqj9PPtc3AYngnfqVR0a1pifBvpqLAhPcj4FIo1
 86WDU6ZeME4A==
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="430406229"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 07:32:52 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lJHsH-00Aqc3-7g; Mon, 08 Mar 2021 17:32:49 +0200
Date:   Mon, 8 Mar 2021 17:32:49 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>, Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 09/12] gpio: sim: new testing module
Message-ID: <YEZDod11xb0LT043@smile.fi.intel.com>
References: <20210304102452.21726-1-brgl@bgdev.pl>
 <20210304102452.21726-10-brgl@bgdev.pl>
 <YEDdbfbM9abHJpIO@smile.fi.intel.com>
 <CAMRc=MdRxXzoZuyLs-24dXfOft=OQqDneTHa4-ZKqFE1kMBWcg@mail.gmail.com>
 <YEIE1nG8lZ4V2MXq@smile.fi.intel.com>
 <CAMRc=MekGnK17rYf3Bx_UHumVVrpmJphOnMfO352NB9SaOJCGw@mail.gmail.com>
 <YEY9DFk6NEcnEWGE@smile.fi.intel.com>
 <CAMpxmJVTUfveuaY9yhP5PLXoOdrkYQ2WbE5-P+4XRi3=VdQKjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJVTUfveuaY9yhP5PLXoOdrkYQ2WbE5-P+4XRi3=VdQKjg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 08, 2021 at 04:13:33PM +0100, Bartosz Golaszewski wrote:
> On Mon, Mar 8, 2021 at 4:05 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Mar 08, 2021 at 03:23:31PM +0100, Bartosz Golaszewski wrote:

...

> > I have strong opinion not to open code "yet another parser".
> >
> > So, grepping on 'strsep(.*, ",")' shows a lot of code that wants something like
> > this. Interesting are the net/9p cases. This in particular pointed out to
> > lib/parser.c which in turn shows promising match_strlcpy() / match_strdup(). I
> > haven't looked deeply though.
> >
> > That said, I agree that next_arg() is not the best here.
> 
> Shall we revisit this once it's upstream with a generalization for
> separating comma separated strings?

How can we guarantee it won't be forgotten?

-- 
With Best Regards,
Andy Shevchenko


