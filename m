Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9CD27E537
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 11:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgI3Jez (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 05:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgI3Jez (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 05:34:55 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C5B9C061755;
        Wed, 30 Sep 2020 02:34:51 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id u21so1829309eja.2;
        Wed, 30 Sep 2020 02:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SCCYkYfYtW5E9Rx6MAaRAxrGhWQZ+TN+Dq6KSYjTzGA=;
        b=iZpgmT2VeH838cljOznN2+0NINICvmcpBEP4SriV1pwNO6FXRyMGX9rd76dqz3DGI0
         9eMYYJ/QIKJjriskj95GCcitq7udFYy0L/hrayCLvEExrIUtFIAB4xBbJdk7UTSqvBf4
         q/0LG8Uleix/80eKoqFBf2ltOViEjeKXo3ow7RURQLKv3HYcttwrW9iFst7mRuaw/4Qy
         KpaWgphFpLoaxwhach3Jew8UNSfayI6xwypKtOyy364AS/X/EEDYqO9zfRu7PoNxYwZR
         Orif5R8/sOpS7ldYtE2oTPQQltQjrM3xZlfJrei5AK16Bpxt5+7GnTnkAX2VuPbKrUub
         D0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SCCYkYfYtW5E9Rx6MAaRAxrGhWQZ+TN+Dq6KSYjTzGA=;
        b=C369LevB93NTZ9XmXCy48gc36Fq0q9rVTFHsz3a7vK99i1TnNyEEGWEqfo69myOTfJ
         RMEc68C36TlMDRk28wxZALuVNN7iRxqd9RqayQKvD/9BoElHuxJyAD0p/b4id8ObCWnL
         KPOhflYyYvE0NT5vBU02kj/mHiBNT9Aws6ndriZTudIuvPw7mc0EA0mX2pvaxfEU53aH
         97EjSPtkDhW+VJB8xro5YAS09blmhF6Nq++DuTe1jDZZ8Ct9xW1VjDv+mpI9ATiR1Qkj
         DoQkLPEpRfkFbeiSZkF7jTRXMVhMDXu83lVOmhSuUFc2Pz5+Um4TGfMtLt2shwiCvxyJ
         E0hw==
X-Gm-Message-State: AOAM532ERuc8z7WVdnmHnSqh+KB55DkH4zCwaY0IdzSlMCss/oEFJDD+
        CIR+sgDerwJjIITRr0R30qAuL26dWvdnLDNPE0k=
X-Google-Smtp-Source: ABdhPJyXdTfnIZ3JK3JeMbh1E1vPJEJx+YwOdVLxPLq3biMZ58SNSne3ibNSjnwn2Om4l0BodUrkJWXGgOJOuDGZu/k=
X-Received: by 2002:a17:907:20d0:: with SMTP id qq16mr1761463ejb.65.1601458489815;
 Wed, 30 Sep 2020 02:34:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200923065755.GR7101@atomide.com> <CA+7tXigeNhQQVuAu0toZrvBKvMYkDU-8EWTpJR29HLTAMgoOBA@mail.gmail.com>
 <20200924054324.GB9471@atomide.com> <CA+7tXigg+h3v61AVMaYRKa_ZwznehOUPEESMqXKsNDNCrFph3w@mail.gmail.com>
 <20200924060645.GD9471@atomide.com> <CA+7tXijkS8UMFk4t=DuKjZZNnThbRarPQvxwxjg-uJFTKJRsXA@mail.gmail.com>
 <20200924070443.GF9471@atomide.com> <CA+7tXihBdw9AOGL7Hp2cH9+ii8fUXaaZZDUP3icyeOkMuGm4qA@mail.gmail.com>
 <20200930051521.GN9471@atomide.com> <CA+7tXig=3hbFXfmYMC5Hd1Zc2n-6uGXbMePPw_Cr4bOsyt7QQA@mail.gmail.com>
 <20200930091526.GQ9471@atomide.com>
In-Reply-To: <20200930091526.GQ9471@atomide.com>
From:   Trent Piepho <tpiepho@gmail.com>
Date:   Wed, 30 Sep 2020 02:34:38 -0700
Message-ID: <CA+7tXihYb6AHrQLpO9UDHV7YFbzo_Pm8EdXNJXX+tJXX-L6UYA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: document pinctrl-single,pins when
 #pinctrl-cells = 2
To:     Tony Lindgren <tony@atomide.com>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Christina Quast <cquast@hanoverdisplays.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 30, 2020 at 2:15 AM Tony Lindgren <tony@atomide.com> wrote:
>
> * Trent Piepho <tpiepho@gmail.com> [200930 08:35]:
> > The closest thing would be the generic pin config type bindings, which
> > go in the pinctrl driver's nodes, and look like this:
> > &am335x_pinmux {
> >     pinctrl_yoyo_reset: yoyogrp {
> >         pins = "foo";
> >         function = "gpio";
> >         bias-pull-up;
> >     };
> > };
>
> There's a bit of a dtb size and boot time issue for adding properties
> for each pin where that needs to be done for several hundred pins :)

pins is list, multiple pins can be specified at once.  Otherwise the
property name would be "pin" and not "pins"  There's also a groups
property to refer to multiple pins at once, e.g.

arch/mips/boot/dts/ingenic/ci20.dts-    pins_mmc1: mmc1 {
arch/mips/boot/dts/ingenic/ci20.dts-            function = "mmc1";
arch/mips/boot/dts/ingenic/ci20.dts:            groups =
"mmc1-1bit-d", "mmc1-4bit-d";
arch/mips/boot/dts/ingenic/ci20.dts-            bias-disable;
arch/mips/boot/dts/ingenic/ci20.dts-    };

arch/mips/boot/dts/pic32/pic32mzda_sk.dts-      user_leds_s0: user_leds_s0 {
arch/mips/boot/dts/pic32/pic32mzda_sk.dts:              pins = "H0", "H1", "H2";
arch/mips/boot/dts/pic32/pic32mzda_sk.dts-              output-low;
arch/mips/boot/dts/pic32/pic32mzda_sk.dts-              microchip,digital;
arch/mips/boot/dts/pic32/pic32mzda_sk.dts-      };

> > Is "some additional property for specifying generic conf flags"
> > different from the existing pinctrl-single,bias-pullup, etc.
> > properties?  Because splitting the data cell into two parts doesn't
> > make any difference to those.
>
> So with an interrupt style binding with generic pinconf flags we can
> leave out the parsing of multiple properties for each pin. Sure the
> pin is only referenced by the controller like you pointed out but the
> pinconf flags could be generic.

Where do these flags go?  In pinctrl-single,pins?  Like:

pinctrl-single,pins = <AM335X_PIN_MDC MUX_MODE7 PIN_INPUT_PULLUP>;

But PIN_INPUT_PULLUP is a generic flag?  Which is translated into the
proper value by??

Or are you talking about replacing the existing pinctrl-0,
pinctrl-names properties with a totally different system that looks
more like gpio and interrupt handles?
