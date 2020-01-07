Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 307401326EB
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 14:01:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbgAGNBb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 08:01:31 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37731 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727814AbgAGNBa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 08:01:30 -0500
Received: by mail-lj1-f193.google.com with SMTP id o13so43207884ljg.4
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 05:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vZDJ0Z3KTFuC9+XlVjxg702wKwgGzFZIhEmKFnvf86g=;
        b=MjzY/BAuEKZAcNNT+oRqdDHKYqnzMWjORiGocCmWFgViO0SQorMl9uOkA0kY+tZ5Sf
         IoTtuA+3nKp9JAnTq+dM35A7eZyRt3zsIiuz6kXFuQI9Ai9DqHxdA/e+oPjVCKE/LGV8
         GCfAZEJ39bHDDiijwQlnzJcB2cvL4Z9i+ClziGxKcVYXv2hYsLNCj90lDyr76xNw2NHD
         V0MkHG+RXhSDDecDp02bTaaMV6Pi2i+T4MBzXqROZyFTeVqDnyLFB+OBTT9MAF9Kcj/H
         GBi6H7Ca6DShJRTARhq4gIXuZg6nq2v4GiCIl1uOFX20TAS6Oexu9LTG08NoYLPAqA9v
         4QRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vZDJ0Z3KTFuC9+XlVjxg702wKwgGzFZIhEmKFnvf86g=;
        b=rDMO4r4QJ4VfbSSLrcSgp0FaGPJ3sBxXCOnX/U8aAcMOOCO2nuuK8xDpxEXjBzmeiW
         XX0D9ZLsloNu5pNgVOPSprORBIZ18JkTzz/zunxu4HS0NbsvDd+mBh5MmESgcWOqwqFj
         AHDW+7rafXyb0J7mL4zKS/7JuFOmfIHPqYamkDdGysNTSgl+Agh7/LoKUmV9rIPD197M
         yS0F+S3n32vMQ2I5zhOMAf2sr8mbDJ2QZuhvzEDmCaJTngKBG6bjtO8LexQ5YTGhohJG
         B5pNmVtMVfoOntzxi1eaBN/pIBuOaJAscF7l5oJtzCcEgcknZolcYDWDOEvhT8wmEZyX
         y9jg==
X-Gm-Message-State: APjAAAX6dk8cTNKf5tH3RWHWJ+SSFNDB5imbaiaqkUSYPQdN7IcQ1edE
        ip6O6+nOQ7PcZVu/b2FCZNX9uY38q9qQru8Yw0cQVQ==
X-Google-Smtp-Source: APXvYqzfa9fyHLZiKNwulHXqjCb8J6xujMZt5bBYtglre/yN1M6166N2+u+zxthTNv8KgR4tjFQhinxWumnRvskeLf8=
X-Received: by 2002:a2e:85cd:: with SMTP id h13mr61608991ljj.191.1578402087989;
 Tue, 07 Jan 2020 05:01:27 -0800 (PST)
MIME-Version: 1.0
References: <20191218163701.171914-1-arnd@arndb.de> <CACRpkdbqzLUNUjx_kt3-7JLZym2RZ47edW5qp0MgXmpW4-Xf9Q@mail.gmail.com>
 <CAK8P3a2BoVcdgRZqYutA=_SVHLtJwQzP3mKKN-q8n1ROj_iPgw@mail.gmail.com>
 <322b5fbe-e9ca-99cd-80d0-000a5464b37a@opensource.cirrus.com> <CAK8P3a12NievRVGgcyuPaFC3eKr9c7Y3KiTnFxEaLkDyzCCj1Q@mail.gmail.com>
In-Reply-To: <CAK8P3a12NievRVGgcyuPaFC3eKr9c7Y3KiTnFxEaLkDyzCCj1Q@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 14:01:16 +0100
Message-ID: <CACRpkdYWbHS1ZwRhCPyfncXyCyhFrmxOz1OzZR3Ui1toNHh60A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: lochnagar: select GPIOLIB
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Richard Fitzgerald <rf@opensource.cirrus.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>, patches@opensource.cirrus.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 7, 2020 at 1:39 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, Jan 7, 2020 at 12:58 PM Richard Fitzgerald
> <rf@opensource.cirrus.com> wrote:
> > On 07/01/2020 10:39, Arnd Bergmann wrote:
> > > On Tue, Jan 7, 2020 at 10:45 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > >> On Wed, Dec 18, 2019 at 5:37 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > >>> I wonder if GPIOLIB should just become mandatory when enabling the pinctrl
> > >>> subsystem, or if there are still good reasons for leaving it disabled
> > >>> on any machine that uses CONFIG_PINCTRL.
> > >>
> > >> Hm that is a tricky question, they almost always come in pair but are
> > >> technically speaking separate subsystems.
> > >
> > > I think there are a number of use cases for GPIOLIB drivers without PINCTRL, but
> > > are there any examples of the reverse?
> >
> > You could have muxable pins that aren't gpios. For example muxing
> > between i2c/spi signals. So a pinctrl driver doesn't imply gpio.
>
> I understand that this is the case in theory, but what I was wondering about
> is whether there are any such users, or at least any that also want to
> save a few kilobytes of kernel size for gpiolib.

I don't think so. In any case what we need to do at all times is
put gpiolib on lowcarb diet as it gets compiled into pretty much
everything (at least everything embedded), so I am working a bit on that.

Yours,
Linus Walleij
