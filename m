Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA7492B7F3E
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 15:18:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgKRORQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Nov 2020 09:17:16 -0500
Received: from mga14.intel.com ([192.55.52.115]:41765 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbgKRORQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Nov 2020 09:17:16 -0500
IronPort-SDR: zkHF3PZKLbyl2tP8aqyg0l5FFnqSBGNkq33y0VcIJjH/7MX9bL7ATAWkahp4xP6LSIszaquqD9
 9jOMCEMuvWNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="170339469"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="170339469"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 06:17:11 -0800
IronPort-SDR: we8zB+YPeNCFu4ylTwOP7Keop1xQyhMwRXtEycqHv//YXuFeF5/EKPbX29dzEw/5tlq8mfD/YO
 zG3ZZyLlMq+w==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="534308315"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 06:17:09 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kfOHj-007e9c-9J; Wed, 18 Nov 2020 16:18:11 +0200
Date:   Wed, 18 Nov 2020 16:18:11 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [GIT PULL] intel-gpio for 5.11-1
Message-ID: <20201118141811.GV4077@smile.fi.intel.com>
References: <20201116152625.GA20187@black.fi.intel.com>
 <CACRpkdbgO++4scNqX=3D0XKSyUhah67UvMjHDbaT4SyX0ESF-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbgO++4scNqX=3D0XKSyUhah67UvMjHDbaT4SyX0ESF-A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 17, 2020 at 10:24:37PM +0100, Linus Walleij wrote:
> On Mon, Nov 16, 2020 at 4:26 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > The following changes since commit b72de3ff19fdc4bbe4d4bb3f4483c7e46e00bac3:
> >
> >   gpio: sifive: Fix SiFive gpio probe (2020-11-11 09:53:09 +0100)
> >
> > are available in the Git repository at:
> >
> >   git@gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.11-1
> >
> > for you to fetch changes up to e709a7b5a066362b697d65dda90edc71f913df70:
> >
> >   gpiolib: acpi: Make Intel GPIO tree official for GPIO ACPI work (2020-11-16 14:14:35 +0200)
> 
> Thanks! I merged in v5.10-rc4 to the GPIO devel branch and
> pulled in this on top, works like a charm!

I'm not sure I understood why you merged v5.10-rc4, but in any case thanks,
result is great!

-- 
With Best Regards,
Andy Shevchenko


