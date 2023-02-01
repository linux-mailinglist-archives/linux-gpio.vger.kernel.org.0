Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA169687127
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Feb 2023 23:45:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbjBAWpm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Feb 2023 17:45:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbjBAWpl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Feb 2023 17:45:41 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D472038B4D
        for <linux-gpio@vger.kernel.org>; Wed,  1 Feb 2023 14:45:39 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id a3so160958wrt.6
        for <linux-gpio@vger.kernel.org>; Wed, 01 Feb 2023 14:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nXEg1M/8Ow65IihrBRBuML6WIDNs1pKYceWi+8rT6PE=;
        b=qDInqtYujTo0IpmxoSiaW8ivIhtbPTHMjMQHFiUTrkQJvgGDw9nyD3Kvuo1p2aAXaR
         e2w7d8JHOyE8bqtRS7gRpkbGqTjvKH88ZtyVyphv4L8n7ny0pv1XqJyXEei1fMC6a4EM
         O3kviYo3Jo21H1r+SIBXtcTPlIMHRFJ/dD9i/3M/JRgIHDixrcq9AMHqLaNiHajgFMBP
         iQYuroK/pZ+Wm0PP+imuHPHBz97BJ2Z7S9YOJ4bsEN1uT5jA6jB6dUpL6XJ8c3F45G0f
         clmso6BDaXyj3hZjs4MfWBWRbbEahUE27DrL/wLlV+0sSoGifGUkkt54oxqwCiblSdVL
         yipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXEg1M/8Ow65IihrBRBuML6WIDNs1pKYceWi+8rT6PE=;
        b=j97grE7fdpRRsCr7bu2sTXuCd/lXkE9dDyHFH+1SG6pNoTvo1GUwUpjXTIdfhC7Sxv
         7ouDaSrLYltX6hLt7sOVos8TKKt9x/pl/0Dv+V0UxTNr69b+HidPISbUN68u6VY/Xeaj
         7KYXtHGSPbC6hXNxgIzCsNuFk4MYfBQdBck3T1nKX7X5Tou8oZukSSlWUEDyp980qBUr
         JI2u0zArC+nRNxnHQ9dBNQidhEDSvj+5pqG3AiJSBeYlyRaAwOnEzMKLJWO9lN3cP5IE
         Sxl3OfkQ3NLrBsNgAnOWWCJn3mhpETF+pxZ0tKnsMlZvi941ACN+rVWGZJm1mjKgriZW
         48Yg==
X-Gm-Message-State: AO0yUKV8O9onAjpn/AaHXT7XfiST0Th01rB/bH6XEGwRpTiKGP+M0O9M
        ziXH3ZY3m3OeDLDXrnEyl+aQuijEv26ZW/RG+yKS+w==
X-Google-Smtp-Source: AK7set8hlhnmbtZBx98H8ICP56Fc5lHNYHDcGn2ClEg32Z21/F1mXiNlNLipP7v0YtJ/2DJTGfai3wxLoTqjPnVhszE=
X-Received: by 2002:adf:f94e:0:b0:2bf:edb9:78e5 with SMTP id
 q14-20020adff94e000000b002bfedb978e5mr127102wrr.383.1675291538313; Wed, 01
 Feb 2023 14:45:38 -0800 (PST)
MIME-Version: 1.0
References: <20230201150011.200613-1-brgl@bgdev.pl> <20230201150011.200613-2-brgl@bgdev.pl>
 <e28c9048-635d-3936-e440-27e293501ff6@linaro.org> <CAMRc=Mc8gFpcB6k-qVmSAM0=iKHGBmGcqm3aV2xiyjWPG1wtvg@mail.gmail.com>
In-Reply-To: <CAMRc=Mc8gFpcB6k-qVmSAM0=iKHGBmGcqm3aV2xiyjWPG1wtvg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 1 Feb 2023 23:45:25 +0100
Message-ID: <CACRpkdaFCG+PHXrOTGW4ZLMSOcJvJ6eYKRO-VLds1J13OuTYJA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: describe sa8775p-tlmm
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 1, 2023 at 4:15 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Wed, Feb 1, 2023 at 4:13 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 01/02/2023 16:00, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Add DT bindings for the TLMM controller on sa8775p platforms.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> >
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +
> > > +    tlmm: pinctrl@f000000 {
> > > +        compatible = "qcom,sa8775p-tlmm";
> > > +        reg = <0xf000000 0x1000000>;
> > > +        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> > > +        gpio-controller;
> > > +        #gpio-cells = <2>;
> > > +        interrupt-controller;
> > > +        #interrupt-cells = <2>;
> > > +        gpio-ranges = <&tlmm 0 0 149>;
> >
> > You have 148 GPIOs, so s/149/148/.
> >
> > I'll fix other bindings as we have such mistake in several places.
> >
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >
> > Best regards,
> > Krzysztof
> >
>
> Ah, cr*p, sorry for missing it. Linus - can you change it when
> applying? I don't want to send more noise.

Of course :)

Yours,
Linus Walleij
