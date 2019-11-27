Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDB710AC6E
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 10:12:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbfK0JMC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 04:12:02 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33114 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfK0JMC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 04:12:02 -0500
Received: by mail-lf1-f68.google.com with SMTP id d6so16545480lfc.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2019 01:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hARLoTz0Dg5cC9jVTqX7fgmZ/VALjX3CNbxoThXjHfE=;
        b=oDP4BqvLQ5V4bN8b8p4GByzINtKKOFJ7NZi1t0dJRTLO7l4+AZsneaaO1nM/FmSjyr
         qDActMIy/U7mSBLLE1veJvkACiFCBv/xNGZ+PfbChrvIcVSoeUab8Gq08lCcfBrCn2E6
         UG1ZvD6Oc3mEedxVgzyfGmE//xEw6+Jjblxt8ElYO/n9tE6oSnYCeq5VPtvuIqvR2paD
         lwW0QMbBPGl0o02HNRWa2C6AGTh0n3/qsJrcSmYB6nqwg+2idVGMP+rkZ/Yd6pKfEKIi
         zj+jbWZf5lxknLwTuFiyFcGUP8LkJuXTMmt7M7Mx65QqRBQ6/VVq+SJJDN8SxwG5b4H6
         iRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hARLoTz0Dg5cC9jVTqX7fgmZ/VALjX3CNbxoThXjHfE=;
        b=DE39RW3COQmswdXROZuQheCN9+IjI0lNl/2dfvcbBs6V5xqz/EvF2IJ+ByEj4fmMRQ
         qiVNcwyYGSTF5KF9s2NCrkp59tbqNnJMMzi6sL42QuaWutBpP81Z2bC5X89os1Alu22V
         jCORSC3yJvORdkmYd9YJDahPB+wLt5/HW7Zdde1qbIdl9g2cEPpSlP2R3/DlmerWmSc0
         3exqLEzTwWkwFI8zRC0Cy3xiAYUnz4xDoFPEXozPhasmRLnhncC8rZFGjTlL52M2hgrq
         j/3YMHCpBrlguo6UjxGocdqDaa6wAjH/vqlkkiX+iPby/5+kew8PVPhOlPCul6rV15kQ
         jCGQ==
X-Gm-Message-State: APjAAAWBp1HGwl4HsZ7la3chQNiMIIb+GEQpUOfZUQHgsTAg7/vlcYIe
        OHOrz20yPf3275YcLxDsO2JO8tKhDgsamAXtoaXN+Q==
X-Google-Smtp-Source: APXvYqxQ6YobBjlCKSfJQTUCDaCWdUamfrEI7onvoO2+mUD5fCTexujxAlIs8WiGzK/HHB1xvv9/r7ZwcObKGwNFnXc=
X-Received: by 2002:a19:645b:: with SMTP id b27mr17782623lfj.117.1574845920141;
 Wed, 27 Nov 2019 01:12:00 -0800 (PST)
MIME-Version: 1.0
References: <e9981d69-2a33-fec9-7d12-15fcb948364d@c-s.fr> <CACRpkdYLEibwyK_BGO3gsJ_aQFWZNJCky-GezHVmHfRSzD2zBg@mail.gmail.com>
 <1efb797c-e3c1-25a4-0e81-78b5bbadb355@c-s.fr> <CACRpkdYUBj+45Jr94kdERKJogVoL96JH6i85o_bVUtjmkTt19g@mail.gmail.com>
 <3c79a8b9-65e4-bfc9-d718-b8530fe1e672@c-s.fr> <b06679da-0332-2322-13f8-07307f611542@c-s.fr>
 <CACRpkdbOzM3X2_BMnf5eSqCt_UsnXo4eXD2fUbTLk6=Uo3gB2g@mail.gmail.com> <582b5ccf-8993-6345-94d1-3c2fc94e4d4f@c-s.fr>
In-Reply-To: <582b5ccf-8993-6345-94d1-3c2fc94e4d4f@c-s.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 Nov 2019 10:11:48 +0100
Message-ID: <CACRpkdawu5DcCA5rnRbOe+meBPtxctL7HuWciqboOEkCHZKA7A@mail.gmail.com>
Subject: Re: Boot failure with 5.4-rc5, bisected to 0f0581b24bd0 ("spi: fsl:
 Convert to use CS GPIO descriptors")
To:     Christophe Leroy <christophe.leroy@c-s.fr>
Cc:     linux-spi <linux-spi@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 27, 2019 at 10:07 AM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
> Le 27/11/2019 =C3=A0 09:26, Linus Walleij a =C3=A9crit :

> >        master->num_chipselect =3D pdata->max_chipselect;
>
> I confirm it can't be that .... here I get ngpios =3D 9

Ah yeah you're right.

> > But the new code in the core has this:
> >
> >      nb =3D gpiod_count(dev, "cs");
>
> However the above is likely the issue. The property in the DTS is
> 'gpios' and not 'cs-gpios'. According to commit e3023bf80639 ("gpio: of:
> Handle the Freescale SPI CS"), it shouldn't be needed to rename it, and
> that's also what I understand from commit log of 0f0581b24bd0 ("spi:
> fsl: Convert to use CS GPIO descriptors")

Yeah I see it now, the gpio_get* does use the extra quirks to find
a node just named "gpios" but this gpiod_count doesn't work
because that does not loop through the same quirk.

I will think of something and send a better patch!

Yours,
Linus Walleij
