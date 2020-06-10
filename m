Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84E7E1F560B
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 15:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbgFJNnr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 09:43:47 -0400
Received: from mga11.intel.com ([192.55.52.93]:1502 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726157AbgFJNnr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Jun 2020 09:43:47 -0400
IronPort-SDR: kGNWvz6WhEXNXLikp80oL1mo/xbbgaxAmy6895MfMvkyygQUkB0GQBdeeVnbDft5oLGaUm7zdl
 kHDYcfHu10bw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2020 06:43:47 -0700
IronPort-SDR: GQYil1KoZD0hDsNL8ZlqWLhGiuzvHhF+Ek/QIPGYjG9ARxecfh6EX7RhubfUMbnzPiuesWH/3F
 Mmms5Z9mBX4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,496,1583222400"; 
   d="scan'208";a="349850031"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001.jf.intel.com with ESMTP; 10 Jun 2020 06:43:44 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jj119-00C9Pp-Cv; Wed, 10 Jun 2020 16:43:47 +0300
Date:   Wed, 10 Jun 2020 16:43:47 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v1 4/6] mfd: intel_quark_i2c_gpio: Convert to use
 software nodes
Message-ID: <20200610134347.GH2428291@smile.fi.intel.com>
References: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
 <20200608134300.76091-5-andriy.shevchenko@linux.intel.com>
 <CACRpkdZer1bUSXoK4wZpQu60mA5pEST8FEFuTrvvoaZ2+1S=hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZer1bUSXoK4wZpQu60mA5pEST8FEFuTrvvoaZ2+1S=hw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 10, 2020 at 01:38:54PM +0200, Linus Walleij wrote:
> On Mon, Jun 8, 2020 at 3:43 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > -/* The base GPIO number under GPIOLIB framework */
> > -#define INTEL_QUARK_MFD_GPIO_BASE      8
> 
> OK I see this was around before, sigh.
> So it's not your fault. It was introduced in commit
> 60ae5b9f5cdd8 which I was not involved in reviewing,
> for the record I would have said "no".
> 
> It is exploiting commit 3d2613c4289ff where I allowed
> pdata to set the base so it is anyway my fault for not
> noticing :(
> 
> But me complaining about this doesn't make things better.
> 
> Can we simply DELETE this assignment and just set base to
> -1 in a separate patch before this patch and see what happens? It's
> really unsafe to hardcode base like this.

I don't see easy way to do so, because as I explained in previous mail it will
affect relation (from firmware) to the fact that the numbering of this
controller is static for that platform.

> +       PROPERTY_ENTRY_U32("snps,nr-gpios", 8),
> 
> This is however fine in principle but just use the existing generic
> property "ngpios" and save this custom property.

This is established (not by ACPI!) property. Completely not my fault :-)

-- 
With Best Regards,
Andy Shevchenko


