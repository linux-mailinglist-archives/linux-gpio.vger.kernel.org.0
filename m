Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E05B2AB76A
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 12:44:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729486AbgKILoL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 06:44:11 -0500
Received: from mga02.intel.com ([134.134.136.20]:14045 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727311AbgKILoL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Nov 2020 06:44:11 -0500
IronPort-SDR: 8stfXfOM9mQzd9gNNipTLdUJr4k6RAz4Mo6geBeJx0vuxJZY9EmFQFClkYKfqkvgiDch8ws2ks
 7QPIzh0rhb1Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9799"; a="156795575"
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="156795575"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 03:44:10 -0800
IronPort-SDR: fzT3IyOS+mIOoz4XXigvqm4kWvrTsbp26MVdd0aios3mqEgRzPwfwW2BAtBrQR6bwZ4OEqgk/m
 XXjjkvqWUbpQ==
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="322414109"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 03:44:09 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1kc5bj-005AQg-0v; Mon, 09 Nov 2020 13:45:11 +0200
Date:   Mon, 9 Nov 2020 13:45:11 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Coiby Xu <coiby.xu@gmail.com>
Subject: Re: [PATCH v4 3/9] gpiolib: acpi: Take into account debounce settings
Message-ID: <20201109114511.GZ4077@smile.fi.intel.com>
References: <20201106192304.49179-1-andriy.shevchenko@linux.intel.com>
 <20201106192304.49179-4-andriy.shevchenko@linux.intel.com>
 <0756cd6c-c0a7-17e8-2e32-de3e6db6a69b@redhat.com>
 <CAHp75Vf8MkaNGmH1-FWxR66mB6pAWoV=Xw3sAi2Riw1uLe5YNA@mail.gmail.com>
 <35581c32-8022-87e6-259d-84ea6aaebbae@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35581c32-8022-87e6-259d-84ea6aaebbae@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Nov 08, 2020 at 10:31:32AM +0100, Hans de Goede wrote:
> On 11/7/20 4:26 PM, Andy Shevchenko wrote:
> > On Sat, Nov 7, 2020 at 4:49 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >> On 11/6/20 8:22 PM, Andy Shevchenko wrote:

...

> > Thank you very much for the testing! I remember that I fixed debounce
> > for BayTrail, but it seems I have yet to fix Cherry Trail pin control
> > as a prerequisite to this patch.
> > 
> > And like I said this series is definitely not for backporting.
> 
> Independent of fixing the CherryTrail pinctrl driver to support this,
> I strongly believe that -ENOTSUPP should be ignored (treated as success)
> by this patch. Remember ACPI is not only used on x86 but also on ARM
> now a days. We simply cannot guarantee that all pinctrls will support
> (let alone implement) debounce settings. E.g. I'm pretty sure that
> the pinctrl on the popular Allwinner A64 does not support debouncing
> and there are builts using a combination of uboot + EDK2 to boot!
> 
> The documentation for gpiod_set_debounce even explicitly mentioned that
> -ENOTSUPP is an error which one may expect (and thus treat specially).
> 
> The same goes for the bias stuff too.

While for debounce I absolutely agree with you I don't think it applies to
bias. ACPI table is coupled with a platform and setting bias == !PullNone
implies that bias is supported.

If we break something with this it means:
- ACPI table is broken and we need a quirk
- GPIO library is broken on architectural level and needs not to return
  ENOTSUPP for the flags configuration.

I will update this with taking debounce optional support into account.

-- 
With Best Regards,
Andy Shevchenko


