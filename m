Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4F23A5E11
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 10:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232546AbhFNIJB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Jun 2021 04:09:01 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:41488 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232530AbhFNIJB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Jun 2021 04:09:01 -0400
Received: by mail-oi1-f172.google.com with SMTP id t40so13514481oiw.8
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jun 2021 01:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bkT0W8uF7vg3HLg+/9Z/pWJKuKWmGeE2SVQvx5LKoY8=;
        b=UPTHRDNfA8Agg10whsqifThnxL2XjDZWqPqDnpeLhEUooT4NmCe8JfPKSJeaZCeJ7T
         duay+rmg3IWUMsdK2KaBXhhxErIf5IjOCQWgVAQXStBy/ZtCuSoCE6M21G4lWI+hnhtK
         7IS8SESV7paEmVd97VAO2rC4HKupVRjlanCMbYifeOsGVm4Yl8ywWJ3gnkLUsvwnyXhy
         Jx5yZm1CGq2McGnagYUi8AhwukGzYNZfeGg/XhFtMF48GiD3TItTducF4ygbfN0aaX0S
         ijifl9upHRJvZIZBZq0dbfnWN0PSIdDMQvidCXX6jQ1NT811qraW2OIoPT981otoOInM
         AwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bkT0W8uF7vg3HLg+/9Z/pWJKuKWmGeE2SVQvx5LKoY8=;
        b=k9x938xfwdJ1rhWhj9hUXp/FXuXPqjzV/AR+eNaz3Q69YIfT13tzDQ6iwemUbCKr2X
         SRsZmrqZpSonqRg4OVaNEBEJhUa3n05ZV8TyBzYrAPlbasibAKhWSS50JD64HwPtiuGx
         tlbzAlJaUV/1ScwiLjN4T39lNoCg9iOsOX0uPbBA2VEi3OUn1y4sLyx7x/qdy05AE0Bs
         su8DWvAhXM1K9jXr75qMZOVLGjbuLDHapSh9wX8JcmCuSMjzjtUqs9jfxqVzlW5isbmL
         QVFMK8hG0vAR1qR7ZyIMwbiQQZ9Fkbzp8AHsbZT9raPdq5+oMvTpNNEh9LYhX5oiqIHp
         YeWA==
X-Gm-Message-State: AOAM53183VSp58vJk6OWSN9YDFhWRNbRpiiwA26Zi9Q8L/CeoU7202lz
        Afe6Yrrk/vuj7ePG1WaFflGUyxuM95R+2SoadHS3Vw==
X-Google-Smtp-Source: ABdhPJxLGI90FU0D09Sa6LTFm9kRaJq46LUpOxjQeVzGELvxHKc/mMDygnvOtyuLc2Ha+iDkSFNEg8AgoMa2VA/mcds=
X-Received: by 2002:aca:fc91:: with SMTP id a139mr5053908oii.12.1623657958977;
 Mon, 14 Jun 2021 01:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
 <20210607113840.15435-2-bhupesh.sharma@linaro.org> <YMLO56Rr7UGUy8vo@builder.lan>
In-Reply-To: <YMLO56Rr7UGUy8vo@builder.lan>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Mon, 14 Jun 2021 13:35:48 +0530
Message-ID: <CAH=2NtyV=qMn32d9nE7qBheTscUejF1UwVZSc99uiv_P65S03Q@mail.gmail.com>
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

Hello Bjorn,

Thanks for the review comments.

On Fri, 11 Jun 2021 at 08:18, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 07 Jun 06:38 CDT 2021, Bhupesh Sharma wrote:
>
> > Add compatible strings for pmm8155au_1 and pmm8155au_2 pmics
> > found on SA8155p-adp board.
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
> >  .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml      | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> > index e561a5b941e4..ea5cd71aa0c7 100644
> > --- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> > +++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> > @@ -55,6 +55,8 @@ properties:
> >        - qcom,pm8009-1-rpmh-regulators
> >        - qcom,pm8150-rpmh-regulators
> >        - qcom,pm8150l-rpmh-regulators
> > +      - qcom,pmm8155au-1-rpmh-regulators
> > +      - qcom,pmm8155au-2-rpmh-regulators
>
> Looking at the component documentation and the schematics I think the
> component is "PMM8155AU" and we have two of them.
>
> Unless I'm mistaken we should have the compatible describe the single
> component and we should have DT describe the fact that we have 2 of
> them.

If we refer to the PM8155AU device specifications, there are two
regulators mentioned there PMM8155AU_1 and PMM8155AU_2. Although most
parameters of the regulators seem similar the smps regulator summary
for both appear different (Transient Load, mA ratings etc).

Although most of these differences don't probably matter to the Linux
world, others like the gpios on the pmic are different.

So, IMO, it makes sense to mention the different pmic types on the board.

Please let me know your views on the same.

Thanks,
Bhupesh

>
> >        - qcom,pm8350-rpmh-regulators
> >        - qcom,pm8350c-rpmh-regulators
> >        - qcom,pm8998-rpmh-regulators
> > --
> > 2.31.1
> >
