Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 794321B26D1
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2020 14:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728391AbgDUMz6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Apr 2020 08:55:58 -0400
Received: from mga03.intel.com ([134.134.136.65]:58740 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728285AbgDUMz6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Apr 2020 08:55:58 -0400
IronPort-SDR: fP+6Y+m59y6FNACvsnkJQWkMerlWV4XHiPs86fmcwx60yK2MQ8zXN99CDGBl1U6QWysi5QVRJZ
 DRHTi6TR2CXw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2020 05:55:51 -0700
IronPort-SDR: P2o4faW2NXJbfMaz2vsF5QC+rEaQzmdO3CnPX6QdrL1nleg9wa7Uqjf80EpDQCkUqIb1yp3QR2
 wKbj6wX+Xqsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,410,1580803200"; 
   d="scan'208";a="456748947"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 21 Apr 2020 05:55:50 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jQsRN-002F1q-10; Tue, 21 Apr 2020 15:55:53 +0300
Date:   Tue, 21 Apr 2020 15:55:53 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Paul Thomas <pthomas8589@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3 1/3] gpio: pca953x: Rewrite ->get_multiple() function
Message-ID: <20200421125553.GJ185537@smile.fi.intel.com>
References: <20200420172752.33588-1-andriy.shevchenko@linux.intel.com>
 <CAD56B7da+DDxpMvvntmq_nQaZ8aiJ+up4CY5QQ6t2hz_C8LhjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD56B7da+DDxpMvvntmq_nQaZ8aiJ+up4CY5QQ6t2hz_C8LhjQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 20, 2020 at 11:23:57PM -0400, Paul Thomas wrote:
> On Mon, Apr 20, 2020 at 1:27 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > The commit 96d7c7b3e654 ("gpio: gpio-pca953x, Add get_multiple function")
> > basically did everything wrong from style and code reuse perspective, i.e.
> Hi Andy,
> 
> Well your version is certainly elegant and simple, and does better
> with code reuse. However there are a couple of other goals I had in
> mind.
> First, the "lazy" approach of 96d7c7b3e654 is actually faster when
> user space sets up a 8-bit linehandle[1]146us (single regmap_read())
> vs 172us (pca953x_read_regs()) which incidentally is what we do in our
> application. In lazily reading 1 byte at a time it is the fastest
> access for that, if user space is always setting up the linehandle for
> the whole chip pca953x_read_regs() would be faster. Seeing as
> get_multiple has been unimplemented for this chip until now perhaps
> our use case deserves some consideration?

I understand completely your goal, but
- for I²C expanders timings is the last thing to look for (they are quite slow
  by nature), so, I really don't care about 16% speed up for one call; don't
  forget that we are in multi-task OS, where this can be easily interrupted and
  user will see the result quite after expected quick result
- the code maintenance has a priority over micro-optimization (this driver
  suffered many times of breakages because of some optimizations done)
- it breaks Uwe's approach to fix AI chips, after my patch Uwe's ones are
  applied cleanly

>That being said, the
> pca953x_read_regs() is still far better than calling regmap_read() 8
> times.

Yes, it's a best compromise I can come with.

> Second, your version does not work with a 5.2 kernel, bitmap_replace
> is not there yet and pca953x_read_regs() signature is different. So
> perhaps we'll all move on and no one will care about 5.2, but as
> that's what we are using that was the basis for the patch.

That's not an argument at all. This is feature request, not the fix.
Uwe's ones, though, are fixes, and thus much more important.

> Have you
> tested this with actual hardware?

Do you see any issues with it?

For the record, yes, on Intel Edison/Arduino where 4 PCA9555 are present.

% gpiodetect
gpiochip0 [0000:00:0c.0] (192 lines)
gpiochip1 [i2c-INT3491:00] (16 lines)
gpiochip2 [spi-PRP0001:00] (4 lines)
gpiochip3 [i2c-INT3491:01] (16 lines)
gpiochip4 [i2c-INT3491:02] (16 lines)
gpiochip5 [i2c-INT3491:03] (16 lines)

### Consider gpiochip1: 8 and 10 are PUed

% gpioget gpiochip1 0 1 2 3 6 7 8 9 10 11 14 15
[  201.416858] pca953x i2c-INT3491:00: pca953x_gpio_get_multiple <<< 00,0000b58f
1 1 1 1 0 1 1 0 1 0 0 1

### only 8

% gpioget gpiochip1 0 1 2 3 6 7 8 9 10 11 14 15
[  354.153921] pca953x i2c-INT3491:00: pca953x_gpio_get_multiple <<< 00,0000b18f
1 1 1 1 0 1 1 0 0 0 0 1

### only 10

% gpioget gpiochip1 0 1 2 3 6 7 8 9 10 11 14 15
[  362.723867] pca953x i2c-INT3491:00: pca953x_gpio_get_multiple <<< 00,0000b48f
1 1 1 1 0 1 0 0 1 0 0 1

### None of them

% gpioget gpiochip1 0 1 2 3 6 7 8 9 10 11 14 15
[  371.294910] pca953x i2c-INT3491:00: pca953x_gpio_get_multiple <<< 00,0000b08f
1 1 1 1 0 1 0 0 0 0 0 1

Yes, I specifically added a debug print since GPIO trace does not distinguish
between plain get and complex one.

  dev_info(&chip->client->dev, "%s <<< %*pb\n", __func__, MAX_LINE, reg_val);

> I actually didn't do a proper test
> just the timing of the pca953x_read_regs().
> 
> > - it didn't utilize existing PCA953x internal helpers
> > - it didn't utilize bitmap API
> > - it misses the point that ilog2(), besides that BANK_SFT is useless,
> >   can be used in macros
> Yes, I know ilog2() can be used in macros, I didn't think it was worth
> including the .h file just to calculate 3. Putting the ilog2(x) in the
> comments seemed to be common in other kernel sections, but maybe that
> was historic before the macro version? Either way is fine. The shift
> is not useless, without that you would go into the if statement for
> every bit, but you only want to do a regmap_read() for every byte.
> 
> > - it has indentation issues.
> It passed checkpatch.pl, and any indentation fixes are fine with me.

> [1] Tested using 16-bit max7312

-- 
With Best Regards,
Andy Shevchenko


