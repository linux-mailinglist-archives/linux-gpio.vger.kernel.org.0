Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E954FCD236
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2019 16:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbfJFONX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Oct 2019 10:13:23 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35306 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbfJFONX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Oct 2019 10:13:23 -0400
Received: by mail-pl1-f194.google.com with SMTP id c3so4103870plo.2;
        Sun, 06 Oct 2019 07:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NFqrCCqmrRTPlc5WO36jviIgwmi3DrtqFzh1jQbq1I0=;
        b=nMQqrwsOFBSKN0Bkm0TtBEzU5Ql3X1HM8z5ibGnivfuCkdlMQUpKEdKbYLT2JOXAfj
         FmydrCBVGBxDPG2d+gK+x53n9XCJsCtFc/KN6pAXCu+ktyJBGbJMUI8UP7pN0ayK2Ujt
         wcWh+zk6wMKXMHhAboI5LkGSD7pEqY7TmXew3zxDzkPOfVepoUtALqL0Ds7fnjwUtwFj
         KwEMl215D6dt0NNinGrhj0kktEwaL3iPSiESBb68TtzOkmP/FNnHKRY12TvujUojNjZ7
         RZDk1V9UbndnQCBEk725IWubGm+KK+/DJ2TyHQDoXw9lh+kvlY7i5GenHMC2ApPM6QsZ
         SPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NFqrCCqmrRTPlc5WO36jviIgwmi3DrtqFzh1jQbq1I0=;
        b=MSuCkBWOyUs2FbGxK1bdlLnCu8YReCN4cL1Cm4qnY6YZ9t2LvW5R6bupu7Uyed3S+i
         nCQrlQRwk0AN/kI+muYqDAxEGnjvJ6QyptXEYhO0WLs9trqByordCSLU6vf5iTcPTaxG
         9kW6S+7TdE/T89zT7aCO6v5AdDyW26FDPZs+4aB57acS318x8Ngi0sI3FS4XPA3kffOQ
         2MR2NsbjqyTDYEU5ISxRKYPyvpkbX4Hd42UU4753jfJ/N4+G3wle8wIAzJH4DVSMFKbb
         YPI59JyFjt0met92PeadZ11Xj3+Zl+qBpgMFP5O+LIDcZoJTKrVceCbTlKlJpdnpvbCe
         ZD8g==
X-Gm-Message-State: APjAAAWlp8Sqhsi3SePfNLr9sHs8Crr4yHYWdV6gNcdLbP3s5iByPe2S
        r3iTphElFUy2BrYVC/n1YPQWwm19lsrtbLG1NUQ=
X-Google-Smtp-Source: APXvYqyw4DZhyypdRaJfKyyzI4ExR7rNNQMB5kRJCQxKdVNl6r0uGGD2NBIGsLnptKP9EGhXXUVEKcQyo3+zHXm/oUQ=
X-Received: by 2002:a17:902:8690:: with SMTP id g16mr23827223plo.274.1570371202967;
 Sun, 06 Oct 2019 07:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <1570203299-4270-1-git-send-email-akinobu.mita@gmail.com> <CAJAp7OhLtWm4kToH2L39ZczEFZcvU82F4ZVdCO0D4JKOsgCGDA@mail.gmail.com>
In-Reply-To: <CAJAp7OhLtWm4kToH2L39ZczEFZcvU82F4ZVdCO0D4JKOsgCGDA@mail.gmail.com>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Sun, 6 Oct 2019 23:13:11 +0900
Message-ID: <CAC5umyiTtVPn_+XtHaBLYCi7EXqZ9ehRjvDzKr=kKZckYb14mw@mail.gmail.com>
Subject: Re: [PATCH] leds: gpio: support multi-level brightness
To:     Bjorn Andersson <bjorn@kryo.se>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

2019=E5=B9=B410=E6=9C=886=E6=97=A5(=E6=97=A5) 13:06 Bjorn Andersson <bjorn@=
kryo.se>:
>
> On Fri, Oct 4, 2019 at 8:35 AM Akinobu Mita <akinobu.mita@gmail.com> wrot=
e:
> >
> > Currently, GPIO LED driver allows the GPIO properties to contain one GP=
IO
> > phandle.  This enables to contain more than one GPIO phandle and the
> > brightness of the LEDs is proportional to the number of active GPIOs.
> >
> > Describing multi-level brightness GPIO LED is only supported in DT.  It=
 is
> > not supported in ACPI and platform data.
> >
>
> This looks interesting.
>
> I have a half-baked driver for the NXP PCA9956B; which is a 24-channel
> LED driver, each channel with brightness control. With these LEDs
> mounted in a line (like on my devboard), an interface for setting e.g.
> a percentage and have the appropriate number of LEDs light up seems
> like an interesting thing to pursue.
>
> So I think this would be better represented in some more generic form,
> perhaps a trigger?

I think it's good idea to create a generalized multiple LED driver.
The device consists of multiple LED devices by different drivers and can
be used as a single LED device.  Although there is a lot more work to do
than this LED GPIO enhancement.
