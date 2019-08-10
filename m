Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A64D88A22
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Aug 2019 10:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbfHJIsK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Aug 2019 04:48:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:37422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725497AbfHJIsK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 10 Aug 2019 04:48:10 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E5E2A208C4;
        Sat, 10 Aug 2019 08:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565426889;
        bh=pnfaOMCA1rkUd9Nt7AktzZyhGAumgm3OwY7WEXfVsX4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mkdM6FL/hsDUTUUSWSvlnZ3OWjd1Y4v5iaa1xHyCIG96BSdXpVG2t3NE/xFfCl8KB
         hPHzMqCftmrqg9Z/3t9znpxEoo1yvf0p6CUF7bli6+7caVcH8Ptv1DVQxMcBbFAAY6
         746bOCEbEa1YbtKhL3PMrRTd9BEjWv5vl6vNTr78=
Date:   Sat, 10 Aug 2019 10:48:06 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Stefan Roese <sr@denx.de>, linux-serial@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH 1/2] gpiolib: Add for_each_gpio_suffix() helper
Message-ID: <20190810084806.GA15178@kroah.com>
References: <20190808132543.26274-1-sr@denx.de>
 <CACRpkdYzg0At4qf1Nv5_+SzgqQ-iLU1ND9Svhj47=pXJf9E7Mg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYzg0At4qf1Nv5_+SzgqQ-iLU1ND9Svhj47=pXJf9E7Mg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Aug 10, 2019 at 10:27:27AM +0200, Linus Walleij wrote:
> On Thu, Aug 8, 2019 at 3:25 PM Stefan Roese <sr@denx.de> wrote:
> 
> > Add a helper macro to enable the interation over all supported GPIO
> > suffixes (currently "gpios" & "gpio"). This will be used by the serial
> > mctrl code to check, if a GPIO property exists before requesting it.
> >
> > Signed-off-by: Stefan Roese <sr@denx.de>
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: Pavel Machek <pavel@denx.de>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> I really like this patch, it makes things so much more readable.
> 
> Do you want me to apply both patches to the GPIO tree when
> we agreed on the final version? I need some ACK from some
> serial maintainer.

When you all can agree on the final version, I'll be glad to give my ack
for you to take these :)

thanks,

greg k-h
