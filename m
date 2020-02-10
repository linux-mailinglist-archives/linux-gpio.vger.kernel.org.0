Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29F6B157D6A
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2020 15:31:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbgBJObM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Feb 2020 09:31:12 -0500
Received: from mail-il1-f174.google.com ([209.85.166.174]:39779 "EHLO
        mail-il1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727987AbgBJObM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Feb 2020 09:31:12 -0500
Received: by mail-il1-f174.google.com with SMTP id f70so360267ill.6
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2020 06:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4F1afqEoEYV4a4s+gX7W0XJ/vIdhaSCqG7i1hpDjJL4=;
        b=bT9yIwo8a6vN6G0eOJmPbzIgxtbNlcMSq8wVLInUgz1ST3j3y/blEYVfCLMdjMemOZ
         jJNDjHbL4g2xE58mqygq+iExjsdnHHdxqEUfYjxuEDi/oFvq3HaH8pUyGeKyMC3qvDB8
         /+xFWm3Eb8NxoNCELR/YS8sStFymlLsMDFO6K2+dqTuUTK0MtKlgrp6Ibhbz9OeZV3l8
         7mDMVjSNFM/OTaBzazIJCwlCJ7e/Yls/Zw8TAVsjfQTE6rQ7MEFLUcGnJTzFtqTeXFjZ
         TOF6IDP3JeTeboaCWK4TNLcFw8ga6PDQtRDuMCQeAL647jvKgMInjKwgKWV/fXGhPc/z
         +ypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4F1afqEoEYV4a4s+gX7W0XJ/vIdhaSCqG7i1hpDjJL4=;
        b=OPALs1TdnPsRVCu5XkByclhZJP739pPupygSbjAtST7OOvIuQ5Uri7wW1Z4Jb9jSkJ
         eccfU/h+0TBfqgWqnTd4x3fkTf1bWR9QWFQqRGmaazlLTQwT3JCBeNjW5RjLbPS9esTG
         +MIqN1NReu3DjUkFCvANhESsVEgWY2GOwZTs6L+gk+hhFLq3L3H4vIiin+nj3RB7e+fK
         w5fCTSGHd5nVCsK4Wkky2KI5GqWIBUdvnRHy/RnEXf3WSfFvOAmxJ2a/CPeJS9myyYeS
         5yzDobDyerRjLgy8/dSFQ2G/p5DcX7POBQGV8dcSXrVgOZj0Cuo+bYpW9mMjOvvUxWEX
         aWXQ==
X-Gm-Message-State: APjAAAXreFxZXWzF9A8YutdZAMsiZshX5JEpW13Xod3+snJmRqPTcd6m
        Uc/RzaduJBJAxsAuX13h8wpZ9zyTX7uOv9YkMNQSZ+Ps8Ds=
X-Google-Smtp-Source: APXvYqzdiMmmtrvIQXrCkfJLugB2DVGxeG5uXFHGr/wncygR4lBjlUUVsqHjGQay9tZleLSzeYjoMObYzAvytZmg+eQ=
X-Received: by 2002:a92:9c1c:: with SMTP id h28mr1568619ili.189.1581345070346;
 Mon, 10 Feb 2020 06:31:10 -0800 (PST)
MIME-Version: 1.0
References: <CADn0hExOJHS0OhU41sToXxqnqpyWjmCPrsVwXE-OKBLg-0dsRQ@mail.gmail.com>
 <CADn0hEwXv1eyqMvPLshkPBOFukjza2nvScNNXw4U4L-K7dLHCw@mail.gmail.com>
In-Reply-To: <CADn0hEwXv1eyqMvPLshkPBOFukjza2nvScNNXw4U4L-K7dLHCw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 10 Feb 2020 15:30:59 +0100
Message-ID: <CAMRc=Mdf9EpdR7wPbzJ79_AZdO6LFSkqh+bVEirqnOP_tL0EYQ@mail.gmail.com>
Subject: Re: [libgpiod]
To:     Geoffrey White <geoffrey@geoffrey.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 10 lut 2020 o 11:46 Geoffrey White <geoffrey@geoffrey.id.au> napisa=
=C5=82(a):
>
> Hello,
>
> What a great library gpiod is. I am trying to port over my robot
> software from WiringPi to it at the moment.  I am running Ubuntu 18.04
> on both a development laptop and a Raspbery Pi 3 A+. I cross compile
> version 1.4.2 and can run on the Pi and iterate over the detected
> devices fine. However I'm not able to detect the correct chipset on
> the device.
>
> The Pi v3a+ uses the Broadcom chipset BCM2837B0, however the chip is
> detected as a bcm2835 which is from the original Pi v1. Further, none
> of the lines are labelled with a description. They all appear as
> "unnamed" instead of labels such as  "GPIO_GCLK" or "GPIO17"
>

Hi!

I don't have an RPi3A+ (or any RPi for that matter) but just a quick
look at the relevant device tree in upstream kernel is telling me that
the compatible used for the GPIO controller is "brcm,bcm2835-gpio" for
which the driver should introduce itself as "pinctrl-bcm2835". And
it's fine - maybe it's the same old pinctrl IP in the newer SoC?

As for the pin descriptions: libgpiod only extracts data provided by
the kernel and I have never received reports of this feature not
working before. I'd look for the problem in the kernel first. In
mainline linux I can see all the pins having names though.

Bartosz

> I heard the stock Kernel. on 18.04 (4.15) did have some issues,
> however I have since upgraded to the 5.3.0 Kernal on both my dev
> laptop and Pi.
>
> I would personally like to keep to using the Ubuntu distribution for
> the Pi, however perhaps it is better i revert back to Raspbian.
>
> My future work I hope to integrate the DMA timing for a simple PWM
> control using the gpiod, i'd like to help out with the project if I
> can, sorry if I have approached the wrong email list.
>
>  Regards,
>
> Geoffrey.
