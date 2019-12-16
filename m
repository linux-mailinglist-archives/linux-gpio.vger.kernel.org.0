Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3949611FFBE
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 09:30:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbfLPIaE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 03:30:04 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:42122 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbfLPIaD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 03:30:03 -0500
Received: by mail-ua1-f65.google.com with SMTP id d8so1773314uak.9
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 00:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kDxQhaeLo6rNMVFT3CBcpOhBFhoVMYpLfsYqZHIsllM=;
        b=GJ6KAmw6S+sq3Ccetl/H3ixiZVhos+PR0jEMWgPCzfx0kYdnBXsUmmddRDGHKCa+IW
         XpoIFbLS8+19HgHvj1aji88fMJFyb1lR/OZ36673QRjkhDqdlzrIFkgM8oE+oLQDArnf
         b7+9QxLZM6bFfD0TyRkuo4e0dVkdBL0SKoIBmAyTVM1uFsJHNelZ/+e0ANXGZ4aezkeZ
         o4gb0cTRAp9bOD/PgQ9vQbyM+lGwK9Ok7JQXcF4SJ5b4Kw9UhJJL2BCwrf0d2BtMgGGk
         5R3A+AL4JyWngHzSseIzNmoBzR/zYQxFslU5c3tgyAMleZF6TpW7mWEL4HtKwSHPi2AZ
         9W7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kDxQhaeLo6rNMVFT3CBcpOhBFhoVMYpLfsYqZHIsllM=;
        b=UfDAIjb0O455AvRKKMA5SBG3hKKN97mSFgli9agRlqE0GliquwPL7KKLSNKeI+PvCz
         fGlmkJterWB5ZkHa+fr0fceY0PAx3whaFSm6JmOK7PBdnP0xTHz1b7V1XNHS3zaZbipK
         po0UZPjiMpVMiETyLz2/nq1OmGUDar2IYi5gTBCKwOG7Kx2+PBM1/UBnS8bFlQOSBaum
         BLqWw3bI6s8u43AoWaGU5KFFO2Mt/975eqXg+7M6IsE4zFLr3sUk55ILdH816gJlkyn+
         H1wXwB9t6icFr84bqxokImNf17+LLzDVe5PYY9nbFiUEZZ8lj6GVgx3XKXBwbKnRbW0C
         cZtg==
X-Gm-Message-State: APjAAAWkkCmgBkR8MimQFpxm6PpIy1hTpbMz9uUrFIsZptyqmfIto1ZZ
        SRxCPg1f2jzkOkKYu6Js84+LKJwKi2ZtWMKgUHh11Q==
X-Google-Smtp-Source: APXvYqwni+l6XxPCyreJYxRHqzJXidyE2iM9tvx9B737sdIeXKOHoRA6FLpVo5xoUtWtnIiiMdWW6jDBBKJSinB1wok=
X-Received: by 2002:ab0:5512:: with SMTP id t18mr22623715uaa.128.1576485002794;
 Mon, 16 Dec 2019 00:30:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com> <f34765b5cb4e949c2e85415ded3d0ee7736cc97b.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <f34765b5cb4e949c2e85415ded3d0ee7736cc97b.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 09:29:51 +0100
Message-ID: <CACRpkdbUS7WeQ7OoTtjGnB7L=uhYncwwcHxkJ1Uj6GqYCGNGJA@mail.gmail.com>
Subject: Re: [PATCH v6 10/15] gpio: devres: Add devm_gpiod_get_parent_array
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

On Wed, Dec 11, 2019 at 10:47 AM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:

> Bunch of MFD sub-devices which are instantiated by MFD do not have
> own device-tree nodes but have (for example) the GPIO consumer
> information in parent device's DT node. Add resource managed
> devm_gpiod_get_array() for such devices so that they can get the
> consumer information from parent DT while still binding the GPIO
> reservation life-time to this sub-device life time.
>
> If devm_gpiod_get_array is used as such - then unloading and then
> re-loading the child device fails as the GPIOs reserved during first
> load are not freed when driver for sub-device is unload (if parent
> stays there).
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>
> Changes since v5:
> - renamed internal function (no __ - prefixes for Linus :] )

Thanks, as there are things happening in the GPIO subsystem I
have put this one patch on an immutable branch here:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/log/?h=ib-devm-gpiod-get-parent-array

Please ask the maintainer (I guess Lee?) to pull this into wherever
the rest of the patches should be merged if you want patches beyond
this point to be applied for the next (v5.6) merge window, then this
patch is not needed in the series.

Yours,
Linus Walleij
