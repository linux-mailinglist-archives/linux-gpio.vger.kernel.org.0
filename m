Return-Path: <linux-gpio+bounces-7733-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EC39183B1
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 16:11:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C25071F233E4
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 14:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5CE5185E46;
	Wed, 26 Jun 2024 14:11:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173F318411D
	for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 14:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719411061; cv=none; b=bCQ7N7wgdG1YHzYquQUPT2Vdgz/4Ru4l9ycrykMNLafMGw7e5l/ynnv2Rn6osB8Bd/rFZ4VEMIw0XnYeOHCBy8/BeHNVf7GtmFzjxDWv21eYV0Ms401vR0RrwBvMU9j1nG4JiAxdjyFKTzTToeLbRqk8IjhoLeVr8522HDFHiuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719411061; c=relaxed/simple;
	bh=WYPpi0PRU/8DfWUsZxGzlqqtmDQV7dcd1f8cYkoIt98=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tagtm21JoW1b25c4WzN5/aV3jb8S5PWE+rtzLmt70JpegXZpIllhFOZtkPB8DuQc/cNMBH1j/wmwcl29ACKESu18F6d43vCg5Zl+0jdJJ5fpjEAAkLmWf+FRK79eTOhWX0SWlepnQAQvhwEnjPaVJ9KUk8V3RT5g85Awbs7zwnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sMTM5-0003BI-A2; Wed, 26 Jun 2024 16:10:37 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sMTM4-0059Aa-7G; Wed, 26 Jun 2024 16:10:36 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sMTM4-000C0z-0S;
	Wed, 26 Jun 2024 16:10:36 +0200
Message-ID: <8d7ea409a4e1a6cfcbee7f493c9073b172cc100d.camel@pengutronix.de>
Subject: Re: [PATCH v3 7/9] reset: eyeq: add platform driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: =?ISO-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
  Conor Dooley <conor+dt@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Lee
 Jones <lee@kernel.org>,  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Date: Wed, 26 Jun 2024 16:10:36 +0200
In-Reply-To: <D2A00Y4TJYTS.1RMR2FSNW7KQ2@bootlin.com>
References: <20240620-mbly-olb-v3-0-5f29f8ca289c@bootlin.com>
	 <20240620-mbly-olb-v3-7-5f29f8ca289c@bootlin.com>
	 <e2f129fc42d26cde50e1de0bc80ef0db51b7f693.camel@pengutronix.de>
	 <D2A00Y4TJYTS.1RMR2FSNW7KQ2@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

Hi Th=C3=A9o,

On Mi, 2024-06-26 at 15:55 +0200, Th=C3=A9o Lebrun wrote:
> Hello Philipp,
>=20
> On Tue Jun 25, 2024 at 11:17 AM CEST, Philipp Zabel wrote:
> > On Do, 2024-06-20 at 19:30 +0200, Th=C3=A9o Lebrun wrote:
> > > Add Mobileye EyeQ reset controller driver, for EyeQ5, EyeQ6L and EyeQ=
6H
> > > SoCs. Instances belong to a shared register region called OLB and get=
s
> > > spawned as auxiliary device to the platform driver for clock.
> > >=20
> > > There is one OLB instance for EyeQ5 and EyeQ6L. There are seven OLB
> > > instances on EyeQ6H; three have a reset controller embedded:
> > >  - West and east get handled by the same compatible.
> > >  - Acc (accelerator) is another one.
> > >=20
> > > Each instance vary in the number and types of reset domains.
> > > Instances with single domain expect a single cell, others two.
> > >=20
> > > Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> > > ---
> > >  MAINTAINERS                |   1 +
> > >  drivers/reset/Kconfig      |  14 ++
> > >  drivers/reset/Makefile     |   1 +
> > >  drivers/reset/reset-eyeq.c | 563 +++++++++++++++++++++++++++++++++++=
++++++++++
> >=20
> > Should this be called reset-eyeq-olb or reset-eyeq5, in case a
> > different eyeq driver will have to be added in the future?
>=20
> What about keeping reset-eyeq for the simplicity of it and using
> reset-eyeq7 for a theoretical future driver that gets used by EyeQ7 and
> above? Or any other revision.
>=20
> Else it can be reset-eyeq5. OLB might be a concept that gets reused with
> different reset blocks inside (meaning reset-eyeq-olb wouldn't
> distinguish). You tell me if keeping *-eyeq is fine.

Either is fine by me. I just wanted to make sure this was given some
consideration after noticing the reset-eyeq5.c remnant in MAINTAINERS.

regards
Philipp

