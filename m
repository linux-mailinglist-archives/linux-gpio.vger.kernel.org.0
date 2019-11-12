Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 895A3F8C96
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2019 11:16:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbfKLKQV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Nov 2019 05:16:21 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35217 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbfKLKQV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Nov 2019 05:16:21 -0500
Received: by mail-ot1-f65.google.com with SMTP id z6so13847547otb.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2019 02:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AKZO0OAzyyYGtpbwsEj0QOcTH8vqhFRIVBhgV2yDI1g=;
        b=MKkc4UyNjo46K6JpSwpbGmcYcHb694jLXJxKceHuu01hTDC6t0f3f7w4XAQlrwJdLI
         +0dpUVgiYRfD4m4UTM61GbEUvKzH+cV+RCj5NHe8Ym6pLVsHUgofeIn6/UVh62vDPLdW
         geQPN19YcJozX+8NZpNEJ64YZU94tHhcp/ZvYALtrAMHUIKgbjcPvWpoGlKS9By3QvV2
         PaUsCD112vgto4G5Y3Hhh1JqsctWluEZv3TN5zcfcd4b03LIPzifxELba/ah9UlNNXnO
         BXVWVzzx6j9S7294+QI3B6uAjGfFuOu0yHiZAvweTQKDOBjSX4c/1R1uAIrvt0MQCDFk
         sHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AKZO0OAzyyYGtpbwsEj0QOcTH8vqhFRIVBhgV2yDI1g=;
        b=KbkB5DEMqqogJbb5fSEQ7qLlatlr0TMQCFi9llBONq6+61NmZV6rcmnpSpNvdh7Drt
         mpxKeZmhFGBE1xprAY3UE8kk9A39elriAA+9HZczJiym+tj40SOsiwp/H0p3HdnfyZKX
         If9JMDWFSBaMjRyyuKLWbMPaINP6/SQenhdD2rPrGikRMaFkBQdU7xBa48hWbtGphpKw
         kjTfp6B7QDROemct7+aOBmMas5BZuAZ4sqYZMITL16JS+7oHMvMbCiCWrai0ElzKRTS/
         QpWJ+P1D1AxnUZfIlMsrPUNTQoQG2Yeap2GfJBDfS/2OxNPpkm2sCpGtZWNBbxG2FmAq
         yBxg==
X-Gm-Message-State: APjAAAWu1VEqcsg38HMvQuLOOG9+Wsmu9MBBDT3rZbTx0TqC6Ni2NKLw
        c/of7rLXJjWFsJJvaQO3MMMO4EKVv1x4mXLKOWfcsQ==
X-Google-Smtp-Source: APXvYqxsF1/3YJCj6U1j3gN+WttI0zCinM36IFtdfM94pQ8mxyn5ROGK+eMn6Ut7Z3q6li9ZlTIynntWVR/yXJZMrio=
X-Received: by 2002:a9d:344a:: with SMTP id v68mr25496129otb.85.1573553780649;
 Tue, 12 Nov 2019 02:16:20 -0800 (PST)
MIME-Version: 1.0
References: <20191108160747.3274377-1-thierry.reding@gmail.com> <20191108205407.GE23750@amd>
In-Reply-To: <20191108205407.GE23750@amd>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 12 Nov 2019 11:16:10 +0100
Message-ID: <CAMpxmJX0oM3cUQULr8UmKtJ5mGuzSvGeR5jCmo88Q_9+gDXqjA@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: max77620: Fixup debounce delays
To:     Pavel Machek <pavel@denx.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 8 lis 2019 o 21:54 Pavel Machek <pavel@denx.de> napisa=C5=82(a):
>
> On Fri 2019-11-08 17:07:46, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >
> > When converting milliseconds to microseconds in commit fffa6af94894
> > ("gpio: max77620: Use correct unit for debounce times") some ~1 ms gaps
> > were introduced between the various ranges supported by the controller.
> > Fix this by changing the start of each range to the value immediately
> > following the end of the previous range. This way a debounce time of,
> > say 8250 us will translate into 16 ms instead of returning an -EINVAL
> > error.
> >
> > Typically the debounce delay is only ever set through device tree and
> > specified in milliseconds, so we can never really hit this issue becaus=
e
> > debounce times are always a multiple of 1000 us.
> >
> > The only notable exception for this is drivers/mmc/host/mmc-spi.c where
> > the CD GPIO is requested, which passes a 1 us debounce time. According
> > to a comment preceeding that code this should actually be 1 ms (i.e.
> > 1000 us).
> >
> > Reported-by: Pavel Machek <pavel@denx.de>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>
> Thanks for doing this!
>
> Acked-by: Pavel Machek <pavel@denx.de>
>
> And I guess this should be cc: stable, as the commit this fixes was
> making its way there.
>
> Best regards,
>                                                                 Pavel
>
>
> > @@ -198,13 +198,13 @@ static int max77620_gpio_set_debounce(struct max7=
7620_gpio *mgpio,
> >       case 0:
> >               val =3D MAX77620_CNFG_GPIO_DBNC_None;
> >               break;
> > -     case 1000 ... 8000:
> > +     case 1 ... 8000:
> >               val =3D MAX77620_CNFG_GPIO_DBNC_8ms;
> >               break;
> > -     case 9000 ... 16000:
> > +     case 8001 ... 16000:
> >               val =3D MAX77620_CNFG_GPIO_DBNC_16ms;
> >               break;
> > -     case 17000 ... 32000:
> > +     case 16001 ... 32000:
> >               val =3D MAX77620_CNFG_GPIO_DBNC_32ms;
> >               break;
> >       default:
>
> --
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

Applied for fixes and marked for stable.

Thanks
