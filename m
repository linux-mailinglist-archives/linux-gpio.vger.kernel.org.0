Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC3D76DD3EF
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Apr 2023 09:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbjDKHTk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Apr 2023 03:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbjDKHTO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Apr 2023 03:19:14 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B57B2D5F;
        Tue, 11 Apr 2023 00:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681197545; x=1712733545;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cZXvDbQl28WDJ14V+pbr3auBRhAtraEXByP7krH+22w=;
  b=OH5n7I0xofBq6b92yFit7gh4J3F5VOfyRTzTFbgdbYHaChOAYkpCUqaf
   pPqK2I20kQfDQ6IqPlxLQSnxJUJHMrEYLTC0UoVMt8Tt9ZWy5qziiFBDs
   bJr1gVs726a1X8+laQPGi/7Wns19G0hnhESJUeEoktAUuShroUyrDnk3F
   wBp71Vhbw7GG6KQyX45Fp/dEfUDWQnmtlv1mLQuC7cKhLJ3wziBSHDybs
   icZnic1Bu4BEVIDDOhcC+r+l14K+/pTC00MmBJft4fP901PawL+BqwAXn
   AowmFP5JDDWJKpLj05sO2TL24F0eXKOIOzJzJHMmzZKstFwsa/FsQpzxx
   A==;
X-IronPort-AV: E=Sophos;i="5.98,336,1673910000"; 
   d="scan'208";a="30238425"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 11 Apr 2023 09:19:03 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 11 Apr 2023 09:19:03 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 11 Apr 2023 09:19:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681197543; x=1712733543;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cZXvDbQl28WDJ14V+pbr3auBRhAtraEXByP7krH+22w=;
  b=mHqLQAIIzETjpZruemlbNjCIUNhvXfYXusdx26zUGGBneQUQbsVA2ii2
   pSpKYbrf3XGr2QuLZntqHTIHjE4qIxlSFIw9MRNPnoFnhJWT9gf1MmZtJ
   qiWTtG9Q13uFbB2TD74+VBqrUUpxL92AaiVECzNa6+6vWXsPfmCScxedC
   ea2+W7Nv5u43AvA/PtPCsSuhc+Eix4KvodlM0KWPszi693gORbI9UYDgy
   jc/gKJEedDm6u5gSkQDD4agJUAsgae4pQBsc7NID6TIYXVd98u8eAxTeb
   lIAWMW6gUrg7aJa2ogPi9eSUISXbSR7/3dAI0bvQsUuAjlnuXA0PLRpjx
   g==;
X-IronPort-AV: E=Sophos;i="5.98,336,1673910000"; 
   d="scan'208";a="30238424"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 Apr 2023 09:19:02 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A6132280072;
        Tue, 11 Apr 2023 09:19:02 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     andy.shevchenko@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 0/3] gpio: Add gpio-delay support
Date:   Tue, 11 Apr 2023 09:19:01 +0200
Message-ID: <3231223.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <ZDBnnKy7QF0KZuZd@surfacebook>
References: <20230406093344.917259-1-alexander.stein@ew.tq-group.com> <ZDBnnKy7QF0KZuZd@surfacebook>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

Am Freitag, 7. April 2023, 20:57:32 CEST schrieb andy.shevchenko@gmail.com:
> Thu, Apr 06, 2023 at 11:33:41AM +0200, Alexander Stein kirjoitti:
> > Hello everyone,
> >=20
> > thanks for the feedback I've received. This is the first non-RFC series
> > for
> > adressing a platform specific ramp-up/ramp-down delay on GPIO outputs.
> >=20
> > Changes compared to RFC v2 are mentioned in each patch.
>=20
> Reading the (poor?) documentation does not clarify the use case.
> Looking at them I think that this is can be implemented as debounce.

Debounce for GPIOs? There is nothing like that yet.

> Also I have no clue why it's so important that we _need_ to have a
> driver for this. We have plenty of consumer drivers that implement
> delays on ramping up or down or whatever if they need.

But this delay I am dealing with is actually not consumer dependent, e.g. a=
=20
power-on delay specified in a datasheet. Instead this driver deals with a=20
platform-specific curiosity, e.g. RC-circuit on an open-drain output. So th=
is=20
is something which sits inbetween ICs.
In the RFC we came to the conclusion to not adjust (each) consumer to deal=
=20
with this, given this will be rarely used. Instead provide a generic way fo=
r=20
specifying this delay.

> Which part(s) did I got wrong?

Maybe there needs to be an explicit example in the bindings document what's=
=20
the actual issue to deal with.
Right now if a GPIO is set, it is expected the signal on the receiver side =
has=20
changed as well within a negligible time as well. But due to external reaso=
ns=20
(see RC_curcuit above) the change on the receiver side can occur much later=
,=20
>100ms in my case.

Best regards,
Alexander

> P.S. Are we going to have a _driver_ per each subtle feature like this?

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


