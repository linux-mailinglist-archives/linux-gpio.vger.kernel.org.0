Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3CBC72EA96
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jun 2023 20:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232117AbjFMSKs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jun 2023 14:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235583AbjFMSJy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jun 2023 14:09:54 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A356B1BD3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 11:09:52 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-56d0dbbfc61so34040347b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 11:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686679792; x=1689271792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TESX54vILo0n1pvOdyskuCPzlhG1Qnfeg9SAHlfLO0E=;
        b=STmgcOFSBqUfWxjAW64cFmNH6uoJDn2lO2dLrhUJ9cxPuOhckgRI9mAJ6u7R7qpRGo
         YE3x4z0j0Phe4QLFaz5q8fEY4Ty0pK/lv2rapm9V4xFNa6xRYDYClcHSvApPXvKvoD4Y
         ALl1yMNj/Mb6m8whGtUPcNMZ1k4ggGPUh5DRumBOpQPS1yyTfCErDCIILGCnaPzGNRVI
         aabGg1UgUqaV46uBJmz0r/kdAp026fEypOwZHRQioH34dEV2WiSygMxM9zYh973ZUBYh
         561vMTvegVRC8i5V/OrsbmV+/FfVHSvJ+s16bA+L4/fGQqzSQg5sYkQt5Zj6nCRwJUEl
         brfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686679792; x=1689271792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TESX54vILo0n1pvOdyskuCPzlhG1Qnfeg9SAHlfLO0E=;
        b=DsbS/oTF4binTQU/1/4LllTqdRm602t0rPG29stThLAJuMtyfN+2E0ePQdy+AKZtnW
         KVJ9NyvllvhyHq/enIcFYzufMVwSnk2BNDVsp10MJPNadmVBmv90T8IVbd4wIrMETAgf
         6IyQFw0tbE7r5xyJ9ssWPzq2Uj/e1nzJItGTCjHjZRqUV0x3vcjhmVd0POkfOx5ogBWV
         c3Rc2qonpVM+2yJ9AzuCWVkKOIjgLP6gTQWS+GKQF1V7MlExlxyEJ/k9SG4IIXpRY3W2
         hiQosTLAKhXH9umTWWv+TLOveBH+Hj5J/ICHbyRnbovExX5lRM/6L0WzsCkxhB2KAF9y
         UGuw==
X-Gm-Message-State: AC+VfDx8UcuTpXJK7qnoPC8ldUllbQWEoOTikc4aEK9BckRvuZtVhmlR
        VnckgeUPcgrXRRY5VBGwRKinxdiEdPOJ/Iqs21pbfQ==
X-Google-Smtp-Source: ACHHUZ4gbDPGd/3NVLS7j+rLPJi4AjmZ5nwQ+/jbPcc7n0nq76nZz+kSiGmAsCXrZAwPPSZBCVIp3TDFsllfdqAmOZE=
X-Received: by 2002:a25:a506:0:b0:ba8:3613:76a8 with SMTP id
 h6-20020a25a506000000b00ba8361376a8mr2590951ybi.41.1686679791771; Tue, 13 Jun
 2023 11:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
 <20230601054549.10843-15-nikita.shubin@maquefel.me> <cacd8ea8-f834-4983-20ff-a875fee8011a@linaro.org>
 <CACRpkdZVhwsoHg3jOWuXtdL5kqbnbHjEYJOGsBCTcfLrVKbX3w@mail.gmail.com> <CAMRc=MfgBAnSwLTKuCZ9WgbX_oWoB2xLk=J86QCo9YkcfWaq_Q@mail.gmail.com>
In-Reply-To: <CAMRc=MfgBAnSwLTKuCZ9WgbX_oWoB2xLk=J86QCo9YkcfWaq_Q@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 13 Jun 2023 20:09:40 +0200
Message-ID: <CACRpkdab48ag5jbACrN-z4CSV=Vnd5kbni=yK6crzK6GsE4iTA@mail.gmail.com>
Subject: Re: [PATCH v1 33/43] dt-bindings: gpio: Add Cirrus EP93xx
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Peters <mpeters@embeddedts.com>,
        Kris Bahnsen <kris@embeddedts.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 13, 2023 at 4:55=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Fri, Jun 2, 2023 at 9:41=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
> > On Thu, Jun 1, 2023 at 10:20=E2=80=AFAM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:

> > > Did you choose correct maintainers? Bartosz, Linus, do you take care
> > > about EP93xx platform?
> >
> > I'm fine with it (I have a platform).
>
> I don't but I'm actually not sure how DT bindings maintainership works
> - do GPIO bindings all fall under the GPIO jurisdiction automatically?

Not really, more on the people selected by the person writing the
bindings, confirmed by them being merged.

Traditionally, Linux as the biggest software project with the most
active subsystem maintainers do the reviewing and take the
responsibility for them.

Technically, e.g. BSD people could appear
on the devicetree mailinglist and review patches and suggest
maintainership from their side, but I haven't seen them much
around. Neither Apple Computer or anyone else who ought
to be there but isn't.

Yours,
Linus Walleij
