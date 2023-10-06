Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 195D07BB7F5
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Oct 2023 14:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232218AbjJFMlj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Oct 2023 08:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232174AbjJFMli (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2023 08:41:38 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1393CF
        for <linux-gpio@vger.kernel.org>; Fri,  6 Oct 2023 05:41:36 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-66b024d26e2so754916d6.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Oct 2023 05:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696596096; x=1697200896; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BG+pU1EHGnCj6tU73G8/u9FDfygPxqAGCLjoLFitfDU=;
        b=Z1rRQi3HAYdYZVC8Q+Sas5E8KKLeQGX/uOmN+LPLYMEYs74uHg1DGZtvZhBe8KUoSr
         QaqlfMvz9kUDc4U8l9rAphNzOjhKhrWl+zWf9k9uF9c5mIcs9ewubzYRQ+zrIgFCF7WU
         ACxTXPBn1rTbcpZhUmmifUOkd/+jBHOliABGrdroul9X0E7+WlNRwZ2eO2aZWBlcYRaz
         5ub+9SspRgb8VHgqJP1K/axAzZ3fSeg3LH6N7Bv5qkbPT2wPvoIWDJ1jIXQlUbnCgoEi
         Fk+zDaX1nZ1foCDZT+DALPIhWC5M2Ns026yE7nLYcaPEAw9M3hYVVZeulq5vZzNMLHr1
         wFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696596096; x=1697200896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BG+pU1EHGnCj6tU73G8/u9FDfygPxqAGCLjoLFitfDU=;
        b=MaMLCscqLOVhXLFxGIFBUNwpTIaCVgIQcH4/ko+Viau0eJF/sP0jRZSParanBNOd9w
         +x1g5H+XTpJONOUf0TjIad+50iWxlrcugbJAwQySmhuAqQhx4fVuQCb7Eixzaa54tEMR
         ksf6Te3l7/hjAzgAGCW3p7Hu5Gyo+rhv63B3R3sWnfdDSRdvZGGYCzzIY/HF6HtqDitf
         mddapFeF0pxsqpBksFHYYexxIR/MYGNj9vBsZUB4FChPQQ9BOUJ4+BoeQIIHuwFdnbzX
         dOw4St6fSzQirD5eWasoCQkU16meyS+sjnD5Is36FTYcnll9RjPtVSShz+308PyMnqHl
         NhIA==
X-Gm-Message-State: AOJu0YxqEVt4Ezqrsvy+/yLrjZiYL7tCKLxEPywVRO64neR8TMy662go
        b5NYkUEl5zb6UtBbGC8UcBbESrDMVawgKJz054VS2g==
X-Google-Smtp-Source: AGHT+IEc9cXq8etKpdI34yJncEC8RLd8eZzic0vY4V2CYU6+7KPMm/ULeW87OBJQQb7Lh+PasTJleL0tLgLVqUOGwPQ=
X-Received: by 2002:a05:6214:400e:b0:64f:4d4a:70c with SMTP id
 kd14-20020a056214400e00b0064f4d4a070cmr6030330qvb.27.1696596095802; Fri, 06
 Oct 2023 05:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-5-peter.griffin@linaro.org> <f997c21d-d85b-4ad1-ad5b-999524fc72ac@linaro.org>
In-Reply-To: <f997c21d-d85b-4ad1-ad5b-999524fc72ac@linaro.org>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Fri, 6 Oct 2023 13:41:24 +0100
Message-ID: <CADrjBPpHTydVZdi+x6V-QoV++oQEuv4n6-NPXGB2=+AERNETyA@mail.gmail.com>
Subject: Re: [PATCH 04/21] dt-bindings: soc: google: exynos-sysreg: add
 dedicated SYSREG compatibles to GS101
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Krzysztof,

Many thanks for reviewing the series :)

On Thu, 5 Oct 2023 at 17:07, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 05/10/2023 17:56, Peter Griffin wrote:
> > GS101 has three different SYSREG controllers, add dedicated
> > compatibles for them to the documentation.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../bindings/soc/samsung/samsung,exynos-sysreg.yaml        | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > index 163e912e9cad..02f580d6489b 100644
> > --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > @@ -50,6 +50,13 @@ properties:
> >                - samsung,exynosautov9-peric1-sysreg
> >            - const: samsung,exynosautov9-sysreg
> >            - const: syscon
> > +      - items:
> > +          - enum:
> > +              - google,gs101-peric0-sysreg
> > +              - google,gs101-peric1-sysreg
> > +              - google,gs101-apm-sysreg
> > +          - const: google,gs101-sysreg
>
> Please drop this one compatible. Exynos has it only for backwards
> compatibility.

Just double checking, you mean I should drop this one compatible?
 +          - const: google,gs101-sysreg

>
> Also, please put entire list ("items") before such entry for
> samsung,exynos5433-sysreg, so everything is more-or-less ordered
> alphabetically, by the fallback compatible.

Will do!

regards,

Peter
