Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2615C216067
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2020 22:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgGFUk1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jul 2020 16:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgGFUk0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jul 2020 16:40:26 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FDCEC061755
        for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2020 13:40:26 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id z5so18923938pgb.6
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2020 13:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bhIhP55Tu8Q9PiXx14eLZ+yc9Jxsauj5ShBXbtr2VAI=;
        b=Ijmf96HmIoLKBFfHTlBhRzI1pblLyav3TgWTbgcpvJ5mkn38Tv2JxSTB4hVrBMHv8i
         UngrDn5pg72d5iUytnAkebr4zUKq9KVNJDq0orWcWIjrdmqkCBN3v/RN7ICNKf6157aI
         fBtqfeQfq35aRCkYmL+QWEEaRudS7WHWmwFqoSue2WHuzcm4ietGMmI8Kv/b+z4soG87
         zy4Vuy3haj1h6FIxpWu1KulZ3y3FuGFfTJ2sLRfq+6piUTwrtS/hI4cfz+4v3w91dPF3
         gODeeZH2ELyCGJ59cfoWCeuTopr4YzqJLbGF2wCqp2+Yi1qCCLe4b9ABCi7BbPkhwTL/
         WzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bhIhP55Tu8Q9PiXx14eLZ+yc9Jxsauj5ShBXbtr2VAI=;
        b=ObZ1/xj5SqQdrRDeD8sqvoz6vRwV0KbpCBB2s0PJMksSuIR5zSWcMzCGj1WDfPl6ub
         jOweLe3IsBZWJZcbIxcZ6BPfsj3O/cZ5r7ftjrhzhtuTLtO4ukuV1p6En6tDkZXDFzoI
         Ar+q8DKPo5p4UKialZEfojhJWWSJptFh3I+4kg6DRM0uGaqRSBB5XIoUcaXqCqWuaFnz
         5H6ewMiosEXk/K20N4FmfmPCAH8GEbIM5cDgT3fMHMIaNVRF/rvlzNkjVCVljMvv2xD1
         zISIs+Qb+lZy34DsoEsM2WhLWLmJ4hAClIUk2k791ygvfUJa1EWf1KN8biOaXKrBcXzd
         FFKw==
X-Gm-Message-State: AOAM530DUmjSti5j0B0g+Api3fM8ZUbNKxoXMAvckmpHPpL6NIqpC6kD
        5LcJXa4zUmGAAApeJIH6Ghj4Pg==
X-Google-Smtp-Source: ABdhPJzdhNpKncLi2g8/Z+02MU5QSDnw7UG0CHV0rH0caLP/OHoEwJvO6VkXgo97Yz0y1Ae2NXVYDA==
X-Received: by 2002:a62:2641:: with SMTP id m62mr16919890pfm.263.1594068025834;
        Mon, 06 Jul 2020 13:40:25 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 21sm20117865pfu.124.2020.07.06.13.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 13:40:25 -0700 (PDT)
Date:   Mon, 6 Jul 2020 13:38:05 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        LinusW <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH v2] pinctrl: qcom: sc7180: Make gpio28 non wakeup capable
 for google,lazor
Message-ID: <20200706203805.GS388985@builder.lan>
References: <1593762506-32680-1-git-send-email-rnayak@codeaurora.org>
 <CAD=FV=WyhJ6g0DZS=ysT-AyXJoiRX=UFE9fXY2NEHfuUHYUXCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=WyhJ6g0DZS=ysT-AyXJoiRX=UFE9fXY2NEHfuUHYUXCQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 06 Jul 13:24 PDT 2020, Doug Anderson wrote:

> Hi,
> 
> On Fri, Jul 3, 2020 at 12:49 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
> >
> > The PDC irqchip driver currently does not handle dual-edge interrupts,
> > and we have google,lazor board with sc7180 designed to configure gpio28
> > as a dual-edge interrupt. This interrupt is however not expected to be
> > wakeup capable on this board, so an easy way to fix this, seems to be to
> > make this gpio non wakeup capable and let TLMM handle it (which is capable
> > of handling dual-edge irqs)
> >
> > To be able to do so only on this board, so other boards designed with
> > this SoC can continue to use gpio28 as a wakeup capable one, make a
> > copy of msm_gpio_wakeirq_map for lazor and remove gpio28 from the
> > list.
> >
> > Reported-by: Jimmy Cheng-Yi Chiang <cychiang@google.com>
> > Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> > ---
> >  drivers/pinctrl/qcom/pinctrl-sc7180.c | 23 ++++++++++++++++++++++-
> >  1 file changed, 22 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pinctrl/qcom/pinctrl-sc7180.c b/drivers/pinctrl/qcom/pinctrl-sc7180.c
> > index 1b6465a..0668933 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-sc7180.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-sc7180.c
> > @@ -1135,7 +1135,24 @@ static const struct msm_gpio_wakeirq_map sc7180_pdc_map[] = {
> >         {117, 114}, {118, 119},
> >  };
> >
> > -static const struct msm_pinctrl_soc_data sc7180_pinctrl = {
> > +/* Dropped gpio28 from the map for the google,lazor board */
> > +static const struct msm_gpio_wakeirq_map sc7180_lazor_pdc_map[] = {
> > +       {0, 40}, {3, 50}, {4, 42}, {5, 70}, {6, 41}, {9, 35},
> > +       {10, 80}, {11, 51}, {16, 20}, {21, 55}, {22, 90}, {23, 21},
> > +       {24, 61}, {26, 52}, {30, 100}, {31, 33}, {32, 81},
> > +       {33, 62}, {34, 43}, {36, 91}, {37, 53}, {38, 63}, {39, 72},
> > +       {41, 101}, {42, 7}, {43, 34}, {45, 73}, {47, 82}, {49, 17},
> > +       {52, 109}, {53, 102}, {55, 92}, {56, 56}, {57, 57}, {58, 83},
> > +       {59, 37}, {62, 110}, {63, 111}, {64, 74}, {65, 44}, {66, 93},
> > +       {67, 58}, {68, 112}, {69, 32}, {70, 54}, {72, 59}, {73, 64},
> > +       {74, 71}, {78, 31}, {82, 30}, {85, 103}, {86, 38}, {87, 39},
> > +       {88, 45}, {89, 46}, {90, 47}, {91, 48}, {92, 60}, {93, 49},
> > +       {94, 84}, {95, 94}, {98, 65}, {101, 66}, {104, 67}, {109, 104},
> > +       {110, 68}, {113, 69}, {114, 113}, {115, 108}, {116, 121},
> > +       {117, 114}, {118, 119},
> > +};
> > +
> > +static struct msm_pinctrl_soc_data sc7180_pinctrl = {
> >         .pins = sc7180_pins,
> >         .npins = ARRAY_SIZE(sc7180_pins),
> >         .functions = sc7180_functions,
> > @@ -1151,6 +1168,10 @@ static const struct msm_pinctrl_soc_data sc7180_pinctrl = {
> >
> >  static int sc7180_pinctrl_probe(struct platform_device *pdev)
> >  {
> > +       if (of_machine_is_compatible("google,lazor")) {
> > +               sc7180_pinctrl.wakeirq_map = sc7180_lazor_pdc_map;
> > +               sc7180_pinctrl.nwakeirq_map = ARRAY_SIZE(sc7180_lazor_pdc_map);
> > +       }
> 
> As much as I want patches landed and things working, the above just
> doesn't feel like a viable solution.  I guess it could work as a short
> term hack but it's going to become untenable pretty quickly.

I second that.

> As we
> have more variants of this we're going to have to just keep piling
> more machines in here, right?  ...this is also already broken for us
> because not all boards will have the "google,lazor" compatible.  From
> the current Chrome OS here are the compatibles for various revs/SKUs
> 
> compatible = "google,lazor-rev0", "qcom,sc7180";
> compatible = "google,lazor-rev0-sku0", "qcom,sc7180";
> compatible = "google,lazor", "qcom,sc7180";
> compatible = "google,lazor-sku0", "qcom,sc7180";
> compatible = "google,lazor-rev2", "qcom,sc7180";
> 
> ...so of the 5 boards you'll only match one of them.
> 
> 
> Maybe I'm jumping into a situation again where I'm ignorant since I
> haven't followed all the prior conversation, but is it really that
> hard to just add dual edge support to the PDC irqchip driver?  ...or
> maybe it's just easier to change the pinctrl driver to emulate dual
> edge itself and that can work around the problem in the PDC?  There
> seem to be a few samples you could copy from:
> 
> $ git log --oneline --no-merges --grep=emulate drivers/pinctrl/
> 3221f40b7631 pinctrl: mediatek: emulate GPIO interrupt on both-edges
> 5a92750133ff pinctrl: rockchip: emulate both edge triggered interrupts
> 

pinctrl-msm already supports emulating dual edge, but my understanding
was that the problem lies in that somehow this emulation would have to
be tied to or affect the PDC driver?

Regards,
Bjorn

> ...and if you look at those two commits they refer to other examples.
> The mediatek one says:
> 
> > This follows an example of drivers/gpio/gpio-mxc.c.
> 
> ...and the Rockchip one says:
> 
> > implement a solution similar to pinctrl-coh901
> 
> That means you have at least 4 samples to look at?
> 
> 
> -Doug
