Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C80402F87C6
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 22:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbhAOVlD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jan 2021 16:41:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbhAOVlD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jan 2021 16:41:03 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4AF3C061757
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 13:40:22 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id e9so1211007plh.3
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 13:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=n0vrgI0v5AqdqRBlnR2zrY3ADnVU6Fc4aa8ej4oQxWI=;
        b=ikcuoSYxk+o95pgvXIejJia6Wa7r/h9H62sZs/9Cpe0sUYFhlD4wlTCAyWvkqgnFeR
         b7uz4pJ+VSk13U7/kgu/HN1fbjzCSiL1Fr0tHbBdEWI44HuPCaufm4EjQCvtNWcFY6+/
         h95/5c9l7eYKlBEOHbNdaa2yfxd3eC8jF8lwQpuB1SvDRSoI2oxkC+6E8vKloU9c86LN
         IuNA0+P1JPndHgec5mX3JNo4ycRIS4mRaYQDTuy9Zq2PWmpA0bgKE+73iqWJ1AIXZ/J7
         6pMr0mOQacx5TQxTFcRF6X8aapFgYLuxV1FzvvJ7e/IztP5mDs0dHeu+8yUz7dw4VE2m
         TDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n0vrgI0v5AqdqRBlnR2zrY3ADnVU6Fc4aa8ej4oQxWI=;
        b=ggSyzN0iTe/Q9le00z2QQdZZ29An4sr6MVcs6RDkEkI53dGOywB+wNUA9EAcsvlLIl
         zSNaFRUA4eCzvZc7k+lvrxsJ2s6vlzn/gjetP/r5EBrIDn4ZrREeflcNpazWp4TnGH95
         u4Er5Iob+jD1tZvQK6nhJhL2f5Lq+mNq0leJmp3sFe9QP/tfA5tQ59VipChiEoz/NoHY
         XpFHqzMCJbfyJBqbdH09zoFBE25ihGL1F6mrCbOGJ6WhgwbFJDH4Yh+Q/+9THkVkn3vC
         ov1oekJ+4NxAXvZJlp6NNYAC7jAyAAPA09pRGyG1q0SbqVXKymfci49e1nbTI5sQhWcg
         T+Dw==
X-Gm-Message-State: AOAM531EI3ae1bn13agYHXjY5A4DpyK/YokDg06Xigwutm+xUGHq+KAw
        4/bGccWPnomMdrtj6Opr0fHMkg==
X-Google-Smtp-Source: ABdhPJyON92K2TmcPW2QR85yuolP22tM0R4t7l3u4HZpjfPFf8vlelLyS2GSnGt/ynZIDrLg6P8b7Q==
X-Received: by 2002:a17:902:8216:b029:dc:1e79:e74c with SMTP id x22-20020a1709028216b02900dc1e79e74cmr14532231pln.5.1610746821003;
        Fri, 15 Jan 2021 13:40:21 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:1a90:2b4:7e34:6b31])
        by smtp.gmail.com with ESMTPSA id e5sm8744463pfc.76.2021.01.15.13.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 13:40:20 -0800 (PST)
Date:   Fri, 15 Jan 2021 13:40:18 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Emmanuel Vadot <manu@bidouilliste.com>
Cc:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org, bcousson@baylibre.com,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH v4 2/2] ARM: dts: am33xx-l4: change #pinctrl-cells from 1
 to 2
Message-ID: <20210115214018.GA554007@x1>
References: <20200701013320.130441-1-drew@beagleboard.org>
 <20200701013320.130441-3-drew@beagleboard.org>
 <20210115190201.9273b637a7f967e7e55bc740@bidouilliste.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115190201.9273b637a7f967e7e55bc740@bidouilliste.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 15, 2021 at 07:02:01PM +0100, Emmanuel Vadot wrote:
> 
>  Hello Drew,
> 
> On Wed,  1 Jul 2020 03:33:20 +0200
> Drew Fustini <drew@beagleboard.org> wrote:
> 
> > Increase #pinctrl-cells to 2 so that mux and conf be kept separate. This
> > requires the AM33XX_PADCONF macro in omap.h to also be modified to keep pin
> > conf and pin mux values separate.
> > 
> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> > ---
> >  arch/arm/boot/dts/am33xx-l4.dtsi   | 2 +-
> >  include/dt-bindings/pinctrl/omap.h | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
> > index a9cbefc80c0c..3141590e5889 100644
> > --- a/arch/arm/boot/dts/am33xx-l4.dtsi
> > +++ b/arch/arm/boot/dts/am33xx-l4.dtsi
> > @@ -278,7 +278,7 @@ scm: scm@0 {
> >  				am33xx_pinmux: pinmux@800 {
> >  					compatible = "pinctrl-single";
> >  					reg = <0x800 0x238>;
> > -					#pinctrl-cells = <1>;
> > +					#pinctrl-cells = <2>;
> >  					pinctrl-single,register-width = <32>;
> >  					pinctrl-single,function-mask = <0x7f>;
> >  				};
> > diff --git a/include/dt-bindings/pinctrl/omap.h b/include/dt-bindings/pinctrl/omap.h
> > index 625718042413..2d2a8c737822 100644
> > --- a/include/dt-bindings/pinctrl/omap.h
> > +++ b/include/dt-bindings/pinctrl/omap.h
> > @@ -65,7 +65,7 @@
> >  #define DM814X_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
> >  #define DM816X_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
> >  #define AM33XX_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
> > -#define AM33XX_PADCONF(pa, dir, mux)	OMAP_IOPAD_OFFSET((pa), 0x0800) ((dir) | (mux))
> > +#define AM33XX_PADCONF(pa, conf, mux)	OMAP_IOPAD_OFFSET((pa), 0x0800) (conf) (mux)
> >  
> >  /*
> >   * Macros to allow using the offset from the padconf physical address
> > -- 
> > 2.25.1
> 
>  Based on the bindings doc a value of 2 is only acceptable if one uses
> pinctrl-single,bits but all the am33xx pins still uses
> pinctrl-single,pins.
>  I noticed this because this breaks FreeBSD when I tried with 5.9 dts.
> 
> -- 
> Emmanuel Vadot <manu@bidouilliste.com> <manu@freebsd.org>

Hello Emmanuel,

Sorry to hear about that. This change was made based on discussion with
Tony Lindgren this past July. Trent Piepho later pointed out issues wtih
the change including the binding documentation. I had tried to fix
the documentation in September [1]. However, I notice that it seems I
missed changing the lines near the top of pinctrl-single.txt [2]:

- #pinctrl-cells : number of cells in addition to the index, set to 1
  for pinctrl-single,pins and 2 for pinctrl-single,bits

I am thinking that should be re-written as:

- #pinctrl-cells : number of cells in addition to the index, this value
  can be 1 or 2 for pinctrl-single,pins and must be 2 for pinctrl-single,bits

Tony - what do you think?


Thanks,
Drew

[1] https://lore.kernel.org/linux-gpio/20200919200836.3218536-1-drew@beagleboard.org/
[2] https://www.kernel.org/doc/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
