Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 160313A923A
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jun 2021 08:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231381AbhFPG2s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Jun 2021 02:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231422AbhFPG2q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Jun 2021 02:28:46 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AFEAC061760
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 23:26:34 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id d19so1391414oic.7
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 23:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9zUgDhkJImxfUh9Hmx75RiDhjdI3YARcNQ9gBrGyxCw=;
        b=XIokmDd7gMh7WJsguRzQznvarxUBTpKC/M0FORL22R5Qkpc7zDDpeDFQZB1QEymigy
         K6jYHoCO7hXbkG+6SY/Je4CYKQgEuLR1Ih3UDnjiHtivGyT+I/dbp2iILm9vWKhpH8ZH
         SZvJvU8Qcb/cbAeoks7gJ2aKGN/iKTkI4p93yurQBQnKm9qXJWVVAGGqyfeYD1dWj+uZ
         ZxlxFm5qsr5r28cNUPdnVR5InzIv3p9uQbJF7r3BkdVXm2LCP+qsfbfoyx80D06q5+I1
         C156+VdIDmctM27juRqX+DijmwtW1TQVItomtVxpjvMfobG/OEWdYneW5K2OpAE/hgVn
         He1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9zUgDhkJImxfUh9Hmx75RiDhjdI3YARcNQ9gBrGyxCw=;
        b=kP+ztn+MABEezHGaPEGRhp3JYKp/x7oc6yFL39Yg4AT/wctXsnzOksIiUWALmtCXnz
         vJ9xwKz5qygUzfqiArjzSXxOCiV/Pp+0vLEL7VJy2cpyWrvy206EypM7COqHp95/3yOD
         ZraVsj3MXzbg9xb2av3YAJXCvy3TE7Nppp1OCMcPDJtHDlPSG1yGqU03NihCn4V78hVc
         HlJ+YYwQp13v4iu6ssPNZ3AsXEpYgj9P3/E72QYmJMmN8iuPhAUkIiYmXvJIQq/rjdQt
         2m0158Lw/KffBcokYSaqEPBnwoimVdj84MBKxuPaFwoZB11T6+lZi14MFSNNAO2xQpEr
         cSYw==
X-Gm-Message-State: AOAM531dhe2WtuJPeP0qVU8ojlvlmNnu5qzqQaBSYB5lnV2RTaJ8cDN6
        X/Kg4Sxo3RREQthg4y5EVCFvPu5QKmNB5xv2rJ2nkQ==
X-Google-Smtp-Source: ABdhPJxMsqZuCXp/LxfKwhV20rJVZBMQCnCg7j7tmAYQRSo241pj8V+0ieCfOfm6j4VGarto5/XKjCkdGRtP4NgaN9Y=
X-Received: by 2002:aca:fc91:: with SMTP id a139mr5788266oii.12.1623824793682;
 Tue, 15 Jun 2021 23:26:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
 <20210615074543.26700-3-bhupesh.sharma@linaro.org> <YMkU/on5e92vgIll@yoga>
In-Reply-To: <YMkU/on5e92vgIll@yoga>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Wed, 16 Jun 2021 11:56:22 +0530
Message-ID: <CAH=2Ntx=j3w-yjRm12pqwYGrkfJ5h1cXeY-RNwzEs9tkT25b0Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] dt-bindings: pinctrl: qcom,pmic-gpio: Add
 compatible for SA8155p-adp
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 16 Jun 2021 at 02:30, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 15 Jun 02:45 CDT 2021, Bhupesh Sharma wrote:
>
> > Add pmic-gpio compatible string for pmm8155au pmic
> > found on the SA8155p-adp board.
> >
> > ---

<..snip..>

> >  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> > index f6a9760558a6..80b8a66e29d8 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> > +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> > @@ -27,6 +27,7 @@ PMIC's from Qualcomm.
> >                   "qcom,pm660l-gpio"
> >                   "qcom,pm8150-gpio"
> >                   "qcom,pm8150b-gpio"
> > +                 "qcom,pmm8155au-gpio"
>
> Please keep these sorted alphabetically.

Ok, I will fix this in v3.

Thanks,
Bhupesh
