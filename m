Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6768E3A760F
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jun 2021 06:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbhFOEp5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 00:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbhFOEp4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Jun 2021 00:45:56 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10603C0613A2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jun 2021 21:43:53 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id l15-20020a05683016cfb02903fca0eacd15so13066346otr.7
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jun 2021 21:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JyaUkQuIyJoeFM+aEDlAzk2ObFHbusZSFKanutxk4Kk=;
        b=FY6KP3tPfSi18hxKQz/dPNKtBWBY9us3tn3qr64LmdnwNoD9Qygd1BfC9C5JhRkCuJ
         KuxFdsqfmhktKgnwigHusnqRy4qmHb91U95rwe5Hjvo7eLzDeNMt2/KXQdyYipEty1Lp
         +RASGmRooIjliky3xwViIhxwoItf2gNgzxh/NP1BBpMG4QXBD11UJ86eWU+PvCAjEtEw
         FICAKGgenEpLUf5VRdwUP6r7+i6/DgXrv2jbKi/NfiBqXWB+6OgTgCieb+HZqUai8nOt
         A2Iv/Ow79hksfJ5HtOM1JbFzqtm37Xr3gsBVxoQSae9kmJUvR2gCg6Gu3fjnNgEvWNsr
         iXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JyaUkQuIyJoeFM+aEDlAzk2ObFHbusZSFKanutxk4Kk=;
        b=BsTvPdCIOGx1SSjggqqaZxHTDsSl40X6Y/mdSrsfp3wICriNm5ba6QfBRJ9ga5Q/UR
         tIT+De6g2ObuMAVOVyNPEzqENVjuLogyiOYLzqCgBElhsguwsFgjEtBqHBaFjYMitPym
         ulRBzaYtowgsSehlXEyWLCPw98+it7ly0YFnY/7wTqR4gzmf+KD8G3gBONBRjV8VYpvo
         mASDmf7BdA4hozMvO2UH2x6ZZf/sSOlgGrehokUAVAB3nSMw2z47gbR0vVyy7J1lF+mr
         TuLAP/jZxnaE1yVPk3t4c2TC4GtWJjL1PveEhv4E/jF2ab9AcgYA4Jh23rKASZ0tbX11
         GGAA==
X-Gm-Message-State: AOAM530x46RKpUj7ididli+AwkcOV65EoWYxqT1Mvf0k1HEcNTpaRvRq
        lOfUKuSQM4e0lqTU334FBKLeqtK/BNOv9zU6S9Blpw==
X-Google-Smtp-Source: ABdhPJwrsLZmevUqafP568aS8yI0DiAgzYfRC7baS3F8SVzDZEKsHINDgwEGHDGQM0JUnXSZZbn7/xcJ77K0LCRj0a8=
X-Received: by 2002:a9d:74d4:: with SMTP id a20mr15883836otl.28.1623732231944;
 Mon, 14 Jun 2021 21:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
 <20210607113840.15435-2-bhupesh.sharma@linaro.org> <YMLO56Rr7UGUy8vo@builder.lan>
 <CAH=2NtyV=qMn32d9nE7qBheTscUejF1UwVZSc99uiv_P65S03Q@mail.gmail.com> <YMeDuToX+YG8CJEa@yoga>
In-Reply-To: <YMeDuToX+YG8CJEa@yoga>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Tue, 15 Jun 2021 10:13:41 +0530
Message-ID: <CAH=2NtzKniw9tdnVFXk35qEmvXcKQMR3=DqamQwjP+wsCGpT1Q@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: qcom: rpmh-regulator: Add compatible for
 SA8155p-adp board pmics
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

On Mon, 14 Jun 2021 at 21:58, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 14 Jun 03:05 CDT 2021, Bhupesh Sharma wrote:
>
> > Hello Bjorn,
> >
> > Thanks for the review comments.
> >
> > On Fri, 11 Jun 2021 at 08:18, Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > On Mon 07 Jun 06:38 CDT 2021, Bhupesh Sharma wrote:
> > >
> > > > Add compatible strings for pmm8155au_1 and pmm8155au_2 pmics
> > > > found on SA8155p-adp board.
> > > >
> > > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > > Cc: Liam Girdwood <lgirdwood@gmail.com>
> > > > Cc: Mark Brown <broonie@kernel.org>
> > > > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > Cc: Vinod Koul <vkoul@kernel.org>
> > > > Cc: Rob Herring <robh+dt@kernel.org>
> > > > Cc: Andy Gross <agross@kernel.org>
> > > > Cc: devicetree@vger.kernel.org
> > > > Cc: linux-kernel@vger.kernel.org
> > > > Cc: linux-gpio@vger.kernel.org
> > > > Cc: bhupesh.linux@gmail.com
> > > > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > > > ---
> > > >  .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml      | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> > > > index e561a5b941e4..ea5cd71aa0c7 100644
> > > > --- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> > > > +++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> > > > @@ -55,6 +55,8 @@ properties:
> > > >        - qcom,pm8009-1-rpmh-regulators
> > > >        - qcom,pm8150-rpmh-regulators
> > > >        - qcom,pm8150l-rpmh-regulators
> > > > +      - qcom,pmm8155au-1-rpmh-regulators
> > > > +      - qcom,pmm8155au-2-rpmh-regulators
> > >
> > > Looking at the component documentation and the schematics I think the
> > > component is "PMM8155AU" and we have two of them.
> > >
> > > Unless I'm mistaken we should have the compatible describe the single
> > > component and we should have DT describe the fact that we have 2 of
> > > them.
> >
> > If we refer to the PM8155AU device specifications, there are two
> > regulators mentioned there PMM8155AU_1 and PMM8155AU_2. Although most
> > parameters of the regulators seem similar the smps regulator summary
> > for both appear different (Transient Load, mA ratings etc).
> >
> > Although most of these differences don't probably matter to the Linux
> > world, others like the gpios on the pmic are different.
> >
> > So, IMO, it makes sense to mention the different pmic types on the board.
> >
> > Please let me know your views on the same.
> >
>
> Afaict, they are both physically the same component, but there is some
> configuration differences between them. I don't see any differences that
> will show up in Linux, but afaict we would capture those in the DT
> anyways.
>
> Let me know if you see anything I'm missing, but I think we should have
> a single compatible.

As discussed on IRC, let's go with the approach you suggested (I can
propose followup patches if I find something amiss). I will send a v2
shortly.

Thanks,
Bhupesh
