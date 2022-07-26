Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 881CF580D32
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jul 2022 09:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238119AbiGZHYR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jul 2022 03:24:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238120AbiGZHXa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2022 03:23:30 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A57D2B619
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 00:23:21 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id z23so24327380eju.8
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 00:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DD0uadPhkaJ539aapAhTDeVFQH+XGwCWm7G+YfPh7fc=;
        b=Kba4ZDV1A/AXRgz6iEbxRwn8EqVTv2R9yv+8Q2gRza9+ZIvQtXmDpHMJ+sUhFJFMZ0
         7FbNc6d3/UoKdDqyTR5suL8w6TJ5Gn4/Kz3AtA2NjJTGAKHlcxyL3aJx4A7+/5TiUfQS
         NxlzBAykIrKayHvDFOAKgU5Tiinpei2lR44V3d7wEJl+WEyIYRuRvQ9iG/c5gF30k3Zl
         UFz7H/aJUp9D6Vjh3W9yMy72PrQ2Xxh5RoEOE3cP+U8zGqLPIIyi1AHwfcGI0gIcwimM
         2dsoyOJLHp+5tVE6zpTC3LAoEK7Uku2f0P0wNfD7NWfh2JBiJ8ColgXgz/u4zr4EIrTZ
         1Fsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DD0uadPhkaJ539aapAhTDeVFQH+XGwCWm7G+YfPh7fc=;
        b=Emi/7f1Ih4myYcxzorxDa//Kv68iiEiw2D6WOYj4txhqxi8aKEHRObMypuzj+mthRG
         iqqIh8QRO2wmJVnCG1KTukasbWhSuojSGb/8WCuucNhVWQnN6oBo1XvlLtNUGkbFOLuh
         6iiTBcdD5Pj5SQPtlbsWySFwBOE05yxYf+YsHFFUWYDAMPXTacbMqtJwfWNZmXRzK58Z
         BFTPxu2yzVNo/N+7vw2XwsrrSGukyNe8oe7DdtYsD8YubFvMGtttcyKLmiZ10nnfpFXv
         MxVRc6B6kerITXONEqxt+l/bpkN87BdoY6M/ZhjJFWvJX545ZtCU+Oc69mBVPwQqF9MK
         fGYA==
X-Gm-Message-State: AJIora+Ac/A0n+1ysxgdW8FNJ68nzKWPktfIxWOkI/ECYOnzmxFoIYbK
        cG9hkhG94gmuxDRgIwPSEev3TaCOdYF4IE7QjbsxoWnO8cvSuQ==
X-Google-Smtp-Source: AGRyM1tNXCKI2buHcvEhsS4ymiRcgoitpKwhQicSRzpI9ca8De/k6MNUhY31qEeF7NOfuZPg6YuHDk4sc/waM5l8O4g=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr13217132ejs.190.1658820199862; Tue, 26
 Jul 2022 00:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220721093422.2173982-1-marcus.folkesson@gmail.com>
 <CAHp75VddBhc9peHXfNfTyTNni246kC8CyLqCrMFadn67LGDarQ@mail.gmail.com>
 <CACRpkdaczrU1tM5Yt7P-Q2h+ge8STOi6HvvYeTM-g+JwS8_gZw@mail.gmail.com>
 <CAHp75VfaExrFYto7LWa5Vnbm6JbiAqtutKmk0HzfeHmmi3PwOg@mail.gmail.com>
 <CACRpkdYHgD-fmt_2PWJrmyGY=AOP0Z+4jTkH=n3wJ+a0aApqcg@mail.gmail.com> <CAHp75Vf_aDSocdB7R6zKFwEOBRwq0w2m6GdCM-5ujKoz4bGiqQ@mail.gmail.com>
In-Reply-To: <CAHp75Vf_aDSocdB7R6zKFwEOBRwq0w2m6GdCM-5ujKoz4bGiqQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jul 2022 09:23:08 +0200
Message-ID: <CACRpkdbTypeq0M8VNb491GaZdBLyE9_TFpCDn5omnTe8D+BU7w@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: gpio-74x164: add support for CDx4HC4094
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Marcus Folkesson <marcus.folkesson@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 26, 2022 at 8:55 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Jul 26, 2022 at 12:22 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> > Well it will work, because all values come out, however *during*
> > the transfer, not *after* the transfer as intended with the
> > STR signal.
>
> No. I think you missed one little but crucial detail. The strobe is
> edge, not level, while you consider CS as a level signal (only).

Aha! Then it works :)

> See Figure 7 and Table 9 in the datasheet you linked to. When STR is
> low, the data is not changed. Maybe it's not clear in this datasheet,
> I found somewhere
> in a more clear table.
>
> > At least how I see it ...?
>
> If what you are saying is true, the hardware is totally broken and I
> wouldn't use it. I.o.w. if the strobe passes all data when it's at low
> level and latches at low-to-high, it's broken by definition in my
> point of view.

I have seen strobes that are level-active in my life, but if you
say this one isn't then all is fine!

Yours,
Linus Walleij
