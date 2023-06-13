Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3034B72E65C
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jun 2023 16:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241194AbjFMOzt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jun 2023 10:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239870AbjFMOzs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jun 2023 10:55:48 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAEE310FC
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 07:55:47 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-43b4b5378ecso469322137.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 07:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686668147; x=1689260147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUjBNQR3ayKs+c7PtNJMktv7NPrLUhbz12wWwvQ4mnE=;
        b=zBmRFI3G1eexEjmXLDT7CdfJ8PPO20byDmYp9SBqqUFGFdsVzlotKgIwWK5JEYLN5h
         LTX71RchE7A6EJ0cDhvVRxamsPqv9+FPOEtzIpvtyJ1j9xFT2kRDnjOGUTpT2TeUFj9a
         3q7Lno/PlspWCdt04VG0dCZnmg/6r2NFiojbkc/J4EWU2GGLLlk83kxUY2XwZPiD4rF0
         WOofcJdfGjbXdiVuvgye14FzFK8qrsO5oirRN2rp9bs6DjaNXKHvGSZhQfCvJpd6xtrp
         Tbp8UtblfHOK0Gby+lnmksuCRgotre8zfyt2lGSs4zbabXR81ZgSHoXFLKu/lPLJwqAF
         whSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686668147; x=1689260147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eUjBNQR3ayKs+c7PtNJMktv7NPrLUhbz12wWwvQ4mnE=;
        b=ghcgV2EjPGfzOobCSDcAlP2FoSkMU8G6Jqy2Cm5MQVZvLvmqfjkREWT7Ttslsk0Zwa
         heK13DeypmHz+ZMbF6WToXG3Y9kLCcPRO2ywGSluocpioV42LzM7s43sx5A7kHuQDWcZ
         sqiY2pcYUcZaX7V3rhaJPOUWrzS08rR6t5rRjYYElHPd9qlgCCWWpzYKxGtU4rEct/H3
         NovVA1cI86JaUscPQmewzcejZ7YSbecicDwXvrAb/3Z/2Pa9TT2Q1PH+ZBBrzh9t1OM9
         G3I3P5c+PN7cgLude5QIRpuZUyvGTZcmw0l2bUrULkd69Zpj18qrMjxQdnDlrVsUPdBy
         Q5Dg==
X-Gm-Message-State: AC+VfDxlipWvWRUkpt40JX8UYHAbmlU541ckWwns/9Bx94nWQaFG3iTV
        QO2hbwbyzVSOHjY1ndwTbRRBTbKqUTtwrCsZsE36yg==
X-Google-Smtp-Source: ACHHUZ6zGp2wWUBczZ3EZNkyAM/WjSHCJx+x6suhmZczY/H+a7+tSuxScOYQkbuwQxm7A/Mg2w5Oem1IJtilPRj83Mg=
X-Received: by 2002:a05:6102:e4b:b0:43b:431d:8d51 with SMTP id
 p11-20020a0561020e4b00b0043b431d8d51mr6882544vst.8.1686668146887; Tue, 13 Jun
 2023 07:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
 <20230601054549.10843-15-nikita.shubin@maquefel.me> <cacd8ea8-f834-4983-20ff-a875fee8011a@linaro.org>
 <CACRpkdZVhwsoHg3jOWuXtdL5kqbnbHjEYJOGsBCTcfLrVKbX3w@mail.gmail.com>
In-Reply-To: <CACRpkdZVhwsoHg3jOWuXtdL5kqbnbHjEYJOGsBCTcfLrVKbX3w@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 13 Jun 2023 16:55:35 +0200
Message-ID: <CAMRc=MfgBAnSwLTKuCZ9WgbX_oWoB2xLk=J86QCo9YkcfWaq_Q@mail.gmail.com>
Subject: Re: [PATCH v1 33/43] dt-bindings: gpio: Add Cirrus EP93xx
To:     Linus Walleij <linus.walleij@linaro.org>
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
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 2, 2023 at 9:41=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Thu, Jun 1, 2023 at 10:20=E2=80=AFAM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>
> > > +title: EP93xx GPIO controller
> > > +
> > > +maintainers:
> > > +  - Linus Walleij <linus.walleij@linaro.org>
> > > +  - Bartosz Golaszewski <brgl@bgdev.pl>
> >
> > Did you choose correct maintainers? Bartosz, Linus, do you take care
> > about EP93xx platform?
>
> I'm fine with it (I have a platform).

I don't but I'm actually not sure how DT bindings maintainership works
- do GPIO bindings all fall under the GPIO jurisdiction automatically?

Bart
