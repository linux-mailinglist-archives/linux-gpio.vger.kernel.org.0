Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECDDD150867
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2020 15:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727681AbgBCObI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Feb 2020 09:31:08 -0500
Received: from mga05.intel.com ([192.55.52.43]:18443 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727649AbgBCObI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 3 Feb 2020 09:31:08 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Feb 2020 06:31:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; 
   d="scan'208";a="278756061"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Feb 2020 06:31:05 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iyckk-0007qI-No; Mon, 03 Feb 2020 16:31:06 +0200
Date:   Mon, 3 Feb 2020 16:31:06 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 0/3] gpiolib: fix a regression introduced by
 gpio_do_set_config()
Message-ID: <20200203143106.GF32742@smile.fi.intel.com>
References: <20200203133026.22930-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200203133026.22930-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 03, 2020 at 02:30:23PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> These three patches fix a regression introduced by commit d90f36851d65
> ("gpiolib: have a single place of calling set_config()"). We first need
> to revert patches that came on top of it, then apply the actual fix.

Thank you for addressing this!

It might be good to add Fixes / Depends-on to the first two, but I didn't look
if they are in any of v5.5 or older release.

> Bartosz Golaszewski (3):
>   Revert "gpiolib: Remove duplicated function gpio_do_set_config()"
>   Revert "gpiolib: remove set but not used variable 'config'"
>   gpiolib: fix gpio_do_set_config()
> 
>  drivers/gpio/gpiolib.c | 31 ++++++++++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 5 deletions(-)
> 
> -- 
> 2.23.0
> 

-- 
With Best Regards,
Andy Shevchenko


