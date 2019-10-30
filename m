Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D833DE9C16
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 14:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbfJ3NNH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 09:13:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:37670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726119AbfJ3NNH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Oct 2019 09:13:07 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 37FE3208E3;
        Wed, 30 Oct 2019 13:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572441186;
        bh=TYzyLtP+D7kB/qnfgS6x7BUXNu6ybul91VI0CYY7u8M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bSpRV8bJ94Yt1H4/pwx0XzesfPodlXVb29S+DU1VXYKifjAa+HKPLuvcQ6CI2uAka
         GlRm3JpSuqUn6FAxTRna1ZsYcSY9ZzjUWlh0sDaSxPDF1+L2j1Ld2/lto6jMU/HmkW
         JsJv7rS/aqpAvRuMD0rq8Hu/SIcQonDL9etPfobk=
Received: by mail-qt1-f174.google.com with SMTP id g50so3132401qtb.4;
        Wed, 30 Oct 2019 06:13:06 -0700 (PDT)
X-Gm-Message-State: APjAAAX0wpuUaQq5+JXhDIZFeCKGgrE9td+aEv4ooi1r9EET2cwxyWkd
        ixRnJcItNRZukLJ9W8UkflzSYSF2Le1KWjIaHg==
X-Google-Smtp-Source: APXvYqzpbAR616454Q99vvOIazcNBXYazAW21qXlBdc1UMHRA5TCBXDrgT6hbzNXT2P9BQZAhzCr31sSccUE5YWDInk=
X-Received: by 2002:ac8:65d5:: with SMTP id t21mr4861712qto.300.1572441185291;
 Wed, 30 Oct 2019 06:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <20191030120440.3699-1-peter.ujfalusi@ti.com>
In-Reply-To: <20191030120440.3699-1-peter.ujfalusi@ti.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 30 Oct 2019 08:12:53 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK-eqoyU7RWiVXMpPZ8BfT8a0WB47756s8AUtyOqbkPXA@mail.gmail.com>
Message-ID: <CAL_JsqK-eqoyU7RWiVXMpPZ8BfT8a0WB47756s8AUtyOqbkPXA@mail.gmail.com>
Subject: Re: [RFC v2 0/2] gpio: Support for shared GPIO lines on boards
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 30, 2019 at 7:03 AM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
>
> Hi,
>
> The shared GPIO line for external components tends to be a common issue and
> there is no 'clean' way of handling it.
>
> I'm aware of the GPIOD_FLAGS_BIT_NONEXCLUSIVE flag, which must be provided when
> a driver tries to request a GPIO which is already in use.
> However the driver must know that the component is going to be used in such a
> way, which can be said to any external components with GPIO line, so in theory
> all drivers must set this flag when requesting the GPIO...
>
> But with the GPIOD_FLAGS_BIT_NONEXCLUSIVE all clients have full control of the
> GPIO line. For example any device using the same GPIO as reset/enable line can
> reset/enable other devices, which is not something the other device might like
> or can handle.
> For example a device needs to be configured after it is enabled, but some other
> driver would reset it while handling the same GPIO -> the device is not
> operational anymmore as it lost it's configuration.
>
> With the gpio-shared gpiochip we can overcome this by giving the gpio-shared
> the role of making sure that the GPIO line only changes state when it will not
> disturb any of the clients sharing the same GPIO line.

Why can't we just add a shared flag like we have for interrupts?
Effectively, we have that for resets too, it's just hardcoded in the
the drivers.

Rob
