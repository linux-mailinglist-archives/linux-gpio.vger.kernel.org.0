Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7672278FF
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 08:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbgGUGtY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 02:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbgGUGtY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 02:49:24 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D631FC061794;
        Mon, 20 Jul 2020 23:49:23 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id t11so10254091pfq.11;
        Mon, 20 Jul 2020 23:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ejqBHtg283SBgNkVrzPkBd/pxK3TJnovPA7dWwKKA/w=;
        b=R6h+yfGpm7mi98g869/dIddeP9Oki0hk5N4DKxjca0FQSCtVPgOu8sYv36ETHJsbPq
         czkIpBsaS5V0+eCZm//w7k96b9HbOMKNqZSba9Ret24RJgZV6C4/+ViwttqNI15BKTW4
         uy/5GuKTVD3Q6CQS8j/xJBHy3/i8/QX5czIX2FsAqDXdNzOL+BSj2fc1UHkrVyMwged4
         NawSqOz6kKdAfxjSy0U5tU1Qh8qJ0vo2smGXZ8zojrjSRJi55rO0Cs2B2lSJTK4jhPO6
         7m/ywnVXxQA8pLA/20vDJGAdUf13TcRyYV+ItMIeXdXR9C+umKR5Edi88Yn1PkTbnpJ5
         PLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ejqBHtg283SBgNkVrzPkBd/pxK3TJnovPA7dWwKKA/w=;
        b=eWBdg9WcS0aAA1T0jvyZsY67OM5E9eD+HEDtUz3c0CaUbDfHcAeg136oYZbfbkh6aR
         80BtyjHGv0oQ9eZl/kjiJoIGoktmQykmHnTJiJhWK2dkgX/wvWV22gq2tpPj6xAF67jH
         Ed/JDb3Cz03wCGWKMaHHDryOqgYsntn61e4cChvINITutIuuHTJhcsMte/17myNpH3Gj
         nyuFd3Zp05EGdCJNuwLONRsI9h9YPtzSdkke5kjsC4Ch3sG8GTWeHYjU4T6e/RA3QFrF
         E+MCDs5FfvKHmHGAoiDwzIC1emo7W3BLxyE38MQyFPl1W0uXGFWpXGDa2Skp5xUgSvMv
         mVDg==
X-Gm-Message-State: AOAM531mMlNH382ewNVk3rIH9/9qYBgelrJkkMIVw5euae70WO+K6L7b
        D1eBQOz0Ik24okOBU+dNzVVn9BzVo0sUPXPy4TEewrty
X-Google-Smtp-Source: ABdhPJxLldfRRc8hAxAiVLEmEgeVstSOXS/bAmu56S71bU3biPhc9gdo6NuUU4ODEXg8x/ej7Oj0sBVx8AbN5PFbUzY=
X-Received: by 2002:a62:7657:: with SMTP id r84mr22157295pfc.130.1595314163324;
 Mon, 20 Jul 2020 23:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200720191740.1974132-1-drew@beagleboard.org>
In-Reply-To: <20200720191740.1974132-1-drew@beagleboard.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 21 Jul 2020 09:49:07 +0300
Message-ID: <CAHp75Vec23BDJt3woKL+SiY0dxPLFADdGaf=RbDuOWCHwtj_iA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: core: print gpio in pins debugfs file
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 20, 2020 at 10:18 PM Drew Fustini <drew@beagleboard.org> wrote:
>
> If there is a gpio range mapping for the pin, then print out the gpio
> number for the pin in the debugfs 'pins' file.
>
> Here is an example output on the BeagleBone Black from:
> /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pins
>
> pin 100 (PIN100) gpiochip:gpio-96-127 line-name:P1.36 [PWM0A] 44e10990 00000001 pinctrl-single
> pin 101 (PIN101) gpiochip:gpio-96-127 line-name:P1.33 [PRU0.1] 44e10994 00000027 pinctrl-single
> pin 102 (PIN102) gpiochip:gpio-96-127 line-name:P2.32 [PRU0.2] 44e10998 00000027 pinctrl-single

It becomes unnecessarily long. I would drop these 'gpiochip:' and
'line-name:' prefixes and NA case you rather should have the same
amount of arguments, so here would be something like NA NA or alike.



-- 
With Best Regards,
Andy Shevchenko
