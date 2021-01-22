Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC15B300486
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 14:50:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbhAVNty (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 08:49:54 -0500
Received: from mga04.intel.com ([192.55.52.120]:58919 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726509AbhAVNty (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 Jan 2021 08:49:54 -0500
IronPort-SDR: MycZZqYlaQcwtFkD7NBaISZD87ruuiwt/u/GxghzHrcJ5z11iG3k/XiBMrtpecYa7UQ1cZEJ9F
 zv/D+c7z1ZIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="176873212"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="176873212"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 05:48:08 -0800
IronPort-SDR: IIXEb2AQHy/o/KLLuZbPpmMAnwCeV0EP9SwD6ef3DJ1x+yYkZ3GeGfl5De4/AKujJy8ZACDP5K
 vWtejTm4ZW6g==
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="427975142"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 05:48:07 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l2woI-008wDi-1e; Fri, 22 Jan 2021 15:49:10 +0200
Date:   Fri, 22 Jan 2021 15:49:10 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 3/6] lib/cmdline: Allow get_options() to take 0 to
 validate the input
Message-ID: <YArX1qdDk5DYaLck@smile.fi.intel.com>
References: <20210122123853.75162-1-andriy.shevchenko@linux.intel.com>
 <20210122123853.75162-3-andriy.shevchenko@linux.intel.com>
 <CAMuHMdVekbD0tYsQEVXc6W1OnETziVoFpU9WMgZw5C5ufc+72A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVekbD0tYsQEVXc6W1OnETziVoFpU9WMgZw5C5ufc+72A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 22, 2021 at 02:13:10PM +0100, Geert Uytterhoeven wrote:
> On Fri, Jan 22, 2021 at 1:39 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> > +       while (i < nints || validate) {
> > +               int *pint = validate ? ints : ints + i;
> 
> I think you can use NULL for validation, as per the documentation for
> get_option().

That's what takes me a long time to realize how this machinery works and no,
unfortunately we may not use NULL, we have to keep the parsed number
for the further operations.

Thanks for review!

-- 
With Best Regards,
Andy Shevchenko


