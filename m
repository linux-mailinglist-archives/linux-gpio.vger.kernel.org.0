Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0264C7C4E6B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 11:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbjJKJWd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 05:22:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230351AbjJKJWc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 05:22:32 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 504B29C
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 02:22:31 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-65b0dad1f98so42578966d6.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 02:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697016150; x=1697620950; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NiamZOqOZZtzzPmQsOXA8/LTPZNpfaNzuK4lw0f8SzI=;
        b=gxy18m7Av/Q8aEU/b2eCmmflWWfvgMf3WN/2kq2fTaslkb4BHq0OAyqAu+q0uHbChH
         F1V3lv/A2vl6cmffGoxr35ZB1zCHormL1/vVwNsvSK70ferS8CE/1JzFO9zkOdsUcBtr
         VsclXiaRdqtkPCZA7KKuktYfW/9PD/56l/hXVPS8OppKAuc38BjdqQkdgMmnuGQJ1/13
         2bdM1Qzgr5yDv7sqUmLlhreYvci42QUm1bgk9lVsVTAogcXJd0hMYZIbndqds5FsAol3
         RxYWtvlqKIp+a3QYySGm+f9047QShXb/lzQoRwZJIuIDL6IHRLhuqv+tPBL1aEmf8VFK
         Q2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697016150; x=1697620950;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NiamZOqOZZtzzPmQsOXA8/LTPZNpfaNzuK4lw0f8SzI=;
        b=RJRhXAF7DfBbtoB9O4x1HAzvaxVOW97Zm4AKcWmbloh5fBSZpp7/pZjLCl3iULgq9P
         Nh4p+gSYJh46z0PkoFBsm6wXwz9rWX1hrHCraNe0qGtUlt1EvCCjtjLVHFkSp9oOgO3q
         nriRx350ZWcyEeum2rM4B85ho5JHYqg/K0Hi1jVDDmoBHaqQXngTlwmjMSYGTDxw659D
         +ToOtx4DSYo7sddyOPjqWdYvM/qcKKdX2bt4mT/sp02OmIfM08mXyAFJSNwb21vYgKDi
         jcf7UUEh+pDasax2/zJAVtJEr/F6f0scqIddL+G9/HhCX+d7+1tMajxcirAjERjrewsB
         xmNw==
X-Gm-Message-State: AOJu0YxXjXKKgZuoEDMZsZ3X9MKHtnta7O1RgUQzzbgRogV4GvD5e8PN
        iyLFS1nd+0y+KWhCRz28ggYD7zE+3EPYvQHyAW2+1A==
X-Google-Smtp-Source: AGHT+IFerUNHewgiE5tLLCx5HV3nwVhXkhxt2EIfdccX23DiuelsSBZdOsEH+KJvuaEUMPXd2xPPokchSF+FbYADBnI=
X-Received: by 2002:a0c:e30d:0:b0:66d:343:3512 with SMTP id
 s13-20020a0ce30d000000b0066d03433512mr1954964qvl.63.1697016150324; Wed, 11
 Oct 2023 02:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <20231010224928.2296997-9-peter.griffin@linaro.org> <2023101111-banknote-satin-1f77@gregkh>
In-Reply-To: <2023101111-banknote-satin-1f77@gregkh>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Wed, 11 Oct 2023 10:22:19 +0100
Message-ID: <CADrjBPqGkAh9YauwDTTrjBqx1fYmXEE4FwqDoPEy1+=Stf24QA@mail.gmail.com>
Subject: Re: [PATCH v2 08/20] dt-bindings: serial: samsung: Add
 google-gs101-uart compatible
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Greg,

Thanks for your review feedback!

On Wed, 11 Oct 2023 at 08:48, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Oct 10, 2023 at 11:49:16PM +0100, Peter Griffin wrote:
> > Add dedicated google-gs101-uart compatible to the dt-schema for
> > representing uart of the Google Tensor gs101 SoC.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> > index 8bd88d5cbb11..72471ebe5734 100644
> > --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> > @@ -19,11 +19,13 @@ properties:
> >    compatible:
> >      oneOf:
> >        - items:
> > +          - const: google,gs101-uart
> >            - const: samsung,exynosautov9-uart
> >            - const: samsung,exynos850-uart
> >        - enum:
> >            - apple,s5l-uart
> >            - axis,artpec8-uart
> > +          - google,gs101-uart
>
> These shouldn't be needed, just declare the device as the same as what
> the chip really is (i.e. a samsung uart), that way no .yaml or kernel
> driver changes are needed at all.

What you describe is actually how I had it in the v1 submission, which is also
similar to what exynosautov9.dtsi is doing by re-using the
"samsung,exynos850-uart" compatible, and associated data in the driver.

However the review feedback in v1 from Krzysztof and Tudor was to add a
dedicated compatible for it. I guess I could have re-used the existing
EXYNOS850_SERIAL_DRV_DATA structure though rather than duplicating
that as well.

I'll let Krzysztof comment on why a dedicated compatible is required.

regards,

Peter
