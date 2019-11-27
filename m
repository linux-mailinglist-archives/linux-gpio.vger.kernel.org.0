Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 959B210AE40
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 11:55:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbfK0KzZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 05:55:25 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40719 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbfK0KzZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 05:55:25 -0500
Received: by mail-lf1-f68.google.com with SMTP id y5so4066148lfy.7
        for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2019 02:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jW/pZi/y7a7Ae7GsA2SiR3pv/ZpPmeNnnKBaKGvs4nQ=;
        b=np33cXFuYCi7Ag+hHFaFtO8V12ydTEIpVr7AwOxdpDamhr66FZEHogbPxaY2lMHkN+
         xRz1LgFIspcU1kM1iolo0TADGEVZN+2yg4XMCQ+m2Dq/AGhcb2vmvotCkdg0J10h25Wc
         H45HfRSnu/tA3baBINT5U9E8f43ROd8AbWaWecPGDprWFF5EjfzklVi2qA/md/NVlsFd
         Nvij3sCckbD6jm9STKjKPPOGwrnScXLbFqdP1OX0j2lbh8T3dfRNrB7RpctqDyn6Ri3R
         Qe22NKeKIZkXbR0WIBPDf8/o8JuGTmxTi59lwk81z9MYGp69Zpg4boqIZTQvSIImmCv8
         ReTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jW/pZi/y7a7Ae7GsA2SiR3pv/ZpPmeNnnKBaKGvs4nQ=;
        b=GEphj+fQMpkZF2I0hCcOS0//SW8hZf+H84Ji4brVwWvRcU/qTpmMoHODZnJxs6opv9
         G5gaxT0YSh6LNGdhabtG3v+ifyjyx/mHbqVrEEhBwPG05YNqfotC9HDTRbnYY9f8D72J
         tkts0TLPv5FjLxS9xv4XO6QJEtXyCiVV5wSj3JR0GiDRC8zfROM/nY5tYo8HrYkSQq7G
         sF+zHB2Y6JqJACmfJfxXKs2avdVdKABPpO92qnB6LydWlc/vOzmpxfv1NRa3hUJAtHRR
         qOG+HHF0WBi5vLicPRtyB82tR4XZUhpjcm2p1aMDoHs2cuCRVt8ck73rYXfN7pmp5cUz
         AgnA==
X-Gm-Message-State: APjAAAUDqBcPfNNuh3nqlz/WPw0Je9Ls25Ni5xv0TObhQA3rGXNVhvrN
        8b9ERmJCtkxqkTBYcGLyNOq/hYrXfHQIMtYigmezrg==
X-Google-Smtp-Source: APXvYqxSDzlsMjH492pTspJWX8yOEHID6Rg4E3k5Lzb9nw7VmCsZKMc81+9VysxjWAsiWF2Zgvf+PB4pP4qhtUsZ9NQ=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr27663867lfi.93.1574852123515;
 Wed, 27 Nov 2019 02:55:23 -0800 (PST)
MIME-Version: 1.0
References: <e9981d69-2a33-fec9-7d12-15fcb948364d@c-s.fr> <CACRpkdYLEibwyK_BGO3gsJ_aQFWZNJCky-GezHVmHfRSzD2zBg@mail.gmail.com>
 <1efb797c-e3c1-25a4-0e81-78b5bbadb355@c-s.fr> <CACRpkdYUBj+45Jr94kdERKJogVoL96JH6i85o_bVUtjmkTt19g@mail.gmail.com>
 <3c79a8b9-65e4-bfc9-d718-b8530fe1e672@c-s.fr> <b06679da-0332-2322-13f8-07307f611542@c-s.fr>
 <CACRpkdbOzM3X2_BMnf5eSqCt_UsnXo4eXD2fUbTLk6=Uo3gB2g@mail.gmail.com>
 <582b5ccf-8993-6345-94d1-3c2fc94e4d4f@c-s.fr> <CACRpkdawu5DcCA5rnRbOe+meBPtxctL7HuWciqboOEkCHZKA7A@mail.gmail.com>
 <e6a39aba-a41b-d781-966a-647977216b87@c-s.fr> <CACRpkda-wjRm7UYsFTX_xFfNPT29U1PTMyuU4AP=WShiC_vV9g@mail.gmail.com>
 <b2925217-9cbd-2f4e-c92f-9e1c92824193@c-s.fr>
In-Reply-To: <b2925217-9cbd-2f4e-c92f-9e1c92824193@c-s.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 Nov 2019 11:55:11 +0100
Message-ID: <CACRpkdaKg45uHMZ9mz6OGkAUqYX7GzhTrjrAc1feVhn68ZXrqg@mail.gmail.com>
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

On Wed, Nov 27, 2019 at 11:39 AM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
> Le 27/11/2019 =C3=A0 11:02, Linus Walleij a =C3=A9crit :
> > On Wed, Nov 27, 2019 at 10:34 AM Christophe Leroy
> > <christophe.leroy@c-s.fr> wrote:
> >
> >> In the meantime, I have tried changing "gpios" by "cs-gpios" in the
> >> device tree, and I get the following warning:
> > (...)
> >> [    3.156654] WARNING: CPU: 0 PID: 1 at drivers/spi/spi-fsl-spi.c:716
> >> fsl_spi_cs_control+0x64/0x7c
> >
> > That should be this one:
> >
> > if (WARN_ON_ONCE(!pinfo->immr_spi_cs))
> >     return;
> >
> > That happens when spi->cs_gpiod is NULL so the
> > chipselect isn't found and assigned, and the code
> > goes on to check the native CS and find that this isn't
> > available either and issues the warning.
>
> That's in spi_add_device(), it is spi->cs_gpio and not spi->cs_gpiod
> which is assigned, so spi->cs_gpiod remains NULL.

That's weird, because when ->use_gpio_descriptors is set
(as for this driver) the core only attempts to look up
spi->cs_gpiods and not spi->cs_gpios, and consequently
can only assign spi->cd_gpiod and not spi->cs_gpio:

if (ctlr->use_gpio_descriptors) {
    status =3D spi_get_gpio_descs(ctlr);
(...)
} else {
(....)
    status =3D of_spi_get_gpio_numbers(ctlr);
}
(...)
/* Descriptors take precedence */
if (ctlr->cs_gpiods)
    spi->cs_gpiod =3D ctlr->cs_gpiods[spi->chip_select];
else if (ctlr->cs_gpios)
    spi->cs_gpio =3D ctlr->cs_gpios[spi->chip_select];

So I'm a bit confused...

Yours,
Linus Walleij
