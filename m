Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B90593A5E68
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 10:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232620AbhFNIda (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Jun 2021 04:33:30 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:35782 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232617AbhFNIda (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Jun 2021 04:33:30 -0400
Received: by mail-oi1-f181.google.com with SMTP id l12so5875743oig.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jun 2021 01:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QSAHKTcFLCX8/C+Bt+qS/8aN90gNtcFpqWMBF4o9Lj8=;
        b=VxonmO7//XNFF8uHng7+ibIJaaO64cmwcIbhuWWcRpu/HZC9Vw4PUvNSjFlajDj6A+
         k15Onk8ncCro83SlDNSU7GWY8afW2uvs+Bv3R4wHcW+KPAkbYs+FTuBfCFY2LWQH5dmJ
         /y4weBRLHacyVQOkSitblHkwFMKQZ+qqgNQtuRK1Jo2BxYotu0dmCYSVtLG+kEclv1NW
         CD6I6QaH0BSFKeEAG+trxVzJDtllSmsGLwhrNbQo0RE2ijIZvSihb5qe5W9UK4E5raNC
         butaxzrAlZ6SFSkaCGX8G2TTOrQNpCR25EhCtUBEaiAP2RQSRWJ1WCiKysdjRMziZg73
         GzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QSAHKTcFLCX8/C+Bt+qS/8aN90gNtcFpqWMBF4o9Lj8=;
        b=Re4Av32/t71dvoGCyLTGFcuHTd1/kxHnBUc9xUC1ymJ/Nt1eFTfXHnn9RX1flu0wWD
         KWaI1wPIgepbowySdNnXtJJUxm+Zmv6IajuOkYd9FHIdtHq6sZC3DTmNbxUyNwxmsdzj
         LgOzUSGRGN/whJHJuKkh8iNouIwHnTQFqWZjzWybAs5B5KzzILDp8k9bGyYTPI0WhgOU
         wHe1/Lj1OsKbfUY43Iux0ugizVYVwYR5TFaTOv1pje2jNYKYvMtC88CSHlxjkZkw5nvL
         YejQ4D3YHx722VIGArYXeCbRgz81Xun/nS6ops0YNf1K713JKal8HOhlNR4Ws5q/Lf22
         VGeg==
X-Gm-Message-State: AOAM530+sp/gFceEx/lwfcQlhq8Zlmit1z7bPIERiN+UCWC7MtUdWso3
        9dEp1hKBIHutBGTvq6f2qDcH3B4pSTDtwLojwvqdBGUESY8=
X-Google-Smtp-Source: ABdhPJz/rFMYq32ngA97nWv9bcy6sRojEmIB+U6ypCZQVoSHnGd1gzxCypoSPG3LS0SUdLiasD1CgGdr6DWCs/LTaCU=
X-Received: by 2002:aca:4bd7:: with SMTP id y206mr9866132oia.40.1623659411792;
 Mon, 14 Jun 2021 01:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
 <20210607113840.15435-6-bhupesh.sharma@linaro.org> <YMLR11+6A/6klgqJ@builder.lan>
In-Reply-To: <YMLR11+6A/6klgqJ@builder.lan>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Mon, 14 Jun 2021 14:00:01 +0530
Message-ID: <CAH=2Ntwkk4Hw1VQcXu9y08jPHWf99EFmj=7GG0V4uuwbNK7c0A@mail.gmail.com>
Subject: Re: [PATCH 5/8] pinctrl: qcom/pinctrl-spmi-gpio: Add compatibles for
 pmic-gpios on SA8155p-adp
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
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

Hi Bjorn,

On Fri, 11 Jun 2021 at 08:30, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 07 Jun 06:38 CDT 2021, Bhupesh Sharma wrote:
>
> > SA8155p-adp PMICs (PMM8155AU_1 and PMM8155AU_2) expose
> > the following PMIC GPIO blocks:
> >
> > - PMM8155AU_1: gpio1-gpio10 (with holes on gpio2, gpio5, gpio7 and gpio8)
> > - PMM8155AU_2: gpio1-gpio10 (with holes on gpio2, gpio5, gpio7)
> >
> > Add support for the same in the pinctrl driver.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Liam Girdwood <lgirdwood@gmail.com>
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-gpio@vger.kernel.org
> > Cc: bhupesh.linux@gmail.com
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> > index 00870da0c94e..890c44b6e198 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> > @@ -1127,6 +1127,10 @@ static const struct of_device_id pmic_gpio_of_match[] = {
> >       { .compatible = "qcom,pm8150b-gpio", .data = (void *) 12 },
> >       /* pm8150l has 12 GPIOs with holes on 7 */
> >       { .compatible = "qcom,pm8150l-gpio", .data = (void *) 12 },
> > +     /* pmm8155au-1 has 10 GPIOs with holes on 2, 5, 7 and 8 */
> > +     { .compatible = "qcom,pmm8155au-1-gpio", .data = (void *) 10 },
>
> As noted in the binding, I think this should be "qcom,pmm8155au-gpio"
> and please skip the comment about the holes.

Similar to what I noted in the binding patch review thread, the pmic
gpio holes seem different as per the downstream dtsi.

So, please let me know and if required, I can make the suggested change in v2.

Thanks,
Bhupesh

> > +     /* pmm8155au-2 has 10 GPIOs with holes on 2, 5 and 7 */
> > +     { .compatible = "qcom,pmm8155au-2-gpio", .data = (void *) 10 },
> >       { .compatible = "qcom,pm8350-gpio", .data = (void *) 10 },
> >       { .compatible = "qcom,pm8350b-gpio", .data = (void *) 8 },
> >       { .compatible = "qcom,pm8350c-gpio", .data = (void *) 9 },
> > --
> > 2.31.1
> >
