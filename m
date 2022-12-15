Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DECC64D9D8
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Dec 2022 11:57:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbiLOK5S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Dec 2022 05:57:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbiLOK5M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Dec 2022 05:57:12 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0A0B2E690
        for <linux-gpio@vger.kernel.org>; Thu, 15 Dec 2022 02:57:09 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-3b5d9050e48so36161967b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 15 Dec 2022 02:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8xgawo/jT/WZB/xT4ixkGLWrHF5TMWAcVs3g9/8wqM=;
        b=jlsR4CANeGOPhodCJDcVVzLcZmuoOrfnfctYMh8Ey/rJNSAAAw+PSh+sbPCy00CMUK
         +EcuJxF3cRH9/eOVyCUHRUyj7IBe9uSb3OB/+No52R/Ugx8fhZWwicEcQzCnuu262q9G
         KsTr/mfM40zKo98uKSl0eqRXA7ZqRu0iMDTVZVbfEyrelxLZiofP2TkXZ56AhNuPXbyA
         GHRHkVqXZX7RkLHY8+rvBhfAHfXiwrhjBPD5VKO3P6kifO0dhT8+Dvk5xuGvyYfNAskB
         h3kX/j0TSSJUd4VL4z2raZbGbRQTUCOaam6tcG2LE425F+r3YceUrdFTUNsPKWFq279x
         jqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t8xgawo/jT/WZB/xT4ixkGLWrHF5TMWAcVs3g9/8wqM=;
        b=u6l91PglbzC1MJmhQnT+iY1CjcktyUGx8MSM+xaCW6y4hBcgMEFo88CO3a21dahHoA
         NqQtlW/aZG7cKToVijKtJJ6lJ5VuMOi8Nk/4oKbFM6ptxwQ0AJHOKTXq61h3MCeqUtID
         HtaofUwzK9M8gBmtT6vGhH/MSHURf7hCLJwCZ9+2mzwJzeP4cl9af6gbm84Gkc4p9FOe
         zxQdB+imZJ/lpwmcayX1PjPVEsGs8k4+bkliAZmXsAX99KioeTyxxAKmtrMDzh2Ch5IL
         c2JdFOdNj0hyJ9AF1EqRfUHhexx/Eb+TGhLLL6Xqv3crQz2ZW5lz4BU7mICI3A4V84H+
         68xg==
X-Gm-Message-State: ANoB5pnv7YgtI5rxJJth0mXLRYxkAmMNw64E3OiummJG40gqEZn2xGOI
        OWDK6v8daoJoaPIxrDUfu2WseRbJEJgKExj5pgODKg==
X-Google-Smtp-Source: AA0mqf5WA/yjmATtBLSYZL0zvHYGqaiWB2l82pIOL8Qz2xIElIRNP7vVCdcT5pILwpKUYt0VTR2oXUVbwfaHew1gcFc=
X-Received: by 2002:a81:b54b:0:b0:391:f64b:e3bb with SMTP id
 c11-20020a81b54b000000b00391f64be3bbmr26240950ywk.49.1671101829025; Thu, 15
 Dec 2022 02:57:09 -0800 (PST)
MIME-Version: 1.0
References: <20221212103525.231298-1-alexander.stein@ew.tq-group.com>
 <20221212103525.231298-2-alexander.stein@ew.tq-group.com> <CACRpkdYioW1GROHFxA1vuAEiXqHh6fAu5CXNLcTvW_w3mWjSPw@mail.gmail.com>
 <Y5hl1Sb8csSkbrDh@pendragon.ideasonboard.com>
In-Reply-To: <Y5hl1Sb8csSkbrDh@pendragon.ideasonboard.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Dec 2022 11:56:57 +0100
Message-ID: <CACRpkdZ2G=HUTBMpXJrXeSh3kYgQQc8p8zaJZPL71HWA9362ZA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: gpio: Add optional ramp-up delay property
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Laurent,

thanks for the detailed brief!

On Tue, Dec 13, 2022 at 12:45 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> The circuit we're looking at is
>
>   +----------+           +-----------+
>   | SoC      |           |    VCC    |
>   |          |           |     |     |
>   |          |           |     _     |
>   |          |           |    | | R  |
>   |          |           |    |_|    |
>   |          |           |     |     |
>   |      [IOx|-----+-----|EN]--+     |
>   |          |     |     |           |
>   |          |     |     | SN65DSI83 |
>   +----------+    --- C  +-----------+
>                   ---
>                    |
>                    -
>                   GND
>
> The IOx pin is an open-drain output, the board has a 470nF capacitor to
> ground, and the SN65DSI83 has an internal pull-up off 200k=CE=A9. This gi=
ves
> an RC time constant of 94ms, far from being negligible.
>
> The delay is caused by the combination of the open-drain nature of the
> output (an intrinsic property of the GPIO controller), the pull-up
> resistor (an intrinsic property of the SN65DSI83) and the capacitor on
> the line (a property of the board). DT is notoriously bad at modelling
> this kind of setup.

Yeah :/

It's not like we don't model discrete electronics, we do that a lot,
but as you say, it is really hard to know where to draw the line
in cases like this.

> The alternative I proposed, adding a "GPIO delay" DT node to model this,
> would also offer a centralized solution to the problem, but with
> additional complexity both at probe time and runtime.

I have a slight preference for this, as it will be very explicit in the
device tree and we can just put all the code inside its own file and
depend on GPIO_OF so other HW description systems do not
need to include it.

At the same time it feels a bit overengineered, so maybe just adding
this delay as in the patch with some strings attached like comments
and docs is yet the best. It feels like we need some more input to
reach consensus.

> The regulator delays model the intrinsic delays when enabling or
> disabling a regulator, and they should stay. They address a different
> problem.

OK right. But someone not knowing exactly what they are doing
will end up abusing the delay property on the delay line
also for this delay. The risk of that is lesser with a separate
delay box.

Yours,
Linus Walleij
