Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83A3911FFE0
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 09:33:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbfLPIcc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 03:32:32 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:37591 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbfLPIcc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 03:32:32 -0500
Received: by mail-vs1-f65.google.com with SMTP id x18so3613042vsq.4
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 00:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JkgTe7RiiAq5QhSu2PZNU7m2RnEe6PES0VorJPFQMuI=;
        b=YoxUQn0M3SuXi8l42WvhOcaLVs9FtT4yYaFQt1JnF7fyLfINtK8IH7LjURdGPX5cQ1
         R8URrTHR/tj+puo4KBNXX1HKPhXcrqFlXy1ed8ZAsrUqVCXYWsnWJV0l7kex0g1yZoXR
         ri9Oi04z+9x1kjq1esub91N9X6+vdJ8E7w/+ezYVaY537kG05SnQU8+6Xy8y7GSwZuMx
         UEn5PjruDsQcgqx6ab95Q8EB3LntrQNSNE2lq25zQg8eSVkdAhtnJpNcOC53TKRZYFvy
         YxYi/hR2QW9Fsb0DW3Xi9SGjCXGwlS7mHg66lIyjG/P95hwzr5KnTr73Eh/SyycJOIqa
         3sDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JkgTe7RiiAq5QhSu2PZNU7m2RnEe6PES0VorJPFQMuI=;
        b=uS+VkCh8Ri0yyVzucfVHtbQFm4tgD4SuG2+DBK8vPORcLmKkzHfmGpLthi6cjGNZlE
         gXcNBTp1O8Y0ZVF3/5V32pblS3gFRCidacobh17s8YJcBnHfBLiNVgdNTgQYmk52MePy
         Ts1wu7UFQwR00E6xKuTYN2yyROiJ1qSwoyNjfzubOt4pjx/Kzm76I53XgoV4wSdw/wzH
         8CrTkEPUIVxvrRBnldT0wEuP5OVRbQu6B8Ggs3queDOoK0p2BIEtw00kI4NFxWK3rUJ3
         89tYruFrgD2Flkckpjqncs5O0QhRywHZphBfm+l49XKx295ZquFyXC2c/yTBRYgDPUCb
         FAIw==
X-Gm-Message-State: APjAAAUn2gZEhFMslY8O0DNDPJM7BXuIN38NeJMM0eE8coAHRER2oCBS
        D4uB/54sf6jnFbZrjcLrONxShYg9ajMtLkyrK8Sapg==
X-Google-Smtp-Source: APXvYqy6s+VOmPyj3eK02h1e4bwZVh9q2OoyCiemRBTtBkO775i3aGAeU2EoW0Amob5gIdaXOUj0ObPrX0yIOlsfXQ0=
X-Received: by 2002:a67:d592:: with SMTP id m18mr20661597vsj.85.1576485151530;
 Mon, 16 Dec 2019 00:32:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com> <e20e9a86677bdbd7f9ac889004a34731396d7a28.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <e20e9a86677bdbd7f9ac889004a34731396d7a28.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 09:32:20 +0100
Message-ID: <CACRpkdaVMS-1V+mRGzEeq-WcxWHjuHzj=5a09Egcxj_fHZhDmg@mail.gmail.com>
Subject: Re: [PATCH v6 13/15] gpio: bd71828: Initial support for ROHM BD71828
 PMIC GPIOs
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 11, 2019 at 10:49 AM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:

> ROHM BD71828 PMIC contains 4 pins which can be configured by OTP
> to be used for general purposes. First 3 can be used as outputs
> and 4.th pin can be used as input. Allow them to be controlled
> via GPIO framework.
>
> The driver assumes all of the pins are configured as GPIOs and
> trusts that the reserved pins in other OTP configurations are
> excluded from control using "gpio-reserved-ranges" device tree
> property (or left untouched by GPIO users).
>
> Typical use for 4.th pin (input) is to use it as HALL sensor
> input so that this pin state is toggled when HALL sensor detects
> LID position change (from close to open or open to close). PMIC
> HW implements some extra logic which allows PMIC to power-up the
> system when this pin is toggled. Please see the data sheet for
> details of GPIO options which can be selected by OTP settings.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
