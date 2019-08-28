Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48D14A0055
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2019 12:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbfH1K4k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Aug 2019 06:56:40 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41419 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726259AbfH1K4k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Aug 2019 06:56:40 -0400
Received: by mail-ot1-f67.google.com with SMTP id o101so2287680ota.8
        for <linux-gpio@vger.kernel.org>; Wed, 28 Aug 2019 03:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9nBDIm2N1o53yUHNgHlni3PU6OkH5zkDsyDdUf/2oVk=;
        b=BUMTIuQPT4mnrt196mfGejjgRmHSZoT05FuKeAxQp9JStqUFVI2cEDFgxC93bWptk0
         mYMKz9bxEUKtrIbTgU1wlT3W5YGAOEnvVGHht9L/4jugtGrqk7yHpV8jFtxV+V90O+um
         /H5YHEjPVI91os5xEofC/w51XzKgVSynB6t0WGQbyjwFqedBu1lnnQlw8HQiW4LaXWxi
         NIpanUcOVC3DkhxmoTFRSasS4UR4482qgff6tXmEXUNTxQyI5p+Pimlr3yVg45yxjZIl
         xPqZHIhF22HJXKOGJ44FdPfwF+j6y+nBXCtVJLfIj68NptVx2I0+zHOrHm4vqquq8Ktb
         WIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9nBDIm2N1o53yUHNgHlni3PU6OkH5zkDsyDdUf/2oVk=;
        b=B40qFMPRq1N9Fj3pULWfXo/x7hL3nYxAIGfD9jG7naOZp53SJMG/Cbp1sJkcIihekt
         UV+JfUd8/2Myxe906Ft/8BpXCws8zmlu3/9KG93MZwoMxGVCLEcRfkggmtksAXFOki1d
         E2d4yKJHTW/rL/4jZFtMSkDpY57k7AUk09va9YxXOpd0K2QleKuhH/xQppRPnrJYi0s7
         DtnfNMexFc0Rhd1NTs4qtVuR4EcwSCahbAD3tfx2Xp59tSO8d4lt2Xnta4JjPc1ZwoJq
         oQj4YVkzgEEiLb7CXQJv3V96hb37rL66OicIojLxWug2NOrN7mU8GoQ0o4nyLVwm4Pon
         fBFQ==
X-Gm-Message-State: APjAAAXaGvcFaf7SXIunksyQa7A4k5fgoG30nx8qkK3UGSBsg9giuoiy
        KncMFxYxd2yMZ67R5pu8nWviNtswCnqoEPq1yVHqOw==
X-Google-Smtp-Source: APXvYqwbHxw64sX7kxlc9Y4MID92CqSaT+i8SQ6bQ48Si4zn2Rjk+DXtFquo2zpnX5NMjvYXztu9wY8XqKYajTOkN+M=
X-Received: by 2002:a9d:6290:: with SMTP id x16mr2722950otk.292.1566989799465;
 Wed, 28 Aug 2019 03:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190827064629.90214-1-david@protonic.nl> <CAMpxmJV2XC+CK1SfJnH2YuaD2Gh=fiBQY+WPbjnqkvxGW6ZH_w@mail.gmail.com>
In-Reply-To: <CAMpxmJV2XC+CK1SfJnH2YuaD2Gh=fiBQY+WPbjnqkvxGW6ZH_w@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 28 Aug 2019 12:56:28 +0200
Message-ID: <CAMpxmJXQ=M9PeMFBf70aE5Jgg3c6P2=4QF5CxWpenh+2WXLhnA@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: gpio-pca953x.c: Correct type of reg_direction
To:     David Jander <david@protonic.nl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 28 sie 2019 o 10:38 Bartosz Golaszewski
<bgolaszewski@baylibre.com> napisa=C5=82(a):
>
> wt., 27 sie 2019 o 08:46 David Jander <david@protonic.nl> napisa=C5=82(a)=
:
> >
> > The type of reg_direction needs to match the type of the regmap, which =
is
> > u8.
> >
> > Signed-off-by: David Jander <david@protonic.nl>
> > ---
> >  drivers/gpio/gpio-pca953x.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> > index 378b206d2dc9..30072a570bc2 100644
> > --- a/drivers/gpio/gpio-pca953x.c
> > +++ b/drivers/gpio/gpio-pca953x.c
> > @@ -604,7 +604,7 @@ static void pca953x_irq_bus_sync_unlock(struct irq_=
data *d)
> >         u8 new_irqs;
> >         int level, i;
> >         u8 invert_irq_mask[MAX_BANK];
> > -       int reg_direction[MAX_BANK];
> > +       u8 reg_direction[MAX_BANK];
> >
> >         regmap_bulk_read(chip->regmap, chip->regs->direction, reg_direc=
tion,
> >                          NBANK(chip));
> > @@ -679,7 +679,7 @@ static bool pca953x_irq_pending(struct pca953x_chip=
 *chip, u8 *pending)
> >         bool pending_seen =3D false;
> >         bool trigger_seen =3D false;
> >         u8 trigger[MAX_BANK];
> > -       int reg_direction[MAX_BANK];
> > +       u8 reg_direction[MAX_BANK];
> >         int ret, i;
> >
> >         if (chip->driver_data & PCA_PCAL) {
> > @@ -768,7 +768,7 @@ static int pca953x_irq_setup(struct pca953x_chip *c=
hip,
> >  {
> >         struct i2c_client *client =3D chip->client;
> >         struct irq_chip *irq_chip =3D &chip->irq_chip;
> > -       int reg_direction[MAX_BANK];
> > +       u8 reg_direction[MAX_BANK];
> >         int ret, i;
> >
> >         if (!client->irq)
> > --
> > 2.19.1
> >
>
> Applied for v5.4.

Actually the second patch depends on the first one, so moved it over to fix=
es.

Bart

>
> Thanks!
> Bart
