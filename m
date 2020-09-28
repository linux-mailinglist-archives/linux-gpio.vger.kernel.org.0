Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4D7527AF79
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 15:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgI1N4v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 09:56:51 -0400
Received: from mga06.intel.com ([134.134.136.31]:24535 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726310AbgI1N4v (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 28 Sep 2020 09:56:51 -0400
IronPort-SDR: XKp1XTLvDmswJ909bckJVvzFZUdol4q4kSH2USS+vDbNDuJpgaXST6E4gejCKYNL9rQKmxpcla
 ekZI+vBJ+eQw==
X-IronPort-AV: E=McAfee;i="6000,8403,9757"; a="223590127"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; 
   d="scan'208";a="223590127"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 06:56:50 -0700
IronPort-SDR: OwHsEXA7Z+isGbAHhn3T7zOOgXqwBd6JBx6joDeq/7ffw8gRbF/ivmsnckYJgkGsZm0k5moa4U
 JoIIUV2Odm4w==
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; 
   d="scan'208";a="514265573"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 06:56:48 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kMtdz-002Zcy-BC; Mon, 28 Sep 2020 16:56:43 +0300
Date:   Mon, 28 Sep 2020 16:56:43 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/9] lib: string_helpers: provide kfree_strarray()
Message-ID: <20200928135643.GN3956970@smile.fi.intel.com>
References: <20200928104155.7385-1-brgl@bgdev.pl>
 <20200928104155.7385-2-brgl@bgdev.pl>
 <20200928125539.GI3956970@smile.fi.intel.com>
 <CAMpxmJWbws62wBcNuTeWr8xr+B0qd40kEtLTVXqxVoOzyUgp9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJWbws62wBcNuTeWr8xr+B0qd40kEtLTVXqxVoOzyUgp9w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 28, 2020 at 03:04:05PM +0200, Bartosz Golaszewski wrote:
> On Mon, Sep 28, 2020 at 2:55 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Mon, Sep 28, 2020 at 12:41:47PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > There's a common pattern of dynamically allocating an array of char
> > > pointers and then also dynamically allocating each string in this
> > > array. Provide a helper for freeing such a string array with one call.
> >
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > But see below.
> >
> > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > ---
> > >  include/linux/string_helpers.h |  2 ++
> > >  lib/string_helpers.c           | 25 +++++++++++++++++++++++++
> > >  2 files changed, 27 insertions(+)
> > >
> > > diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
> > > index 86f150c2a6b6..55b25120a1c6 100644
> > > --- a/include/linux/string_helpers.h
> > > +++ b/include/linux/string_helpers.h
> > > @@ -94,4 +94,6 @@ char *kstrdup_quotable(const char *src, gfp_t gfp);
> > >  char *kstrdup_quotable_cmdline(struct task_struct *task, gfp_t gfp);
> > >  char *kstrdup_quotable_file(struct file *file, gfp_t gfp);
> > >
> > > +void kfree_strarray(char **str_array, size_t num_str);
> > > +
> > >  #endif
> > > diff --git a/lib/string_helpers.c b/lib/string_helpers.c
> > > index 963050c0283e..bfa4c9f3ca0a 100644
> > > --- a/lib/string_helpers.c
> > > +++ b/lib/string_helpers.c
> > > @@ -649,3 +649,28 @@ char *kstrdup_quotable_file(struct file *file, gfp_t gfp)
> > >       return pathname;
> > >  }
> > >  EXPORT_SYMBOL_GPL(kstrdup_quotable_file);
> > > +
> > > +/**
> > > + * kfree_strarray - free a number of dynamically allocated strings contained
> > > + *                  in an array and the array itself
> > > + *
> > > + * @str_array: Dynamically allocated array of strings to free. If NULL - the
> > > + *             function does nothing.
> > > + * @num_str: Number of strings (starting from the beginning of the array) to
> > > + *           free.
> > > + *
> > > + * Passing a non-null str_array and num_str == 0 as well as NULL str_array
> > > + * are valid use-cases.
> > > + */
> > > +void kfree_strarray(char **str_array, size_t num_str)
> >
> > Hmm... I have missed your answer to
> >  str_array -> array
> >  num_str -> n
> >
> > The rationale behind dropping str is to avoid duplicates in the name of the
> > function and its parameters. 'array' is harder to avoid, but also possible,
> > though I leave it to you.
> >
> 
> Are you fine with me fixing this when applying the patches?

Sure!

-- 
With Best Regards,
Andy Shevchenko


