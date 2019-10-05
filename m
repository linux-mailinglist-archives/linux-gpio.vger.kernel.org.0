Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A436CC90C
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 11:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727480AbfJEJTu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Oct 2019 05:19:50 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55545 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbfJEJTu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Oct 2019 05:19:50 -0400
Received: by mail-wm1-f67.google.com with SMTP id a6so7948327wma.5;
        Sat, 05 Oct 2019 02:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yvIRA62tf+Id/1C1Iw9pWjY61unNIlcfEnBQ+FsDC9I=;
        b=SD25cdX2nkZyVjKM8hZcX4l8pxfctJxVJUlwVM6fCHB1wE/QVLmtgKna86JVgJZMyZ
         WnBh16+K76LYEvhvUlMq1Ggs1kdW8NMa1ut4WIBHMHQSvUfb0FCUGiHdpxzvzuBvWJYf
         PclPLw8+r84uWQEpjxr4d5QXEZqxBMEHn9q0Zusng9QBo6C7lWLvuFWbwgZZlCVAhY8k
         4+nxUPtUOm1jPqQTqXISY024InaI+hfTsI7u0vdAlcFkFgzY79UGhsCI2aOpTCgizKqv
         TBs+HE9koR92+aQU4xrdAB7pUY1uMCYQ1aPu3UfQERzOLdEWIO0tN3Dzjxb3S4UD+ZCv
         Uqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yvIRA62tf+Id/1C1Iw9pWjY61unNIlcfEnBQ+FsDC9I=;
        b=JgMagZcd3ITyrCkIx0Xirh3l2qO4hUQ7vLlgEd+sf84i6jtnF+rinh631htuKVSgwk
         PBj3SrBGdHTLEzqh2hEg4okKahEr2Z3HK/guJpcPh2r3AYhRJggQ9dZyHvCAcSPTHq61
         0Wt+Cc1u6eYGpnR2/RmyqS6hb/dwmiIfjnmkU3oi3d3ZvSzODe9F1O9oZDx2MCYi5ETN
         i6yhMfyL6bzIByAY7eMR5xk8V+FNWq3evWMJD2is41qitRccVbiEhYwCE4E+2ZSux6Mn
         6ldVMGvbLGXwj90xPoEHqJs//PljBBPVdBE34K5ZbwnX4uPAiI9A5YuaaFDgKMKpr59K
         BNaw==
X-Gm-Message-State: APjAAAVZ073iD5OruiOIobvnRI89Zd5geTnf0DDgZq0cUZVlRpU4myaX
        vzdDaN02DeKcZp+NVVnTkCiMur8OKtq/8ScfK8E/GKa6
X-Google-Smtp-Source: APXvYqxwf0KpXaoAxvxmIrDNxz0S67HAfxmjTzqx3HTl7NVvv2rZQ2gyQQddzFjQ1DrQ/Qfyy81p8G7dTKbi3ub7iF4=
X-Received: by 2002:a1c:4108:: with SMTP id o8mr14550830wma.129.1570267187819;
 Sat, 05 Oct 2019 02:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190921101207.65042-1-kholk11@gmail.com> <20190921101207.65042-2-kholk11@gmail.com>
 <20191005035931.GC2999@tuxbook-pro>
In-Reply-To: <20191005035931.GC2999@tuxbook-pro>
From:   AngeloGioacchino Del Regno <kholk11@gmail.com>
Date:   Sat, 5 Oct 2019 11:19:35 +0200
Message-ID: <CAK7fi1ahvqbT_EtZTV=nzjMdF-xOr6DBciry56z9L065xLoGhg@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: qcom: Add a pinctrl driver for MSM8976 and 8956
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>, marijns95@gmail.com,
        agross@kernel.org, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Il giorno sab 5 ott 2019 alle ore 05:59 Bjorn Andersson
<bjorn.andersson@linaro.org> ha scritto:
>
> On Sat 21 Sep 03:12 PDT 2019, kholk11@gmail.com wrote:
>
> > From: "Angelo G. Del Regno" <kholk11@gmail.com>
> >
> > Add the pinctrl driver to support pin configuration with the
> > pinctrl framework on MSM8976, MSM8956, APQ8056, APQ8076.
> >
> > Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
> > ---
> >  .../bindings/pinctrl/qcom,msm8976-pinctrl.txt |  183 +++
> >  drivers/pinctrl/qcom/Kconfig                  |   10 +
> >  drivers/pinctrl/qcom/Makefile                 |    1 +
> >  drivers/pinctrl/qcom/pinctrl-msm8976.c        | 1128 +++++++++++++++++
> >  4 files changed, 1322 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8976-pinctrl.txt
> >  create mode 100644 drivers/pinctrl/qcom/pinctrl-msm8976.c
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8976-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8976-pinctrl.txt
> > new file mode 100644
> > index 000000000000..4e944f84b7d7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8976-pinctrl.txt
> > @@ -0,0 +1,183 @@
> > +Qualcomm MSM8976 TLMM block
>
> As Linus indicated, please send your the DT bindings in separate
> patches.
>
> > +
> [..]
> > +Example:
> > +
> > +     tlmm: pinctrl@1000000 {
> > +             compatible = "qcom,msm8976-pinctrl";
> > +             reg = <0x1000000 0x300000>;
> > +             interrupts = <0 208 0>;
>
> <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>
>
> > +             gpio-controller;
> > +             #gpio-cells = <2>;
> > +             gpio-ranges = <&tlmm 0 0 145>;
> > +             interrupt-controller;
> > +             #interrupt-cells = <2>;
> > +
> > +             blsp1_uart2_active: blsp1_uart2_active {
> > +                     mux {
> > +                             pins = "gpio4", "gpio5", "gpio6", "gpio7";
> > +                             function = "blsp_uart2";
> > +                     };
> > +
> > +                     config {
> > +                             pins = "gpio4", "gpio5", "gpio6", "gpio7";
> > +                             drive-strength = <2>;
> > +                             bias-disable;
> > +                     };
> > +             };
> > +     };
> > diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> [..]
> > +static struct platform_driver msm8976_pinctrl_driver = {
> > +     .driver = {
> > +             .name = "msm8976-pinctrl",
> > +             .owner = THIS_MODULE,
>
> No need to specify .onwer on platform_drivers anymore.
>
>
> Apart from that, I think this patch looks good.
>
> Regards,
> Bjorn

Thanks guys for the review.

Well, I did it in one patch after seeing this practice on other
patches, so I thought to replicate,
despite the well known rule... but yeah, of course, there's absolutely
no problem, I'll send the
two separate patches in a separate series and I'll do the same for the
GCC driver as well,
which doesn't seem that it got sent to the list for some obscure reason.

About the requested changes... sure, I will apply them and resend ASAP.

Thanks again!
