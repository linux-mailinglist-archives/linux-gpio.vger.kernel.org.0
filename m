Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 420126DD6FB
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Apr 2023 11:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbjDKJgB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Apr 2023 05:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjDKJfg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Apr 2023 05:35:36 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF07449CB;
        Tue, 11 Apr 2023 02:34:53 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id b15so2755930qkj.0;
        Tue, 11 Apr 2023 02:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681205692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1nO+Cpgpb/TzGbvoOZXWjSbOjtnB5mkQYr/7rdByO0=;
        b=KhjZm3BrvPkpDHCOJfSuNUC/eJXL0i2UmUI2trMxgQihk6wGAq5eukbk+7sjjjxMay
         FuuKa39M39Xtn1QEDOe88VGIgado8Ua+FMZg/bEVNHnhJPSiRE3AMrDnQa7Ay1gX6i1t
         aA9OpAWWvanhx9LuSapYuHgcAz94GH1KrB6xIcu4wpuRz5dujhBZ0ZJ44qQST3IHLGyr
         oHJD29h2f5uYr5zqa1DA8dJyDOdSIyLqUhNQYu5Mrcq6fkyR5Gxiw1xHz3vyoO/uKiS8
         Wcir+VDIPSsfOdHH7BILVKmiiUDUhTY24b/gAStq50wFiVPUDLHNYK6jLBpZUELzV5KN
         zUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681205692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1nO+Cpgpb/TzGbvoOZXWjSbOjtnB5mkQYr/7rdByO0=;
        b=ecpBf6HCUpR1U+J5qBY4tJtfitT5qayRb5Um7fnIf7tioFj5scRuExP6Aq+hFGmdmF
         i9+dX82mTrhaf+H3Lgvi2rxgrLHBqrbnDh3Mk5H2SQ/VRNxq8YrzuK12OSXyYsYzjr3I
         kXCxZXb2btJfqjQnPcHJ8SGeeLP4e1dL1cxdooFzk4z2zCK3suuiU6t7Og0fHyadY3qo
         ex1xN8HVp09u5FbKlEpTnb7UeQIBTysDy9p0lTZLQyqzrY9NYzhLubKFPtE0bDKHRmjc
         kdRnPbVWa6MEKurI7afMdsMbHdmYT/uhW/slGH5UsayHvue9iuBRfcsn0elVqEY0/DfU
         np7A==
X-Gm-Message-State: AAQBX9enJnmPsfelhHOIOzUGJKCu0oWCyjRCksFKL6yRWvbk7G4BknVK
        ei/vbcNuVk7QIRcRH/ciozh1t+s2vQ8F8BdKAm4=
X-Google-Smtp-Source: AKy350Yi7o7NxrVNJ1sgjEuPPNgFp1lYeet38OY5N2fnMdfU5j4Ves7rO3R76tP0fEqty4gWGGvXOnCr86f6tILvgGg=
X-Received: by 2002:a05:620a:c46:b0:743:6092:91b4 with SMTP id
 u6-20020a05620a0c4600b00743609291b4mr4334915qki.14.1681205692111; Tue, 11 Apr
 2023 02:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230406093344.917259-1-alexander.stein@ew.tq-group.com>
 <ZDBnnKy7QF0KZuZd@surfacebook> <3231223.aeNJFYEL58@steina-w>
In-Reply-To: <3231223.aeNJFYEL58@steina-w>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 11 Apr 2023 12:34:16 +0300
Message-ID: <CAHp75VeR5R_CqWNT=Fpbyp-YSeo+3QXBnR62C=K_tyr-qQ2MVw@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] gpio: Add gpio-delay support
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 11, 2023 at 10:19=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
> Am Freitag, 7. April 2023, 20:57:32 CEST schrieb andy.shevchenko@gmail.co=
m:
> > Thu, Apr 06, 2023 at 11:33:41AM +0200, Alexander Stein kirjoitti:

...

> > > thanks for the feedback I've received. This is the first non-RFC seri=
es
> > > for
> > > adressing a platform specific ramp-up/ramp-down delay on GPIO outputs=
.
> > >
> > > Changes compared to RFC v2 are mentioned in each patch.
> >
> > Reading the (poor?) documentation does not clarify the use case.
> > Looking at them I think that this can be implemented as debounce.
>
> Debounce for GPIOs? There is nothing like that yet.

At least that what we have already done in the code, you can just
provide a similar feature to the output pins, no?

> > Also I have no clue why it's so important that we _need_ to have a
> > driver for this. We have plenty of consumer drivers that implement
> > delays on ramping up or down or whatever if they need.
>
> But this delay I am dealing with is actually not consumer dependent, e.g.=
 a
> power-on delay specified in a datasheet. Instead this driver deals with a
> platform-specific curiosity, e.g. RC-circuit on an open-drain output. So =
this
> is something which sits inbetween ICs.
> In the RFC we came to the conclusion to not adjust (each) consumer to dea=
l
> with this, given this will be rarely used. Instead provide a generic way =
for
> specifying this delay.

So, taking the above into consideration, why is it GPIO property to
begin with? This is PCB property of the certain platform design that
needs to be driven by a specific driver, correct?
At the very least this is pin configuration (but external to the SoC),
so has to be a _separate_ pin control in my opinion.

> > Which part(s) did I got wrong?
>
> Maybe there needs to be an explicit example in the bindings document what=
's
> the actual issue to deal with.
> Right now if a GPIO is set, it is expected the signal on the receiver sid=
e has
> changed as well within a negligible time as well. But due to external rea=
sons
> (see RC_curcuit above) the change on the receiver side can occur much lat=
er,
> >100ms in my case.

I still don't understand why it is a problem. If each signal is
delayed then the caller should be aware of the delay, no?


--
With Best Regards,
Andy Shevchenko
