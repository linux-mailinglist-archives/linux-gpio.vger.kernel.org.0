Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92F8ADC0B4
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2019 11:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405848AbfJRJSq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Oct 2019 05:18:46 -0400
Received: from mga07.intel.com ([134.134.136.100]:36152 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394765AbfJRJSq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 18 Oct 2019 05:18:46 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Oct 2019 02:18:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,311,1566889200"; 
   d="scan'208";a="226476707"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002.fm.intel.com with ESMTP; 18 Oct 2019 02:18:43 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iLOPC-0000Pc-Ls; Fri, 18 Oct 2019 12:18:42 +0300
Date:   Fri, 18 Oct 2019 12:18:42 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Tomasz Kazimierz Motyl <tomasz.motyl666@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        butterfly_tm666@yahoo.com,
        Tomasz Kazimierz Motyl <tomasz.motyl@se.com>
Subject: Re: [PATCH] Record interrupt status when an IRQ is masked
Message-ID: <20191018091842.GT32742@smile.fi.intel.com>
References: <20190720113155.12276-1-tomasz.motyl@se.com>
 <CACRpkdaUpfnWkqK4jCrV3SCPtZk07Q=FydhvM2COye7QRCvEZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaUpfnWkqK4jCrV3SCPtZk07Q=FydhvM2COye7QRCvEZA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 20, 2019 at 09:42:35PM +0200, Linus Walleij wrote:
> Looping in some experts on PCA953xx by top posting, sorry.

NP.

I would like to have my conversion patch be applied first. It will improve
reading of this change I suppose.

P.S. My patch still needs a bit of work, so, I'll send new version.

-- 
With Best Regards,
Andy Shevchenko


