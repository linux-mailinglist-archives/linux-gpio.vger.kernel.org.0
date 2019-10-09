Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB0ED119F
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 16:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731168AbfJIOoA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 10:44:00 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36865 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730674AbfJIOoA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Oct 2019 10:44:00 -0400
Received: by mail-pf1-f196.google.com with SMTP id y5so1777516pfo.4;
        Wed, 09 Oct 2019 07:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5YbWDw47LTxNvAXa6P3YF+8i9W9XzDhfs6M2pfOAkWM=;
        b=tc5pMKydksADIu91GZWjqX0VBdX+cVF3z8Wk9Bf8jkurEKTLGfm1mls3znGBRP8pbz
         rVEe5EX7ifEShdSInnvqVcqB2PW4FCHmOlQVOkX07J2v9Mil61FvBSJWUwGQwTUkEWpd
         mv9CNcw686/dbdUsu0OGGkSYt3km/+9UCvdXlO6X87kTE/Wn7fwHqJCn0NniScNwheCF
         IPxAfrE9DYW+NTisrJJwyqZKTJT70P6+5tXn4evnUYy4D3oksXKKAe0hPstSQYBK4iNw
         a5K/Ug25XBPUK9aD+8Ft0Dj3RmC/GHm/EtSjOOrSP+pF230wp7snRAu9eUIoNnrLoVtA
         j+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5YbWDw47LTxNvAXa6P3YF+8i9W9XzDhfs6M2pfOAkWM=;
        b=hFg5B8/f0QV/j0/g9HL3ZUXB2Z2NxPxw+1S0SyILwFrM2/hEHMS57vx9i1JKxQa1DQ
         Gk2Q197Ef/17jG/FFtD0ZMcjEZ3HeDRO9IsyAi0mgj/7+/Cz9kghIKMoyw5ytTDw0/Qz
         oAMvWur8XJLmab1bQQ0INphXPOdTvjJG4eJbM27ngxYvLJXRhgP/EWvcGczE+kehGowk
         ya2jnnLBRRIYhSeOLzlbbs/cK/10v7esOgqTICn0Q5ODuzodprmoRuBGT9v5tJeUlkd/
         bwnin6VRX2LcXYxnOVif1aVWtjEKRnwvr5dqlgxx5I8cLjQFfJo+SkAeLy66vWcJHMnL
         0RmA==
X-Gm-Message-State: APjAAAW4Zth6rJ7RiE+GU915UMrbsnxEJpEwScjQDizByuRKDuVtgQq+
        JDSsqsZosTqcXljBTBIRsR6w/5aTTLiMvfiFBy4=
X-Google-Smtp-Source: APXvYqzdL7GBRuMgKRuNXYVYcpLezWXgK4k7ZLlsYj93ky2fwCPDdaNQGgBmQas71mY8JUCIh4Jz2+BC1VR8gGP7cww=
X-Received: by 2002:a63:2c7:: with SMTP id 190mr2811853pgc.18.1570632239553;
 Wed, 09 Oct 2019 07:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <1570203299-4270-1-git-send-email-akinobu.mita@gmail.com>
 <96ac332f-359f-531a-7890-45b39e168b82@gmail.com> <CAC5umyggUm26JHU9QeND=rTozjXwH5uMiVvoK=Zqo31eBn69pg@mail.gmail.com>
 <7d451092-bf8a-e1d4-996c-8af3cc816fc7@gmail.com> <CAC5umyiK8LBqQ1B1LPQgWXGCk_a+JyKgidrRZpPMDu+NZncDXw@mail.gmail.com>
 <72129a38-d975-74d4-269d-6269556d7aae@gmail.com>
In-Reply-To: <72129a38-d975-74d4-269d-6269556d7aae@gmail.com>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Wed, 9 Oct 2019 23:43:48 +0900
Message-ID: <CAC5umyjRbVFV8hQoynA83wEAwumMU1iZ1KouHaXiNruwXfATZQ@mail.gmail.com>
Subject: Re: [PATCH] leds: gpio: support multi-level brightness
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

2019=E5=B9=B410=E6=9C=889=E6=97=A5(=E6=B0=B4) 5:53 Jacek Anaszewski <jacek.=
anaszewski@gmail.com>:
>
> On 10/6/19 4:11 PM, Akinobu Mita wrote:
> > 2019=E5=B9=B410=E6=9C=886=E6=97=A5(=E6=97=A5) 4:17 Jacek Anaszewski <ja=
cek.anaszewski@gmail.com>:
> >>
> >> On 10/5/19 3:20 PM, Akinobu Mita wrote:
> >>> 2019=E5=B9=B410=E6=9C=885=E6=97=A5(=E5=9C=9F) 6:17 Jacek Anaszewski <=
jacek.anaszewski@gmail.com>:
> >>>>
> >>>> Hi Akinobu,
> >>>>
> >>>> Why do you think this change is needed? Does it solve
> >>>> some use case for you?
> >>>
> >>> It can be useful when using with an LED trigger that could set the
> >>> brightness values other than LED_FULL or LED_OFF.
> >>>
> >>> The LED CPU trigger for all CPUs (not per CPU) sets the brightness va=
lue
> >>> depending on the number of active CPUs.  We can define the multi brig=
htness
> >>> level gpio LED with fewer number of GPIO LEDs than the total number o=
f
> >>> CPUs, and the LEDs can be viewed as a level meter.
> >>
> >> Can't you achieve exactly the same effect by creating separate LED cla=
ss
> >> device for each GPIO LED and registering each of them for separate cpu=
N
> >> trigger?
> >
> > If there are GPIO LEDs as many as the total number of CPUs, we can.
> > However, if there are only two GPIO LEDs and six CPUs, we can only know
> > the CPU activity for two CPUs out of six CPUs with cpuN trigger.
> > So it's different from using cpu (all) trigger with multi level (2-leve=
l)
> > brightness GPIO LED.
>
> OK, that's a reasonable argument. However, this is clearly
> trigger-specific functionality and we should not delegate this
> logic down to the driver.
>
> What you propose should be a responsibility of a trigger that would
> allow registering multiple LEDs for its disposal. This would have to
> be different from existing LED Trigger mechanism, that blindly
> applies trigger event to all LEDs that have registered for it.
>
> Such a trigger would have to be a separate LED (pattern?) class device.
> It would need to be told how many LEDs it is going to manage
> and create files for filling the LED names. This design could be also
> used for defining patterns spanning on multiple LEDs. Just a rough idea.
> We can dwell on it if it catches.

What do you think about introducing a new led driver and describing a
level meter in the following DT node.

led-level-meter {
        compatible =3D "led-level-meter";
        leds =3D <&led0>, <&led1>, <&led2>, <&led3>;
};

Setting the brightness of led-level-meter to LED_HALF turns on led0 and
led1 with max brightness and turns off led2 and led3.

This is inspired by led-backlight driver patchset and Bjorn Andersson's
reply in this thread.
