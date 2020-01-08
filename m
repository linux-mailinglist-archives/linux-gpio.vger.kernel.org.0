Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B45B13421C
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2020 13:46:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbgAHMqw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jan 2020 07:46:52 -0500
Received: from mga09.intel.com ([134.134.136.24]:4433 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727263AbgAHMqw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 8 Jan 2020 07:46:52 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Jan 2020 04:46:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,410,1571727600"; 
   d="scan'208";a="271818434"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Jan 2020 04:46:49 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ipAja-0002wz-FT; Wed, 08 Jan 2020 14:46:50 +0200
Date:   Wed, 8 Jan 2020 14:46:50 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 12/13] gpiolib: add new ioctl() for monitoring changes
 in line info
Message-ID: <20200108124650.GR32742@smile.fi.intel.com>
References: <20191224120709.18247-1-brgl@bgdev.pl>
 <20191224120709.18247-13-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191224120709.18247-13-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 24, 2019 at 01:07:08PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Currently there is no way for user-space to be informed about changes
> in status of GPIO lines e.g. when someone else requests the line or its
> config changes. We can only periodically re-read the line-info. This
> is fine for simple one-off user-space tools, but any daemon that provides
> a centralized access to GPIO chips would benefit hugely from an event
> driven line info synchronization.
> 
> This patch adds a new ioctl() that allows user-space processes to reuse
> the file descriptor associated with the character device for watching
> any changes in line properties. Every such event contains the updated
> line information.
> 
> Currently the events are generated on three types of status changes: when
> a line is requested, when it's released and when its config is changed.
> The first two are self-explanatory. For the third one: this will only
> happen when another user-space process calls the new SET_CONFIG ioctl()
> as any changes that can happen from within the kernel (i.e.
> set_transitory() or set_debounce()) are of no interest to user-space.

...

> -	} else if (cmd == GPIO_GET_LINEINFO_IOCTL) {
> +	} else if (cmd == GPIO_GET_LINEINFO_IOCTL ||
> +		   cmd == GPIO_GET_LINEINFO_WATCH_IOCTL) {

What about to split the functionality to something like lineinfo_get() and...

>  		struct gpioline_info lineinfo;

> -		struct gpio_desc *desc;

Hmm... Is it correct patch for this change?

>  
>  		if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
>  			return -EFAULT;
> @@ -1246,11 +1260,25 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  
>  		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
>  			return -EFAULT;
> +
> +		if (cmd == GPIO_GET_LINEINFO_WATCH_IOCTL)
> +			set_bit(desc_to_gpio(desc), priv->watched_lines);
> +

...simple use

	} else if (cmd == GPIO_GET_LINEINFO_IOCTL) {
		return lineinfo_get();
	} else if {cmd == GPIO_GET_LINEINFO_WATCH_IOCTL) {
		ret = lineinfo_get()
		set_bit();
		return ret;
	}

?

>  		return 0;

-- 
With Best Regards,
Andy Shevchenko


