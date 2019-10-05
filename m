Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A530DCC916
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 11:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbfJEJXc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Oct 2019 05:23:32 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:34478 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbfJEJXc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Oct 2019 05:23:32 -0400
Received: by mail-wm1-f65.google.com with SMTP id y135so11220172wmc.1;
        Sat, 05 Oct 2019 02:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hjzyggOz9U/yn8evnsKwr6dIVzKr7dCckaek808/z2g=;
        b=EJ0T65b2yF5ELwKmMgkJNTG+J47ImouATVjqm2hVHsVw0xGo+gG8mZcw9QC8wXSU4t
         0r+FKBtQb0kVp0JqNpX87Uw3PuL6wpY9MAU0TFF90qgeEe7WJW1xexxZuW3Giy9KWV6B
         pLYmkHJNXGOFT9KwkS37cyp43p4TGPVOQV+qeKjnKoJTmKm4pIFyhc/xtOtMhqySBiza
         pqY419wuCCG5aE9w7ra5NLmr2OWnSV6yjDoowLk5VaHh3hqXKjrJYp53kQWlQ+pIjsVH
         IuhPR47+faUZI0GD5iju7iVf4z/BfcbRw2NgYaB+Rj0iCfuhX8frwck7HG1wEO64sFCg
         YHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hjzyggOz9U/yn8evnsKwr6dIVzKr7dCckaek808/z2g=;
        b=f/H8usVs9mF2V/QBvhyYowERoeYkjX4uuVON8zFYueSwAwtWY3ULvWagmJ2Uf+ycQL
         bMedSQ1mNlvjZPIMSRxJCHsUFITZwOtbkbXglXWxZ/qtcgONT43IQFsG+5v9lJ/SbUv4
         h/BiTKIF8EC9lQVphYSjyygIG7i6Sep+3YTXP9eXlZP0qvDMezIZp0jLzzRoStdxJYEZ
         mM0wivnuh6JBuG0UVUtOYXjdJZS7qCey3lQck2k6CQwsZPI0qqw6uSFrN9NT7iIfO/CO
         0yJlh+oAViyL8KEu+jHhYTlhfsPofd5E158eZI9gsNV3l2LOTJe5mC7OhB+9uDrlOie0
         mesA==
X-Gm-Message-State: APjAAAU18Fbs9Erw+vx+3niGmmrwmEpFGaj6c+9KsEp6bVoaflOB8ZzC
        Qo57r963RfBInjqitSJ4ZynJ2nhYO5I2zG+iO/sBeC9p1V0=
X-Google-Smtp-Source: APXvYqzdjuti+4Bh0M6nr+3a67DRXE95QOoL5hlBGjUvhD538JgZ2Mm+5XvQ5ajCq26jlPE6zUI/zatYUFSvWudS9lY=
X-Received: by 2002:a1c:8097:: with SMTP id b145mr5266595wmd.29.1570267408889;
 Sat, 05 Oct 2019 02:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190921101207.65042-1-kholk11@gmail.com> <20190921101207.65042-6-kholk11@gmail.com>
 <20191005042559.GB6390@tuxbook-pro>
In-Reply-To: <20191005042559.GB6390@tuxbook-pro>
From:   AngeloGioacchino Del Regno <kholk11@gmail.com>
Date:   Sat, 5 Oct 2019 11:23:17 +0200
Message-ID: <CAK7fi1a8YK-P+ZdcDQBFFR=4rL2jW+XPPTD=WUYYdi=Oyk0u=Q@mail.gmail.com>
Subject: Re: [PATCH 5/5] soc: qcom: rpmpd: Add rpm power domains for msm8956
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

Il giorno sab 5 ott 2019 alle ore 06:26 Bjorn Andersson
<bjorn.andersson@linaro.org> ha scritto:
>
> On Sat 21 Sep 03:12 PDT 2019, kholk11@gmail.com wrote:
>
> > From: "Angelo G. Del Regno" <kholk11@gmail.com>
> >
> > The MSM8956 SoC has two main voltage-level power domains, VDD_CX
> > and VDD_MX, which also have their own voltage-floor-level (VFL)
> > corner.
> >
> > Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
>
> I was under the impression that 8956/76 can be used interchangeably, if
> so I would prefer if you pick one (8976 as that seems to be your common
> choice) and stick with that.
>
> If not, I think it would be nice if all bindings came with both
> compatibles.
>
> Regards,
> Bjorn
>
> > ---
> >  .../devicetree/bindings/power/qcom,rpmpd.txt  |  1 +
> >  drivers/soc/qcom/rpmpd.c                      | 23 +++++++++++++++++++
> >  include/dt-bindings/power/qcom-rpmpd.h        |  8 +++++++
> >  3 files changed, 32 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> > index eb35b22f9e23..30176b1e595a 100644
> > --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> > +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> > @@ -5,6 +5,7 @@ which then translates it into a corresponding voltage on a rail
> >
> >  Required Properties:
> >   - compatible: Should be one of the following
> > +     * qcom,msm8956-rpmpd: RPM Power domain for the msm8956 family of SoC
> >       * qcom,msm8996-rpmpd: RPM Power domain for the msm8996 family of SoC
> >       * qcom,msm8998-rpmpd: RPM Power domain for the msm8998 family of SoC
> >       * qcom,qcs404-rpmpd: RPM Power domain for the qcs404 family of SoC
> > diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
> > index 3c1a55cf25d6..b50f62851461 100644
> > --- a/drivers/soc/qcom/rpmpd.c
> > +++ b/drivers/soc/qcom/rpmpd.c
> > @@ -115,6 +115,28 @@ struct rpmpd_desc {
> >
> >  static DEFINE_MUTEX(rpmpd_lock);
> >
> > +/* msm8956 RPM Power Domains */
> > +DEFINE_RPMPD_PAIR(msm8956, vddcx, vddcx_ao, SMPA, LEVEL, 2);
> > +DEFINE_RPMPD_PAIR(msm8956, vddmx, vddmx_ao, SMPA, LEVEL, 6);
> > +
> > +DEFINE_RPMPD_VFL(msm8956, vddcx_vfl, RWSC, 2);
> > +DEFINE_RPMPD_VFL(msm8956, vddmx_vfl, RWSM, 6);
> > +
> > +static struct rpmpd *msm8956_rpmpds[] = {
> > +     [MSM8956_VDDCX] =       &msm8956_vddcx,
> > +     [MSM8956_VDDCX_AO] =    &msm8956_vddcx_ao,
> > +     [MSM8956_VDDCX_VFL] =   &msm8956_vddcx_vfl,
> > +     [MSM8956_VDDMX] =       &msm8956_vddmx,
> > +     [MSM8956_VDDMX_AO] =    &msm8956_vddmx_ao,
> > +     [MSM8956_VDDMX_VFL] =   &msm8956_vddmx_vfl,
> > +};
> > +
> > +static const struct rpmpd_desc msm8956_desc = {
> > +     .rpmpds = msm8956_rpmpds,
> > +     .num_pds = ARRAY_SIZE(msm8956_rpmpds),
> > +     .max_state = RPM_SMD_LEVEL_TURBO_HIGH,
> > +};
> > +
> >  /* msm8996 RPM Power domains */
> >  DEFINE_RPMPD_PAIR(msm8996, vddcx, vddcx_ao, SMPA, CORNER, 1);
> >  DEFINE_RPMPD_PAIR(msm8996, vddmx, vddmx_ao, SMPA, CORNER, 2);
> > @@ -198,6 +220,7 @@ static const struct rpmpd_desc qcs404_desc = {
> >  };
> >
> >  static const struct of_device_id rpmpd_match_table[] = {
> > +     { .compatible = "qcom,msm8956-rpmpd", .data = &msm8956_desc },
> >       { .compatible = "qcom,msm8996-rpmpd", .data = &msm8996_desc },
> >       { .compatible = "qcom,msm8998-rpmpd", .data = &msm8998_desc },
> >       { .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
> > diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> > index 30a0aee0df57..3423f964c233 100644
> > --- a/include/dt-bindings/power/qcom-rpmpd.h
> > +++ b/include/dt-bindings/power/qcom-rpmpd.h
> > @@ -27,6 +27,14 @@
> >  #define RPMH_REGULATOR_LEVEL_TURBO   384
> >  #define RPMH_REGULATOR_LEVEL_TURBO_L1        416
> >
> > +/* MSM8956 Power Domain Indexes */
> > +#define MSM8956_VDDCX                0
> > +#define MSM8956_VDDCX_AO     1
> > +#define MSM8956_VDDCX_VFL    2
> > +#define MSM8956_VDDMX                3
> > +#define MSM8956_VDDMX_AO     4
> > +#define MSM8956_VDDMX_VFL    5
> > +
> >  /* MSM8996 Power Domain Indexes */
> >  #define MSM8996_VDDCX                0
> >  #define MSM8996_VDDCX_AO     1
> > --
> > 2.21.0
> >

Yup. My brain stopped working for a minute on that patch :)))
This is applicable to both MSM8956 and MSM8976... and the other drivers that
I've sent are actually reporting a 8976 compatible, so, yes I'll
resend that one as
8976 instead.
