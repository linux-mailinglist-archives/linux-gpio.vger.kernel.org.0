Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC6D0278EDF
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Sep 2020 18:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728443AbgIYQlE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Sep 2020 12:41:04 -0400
Received: from mga11.intel.com ([192.55.52.93]:19942 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726990AbgIYQlE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Sep 2020 12:41:04 -0400
IronPort-SDR: Me5HzumdUfC+imb3Npr9D4Ls0HY4wWssDNmmh1r4DWJfKa1go19jGXOpYJEbTbZCr2ARTjV2X8
 JDB9UBMHG1yQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9755"; a="158936131"
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; 
   d="scan'208";a="158936131"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2020 09:41:03 -0700
IronPort-SDR: Qbg96RyIDZE69SpY8G9y5rk466eek6K/vAeSIASoTig1Amupl9y1Wwvs6ovpTjLiLrP8bQzL4h
 cu4S3r4Vf5SA==
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; 
   d="scan'208";a="413872238"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2020 09:41:01 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kLmpW-001ut5-Gl; Fri, 25 Sep 2020 15:28:02 +0300
Date:   Fri, 25 Sep 2020 15:28:02 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/9] lib: string_helpers: provide kfree_strarray()
Message-ID: <20200925122802.GC3956970@smile.fi.intel.com>
References: <20200924113842.11670-1-brgl@bgdev.pl>
 <20200924113842.11670-2-brgl@bgdev.pl>
 <20200925084804.GX3956970@smile.fi.intel.com>
 <CAMpxmJV27BO0A82TKWK59StYXnLfgqT5qS_chgn73GPoNn3wCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJV27BO0A82TKWK59StYXnLfgqT5qS_chgn73GPoNn3wCA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 25, 2020 at 01:32:01PM +0200, Bartosz Golaszewski wrote:
> On Fri, Sep 25, 2020 at 11:01 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Thu, Sep 24, 2020 at 01:38:34PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > There's a common pattern of dynamically allocating an array of char
> > > pointers and then also dynamically allocating each string in this
> > > array. Provide a helper for freeing such a string array with one call.
> >
> > For consistency I would like to provide kalloc_strarray(), but it seems a bit
> > ambiguous. So I'm fine with this going alone.
> >
> 
> But how would it even work - you can allocate strings in so many ways?

Yes, that's what I meant in the second part of the first sentence.

Something like:

static inline char **kalloc_strarray(n, gfp)
{
	return kcalloc(n, sizeof(char *), gfp);
}

looks good enough, but it's only first part of the equation.

> Also: let's not introduce functions without users.

Agree.

-- 
With Best Regards,
Andy Shevchenko


