Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A70118CECB
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 10:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbfHNIsz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 04:48:55 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45213 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbfHNIsz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Aug 2019 04:48:55 -0400
Received: by mail-lj1-f194.google.com with SMTP id t3so15522759ljj.12
        for <linux-gpio@vger.kernel.org>; Wed, 14 Aug 2019 01:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AaXXXJyoRix4ci7hEwut2qc9UXNgLOAwJXuK5aHAjno=;
        b=QFmd1l1ZbeAWnxu46lwnT+tGjxGDvgauGe76FXrPjgMTzAof5eg4lgP3Vx+eylh+tq
         MGldTRkYbDyDXk4rPfvSWWOk4caLcPHHLYomaksYEesHbO83AMK64X+hTW98NwDcBReh
         76aqgPbArHQesF2KyFSX6EdAmA5JxRAZ05W2b0HeUknGbH10PEEpmX3NV4ZTCgh5hU9p
         WJcacsA8ffuH4gxKQqyegZ2O3DVI42SUe3GnfMfr0KEavpNFTwHn1q1Pks6uJoL8FD90
         EFkUbMkTlTInDVoqoZozZjQfXkcbPXEgFvoJpu2YNVhMlnkzyla5BSneHw2IMiE72bvb
         4aoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AaXXXJyoRix4ci7hEwut2qc9UXNgLOAwJXuK5aHAjno=;
        b=X1ZmRJq8qOel11d605FmFCHtEQlQF2DvxFNziNIfuYN2364KU4BXpzgKRLkDNquROO
         kqoQp7rJ2xDoHIFdn78hlY/17ZPxNpir16yfbiNGM1OLsRLW/FvrCboeHga6W3HkBGXh
         CTBEoADA4ZL1BfLVbamEadqpcJ2ljVVr79oKjTdxNKmxsl+MOf6M1Wm6LYbXPAqRO0MW
         6eO+GjC3NOJ4OSHBsFqlWkzwIMRKpMEKz9qdi76KWSpq5fOIodNCLMnT2Ij7Awphj8GN
         Cj1xeWxvYtM69RH7kfywU9ZcOtUdxzTcskChTUqxUjBIXdB8B0uhe4KF1lboIekC1sMu
         N7+A==
X-Gm-Message-State: APjAAAUTp6w8IqW2JC4xyCZyWbPmrWgAboBmMeagK7OTfkAGBE763oY2
        TIWTFjHLNum4LvHUY2Z4SOclsuX09vxAlu/h4c1lsA==
X-Google-Smtp-Source: APXvYqxYtukqY2v01INeb/yow8UvGVlTOeiUie13T4PU1HPjHvFqbbFTMWwmN9WngAAJzyw4VsZgq3FLqy0pudhxhk4=
X-Received: by 2002:a2e:9f0f:: with SMTP id u15mr14760601ljk.54.1565772533555;
 Wed, 14 Aug 2019 01:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190808132543.26274-1-sr@denx.de> <CACRpkdYzg0At4qf1Nv5_+SzgqQ-iLU1ND9Svhj47=pXJf9E7Mg@mail.gmail.com>
 <CAMuHMdXP8K+yvUHrjnegnNuViG3YsCAD=PxTsDHJcTLRRjJguQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXP8K+yvUHrjnegnNuViG3YsCAD=PxTsDHJcTLRRjJguQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Aug 2019 10:48:42 +0200
Message-ID: <CACRpkdZqFGyZETZBoo6xSE9FSMpsbinLquX=4M=2FghdLMxWKw@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpiolib: Add for_each_gpio_suffix() helper
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Stefan Roese <sr@denx.de>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Pavel Machek <pavel@denx.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 12, 2019 at 1:18 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sat, Aug 10, 2019 at 10:27 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Thu, Aug 8, 2019 at 3:25 PM Stefan Roese <sr@denx.de> wrote:
> > > Add a helper macro to enable the interation over all supported GPIO
> > > suffixes (currently "gpios" & "gpio"). This will be used by the serial
> > > mctrl code to check, if a GPIO property exists before requesting it.
> > >
> > > Signed-off-by: Stefan Roese <sr@denx.de>
> > > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Cc: Pavel Machek <pavel@denx.de>
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >
> > I really like this patch, it makes things so much more readable.
>
> Do we really need to spread this *-gpio" legacy support all over the kernel?

Not really :/

Isn't it possible to use something like gpiod_count(dev, "foo") to
check for any GPIOs instead?

Yours,
Linus Walleij
