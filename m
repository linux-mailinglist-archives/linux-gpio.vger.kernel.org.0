Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 061F6175FD2
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2020 17:34:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbgCBQee (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Mar 2020 11:34:34 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41943 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbgCBQed (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Mar 2020 11:34:33 -0500
Received: by mail-lf1-f65.google.com with SMTP id y17so39797lfe.8
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2020 08:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+ezAgpE1aOxehjVVyCXz5Viz83GfJGV4ZhdRkKwedlk=;
        b=vI1LuI0vfIH1yvsaqquDVw6jrfn52Wod3UaRT3LWjDw6TF6+/UIkWkCTk5Z/EgRAtF
         M2joB98V7XfigIsS/wv0sG8ydcbIeoXfqWBcaWGNjYzEvwFTNBxYqcOloU1x3VjcUPVQ
         tFfg7jJto4WZhKf8nXFcfcQWkXP0torDDykU/lQ2YVLhByoHsUP46W6xVxAR7UVES/Sf
         fZryflf+bLF2I+wuQpOMle1JY+p+qI2Vh6ESrw/03oYFFcE0rAGumG5tcGXOE/H/DS3v
         CLiBMgt7CIMo/UZhwyFRhZz4bC480mKOnSMgj5WtHgCxNyZgn3Ujhy56qx6cc3v5A5A+
         7NJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+ezAgpE1aOxehjVVyCXz5Viz83GfJGV4ZhdRkKwedlk=;
        b=WikA687Ak+T+8CgDCFHE2cOVlJhowV6jOidgmj5CkBkBXYbUw04w+2RYvEO7VpIadg
         2I2+B0yg1ihaBdvtay1jA3+c7FNimLJPT/jgWGzs5V88tJBqrq1nd7PUa9owfdmBzJwH
         89j32jgPA3UJK+ADTcfbt1JcxMVgAroE5zaIdcJZkfNfp+qa+NyCu6DrYhvUFTm7hD0J
         fy0mta+V+OU19XimKCYf3ehfkazhmkFPQV8lR3QCOg4RYFe4JHIBTUmR3Rcm0TcdO5+e
         w9LnDaVDdfdeYWvVp30haSJLMoS5sQokT3/wTSpXJjyfhLTTYZ9z9aehFdPVygH62c1d
         8C8Q==
X-Gm-Message-State: ANhLgQ14sMstdCU7k4bott4OgVxDv67N9ajjlPwwz146J+ESV5T1+1Rm
        nRRglk/njW01xW30eHe8Cb1hoHeOqoH7ui0ceBG5Gg==
X-Google-Smtp-Source: ADFU+vuVNI9O0XQOfyw1OSVPXHG7Oit2eef2YnEQRJFiOzL1ZJNLjlSV/mmhuJTmNHlvRup3VdmR7i44TwQIjCWHOn0=
X-Received: by 2002:a19:ed0b:: with SMTP id y11mr11314795lfy.77.1583166870424;
 Mon, 02 Mar 2020 08:34:30 -0800 (PST)
MIME-Version: 1.0
References: <CAMiSF3BULWkyWTytTBcFfch9YaV_QzuBiawk-ZqEcQnsuGdUiQ@mail.gmail.com>
 <20200302083959.wju5vz3acuka2edq@pengutronix.de> <20200302093607.GG25745@shell.armlinux.org.uk>
In-Reply-To: <20200302093607.GG25745@shell.armlinux.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 2 Mar 2020 17:34:19 +0100
Message-ID: <CACRpkdbADQ5+Tp9NDgQx20Y0QTcE_go2qzi7dJL9HLu8PU1Smg@mail.gmail.com>
Subject: Re: GPIOs not correctly exported via sysfs on ATSAMA5D2
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Romain Izard <romain.izard.pro@gmail.com>,
        Linux GPIO List <linux-gpio@vger.kernel.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 2, 2020 at 10:36 AM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
> On Mon, Mar 02, 2020 at 09:39:59AM +0100, Uwe Kleine-K=C3=B6nig wrote:

> >  - Sometimes it is useful to make use of a GPIO and a dedicated functio=
n
> >    on the same pin in a driver (e.g. an i2c driver might need to switch
> >    to gpio to do a bus recovery). The automatic pinmuxing then has
> >    strange side effect because you have to remux the pins after
> >    requesting the GPIOs even if you didn't drive the pins as GPIO and
> >    there is a short time where the pin function isn't the dedicated
> >    one.
>
> It's worse than that for the i2c driver.  The pins are muxed to the i2c
> function when the driver binds.  When the i2c driver claims the GPIOs
> corresponding with those pins, they get switched to GPIO mode behind
> the back of pinctrl.  You then have to _explicitly_ switch pinctrl to
> GPIO mode and back to I2C mode to get them back to I2C mode.

That's especially annoying. I would consider adding a specific
consumer flag for GPIOs used this way, in additon to
GPIOD_ASIS, something like GPIOD_ASIS_NOMUX
(thinking of better names).

Since the calling site knows about this usecase we can
open code the semantics for this specifically.

Yours,
Linus Walleij
