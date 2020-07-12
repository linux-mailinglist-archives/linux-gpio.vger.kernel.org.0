Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6800921CBAA
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2020 23:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729509AbgGLV4k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 12 Jul 2020 17:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729408AbgGLV4k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 12 Jul 2020 17:56:40 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE664C08C5DB
        for <linux-gpio@vger.kernel.org>; Sun, 12 Jul 2020 14:56:39 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id x62so8632538qtd.3
        for <linux-gpio@vger.kernel.org>; Sun, 12 Jul 2020 14:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nswgBRvMZKcgVRKdiEQljd5QY51T/DwTFJxtYTlPBBI=;
        b=RmIzk8dJJZB++ufFpJ8oL/YFget+HUp85KKTgluGj16u0b8wEO9zCz6y6v/nkl/Ph8
         jQRdJ/iS0ps5s1Vz4hKi0geFU2S0yagEri3BL/Ef5ouuOW+oEm81FR/pXK5iz88Tm0hk
         IgsP+JnYx3jxEZJMEKq88ppnCJLsjrfs0MlhnGKmmdtRVYEsO3WtT2/JngQTXKStIz+w
         mp6h+l6nsmmfxrEi1ilwrcPVogLzg1ejgbKU90UiGSzM3G5TcjpR/SEcqT7u+Wh4M5ZN
         mgYkAirb/DGzrV0XmLP55uvKBPMBf5I5iRZdkYrF4dSIuOFE2aa+aGxTf6K/Y643nKX5
         xJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nswgBRvMZKcgVRKdiEQljd5QY51T/DwTFJxtYTlPBBI=;
        b=gk1w34iceJbmIoK9lZPYvqYHUjdwbvpDMpNJMQIGvmkZp8zfBNSC+05Nx+t30JiEd5
         g1MyNCvQm/NUhOitearbW8J+NzteFL1kSsYsU5M7lL5AAUKbTkFFDKdP2zMr1sZiiyWo
         eUj8VdSwGAzNldt8P2fNm2g9QQELASAgt/vPQ2EjsY2QMn/paTEPmAIaCDL85AmaZ+yn
         qJgy5A7TmB5DYtYCBibEBedgq1rga6A8Y/Rnxa3LrE7C4uqoG7LWbWtbPMZepEG+6pL4
         TQONlfbWOEPXCtgAI/GsQIk16/7C4B2HnZj/ugxy+44z8XWQrTKGgxX2zQ378iyb+yOE
         ygsQ==
X-Gm-Message-State: AOAM530y4QO7Ar2zWnal7iJZDhBKHtwPY0nbgqHxubBmksp0BRX3PdiQ
        y+yrPwMn0bsVteseCqPGWPwQr4mHg8y/3A==
X-Google-Smtp-Source: ABdhPJzhnN6ppWDABJB9RCqhSeW/S0rntEpuCdlOpRMVK8R+I2RFgqm82UVfvlFY91SvhrQvQT1e1g==
X-Received: by 2002:ac8:c8:: with SMTP id d8mr84941138qtg.221.1594590998849;
        Sun, 12 Jul 2020 14:56:38 -0700 (PDT)
Received: from x1 ([196.52.2.99])
        by smtp.gmail.com with ESMTPSA id q189sm16663980qkd.57.2020.07.12.14.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 14:56:38 -0700 (PDT)
Date:   Sun, 12 Jul 2020 23:56:30 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: gpio-omap: handle bias flag for gpio line
Message-ID: <20200712215630.GA1298162@x1>
References: <20200625002736.GA24954@x1>
 <CACRpkdYze_6cM0R=rr7RF8h5WO4GoCcz4=K1_XLt0PJNxCYtbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYze_6cM0R=rr7RF8h5WO4GoCcz4=K1_XLt0PJNxCYtbw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 07, 2020 at 02:38:36PM +0200, Linus Walleij wrote:
> On Thu, Jun 25, 2020 at 2:27 AM Drew Fustini <drew@beagleboard.org> wrote:
> 
> > Tony and Linus -
> >
> > I'm hoping you could give me some feedback on this approach. My goal is
> > to allow a userspace library (like libgpiod) to be able to set pull-up
> > and pull-downs on the AM3358.
> 
> I'm lost on any pinctrl-single specifics, sorry... Generic questions about
> pinctrl I can maybe answer.
> 
> Yours,
> Linus Walleij

I now have a way to set bias with libgpiod on the AM3358 (BeagleBone
and PocketBeagle) with these two patches:

[PATCH] gpio: omap: handle pin config bias flags [0]
------------------------------------------------
Modify omap_gpio_set_config() to handle pin config bias flags by calling
gpiochip_generic_config().

The pin group for the gpio line must have the corresponding pinconf
properties:

PIN_CONFIG_BIAS_PULL_UP requires "pinctrl-single,bias-pullup"
PIN_CONFIG_BIAS_PULL_DOWN requires "pinctrl-single,bias-pulldown

This means the ability to set bias from userspace is controlled from
device tree. If there is concern about potiental damage caused by
userspace setting bias to an unsafe value then those pins should not
have the bias property in the dts.


[PATCH] ARM: dts: am335x-pocketbeagle: set default mux for gpio pins [1]
--------------------------------------------------------------------
These pins on the PocketBeagle P1 and P2 headers are connected to AM3358
balls with gpio lines, and these pins are not used for any other
peripherals by default.  This patch adds "pinctrl-single,bias-pullup"
and "pinctrl-single,bias-pulldown" pinconf properties for each pin per
the ball reset state in the datasheet.

Here is an example for P2.03 header pin on the PocketBeagle:

        /* P2_03 (ZCZ ball T10) gpio0_23 0x824 PIN 9 */
        P2_03_gpio: pinmux_P2_03_gpio {
                pinctrl-single,pins = <
                        AM33XX_PADCONF(AM335X_PIN_GPMC_AD9, PIN_INPUT_PULLUP, MUX_MODE7)
                >;
                pinctrl-single,bias-pullup   =   < 0x10  0x10  0x00  0x18>;
                pinctrl-single,bias-pulldown   = < 0x10  0x00  0x10  0x18>;
        };

P2.03 header pin on PocketBeagle maps to gpiochip 0 line 23. It is PIN9
which value on boot: 0x37 (input [0x20] pull-up [0x10] gpio mode [0x7])

$ cat /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pins |grep ^'pin 9' |head -1
pin 9 (PIN9) 44e10824 00000037 pinctrl-single

$ gpiomon -B pull-down 0 23
^C

Value 0x27 means it switched to pull-down [0x0] but still input [0x20]
and gpio mode [0x7]:

$ cat /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pins |grep ^'pin 9' |head -1
pin 9 (PIN9) 44e10824 00000027 pinctrl-single

Now switch it back to pull-up:

$ gpiomon -B pull-up 0 23
^C

Value 0x37 means it switched to pull-up [0x10] and is still input [0x20]
and gpio mode [0x7]:

$ cat /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pins |grep ^'pin 9' |head -1
pin 9 (PIN9) 44e10824 00000037 pinctrl-single


Question: does this seem like a reasonable solution?

Thanks,
Drew

[0] https://lore.kernel.org/linux-omap/20200712103717.1219765-1-drew@beagleboard.org/
[1] https://lore.kernel.org/linux-omap/20200709223401.780051-1-drew@beagleboard.org/
