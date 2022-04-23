Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A954A50C2C2
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Apr 2022 01:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233305AbiDVWtP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Apr 2022 18:49:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234663AbiDVWsV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Apr 2022 18:48:21 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD2738B2DA
        for <linux-gpio@vger.kernel.org>; Fri, 22 Apr 2022 15:08:02 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-2ef5380669cso99088957b3.9
        for <linux-gpio@vger.kernel.org>; Fri, 22 Apr 2022 15:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rKAG+J5Q8lcvvd/biftxVJOIEqMrFvSTtBVDRerigCk=;
        b=gW2ZtWypeVc/O6j08D9/hby6Pss2xm53tySxwlkDAbxboHmNQ4lXaAVg6r7Pvyy9+J
         dZuggtnxZWNDRqiE5rHib9T8JFdYx6xMSzE7e13VM7rWGhOw8wsnDtBFKEoe7/GbSMRE
         dagY2aApKLUl2NfmqDv3lE7vzROus4LEohYSeX/dDKiKk1VW5LUzkWjlTfBB8azMNGpF
         0jid58yJIinT+wdN3WOcvT8UO9NYeq10Vf6JMU/q1RxVqa1kFUa0/zE5gFPl69uyaUJA
         P1kAw2HwyDZ3ZmY5SOZnFklOXUX/u02XXQcurPb7jq5isIZP/slUEvgRwFRN8I0r+rBO
         GHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rKAG+J5Q8lcvvd/biftxVJOIEqMrFvSTtBVDRerigCk=;
        b=YzcqDwhYcFVpiZx0sm0Rt+SEHbzMTCvZHpDrSKRMHb03ZoduRIcJe83FCC6+3fJIAr
         qBjntnqJhyoshqNsRazr1+FYyg3V80+GQIipI+Wvf4+XJoK54mzlh862J3xrFQtml8iZ
         LdC6lB2yVbfw0UqHaE9lKHrLRthnZG6QySkCtiypeSaiI7JCCGqavz6pkRT5d1HMyKJn
         pGQId3PNh8URnbj1/GdKlGBLogIG9xl9fyR9j4X3PuevMGPN0k50cA4tYgOSA9aub6GB
         EOQ/VSZEpCQjN7upWogcbYsDziLNq9CKqOJcE7W2grjpozRbf+rjETrLp8dvWJLhIEQJ
         2ZfQ==
X-Gm-Message-State: AOAM533LSN2UiIJ7sdMexuTlEEq1hqHZvD9zhhD+t0bB5+Rx18vL10DO
        NLWeGPqQEUnaRmPK7cQVhOx8Z4Or8CwWvfQ0j+emkA==
X-Google-Smtp-Source: ABdhPJyi/ikQ9hdlwSSUnoOGQLb3feHoaGPFFTBFoKKCXX8WPkAGeGuqi/XkQMXnVdVgTorUtasyV/+Uykb/P4sdCpg=
X-Received: by 2002:a81:5dc5:0:b0:2eb:3feb:686c with SMTP id
 r188-20020a815dc5000000b002eb3feb686cmr7290345ywb.268.1650665254777; Fri, 22
 Apr 2022 15:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220413060729.27639-1-arinc.unal@arinc9.com> <CACRpkdbbMFYNNjAKwhysKpu1JVh2JSB-N=Y8QMx1JvMhCPBpwg@mail.gmail.com>
 <26418320-64e0-3ed2-c792-7f72878b7592@arinc9.com> <CAMhs-H_d8jUa4=4eVjQxo+h-XeRgiMYC1H_xYtPLb8jHDVYL2Q@mail.gmail.com>
 <6cdec3bc-4715-29c8-f4a1-df1408940a75@arinc9.com>
In-Reply-To: <6cdec3bc-4715-29c8-f4a1-df1408940a75@arinc9.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 23 Apr 2022 00:07:23 +0200
Message-ID: <CACRpkdbebE3RiviZ3NiVL4W2S1HN7Q21jSma6abup_nEVjX6+w@mail.gmail.com>
Subject: Re: [PATCH 0/14] Refactor Ralink Pinctrl and Add Documentation
To:     =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Luiz Angelo Daros de Luca <luizluca@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        erkin.bozoglu@xeront.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 22, 2022 at 8:14 AM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:

> >> Thanks. There is a v2 of this series which has been waiting for a week=
,
> >> I hope that was the one you applied as you replied under v1 (I'm not
> >> sure which repository you applied this so I can't check myself).
> >
> > Linus adds patches through the linux-pinctrl tree as pinctrl maintainer=
. Check:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.gi=
t/log/?h=3Ddevel
>
> Thanks Sergio. I see v1 was applied, oops. What to do?

No problem, I backed it out (had to back out some stuff pulled on top too..=
.)
then re-pulled the stuff I pulled on top, then applied v2 on top.
Let's see how much I screwed up :D

Yours,
Linus Walleij
