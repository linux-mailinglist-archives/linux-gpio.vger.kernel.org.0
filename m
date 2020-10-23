Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E73E229712A
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Oct 2020 16:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750414AbgJWORE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Oct 2020 10:17:04 -0400
Received: from mga05.intel.com ([192.55.52.43]:10641 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750401AbgJWORB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Oct 2020 10:17:01 -0400
IronPort-SDR: sD4HPy5LJzeZIebs9M6qxzNTkJvPSUrYPLynj9CsGWIh9RxK5u40YLRmksfORd8fZZpVP4h0hQ
 OqUQSgxbLmBA==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="252379486"
X-IronPort-AV: E=Sophos;i="5.77,408,1596524400"; 
   d="scan'208";a="252379486"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2020 07:16:55 -0700
IronPort-SDR: fZkhYQcPT9lU1nvcYX6BQ91UPb6h4pCbwcob9qL3m+WjAQ49Qmsvr44p5Zcz/0I2wqwf/wN5NH
 0sNnPyXYK8vw==
X-IronPort-AV: E=Sophos;i="5.77,408,1596524400"; 
   d="scan'208";a="349215562"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2020 07:16:51 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1kVxsr-00E8Fw-6G; Fri, 23 Oct 2020 17:17:33 +0300
Date:   Fri, 23 Oct 2020 17:17:33 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH] treewide: rework struct gpiod_line_bulk
Message-ID: <20201023141733.GV4077@smile.fi.intel.com>
References: <20201023092831.5842-1-brgl@bgdev.pl>
 <CAHp75VeiGSJO5XnpQLMs=0nT=otVjC1tOsR7xp1gJ3tLHwUTaA@mail.gmail.com>
 <CAMRc=McD7jtBQ_CPV26Pzr63T6-o_aPpYt_CT-48H_mGuhxrGw@mail.gmail.com>
 <CAHp75VcxaqmJocQ8jYouJ80P0anN5ENheH2yK2Sm-sHXjA5NoA@mail.gmail.com>
 <CAHp75VeGFuF7NrGJ9sc+kXz3e-wzGi3kTDmW56oaNKJf65NZLg@mail.gmail.com>
 <CAMpxmJWWt5MhqObJabOxtdm9U4rQ6EPvJR3PHBRH_J1uLMat+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJWWt5MhqObJabOxtdm9U4rQ6EPvJR3PHBRH_J1uLMat+Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 23, 2020 at 02:44:06PM +0200, Bartosz Golaszewski wrote:
> On Fri, Oct 23, 2020 at 2:08 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Fri, Oct 23, 2020 at 3:06 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Fri, Oct 23, 2020 at 2:39 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > > On Fri, Oct 23, 2020 at 12:24 PM Andy Shevchenko
> > > > <andy.shevchenko@gmail.com> wrote:
> >
> > ...
> >
> > > > Nope because gcc will scream:
> > > >
> > > > error: flexible array member in union
> > >
> > > Ah, of course. Should be
> > >   struct ... **lines;
> >
> > But it is not gonna work... we need an array here. or just one member
> >
> > struct *lines;
> >
> > bulk:
> >   lines = malloc(num_lines * sizeof(lines));
> >   xxx->lines = lines;
> >
> > single:
> >   xxx->lines = line;
> 
> The definition I used is clearer - it's explicit about using an array
> with a single member by default and can be extended as needed when
> allocating.

According to [1] it makes harder to avoid sizeof() type of calculation
mistakes for such struct.

From my point of view extending something that has been already predefined
is not cool. But it's up to you to decide.

[1]: https://www.kernel.org/doc/html/v5.9-rc1/process/deprecated.html#zero-length-and-one-element-arrays


-- 
With Best Regards,
Andy Shevchenko


