Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD7831ABFD8
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 13:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505944AbgDPLlz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 07:41:55 -0400
Received: from mga01.intel.com ([192.55.52.88]:47743 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2505821AbgDPK6T (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 06:58:19 -0400
IronPort-SDR: UUeMEtLSTwLIubEx52H3kw/x2O/6mPQxfbuB7DrKTOnnHOBUwxO0d5Y45mugdOznJmrxfPJiGV
 Ru1K2qPOQgHw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 03:52:59 -0700
IronPort-SDR: bdDRaBiPIHAtcc2Tuy915ksm04Q3IXownOC0a3PcucytcTpMLLcBat9u3OknaSR+6VE8kRul4P
 08CHEmN2vW4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; 
   d="scan'208";a="276611758"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 16 Apr 2020 03:52:58 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jP28j-0010fP-Mq; Thu, 16 Apr 2020 13:53:01 +0300
Date:   Thu, 16 Apr 2020 13:53:01 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] gpio: pch: Use BIT() and GENMASK() where it's
 appropriate
Message-ID: <20200416105301.GY185537@smile.fi.intel.com>
References: <20200414174900.5099-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdYu3uahs--iOKXwrowiwh4ch-evGZN91N9u9q_rrLFV9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYu3uahs--iOKXwrowiwh4ch-evGZN91N9u9q_rrLFV9w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 16, 2020 at 10:27:40AM +0200, Linus Walleij wrote:
> On Tue, Apr 14, 2020 at 7:49 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Use BIT() and GENMASK() where it's appropriate.
> > At the same time drop it where it's not appropriate.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> > v2: update one more macro (all IRQ settings are plain numbers, not bits)
> 
> I managed to extract this v2 series with b4 and applied it.
> 
> I don't know if you planned to send a pull request for the PCH
> changes, it was so simple to just use b4 that I tested it on this
> patch series and it just worked.

Thanks!

I would like to have rather Ack and send a PR, since there are more Intel GPIO
patches in a bunch.

-- 
With Best Regards,
Andy Shevchenko


