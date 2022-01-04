Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1DBB48430E
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jan 2022 15:09:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbiADOJt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jan 2022 09:09:49 -0500
Received: from mga03.intel.com ([134.134.136.65]:52208 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232748AbiADOJs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 4 Jan 2022 09:09:48 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="242185065"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; 
   d="scan'208";a="242185065"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2022 06:09:47 -0800
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; 
   d="scan'208";a="688575793"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2022 06:09:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1n4kUG-006EDv-87;
        Tue, 04 Jan 2022 16:08:28 +0200
Date:   Tue, 4 Jan 2022 16:08:28 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 1/2] gpio: tps68470: Allow building as module
Message-ID: <YdRU3DVsByJzyXmn@smile.fi.intel.com>
References: <20211225120026.95268-1-hdegoede@redhat.com>
 <CAHp75Vdz1zxE5V_ff+jSp6VUo34aRinLj-gK_HOi5-2Zgw3E8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vdz1zxE5V_ff+jSp6VUo34aRinLj-gK_HOi5-2Zgw3E8w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 25, 2021 at 04:41:58PM +0200, Andy Shevchenko wrote:
> On Sat, Dec 25, 2021 at 2:00 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >
> > The gpio-tps68470 driver binds to a tps68470-gpio platform-device which
> > itself gets instantiated by a special MFD driver from
> > drivers/platform/x86/intel/int3472/tps68470.c
> >
> > This MFD driver itself can be build as a module, so it makes no sense to
> 
> built
> 
> > force the gpio-tps68470 driver to always be builtin.
> 
> built-in
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> (see one minor comment below)

I don't see the next version, in any case it's too far from the beginning of
the v5.16 cycle and I gave my tags so Bart may (or may not :-) apply them. If
it's okay to be v5.18 material, I'll take a new version sent after v5.17-rc1.

-- 
With Best Regards,
Andy Shevchenko


