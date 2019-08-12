Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5054189C7B
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 13:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbfHLLSi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 07:18:38 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41407 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727936AbfHLLSi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Aug 2019 07:18:38 -0400
Received: by mail-ot1-f65.google.com with SMTP id o101so4369734ota.8;
        Mon, 12 Aug 2019 04:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qy4pjH0HF5Jw/fK3kw8pQHHijM5PTE57kQ2fl43ZBFI=;
        b=fPz/hu+pt4RGL8GJaE6SKD2KNAHgn30H5Q2QUC1qnXTil1lmdShnxXI0VVyoZNKGOY
         D3nY89oCkudTauRzIT2vW85dt5jH2UlZFmfgDJ3wKi59jOUMqT2s7QkwncIgLIIv99Tp
         gsW8G4ztuS96ion1rNhdY+KmyTaAL5sxDKuFVAPq2vUn97GBrQ767udnf23DDeNtxj09
         7oDr+SCE/0ZJScaWjuzE4fMeG7v5PDbKeVCoZHOCv61nyJLYJt07ip5PTL1GLIyyYjYE
         hOoxe+F5yQzi8GUFmwdjFcdOFUMJo1VIkPc1kLh1a7e68KHe57Qkwg1ua0avK2IKtFYY
         OBKQ==
X-Gm-Message-State: APjAAAWmWhwuffrVEGjngz+kWh5aBmFqY9mqtiOzU83hNYWdpYSZ4vP5
        IOzyPmFVu0HrkF7AlwCR4p6vpzVRmiKnUvVjZJg=
X-Google-Smtp-Source: APXvYqyB+wAz0wdsRQhPMr9u3bj6K5knz/OIceaUIfgVi2u58h5iVQkNvR1Cb2iHtIuYJQskwFEjnYysiD1XNLLCzWw=
X-Received: by 2002:aca:f4ca:: with SMTP id s193mr5041843oih.131.1565608717208;
 Mon, 12 Aug 2019 04:18:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190808132543.26274-1-sr@denx.de> <CACRpkdYzg0At4qf1Nv5_+SzgqQ-iLU1ND9Svhj47=pXJf9E7Mg@mail.gmail.com>
In-Reply-To: <CACRpkdYzg0At4qf1Nv5_+SzgqQ-iLU1ND9Svhj47=pXJf9E7Mg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Aug 2019 13:18:26 +0200
Message-ID: <CAMuHMdXP8K+yvUHrjnegnNuViG3YsCAD=PxTsDHJcTLRRjJguQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpiolib: Add for_each_gpio_suffix() helper
To:     Linus Walleij <linus.walleij@linaro.org>
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

Hi Linus,

On Sat, Aug 10, 2019 at 10:27 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Aug 8, 2019 at 3:25 PM Stefan Roese <sr@denx.de> wrote:
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

Do we really need to spread this *-gpio" legacy support all over the kernel?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
