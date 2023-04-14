Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2EF56E1CC1
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Apr 2023 08:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbjDNGhn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Apr 2023 02:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjDNGhm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Apr 2023 02:37:42 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B371C198A;
        Thu, 13 Apr 2023 23:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681454261; x=1712990261;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xBn8MtZuH2iWGB8W3OmOoslaEr4r2CGHf9uFExJxtpQ=;
  b=Fz7LXkXcXWxXaSaCo+eiW87TQb8/W0xX3zZCKLxwladStnRSaIAQ4R5l
   NTno1JhEKE4h+eyk5knLwnRTE6MjVgXfRLz6wOa+7sPjYpVAvCWQMYWNI
   peCyln2QkKG/rPM0+jhsh6VWv5zcZTye2n7HdmIou+yaJE9HLyHrJaCfY
   ls/vT4g5i9wB8UpSZqxbbO2Ys86m29Hx6QrYHIia00hmQ1CIKFWKfyPhv
   vnEOCgbrhrB4zo0sT225xp/1k3DilKONUPmxcFz8nClp9rR7d/rTHMx4b
   mKTF8vEX0b3fbesTCXGCzfa1RtSIf3QIFoxirsp2sD2Jn/mSIjBQdjiDq
   w==;
X-IronPort-AV: E=Sophos;i="5.99,195,1677538800"; 
   d="scan'208";a="30321016"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 14 Apr 2023 08:37:38 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 14 Apr 2023 08:37:39 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 14 Apr 2023 08:37:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681454258; x=1712990258;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xBn8MtZuH2iWGB8W3OmOoslaEr4r2CGHf9uFExJxtpQ=;
  b=IEexwZr56XmS01oTaZ86DmbEpmJE1Lzs3MJ0eo+R4nqt7GfyFFgZVoLj
   GU4Lt86aW0yx6k/vk6Y8BMfNaMo4Z742LsutlTUZq9BvjeCqm1axgytKt
   YEe85i3KlQNcbB617c0QpFHqiQGV6N6aqvTYmeoq5xufRPVKQ+eTcruxO
   /bitkwD19YZiGetyKFWaMKEkU8MccwiyAh+QRMGSoqTF4wMh/jphC3OOS
   4js0tqJyP7S1tcBDjBTYkqnGWaryn3PJUIyaS7OPz/QlxV6xgqin0vmoU
   PqRMVjI2XRmg9M5rVl83N7nAuw6w5UJEUkmz3nwlZp/cgrQyB1F/sHodd
   w==;
X-IronPort-AV: E=Sophos;i="5.99,195,1677538800"; 
   d="scan'208";a="30321015"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 14 Apr 2023 08:37:38 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8D1BC280056;
        Fri, 14 Apr 2023 08:37:38 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 0/3] gpio: Add gpio-delay support
Date:   Fri, 14 Apr 2023 08:37:36 +0200
Message-ID: <4800953.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAHp75VeR5R_CqWNT=Fpbyp-YSeo+3QXBnR62C=K_tyr-qQ2MVw@mail.gmail.com>
References: <20230406093344.917259-1-alexander.stein@ew.tq-group.com> <3231223.aeNJFYEL58@steina-w> <CAHp75VeR5R_CqWNT=Fpbyp-YSeo+3QXBnR62C=K_tyr-qQ2MVw@mail.gmail.com>
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

Am Dienstag, 11. April 2023, 11:34:16 CEST schrieb Andy Shevchenko:
> On Tue, Apr 11, 2023 at 10:19=E2=80=AFAM Alexander Stein
>=20
> <alexander.stein@ew.tq-group.com> wrote:
> > Am Freitag, 7. April 2023, 20:57:32 CEST schrieb=20
andy.shevchenko@gmail.com:
> > > Thu, Apr 06, 2023 at 11:33:41AM +0200, Alexander Stein kirjoitti:
> ...
>=20
> > > > thanks for the feedback I've received. This is the first non-RFC
> > > > series
> > > > for
> > > > adressing a platform specific ramp-up/ramp-down delay on GPIO outpu=
ts.
> > > >=20
> > > > Changes compared to RFC v2 are mentioned in each patch.
> > >=20
> > > Reading the (poor?) documentation does not clarify the use case.
> > > Looking at them I think that this can be implemented as debounce.
> >=20
> > Debounce for GPIOs? There is nothing like that yet.
>=20
> At least that what we have already done in the code, you can just
> provide a similar feature to the output pins, no?

Adding this kind of property to outputs (GPIO chips) has been rejected=20
already, both on DT side as well as libgpio side, see [1] and [2].

> > > Also I have no clue why it's so important that we _need_ to have a
> > > driver for this. We have plenty of consumer drivers that implement
> > > delays on ramping up or down or whatever if they need.
> >=20
> > But this delay I am dealing with is actually not consumer dependent, e.=
g.
> > a
> > power-on delay specified in a datasheet. Instead this driver deals with=
 a
> > platform-specific curiosity, e.g. RC-circuit on an open-drain output. So
> > this is something which sits inbetween ICs.
> > In the RFC we came to the conclusion to not adjust (each) consumer to d=
eal
> > with this, given this will be rarely used. Instead provide a generic way
> > for specifying this delay.
>=20
> So, taking the above into consideration, why is it GPIO property to
> begin with? This is PCB property of the certain platform design that
> needs to be driven by a specific driver, correct?

True this is induced by the PCB, but this property applies to the GPIO,=20
neither the GPIO controller output, nor the GPIO consumer is aware of.
So it has to be added in between. The original idea to add a property for t=
he=20
consumer driver is also rejected, because this kind of behavior is not limi=
ted=20
to this specific driver.
That's why the delay is inserted in between the GPIO output and GPIO consum=
er.

> At the very least this is pin configuration (but external to the SoC),
> so has to be a _separate_ pin control in my opinion.

Sorry, I don't get what you mean by _separate_ pin control.

> > > Which part(s) did I got wrong?
> >=20
> > Maybe there needs to be an explicit example in the bindings document
> > what's
> > the actual issue to deal with.
> > Right now if a GPIO is set, it is expected the signal on the receiver s=
ide
> > has changed as well within a negligible time as well. But due to extern=
al
> > reasons (see RC_curcuit above) the change on the receiver side can occur
> > much later,>=20
> > >100ms in my case.
>=20
> I still don't understand why it is a problem. If each signal is
> delayed then the caller should be aware of the delay, no?

Then we are back to square one, to decide where to take consideration of th=
at=20
delay. Up until now there have been several proposals:
1. GPIO consumer [3]
2. GPIO controller [4]
3. GPIO delay node (this series)

1. and 2. have been rejected, because that delay is taken care of where it =
is=20
not caused.
3. explicitly declares the location of that delay. It's less/not intrusive =
to=20
existing parts and purely optional. Given this is a rare case, but not limi=
ted=20
to us, option 3 seems a good way to go.

Best regards,
Alexander

[1] https://lore.kernel.org/linux-gpio/CAL_JsqLeqpMuRkvpT2-x5q+8e4bHf4oLDML=
2QqCOgRMAg8=3DCsA@mail.gmail.com/
[2] https://lore.kernel.org/linux-gpio/
CACRpkdYioW1GROHFxA1vuAEiXqHh6fAu5CXNLcTvW_w3mWjSPw@mail.gmail.com/
[3] https://lore.kernel.org/dri-devel/20221209083339.3780776-1-alexander.st=
ein@ew.tq-group.com/
[4] https://lore.kernel.org/linux-gpio/20221212103525.231298-1-alexander.st=
ein@ew.tq-group.com/

=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


