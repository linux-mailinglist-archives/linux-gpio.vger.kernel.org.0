Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E8611E0E02
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 14:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390312AbgEYMBM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 08:01:12 -0400
Received: from mga01.intel.com ([192.55.52.88]:23928 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390299AbgEYMBM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 May 2020 08:01:12 -0400
IronPort-SDR: l3VAbRYm1OE6EofGXVXNWceZtlE76ovRMaCi33giAhsfrNBb8c36hArAe/CTJZBuWcKST2JYcV
 aw4isDZG07Kg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2020 05:01:12 -0700
IronPort-SDR: nQwnq3Y/NM045CWwUEFauUJBiYdrhecUTI0GSZIADEAFMUqm/CyD/zWqIBNc39JyVEdeEWrFjP
 iWQzSBQfOghg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,433,1583222400"; 
   d="scan'208";a="441708809"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005.jf.intel.com with ESMTP; 25 May 2020 05:01:09 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jdBn6-008mUt-U4; Mon, 25 May 2020 15:01:12 +0300
Date:   Mon, 25 May 2020 15:01:12 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v1 5/5] gpio: pca953x: Override GpioInt() pin for Intel
 Galileo Gen 2
Message-ID: <20200525120112.GT1634618@smile.fi.intel.com>
References: <20200520211916.25727-1-andriy.shevchenko@linux.intel.com>
 <20200520211916.25727-5-andriy.shevchenko@linux.intel.com>
 <20200525092028.GQ247495@lahna.fi.intel.com>
 <20200525093150.GL1634618@smile.fi.intel.com>
 <20200525094553.GR247495@lahna.fi.intel.com>
 <20200525101335.GN1634618@smile.fi.intel.com>
 <20200525110556.GT247495@lahna.fi.intel.com>
 <20200525113551.GR1634618@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200525113551.GR1634618@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 25, 2020 at 02:35:51PM +0300, Andy Shevchenko wrote:
> On Mon, May 25, 2020 at 02:05:56PM +0300, Mika Westerberg wrote:
> > On Mon, May 25, 2020 at 01:13:35PM +0300, Andy Shevchenko wrote:
> > > Due to parsing of ACPI tables. I don't want to copy'n'paste 25% of
> > > gpiolib-acpi.c in here. I think provided solution is cleaner and (more)
> > > flexible in terms of maintenance.
> > 
> > Hmm, you seem to pass a hard-coded pin number (1) to the core that then
> > passes it back to the driver. Why you can't simple use that number here
> > directly? You don't need to parse anything. What I'm missing? :-)
> 
> Okay, so, AFAIU you are proposing something like this:
> 
> 1) find a GPIO controller by the ACPI path (somehow, I guess by finding a
>    handle followed by physical device behind it); 2) somehow to request a
>    pin from that device by number;
> 3) convert to IRQ and use.
> 
> Is it correct?

Ah, and before all these, to detect properly the IO expander that actually has
that resource in the table (something like gpiod_count() or do we have better
approach to answer the question "does this device has a GpioInt() resource?").

-- 
With Best Regards,
Andy Shevchenko


