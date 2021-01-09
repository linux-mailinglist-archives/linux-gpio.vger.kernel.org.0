Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0262EFD39
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Jan 2021 03:56:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbhAIC4L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 21:56:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbhAIC4L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2021 21:56:11 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D904FC061574
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jan 2021 18:55:30 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id h186so7470213pfe.0
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jan 2021 18:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TUzLqzrIbeKn1iK3l0qX+oFr1IynsI7UY/+8rZs+HX4=;
        b=JyzPxpSdJv0KOyDbr8RGFVgkXV1GlX1pklOiPJ+YT8+luX7MR008zCFB0Hsyq3oTBc
         wN4uOmKyh9i/PCKnMSR+8/3dIFij9bR07OyXxLYZq3m9EP0qCChaDeGNDhwd90sYodEI
         cldI38UCMn5V6391YhMRomxbW3t1zH9vR6fzI5E3eUGKMs+fyTLkPMOFmIepS6/qHJu2
         Eclsgvl13ISWTT0HW1cRq7jbtLrJ4KKTb8CrSwmPkKvqZtoL29HjdJe1owxpTFmTx0Ag
         +Pujmdl6T0o42fAaIhK/3By+r5RHxK+4xSp0/ZTwGUGTSn9Aash6LxB6LtlQgPhEb0z2
         Vcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TUzLqzrIbeKn1iK3l0qX+oFr1IynsI7UY/+8rZs+HX4=;
        b=aHPJoAzZpKZLxyNvIqpYh9/SIgU8OuSrjNS6wrp2/GGxvRvy69x1Ap+xZuADA5BoO6
         7bf1D7O/3HRokspLq9PF5vHIkzCbjvg0yU8kV2EBIdRw7pjHpkEN7X915vpSrMLqR/vV
         M51P7Lk12jXuhpQ091WX0kYMUcgM1I0Csg76TMc7gvTqsACcjcrOMtVitbo/ZrK11YNT
         mBb5tSbBOjp1q5B2nzVcem+A1HwEkiSxW7E0esOoWdeZQPg9wItF9/lp/a1MGnTg88oS
         uu+iTYBcL5Y1IJoroYnJxl9cEX+WhGW8wbSpiUWZ8k8CrF/8JzZ/ZGrtyr/gPIAARm2Q
         BjaQ==
X-Gm-Message-State: AOAM531vuQ/um36mHx+Ofwytj04z+qnzZWsFd3Lp9c5uyQDHdIC0OBsy
        locyDigVwnPCqzd0U0JPlKnEBA==
X-Google-Smtp-Source: ABdhPJyEGwtUurgXBRIR8/gHJLxkX2ZSh+KCDBW2TGb3KphTJRtKoFziT4s1F7wpUoxrENjd0wHiNA==
X-Received: by 2002:aa7:8811:0:b029:1ab:9e4f:b8ea with SMTP id c17-20020aa788110000b02901ab9e4fb8eamr6520393pfo.78.1610160930213;
        Fri, 08 Jan 2021 18:55:30 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:f802:65f8:ffba:15a9])
        by smtp.gmail.com with ESMTPSA id v3sm9819831pjn.7.2021.01.08.18.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 18:55:29 -0800 (PST)
Date:   Fri, 8 Jan 2021 18:55:27 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Pantelis Antoniou <pantelis.antoniou@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@gmail.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [RFC PATCH v2] pinctrl: add helper to expose pinctrl state in
 debugfs
Message-ID: <20210109025527.GA2918377@x1>
References: <20201218045134.4158709-1-drew@beagleboard.org>
 <CAHp75Vfwb+f3k2+mAj+jB=XsKFX-hCxx61A_PCmwz6y-YKHMcg@mail.gmail.com>
 <20201224203603.GA59600@x1>
 <CACRpkdb9RnGJbct+D-88JPDSbaVp1XS8vjhhHYosy20EPkLjaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdb9RnGJbct+D-88JPDSbaVp1XS8vjhhHYosy20EPkLjaw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 09, 2021 at 02:22:07AM +0100, Linus Walleij wrote:
> Hi Drew,
> 
> sorry for belated review. The approach is so uncommon so it had me
> confused.
> 
> On Thu, Dec 24, 2020 at 9:36 PM Drew Fustini <drew@beagleboard.org> wrote:
> 
> > > > I used the compatible string "pinctrl,state-helper" but would appreciate
> > > > advice on how to best name this. Should I create a new vendor prefix?
> > >
> > > Here is the first concern. Why does this require to be a driver with a
> > > compatible string?
> >
> > I have not been able to figure out how to have different active pinctrl
> > states for each header pins (for example P2 header pin 3) unless they
> > are represented as DT nodes with their own compatible for this helper
> > driver such as:
> >
> > &ocp {
> >         P2_03_pinmux {
> >                 compatible = "pinctrl,state-helper";
> >                 pinctrl-names = "default", "gpio", "gpio_pu", "gpio_pd", "gpio_input", "pwm";
> >                 pinctrl-0 = <&P2_03_default_pin>;
> >                 pinctrl-1 = <&P2_03_gpio_pin>;
> >                 pinctrl-2 = <&P2_03_gpio_pu_pin>;
> >                 pinctrl-3 = <&P2_03_gpio_pd_pin>;
> >                 pinctrl-4 = <&P2_03_gpio_input_pin>;
> >                 pinctrl-5 = <&P2_03_pwm_pin>;
> >         };
> > }
> 
> I do not think the DT people are going to appreciate this pseudo-device.

Thank you for reviewing and commenting.

It is does seem like creating a platform device for each header pin and
binding to this proposed helper driver is not the correct approach.
 
> Can you not just represent them as pin control hogs and have the debugfs
> code with the other debugfs code in drivers/pinctrl/core.c?

I tried defining pinctrl states in the am33xx_pinmux DT node (which has 
compatible "pinctrl-single").  It does work to have default state
defined for pins.  However, I was not sure how represent having
different states active for independent header pins.

Instead of DT binds, maybe I need to use PIN_MAP_MUX_GROUP_HOG_DEFAULT()
in pinctrl-single code?

> 
> Normal drivers cannot play around with the state assigned to a
> hog, but debugfs can certainly do that so go ahead and patch
> the core.

Is there an existing debugfs file that you think would be appropriate to
allow the state of a hog to be changed?
 
> > I can assign pinctrl states in the pin controller DT node which has
> > compatible pinctrl-single (line 301 arch/arm/boot/dts/am33xx-l4.dtsi):
> >
> > &am33xx_pinmux {
> >
> >         pinctrl-names = "default", "gpio", "pwm";
> >         pinctrl-0 =   < &P2_03_default_pin &P1_34_default_pin &P2_19_default_pin &P2_24_default_pin
> >                         &P2_33_default_pin &P2_22_default_pin &P2_18_default_pin &P2_10_default_pin
> >                         &P2_06_default_pin &P2_04_default_pin &P2_02_default_pin &P2_08_default_pin
> >                         &P2_17_default_pin >;
> >         pinctrl-1 =   < &P2_03_gpio_pin &P1_34_gpio_pin &P2_19_gpio_pin &P2_24_gpio_pin
> >                         &P2_33_gpio_pin &P2_22_gpio_pin &P2_18_gpio_pin &P2_10_gpio_pin
> >                         &P2_06_gpio_pin &P2_04_gpio_pin &P2_02_gpio_pin &P2_08_gpio_pin
> >                         &P2_17_gpio_pin >;
> >         pinctrl-2 =   < &P2_03_pwm &P1_34_pwm &P2_19_pwm &P2_24_pwm
> >                         &P2_33_pwm &P2_22_pwm &P2_18_pwm &P2_10_pwm
> >                         &P2_06_pwm &P2_04_pwm &P2_02_pwm &P2_08_pwm
> >                         &P2_17_pwm >;
> >
> > }
> >
> > However, there is no way to later select "gpio" for P2.03 and select
> > "pwm" for P1.34 at the same time.  Thus, I can not figure out a way to
> > select independent states per pin unless I make a node for each pin that
> > binds to a helper driver.
> >
> > It feels like there may be a simpler soluation but I can't see to figure
> > it out.  Suggestions welcome!
> 
> I think maybe there is no solution because you are solving a problem
> that only pinctrl-single while trying to stay generic? The single
> driver is special in that it requires all states of pins to be encoded
> into the device tree, but for debugging that is kind of unfriendly
> which was mentioned in its inception. For deep debugging it is good
> to let the core know of all available functions and groups and
> single does not IIUC.
> 
> Yours,
> Linus Walleij

I discussed my use case and this patch on #armlinux earlier this week
and Alexandre Belloni suggested looking at the pinmux-pins debugfs file.

This made me think that a possible solution could be to define a store
function for pinmux-pins to handle something like "<pin#> <function#>".
I believe the ability to activate a pin function (or pin group) from
userspace would satisfy our beagleboard.org use-case.

Does that seem like a reasonable approach?

Thank you!
Drew

