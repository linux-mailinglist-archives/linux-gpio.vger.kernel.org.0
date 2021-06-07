Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D07CF39E916
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 23:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbhFGVYc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 17:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230394AbhFGVYc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 17:24:32 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC00C061574
        for <linux-gpio@vger.kernel.org>; Mon,  7 Jun 2021 14:22:40 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id w127so19468219oig.12
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jun 2021 14:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w6cymmwnuygy/COmkDxXiw8w0MLPT3SB23LZKuJIhqk=;
        b=Imw57YSTwplWKEaH2jMh6y9gjQOKM8C1ctxHYEQ4dx59CFGUQ1ETLCB1TpAKziLjwt
         a0i4CTX50+J9bvQdiQKTP7+RxQ4AbFp5UGPNgoOyW1WPlhMuuTP+ythNexcFfqigCdUp
         A8VqriRQAwEurYZ+P/KtbMwxGC4UUy3jZUGdydWEBQNfk/1qSx2vxv886TtRRN3tuCbY
         ERaBsHn+VcrwzET8xcvKm6k1a5vlk85NgZhckQ8VWlzBq5j6gfKukSm8+wVsOG8Advq0
         HwD1RnVxQ+XmmD572VlV/Kr3MZtY2KCI37jpWNU95JdLcW332f/+KXdwb7GBOpQ+k+fS
         cQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w6cymmwnuygy/COmkDxXiw8w0MLPT3SB23LZKuJIhqk=;
        b=Y9NjCr5oFztlFslUPGCFNdYKl0XyUp8CYTWpFYvrRpcR8Dg4pAAKyG9IklwGFvSsho
         DswgQLefjxfR2W2+pLuDpycc4+bOLSSN3ETmZJvh5vkq2V781kgg9dgiUUtjtx9I9KrL
         99OoN+rqov5BhXBWe1J+l+mBgSi0IrQMv/xxZHbcw+8o9R1PYqatlrqooq2gsrlJt3CV
         BOID4+7eMKFZWDj1xJxyLgH4uuYu2JEHPxCVnQ505+zReTUUwemHTLEUymMp8xnpvg8A
         A03h5Wm0LhrOgU7DjsyZ+nHlIHUBdxK4eIMY9vqiCsaPpONLf21a6Q/RSPpTznPzE5KU
         betw==
X-Gm-Message-State: AOAM530V8ufZRzd4HjI6oHcvIp5yIljK13JZHMSSkeG9kCNrDqWGh75M
        h1isk8ZPHyl+P/We9aT2VZ/d4RYL5yllWU0241TdaA==
X-Google-Smtp-Source: ABdhPJzVFi4ifcs3tEOiN3F0lwd561XWqjtWfo2MVoHwh8/TETf0Auy+GPFCcuTowEovcpU5FdnKuZ9hUIPCM2+C734=
X-Received: by 2002:a05:6808:f0b:: with SMTP id m11mr675937oiw.12.1623100959866;
 Mon, 07 Jun 2021 14:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
 <20210607113840.15435-9-bhupesh.sharma@linaro.org> <YL45uRr6+Q3jvPrO@vkoul-mobl>
In-Reply-To: <YL45uRr6+Q3jvPrO@vkoul-mobl>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Tue, 8 Jun 2021 02:52:28 +0530
Message-ID: <CAH=2NtwhYpyHUB0ON6-MZP6PUA6CHwEsvwFhcUewdXo-Nqgo+A@mail.gmail.com>
Subject: Re: [PATCH 8/8] arm64: dts: qcom: sa8155p-adp: Add base dts file
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        bhupesh.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Vinod,

Thanks for your review.

On Mon, 7 Jun 2021 at 20:52, Vinod Koul <vkoul@kernel.org> wrote:
>
> On 07-06-21, 17:08, Bhupesh Sharma wrote:
> > Add base DTS file for sa8155p-adp and enable boot to console,
> > tlmm reserved range and also include pmic file(s).
>
> I see ufs added too, pls mention that as well

Oops, missed that. Will fix it in v2.

>  --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -71,6 +71,7 @@ dtb-$(CONFIG_ARCH_QCOM)     += sdm845-xiaomi-beryllium.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sdm850-lenovo-yoga-c630.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sm8150-hdk.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sm8150-mtp.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)      += sa8155p-adp.dtb
>
> I think this should go before sdm..

Oh, ok, I thought of keeping all boards based on sm8150 SoC together.
But alphabetically, it makes more sense to put it earlier.

> > +             vdd_usb_hs_core:
> > +             vdda_pll_hv_cc_ebi01:
> > +             vdda_pll_hv_cc_ebi23:
> > +             vdda_ufs_2ln_core:
> > +             vdda_ufs_2ln_core:
> > +             vdda_usb_ss_core:
> > +             vdda_usb_ss_dp_core_1:
> > +             vdda_usb_ss_dp_core_2:
> > +             vdda_sp_sensor:
> > +             vdda_qlink_lv:
> > +             vdda_qlink_lv_ck:
> > +             vdda_qrefs_0p875_5:
>
> I didnt find these labels very useful, so maybe remove?
> It helped me to understand that a regulator is vreg_l5a_0p88 as it
> implies I am using l5a with 0p88V :)

While a few labels like 'vdd_usb_hs_core' are used in this patch (for
example) to denote 'vdda-pll-supply ' of 'usb_1_hsphy', the others
would be required as we enable further on-boards peripherals in the
dts.

I will recheck and limit these further in v2.

> > +             vreg_l5a_0p88: ldo5 {
> > +                     regulator-min-microvolt = <880000>;
> > +                     regulator-max-microvolt = <880000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>
> Pls do add regulator-name property, it helps in understanding which ldo
> in logs/debugfs, otherwise ldo5 will comes for both pmics

That's a good point. Will fix this in v2.

Regards,
Bhupesh

> --
> ~Vinod
