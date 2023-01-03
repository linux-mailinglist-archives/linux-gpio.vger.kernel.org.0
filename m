Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1EF265BF6E
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Jan 2023 12:57:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbjACL4p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Jan 2023 06:56:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbjACL4o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Jan 2023 06:56:44 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF36267D;
        Tue,  3 Jan 2023 03:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672747003; x=1704283003;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AXk/n6944cGASrExFxh77p8UKQ39anjrn1SxgztQ/Qs=;
  b=kRIhQUW/4grEPhx4pXlc7+Gw2x0DsmEMsdCQq4GnE90OBTeaejXadjK2
   x29zGPIs9pSPrvqWR9EKAhztLxczI+xFAcdeJND7h+H37TTPXsNLqo6d2
   I76L/Ueyci5aDV79nVwf9OJ/5NSFmqY0o0CjnuYxtzzZoVTk+NwxT0OfM
   COEl325C4iUvA0TluTOV/R6VYEvkaM3tkzUIlCLNphsZDGbbNUizbpOLK
   QJpz5vH2ditBfuUKm1qkCfoYXr09lIK1ILsYeFLUNPjSDmsmt5Izu7TZf
   AusJLdKOhKzd+PV1zDY1kZLOM2/xnCYXNSNa7tHIYvabI16rYeRbSKXH7
   w==;
X-IronPort-AV: E=Sophos;i="5.96,296,1665439200"; 
   d="scan'208";a="28220512"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 03 Jan 2023 12:56:40 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 03 Jan 2023 12:56:41 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 03 Jan 2023 12:56:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672747000; x=1704283000;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AXk/n6944cGASrExFxh77p8UKQ39anjrn1SxgztQ/Qs=;
  b=dgu4a0GYR11rSGZmEk6pNrF40hANkH6mEYDLtgYhhBSWez8qUdfenAQd
   5rMGDH7quTcE4rkwQQECHpBWiTnUWhy9t17VLoSq7GvRccUgZuDCrwNq3
   UelAp31KYnpDIJQwEf+tmOpoeJb8AWWyT+gH2MmF2Emi0aVsiYKn63kY5
   A9xZHpwk3UGWL0PdBkF+MVesUTE6PUWXRfzoSHC6WsUSTlP+YZbzVh83h
   P53G6dpRj/du0ZGsNZRAC/CU6JEp6HrNFSW80NYzmuikhxuDi5lkhPYYc
   x6eeUZNxBRqI4gx38fOckqijmdbeqe7SVrsmF1KNzNaSlkBpg3wFm2zuV
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,296,1665439200"; 
   d="scan'208";a="28220511"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 03 Jan 2023 12:56:40 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A8B8A280056;
        Tue,  3 Jan 2023 12:56:40 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>, Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH 1/3] dt-bindings: gpio: Add optional ramp-up delay property
Date:   Tue, 03 Jan 2023 12:56:38 +0100
Message-ID: <2798796.Y6S9NjorxK@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Y6DtQ7PXPZ809P4C@pendragon.ideasonboard.com>
References: <20221212103525.231298-1-alexander.stein@ew.tq-group.com> <CACRpkdZ2G=HUTBMpXJrXeSh3kYgQQc8p8zaJZPL71HWA9362ZA@mail.gmail.com> <Y6DtQ7PXPZ809P4C@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Laurent,

Am Dienstag, 20. Dezember 2022, 00:01:23 CET schrieb Laurent Pinchart:
> On Thu, Dec 15, 2022 at 11:56:57AM +0100, Linus Walleij wrote:
> > Hi Laurent,
> >=20
> > thanks for the detailed brief!
> >=20
> > On Tue, Dec 13, 2022 at 12:45 PM Laurent Pinchart
> >=20
> > <laurent.pinchart@ideasonboard.com> wrote:
> > > The circuit we're looking at is
> > >=20
> > >   +----------+           +-----------+
> > >  =20
> > >   | SoC      |           |    VCC    |
> > >   |=20
> > >   |          |           |     _     |
> > >   |          |           |    =20
> > >   |          |           |    | | R  |
> > >   |          |           |    |
> > >   |          |           |    |_|    |
> > >   |     =20
> > >   |      [IOx|-----+-----|EN]--+     |
> > >   |     =20
> > >   |          |     |     | SN65DSI83 |
> > >  =20
> > >   +----------+    --- C  +-----------+
> > >  =20
> > >                   ---
> > >                  =20
> > >                    -
> > >                  =20
> > >                   GND
> > >=20
> > > The IOx pin is an open-drain output, the board has a 470nF capacitor =
to
> > > ground, and the SN65DSI83 has an internal pull-up off 200k=CE=A9. Thi=
s gives
> > > an RC time constant of 94ms, far from being negligible.
> > >=20
> > > The delay is caused by the combination of the open-drain nature of the
> > > output (an intrinsic property of the GPIO controller), the pull-up
> > > resistor (an intrinsic property of the SN65DSI83) and the capacitor on
> > > the line (a property of the board). DT is notoriously bad at modelling
> > > this kind of setup.
> >=20
> > Yeah :/
> >=20
> > It's not like we don't model discrete electronics, we do that a lot,
> > but as you say, it is really hard to know where to draw the line
> > in cases like this.
> >=20
> > > The alternative I proposed, adding a "GPIO delay" DT node to model th=
is,
> > > would also offer a centralized solution to the problem, but with
> > > additional complexity both at probe time and runtime.
> >=20
> > I have a slight preference for this, as it will be very explicit in the
> > device tree and we can just put all the code inside its own file and
> > depend on GPIO_OF so other HW description systems do not
> > need to include it.
> >=20
> > At the same time it feels a bit overengineered, so maybe just adding
> > this delay as in the patch with some strings attached like comments
> > and docs is yet the best. It feels like we need some more input to
> > reach consensus.
> >=20
> > > The regulator delays model the intrinsic delays when enabling or
> > > disabling a regulator, and they should stay. They address a different
> > > problem.
> >=20
> > OK right. But someone not knowing exactly what they are doing
> > will end up abusing the delay property on the delay line
> > also for this delay. The risk of that is lesser with a separate
> > delay box.
>=20
> That may be true, but I think we can also try to catch abuses in
> reviews. I would be a bit sad if we made life more difficult (and less
> efficient at runtime too) for legitimate users just because we are
> worried about abuses.

What is a legitimate user for you? Given the example in v2 of this series i=
t's=20
clear that this feature is an opt-in, both for the DT node as well as for=20
specifying a delay.
Another benefit of using a dedicated driver: It also automatically handles=
=20
things like setting multiple GPIOs at once.

> Another thing I've been thinking about is that we may not always want to
> wait for the GPIO delay. Some consumers may not care when the GPIO line
> reaches the desired state as long as it eventually does, or maybe they
> need to perform multiple operations (such as enabling/disabling
> regulators and/or clocks) and only need a synchronization point for a
> group of operations. All that would be pretty hard to handle, and maybe
> it's a problem we'll look at only when needed (and hopefully never).

If you don't care about rising time, do not use gpio-delay for that GPIO, o=
r=20
just don't specify a ramp-up delay in the gpio-cells, aka setting to 0.
The more complex synchronisation example you mentioned probably needs a=20
similar dedicated driver for grouping those resources.

Best regards,
Alexander


