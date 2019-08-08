Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94B7D86420
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2019 16:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733223AbfHHONc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Aug 2019 10:13:32 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:39608 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726156AbfHHONb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Aug 2019 10:13:31 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id 7146EA0033;
        Thu,  8 Aug 2019 16:13:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172]) (amavisd-new, port 10030)
        with ESMTP id sNIM0SeMXBxf; Thu,  8 Aug 2019 16:13:27 +0200 (CEST)
Subject: Re: [PATCH 1/2] gpiolib: Add for_each_gpio_suffix() helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-serial@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pavel Machek <pavel@denx.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20190808132543.26274-1-sr@denx.de>
 <20190808134402.GX30120@smile.fi.intel.com>
From:   Stefan Roese <sr@denx.de>
Message-ID: <f53394d5-9a95-0c6f-cd69-0af5015c5b11@denx.de>
Date:   Thu, 8 Aug 2019 16:13:25 +0200
MIME-Version: 1.0
In-Reply-To: <20190808134402.GX30120@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On 08.08.19 15:44, Andy Shevchenko wrote:
> On Thu, Aug 08, 2019 at 03:25:42PM +0200, Stefan Roese wrote:
>> Add a helper macro to enable the interation over all supported GPIO
>> suffixes (currently "gpios" & "gpio"). This will be used by the serial
>> mctrl code to check, if a GPIO property exists before requesting it.
> 
> Thanks! My comments below.
> 
>> +#define for_each_gpio_suffix(idx, suffix)				\
>> +	for (idx = 0;							\
>> +	     idx < ARRAY_SIZE(gpio_suffixes) &&				\
>> +		     (suffix = gpio_suffixes[idx]) != NULL;		\
>> +	     idx++)
> 
> I think we can use comma here, like
> 
> 	for (idx = 0; idx < ARRAY_SIZE(...), suffix = ...; idx++;)
> 
> however, this needs to be checked, b/c I think the last operation makes a
> return code, and probably we have to assign suffix first.

Yes, this seems to be the case (assign suffix first). But in this
case, the assignment is done *before* checking if the index is still
valid (in the array). In this case "suffix = gpio_suffices[2]". Or am
I missing something?
  
> (and perhaps switch to one letter for idx makes it fit one line)

Yes.

Thanks,
Stefan
