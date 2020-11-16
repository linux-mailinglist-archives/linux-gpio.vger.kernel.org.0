Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 574472B4023
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 10:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728497AbgKPJrP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 04:47:15 -0500
Received: from mga01.intel.com ([192.55.52.88]:6009 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728477AbgKPJrP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Nov 2020 04:47:15 -0500
IronPort-SDR: PxkOKpquMXX/Kb5EQNnRvNNRV0vBpCY2wJ/a0e2ymBEZ3PW28CXdMRuUFvWtrSmJ5AOMtU7xAq
 ErepZXm0omKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="188765969"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; 
   d="scan'208";a="188765969"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 01:47:12 -0800
IronPort-SDR: 3lXQPLf8YEiAvfaJTU+lt5zyMBvk1yfnTZdAozwk2o1e8UTbgC6dooE5bSySyQQfZOU881yEpN
 yA+y2V0zvl7g==
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; 
   d="scan'208";a="329632559"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 01:47:09 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1keb7K-0072J7-5N; Mon, 16 Nov 2020 11:48:10 +0200
Date:   Mon, 16 Nov 2020 11:48:10 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jamie McClymont <jamie@kwiius.com>,
        Coiby Xu <coiby.xu@gmail.com>,
        Vasile-Laurentiu Stanimir 
        <vasile-laurentiu.stanimir@windriver.com>
Subject: Re: [PATCH v7 00/18] gpiolib: acpi: pin configuration fixes
Message-ID: <20201116094810.GQ4077@smile.fi.intel.com>
References: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
 <CAHp75Vcfr-=v5Ba3VhR5NTnJM3gEYevUNJUdBnhdh4YUvTzVLA@mail.gmail.com>
 <CAHp75Vd68Kb+b4PoZ-LZcs=Bqx+t1wK7pi_5JyRLpKdr1=uMfA@mail.gmail.com>
 <CACRpkdawP_6MKx803ecQMtZ-DgnNbXKt2uu4GGHrvfK+-REudg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdawP_6MKx803ecQMtZ-DgnNbXKt2uu4GGHrvfK+-REudg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Nov 15, 2020 at 05:04:08PM +0100, Linus Walleij wrote:
> On Thu, Nov 12, 2020 at 3:16 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> 
> > Linus, Bart, it would be nice to hear from you about GPIO library
> > cleanups and in general about the series...
> 
> The series:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Can you send me a pull request for the contents of the v7 patch series
> so I can pull it in?

Sure. Will do this week (presumably today or tomorrow).

-- 
With Best Regards,
Andy Shevchenko


