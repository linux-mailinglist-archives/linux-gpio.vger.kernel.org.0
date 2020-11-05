Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4986F2A8374
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 17:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729887AbgKEQZH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 11:25:07 -0500
Received: from mga01.intel.com ([192.55.52.88]:60487 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726729AbgKEQZH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 5 Nov 2020 11:25:07 -0500
IronPort-SDR: L1UFwJAaFMfedMteJd9o/o30Kj1HjIVdrJTPr0i5vyecM9F2n654pKH9Sei6VXhilj48gu2A++
 pxST6OldoQYQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="187320317"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="187320317"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 08:25:06 -0800
IronPort-SDR: qoPbISHkZ9K0qkytvnjEzOCchEHrf5bt86hhJ87GY+8HtZP+0waWROKt/BogcdCg7fmHnH8YpQ
 bdSkM8IOmT9w==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="539468181"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 08:25:05 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1kai5P-0046ST-B0; Thu, 05 Nov 2020 18:26:07 +0200
Date:   Thu, 5 Nov 2020 18:26:07 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 3/3] gpiolib: of: Use named item for enum gpiod_flags
 variable
Message-ID: <20201105162607.GZ4077@smile.fi.intel.com>
References: <20201022165847.56153-1-andriy.shevchenko@linux.intel.com>
 <20201022165847.56153-3-andriy.shevchenko@linux.intel.com>
 <CAMpxmJWhENX6bEWihp5hFjDnbXz5asdmEpw96_SJdx1v3+U1AA@mail.gmail.com>
 <CAHp75VdBahEEB5qnbbquPBG+iErEaupoAA-f1vTroAXoLLJFNw@mail.gmail.com>
 <CACRpkdZAFNqq-z5xBgtjdt5LXNMR32wtWjMt7yRm6azDmuMndA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZAFNqq-z5xBgtjdt5LXNMR32wtWjMt7yRm6azDmuMndA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 05, 2020 at 10:05:52AM +0100, Linus Walleij wrote:
> On Mon, Oct 26, 2020 at 3:43 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Mon, Oct 26, 2020 at 4:40 PM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> > >
> > > On Thu, Oct 22, 2020 at 6:58 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > Use named item instead of plain integer for enum gpiod_flags
> > > > to make it clear that even 0 has its own meaning.
> >
> > > This patch doesn't seem to depend on the others in this series so I
> > > applied it to my tree. Let me know if that's not the case. I'll let
> > > you take the ACPI patches.
> >
> > It's fine, thanks! I have just sent an additional message to elaborate
> > my vision, but again, the approach for this patch you chose is just
> > fine.
> 
> I might have lost track of the state of this patch set and mix it
> up conceptually with some other patch sets so bear with me if
> there are mistakes.

Consider to review / Ack [1]. I hope I addressed all / most of the comments.

> I see that Bartosz applied this one patch at least.

Yes.

[1]: https://lore.kernel.org/linux-gpio/20201102191722.81502-1-andriy.shevchenko@linux.intel.com/

-- 
With Best Regards,
Andy Shevchenko


