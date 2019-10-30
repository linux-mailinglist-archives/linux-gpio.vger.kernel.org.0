Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F110E9C1E
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 14:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbfJ3NPf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 09:15:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:38322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726175AbfJ3NPf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Oct 2019 09:15:35 -0400
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 70214208C0;
        Wed, 30 Oct 2019 13:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572441334;
        bh=ZQ8wXuUMbmLF+7iLilvz7470uxzp4fCYgdwJ46q8UDw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=CjVGGXICTSUHgFntIBYl9dCBlQYAW+MolJ+bc1cEfg4Qk0KN9at+PlKX7SqdVumfF
         k6zoOIVFcoxtZDQlEjFYfxgQ7E/uHptP/kZPhdNoHmjchsJyUkLWmdV0o06LoHfmfi
         O6nYN/6WmOpqvJL9mz+aHTeYX2sAX0D96pdDA894=
Received: by mail-qk1-f177.google.com with SMTP id e66so2580432qkf.13;
        Wed, 30 Oct 2019 06:15:34 -0700 (PDT)
X-Gm-Message-State: APjAAAVW3tIx6CBaIP0xy506WTxDFB9MjoPwBz5CNLLoDv/wYA2TfMcR
        lhaCrvVseao7a4Q4NWnEr541gYoQdALSzXz0xA==
X-Google-Smtp-Source: APXvYqzQvkLpQpCNPJ6YqCXaJT5G04cRDIA6M11aMboAC3ocOQCkAOlN1aYPsgHKxhNaEZf9dV/Q6BaiEbwVRcswYl0=
X-Received: by 2002:a05:620a:226:: with SMTP id u6mr21719746qkm.393.1572441333508;
 Wed, 30 Oct 2019 06:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <20191024172234.5267-1-codrin.ciubotariu@microchip.com>
 <20191029213757.GA8829@bogus> <20191030085305.uwrt5g3mmbwthwms@M43218.corp.atmel.com>
In-Reply-To: <20191030085305.uwrt5g3mmbwthwms@M43218.corp.atmel.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 30 Oct 2019 08:15:22 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLuPb357uaiyR3N0QOBkcfXOAm57VbWbhaC=90aFmUVkg@mail.gmail.com>
Message-ID: <CAL_JsqLuPb357uaiyR3N0QOBkcfXOAm57VbWbhaC=90aFmUVkg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: at91: Enable slewrate by default on SAM9X60
To:     Ludovic Desroches <ludovic.desroches@microchip.com>
Cc:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 30, 2019 at 3:53 AM Ludovic Desroches
<ludovic.desroches@microchip.com> wrote:
>
> On Tue, Oct 29, 2019 at 04:37:57PM -0500, Rob Herring wrote:
> > On Thu, Oct 24, 2019 at 08:22:34PM +0300, Codrin Ciubotariu wrote:
> > > On SAM9X60, slewrate should be enabled on pins with a switching frequency
> > > below 50Mhz. Since most of our pins do not exceed this value, we enable
> > > slewrate by default. Pins with a switching value that exceeds 50Mhz will
> > > have to explicitly disable slewrate.
> > >
> > > Suggested-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> > > Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> > > ---
> > >  drivers/pinctrl/pinctrl-at91.c     | 4 ++--
> > >  include/dt-bindings/pinctrl/at91.h | 4 ++--
> > >  2 files changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
> > > index 117075b5798f..c135149e84e9 100644
> > > --- a/drivers/pinctrl/pinctrl-at91.c
> > > +++ b/drivers/pinctrl/pinctrl-at91.c
> > > @@ -85,8 +85,8 @@ enum drive_strength_bit {
> > >                                      DRIVE_STRENGTH_SHIFT)
> > >
> > >  enum slewrate_bit {
> > > -   SLEWRATE_BIT_DIS,
> > >     SLEWRATE_BIT_ENA,
> > > +   SLEWRATE_BIT_DIS,
> > >  };
> > >
> > >  #define SLEWRATE_BIT_MSK(name)             (SLEWRATE_BIT_##name << SLEWRATE_SHIFT)
> > > @@ -669,7 +669,7 @@ static void at91_mux_sam9x60_set_slewrate(void __iomem *pio, unsigned pin,
> > >  {
> > >     unsigned int tmp;
> > >
> > > -   if (setting < SLEWRATE_BIT_DIS || setting > SLEWRATE_BIT_ENA)
> > > +   if (setting < SLEWRATE_BIT_ENA || setting > SLEWRATE_BIT_DIS)
> > >             return;
> > >
> > >     tmp = readl_relaxed(pio + SAM9X60_PIO_SLEWR);
> > > diff --git a/include/dt-bindings/pinctrl/at91.h b/include/dt-bindings/pinctrl/at91.h
> > > index 3831f91fb3ba..e8e117306b1b 100644
> > > --- a/include/dt-bindings/pinctrl/at91.h
> > > +++ b/include/dt-bindings/pinctrl/at91.h
> > > @@ -27,8 +27,8 @@
> > >  #define AT91_PINCTRL_DRIVE_STRENGTH_MED                    (0x2 << 5)
> > >  #define AT91_PINCTRL_DRIVE_STRENGTH_HI                     (0x3 << 5)
> > >
> > > -#define AT91_PINCTRL_SLEWRATE_DIS  (0x0 << 9)
> > > -#define AT91_PINCTRL_SLEWRATE_ENA  (0x1 << 9)
> > > +#define AT91_PINCTRL_SLEWRATE_ENA  (0x0 << 9)
> > > +#define AT91_PINCTRL_SLEWRATE_DIS  (0x1 << 9)
> >
> > This is an ABI. You can't just change the definition.
>
> There is no DT using these definitions. They have been introduced for our new
> SoC but its DT is not submitted yet. I assume it's not too late to do this
> change as nothing will be broken.

Okay, then state this in the commit message.

Rob
