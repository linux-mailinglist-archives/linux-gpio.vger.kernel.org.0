Return-Path: <linux-gpio+bounces-13100-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AE89D26A2
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 14:14:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF8C21F23090
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 13:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4CA91CCB31;
	Tue, 19 Nov 2024 13:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ps+uVD/+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ACF1CBEBB;
	Tue, 19 Nov 2024 13:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732021950; cv=none; b=GryFb532R4u+kooziEvft6eYvXCFNPkISIkw1p4Gz5boDRKmvCkpb6eprwtqUxydqRJlHTuFeBKs60iNH8jX70mlO/PlgPDnWSs/R+aOFmCORwmSR8MDDU2VjV6/IE3Sb0/2+2aj4nzWbHwbSJCfu7n98mjkk2SIOymXoQro5Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732021950; c=relaxed/simple;
	bh=26iJ7jE78hzbeXxIg5NyK0lcpo0yHtsHxP/H6F/2BwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOJ2ErYPih28hTvj7F4XgrrSjXJvxQMXR+0fldSOpxH+KgRaM/D6l+8xmIcu6POZ5D4GKQ4ujI9/NC8fXuUhRb1oZ21Vs+Tyn0AUTdWT20msWhjGMB9If62yaZf15If4xbilrujAVQSj5Jf0yvd1fMinMSgdtxhaHkN7nO638xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ps+uVD/+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1ABC4CECF;
	Tue, 19 Nov 2024 13:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732021950;
	bh=26iJ7jE78hzbeXxIg5NyK0lcpo0yHtsHxP/H6F/2BwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ps+uVD/+GOPfygU1hJYy3tD5S1APowDUjJqo/p9zABIUSdwNLCQjTTIbt80W1xxHS
	 2JaHdZH52qD+52q6E2z9JaNb92w5T1CoZ2MViCXNXbiSBcL9+lUTYXqIp24KngQzGp
	 aGvwNKBhupQe3ZXGYiLHDN8gFR9DVCDHiSy0Xgh621wSUUugE1KZIo8kJNarVH96Mr
	 gPUcQxd45bO03tgAg0beRVlRxt4XvGk+axS0JHr2frC1fOit0h2fR/PMJA4SM8etj3
	 49wTJ3LdgnCVv4D2hYjO+Lf9NWujujk71OKyBU6U7Oj0e1g+wuJM8YMIM5LR/TTFVX
	 KSXe9iRo8DvCg==
Date: Tue, 19 Nov 2024 14:12:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Enric Balletbo <eballetb@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	imx@lists.linux.dev
Subject: Re: [PATCH v6 1/7] dt-bindings: mfd: add support for the NXP SIUL2
 module
Message-ID: <gqzwfe6wucn57plnte3g7c5xiri45mnatieviewgchkpeh562t@gha4sfrutjuh>
References: <20241113101124.1279648-1-andrei.stefanescu@oss.nxp.com>
 <20241113101124.1279648-2-andrei.stefanescu@oss.nxp.com>
 <18e7a32c-a8de-4e5a-80aa-248b2090e346@kernel.org>
 <72b3b5e7-739f-4f03-ac40-a9cbd37972b8@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <72b3b5e7-739f-4f03-ac40-a9cbd37972b8@oss.nxp.com>

On Tue, Nov 19, 2024 at 11:44:23AM +0200, Andrei Stefanescu wrote:
> Hi Krzysztof,
> 
> Thank you for your review!
> 
> On 19/11/2024 11:21, Krzysztof Kozlowski wrote:
> > On 13/11/2024 11:10, Andrei Stefanescu wrote:
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - nxp,s32g2-siul2
> >> +      - nxp,s32g3-siul2
> > 
> > Not much improved. See other NXP bindings how they do this.
> > 
> 
> Do you mean to have the "nxp,s32g3-siul2" compatible fall back to the g2 one?

Yes, compatibility between devices means fallback.

> 
> >> +
> >> +  gpio-reserved-ranges:
> >> +    maxItems: 2
> > 
> > That's odd to always require two reserved ranges. Does this mean all
> > devices have exactly the same reserved GPIOs? Then the driver should not
> > export them.
> 
> Yes, the driver exports GPIOs from two hardware modules because they are
> tightly coupled. I export two gpio-ranges, each one corresponding to a
> hardware module. If I were to export more gpio-ranges, thus avoiding
> gpio-reserved-ranges, it would be hard to know to which hardware module
> a gpio-range belongs. I would like to keep the current implementation
> regarding this problem. Would that be ok?

I don't understand why this is needed then. If you always export same
set of GPIOs, why do you export something which is unusable/reserved?

Best regards,
Krzysztof


