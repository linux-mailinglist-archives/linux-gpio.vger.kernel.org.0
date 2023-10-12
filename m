Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7F17C6B4B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 12:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347132AbjJLKjS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 06:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343796AbjJLKjS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 06:39:18 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91B6AB7
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 03:39:14 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5a505762c9dso9673027b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 03:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697107154; x=1697711954; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3oDNI1r5lnQu4SogBoFfe1dTr8U9qrvg3JFlPaLZjkQ=;
        b=LK2f9TlDxZQqnPHOx1U47WxtdbhAz7vLn5+qYFUF/S8FNDry6+lFmYKTii8hJhvWsT
         58nqmlUVlPDQBpAlMjxfB3CD0jF+OLonuhwntv1ATsDFPH6wJiLzWCuUP5rTORjLbl7z
         FE6GQtrm1B+EVqqpUFoulmNsoKgaMAO3uA6Kz97YIpt866VrRbJCvpmAQ8RrkUAftEr4
         7R48jQbf21S3ptvL8BXK9InGptB4wUeeiXeVLmNlJceIHliDfm/d9DVBWyk4wWYpt/mt
         sVZzEEzCWq4pj1delCQYza9b6uRlbDtNzTWAtw6RbhbgPJZrI0qkN8HkgQWLBFruyERf
         6HbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697107154; x=1697711954;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3oDNI1r5lnQu4SogBoFfe1dTr8U9qrvg3JFlPaLZjkQ=;
        b=N1OZZJQ1IO9NZ2HsH3alqpS7xTKOvSTRZrDVyXOHjr8XixoOD+XfyATGOaPJURgu83
         tTHZW76S7q1blY4mXRWtetXHk/kcCbBPHGv5zAaNqCyZEYUICjef5eqT4rJOLxaUmDQZ
         T8gYyBZ2+9S/bhYaRmpCTC7DPUFev/LazpFCq+R6iEhrGLzudYudaGW/Xr8rTjeRDFOp
         KEBJn0obiTj2pqRBaMKqoFqobR/CCWV0jmzyKrl933oDA5hHClmKzOH061THzADhNZNh
         SuHwamszyCQpoJuXvN5VSPgA7Xz2K9GVEztKYZ4M6ka5tyg0zwXL0cazY5ykkV5UPjYY
         yTDQ==
X-Gm-Message-State: AOJu0YxywmKYyEhfuf88mueq1r28NDYreo2p2lAsQWgrWqMikwvZWfbv
        g/E6p5IBZDuacP4PuqRgTe8oGsZtM+AKwVMAqlUEmw==
X-Google-Smtp-Source: AGHT+IFxRHuALoKeSjfKb3H4CN2bFTSSU2Bt+HgqEZX9jtOl6oxsdLqG69us8msuH/TRvisud8wxsgY5xod/E0gS4Uc=
X-Received: by 2002:a0d:f204:0:b0:569:479f:6d7f with SMTP id
 b4-20020a0df204000000b00569479f6d7fmr22902098ywf.43.1697107153677; Thu, 12
 Oct 2023 03:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-3-peter.griffin@linaro.org> <5907e2b3-9a0b-4871-be08-6ca42200b8ec@linaro.org>
 <CADrjBPqF67bcTnssQO8cN2n1ZbevziVNa+gA5azEDz_1wXzaNQ@mail.gmail.com> <809be13a-74b7-4934-8319-17330febc1b7@linaro.org>
In-Reply-To: <809be13a-74b7-4934-8319-17330febc1b7@linaro.org>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Thu, 12 Oct 2023 11:39:02 +0100
Message-ID: <CADrjBPpzfOmmr4sVDSXCM_RyVK1GKM+nVN6Cm=eMSBfN3sMciA@mail.gmail.com>
Subject: Re: [PATCH v3 02/20] dt-bindings: clock: Add Google gs101 clock
 management unit bindings
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Krzysztof

On Thu, 12 Oct 2023 at 11:20, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 12/10/2023 12:15, Peter Griffin wrote:
>
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            const: google,gs101-cmu-top
> >>> +
> >>> +    then:
> >>> +      properties:
> >>> +        clocks:
> >>> +          items:
> >>> +            - description: External reference clock (24.576 MHz)
> >>> +
> >>> +        clock-names:
> >>> +          items:
> >>> +            - const: oscclk
> >>> +
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>
> >> enum:
> >>   - google,gs101-cmu-apm
> >>   - google,gs101-cmu-misc
> >
> > Ok just to be clear, are you saying I should have it like this?
> >
> >   - if:
> >       properties:
> >         compatible:
> >           contains:
> >             enum:
> >               - google,gs101-cmu-misc
>
> No, my bad, I meant apm + google,gs101-cmu-top
>
> >               - google,gs101-cmu-apm

Ah OK, yes that makes more sense. Thanks for the clarification :)

Peter.
